@interface THSimpleCFIComponent
- (BOOL)isAcceptableLeaf;
- (id)cfiString;
@end

@implementation THSimpleCFIComponent

- (id)cfiString
{
  return @"???";
}

- (BOOL)isAcceptableLeaf
{
  return 0;
}

@end