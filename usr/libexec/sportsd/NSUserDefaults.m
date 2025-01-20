@interface NSUserDefaults
- (BOOL)filteringEnabled;
@end

@implementation NSUserDefaults

- (BOOL)filteringEnabled
{
  v2 = self;
  unsigned __int8 v3 = sub_100099A04();

  return v3 & 1;
}

@end