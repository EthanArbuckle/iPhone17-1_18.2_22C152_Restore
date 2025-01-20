@interface NSFileManager(TSPersistence)
- (uint64_t)setDefaultFileProtectionAtDocumentURL:()TSPersistence error:;
- (uint64_t)setDefaultFileProtectionForDirectoryPath:()TSPersistence error:;
- (void)assertDefaultFileProtectionAtDocumentURL:()TSPersistence;
@end

@implementation NSFileManager(TSPersistence)

- (uint64_t)setDefaultFileProtectionAtDocumentURL:()TSPersistence error:
{
  return [a1 changeFileProtectionAtURL:a3 fromProtection:0 toProtection:*MEMORY[0x263F08080] recursively:1 error:a4];
}

- (uint64_t)setDefaultFileProtectionForDirectoryPath:()TSPersistence error:
{
  v12[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F08850];
  id v6 = a3;
  v7 = [v5 defaultManager];
  uint64_t v11 = *MEMORY[0x263F080A8];
  v12[0] = *MEMORY[0x263F08080];
  v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v9 = [v7 setAttributes:v8 ofItemAtPath:v6 error:a4];

  return v9;
}

- (void)assertDefaultFileProtectionAtDocumentURL:()TSPersistence
{
  id v7 = a3;
  if ((objc_msgSend(a1, "hasAtLeastFileProtection:atURL:recursively:", *MEMORY[0x263F08098]) & 1) == 0)
  {
    v4 = [MEMORY[0x263F7C7F0] currentHandler];
    v5 = [NSString stringWithUTF8String:"-[NSFileManager(TSPersistence) assertDefaultFileProtectionAtDocumentURL:]"];
    id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/NSFileManager_TSPersistence.m"];
    [v4 handleFailureInFunction:v5, v6, 30, @"Document does not have default file protection set: %@", v7 file lineNumber description];
  }
}

@end