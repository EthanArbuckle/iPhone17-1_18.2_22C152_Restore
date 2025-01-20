@interface NSFileManager
- (BOOL)be_doesFolderAtURL:(id)a3 containFileAtURL:(id)a4;
@end

@implementation NSFileManager

- (BOOL)be_doesFolderAtURL:(id)a3 containFileAtURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isFileURL] && objc_msgSend(v5, "isFileURL"))
  {
    v7 = [v6 path];
    v8 = [v7 stringByStandardizingPath];

    v9 = [v8 stringByResolvingSymlinksInPath];

    v10 = [v5 path];
    v11 = [v10 stringByStandardizingPath];

    v12 = [v11 stringByResolvingSymlinksInPath];

    unsigned __int8 v13 = [v9 hasPrefix:v12];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

@end