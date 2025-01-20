@interface _SBDisplayItemLayoutAttributesMapKey
- (BOOL)isEqual:(id)a3;
- (_SBDisplayItemLayoutAttributesMapKey)initWithAppLayout:(id)a3 displayOrdinal:(int64_t)a4;
- (unint64_t)hash;
@end

@implementation _SBDisplayItemLayoutAttributesMapKey

- (unint64_t)hash
{
  return self->_hash;
}

- (void).cxx_destruct
{
}

- (_SBDisplayItemLayoutAttributesMapKey)initWithAppLayout:(id)a3 displayOrdinal:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_SBDisplayItemLayoutAttributesMapKey;
  v8 = [(_SBDisplayItemLayoutAttributesMapKey *)&v27 init];
  if (v8)
  {
    if (!v7)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, v8, @"SBRecentAppLayouts.m", 1080, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
    }
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v10 = [v7 allItems];
    uint64_t v11 = [v9 setWithArray:v10];
    displayItems = v8->_displayItems;
    v8->_displayItems = (NSSet *)v11;

    v8->_displayOrdinal = a4;
    id v13 = objc_alloc_init(MEMORY[0x1E4F4F758]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v14 = v8->_displayItems;
    uint64_t v15 = [(NSSet *)v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = (id)[v13 appendObject:*(void *)(*((void *)&v23 + 1) + 8 * v18++)];
        }
        while (v16 != v18);
        uint64_t v16 = [(NSSet *)v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v16);
    }

    id v20 = (id)[v13 appendInteger:v8->_displayOrdinal];
    v8->_hash = [v13 hash];
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_SBDisplayItemLayoutAttributesMapKey *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    v9 = v7;

    if (v9 && self->_displayOrdinal == v9->_displayOrdinal) {
      char v8 = BSEqualSets();
    }
    else {
      char v8 = 0;
    }
  }
  return v8;
}

@end