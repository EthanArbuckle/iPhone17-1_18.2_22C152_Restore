@interface USDeviceActivityEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)includesAllActivity;
- (BOOL)includesPastActivity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUntokenized;
- (NSDateComponents)threshold;
- (NSSet)applicationTokens;
- (NSSet)bundleIdentifiers;
- (NSSet)categoryIdentifiers;
- (NSSet)categoryTokens;
- (NSSet)webDomainTokens;
- (NSSet)webDomains;
- (USDeviceActivityEvent)initWithApplicationTokens:(id)a3 categoryTokens:(id)a4 webDomainTokens:(id)a5 threshold:(id)a6 includesPastActivity:(BOOL)a7;
- (USDeviceActivityEvent)initWithBundleIdentifiers:(id)a3 categoryIdentifiers:(id)a4 webDomains:(id)a5 threshold:(id)a6 includesPastActivity:(BOOL)a7;
- (USDeviceActivityEvent)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation USDeviceActivityEvent

- (USDeviceActivityEvent)initWithApplicationTokens:(id)a3 categoryTokens:(id)a4 webDomainTokens:(id)a5 threshold:(id)a6 includesPastActivity:(BOOL)a7
{
  v31.receiver = self;
  v31.super_class = (Class)USDeviceActivityEvent;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [(USDeviceActivityEvent *)&v31 init];
  uint64_t v16 = objc_msgSend(v14, "copy", v31.receiver, v31.super_class);

  applicationTokens = v15->_applicationTokens;
  v15->_applicationTokens = (NSSet *)v16;

  uint64_t v18 = [v13 copy];
  categoryTokens = v15->_categoryTokens;
  v15->_categoryTokens = (NSSet *)v18;

  uint64_t v20 = [v12 copy];
  webDomainTokens = v15->_webDomainTokens;
  v15->_webDomainTokens = (NSSet *)v20;

  uint64_t v22 = objc_opt_new();
  bundleIdentifiers = v15->_bundleIdentifiers;
  v15->_bundleIdentifiers = (NSSet *)v22;

  uint64_t v24 = objc_opt_new();
  categoryIdentifiers = v15->_categoryIdentifiers;
  v15->_categoryIdentifiers = (NSSet *)v24;

  uint64_t v26 = objc_opt_new();
  webDomains = v15->_webDomains;
  v15->_webDomains = (NSSet *)v26;

  uint64_t v28 = [v11 copy];
  threshold = v15->_threshold;
  v15->_threshold = (NSDateComponents *)v28;

  v15->_isUntokenized = 0;
  v15->_includesPastActivity = a7;
  return v15;
}

- (USDeviceActivityEvent)initWithBundleIdentifiers:(id)a3 categoryIdentifiers:(id)a4 webDomains:(id)a5 threshold:(id)a6 includesPastActivity:(BOOL)a7
{
  v31.receiver = self;
  v31.super_class = (Class)USDeviceActivityEvent;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [(USDeviceActivityEvent *)&v31 init];
  uint64_t v16 = objc_opt_new();
  applicationTokens = v15->_applicationTokens;
  v15->_applicationTokens = (NSSet *)v16;

  uint64_t v18 = objc_opt_new();
  categoryTokens = v15->_categoryTokens;
  v15->_categoryTokens = (NSSet *)v18;

  uint64_t v20 = objc_opt_new();
  webDomainTokens = v15->_webDomainTokens;
  v15->_webDomainTokens = (NSSet *)v20;

  uint64_t v22 = objc_msgSend(v14, "copy", v31.receiver, v31.super_class);
  bundleIdentifiers = v15->_bundleIdentifiers;
  v15->_bundleIdentifiers = (NSSet *)v22;

  uint64_t v24 = [v13 copy];
  categoryIdentifiers = v15->_categoryIdentifiers;
  v15->_categoryIdentifiers = (NSSet *)v24;

  uint64_t v26 = [v12 copy];
  webDomains = v15->_webDomains;
  v15->_webDomains = (NSSet *)v26;

  uint64_t v28 = [v11 copy];
  threshold = v15->_threshold;
  v15->_threshold = (NSDateComponents *)v28;

  v15->_isUntokenized = 1;
  v15->_includesPastActivity = a7;
  return v15;
}

- (USDeviceActivityEvent)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
  uint64_t v7 = [v3 decodeObjectOfClasses:v6 forKey:@"ApplicationTokens"];
  v8 = [v3 decodeObjectOfClasses:v6 forKey:@"CategoryTokens"];
  v37 = (void *)v6;
  v9 = [v3 decodeObjectOfClasses:v6 forKey:@"WebDomainTokens"];
  id v10 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
  uint64_t v13 = [v3 decodeObjectOfClasses:v12 forKey:@"BundleIdentifiers"];
  id v14 = [v3 decodeObjectOfClasses:v12 forKey:@"CategoryIdentifiers"];
  v15 = [v3 decodeObjectOfClasses:v12 forKey:@"WebDomains"];
  uint64_t v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Threshold"];
  v17 = (void *)v16;
  uint64_t v18 = (void *)v7;
  if (v7 && v8 && v9 && v13 && v14 && v15 && v16)
  {
    v38.receiver = self;
    v38.super_class = (Class)USDeviceActivityEvent;
    v19 = (void *)v13;
    uint64_t v20 = [(USDeviceActivityEvent *)&v38 init];
    uint64_t v21 = [v18 copy];
    applicationTokens = v20->_applicationTokens;
    v20->_applicationTokens = (NSSet *)v21;

    uint64_t v23 = [v8 copy];
    categoryTokens = v20->_categoryTokens;
    v20->_categoryTokens = (NSSet *)v23;

    uint64_t v25 = [v9 copy];
    webDomainTokens = v20->_webDomainTokens;
    v20->_webDomainTokens = (NSSet *)v25;

    uint64_t v27 = [v19 copy];
    bundleIdentifiers = v20->_bundleIdentifiers;
    v20->_bundleIdentifiers = (NSSet *)v27;

    uint64_t v29 = [v14 copy];
    categoryIdentifiers = v20->_categoryIdentifiers;
    v20->_categoryIdentifiers = (NSSet *)v29;

    uint64_t v31 = [v15 copy];
    webDomains = v20->_webDomains;
    v20->_webDomains = (NSSet *)v31;

    uint64_t v33 = [v17 copy];
    threshold = v20->_threshold;
    v20->_threshold = (NSDateComponents *)v33;

    v20->_isUntokenized = [v3 decodeBoolForKey:@"IsUntokenized"];
    v20->_includesPastActivity = [v3 decodeBoolForKey:@"IncludesPastActivity"];
  }
  else
  {

    v19 = (void *)v13;
    uint64_t v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  applicationTokens = self->_applicationTokens;
  id v5 = a3;
  [v5 encodeObject:applicationTokens forKey:@"ApplicationTokens"];
  [v5 encodeObject:self->_categoryTokens forKey:@"CategoryTokens"];
  [v5 encodeObject:self->_webDomainTokens forKey:@"WebDomainTokens"];
  [v5 encodeObject:self->_bundleIdentifiers forKey:@"BundleIdentifiers"];
  [v5 encodeObject:self->_categoryIdentifiers forKey:@"CategoryIdentifiers"];
  [v5 encodeObject:self->_webDomains forKey:@"WebDomains"];
  [v5 encodeObject:self->_threshold forKey:@"Threshold"];
  [v5 encodeBool:self->_isUntokenized forKey:@"IsUntokenized"];
  [v5 encodeBool:self->_includesPastActivity forKey:@"IncludesPastActivity"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)includesAllActivity
{
  if ([(USDeviceActivityEvent *)self isUntokenized])
  {
    id v3 = [(USDeviceActivityEvent *)self bundleIdentifiers];
    if (![v3 count])
    {
      id v4 = [(USDeviceActivityEvent *)self categoryIdentifiers];
      if (![v4 count])
      {
        id v5 = [(USDeviceActivityEvent *)self webDomains];
LABEL_10:
        uint64_t v7 = v5;
        BOOL v6 = [v5 count] == 0;

        goto LABEL_11;
      }
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = [(USDeviceActivityEvent *)self applicationTokens];
    if (![v3 count])
    {
      id v4 = [(USDeviceActivityEvent *)self categoryTokens];
      if (![v4 count])
      {
        id v5 = [(USDeviceActivityEvent *)self webDomainTokens];
        goto LABEL_10;
      }
LABEL_8:
      BOOL v6 = 0;
LABEL_11:

      goto LABEL_12;
    }
  }
  BOOL v6 = 0;
LABEL_12:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(USDeviceActivityEvent *)self applicationTokens];
    uint64_t v7 = [v5 applicationTokens];
    if ([v6 isEqual:v7])
    {
      v8 = [(USDeviceActivityEvent *)self categoryTokens];
      v9 = [v5 categoryTokens];
      if ([v8 isEqual:v9])
      {
        id v10 = [(USDeviceActivityEvent *)self webDomainTokens];
        uint64_t v11 = [v5 webDomainTokens];
        if ([v10 isEqual:v11])
        {
          id v12 = [(USDeviceActivityEvent *)self bundleIdentifiers];
          uint64_t v28 = [v5 bundleIdentifiers];
          uint64_t v29 = v12;
          if ([v12 isEqual:v28])
          {
            uint64_t v13 = [(USDeviceActivityEvent *)self categoryIdentifiers];
            uint64_t v26 = [v5 categoryIdentifiers];
            uint64_t v27 = v13;
            if ([v13 isEqual:v26])
            {
              id v14 = [(USDeviceActivityEvent *)self webDomains];
              uint64_t v24 = [v5 webDomains];
              uint64_t v25 = v14;
              if ([v14 isEqual:v24])
              {
                uint64_t v15 = [(USDeviceActivityEvent *)self threshold];
                uint64_t v16 = [v5 threshold];
                uint64_t v23 = (void *)v15;
                v17 = (void *)v15;
                uint64_t v18 = (void *)v16;
                if ([v17 isEqual:v16]
                  && (int v22 = [(USDeviceActivityEvent *)self isUntokenized],
                      v22 == [v5 isUntokenized]))
                {
                  BOOL v20 = [(USDeviceActivityEvent *)self includesPastActivity];
                  int v19 = v20 ^ [v5 includesPastActivity] ^ 1;
                }
                else
                {
                  LOBYTE(v19) = 0;
                }
              }
              else
              {
                LOBYTE(v19) = 0;
              }
            }
            else
            {
              LOBYTE(v19) = 0;
            }
          }
          else
          {
            LOBYTE(v19) = 0;
          }
        }
        else
        {
          LOBYTE(v19) = 0;
        }
      }
      else
      {
        LOBYTE(v19) = 0;
      }
    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  id v3 = [(USDeviceActivityEvent *)self applicationTokens];
  uint64_t v4 = [v3 hash];
  id v5 = [(USDeviceActivityEvent *)self categoryTokens];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(USDeviceActivityEvent *)self webDomainTokens];
  uint64_t v8 = [v7 hash];
  v9 = [(USDeviceActivityEvent *)self bundleIdentifiers];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  uint64_t v11 = [(USDeviceActivityEvent *)self categoryIdentifiers];
  uint64_t v12 = [v11 hash];
  uint64_t v13 = [(USDeviceActivityEvent *)self webDomains];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = [(USDeviceActivityEvent *)self threshold];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];
  uint64_t v17 = [(USDeviceActivityEvent *)self isUntokenized];
  unint64_t v18 = v16 ^ v17 ^ [(USDeviceActivityEvent *)self includesPastActivity];

  return v18;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)USDeviceActivityEvent;
  uint64_t v4 = [(USDeviceActivityEvent *)&v8 description];
  id v5 = [(USDeviceActivityEvent *)self threshold];
  uint64_t v6 = [v3 stringWithFormat:@"%@\nThreshold: %@", v4, v5];

  return v6;
}

- (NSSet)applicationTokens
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)categoryTokens
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)webDomainTokens
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSSet)bundleIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSSet)categoryIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (NSSet)webDomains
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (NSDateComponents)threshold
{
  return (NSDateComponents *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)includesPastActivity
{
  return self->_includesPastActivity;
}

- (BOOL)isUntokenized
{
  return self->_isUntokenized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_webDomains, 0);
  objc_storeStrong((id *)&self->_categoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_webDomainTokens, 0);
  objc_storeStrong((id *)&self->_categoryTokens, 0);
  objc_storeStrong((id *)&self->_applicationTokens, 0);
}

@end