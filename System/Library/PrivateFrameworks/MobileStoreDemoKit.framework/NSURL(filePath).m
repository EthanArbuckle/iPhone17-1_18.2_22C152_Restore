@interface NSURL(filePath)
+ (id)fileURLWithString:()filePath;
@end

@implementation NSURL(filePath)

+ (id)fileURLWithString:()filePath
{
  id v3 = a3;
  int v4 = [v3 hasPrefix:@"file://"];
  v5 = NSURL;
  if (v4)
  {
    v6 = [v3 substringFromIndex:objc_msgSend(@"file://", "length")];
    v7 = [v5 fileURLWithPath:v6];
  }
  else
  {
    v7 = [NSURL fileURLWithPath:v3];
  }

  return v7;
}

@end