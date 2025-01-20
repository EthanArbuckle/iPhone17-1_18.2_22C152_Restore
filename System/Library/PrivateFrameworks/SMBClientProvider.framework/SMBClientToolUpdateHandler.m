@interface SMBClientToolUpdateHandler
+ (id)newForConnection:(id)a3;
- (NSXPCConnection)ourConnection;
- (id)initForConnection:(id)a3;
- (void)deletedItem:(id)a3 name:(id)a4 how:(int)a5 interestedItem:(id)a6;
- (void)deletedName:(id)a3 item:(id)a4 how:(int)a5 interestedItem:(id)a6;
- (void)historyResetItem:(id)a3 interestedItem:(id)a4;
- (void)historyResetName:(id)a3 interestedItem:(id)a4;
- (void)renamedItem:(id)a3 named:(id)a4 fromDirectory:(id)a5 intoDirectory:(id)a6 newName:(id)a7 atopItem:(id)a8;
- (void)setOurConnection:(id)a3;
- (void)updatedItem:(id)a3 name:(id)a4 interestedItem:(id)a5;
- (void)updatedName:(id)a3 interestedItem:(id)a4;
- (void)updatesDoneFor:(id)a3;
- (void)volumeWideDeletedName:(id)a3 interestedItem:(id)a4;
- (void)volumeWideUpdatedName:(id)a3 interestedItem:(id)a4;
@end

@implementation SMBClientToolUpdateHandler

- (id)initForConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SMBClientToolUpdateHandler;
  v6 = [(SMBClientToolUpdateHandler *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ourConnection, a3);
    puts("initForConnection: started up");
  }

  return v7;
}

+ (id)newForConnection:(id)a3
{
  id v3 = a3;
  id v4 = [[SMBClientToolUpdateHandler alloc] initForConnection:v3];

  return v4;
}

- (void)deletedItem:(id)a3 name:(id)a4 how:(int)a5 interestedItem:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  v12 = (const char *)[v9 UTF8String];
  id v13 = v10;
  v14 = (const char *)[v13 UTF8String];

  id v15 = v11;
  v16 = (const char *)[v15 UTF8String];

  printf("%s: item %s\tinterestedItem '%s'\tname '%s' how:%d\n", "-[SMBClientToolUpdateHandler deletedItem:name:how:interestedItem:]", v12, v14, v16, a5);
}

- (void)deletedName:(id)a3 item:(id)a4 how:(int)a5 interestedItem:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  v12 = (const char *)[v9 UTF8String];
  id v13 = v11;
  v14 = (const char *)[v13 UTF8String];

  id v15 = v10;
  v16 = (const char *)[v15 UTF8String];

  printf("%s: name %s\titem %s\tinterestedItem %s how:%d\n", "-[SMBClientToolUpdateHandler deletedName:item:how:interestedItem:]", v12, v14, v16, a5);
}

- (void)updatesDoneFor:(id)a3
{
  printf("All done with %s\n", (const char *)[a3 UTF8String]);
  [(id)qword_1000107A8 lock];
  dword_1000107B0 = 2;
  [(id)qword_1000107A8 unlock];
  id v3 = (void *)qword_1000107A8;
  [v3 signal];
}

- (void)historyResetItem:(id)a3 interestedItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (const char *)[v5 UTF8String];
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];

  printf("%s: item %s\tinterestedItem %s\n", "-[SMBClientToolUpdateHandler historyResetItem:interestedItem:]", v7, v9);
}

- (void)historyResetName:(id)a3 interestedItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (const char *)[v5 UTF8String];
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];

  printf("%s: path %s\tinterestedItem %s\n", "-[SMBClientToolUpdateHandler historyResetName:interestedItem:]", v7, v9);
}

- (void)renamedItem:(id)a3 named:(id)a4 fromDirectory:(id)a5 intoDirectory:(id)a6 newName:(id)a7 atopItem:(id)a8
{
  id v13 = a6;
  id v14 = a8;
  id v15 = a3;
  id v16 = a7;
  id v17 = a5;
  id v18 = a4;
  v19 = (const char *)[v15 UTF8String];
  id v20 = v18;
  v21 = (const char *)[v20 UTF8String];

  id v22 = v17;
  v23 = (const char *)[v22 UTF8String];

  if (v14) {
    v24 = (const char *)[v14 UTF8String];
  }
  else {
    v24 = "<no item>";
  }
  id v28 = v13;
  v25 = (const char *)[v28 UTF8String];
  id v26 = v16;
  v27 = (const char *)[v26 UTF8String];

  printf("LIUpdateRenameFrom:'%s' name '%s'\n\tfrom ID '%s' over ID '%s'\n\tto '%s' name '%s'\n", v19, v21, v23, v24, v25, v27);
}

- (void)updatedItem:(id)a3 name:(id)a4 interestedItem:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = (const char *)[v7 UTF8String];
  id v11 = v8;
  v12 = (const char *)[v11 UTF8String];

  id v13 = v9;
  id v14 = (const char *)[v13 UTF8String];

  printf("%s: item %s\tinterestedItem %s\tname '%s'\n", "-[SMBClientToolUpdateHandler updatedItem:name:interestedItem:]", v10, v12, v14);
}

- (void)updatedName:(id)a3 interestedItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (const char *)[v5 UTF8String];
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];

  printf("%s: name %s\tinterestedItem %s\n", "-[SMBClientToolUpdateHandler updatedName:interestedItem:]", v7, v9);
}

- (void)volumeWideDeletedName:(id)a3 interestedItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (const char *)[v5 UTF8String];
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];

  printf("%s: path %s\tinterestedItem %s\n", "-[SMBClientToolUpdateHandler volumeWideDeletedName:interestedItem:]", v7, v9);
}

- (void)volumeWideUpdatedName:(id)a3 interestedItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (const char *)[v5 UTF8String];
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];

  printf("%s: path %s\tinterestedItem %s\n", "-[SMBClientToolUpdateHandler volumeWideUpdatedName:interestedItem:]", v7, v9);
}

- (NSXPCConnection)ourConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOurConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end