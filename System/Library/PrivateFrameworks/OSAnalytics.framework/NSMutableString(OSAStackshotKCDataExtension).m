@interface NSMutableString(OSAStackshotKCDataExtension)
- (void)appendPortLabelInfo:()OSAStackshotKCDataExtension portlabels:;
@end

@implementation NSMutableString(OSAStackshotKCDataExtension)

- (void)appendPortLabelInfo:()OSAStackshotKCDataExtension portlabels:
{
  id v10 = a4;
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a3);
  v7 = @"<port label truncated>";
  if (a3 && v10)
  {
    if (a3 != -1)
    {
      v8 = [v10 objectForKeyedSubscript:v6];
      v9 = v8;
      if (v8) {
        v7 = v8;
      }
    }
    [a1 appendFormat:@" (%@)", v7];
  }
}

@end