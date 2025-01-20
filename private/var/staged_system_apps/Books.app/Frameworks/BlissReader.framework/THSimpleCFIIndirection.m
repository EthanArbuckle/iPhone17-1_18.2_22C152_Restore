@interface THSimpleCFIIndirection
+ (id)indirection;
- (id)cfiString;
@end

@implementation THSimpleCFIIndirection

+ (id)indirection
{
  v2 = objc_alloc_init(THSimpleCFIIndirection);

  return v2;
}

- (id)cfiString
{
  return @"!";
}

@end