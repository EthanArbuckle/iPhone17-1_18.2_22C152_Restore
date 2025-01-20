@interface PLXPCPhotoLibraryStoreContainer
+ (id)newContainerWithPathManager:(id)a3 connectionAuthorization:(id)a4;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (NSXPCStoreServer)server;
- (PLXPCPhotoLibraryStoreContainer)initWithServer:(id)a3 listener:(id)a4;
@end

@implementation PLXPCPhotoLibraryStoreContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

- (NSXPCStoreServer)server
{
  return (NSXPCStoreServer *)objc_getProperty(self, a2, 8, 1);
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

- (PLXPCPhotoLibraryStoreContainer)initWithServer:(id)a3 listener:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLXPCPhotoLibraryStoreContainer;
  v9 = [(PLXPCPhotoLibraryStoreContainer *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_server, a3);
    objc_storeStrong((id *)&v10->_listener, a4);
    v11 = v10;
  }

  return v10;
}

+ (id)newContainerWithPathManager:(id)a3 connectionAuthorization:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PLXPCPhotoLibraryStoreContainer.m", 36, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
  }
  v9 = [MEMORY[0x1E4F29290] anonymousListener];
  v10 = +[PLManagedObjectContext managedObjectModelURL];
  id v21 = 0;
  id v22 = 0;
  v11 = [v7 photosDatabasePath];
  +[PLManagedObjectContext getPersistentStoreURL:&v22 options:&v21 forDatabasePath:v11];
  id v12 = v22;
  id v13 = v21;

  v14 = [MEMORY[0x1E4F1CA60] dictionary];
  [v14 setValue:v9 forKey:*MEMORY[0x1E4F1BFC0]];
  v23[0] = @"com.apple.private.assetsd.xpcstore_restricted.access";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [v14 setValue:v15 forKey:*MEMORY[0x1E4F1BFD0]];

  if (v13) {
    [v14 addEntriesFromDictionary:v13];
  }
  v16 = [[PLXPCPhotoLibraryStoreServerRequestHandlingPolicy alloc] initWithConnectionAuthorization:v8];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C1B8]) initForStoreWithURL:v12 usingModelAtURL:v10 options:v14 policy:v16];
  [v9 setDelegate:v17];
  [v17 startListening];
  v18 = [[PLXPCPhotoLibraryStoreContainer alloc] initWithServer:v17 listener:v9];

  return v18;
}

@end