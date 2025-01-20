@interface NSFileManager(WebNSFileManagerExtras)
- (uint64_t)_webkit_createTemporaryDirectoryWithTemplatePrefix:()WebNSFileManagerExtras;
- (void)_webkit_pathWithUniqueFilenameForPath:()WebNSFileManagerExtras;
@end

@implementation NSFileManager(WebNSFileManagerExtras)

- (void)_webkit_pathWithUniqueFilenameForPath:()WebNSFileManagerExtras
{
  v3 = objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", filenameByFixingIllegalCharacters((NSString *)objc_msgSend(a3, "lastPathComponent")));
  if (lstat((const char *)[v3 fileSystemRepresentation], &v11)) {
    return v3;
  }
  v6 = (void *)[v3 lastPathComponent];
  uint64_t v7 = [v6 rangeOfString:@"."];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    uint64_t v9 = v7;
    v8 = (void *)[v6 substringFromIndex:v7 + 1];
    v3 = objc_msgSend((id)objc_msgSend(v3, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend(v6, "substringToIndex:", v9));
  }
  uint64_t v10 = 1;
  do
  {
    v4 = (void *)[NSString stringWithFormat:@"%@-%d", v3, v10];
    if ([v8 length]) {
      v4 = (void *)[v4 stringByAppendingPathExtension:v8];
    }
    uint64_t v10 = (v10 + 1);
  }
  while (!lstat((const char *)[v4 fileSystemRepresentation], &v11));
  return v4;
}

- (uint64_t)_webkit_createTemporaryDirectoryWithTemplatePrefix:()WebNSFileManagerExtras
{
  return MEMORY[0x1F40EB288](a3);
}

@end