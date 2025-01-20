@interface RDOverwritingFileManagerDelegate
- (BOOL)fileManager:(id)a3 shouldCopyItemAtURL:(id)a4 toURL:(id)a5;
- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 copyingItemAtURL:(id)a5 toURL:(id)a6;
@end

@implementation RDOverwritingFileManagerDelegate

- (BOOL)fileManager:(id)a3 shouldCopyItemAtURL:(id)a4 toURL:(id)a5
{
  char v8 = 0;
  if (objc_msgSend(a3, "fileExistsAtPath:isDirectory:", objc_msgSend(a5, "path", a3, a4), &v8) && !v8) {
    [a3 removeItemAtURL:a5 error:0];
  }
  return 1;
}

- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 copyingItemAtURL:(id)a5 toURL:(id)a6
{
  char v9 = 0;
  unsigned int v7 = [a3 fileExistsAtPath:[a6 path:a3, a4, a5] isDirectory:&v9];
  BOOL result = 0;
  if (v7) {
    return [a4 code] == (id)516 && v9 != 0;
  }
  return result;
}

@end