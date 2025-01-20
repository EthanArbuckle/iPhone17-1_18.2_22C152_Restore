@interface NSString(TLIdentifiableAdditions)
- (uint64_t)tl_isEqualToIdentifiable:()TLIdentifiableAdditions;
@end

@implementation NSString(TLIdentifiableAdditions)

- (uint64_t)tl_isEqualToIdentifiable:()TLIdentifiableAdditions
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = [a1 isEqual:v4];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

@end