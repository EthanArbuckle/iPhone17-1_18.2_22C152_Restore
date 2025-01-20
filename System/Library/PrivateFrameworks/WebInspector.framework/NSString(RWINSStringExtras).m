@interface NSString(RWINSStringExtras)
- (id)rwi_macAddressForBonjourServiceName;
@end

@implementation NSString(RWINSStringExtras)

- (id)rwi_macAddressForBonjourServiceName
{
  v1 = [a1 componentsSeparatedByString:@"@"];
  if ([v1 count])
  {
    v2 = [v1 objectAtIndexedSubscript:0];
    int v3 = [v2 containsString:@":"];

    v4 = 0;
    if (v3)
    {
      v4 = [v1 objectAtIndexedSubscript:0];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end