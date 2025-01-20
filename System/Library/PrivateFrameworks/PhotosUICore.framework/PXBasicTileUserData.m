@interface PXBasicTileUserData
+ (PXBasicTileUserData)userDataWithViewSpec:(id)a3;
- (BOOL)isEqual:(id)a3;
- (PXBasicTileUserData)init;
- (PXViewSpec)viewSpec;
- (id)_initWithViewSpec:(id)a3;
- (unint64_t)hash;
@end

@implementation PXBasicTileUserData

- (void).cxx_destruct
{
}

- (PXViewSpec)viewSpec
{
  return self->_viewSpec;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(PXBasicTileUserData *)self viewSpec];
    v7 = [v5 viewSpec];
    if (v6 == v7) {
      char v8 = 1;
    }
    else {
      char v8 = [v6 isEqual:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(PXBasicTileUserData *)self viewSpec];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)_initWithViewSpec:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXBasicTileUserData;
  v6 = [(PXBasicTileUserData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewSpec, a3);
  }

  return v7;
}

- (PXBasicTileUserData)init
{
  return (PXBasicTileUserData *)[(PXBasicTileUserData *)self _initWithViewSpec:0];
}

+ (PXBasicTileUserData)userDataWithViewSpec:(id)a3
{
  id v3 = a3;
  id v4 = [[PXBasicTileUserData alloc] _initWithViewSpec:v3];

  return (PXBasicTileUserData *)v4;
}

@end