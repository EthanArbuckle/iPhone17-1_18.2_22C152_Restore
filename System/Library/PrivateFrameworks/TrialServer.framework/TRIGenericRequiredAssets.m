@interface TRIGenericRequiredAssets
+ (id)assetsWithCloudKit:(id)a3 mobileAsset:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAssets:(id)a3;
- (NSArray)cloudKit;
- (NSArray)mobileAsset;
- (TRIGenericRequiredAssets)initWithCloudKit:(id)a3 mobileAsset:(id)a4;
- (id)copyWithReplacementCloudKit:(id)a3;
- (id)copyWithReplacementMobileAsset:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRIGenericRequiredAssets

- (TRIGenericRequiredAssets)initWithCloudKit:(id)a3 mobileAsset:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 3535, @"Invalid parameter not satisfying: %@", @"cloudKit != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 3536, @"Invalid parameter not satisfying: %@", @"mobileAsset != nil" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIGenericRequiredAssets;
  v11 = [(TRIGenericRequiredAssets *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cloudKit, a3);
    objc_storeStrong((id *)&v12->_mobileAsset, a4);
  }

  return v12;
}

+ (id)assetsWithCloudKit:(id)a3 mobileAsset:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithCloudKit:v7 mobileAsset:v6];

  return v8;
}

- (id)copyWithReplacementCloudKit:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCloudKit:v4 mobileAsset:self->_mobileAsset];

  return v5;
}

- (id)copyWithReplacementMobileAsset:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCloudKit:self->_cloudKit mobileAsset:v4];

  return v5;
}

- (BOOL)isEqualToAssets:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  int v6 = self->_cloudKit != 0;
  id v7 = [v4 cloudKit];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_8;
  }
  cloudKit = self->_cloudKit;
  if (cloudKit)
  {
    v10 = [v5 cloudKit];
    int v11 = [(NSArray *)cloudKit isEqual:v10];

    if (!v11) {
      goto LABEL_8;
    }
  }
  int v12 = self->_mobileAsset != 0;
  v13 = [v5 mobileAsset];
  int v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    char v17 = 0;
  }
  else
  {
    mobileAsset = self->_mobileAsset;
    if (mobileAsset)
    {
      objc_super v16 = [v5 mobileAsset];
      char v17 = [(NSArray *)mobileAsset isEqual:v16];
    }
    else
    {
      char v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIGenericRequiredAssets *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIGenericRequiredAssets *)self isEqualToAssets:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_cloudKit hash];
  return [(NSArray *)self->_mobileAsset hash] - v3 + 32 * v3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIGenericRequiredAssets | cloudKit:%@ mobileAsset:%@>", self->_cloudKit, self->_mobileAsset];
  return v2;
}

- (NSArray)cloudKit
{
  return self->_cloudKit;
}

- (NSArray)mobileAsset
{
  return self->_mobileAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAsset, 0);
  objc_storeStrong((id *)&self->_cloudKit, 0);
}

@end