@interface MFAttachmentUtilities
+ (id)_temporaryDirectoryUniqueURL;
+ (id)mimeTypeForFileName:(id)a3;
+ (id)temporaryDirectory;
+ (id)temporaryFileURLWithExtension:(id)a3;
+ (id)temporaryFileURLWithFileName:(id)a3;
@end

@implementation MFAttachmentUtilities

+ (id)temporaryDirectory
{
  v2 = NSTemporaryDirectory();
  return [(NSString *)v2 stringByAppendingPathComponent:@"/MobileMailAttachments"];
}

+ (id)_temporaryDirectoryUniqueURL
{
  uint64_t v7 = 0;
  v3 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "temporaryDirectory"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "globallyUniqueString"));
  if (!v4) {
    return 0;
  }
  v5 = (void *)[MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:1];
  if (!objc_msgSend((id)objc_msgSend(v5, "scheme"), "hasPrefix:", @"file")) {
    return 0;
  }
  [v3 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v7];
  return v5;
}

+ (id)temporaryFileURLWithExtension:(id)a3
{
  v5 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  v6 = (void *)[a1 _temporaryDirectoryUniqueURL];
  uint64_t v7 = (void *)[v6 path];
  v8 = (void *)[v7 stringByAppendingPathComponent:objc_msgSend(NSString, "stringWithFormat:", @"XXXXX.%@", a3)];
  if (!v6) {
    return 0;
  }
  v9 = strdup((const char *)[v8 fileSystemRepresentation]);
  if (mkstemps(v9, [a3 length] + 1) != -1)
  {
    uint64_t v10 = [NSString stringWithUTF8String:v9];
    [v5 createFileAtPath:v10 contents:0 attributes:0];
    id v11 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v10 isDirectory:0];
    if (!v9) {
      return v11;
    }
    goto LABEL_7;
  }
  objc_msgSend(v5, "removeItemAtPath:error:", objc_msgSend(v6, "path"), 0);
  id v11 = 0;
  if (v9) {
LABEL_7:
  }
    free(v9);
  return v11;
}

+ (id)temporaryFileURLWithFileName:(id)a3
{
  v5 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  v6 = (void *)[a1 _temporaryDirectoryUniqueURL];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", a3);
  if (![v5 createFileAtPath:v8 contents:0 attributes:0])
  {
    objc_msgSend(v5, "removeItemAtPath:error:", objc_msgSend(v7, "path"), 0);
    return 0;
  }
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v8 isDirectory:0];
  return v9;
}

+ (id)mimeTypeForFileName:(id)a3
{
  return (id)objc_msgSend(NSString, "mf_stringForMimeTypeFromFileName:", a3);
}

@end