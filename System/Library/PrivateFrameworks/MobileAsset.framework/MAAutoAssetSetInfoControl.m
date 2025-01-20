@interface MAAutoAssetSetInfoControl
+ (BOOL)supportsSecureCoding;
- (BOOL)clearingAfter;
- (MAAutoAssetSetInfoControl)initWithCoder:(id)a3;
- (NSArray)limitedToClientDomains;
- (NSArray)limitedToSetIdentifiers;
- (id)_arrayStringsToString:(id)a3;
- (id)initClearingAfter:(BOOL)a3;
- (id)initClearingAfter:(BOOL)a3 limitedToClientDomains:(id)a4;
- (id)initClearingAfter:(BOOL)a3 limitedToClientDomains:(id)a4 limitedToSetIdentifiers:(id)a5;
- (id)initClearingAfter:(BOOL)a3 limitedToSetIdentifiers:(id)a4;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetSetInfoControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitedToSetIdentifiers, 0);
  objc_storeStrong((id *)&self->_limitedToClientDomains, 0);
}

- (id)initClearingAfter:(BOOL)a3
{
  return [(MAAutoAssetSetInfoControl *)self initClearingAfter:a3 limitedToSetIdentifiers:0];
}

- (id)initClearingAfter:(BOOL)a3 limitedToSetIdentifiers:(id)a4
{
  return [(MAAutoAssetSetInfoControl *)self initClearingAfter:a3 limitedToClientDomains:0 limitedToSetIdentifiers:a4];
}

- (id)initClearingAfter:(BOOL)a3 limitedToClientDomains:(id)a4
{
  return [(MAAutoAssetSetInfoControl *)self initClearingAfter:a3 limitedToClientDomains:a4 limitedToSetIdentifiers:0];
}

- (id)initClearingAfter:(BOOL)a3 limitedToClientDomains:(id)a4 limitedToSetIdentifiers:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MAAutoAssetSetInfoControl;
  v11 = [(MAAutoAssetSetInfoControl *)&v14 init];
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_clearingAfter = a3;
    objc_storeStrong((id *)&v11->_limitedToClientDomains, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (MAAutoAssetSetInfoControl)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MAAutoAssetSetInfoControl;
  v5 = [(MAAutoAssetSetInfoControl *)&v17 init];
  if (v5)
  {
    v5->_clearingAfter = [v4 decodeBoolForKey:@"clearingAfter"];
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v8 = (void *)[v6 initWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"limitedToClientDomains"];
    limitedToClientDomains = v5->_limitedToClientDomains;
    v5->_limitedToClientDomains = (NSArray *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v13 = (void *)[v11 initWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"limitedToSetIdentifiers"];
    limitedToSetIdentifiers = v5->_limitedToSetIdentifiers;
    v5->_limitedToSetIdentifiers = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetInfoControl clearingAfter](self, "clearingAfter"), @"clearingAfter");
  v5 = [(MAAutoAssetSetInfoControl *)self limitedToClientDomains];
  [v4 encodeObject:v5 forKey:@"limitedToClientDomains"];

  id v6 = [(MAAutoAssetSetInfoControl *)self limitedToSetIdentifiers];
  [v4 encodeObject:v6 forKey:@"limitedToSetIdentifiers"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  id v4 = NSString;
  if ([(MAAutoAssetSetInfoControl *)self clearingAfter]) {
    v5 = @"Y";
  }
  else {
    v5 = @"N";
  }
  id v6 = [(MAAutoAssetSetInfoControl *)self limitedToClientDomains];
  if (v6)
  {
    v2 = [(MAAutoAssetSetInfoControl *)self limitedToClientDomains];
    v7 = [(MAAutoAssetSetInfoControl *)self _arrayStringsToString:v2];
  }
  else
  {
    v7 = @"N";
  }
  v8 = [(MAAutoAssetSetInfoControl *)self limitedToSetIdentifiers];
  if (v8)
  {
    uint64_t v9 = [(MAAutoAssetSetInfoControl *)self limitedToSetIdentifiers];
    id v10 = [(MAAutoAssetSetInfoControl *)self _arrayStringsToString:v9];
    id v11 = [v4 stringWithFormat:@"clearingAfter:%@, limitedToClientDomains:%@ limitedToSetIdentifiers:%@", v5, v7, v10];
  }
  else
  {
    id v11 = [v4 stringWithFormat:@"clearingAfter:%@, limitedToClientDomains:%@ limitedToSetIdentifiers:%@", v5, v7, @"N"];
  }

  if (v6)
  {
  }
  return v11;
}

- (id)_arrayStringsToString:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v5 = v4;
  if (v3)
  {
    [v4 appendString:@"["];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      id v10 = &stru_1F0A75970;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          [v5 appendFormat:@"%@%@", v10, *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13];
          id v10 = @",";
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        id v10 = @",";
      }
      while (v8);
    }

    [v5 appendString:@"]"];
  }

  return v5;
}

- (BOOL)clearingAfter
{
  return self->_clearingAfter;
}

- (NSArray)limitedToClientDomains
{
  return self->_limitedToClientDomains;
}

- (NSArray)limitedToSetIdentifiers
{
  return self->_limitedToSetIdentifiers;
}

@end