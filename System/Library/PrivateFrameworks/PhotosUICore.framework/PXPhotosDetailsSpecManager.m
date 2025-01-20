@interface PXPhotosDetailsSpecManager
- (PXPhotosDetailsSpecManager)initWithExtendedTraitCollection:(id)a3 detailsOptions:(unint64_t)a4;
- (PXPhotosDetailsSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXPhotosDetailsSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 detailsOptions:(unint64_t)a5;
- (id)createSpec;
- (unint64_t)detailsOptions;
@end

@implementation PXPhotosDetailsSpecManager

- (unint64_t)detailsOptions
{
  return self->_detailsOptions;
}

- (id)createSpec
{
  v3 = [(PXFeatureSpecManager *)self extendedTraitCollection];
  v4 = [[PXPhotosDetailsSpec alloc] initWithExtendedTraitCollection:v3 options:[(PXFeatureSpecManager *)self options] detailsOptions:[(PXPhotosDetailsSpecManager *)self detailsOptions]];

  return v4;
}

- (PXPhotosDetailsSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 detailsOptions:(unint64_t)a5
{
  self->_detailsOptions = a5;
  v6.receiver = self;
  v6.super_class = (Class)PXPhotosDetailsSpecManager;
  return [(PXFeatureSpecManager *)&v6 initWithExtendedTraitCollection:a3 options:a4];
}

- (PXPhotosDetailsSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PXPhotosDetailsSpecManager *)self initWithExtendedTraitCollection:a3 options:a4 detailsOptions:0];
}

- (PXPhotosDetailsSpecManager)initWithExtendedTraitCollection:(id)a3 detailsOptions:(unint64_t)a4
{
  return [(PXPhotosDetailsSpecManager *)self initWithExtendedTraitCollection:a3 options:0 detailsOptions:a4];
}

@end