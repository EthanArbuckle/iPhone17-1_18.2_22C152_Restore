@interface NSValue(ML3NameOrderAdditions)
+ (id)valueWithML3NameOrder:()ML3NameOrderAdditions;
- (uint64_t)ML3NameOrderValue;
@end

@implementation NSValue(ML3NameOrderAdditions)

- (uint64_t)ML3NameOrderValue
{
  id v1 = a1;
  if (strcmp((const char *)[v1 objCType], "{?=qq}")) {
    return 0;
  }
  v3[0] = 0;
  v3[1] = 0;
  [v1 getValue:v3];
  return v3[0];
}

+ (id)valueWithML3NameOrder:()ML3NameOrderAdditions
{
  v6[0] = a3;
  v6[1] = a4;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBytes:v6 objCType:"{?=qq}"];

  return v4;
}

@end