@interface PXFeatureSpec
- (BOOL)_shouldUseMiniMargins;
- (BOOL)shouldInsetAllPhotoDetailsContent;
- (CGSize)layoutReferenceSize;
- (NSArray)collectionTileImageOverlaySpecs;
- (NSArray)collectionTileImageOverlaySpecsHighlighted;
- (NSCache)_viewSpecCache;
- (PXExtendedTraitCollection)extendedTraitCollection;
- (PXExtendedTraitCollection)rootExtendedTraitCollection;
- (PXFeatureSpec)init;
- (PXFeatureSpec)initWithExtendedTraitCollection:(id)a3;
- (PXFeatureSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXLayoutMetricInterpolator)_horizontalContentGuideInsetsInterpolator;
- (UIColor)defaultBackgroundColor;
- (UIColor)defaultPlaceholderColor;
- (UIColor)defaultPlacesPlaceholderColor;
- (UIEdgeInsets)_fullscreenContentInsetsForWidth:(double)a3;
- (UIEdgeInsets)contentGuideInsetsForScrollAxis:(int64_t)a3;
- (UIEdgeInsets)curatedLibraryEdgeToEdgeContentDefaultPadding;
- (UIEdgeInsets)layoutMargins;
- (UIEdgeInsets)safeAreaInsets;
- (double)defaultCornerRadius;
- (double)defaultDarkenSourceOverAmount;
- (double)displayScale;
- (double)spacingBetweenMonthCards;
- (double)spacingBetweenYearCards;
- (id)_textAttributesForFontName:(id)a3 fontSize:(double)a4 lineHeight:(double)a5 tracking:(double)a6 stroke:(double)a7;
- (id)collectionTileImageOverlayColor;
- (id)collectionTileImageOverlayColorHighlighted;
- (id)createViewSpecWithDescriptor:(PXViewSpecDescriptor *)a3;
- (id)fullscreenMiroViewSpec;
- (id)fullscreenMiroViewSpecWithBoundingSize:(CGSize)a3;
- (id)viewSpecWithDescriptor:(PXViewSpecDescriptor *)a3;
- (int64_t)_capitalizationStyleFromTextAttributes:(id)a3 defaultCapitalizationStyle:(int64_t)a4;
- (int64_t)contentSizeCategory;
- (int64_t)layoutDirection;
- (int64_t)layoutOrientation;
- (int64_t)localizedLeadingTextAlignment;
- (int64_t)sizeClass;
- (int64_t)sizeSubclass;
- (int64_t)userInterfaceFeature;
- (int64_t)userInterfaceIdiom;
- (int64_t)userInterfaceLevel;
- (int64_t)userInterfaceStyle;
- (int64_t)windowOrientation;
- (unint64_t)options;
- (void)configureViewSpec:(id)a3;
@end

@implementation PXFeatureSpec

- (UIColor)defaultBackgroundColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] systemBackgroundColor];
}

- (int64_t)localizedLeadingTextAlignment
{
  if (localizedLeadingTextAlignment_onceToken != -1) {
    dispatch_once(&localizedLeadingTextAlignment_onceToken, &__block_literal_global_62);
  }
  return localizedLeadingTextAlignment_textAlignment;
}

- (int64_t)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (PXFeatureSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v51.receiver = self;
  v51.super_class = (Class)PXFeatureSpec;
  v8 = [(PXFeatureSpec *)&v51 init];
  if (!v8) {
    goto LABEL_25;
  }
  [v7 displayScale];
  double v10 = v9;
  double v11 = 1.0;
  if (v10 > 0.0) {
    objc_msgSend(v7, "displayScale", 1.0);
  }
  *((double *)v8 + 12) = v11;
  *((void *)v8 + 2) = a4;
  *((void *)v8 + 3) = [v7 layoutSizeClass];
  *((void *)v8 + 4) = [v7 layoutSizeSubclass];
  *((void *)v8 + 5) = [v7 layoutOrientation];
  *((void *)v8 + 6) = [v7 layoutDirection];
  if (v7)
  {
    [v7 layoutReferenceSize];
    *((void *)v8 + 19) = v12;
    *((void *)v8 + 20) = v13;
    [v7 safeAreaInsets];
    *((void *)v8 + 21) = v14;
    *((void *)v8 + 22) = v15;
    *((void *)v8 + 23) = v16;
    *((void *)v8 + 24) = v17;
    [v7 layoutMargins];
    *((void *)v8 + 25) = v18;
    *((void *)v8 + 26) = v19;
    *((void *)v8 + 27) = v20;
    *((void *)v8 + 28) = v21;
  }
  else
  {
    *(_OWORD *)(v8 + 152) = *MEMORY[0x1E4F1DB30];
    long long v22 = *(_OWORD *)off_1E5DAAF10;
    long long v23 = *((_OWORD *)off_1E5DAAF10 + 1);
    *(_OWORD *)(v8 + 168) = *(_OWORD *)off_1E5DAAF10;
    *(_OWORD *)(v8 + 184) = v23;
    *(_OWORD *)(v8 + 200) = v22;
    *(_OWORD *)(v8 + 216) = v23;
  }
  *((void *)v8 + 7) = [v7 userInterfaceIdiom];
  *((void *)v8 + 9) = [v7 userInterfaceStyle];
  *((void *)v8 + 10) = [v7 userInterfaceLevel];
  *((void *)v8 + 11) = [v7 contentSizeCategory];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v25 = (void *)*((void *)v8 + 16);
  *((void *)v8 + 16) = v24;

  *((void *)v8 + 8) = [v7 userInterfaceFeature];
  objc_storeStrong((id *)v8 + 18, a3);
  BOOL v26 = [v7 layoutSizeClass] == 2 || objc_msgSend(v7, "layoutOrientation") == 2;
  v8[8] = v26;
  *((void *)v8 + 13) = [v7 windowOrientation];
  uint64_t v27 = *((void *)v8 + 8);
  if ((unint64_t)(v27 - 3) < 3) {
    goto LABEL_13;
  }
  if (v27 == 6)
  {
    uint64_t v28 = +[PXLayoutMetricInterpolator photosDetailsEdgeInsetsInterpolator];
  }
  else
  {
    if (v27 == 1)
    {
LABEL_13:
      uint64_t v28 = +[PXLayoutMetricInterpolator layoutMarginWidthInterpolator];
      goto LABEL_16;
    }
    uint64_t v28 = +[PXLayoutMetricInterpolator memoriesDetailsEdgeInsetsInterpolator];
  }
LABEL_16:
  v29 = (void *)*((void *)v8 + 17);
  *((void *)v8 + 17) = v28;

  if ((a4 & 1) != 0
    || (+[PXKitSettings sharedInstance],
        v30 = objc_claimAutoreleasedReturnValue(),
        char v31 = [v30 useFancyDarkening],
        v30,
        (v31 & 1) == 0))
  {
    id v32 = objc_alloc_init((Class)off_1E5DA9858);
    v44 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.200000003];
    [v32 setBackgroundColor:v44];

    id v36 = objc_alloc_init((Class)off_1E5DA9858);
    v45 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.400000006];
    [v36 setBackgroundColor:v45];

    v55[0] = v32;
    uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
    v47 = (void *)*((void *)v8 + 14);
    *((void *)v8 + 14) = v46;

    id v54 = v36;
    uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
    id v38 = (id)*((void *)v8 + 15);
    *((void *)v8 + 15) = v48;
  }
  else
  {
    id v32 = objc_alloc_init((Class)off_1E5DA9858);
    v33 = (void *)MEMORY[0x1E4FB1618];
    [v8 defaultDarkenSourceOverAmount];
    v35 = [v33 colorWithWhite:0.0 alpha:v34];
    [v32 setBackgroundColor:v35];

    [v32 setCompositingFilterType:1];
    id v36 = objc_alloc_init((Class)off_1E5DA9858);
    v37 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.100000001];
    [v36 setBackgroundColor:v37];

    id v38 = objc_alloc_init((Class)off_1E5DA9858);
    v39 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.300000012];
    [v38 setBackgroundColor:v39];

    v53[0] = v32;
    v53[1] = v36;
    uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
    v41 = (void *)*((void *)v8 + 14);
    *((void *)v8 + 14) = v40;

    v52[0] = v32;
    v52[1] = v38;
    uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
    v43 = (void *)*((void *)v8 + 15);
    *((void *)v8 + 15) = v42;
  }
  BOOL v49 = [v7 layoutSizeClass] == 1
     && [v7 layoutSizeSubclass] == 1
     && [v7 layoutOrientation] == 1;
  v8[9] = v49;
LABEL_25:

  return (PXFeatureSpec *)v8;
}

- (double)defaultDarkenSourceOverAmount
{
  return 0.15;
}

- (UIEdgeInsets)contentGuideInsetsForScrollAxis:(int64_t)a3
{
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (CGSize)layoutReferenceSize
{
  double width = self->_layoutReferenceSize.width;
  double height = self->_layoutReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
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

- (UIEdgeInsets)layoutMargins
{
  double top = self->_layoutMargins.top;
  double left = self->_layoutMargins.left;
  double bottom = self->_layoutMargins.bottom;
  double right = self->_layoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)_shouldUseMiniMargins
{
  return self->__shouldUseMiniMargins;
}

- (PXLayoutMetricInterpolator)_horizontalContentGuideInsetsInterpolator
{
  return self->__horizontalContentGuideInsetsInterpolator;
}

- (PXFeatureSpec)initWithExtendedTraitCollection:(id)a3
{
  return [(PXFeatureSpec *)self initWithExtendedTraitCollection:a3 options:0];
}

- (UIEdgeInsets)curatedLibraryEdgeToEdgeContentDefaultPadding
{
  int64_t v3 = [(PXFeatureSpec *)self sizeClass];
  double v4 = 20.0;
  double v5 = 20.0;
  if (v3 != 2) {
    [(PXFeatureSpec *)self contentGuideInsetsForScrollAxis:1];
  }
  double v6 = 20.0;
  double v7 = 20.0;
  result.double right = v4;
  result.double bottom = v7;
  result.double left = v5;
  result.double top = v6;
  return result;
}

- (double)spacingBetweenMonthCards
{
  int64_t v3 = [(PXFeatureSpec *)self sizeClass];
  double result = 24.0;
  if (v3 != 2)
  {
    int64_t v5 = [(PXFeatureSpec *)self sizeSubclass];
    int64_t v6 = [(PXFeatureSpec *)self layoutOrientation];
    double result = 12.0;
    if (v5 == 1) {
      double result = 8.0;
    }
    double v7 = 24.0;
    if (v5 == 1) {
      double v7 = 20.0;
    }
    if (v6 != 2) {
      return v7;
    }
  }
  return result;
}

- (int64_t)sizeSubclass
{
  return self->_sizeSubclass;
}

- (int64_t)sizeClass
{
  return self->_sizeClass;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->__horizontalContentGuideInsetsInterpolator, 0);
  objc_storeStrong((id *)&self->__viewSpecCache, 0);
  objc_storeStrong((id *)&self->_collectionTileImageOverlaySpecsHighlighted, 0);
  objc_storeStrong((id *)&self->_collectionTileImageOverlaySpecs, 0);
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (double)spacingBetweenYearCards
{
  if ([(PXFeatureSpec *)self sizeClass] == 2) {
    return 36.0;
  }
  int64_t v4 = [(PXFeatureSpec *)self sizeSubclass];
  unint64_t v5 = [(PXFeatureSpec *)self layoutOrientation];
  double result = 0.0;
  double v6 = 30.0;
  if (v4 == 1) {
    double v6 = 24.0;
  }
  double v7 = 20.0;
  if (v4 == 1) {
    double v7 = 10.0;
  }
  if (v5 == 2) {
    double result = v7;
  }
  if (v5 < 2) {
    return v6;
  }
  return result;
}

uint64_t __46__PXFeatureSpec_localizedLeadingTextAlignment__block_invoke()
{
  uint64_t result = objc_msgSend(MEMORY[0x1E4F1CA20], "px_currentCharacterDirection");
  localizedLeadingTextAlignment_textAlignment = 2 * (result == 2);
  return result;
}

- (NSCache)_viewSpecCache
{
  return self->__viewSpecCache;
}

- (BOOL)shouldInsetAllPhotoDetailsContent
{
  return self->_shouldInsetAllPhotoDetailsContent;
}

- (NSArray)collectionTileImageOverlaySpecsHighlighted
{
  return self->_collectionTileImageOverlaySpecsHighlighted;
}

- (NSArray)collectionTileImageOverlaySpecs
{
  return self->_collectionTileImageOverlaySpecs;
}

- (int64_t)windowOrientation
{
  return self->_windowOrientation;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (int64_t)userInterfaceLevel
{
  return self->_userInterfaceLevel;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (int64_t)userInterfaceFeature
{
  return self->_userInterfaceFeature;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (id)_textAttributesForFontName:(id)a3 fontSize:(double)a4 lineHeight:(double)a5 tracking:(double)a6 stroke:(double)a7
{
  id v11 = a3;
  uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:5];
  if (v11) {
    PXFontCreate();
  }
  uint64_t v13 = [MEMORY[0x1E4FB08E0] systemFontOfSize:a4];
  [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  if (a5 != 0.0)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v14 setMinimumLineHeight:a5];
    [v14 setMaximumLineHeight:a5];
    [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4FB0738]];
  }
  if (a6 != 0.0)
  {
    uint64_t v15 = [NSNumber numberWithDouble:a4 * a6 / 1000.0];
    [v12 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4FB0710]];
  }
  if (a7 > 0.0)
  {
    uint64_t v16 = [NSNumber numberWithDouble:-a7];
    [v12 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4FB0778]];
  }
  return v12;
}

- (int64_t)_capitalizationStyleFromTextAttributes:(id)a3 defaultCapitalizationStyle:(int64_t)a4
{
  unint64_t v5 = [a3 objectForKeyedSubscript:*(void *)off_1E5DAAED0];
  double v6 = v5;
  if (v5) {
    a4 = [v5 integerValue];
  }
  double v7 = +[PXKitSettings sharedInstance];
  int v8 = [v7 allowCapitalization];

  if (!v8) {
    a4 = 0;
  }

  return a4;
}

- (id)collectionTileImageOverlayColorHighlighted
{
  if (self->_userInterfaceIdiom == 3) {
    [(PXFeatureSpec *)self collectionTileImageOverlayColor];
  }
  else {
  v2 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
  }
  return v2;
}

- (id)collectionTileImageOverlayColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.100000001];
}

- (UIColor)defaultPlacesPlaceholderColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] quaternarySystemFillColor];
}

- (UIColor)defaultPlaceholderColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] quaternarySystemFillColor];
}

- (double)defaultCornerRadius
{
  double result = 4.0;
  if (self->_userInterfaceIdiom == 3) {
    return 8.0;
  }
  return result;
}

- (PXExtendedTraitCollection)rootExtendedTraitCollection
{
  v2 = [(PXFeatureSpec *)self extendedTraitCollection];
  int64_t v3 = [v2 rootExtendedTraitCollection];

  return (PXExtendedTraitCollection *)v3;
}

- (id)fullscreenMiroViewSpecWithBoundingSize:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  double v7 = [(PXFeatureSpec *)self extendedTraitCollection];
  v29[0] = 1966;
  v29[1] = (unint64_t)(v7 == 0) << 12;
  *(double *)&v29[2] = width;
  *(CGFloat *)&v29[3] = height;
  int v8 = [(PXFeatureSpec *)self viewSpecWithDescriptor:v29];
  if (!v8)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v21 = (objc_class *)objc_opt_class();
    long long v22 = NSStringFromClass(v21);
    [v20 handleFailureInMethod:a2, self, @"PXFeatureSpec.m", 292, @"%@ should be an instance inheriting from %@, but it is nil", @"[self viewSpecWithDescriptor:descriptor]", v22 object file lineNumber description];
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v23 = (objc_class *)objc_opt_class();
    long long v22 = NSStringFromClass(v23);
    id v24 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v20 handleFailureInMethod:a2, self, @"PXFeatureSpec.m", 292, @"%@ should be an instance inheriting from %@, but it is %@", @"[self viewSpecWithDescriptor:descriptor]", v22, v24 object file lineNumber description];

LABEL_14:
    if (v7) {
      goto LABEL_4;
    }
LABEL_15:
    [(PXFeatureSpec *)self _fullscreenContentInsetsForWidth:width];
    double v18 = v25;
    double v17 = v26;
    double v16 = v27;
    goto LABEL_16;
  }
  if (!v7) {
    goto LABEL_15;
  }
LABEL_4:
  if ([v7 userInterfaceIdiom] == 3) {
    goto LABEL_15;
  }
  double v9 = [v7 traitCollection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_15;
  }
  id v11 = [v7 traitCollection];
  uint64_t v12 = +[PXLayoutMetricInterpolator layoutMarginWidthInterpolator];
  [v7 safeAreaInsets];
  double v14 = v13;
  if ([v11 verticalSizeClass] != 2) {
    PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  }
  [v12 valueForMetric:width];
  double v16 = v15;
  if ([v11 horizontalSizeClass] == 2) {
    double v17 = 80.0;
  }
  else {
    double v17 = v14 + 40.0;
  }
  double v18 = *(double *)off_1E5DAAF10;

  double v19 = v16;
LABEL_16:
  objc_msgSend(v8, "setPadding:", v18, v19, v17, v16);

  return v8;
}

- (id)fullscreenMiroViewSpec
{
  [(PXFeatureSpec *)self layoutReferenceSize];
  return -[PXFeatureSpec fullscreenMiroViewSpecWithBoundingSize:](self, "fullscreenMiroViewSpecWithBoundingSize:");
}

- (UIEdgeInsets)_fullscreenContentInsetsForWidth:(double)a3
{
}

- (id)createViewSpecWithDescriptor:(PXViewSpecDescriptor *)a3
{
  unint64_t v6 = a3->var0 - 1900;
  if (v6 > 0x63)
  {
    if (a3->var0 != 1000)
    {
      id v24 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeatureSpec.m", 268, @"unknown context %li", a3->var0);

      abort();
    }
    int v8 = (PXImageViewSpec *)objc_alloc_init((Class)off_1E5DA9858);
    [(PXFeatureSpec *)self configureViewSpec:v8];
    double v9 = [(PXFeatureSpec *)self defaultPlaceholderColor];
    [(PXViewSpec *)v8 setBackgroundColor:v9];

    [(PXFeatureSpec *)self defaultCornerRadius];
    -[PXViewSpec setCornerRadius:](v8, "setCornerRadius:");
  }
  else
  {
    unsigned int v7 = (LOBYTE(a3->var0) - 108) / 0xFu;
    switch(v7)
    {
      case 0u:
        double v25 = [MEMORY[0x1E4F28B00] currentHandler];
        [v25 handleFailureInMethod:a2 object:self file:@"PXFeatureSpec.m" lineNumber:198 description:@"Code which should be unreachable has been reached"];

        abort();
      case 1u:
        int v8 = objc_alloc_init(PXImageViewSpec);
        [(PXFeatureSpec *)self configureViewSpec:v8];
        if ([(PXFeatureSpec *)self userInterfaceIdiom] == 3) {
          [MEMORY[0x1E4FB1618] clearColor];
        }
        else {
        uint64_t v21 = [(PXFeatureSpec *)self defaultBackgroundColor];
        }
        [(PXViewSpec *)v8 setBackgroundColor:v21];

        if (a3->var1) {
          [(PXFeatureSpec *)self collectionTileImageOverlaySpecsHighlighted];
        }
        else {
        long long v23 = [(PXFeatureSpec *)self collectionTileImageOverlaySpecs];
        }
        [(PXImageViewSpec *)v8 setOverlaySpecs:v23];
        [(PXFeatureSpec *)self collectionTileImageCornerRadius];
        -[PXViewSpec setCornerRadius:](v8, "setCornerRadius:");
        if (self->_userInterfaceIdiom == 5) {
          [(PXImageViewSpec *)v8 setRoundedCornersMode:0];
        }

        break;
      case 2u:
        CGSize var2 = a3->var2;
        long long v30 = *(_OWORD *)&a3->var0;
        CGSize v31 = var2;
        int v8 = [off_1E5DA6FD0 memoriesLabelSpecForLabelKind:0 descriptor:&v30 featureSpec:self];
        goto LABEL_13;
      case 3u:
        CGSize v12 = a3->var2;
        long long v30 = *(_OWORD *)&a3->var0;
        CGSize v31 = v12;
        int v8 = [off_1E5DA6FD0 memoriesLabelSpecForLabelKind:1 descriptor:&v30 featureSpec:self];
        double v13 = [(PXImageViewSpec *)v8 textAttributes];
        [(PXViewSpec *)v8 setHidden:v13 == 0];

LABEL_13:
        if ((a3->var1 & 0x800) != 0)
        {
          if (self->_userInterfaceIdiom == 3) {
            [MEMORY[0x1E4FB1618] colorWithWhite:0.419999987 alpha:1.0];
          }
          else {
          long long v22 = [MEMORY[0x1E4FB1618] blackColor];
          }
          [(PXImageViewSpec *)v8 setTextColor:v22];
        }
        break;
      case 4u:
        CGSize v14 = a3->var2;
        long long v30 = *(_OWORD *)&a3->var0;
        CGSize v31 = v14;
        int v8 = [off_1E5DA9618 memoriesTitleSubtitleSpecForViewSpecDescriptor:&v30 featureSpec:self];
        break;
      case 5u:
        uint64_t v15 = (-15 * v7 + v6) + 1915;
        unint64_t var1 = a3->var1;
        v28[0] = v15;
        v28[1] = var1;
        CGSize v29 = a3->var2;
        double v17 = [(PXFeatureSpec *)self viewSpecWithDescriptor:v28];
        unint64_t v18 = a3->var1;
        uint64_t v19 = 1960;
        if ((unint64_t)(a3->var0 - 1900) < 0x64) {
          uint64_t v19 = (LOBYTE(a3->var0) - 108) % 0xFu + 1960;
        }
        v26[0] = v19;
        v26[1] = v18;
        CGSize v27 = a3->var2;
        uint64_t v20 = [(PXFeatureSpec *)self viewSpecWithDescriptor:v26];
        int v8 = objc_alloc_init(PXImageTitleSubtitleSpec);
        [(PXFeatureSpec *)self configureViewSpec:v8];
        [(PXImageViewSpec *)v8 setTitleSubtitleSpec:v20];
        [(PXImageViewSpec *)v8 setImageSpec:v17];

        break;
      default:
        int v8 = 0;
        break;
    }
  }
  return v8;
}

- (void)configureViewSpec:(id)a3
{
  id v4 = a3;
  [(PXFeatureSpec *)self displayScale];
  objc_msgSend(v4, "setDisplayScale:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setShouldEnableFocus:self->_userInterfaceIdiom == 3];
  }
}

- (id)viewSpecWithDescriptor:(PXViewSpecDescriptor *)a3
{
  CGSize var2 = a3->var2;
  long long v12 = *(_OWORD *)&a3->var0;
  CGSize v13 = var2;
  unint64_t v6 = objc_msgSend(MEMORY[0x1E4F29238], "px_valueWithViewSpecDescriptor:", &v12);
  unsigned int v7 = [(PXFeatureSpec *)self _viewSpecCache];
  int v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    CGSize v9 = a3->var2;
    long long v12 = *(_OWORD *)&a3->var0;
    CGSize v13 = v9;
    int v8 = [(PXFeatureSpec *)self createViewSpecWithDescriptor:&v12];
    double v10 = [(PXFeatureSpec *)self _viewSpecCache];
    [v10 setObject:v8 forKey:v6];
  }
  return v8;
}

- (PXFeatureSpec)init
{
  return [(PXFeatureSpec *)self initWithExtendedTraitCollection:0];
}

@end