@interface PXPhotosDetailsActionsSpec
- (BOOL)shouldInsetAllSeparators;
- (BOOL)shouldShowSeparators;
- (PXPhotosDetailsActionsSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
@end

@implementation PXPhotosDetailsActionsSpec

- (BOOL)shouldInsetAllSeparators
{
  return self->_shouldInsetAllSeparators;
}

- (BOOL)shouldShowSeparators
{
  return self->_shouldShowSeparators;
}

- (PXPhotosDetailsActionsSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotosDetailsActionsSpec;
  v4 = [(PXFeatureSpec *)&v7 initWithExtendedTraitCollection:a3 options:a4];
  v5 = v4;
  if (v4)
  {
    v4->_shouldShowSeparators = 0;
    v4->_shouldInsetAllSeparators = [(PXFeatureSpec *)v4 shouldInsetAllPhotoDetailsContent];
  }
  return v5;
}

@end