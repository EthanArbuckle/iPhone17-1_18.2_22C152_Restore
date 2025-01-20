@interface ICCRRegisterMultiValue
- (BOOL)isEqual:(id)a3;
- (ICCRRegisterMultiValue)initWithContents:(id)a3 document:(id)a4;
- (ICCRRegisterMultiValue)initWithICCRCoder:(id)a3;
- (ICCRRegisterMultiValue)initWithValues:(id)a3;
- (ICCRSet)values;
- (NSSet)cachedValues;
- (id)allContents;
- (id)contents;
- (id)deltaSince:(id)a3 in:(id)a4;
- (id)description;
- (void)encodeWithICCRCoder:(id)a3;
- (void)mergeWith:(id)a3;
- (void)mergeWithRegisterMultiValue:(id)a3;
- (void)setCachedValues:(id)a3;
- (void)setContents:(id)a3;
- (void)setDocument:(id)a3;
- (void)setValues:(id)a3;
- (void)walkGraph:(id)a3;
@end

@implementation ICCRRegisterMultiValue

- (ICCRRegisterMultiValue)initWithContents:(id)a3 document:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICCRRegisterMultiValue;
  v8 = [(ICCRRegisterMultiValue *)&v12 init];
  if (v8)
  {
    v9 = [[ICCRSet alloc] initWithDocument:v7];
    values = v8->_values;
    v8->_values = v9;

    if (v6) {
      [(ICCRRegisterMultiValue *)v8 setContents:v6];
    }
  }

  return v8;
}

- (ICCRRegisterMultiValue)initWithValues:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCRRegisterMultiValue;
  id v6 = [(ICCRRegisterMultiValue *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_values, a3);
  }

  return v7;
}

- (void)encodeWithICCRCoder:(id)a3
{
  id v5 = a3;
  v4 = [(ICCRRegisterMultiValue *)self values];
  [v5 encodeObject:v4 forKey:@"values"];
}

- (ICCRRegisterMultiValue)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 document];
  id v6 = [(ICCRRegisterMultiValue *)self initWithContents:0 document:v5];

  if (v6)
  {
    id v7 = [v4 decodeObjectForKey:@"values"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v6->_values, v7);
    }
  }
  return v6;
}

- (id)allContents
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(ICCRRegisterMultiValue *)self cachedValues];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
    id v5 = [(ICCRRegisterMultiValue *)self values];
    id v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = [(ICCRRegisterMultiValue *)self values];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          [v6 addObject:*(void *)(*((void *)&v13 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [(ICCRRegisterMultiValue *)self setCachedValues:v6];
  }
  v11 = [(ICCRRegisterMultiValue *)self cachedValues];
  return v11;
}

- (id)contents
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(ICCRRegisterMultiValue *)self values];
  v3 = 0;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (!v3 || [*(id *)(*((void *)&v10 + 1) + 8 * i) compare:v3] == 1)
        {
          id v8 = v7;

          v3 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return v3;
}

- (void)setContents:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(ICCRRegisterMultiValue *)self values];
  [v4 setObject:v5];

  [(ICCRRegisterMultiValue *)self setCachedValues:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(ICCRRegisterMultiValue *)self values];
    id v6 = [v4 values];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)mergeWith:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], @"Invalid merge, classes must be equal for merge.", 0 reason userInfo];
    objc_exception_throw(v4);
  }
  [(ICCRRegisterMultiValue *)self mergeWithRegisterMultiValue:v5];
  [(ICCRRegisterMultiValue *)self setCachedValues:0];
}

- (void)mergeWithRegisterMultiValue:(id)a3
{
  id v6 = a3;
  id v4 = [(ICCRRegisterMultiValue *)self values];
  id v5 = [v6 values];
  [v4 mergeWith:v5];
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICCRRegisterMultiValue *)self values];
  uint64_t v9 = [v8 deltaSince:v6 in:v7];

  if (v9) {
    long long v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValues:v9];
  }
  else {
    long long v10 = 0;
  }

  return v10;
}

- (void)walkGraph:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  id v4 = [(ICCRRegisterMultiValue *)self values];
  v5[2](v5, v4);
}

- (void)setDocument:(id)a3
{
  id v5 = a3;
  id v4 = [(ICCRRegisterMultiValue *)self values];
  [v4 setDocument:v5];
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = objc_msgSend(v3, "stringWithFormat:", @"<%@ %p ("), v5, self;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = [(ICCRRegisterMultiValue *)self values];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        [v6 appendFormat:@"%@, ", *(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [v6 replaceCharactersInRange:objc_msgSend(v6, "length") - 2, 2, @">" withString]);
  return v6;
}

- (ICCRSet)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (NSSet)cachedValues
{
  return self->_cachedValues;
}

- (void)setCachedValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedValues, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end