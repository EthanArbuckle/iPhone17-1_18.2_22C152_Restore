@interface MAAutoAssetSetTarget
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MAAutoAssetSetTarget)initWithCoder:(id)a3;
- (NSArray)autoAssetEntries;
- (NSString)maxTargetOSVersion;
- (NSString)minTargetOSVersion;
- (id)copy;
- (id)initForMinTargetOSVersion:(id)a3 toMaxTargetOSVersion:(id)a4 asEntriesWhenTargeting:(id)a5;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoAssetEntries:(id)a3;
- (void)setMaxTargetOSVersion:(id)a3;
- (void)setMinTargetOSVersion:(id)a3;
@end

@implementation MAAutoAssetSetTarget

- (id)initForMinTargetOSVersion:(id)a3 toMaxTargetOSVersion:(id)a4 asEntriesWhenTargeting:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MAAutoAssetSetTarget;
  v12 = [(MAAutoAssetSetTarget *)&v15 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_minTargetOSVersion, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (MAAutoAssetSetTarget)initWithCoder:(id)a3
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MAAutoAssetSetTarget;
  v5 = [(MAAutoAssetSetTarget *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minTargetOSVersion"];
    minTargetOSVersion = v5->_minTargetOSVersion;
    v5->_minTargetOSVersion = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxTargetOSVersion"];
    maxTargetOSVersion = v5->_maxTargetOSVersion;
    v5->_maxTargetOSVersion = (NSString *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
    v12 = (void *)[v10 initWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"autoAssetEntries"];
    autoAssetEntries = v5->_autoAssetEntries;
    v5->_autoAssetEntries = (NSArray *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MAAutoAssetSetTarget *)self minTargetOSVersion];
  [v4 encodeObject:v5 forKey:@"minTargetOSVersion"];

  uint64_t v6 = [(MAAutoAssetSetTarget *)self maxTargetOSVersion];
  [v4 encodeObject:v6 forKey:@"maxTargetOSVersion"];

  id v7 = [(MAAutoAssetSetTarget *)self autoAssetEntries];
  [v4 encodeObject:v7 forKey:@"autoAssetEntries"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = [MAAutoAssetSetTarget alloc];
  id v4 = [(MAAutoAssetSetTarget *)self minTargetOSVersion];
  v5 = [(MAAutoAssetSetTarget *)self maxTargetOSVersion];
  uint64_t v6 = [(MAAutoAssetSetTarget *)self autoAssetEntries];
  id v7 = [(MAAutoAssetSetTarget *)v3 initForMinTargetOSVersion:v4 toMaxTargetOSVersion:v5 asEntriesWhenTargeting:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MAAutoAssetSetTarget *)a3;
  if (v4 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(MAAutoAssetSetTarget *)self minTargetOSVersion];
      if (!v6)
      {
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v7 = [(MAAutoAssetSetTarget *)self maxTargetOSVersion];
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = [(MAAutoAssetSetTarget *)self autoAssetEntries];
        if (v9)
        {
          id v10 = (void *)v9;
          id v11 = (void *)MEMORY[0x1E4FA56C0];
          v12 = [(MAAutoAssetSetTarget *)self minTargetOSVersion];
          uint64_t v13 = [(MAAutoAssetSetTarget *)v5 minTargetOSVersion];
          if ([v11 stringIsEqual:v12 to:v13])
          {
            v29 = (void *)MEMORY[0x1E4FA56C0];
            v14 = [(MAAutoAssetSetTarget *)self maxTargetOSVersion];
            objc_super v15 = [(MAAutoAssetSetTarget *)v5 maxTargetOSVersion];
            objc_super v16 = v29;
            v30 = v14;
            if ([v16 stringIsEqual:v14 to:v15])
            {
              v17 = [(MAAutoAssetSetTarget *)v5 autoAssetEntries];

              if (v17)
              {
                v18 = [(MAAutoAssetSetTarget *)self autoAssetEntries];
                uint64_t v19 = [v18 count];

                v20 = [(MAAutoAssetSetTarget *)v5 autoAssetEntries];
                uint64_t v21 = [v20 count];

                if (v21 == v19)
                {
                  uint64_t v22 = 0;
                  uint64_t v23 = v19 & ~(v19 >> 63);
                  do
                  {
                    LOBYTE(v6) = v23 == v22;
                    if (v23 == v22) {
                      break;
                    }
                    v24 = [(MAAutoAssetSetTarget *)self autoAssetEntries];
                    v25 = [v24 objectAtIndex:v22];

                    uint64_t v26 = [(MAAutoAssetSetTarget *)v5 autoAssetEntries];
                    v27 = [(id)v26 objectAtIndex:v22];

                    ++v22;
                    LOBYTE(v26) = [v27 isEqual:v25];
                  }
                  while ((v26 & 1) != 0);
                  goto LABEL_21;
                }
              }
              goto LABEL_20;
            }
          }
        }
      }
LABEL_20:
      LOBYTE(v6) = 0;
      goto LABEL_21;
    }
    LOBYTE(v6) = 0;
  }
LABEL_22:

  return (char)v6;
}

- (id)summary
{
  v3 = NSString;
  id v4 = [(MAAutoAssetSetTarget *)self minTargetOSVersion];
  v5 = [(MAAutoAssetSetTarget *)self maxTargetOSVersion];
  uint64_t v6 = [(MAAutoAssetSetTarget *)self autoAssetEntries];
  uint64_t v7 = [v3 stringWithFormat:@"targetOSVersion:%@..%@|autoAssetEntries:%ld", v4, v5, objc_msgSend(v6, "count")];

  return v7;
}

- (NSString)minTargetOSVersion
{
  return self->_minTargetOSVersion;
}

- (void)setMinTargetOSVersion:(id)a3
{
}

- (NSString)maxTargetOSVersion
{
  return self->_maxTargetOSVersion;
}

- (void)setMaxTargetOSVersion:(id)a3
{
}

- (NSArray)autoAssetEntries
{
  return self->_autoAssetEntries;
}

- (void)setAutoAssetEntries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoAssetEntries, 0);
  objc_storeStrong((id *)&self->_maxTargetOSVersion, 0);
  objc_storeStrong((id *)&self->_minTargetOSVersion, 0);
}

@end