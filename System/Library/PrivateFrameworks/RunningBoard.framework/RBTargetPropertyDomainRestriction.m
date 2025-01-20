@interface RBTargetPropertyDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_initWithProperty:(id)a3 value:(id)a4;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBTargetPropertyDomainRestriction

- (id)_initWithProperty:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)RBTargetPropertyDomainRestriction;
  v8 = [(RBDomainRestriction *)&v19 _init];
  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v9 = [v6 copy];
  v10 = (void *)v8[1];
  v8[1] = v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [v7 copy];
      v12 = (void *)v8[3];
      v8[3] = v14;
      v13 = &OBJC_IVAR___RBTargetPropertyDomainRestriction__numberValue;
      goto LABEL_6;
    }
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  uint64_t v11 = [v7 copy];
  v12 = (void *)v8[2];
  v8[2] = v11;
  v13 = &OBJC_IVAR___RBTargetPropertyDomainRestriction__stringValue;
LABEL_6:

  uint64_t v15 = *v13;
  v16 = *(void **)((char *)v8 + v15);
  *(void *)((char *)v8 + v15) = 0;

  v17 = v8;
LABEL_8:

  return v17;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  v30[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 objectForKey:@"Property"];
  id v7 = [v5 objectForKey:@"Value"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v7)
      {
        if ([v6 isEqualToString:@"SupportsBackgroundContentFetching"]
          || [v6 isEqualToString:@"UsesSocketMonitoring"]
          || [v6 isEqualToString:@"SupportsBackgroundNetworkAuthentication"]
          || [v6 isEqualToString:@"SupportsUnboundedTaskCompletion"]
          || [v6 isEqualToString:@"SupportsBackgroundAudio"]
          || [v6 isEqualToString:@"IsExtension"]
          || [v6 isEqualToString:@"Platform"]
          || [v6 isEqualToString:@"NotPlatform"])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v8 = NSString;
LABEL_14:
            [v8 stringWithFormat:@"Malformed domain plist - value for %@ is not of class %@", v6, objc_opt_class()];
            goto LABEL_15;
          }
        }
        else
        {
          if (![v6 isEqualToString:@"BundleID"])
          {
            [NSString stringWithFormat:@"Unrecognized target property: %@", v6, v24];
            uint64_t v9 = LABEL_15:;
            id v10 = (id)v9;
            if (v9)
            {
              if (a4)
              {
                uint64_t v11 = (void *)MEMORY[0x263F087E8];
                uint64_t v25 = *MEMORY[0x263F08338];
                uint64_t v26 = v9;
                v12 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
                v13 = [v11 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v12];

                id v14 = v13;
                *a4 = v14;
              }
              id v15 = 0;
              goto LABEL_28;
            }
            goto LABEL_27;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v8 = NSString;
            goto LABEL_14;
          }
        }
LABEL_27:
        id v15 = [[RBTargetPropertyDomainRestriction alloc] _initWithProperty:v6 value:v7];
        id v10 = 0;
        goto LABEL_28;
      }
      if (a4)
      {
        v16 = (void *)MEMORY[0x263F087E8];
        uint64_t v27 = *MEMORY[0x263F08338];
        v17 = [NSString stringWithFormat:@"RBTargetPropertyDomainRestriction doesn't specify value: %@", v5];
        v28 = v17;
        v18 = NSDictionary;
        objc_super v19 = &v28;
        v20 = &v27;
        goto LABEL_21;
      }
LABEL_24:
      id v15 = 0;
      goto LABEL_29;
    }
  }
  if (!a4) {
    goto LABEL_24;
  }
  v16 = (void *)MEMORY[0x263F087E8];
  uint64_t v29 = *MEMORY[0x263F08338];
  v17 = [NSString stringWithFormat:@"RBTargetPropertyDomainRestriction doesn't specify property: %@", v5];
  v30[0] = v17;
  v18 = NSDictionary;
  objc_super v19 = (void **)v30;
  v20 = &v29;
LABEL_21:
  v21 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
  v22 = [v16 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v21];

  id v10 = v22;
  id v15 = 0;
  *a4 = v10;
LABEL_28:

LABEL_29:
  return v15;
}

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  id v6 = [a3 targetProperties];
  if ([(NSString *)self->_property isEqualToString:@"SupportsBackgroundContentFetching"])
  {
    int v7 = [v6 supportsBackgroundContentFetching];
LABEL_13:
    int v8 = v7;
    int v9 = [(NSNumber *)self->_numberValue BOOLValue];
    goto LABEL_14;
  }
  if ([(NSString *)self->_property isEqualToString:@"UsesSocketMonitoring"])
  {
    int v7 = [v6 usesSocketMonitoring];
    goto LABEL_13;
  }
  if ([(NSString *)self->_property isEqualToString:@"SupportsBackgroundNetworkAuthentication"])
  {
    int v7 = [v6 supportsBackgroundNetworkAuthentication];
    goto LABEL_13;
  }
  if ([(NSString *)self->_property isEqualToString:@"SupportsUnboundedTaskCompletion"])
  {
    int v7 = [v6 supportsUnboundedTaskCompletion];
    goto LABEL_13;
  }
  if ([(NSString *)self->_property isEqualToString:@"SupportsBackgroundAudio"])
  {
    int v7 = [v6 supportsBackgroundAudio];
    goto LABEL_13;
  }
  if ([(NSString *)self->_property isEqualToString:@"IsExtension"])
  {
    int v7 = [v6 isExtension];
    goto LABEL_13;
  }
  if ([(NSString *)self->_property isEqualToString:@"Platform"])
  {
    int v8 = [v6 platform];
    int v9 = [(NSNumber *)self->_numberValue intValue];
LABEL_14:
    if (v8 != v9) {
      goto LABEL_15;
    }
LABEL_31:
    LOBYTE(a4) = 1;
    goto LABEL_32;
  }
  if ([(NSString *)self->_property isEqualToString:@"NotPlatform"])
  {
    int v16 = [v6 platform];
    if (v16 != [(NSNumber *)self->_numberValue intValue]) {
      goto LABEL_31;
    }
  }
  else if ([(NSString *)self->_property isEqualToString:@"BundleID"])
  {
    v17 = [v6 bundleIdentifier];
    v18 = v17;
    stringValue = self->_stringValue;
    if (v17 == stringValue)
    {

      goto LABEL_31;
    }
    if (v17 && stringValue)
    {
      char v20 = -[NSString isEqual:](v17, "isEqual:");

      if (v20) {
        goto LABEL_31;
      }
    }
    else
    {
    }
  }
LABEL_15:
  if (a4)
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F64670];
    v22[0] = *MEMORY[0x263F08338];
    numberValue = self->_numberValue;
    if (!numberValue) {
      numberValue = (NSNumber *)self->_stringValue;
    }
    v13 = [NSString stringWithFormat:@"Target doesn't have %@='%@'", self->_property, numberValue];
    v23[0] = v13;
    v22[1] = *MEMORY[0x263F64668];
    id v14 = [(RBTargetPropertyDomainRestriction *)self description];
    v23[1] = v14;
    id v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    *a4 = [v10 errorWithDomain:v11 code:3 userInfo:v15];

    LOBYTE(a4) = 0;
  }
LABEL_32:

  return (char)a4;
}

- (id)allEntitlements
{
  return (id)[MEMORY[0x263EFFA08] set];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBTargetPropertyDomainRestriction *)a3;
  if (self == v4) {
    goto LABEL_22;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  property = self->_property;
  int v8 = v4->_property;
  if (property != v8)
  {
    BOOL v9 = !property || v8 == 0;
    if (v9 || !-[NSString isEqual:](property, "isEqual:")) {
      goto LABEL_3;
    }
  }
  numberValue = self->_numberValue;
  uint64_t v11 = v4->_numberValue;
  if (numberValue != v11)
  {
    BOOL v12 = !numberValue || v11 == 0;
    if (v12 || !-[NSNumber isEqual:](numberValue, "isEqual:")) {
      goto LABEL_3;
    }
  }
  stringValue = self->_stringValue;
  id v14 = v4->_stringValue;
  if (stringValue == v14)
  {
LABEL_22:
    char v6 = 1;
    goto LABEL_23;
  }
  if (stringValue) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    char v6 = -[NSString isEqual:](stringValue, "isEqual:");
    goto LABEL_23;
  }
LABEL_3:
  char v6 = 0;
LABEL_23:

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_property hash];
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(id)objc_opt_class() description];
  uint64_t v5 = (void *)v4;
  numberValue = self->_numberValue;
  if (!numberValue) {
    numberValue = (NSNumber *)self->_stringValue;
  }
  int v7 = (void *)[v3 initWithFormat:@"<%@| %@='%@'>", v4, self->_property, numberValue];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

@end