@interface PXGadgetSpec
+ (PXLayoutMetricInterpolator)horizontalContentInsetsInterpolator;
+ (double)sectionHeaderHeightForStyle:(unint64_t)a3 dividerHidden:(BOOL)a4;
+ (double)sectionHeaderTitleBottomSpacingForStyle:(unint64_t)a3;
+ (double)sectionHeaderTitleHeightForStyle:(unint64_t)a3 dividerHidden:(BOOL)a4;
+ (double)sectionHeaderTopSpacingForStyle:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToGadgetSpec:(id)a3;
- (BOOL)shouldInsetAllContent;
- (BOOL)shouldInsetContentForTraitCollection:(id)a3;
- (BOOL)shouldUseAccessibilityLayout;
- (PXExtendedTraitCollection)extendedTraitCollection;
- (PXExtendedTraitCollection)rootExtendedTraitCollection;
- (PXGadgetSpec)initWithTraitCollection:(id)a3 scrollAxis:(int64_t)a4;
- (UIColor)backgroundColor;
- (UIEdgeInsets)acccessoryViewInsetForTraitCollection:(id)a3;
- (UIEdgeInsets)accessoryViewInset;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)layoutInsets;
- (double)columnSpacingForColumnSpan:(int64_t)a3;
- (double)columnWidthForColumnSpan:(int64_t)a3;
- (double)displayScale;
- (double)fixedColumnWidth;
- (double)interItemSpacing;
- (double)layoutReferenceHeight;
- (double)layoutReferenceWidth;
- (int64_t)layoutDirection;
- (int64_t)layoutOrientation;
- (int64_t)layoutSizeClass;
- (int64_t)scrollAxis;
- (int64_t)userInterfaceIdiom;
@end

@implementation PXGadgetSpec

- (UIEdgeInsets)acccessoryViewInsetForTraitCollection:(id)a3
{
  id v3 = a3;
  PXEdgeInsetsMake();
}

- (BOOL)shouldInsetContentForTraitCollection:(id)a3
{
  id v3 = [a3 traitCollection];
  BOOL v4 = [v3 horizontalSizeClass] != 1 || objc_msgSend(v3, "verticalSizeClass") != 2;

  return v4;
}

+ (PXLayoutMetricInterpolator)horizontalContentInsetsInterpolator
{
  if (horizontalContentInsetsInterpolator_onceToken != -1) {
    dispatch_once(&horizontalContentInsetsInterpolator_onceToken, &__block_literal_global_14089);
  }
  v2 = (void *)horizontalContentInsetsInterpolator_interpolator;
  return (PXLayoutMetricInterpolator *)v2;
}

void __69__PXGadgetSpec_PlatformSpecific__horizontalContentInsetsInterpolator__block_invoke()
{
  uint64_t v0 = +[PXLayoutMetricInterpolator layoutMarginWidthInterpolator];
  v1 = (void *)horizontalContentInsetsInterpolator_interpolator;
  horizontalContentInsetsInterpolator_interpolator = v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (UIEdgeInsets)accessoryViewInset
{
  double top = self->_accessoryViewInset.top;
  double left = self->_accessoryViewInset.left;
  double bottom = self->_accessoryViewInset.bottom;
  double right = self->_accessoryViewInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)shouldUseAccessibilityLayout
{
  return self->_shouldUseAccessibilityLayout;
}

- (double)fixedColumnWidth
{
  return self->_fixedColumnWidth;
}

- (UIEdgeInsets)layoutInsets
{
  double top = self->_layoutInsets.top;
  double left = self->_layoutInsets.left;
  double bottom = self->_layoutInsets.bottom;
  double right = self->_layoutInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)layoutReferenceHeight
{
  return self->_layoutReferenceHeight;
}

- (double)layoutReferenceWidth
{
  return self->_layoutReferenceWidth;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (int64_t)layoutSizeClass
{
  return self->_layoutSizeClass;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (BOOL)shouldInsetAllContent
{
  return self->_shouldInsetAllContent;
}

- (int64_t)scrollAxis
{
  return self->_scrollAxis;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)columnSpacingForColumnSpan:(int64_t)a3
{
  BOOL v5 = [(PXGadgetSpec *)self shouldUseAccessibilityLayout];
  switch(a3)
  {
    case 0:
      if (v5) {
        goto LABEL_10;
      }
      uint64_t v6 = +[PXLayoutMetricInterpolator gadgetColumnSpacingSpanSingleSetAInterpolator];
      goto LABEL_11;
    case 1:
    case 3:
    case 4:
      goto LABEL_2;
    case 2:
      if (v5)
      {
LABEL_2:
        uint64_t v6 = +[PXLayoutMetricInterpolator gadgetColumnSpacingSpanDoubleSetAInterpolator];
      }
      else
      {
LABEL_10:
        uint64_t v6 = +[PXLayoutMetricInterpolator gadgetColumnSpacingSpanDoubleSetBInterpolator];
      }
LABEL_11:
      v7 = (void *)v6;
      goto LABEL_12;
    case 5:
      [(PXGadgetSpec *)self interItemSpacing];
      return result;
    default:
      v7 = 0;
LABEL_12:
      [(PXGadgetSpec *)self layoutReferenceWidth];
      objc_msgSend(v7, "valueForMetric:");
      double v10 = v9;

      return v10;
  }
}

- (double)columnWidthForColumnSpan:(int64_t)a3
{
  BOOL v5 = [(PXGadgetSpec *)self shouldUseAccessibilityLayout];
  double v6 = 0.0;
  switch(a3)
  {
    case 0:
      if (v5) {
        goto LABEL_12;
      }
      uint64_t v7 = +[PXLayoutMetricInterpolator gadgetColumnWidthSpanSingleSetAInterpolator];
      goto LABEL_13;
    case 1:
      goto LABEL_11;
    case 2:
      if (v5) {
        goto LABEL_11;
      }
LABEL_12:
      uint64_t v7 = +[PXLayoutMetricInterpolator gadgetColumnWidthSpanDoubleSetBInterpolator];
      goto LABEL_13;
    case 3:
      [(PXGadgetSpec *)self layoutReferenceWidth];
      double v9 = v8;
      [(PXGadgetSpec *)self contentInsets];
      double v11 = v9 - v10;
      [(PXGadgetSpec *)self contentInsets];
      return v11 - v12;
    case 4:
      if ([(PXGadgetSpec *)self userInterfaceIdiom] == 1)
      {
        [(PXGadgetSpec *)self layoutReferenceWidth];
        double v14 = v13;
        [(PXGadgetSpec *)self layoutReferenceHeight];
        double v16 = v15;
        [(PXGadgetSpec *)self contentInsets];
        double v18 = v17;
        [(PXGadgetSpec *)self contentInsets];
        double v20 = v18 + v19;
        [(PXGadgetSpec *)self columnSpacingForColumnSpan:4];
        +[PXLayoutMetricInterpolator locketGadgetColumnWidthForLayoutWidth:layoutMargins:interSpacing:isPhone:](PXLayoutMetricInterpolator, "locketGadgetColumnWidthForLayoutWidth:layoutMargins:interSpacing:isPhone:", 1, v14, v16, v20, v21);
      }
      else
      {
LABEL_11:
        uint64_t v7 = +[PXLayoutMetricInterpolator gadgetColumnWidthSpanDoubleSetAInterpolator];
LABEL_13:
        v23 = (void *)v7;
        if (v7)
        {
          [(PXGadgetSpec *)self layoutReferenceWidth];
          objc_msgSend(v23, "valueForMetric:");
          double v6 = v24;
        }
        return v6;
      }
      return result;
    case 5:
      [(PXGadgetSpec *)self fixedColumnWidth];
      return result;
    default:
      return v6;
  }
}

- (BOOL)isEqualToGadgetSpec:(id)a3
{
  id v4 = a3;
  [v4 layoutReferenceWidth];
  if (v5 == self->_layoutReferenceWidth
    && self->_shouldInsetAllContent == [v4 shouldInsetAllContent])
  {
    [v4 interItemSpacing];
    if (v6 == self->_interItemSpacing
      && [v4 scrollAxis] == self->_scrollAxis
      && [v4 layoutSizeClass] == self->_layoutSizeClass
      && [v4 layoutOrientation] == self->_layoutOrientation
      && [v4 layoutDirection] == self->_layoutDirection)
    {
      [v4 fixedColumnWidth];
      if (v7 == self->_fixedColumnWidth
        && self->_shouldUseAccessibilityLayout == [v4 shouldUseAccessibilityLayout])
      {
        [v4 accessoryViewInset];
        PXEdgeInsetsApproximatelyEqualToEdgeInsets();
      }
    }
  }

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4 isEqualToGadgetSpec:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (PXExtendedTraitCollection)rootExtendedTraitCollection
{
  v2 = [(PXGadgetSpec *)self extendedTraitCollection];
  id v3 = [v2 rootExtendedTraitCollection];

  return (PXExtendedTraitCollection *)v3;
}

- (PXGadgetSpec)initWithTraitCollection:(id)a3 scrollAxis:(int64_t)a4
{
  id v8 = a3;
  if (!a4)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXGadgetSpec.m", 114, @"Invalid parameter not satisfying: %@", @"scrollAxis != PXAxisUndefined" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)PXGadgetSpec;
  double v9 = [(PXGadgetSpec *)&v16 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extendedTraitCollection, a3);
    v10->_scrollAxis = a4;
    [v8 layoutReferenceSize];
    v10->_layoutReferenceWidth = v11;
    [v8 layoutReferenceSize];
    v10->_layoutReferenceHeight = v12;
    long long v13 = *((_OWORD *)off_1E5DAAF10 + 1);
    *(_OWORD *)&v10->_layoutInsets.double top = *(_OWORD *)off_1E5DAAF10;
    *(_OWORD *)&v10->_layoutInsets.double bottom = v13;
    v10->_fixedColumnWidth = 164.0;
    [(id)objc_opt_class() horizontalContentInsetsInterpolator];
    [(id)objc_claimAutoreleasedReturnValue() valueForMetric:v10->_layoutReferenceWidth];
    [v8 displayScale];
    PXFloatRoundToPixel();
  }

  return 0;
}

+ (double)sectionHeaderTitleBottomSpacingForStyle:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      PXScaledValueForTextStyleWithSymbolicTraits();
    default:
      return 0.0;
  }
}

+ (double)sectionHeaderTopSpacingForStyle:(unint64_t)a3
{
  if (a3 <= 5) {
    PXScaledValueForTextStyleWithSymbolicTraits();
  }
  char v5 = [MEMORY[0x1E4F28B00] currentHandler];
  [v5 handleFailureInMethod:a2, a1, @"PXGadgetSpec.m", 82, @"Invalid parameter not satisfying: %@", @"topSpacing > 0.0" object file lineNumber description];

  return 0.0;
}

+ (double)sectionHeaderTitleHeightForStyle:(unint64_t)a3 dividerHidden:(BOOL)a4
{
  if (a3 <= 5) {
    PXScaledValueForTextStyleWithSymbolicTraits();
  }
  double v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2, a1, @"PXGadgetSpec.m", 60, @"Invalid parameter not satisfying: %@", @"titleHeight > 0.0" object file lineNumber description];

  return 0.0;
}

+ (double)sectionHeaderHeightForStyle:(unint64_t)a3 dividerHidden:(BOOL)a4
{
  +[PXGadgetSpec sectionHeaderTitleHeightForStyle:dividerHidden:](PXGadgetSpec, "sectionHeaderTitleHeightForStyle:dividerHidden:");
  double v7 = v6;
  +[PXGadgetSpec sectionHeaderTitleBottomSpacingForStyle:a3];
  double v9 = v7 + v8;
  if (!a4)
  {
    +[PXGadgetSpec sectionHeaderTopSpacingForStyle:a3];
    return v9 + v10;
  }
  return v9;
}

@end