@interface PXCMMSpecManager
- (PXCMMSpecManager)initWithExtendedTraitCollection:(id)a3 activityType:(unint64_t)a4;
- (PXCMMSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXCMMSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 activityType:(unint64_t)a5;
- (id)createSpec;
- (unint64_t)activityType;
@end

@implementation PXCMMSpecManager

- (unint64_t)activityType
{
  return self->_activityType;
}

- (id)createSpec
{
  v3 = [(PXFeatureSpecManager *)self extendedTraitCollection];
  v4 = [[PXCMMSpec alloc] initWithExtendedTraitCollection:v3 options:[(PXFeatureSpecManager *)self options] activityType:[(PXCMMSpecManager *)self activityType]];

  return v4;
}

- (PXCMMSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 activityType:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)PXCMMSpecManager;
  result = [(PXFeatureSpecManager *)&v7 initWithExtendedTraitCollection:a3 options:a4];
  if (result) {
    result->_activityType = a5;
  }
  return result;
}

- (PXCMMSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PXCMMSpecManager *)self initWithExtendedTraitCollection:a3 options:a4 activityType:0];
}

- (PXCMMSpecManager)initWithExtendedTraitCollection:(id)a3 activityType:(unint64_t)a4
{
  return [(PXCMMSpecManager *)self initWithExtendedTraitCollection:a3 options:0 activityType:a4];
}

@end