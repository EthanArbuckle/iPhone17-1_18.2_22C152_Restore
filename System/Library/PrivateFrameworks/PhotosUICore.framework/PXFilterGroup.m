@interface PXFilterGroup
+ (id)groupWithName:(id)a3 filterIdentifiers:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)filterIdentifiers;
- (NSString)name;
- (PXFilterGroup)init;
- (PXFilterGroup)initWithName:(id)a3 filterIdentifiers:(id)a4;
- (unint64_t)hash;
@end

@implementation PXFilterGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterIdentifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSArray)filterIdentifiers
{
  return self->_filterIdentifiers;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (PXFilterGroup *)a3;
  v6 = v5;
  if (v5)
  {
    if (self == v5)
    {
      char v14 = 1;
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      v8 = [(PXFilterGroup *)self name];
      if (!v8)
      {
        v3 = [(PXFilterGroup *)v7 name];
        if (!v3) {
          goto LABEL_8;
        }
      }
      v9 = [(PXFilterGroup *)self name];
      v10 = [(PXFilterGroup *)v7 name];
      int v11 = [v9 isEqualToString:v10];

      if (v8)
      {

        if (v11)
        {
LABEL_8:
          v12 = [(PXFilterGroup *)self filterIdentifiers];
          v13 = [(PXFilterGroup *)v7 filterIdentifiers];
          char v14 = [v12 isEqual:v13];

LABEL_13:
          goto LABEL_14;
        }
      }
      else
      {

        if (v11) {
          goto LABEL_8;
        }
      }
      char v14 = 0;
      goto LABEL_13;
    }
  }
  char v14 = 0;
LABEL_14:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(PXFilterGroup *)self filterIdentifiers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 ^= [*(id *)(*((void *)&v12 + 1) + 8 * i) hash];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  v9 = [(PXFilterGroup *)self name];
  uint64_t v10 = [v9 hash];

  return v10 ^ v6;
}

- (PXFilterGroup)initWithName:(id)a3 filterIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXFilterGroup.m", 26, @"Invalid parameter not satisfying: %@", @"filterIdentifiers" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)PXFilterGroup;
  v9 = [(PXFilterGroup *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    name = v9->_name;
    v9->_name = (NSString *)v10;

    uint64_t v12 = [v8 copy];
    filterIdentifiers = v9->_filterIdentifiers;
    v9->_filterIdentifiers = (NSArray *)v12;
  }
  return v9;
}

- (PXFilterGroup)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFilterGroup.m", 22, @"%s is not available as initializer", "-[PXFilterGroup init]");

  abort();
}

+ (id)groupWithName:(id)a3 filterIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithName:v7 filterIdentifiers:v6];

  return v8;
}

@end