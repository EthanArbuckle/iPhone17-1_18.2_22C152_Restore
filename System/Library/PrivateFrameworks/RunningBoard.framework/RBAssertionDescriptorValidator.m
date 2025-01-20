@interface RBAssertionDescriptorValidator
+ (BOOL)checkConflictingAttributes:(id)a3 error:(id *)a4;
- (BOOL)isAssertionValidForContext:(id)a3 error:(id *)a4;
- (id)_errorWithDescription:(uint64_t)a1;
- (id)_flattenedAttributesFromAttribute:(void *)a3 context:;
- (id)_flattenedAttributesFromContext:(void *)a1;
@end

@implementation RBAssertionDescriptorValidator

- (id)_flattenedAttributesFromAttribute:(void *)a3 context:
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  v17 = v5;
  if (a1)
  {
    v8 = [v6 domainAttributeManager];
    a1 = [MEMORY[0x263EFF9C0] set];
    v9 = [MEMORY[0x263EFF9C0] set];
    [v9 addObject:v5];
    while ([v9 count])
    {
      v10 = [v9 anyObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        v12 = [v11 domain];
        v13 = [v11 name];

        id v14 = [v8 attributesForDomain:v12 andName:v13 context:v7 withError:0];

        [v9 addObjectsFromArray:v14];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [a1 addObject:v10];
          goto LABEL_9;
        }
        id v14 = v10;
        v15 = [v14 attributes];
        [v9 addObjectsFromArray:v15];

        [a1 addObject:v14];
      }

LABEL_9:
      [v9 removeObject:v10];
    }
  }

  return a1;
}

- (id)_flattenedAttributesFromContext:(void *)a1
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = [v3 assertionDescriptor];
    id v6 = [MEMORY[0x263EFF9C0] set];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = objc_msgSend(v5, "attributes", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = -[RBAssertionDescriptorValidator _flattenedAttributesFromAttribute:context:](a1, *(void **)(*((void *)&v14 + 1) + 8 * i), v4);
          [v6 unionSet:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isAssertionValidForContext:(id)a3 error:(id *)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    v41 = [MEMORY[0x263F08690] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"RBAssertionDescriptorValidator.m", 52, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  uint64_t v8 = [v7 assertionDescriptor];
  uint64_t v9 = [v7 originatorEntitlements];
  uint64_t v10 = (void *)v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_5;
    }
  }
  else
  {
    v42 = [MEMORY[0x263F08690] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"RBAssertionDescriptorValidator.m", 57, @"Invalid parameter not satisfying: %@", @"assertionDescriptor" object file lineNumber description];

    if (v10) {
      goto LABEL_5;
    }
  }
  v43 = [MEMORY[0x263F08690] currentHandler];
  [v43 handleFailureInMethod:a2, self, @"RBAssertionDescriptorValidator.m", 58, @"Invalid parameter not satisfying: %@", @"originatorEntitlements" object file lineNumber description];

LABEL_5:
  id v11 = [v7 bundlePropertiesManager];

  if (!v11)
  {
    v44 = [MEMORY[0x263F08690] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"RBAssertionDescriptorValidator.m", 59, @"Invalid parameter not satisfying: %@", @"[context bundlePropertiesManager]" object file lineNumber description];
  }
  v12 = [v7 domainAttributeManager];

  if (!v12)
  {
    v45 = [MEMORY[0x263F08690] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"RBAssertionDescriptorValidator.m", 60, @"Invalid parameter not satisfying: %@", @"[context domainAttributeManager]" object file lineNumber description];
  }
  v13 = [v7 entitlementManager];

  if (!v13)
  {
    v46 = [MEMORY[0x263F08690] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"RBAssertionDescriptorValidator.m", 61, @"Invalid parameter not satisfying: %@", @"[context entitlementManager]" object file lineNumber description];
  }
  [v7 setAssertionDescriptionValidator:self];
  long long v14 = [v8 attributes];
  if ([v14 count])
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v52 = v14;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id obj = v15;
      SEL v48 = a2;
      v49 = self;
      v50 = a4;
      v51 = v8;
      char v18 = 0;
      uint64_t v19 = *(void *)v56;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v56 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          id v54 = 0;
          id v23 = v7;
          char v24 = [v21 isValidForContext:v7 withError:&v54];
          id v25 = v54;
          v26 = v25;
          if ((v24 & 1) == 0)
          {
            if (!v25)
            {
              v47 = [MEMORY[0x263F08690] currentHandler];
              [v47 handleFailureInMethod:v48, v49, @"RBAssertionDescriptorValidator.m", 86, @"attribute failed to return error for validation: %@", v21 object file lineNumber description];
            }
            uint64_t v8 = v51;
            if (v50) {
              id *v50 = v26;
            }

            BOOL v27 = 0;
            id v7 = v23;
            goto LABEL_39;
          }
          v18 |= isKindOfClass;

          id v7 = v23;
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
        if (v17) {
          continue;
        }
        break;
      }

      uint64_t v8 = v51;
      self = v49;
      a4 = v50;
      if (v18) {
        goto LABEL_38;
      }
    }
    else
    {
    }
    v28 = [v8 target];
    uint64_t v29 = [v28 processIdentity];
    if (v29)
    {
      v30 = (void *)v29;
      v31 = [v7 acquisitionContext];
      if (([v31 allowAbstractTarget] & 1) == 0)
      {
        v32 = a4;
        id v33 = v7;
        v34 = [v8 target];
        v35 = [v34 processIdentity];
        if (!v35
          && ([v10 hasEntitlementDomain:2] & 1) == 0
          && ([v10 hasEntitlementDomain:4] & 1) == 0)
        {
          char v38 = [v10 hasEntitlement:@"com.apple.runningboard.targetidentities"];
          v39 = v34;
          char v40 = v38;

          id v7 = v33;
          a4 = v32;
          if ((v40 & 1) == 0)
          {
            if (v32)
            {
              -[RBAssertionDescriptorValidator _errorWithDescription:]((uint64_t)self, @"Client is not entitled to use identities as assertion targets");
              BOOL v27 = 0;
              id *v32 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              BOOL v27 = 0;
            }
            goto LABEL_39;
          }
LABEL_38:
          v36 = -[RBAssertionDescriptorValidator _flattenedAttributesFromContext:](self, v7);
          BOOL v27 = +[RBAssertionDescriptorValidator checkConflictingAttributes:v36 error:a4];

LABEL_39:
          long long v14 = v52;
          goto LABEL_40;
        }

        id v7 = v33;
        a4 = v32;
      }
    }
    goto LABEL_38;
  }
  if (a4)
  {
    -[RBAssertionDescriptorValidator _errorWithDescription:]((uint64_t)self, @"Cannot acquire an assertion with no attributes");
    BOOL v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v27 = 0;
  }
LABEL_40:

  return v27;
}

+ (BOOL)checkConflictingAttributes:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = v5;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              if (v10 != *(void **)(*((void *)&v18 + 1) + 8 * j)
                && (!objc_msgSend(v10, "allowedWithAttribute:error:")
                 || ![v10 hasMandatoryAttributes:v11 error:a4]))
              {

                BOOL v16 = 0;
                goto LABEL_21;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v7 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      BOOL v16 = 1;
    }
    while (v7);
  }
  else
  {
    BOOL v16 = 1;
  }
LABEL_21:

  return v16;
}

- (id)_errorWithDescription:(uint64_t)a1
{
  v10[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = (void *)MEMORY[0x263F087E8];
    uint64_t v3 = *MEMORY[0x263F64670];
    uint64_t v9 = *MEMORY[0x263F08338];
    v10[0] = a2;
    v4 = NSDictionary;
    id v5 = a2;
    uint64_t v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v7 = [v2 errorWithDomain:v3 code:2 userInfo:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

@end