@interface RBDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (id)_init;
- (id)allEntitlements;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation RBDomainRestriction

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  v31[11] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 objectForKey:@"Class"];
    if (v6)
    {
      v30[0] = @"OriginatorEntitlement";
      v31[0] = objc_opt_class();
      v30[1] = @"OriginatorExtensionPoint";
      v31[1] = objc_opt_class();
      v30[2] = @"TargetEntitlement";
      v31[2] = objc_opt_class();
      v30[3] = @"TargetExtensionPoint";
      v31[3] = objc_opt_class();
      v30[4] = @"CompoundAny";
      v31[4] = objc_opt_class();
      v30[5] = @"CompoundAll";
      v31[5] = objc_opt_class();
      v30[6] = @"CompoundNone";
      v31[6] = objc_opt_class();
      v30[7] = @"TargetProperty";
      v31[7] = objc_opt_class();
      v30[8] = @"TargetsSelf";
      v31[8] = objc_opt_class();
      v30[9] = @"TargetsHosted";
      v31[9] = objc_opt_class();
      v30[10] = @"LessThanCondition";
      v31[10] = objc_opt_class();
      id v7 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:11];
      v8 = (void *)[v7 objectForKey:v6];
      if (v8)
      {
        v9 = [v8 domainRestrictionForDictionary:v5 withError:a4];
      }
      else
      {
        if (a4)
        {
          v18 = (void *)MEMORY[0x263F087E8];
          v19 = [NSString stringWithFormat:@"RBDomainRestriction invalid class name: %@", v6, *MEMORY[0x263F08338]];
          v25 = v19;
          v20 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
          v21 = [v18 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:3 userInfo:v20];

          id v22 = v21;
          *a4 = v22;
        }
        v9 = 0;
      }
    }
    else
    {
      if (!a4)
      {
        v9 = 0;
        goto LABEL_14;
      }
      v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = *MEMORY[0x263F08338];
      v15 = [NSString stringWithFormat:@"RBDomainRestriction doesn't specify class: %@", v5];
      v27 = v15;
      v16 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      v17 = [v14 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v16];

      id v7 = v17;
      v9 = 0;
      *a4 = v7;
    }
  }
  else
  {
    if (!a4)
    {
      v9 = 0;
      goto LABEL_15;
    }
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08338];
    v11 = [NSString stringWithFormat:@"RBDomainRestriction malformed: %@", v5];
    v29 = v11;
    v12 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v13 = [v10 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:3 userInfo:v12];

    id v6 = v13;
    v9 = 0;
    *a4 = v6;
  }
LABEL_14:

LABEL_15:
  return v9;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)RBDomainRestriction;
  return [(RBDomainRestriction *)&v3 init];
}

- (id)description
{
  id v2 = [NSString alloc];
  objc_super v3 = [(id)objc_opt_class() description];
  v4 = (void *)[v2 initWithFormat:@"<%@>", v3];

  return v4;
}

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  uint64_t v4 = objc_opt_class();
  OUTLINED_FUNCTION_2_2(v4);
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