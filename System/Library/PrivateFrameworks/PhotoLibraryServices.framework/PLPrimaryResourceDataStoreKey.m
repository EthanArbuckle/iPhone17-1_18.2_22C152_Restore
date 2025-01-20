@interface PLPrimaryResourceDataStoreKey
+ (id)fileURLForPayloadKeyData:(unint64_t)a3 assetID:(id)a4;
+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3;
+ (unsigned)strategyFromExternalResource:(id)a3 asset:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToKey:(id)a3;
- (PLPrimaryResourceDataStoreKey)initWithKeyStruct:(const void *)a3;
- (id)_init;
- (id)_initFromExistingLocationOfExternalResource:(id)a3 asset:(id)a4;
- (id)_initWithKeyStruct:(const void *)a3;
- (id)descriptionForAssetID:(id)a3;
- (id)fileURLForAssetID:(id)a3;
- (id)initFromExistingLocationOfExternalResource:(id)a3 asset:(id)a4;
- (id)keyData;
- (id)uniformTypeIdentifier;
- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4;
@end

@implementation PLPrimaryResourceDataStoreKey

- (id)descriptionForAssetID:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [(PLPrimaryResourceDataStoreKey *)self fileURLForAssetID:v5];

  v9 = [v4 stringWithFormat:@"<%@>, fileURL: %@", v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PLPrimaryResourceDataStoreKey *)a3;
  if (v4 == self) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = (objc_opt_respondsToSelector() & 1) != 0
  }
      && [(PLPrimaryResourceDataStoreKey *)self isEqualToKey:v4];

  return v5;
}

- (BOOL)isEqualToKey:(id)a3
{
  return PLResourceDataStoreKeyIsEqual(self, a3);
}

- (id)initFromExistingLocationOfExternalResource:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(id)objc_opt_class() strategyFromExternalResource:v6 asset:v7];
  if (v8 == 3 || v8 == 4 || v8 == 16) {
    id v9 = (id)objc_opt_class();
  }
  else {
    id v9 = 0;
  }
  v10 = (void *)[objc_alloc((Class)v9) initFromExistingLocationOfExternalResource:v6 asset:v7];

  return v10;
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)_initFromExistingLocationOfExternalResource:(id)a3 asset:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PLPrimaryResourceDataStoreKey;
  id v7 = [(PLPrimaryResourceDataStoreKey *)&v11 init];
  if (v7)
  {
    if (a4)
    {
      if (a3) {
        return v7;
      }
    }
    else
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v7, @"PLPrimaryResourceDataStoreKey.m", 128, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

      if (a3) {
        return v7;
      }
    }
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, v7, @"PLPrimaryResourceDataStoreKey.m", 129, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];
  }
  return v7;
}

- (id)_initWithKeyStruct:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLPrimaryResourceDataStoreKey;
  BOOL v5 = [(PLPrimaryResourceDataStoreKey *)&v9 init];
  id v6 = v5;
  if (!a3 && v5)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, v6, @"PLPrimaryResourceDataStoreKey.m", 120, @"Invalid parameter not satisfying: %@", @"keyStruct" object file lineNumber description];
  }
  return v6;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PLPrimaryResourceDataStoreKey;
  return [(PLPrimaryResourceDataStoreKey *)&v3 init];
}

- (id)uniformTypeIdentifier
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Subclasses must override %@", v4 format];

  return 0;
}

- (id)fileURLForAssetID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  BOOL v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Subclasses must override %@", v5 format];

  return 0;
}

- (id)keyData
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Subclasses must override %@", v4 format];

  return 0;
}

- (PLPrimaryResourceDataStoreKey)initWithKeyStruct:(const void *)a3
{
  unsigned int v5 = *(unsigned __int8 *)a3;
  if (v5 >= 0x10) {
    unsigned int v5 = 16;
  }
  if (v5 == 3 || v5 == 4 || v5 == 16) {
    id v6 = (id)objc_opt_class();
  }
  else {
    id v6 = 0;
  }
  id v7 = (PLPrimaryResourceDataStoreKey *)[objc_alloc((Class)v6) initWithKeyStruct:a3];

  return v7;
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  unsigned int v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Subclasses must override %@", v5 format];

  return 0;
}

+ (unsigned)strategyFromExternalResource:(id)a3 asset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = v8;
  if (!v7)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PLPrimaryResourceDataStoreKey.m", 137, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PLPrimaryResourceDataStoreKey.m", 138, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:

  return 3;
}

+ (id)fileURLForPayloadKeyData:(unint64_t)a3 assetID:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  id v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Subclasses must override %@", v6 format];

  return 0;
}

@end