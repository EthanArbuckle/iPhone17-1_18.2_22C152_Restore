@interface NSData(UIKitAdditions)
- (id)_uiSaveContentsToTemporaryFile;
@end

@implementation NSData(UIKitAdditions)

- (id)_uiSaveContentsToTemporaryFile
{
  int v7 = -1;
  v2 = _UITemporaryFileWithUniqueName(@"uidata", 0, &v7);
  int v3 = v7;
  if (v7 == -1)
  {
    id v5 = 0;
  }
  else
  {
    id v4 = a1;
    write(v3, (const void *)[v4 bytes], objc_msgSend(v4, "length"));
    close(v7);
    id v5 = v2;
  }

  return v5;
}

@end