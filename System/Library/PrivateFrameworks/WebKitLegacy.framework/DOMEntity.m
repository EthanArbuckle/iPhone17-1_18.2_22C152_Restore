@interface DOMEntity
- (NSString)notationName;
- (NSString)publicId;
- (NSString)systemId;
@end

@implementation DOMEntity

- (NSString)publicId
{
  return 0;
}

- (NSString)systemId
{
  return 0;
}

- (NSString)notationName
{
  return 0;
}

@end