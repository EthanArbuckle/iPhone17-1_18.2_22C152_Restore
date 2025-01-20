@interface NSFileManager
- (BOOL)isDirectoryPath:(id)a3;
@end

@implementation NSFileManager

- (BOOL)isDirectoryPath:(id)a3
{
  char v4 = 0;
  BOOL result = [+[NSFileManager defaultManager] fileExistsAtPath:a3 isDirectory:&v4];
  if (!v4) {
    return 0;
  }
  return result;
}

@end