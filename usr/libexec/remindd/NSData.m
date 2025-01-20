@interface NSData
- (id)ic_stringValue;
@end

@implementation NSData

- (id)ic_stringValue
{
  id v2 = [objc_alloc((Class)NSString) initWithData:self encoding:4];

  return v2;
}

@end