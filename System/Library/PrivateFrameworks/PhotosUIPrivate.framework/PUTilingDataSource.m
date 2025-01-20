@interface PUTilingDataSource
- (BOOL)isEqual:(id)a3;
- (NSHashTable)_changeObservers;
- (NSString)identifier;
- (PUTilingDataSource)init;
- (id)description;
- (int64_t)numberOfSubItemsAtIndexPath:(id)a3;
- (unint64_t)hash;
- (void)enumerateIndexPathsStartingAtIndexPath:(id)a3 reverseDirection:(BOOL)a4 usingBlock:(id)a5;
- (void)setIdentifier:(id)a3;
@end

@implementation PUTilingDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__changeObservers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSHashTable)_changeObservers
{
  return self->__changeObservers;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)enumerateIndexPathsStartingAtIndexPath:(id)a3 reverseDirection:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v28 = a4;
  id v7 = a3;
  v8 = (void (**)(id, void *, unsigned char *))a5;
  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PUTilingDataSource.m", 54, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"PUTilingDataSource.m", 55, @"Invalid parameter not satisfying: %@", @"startIndexPath != nil" object file lineNumber description];

LABEL_3:
  if ((unint64_t)[v7 length] <= 1)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PUTilingDataSource.m", 56, @"Invalid parameter not satisfying: %@", @"[startIndexPath length] >= 2" object file lineNumber description];
  }
  if (v28) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = 1;
  }
  uint64_t v10 = [v7 length];
  uint64_t v11 = v10 - 1;
  uint64_t v12 = [v7 indexAtPosition:v10 - 2];
  v13 = [v7 indexPathByRemovingLastIndex];
  v14 = [v13 indexPathByRemovingLastIndex];

  v26 = v7;
  int64_t v27 = [(PUTilingDataSource *)self numberOfSubItemsAtIndexPath:v14];
  uint64_t v15 = [v7 indexAtPosition:v11];
  char v30 = 0;
  if ((v12 & 0x8000000000000000) == 0)
  {
    uint64_t v16 = v15;
    uint64_t v17 = v12;
    do
    {
      if (v17 >= v27 || v30) {
        break;
      }
      v18 = [v14 indexPathByAddingIndex:v17];
      int64_t v19 = [(PUTilingDataSource *)self numberOfSubItemsAtIndexPath:v18];
      uint64_t v20 = v19 - 1;
      if (!v28) {
        uint64_t v20 = 0;
      }
      if (v17 != v12) {
        uint64_t v16 = v20;
      }
      if ((v16 & 0x8000000000000000) == 0)
      {
        int64_t v21 = v19;
        do
        {
          if (v16 >= v21) {
            break;
          }
          if (v30) {
            break;
          }
          v22 = [v18 indexPathByAddingIndex:v16];
          v8[2](v8, v22, &v30);

          v16 += v9;
        }
        while (v16 >= 0);
      }

      v17 += v9;
    }
    while (v17 >= 0);
  }
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PUTilingDataSource;
  v3 = [(PUTilingDataSource *)&v7 description];
  v4 = [(PUTilingDataSource *)self identifier];
  v5 = [v3 stringByAppendingFormat:@" identifier=%@", v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 identifier];
    v6 = [(PUTilingDataSource *)self identifier];
    char v7 = [v6 isEqual:v5];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(PUTilingDataSource *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PUTilingDataSource.m" lineNumber:28 description:@"concrete subclass must implement"];

  return 0;
}

- (PUTilingDataSource)init
{
  v12.receiver = self;
  v12.super_class = (Class)PUTilingDataSource;
  v2 = [(PUTilingDataSource *)&v12 init];
  if (v2)
  {
    unint64_t v3 = NSString;
    id v4 = [(id)objc_opt_class() description];
    v5 = [MEMORY[0x1E4F29128] UUID];
    v6 = [v5 UUIDString];
    uint64_t v7 = [v3 stringWithFormat:@"%@-%@", v4, v6];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    changeObservers = v2->__changeObservers;
    v2->__changeObservers = (NSHashTable *)v9;
  }
  return v2;
}

@end