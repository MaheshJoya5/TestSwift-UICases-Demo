//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by MTPC-363 on 28/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("userName") var nameUser = "Good and testing with it" // this is app storage latest
    @State private var showingAddUser = true
    var body: some View{
        Text(nameUser)
        Button("Log in") {
            nameUser = "@Hello"
            showingAddUser = true
        }
        .sheet(isPresented: $showingAddUser) {
            // show the add user view
            AddView(isPresented: $showingAddUser)
                .background(.red)
        }

    }
}


struct AddView: View {
    @Binding var isPresented: Bool

    var body: some View {
        Button("Dismiss") {
            isPresented = false
        }
    }
}
//
//struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
//
//    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
//}
//


//struct ContentView: View {
//    @State private var site = "https://"
//    @State private var sourceCode = ""
//    
//    var body: some View {
//        VStack {
//            HStack {
//                TextField("Website address", text: $site)
//                    .textFieldStyle(.roundedBorder)
//                Button("Go") {
//                    Task {
//                        await fetchSource()
//                    }
//                }
//            }
//            .padding()
//            
//            ScrollView {
//                Text(sourceCode)
//            }
//        }
//    }
//    
//    func fetchSource() async {
//        do {
//            let url = URL(string: site)!
//            let (data, _) = try await URLSession.shared.data(from: url)
//            sourceCode = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
//        } catch {
//            sourceCode = "Failed to fetch \(site)"
//        }
//    }
//}


// First, a URLSession instance that never uses caches
//extension URLSession {
//    static let noCacheSession: URLSession = {
//        let config = URLSessionConfiguration.default
//        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
//        return URLSession(configuration: config)
//    }()
//}
//
//// Now our struct that will fetch and decode a URL every
//// time we read its `contents` property
//struct RemoteFile<T: Decodable> {
//    let url: URL
//    let type: T.Type
//
//    var contents: T {
//        get async throws {
//            let (data, _) = try await URLSession.noCacheSession.data(from: url)
//            return try JSONDecoder().decode(T.self, from: data)
//        }
//    }
//}
//
//struct Message: Decodable, Identifiable {
//    let id: Int
//    let user: String
//    let text: String
//}
//
//struct ContentView: View {
//    let source = RemoteFile(url: URL(string: "https://hws.dev/inbox.json")!, type: [Message].self)
//    @State private var messages = [Message]()
//
//    var body: some View {
//        NavigationView {
//            List(messages) { message in
//                VStack(alignment: .leading) {
//                    Text(message.user)
//                        .font(.headline)
//                    Text(message.text)
//                }
//            }
//            .navigationTitle("Inbox")
//            .toolbar {
//                Button(action: refresh) {
//                    Label("Refresh", systemImage: "arrow.clockwise")
//                }
//            }
//            .onAppear(perform: refresh)
//        }
//    }
//
//    func refresh() {
//        Task {
//            do {
//                // Access the property asynchronously
//                messages = try await source.contents
//            } catch {
//                print("Message update failed.")
//            }
//        }
//    }
//}

//struct Message: Decodable, Identifiable {
//    let id: Int
//    let from: String
//    let text: String
//}
//
//struct ContentView: View {
//    @State private var messages = [Message]()
//
//    var body: some View {
//        NavigationView {
//            List(messages) { message in
//                VStack(alignment: .leading) {
//                    Text(message.from)
//                        .font(.headline)
//
//                    Text(message.text)
//                }
//            }
//            .navigationTitle("Inbox")
//            .task {
//                await loadMessages()
//            }
//        }
//    }
//
//    func loadMessages() async {
//        do {
//            let url = URL(string: "https://hws.dev/messages.json")!
//            let (data, _) = try await URLSession.shared.data(from: url)
//            messages = try JSONDecoder().decode([Message].self, from: data)
//        } catch {
//            messages = [
//                Message(id: 0, from: "Failed to load inbox.", text: "Please try again later.")
//            ]
//        }
//    }
//}

#Preview {
    ContentView()
}
