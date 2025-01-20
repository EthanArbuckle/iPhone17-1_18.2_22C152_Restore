@interface NWNetworkAdviceUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)applications;
- (NWNetworkAdviceUpdate)initWithCoder:(id)a3;
- (NWNetworkAdviceUpdate)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)level;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplications:(id)a3;
- (void)setLevel:(int64_t)a3;
@end

@implementation NWNetworkAdviceUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NWNetworkAdviceUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NWNetworkAdviceUpdate;
  v5 = [(NWNetworkAdviceUpdate *)&v13 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x2611E0E10]();
    v5->_level = [v4 decodeIntegerForKey:@"level"];
    id v7 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"applications"];
    applications = v5->_applications;
    v5->_applications = (NSArray *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = (void *)MEMORY[0x2611E0E10]();
  objc_msgSend(v6, "encodeInteger:forKey:", -[NWNetworkAdviceUpdate level](self, "level"), @"level");
  v5 = [(NWNetworkAdviceUpdate *)self applications];
  [v6 encodeObject:v5 forKey:@"applications"];
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:10];
  objc_msgSend(v3, "appendFormat:", @"level: %ld", -[NWNetworkAdviceUpdate level](self, "level"));
  id v4 = [(NWNetworkAdviceUpdate *)self applications];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [v9 bundleIdentifier];
        uint64_t v11 = [v9 state];
        v12 = [v9 reason];
        [v3 appendFormat:@", (%@, %ld, %@)", v10, v11, v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  objc_super v13 = (void *)[[NSString alloc] initWithString:v3];

  return v13;
}

- (NWNetworkAdviceUpdate)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)NWNetworkAdviceUpdate;
  uint64_t v5 = [(NWNetworkAdviceUpdate *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"detail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NWNetworkAdviceUpdate setLevel:](v5, "setLevel:", [v6 integerValue]);
    }
    uint64_t v20 = v5;
    uint64_t v7 = [v4 objectForKeyedSubscript:@"states"];
    id v21 = v4;
    uint64_t v8 = [v4 objectForKeyedSubscript:@"reasons"];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = 0;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          long long v16 = objc_alloc_init(NWAppAdvice);
          [(NWAppAdvice *)v16 setBundleIdentifier:v15];
          long long v17 = [v9 objectForKeyedSubscript:v15];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            -[NWAppAdvice setState:](v16, "setState:", [v17 integerValue]);
          }
          long long v18 = [v8 objectForKeyedSubscript:v15];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(NWAppAdvice *)v16 setReason:v18];
          }
          if (!v12) {
            id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
          }
          [v12 addObject:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v11);
    }
    else
    {
      id v12 = 0;
    }

    uint64_t v5 = v20;
    [(NWNetworkAdviceUpdate *)v20 setApplications:v12];

    id v4 = v21;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NWNetworkAdviceUpdate *)a3;
  if (v4 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int64_t v6 = [(NWNetworkAdviceUpdate *)self level];
      if (v6 == [(NWNetworkAdviceUpdate *)v5 level])
      {
        id v7 = [(NWNetworkAdviceUpdate *)self applications];
        if (v7)
        {
          uint64_t v8 = [(NWNetworkAdviceUpdate *)v5 applications];

          if (v8)
          {
            id v9 = objc_alloc(MEMORY[0x263EFFA08]);
            uint64_t v10 = [(NWNetworkAdviceUpdate *)self applications];
            uint64_t v11 = (void *)[v9 initWithArray:v10];

            id v7 = objc_alloc(MEMORY[0x263EFFA08]);
            id v12 = [(NWNetworkAdviceUpdate *)v5 applications];
            uint64_t v13 = (void *)[v7 initWithArray:v12];

            LOBYTE(v7) = [v11 isEqualToSet:v13];
          }
          else
          {
            LOBYTE(v7) = 0;
          }
        }
        v14 = [(NWNetworkAdviceUpdate *)self applications];
        if (![v14 count])
        {
          uint64_t v15 = [(NWNetworkAdviceUpdate *)v5 applications];
          uint64_t v16 = [v15 count];

          if (!v16) {
            LOBYTE(v7) = 1;
          }
        }
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return (char)v7;
}

- (unint64_t)hash
{
  v2 = [(NWNetworkAdviceUpdate *)self description];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(NWNetworkAdviceUpdate);
  v4->_level = self->_level;
  objc_storeStrong((id *)&v4->_applications, self->_applications);
  return v4;
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (NSArray)applications
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApplications:(id)a3
{
}

- (void).cxx_destruct
{
}

@end