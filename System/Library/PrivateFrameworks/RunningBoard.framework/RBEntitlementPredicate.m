@interface RBEntitlementPredicate
+ (id)predicateForObject:(id)a3 forDomain:(id)a4 attribute:(id)a5 errors:(id)a6;
- (BOOL)matchesEntitlements:(id)a3;
- (id)allEntitlements;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)count;
@end

@implementation RBEntitlementPredicate

+ (id)predicateForObject:(id)a3 forDomain:(id)a4 attribute:(id)a5 errors:(id)a6
{
  v21[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[RBAllEntitlementPredicate alloc] initWithDictionary:v9 forDomain:v10 attribute:v11 errors:v12];
LABEL_6:
      v14 = v13;
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[RBAnyEntitlementPredicate alloc] initWithArray:v9 forDomain:v10 attribute:v11 errors:v12];
      goto LABEL_6;
    }
    if (v12)
    {
      v15 = (void *)MEMORY[0x263F087E8];
      v16 = [NSString stringWithFormat:@"Domain %@ attribute %@ contains bundle properties of wrong type: %@", v10, v11, v9, *MEMORY[0x263F08338]];
      v21[0] = v16;
      v17 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      v18 = [v15 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:2 userInfo:v17];

      [v12 addObject:v18];
    }
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (unint64_t)count
{
  return self->_count;
}

- (BOOL)matchesEntitlements:(id)a3
{
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_2_2(v3);
  return 0;
}

- (id)allEntitlements
{
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_2_2(v2);
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_2_2(v3);
  return 0;
}

@end