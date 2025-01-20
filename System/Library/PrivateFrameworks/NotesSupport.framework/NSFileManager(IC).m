@interface NSFileManager(IC)
- (id)ic_temporaryDirectoryAppropriateForDestination:()IC;
- (id)ic_temporaryDirectoryPathAppropriateForDestinationPath:()IC;
@end

@implementation NSFileManager(IC)

- (id)ic_temporaryDirectoryPathAppropriateForDestinationPath:()IC
{
  v2 = objc_msgSend(NSURL, "fileURLWithPath:");
  if (v2)
  {
    v3 = objc_msgSend(a1, "ic_temporaryDirectoryAppropriateForDestination:", v2);
    v4 = [v3 path];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)ic_temporaryDirectoryAppropriateForDestination:()IC
{
  id v4 = a3;
  id v9 = 0;
  v5 = [a1 URLForDirectory:99 inDomain:1 appropriateForURL:v4 create:1 error:&v9];
  id v6 = v9;
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NSFileManager(IC) ic_temporaryDirectoryAppropriateForDestination:]((uint64_t)v4, v7);
    }
  }
  return v5;
}

- (void)ic_temporaryDirectoryAppropriateForDestination:()IC .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20C263000, a2, OS_LOG_TYPE_ERROR, "Error creating temporary directory for destination: %@", (uint8_t *)&v2, 0xCu);
}

@end