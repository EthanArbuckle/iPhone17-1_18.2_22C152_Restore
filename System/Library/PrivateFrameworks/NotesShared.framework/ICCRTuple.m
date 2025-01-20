@interface ICCRTuple
+ (id)tupleWithArray:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ICCRTuple)init;
- (ICCRTuple)initWithArray:(id)a3;
- (ICCRTuple)initWithICCRCoder:(id)a3;
- (NSArray)contents;
- (NSString)description;
- (id)deltaSince:(id)a3 in:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)encodeWithICCRCoder:(id)a3;
- (void)mergeWith:(id)a3;
- (void)setContents:(id)a3;
- (void)walkGraph:(id)a3;
@end

@implementation ICCRTuple

+ (id)tupleWithArray:(id)a3
{
  id v3 = a3;
  v4 = [[ICCRTuple alloc] initWithArray:v3];

  return v4;
}

- (ICCRTuple)init
{
  return [(ICCRTuple *)self initWithArray:MEMORY[0x1E4F1CBF0]];
}

- (ICCRTuple)initWithArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCRTuple;
  v5 = [(ICCRTuple *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contents = v5->_contents;
    v5->_contents = (NSArray *)v6;
  }
  return v5;
}

- (ICCRTuple)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", 0);
  v7 = [v4 decodeObjectForKey:v6];

  if (v7)
  {
    uint64_t v8 = 1;
    do
    {
      [v5 addObject:v7];

      objc_super v9 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v8);
      v7 = [v4 decodeObjectForKey:v9];

      ++v8;
    }
    while (v7);
  }
  v10 = [(ICCRTuple *)self initWithArray:v5];

  return v10;
}

- (void)encodeWithICCRCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCRTuple *)self contents];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__ICCRTuple_encodeWithICCRCoder___block_invoke;
  v7[3] = &unk_1E64A7308;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __33__ICCRTuple_encodeWithICCRCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = NSString;
  id v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", @"%ld", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:v7];
}

- (void)mergeWith:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3A8];
    v10 = @"Invalid merge ICCRTuple, classes must be equal for merge.";
    goto LABEL_6;
  }
  uint64_t v5 = [v4 count];
  if (v5 != [(ICCRTuple *)self count])
  {
    id v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3A8];
    v10 = @"Invalid merge ICCRTuple, arrays must always have same count.";
LABEL_6:
    id v11 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];
    objc_exception_throw(v11);
  }
  id v6 = [(ICCRTuple *)self contents];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __23__ICCRTuple_mergeWith___block_invoke;
  v12[3] = &unk_1E64A99E8;
  id v13 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v12];
}

void __23__ICCRTuple_mergeWith___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  id v6 = [MEMORY[0x1E4F1CA98] null];

  if (v5 != v6) {
    [v7 mergeWith:v5];
  }
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [(ICCRTuple *)self contents];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) deltaSince:v6 in:v7];
        if (v14)
        {
          [v8 addObject:v14];
        }
        else
        {
          v15 = [MEMORY[0x1E4F1CA98] null];
          [v8 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  v16 = [[ICCRTuple alloc] initWithArray:v8];
  return v16;
}

- (void)walkGraph:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(ICCRTuple *)self contents];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(ICCRTuple *)self contents];
    uint64_t v6 = [v4 contents];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(ICCRTuple *)self contents];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)objectAtIndex:(unint64_t)a3
{
  id v4 = [(ICCRTuple *)self contents];
  uint64_t v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  id v4 = [(ICCRTuple *)self contents];
  uint64_t v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (unint64_t)count
{
  v2 = [(ICCRTuple *)self contents];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSString)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(ICCRTuple *)self count])
  {
    unint64_t v3 = (void *)MEMORY[0x1E4F28E78];
    id v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    uint64_t v6 = objc_msgSend(v3, "stringWithFormat:", @"<%@ %p (\n"), v5, self;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    char v7 = [(ICCRTuple *)self contents];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          [v6 appendFormat:@"  %@,\n", *(void *)(*((void *)&v16 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v6 replaceCharactersInRange:objc_msgSend(v6, "length") - 2, 2, @">" withString]);
  }
  else
  {
    long long v12 = NSString;
    long long v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    uint64_t v6 = [v12 stringWithFormat:@"<%@ %p>", v14, self];
  }
  return (NSString *)v6;
}

- (NSArray)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end