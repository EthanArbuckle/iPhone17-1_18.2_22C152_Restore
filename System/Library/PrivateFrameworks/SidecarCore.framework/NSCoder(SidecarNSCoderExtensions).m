@interface NSCoder(SidecarNSCoderExtensions)
- (id)decodeObjectOfClass:()SidecarNSCoderExtensions;
@end

@implementation NSCoder(SidecarNSCoderExtensions)

- (id)decodeObjectOfClass:()SidecarNSCoderExtensions
{
  v1 = [a1 decodeObject];
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

@end