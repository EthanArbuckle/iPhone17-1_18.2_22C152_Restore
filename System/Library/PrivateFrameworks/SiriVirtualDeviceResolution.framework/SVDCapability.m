@interface SVDCapability
+ (BOOL)supportsSecureCoding;
- (BOOL)matchesCapabilityDescriptions:(id)a3;
- (SVDCapability)initWithCoder:(id)a3;
- (id)_swiftBacking;
- (id)key;
@end

@implementation SVDCapability

- (SVDCapability)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SVDCapability;
  return [(SVDCapability *)&v4 init];
}

- (id)_swiftBacking
{
  return 0;
}

- (BOOL)matchesCapabilityDescriptions:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    p_ivar_lyt = &CapabilityDescription.ivar_lyt;
    do
    {
      uint64_t v9 = 0;
      uint64_t v28 = v6;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
        v11 = [v10 key];
        v12 = [v10 valueSet];
        id v13 = objc_alloc((Class)(p_ivar_lyt + 10));
        v14 = v13;
        if (v12)
        {
          v15 = (void *)[v13 initWithKey:v11 valueSet:v12];
        }
        else
        {
          [v10 valueRangeLowerBound];
          uint64_t v16 = v7;
          id v17 = v4;
          v19 = v18 = p_ivar_lyt;
          [v19 doubleValue];
          double v21 = v20;
          v22 = [v10 valueRangeUpperBound];
          [v22 doubleValue];
          v15 = (void *)[v14 initWithKey:v11 lowerbound:v21 upperbound:v23];

          p_ivar_lyt = v18;
          id v4 = v17;
          uint64_t v7 = v16;
          uint64_t v6 = v28;
        }
        [v4 addObject:v15];

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v6);
  }

  v24 = [(SVDCapability *)self _swiftBacking];
  if ([v24 conformsToProtocol:&unk_1F24216D8]) {
    char v25 = [v24 matchesWithDescriptions:v4];
  }
  else {
    char v25 = 0;
  }

  return v25;
}

- (id)key
{
  v2 = [(SVDCapability *)self _swiftBacking];
  id v3 = [v2 key];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end