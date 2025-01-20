@interface PXZoomablePhotosLayoutSpecManager
- (BOOL)forceSaliency;
- (BOOL)shouldUpdateSpecForExtendedTraitCollection:(id)a3 change:(unint64_t)a4;
- (Class)specClass;
- (NSArray)availableThumbnailSizes;
- (PXZoomablePhotosLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXZoomablePhotosUserDefaults)userDefaults;
- (UIEdgeInsets)additionalAspectFitEdgeMargins;
- (double)itemAspectRatio;
- (id)createSpec;
- (int64_t)gridStyle;
- (int64_t)overrideDefaultNumberOfColumns;
- (int64_t)preferredUserInterfaceStyle;
- (void)setAdditionalAspectFitEdgeMargins:(UIEdgeInsets)a3;
- (void)setAvailableThumbnailSizes:(id)a3;
- (void)setForceSaliency:(BOOL)a3;
- (void)setGridStyle:(int64_t)a3;
- (void)setItemAspectRatio:(double)a3;
- (void)setOverrideDefaultNumberOfColumns:(int64_t)a3;
- (void)setPreferredUserInterfaceStyle:(int64_t)a3;
- (void)setPreferredUserInterfaceStyleForInlineAddButton:(int64_t)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation PXZoomablePhotosLayoutSpecManager

- (id)createSpec
{
  v3 = [PXZoomablePhotosLayoutSpec alloc];
  v4 = [(PXFeatureSpecManager *)self extendedTraitCollection];
  unint64_t v5 = [(PXFeatureSpecManager *)self options];
  v6 = [(PXZoomablePhotosLayoutSpecManager *)self availableThumbnailSizes];
  int64_t v7 = [(PXZoomablePhotosLayoutSpecManager *)self gridStyle];
  [(PXZoomablePhotosLayoutSpecManager *)self itemAspectRatio];
  double v9 = v8;
  v10 = [(PXZoomablePhotosLayoutSpecManager *)self userDefaults];
  BOOL v11 = [(PXZoomablePhotosLayoutSpecManager *)self forceSaliency];
  int64_t v12 = [(PXZoomablePhotosLayoutSpecManager *)self preferredUserInterfaceStyle];
  [(PXZoomablePhotosLayoutSpecManager *)self additionalAspectFitEdgeMargins];
  v17 = -[PXZoomablePhotosLayoutSpec initWithExtendedTraitCollection:options:availableThumbnailSizes:gridStyle:itemAspectRatio:userDefaults:forceSaliency:preferredUserInterfaceStyle:additionalAspectFitEdgeMargins:overrideDefaultNumberOfColumns:](v3, "initWithExtendedTraitCollection:options:availableThumbnailSizes:gridStyle:itemAspectRatio:userDefaults:forceSaliency:preferredUserInterfaceStyle:additionalAspectFitEdgeMargins:overrideDefaultNumberOfColumns:", v4, v5, v6, v7, v10, v11, v9, v13, v14, v15, v16, v12, [(PXZoomablePhotosLayoutSpecManager *)self overrideDefaultNumberOfColumns]);

  return v17;
}

- (PXZoomablePhotosUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (BOOL)shouldUpdateSpecForExtendedTraitCollection:(id)a3 change:(unint64_t)a4
{
  __int16 v4 = a4;
  id v5 = a3;
  v6 = v5;
  BOOL v7 = (v4 & 0x10) != 0 && [v5 layoutSizeClass] == 2 || (v4 & 0xBC12) != 0;

  return v7;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (int64_t)overrideDefaultNumberOfColumns
{
  return self->_overrideDefaultNumberOfColumns;
}

- (double)itemAspectRatio
{
  return self->_itemAspectRatio;
}

- (int64_t)gridStyle
{
  return self->_gridStyle;
}

- (BOOL)forceSaliency
{
  return self->_forceSaliency;
}

- (NSArray)availableThumbnailSizes
{
  return self->_availableThumbnailSizes;
}

- (UIEdgeInsets)additionalAspectFitEdgeMargins
{
  double top = self->_additionalAspectFitEdgeMargins.top;
  double left = self->_additionalAspectFitEdgeMargins.left;
  double bottom = self->_additionalAspectFitEdgeMargins.bottom;
  double right = self->_additionalAspectFitEdgeMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

uint64_t __64__PXZoomablePhotosLayoutSpecManager_setAvailableThumbnailSizes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  __int16 v4 = NSNumber;
  id v5 = a3;
  [a2 CGSizeValue];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  BOOL v7 = NSNumber;
  [v5 CGSizeValue];
  double v9 = v8;

  v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (void)setUserDefaults:(id)a3
{
  id v5 = (PXZoomablePhotosUserDefaults *)a3;
  if (self->_userDefaults != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_userDefaults, a3);
    [(PXFeatureSpecManager *)self invalidateSpec];
    id v5 = v6;
  }
}

- (void)setOverrideDefaultNumberOfColumns:(int64_t)a3
{
  self->_overrideDefaultNumberOfColumns = a3;
}

- (void)setGridStyle:(int64_t)a3
{
  if (self->_gridStyle != a3)
  {
    self->_gridStyle = a3;
    [(PXFeatureSpecManager *)self invalidateSpec];
  }
}

- (void)setAvailableThumbnailSizes:(id)a3
{
  obj = [a3 sortedArrayUsingComparator:&__block_literal_global_119373];
  __int16 v4 = self->_availableThumbnailSizes;
  if (v4 == obj)
  {
  }
  else
  {
    char v5 = [(NSArray *)v4 isEqual:obj];

    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_availableThumbnailSizes, obj);
      [(PXFeatureSpecManager *)self invalidateSpec];
    }
  }
}

- (PXZoomablePhotosLayoutSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PXZoomablePhotosLayoutSpecManager;
  UIEdgeInsets result = [(PXFeatureSpecManager *)&v5 initWithExtendedTraitCollection:a3 options:a4];
  if (result) {
    result->_itemAspectRatio = 1.0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableThumbnailSizes, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)setPreferredUserInterfaceStyle:(int64_t)a3
{
  self->_preferredUserInterfaceStyle = a3;
}

- (void)setAdditionalAspectFitEdgeMargins:(UIEdgeInsets)a3
{
}

- (void)setForceSaliency:(BOOL)a3
{
  if (self->_forceSaliency != a3)
  {
    self->_forceSaliency = a3;
    [(PXFeatureSpecManager *)self invalidateSpec];
  }
}

- (void)setItemAspectRatio:(double)a3
{
  if (self->_itemAspectRatio != a3)
  {
    self->_itemAspectRatio = a3;
    [(PXFeatureSpecManager *)self invalidateSpec];
  }
}

- (void)setPreferredUserInterfaceStyleForInlineAddButton:(int64_t)a3
{
  if (self->_preferredUserInterfaceStyle != a3)
  {
    self->_preferredUserInterfaceStyle = a3;
    [(PXFeatureSpecManager *)self invalidateSpec];
  }
}

- (Class)specClass
{
  return (Class)objc_opt_class();
}

@end