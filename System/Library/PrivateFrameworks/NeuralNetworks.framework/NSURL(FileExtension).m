@interface NSURL(FileExtension)
- (BOOL)hasPathExtension:()FileExtension;
@end

@implementation NSURL(FileExtension)

- (BOOL)hasPathExtension:()FileExtension
{
  id v4 = a3;
  v5 = [a1 pathExtension];
  BOOL v6 = [v5 caseInsensitiveCompare:v4] == 0;

  return v6;
}

@end