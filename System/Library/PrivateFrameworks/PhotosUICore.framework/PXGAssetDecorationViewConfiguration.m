@interface PXGAssetDecorationViewConfiguration
- (BOOL)isEqual:(id)a3;
- (PXOperationStatus)loadStatus;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setLoadStatus:(id)a3;
@end

@implementation PXGAssetDecorationViewConfiguration

- (void).cxx_destruct
{
}

- (void)setLoadStatus:(id)a3
{
}

- (PXOperationStatus)loadStatus
{
  return self->_loadStatus;
}

- (unint64_t)hash
{
  v2 = [(PXGAssetDecorationViewConfiguration *)self loadStatus];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXGAssetDecorationViewConfiguration *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PXGAssetDecorationViewConfiguration *)self loadStatus];
      v7 = [(PXGAssetDecorationViewConfiguration *)v5 loadStatus];
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
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(PXGAssetDecorationViewConfiguration *)self loadStatus];
  [v4 setLoadStatus:v5];

  return v4;
}

@end