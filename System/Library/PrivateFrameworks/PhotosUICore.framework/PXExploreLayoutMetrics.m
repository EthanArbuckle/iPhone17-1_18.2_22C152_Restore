@interface PXExploreLayoutMetrics
- (BOOL)allowHeaders;
- (BOOL)allowSpecialPanoHeaders;
- (NSString)diagnosticDescription;
- (PXExploreLayoutMetrics)init;
- (PXExploreLayoutMetrics)initWithExtendedTraitCollection:(id)a3;
- (PXExploreLayoutMetrics)initWithSpec:(id)a3;
- (PXExploreLayoutMetrics)initWithUserInterfaceIdiom:(int64_t)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5 referenceSize:(CGSize)a6 safeAreaInsets:(UIEdgeInsets)a7;
- (UIEdgeInsets)padding;
- (UIEdgeInsets)safeAreaInsets;
- (double)buildingBlockAspectRatio;
- (double)interitemSpacing;
- (double)preferredFullWidthHeaderAspectRatio;
- (id)acceptableLargeHeroPredicate;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)largeHeroDensity;
- (int64_t)layoutSubtype;
- (int64_t)layoutType;
- (int64_t)reorderingTolerance;
- (void)setAcceptableLargeHeroPredicate:(id)a3;
- (void)setAllowHeaders:(BOOL)a3;
- (void)setAllowSpecialPanoHeaders:(BOOL)a3;
- (void)setBuildingBlockAspectRatio:(double)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setLargeHeroDensity:(int64_t)a3;
- (void)setLayoutSubtype:(int64_t)a3;
- (void)setLayoutType:(int64_t)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setPreferredFullWidthHeaderAspectRatio:(double)a3;
- (void)setReorderingTolerance:(int64_t)a3;
- (void)setSafeAreaInsets:(UIEdgeInsets)a3;
@end

@implementation PXExploreLayoutMetrics

- (void).cxx_destruct
{
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPreferredFullWidthHeaderAspectRatio:(double)a3
{
  self->_preferredFullWidthHeaderAspectRatio = a3;
}

- (double)preferredFullWidthHeaderAspectRatio
{
  return self->_preferredFullWidthHeaderAspectRatio;
}

- (void)setBuildingBlockAspectRatio:(double)a3
{
  self->_buildingBlockAspectRatio = a3;
}

- (double)buildingBlockAspectRatio
{
  return self->_buildingBlockAspectRatio;
}

- (void)setAllowSpecialPanoHeaders:(BOOL)a3
{
  self->_allowSpecialPanoHeaders = a3;
}

- (BOOL)allowSpecialPanoHeaders
{
  return self->_allowSpecialPanoHeaders;
}

- (void)setAllowHeaders:(BOOL)a3
{
  self->_allowHeaders = a3;
}

- (BOOL)allowHeaders
{
  return self->_allowHeaders;
}

- (void)setAcceptableLargeHeroPredicate:(id)a3
{
}

- (id)acceptableLargeHeroPredicate
{
  return self->_acceptableLargeHeroPredicate;
}

- (void)setLargeHeroDensity:(int64_t)a3
{
  self->_largeHeroDensity = a3;
}

- (int64_t)largeHeroDensity
{
  return self->_largeHeroDensity;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setReorderingTolerance:(int64_t)a3
{
  self->_reorderingTolerance = a3;
}

- (int64_t)reorderingTolerance
{
  return self->_reorderingTolerance;
}

- (void)setLayoutSubtype:(int64_t)a3
{
  self->_layoutSubtype = a3;
}

- (int64_t)layoutSubtype
{
  return self->_layoutSubtype;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_safeAreaInsets = a3;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSString)diagnosticDescription
{
  id v3 = [NSString alloc];
  v12.receiver = self;
  v12.super_class = (Class)PXExploreLayoutMetrics;
  v4 = [(PXLayoutMetrics *)&v12 diagnosticDescription];
  int64_t v5 = [(PXExploreLayoutMetrics *)self layoutType];
  int64_t v6 = [(PXExploreLayoutMetrics *)self layoutSubtype];
  int64_t v7 = [(PXExploreLayoutMetrics *)self reorderingTolerance];
  [(PXExploreLayoutMetrics *)self safeAreaInsets];
  v8 = NSStringFromUIEdgeInsets(v14);
  [(PXExploreLayoutMetrics *)self interitemSpacing];
  v10 = (void *)[v3 initWithFormat:@"%@ type=%li subtype=%li reorderTol=%li safeAreaInsets=%@ interitemSpacing=%f largeHeroDensity=%li allowHeaders=%i allowSpecialPanoHeaders=%i", v4, v5, v6, v7, v8, v9, -[PXExploreLayoutMetrics largeHeroDensity](self, "largeHeroDensity"), -[PXExploreLayoutMetrics allowHeaders](self, "allowHeaders"), -[PXExploreLayoutMetrics allowSpecialPanoHeaders](self, "allowSpecialPanoHeaders")];

  return (NSString *)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PXExploreLayoutMetrics;
  v4 = [(PXLayoutMetrics *)&v11 copyWithZone:a3];
  int64_t v5 = v4;
  if (v4)
  {
    v4[4] = self->_layoutType;
    v4[5] = self->_layoutSubtype;
    v4[6] = self->_reorderingTolerance;
    long long v6 = *(_OWORD *)&self->_safeAreaInsets.bottom;
    *((_OWORD *)v4 + 6) = *(_OWORD *)&self->_safeAreaInsets.top;
    *((_OWORD *)v4 + 7) = v6;
    v4[7] = *(void *)&self->_interitemSpacing;
    v4[8] = self->_largeHeroDensity;
    uint64_t v7 = [self->_acceptableLargeHeroPredicate copy];
    v8 = (void *)v5[9];
    v5[9] = v7;

    *((unsigned char *)v5 + 25) = self->_allowSpecialPanoHeaders;
    *((unsigned char *)v5 + 24) = self->_allowHeaders;
    v5[10] = *(void *)&self->_buildingBlockAspectRatio;
    v5[11] = *(void *)&self->_preferredFullWidthHeaderAspectRatio;
    long long v9 = *(_OWORD *)&self->_padding.bottom;
    *((_OWORD *)v5 + 8) = *(_OWORD *)&self->_padding.top;
    *((_OWORD *)v5 + 9) = v9;
  }
  return v5;
}

- (PXExploreLayoutMetrics)initWithSpec:(id)a3
{
  id v4 = a3;
  if ([v4 userInterfaceIdiom] == 2) {
    uint64_t v5 = [v4 windowOrientation];
  }
  else {
    uint64_t v5 = [v4 layoutOrientation];
  }
  uint64_t v6 = v5;
  uint64_t v7 = [v4 userInterfaceIdiom];
  uint64_t v8 = [v4 sizeClass];
  [v4 layoutReferenceSize];
  double v10 = v9;
  double v12 = v11;
  [v4 safeAreaInsets];
  v17 = -[PXExploreLayoutMetrics initWithUserInterfaceIdiom:sizeClass:orientation:referenceSize:safeAreaInsets:](self, "initWithUserInterfaceIdiom:sizeClass:orientation:referenceSize:safeAreaInsets:", v7, v8, v6, v10, v12, v13, v14, v15, v16);

  return v17;
}

- (PXExploreLayoutMetrics)initWithExtendedTraitCollection:(id)a3
{
  id v4 = a3;
  if ([v4 userInterfaceIdiom] == 2) {
    uint64_t v5 = [v4 windowOrientation];
  }
  else {
    uint64_t v5 = [v4 layoutOrientation];
  }
  uint64_t v6 = v5;
  uint64_t v7 = [v4 userInterfaceIdiom];
  uint64_t v8 = [v4 layoutSizeClass];
  [v4 layoutReferenceSize];
  double v10 = v9;
  double v12 = v11;
  [v4 safeAreaInsets];
  v17 = -[PXExploreLayoutMetrics initWithUserInterfaceIdiom:sizeClass:orientation:referenceSize:safeAreaInsets:](self, "initWithUserInterfaceIdiom:sizeClass:orientation:referenceSize:safeAreaInsets:", v7, v8, v6, v10, v12, v13, v14, v15, v16);

  return v17;
}

- (PXExploreLayoutMetrics)initWithUserInterfaceIdiom:(int64_t)a3 sizeClass:(int64_t)a4 orientation:(int64_t)a5 referenceSize:(CGSize)a6 safeAreaInsets:(UIEdgeInsets)a7
{
  CGFloat right = a7.right;
  CGFloat bottom = a7.bottom;
  CGFloat left = a7.left;
  CGFloat top = a7.top;
  v24.receiver = self;
  v24.super_class = (Class)PXExploreLayoutMetrics;
  double v14 = [(PXExploreLayoutMetrics *)&v24 init];
  double v15 = v14;
  if (v14)
  {
    if (a3 == 4)
    {
      uint64_t v16 = 5;
    }
    else if (a3 == 5)
    {
      uint64_t v16 = 6;
    }
    else if (a4)
    {
      if (a4 == 2)
      {
        BOOL v17 = (unint64_t)a5 >= 2;
        uint64_t v16 = 3;
      }
      else
      {
        if (a4 != 1)
        {
LABEL_15:
          v14->_layoutSubtype = 0;
          v14->_reorderingTolerance = 0;
          v14->_safeAreaInsets.CGFloat top = top;
          v14->_safeAreaInsets.CGFloat left = left;
          v14->_safeAreaInsets.CGFloat bottom = bottom;
          v14->_safeAreaInsets.CGFloat right = right;
          v18 = +[PXCuratedLibrarySettings sharedInstance];
          [v18 interitemSpacingForDays];
          v15->_interitemSpacing = v19;
          v15->_largeHeroDensity = [v18 largeHeroDensity];
          uint64_t v20 = [v18 acceptableLargeHeroPredicate];
          id acceptableLargeHeroPredicate = v15->_acceptableLargeHeroPredicate;
          v15->_id acceptableLargeHeroPredicate = (id)v20;

          [v18 allowSpecialPanoHeaders];
          v15->_allowSpecialPanoHeaders = v22 != 0.0;
          v15->_allowHeaders = 1;
          v15->_buildingBlockAspectRatio = 0.0;
          v15->_preferredFullWidthHeaderAspectRatio = 0.0;

          return v15;
        }
        BOOL v17 = (unint64_t)a5 >= 2;
        uint64_t v16 = 1;
      }
      if (v17) {
        ++v16;
      }
    }
    else
    {
      uint64_t v16 = 1;
    }
    v14->_layoutType = v16;
    goto LABEL_15;
  }
  return v15;
}

- (PXExploreLayoutMetrics)init
{
  return -[PXExploreLayoutMetrics initWithUserInterfaceIdiom:sizeClass:orientation:referenceSize:safeAreaInsets:](self, "initWithUserInterfaceIdiom:sizeClass:orientation:referenceSize:safeAreaInsets:", 0, 0, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
}

@end