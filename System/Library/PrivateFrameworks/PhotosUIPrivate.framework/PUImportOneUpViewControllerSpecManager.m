@interface PUImportOneUpViewControllerSpecManager
- (Class)specClass;
- (PUImportOneUpViewControllerSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PUImportOneUpViewControllerSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 style:(unint64_t)a5;
- (id)createSpec;
- (unint64_t)style;
@end

@implementation PUImportOneUpViewControllerSpecManager

- (unint64_t)style
{
  return self->_style;
}

- (id)createSpec
{
  v3 = [(PXFeatureSpecManager *)self extendedTraitCollection];
  v4 = [[PUImportOneUpViewControllerSpec alloc] initWithExtendedTraitCollection:v3 options:[(PXFeatureSpecManager *)self options] style:[(PUImportOneUpViewControllerSpecManager *)self style]];

  return v4;
}

- (Class)specClass
{
  return (Class)objc_opt_class();
}

- (PUImportOneUpViewControllerSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 style:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PUImportOneUpViewControllerSpecManager;
  result = [(PXFeatureSpecManager *)&v7 initWithExtendedTraitCollection:a3 options:a4];
  if (result) {
    result->_style = a5;
  }
  return result;
}

- (PUImportOneUpViewControllerSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PUImportOneUpViewControllerSpecManager *)self initWithExtendedTraitCollection:a3 options:a4 style:0];
}

@end