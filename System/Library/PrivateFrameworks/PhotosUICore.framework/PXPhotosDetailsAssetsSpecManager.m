@interface PXPhotosDetailsAssetsSpecManager
- (Class)specClass;
- (PXPhotosDetailsAssetsSpecManager)initWithExtendedTraitCollection:(id)a3 detailsOptions:(unint64_t)a4;
- (PXPhotosDetailsAssetsSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXPhotosDetailsAssetsSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 detailsOptions:(unint64_t)a5;
- (id)createSpec;
- (unint64_t)detailsOptions;
@end

@implementation PXPhotosDetailsAssetsSpecManager

- (unint64_t)detailsOptions
{
  return self->_detailsOptions;
}

- (id)createSpec
{
  v3 = [(PXFeatureSpecManager *)self extendedTraitCollection];
  v4 = [[PXPhotosDetailsAssetsSpec alloc] initWithExtendedTraitCollection:v3 detailsOptions:[(PXPhotosDetailsAssetsSpecManager *)self detailsOptions]];

  return v4;
}

- (PXPhotosDetailsAssetsSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 detailsOptions:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotosDetailsAssetsSpecManager;
  result = [(PXFeatureSpecManager *)&v7 initWithExtendedTraitCollection:a3 options:a4];
  if (result) {
    result->_detailsOptions = a5;
  }
  return result;
}

- (PXPhotosDetailsAssetsSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PXPhotosDetailsAssetsSpecManager *)self initWithExtendedTraitCollection:a3 options:a4 detailsOptions:0];
}

- (PXPhotosDetailsAssetsSpecManager)initWithExtendedTraitCollection:(id)a3 detailsOptions:(unint64_t)a4
{
  return [(PXPhotosDetailsAssetsSpecManager *)self initWithExtendedTraitCollection:a3 options:0 detailsOptions:a4];
}

- (Class)specClass
{
  return (Class)objc_opt_class();
}

@end