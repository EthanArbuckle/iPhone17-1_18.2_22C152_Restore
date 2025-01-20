@interface PXCMMSpec
+ (double)maxBubbleWidthForDisplayScale:(double)a3;
- (CGSize)reviewGridInterItemSpacing;
- (CGSize)reviewGridItemSize;
- (PXCMMSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXCMMSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 activityType:(unint64_t)a5;
- (UIColor)bubbleBackgroundColor;
- (UIColor)composeRecipientViewBackgroundColor;
- (UIColor)reviewBackgroundColor;
- (UIEdgeInsets)composeFooterInsets;
- (UIEdgeInsets)composeFooterMargins;
- (UIEdgeInsets)composeHeaderLabelMargins;
- (UIEdgeInsets)reviewContentInsets;
- (UIEdgeInsets)reviewGridContentInsets;
- (UIEdgeInsets)reviewSafeAreaInsets;
- (double)_reviewSectionHeaderHeightForContentSize:(id)a3;
- (double)bubbleStatusIconCornerRadius;
- (double)composeCornerRadius;
- (double)composeHeaderVerticalPadding;
- (double)composePrivacyMessageInset;
- (double)reviewBannerHeight;
- (double)reviewFooterBottomInset;
- (double)reviewHeaderCornerRadius;
- (double)reviewHeaderTopInset;
- (double)reviewSectionHeaderHeight;
- (int64_t)reviewGridContentMode;
- (unint64_t)activityType;
@end

@implementation PXCMMSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeRecipientViewBackgroundColor, 0);
  objc_storeStrong((id *)&self->_reviewBackgroundColor, 0);
}

- (double)bubbleStatusIconCornerRadius
{
  return self->_bubbleStatusIconCornerRadius;
}

- (UIEdgeInsets)composeFooterMargins
{
  double top = self->_composeFooterMargins.top;
  double left = self->_composeFooterMargins.left;
  double bottom = self->_composeFooterMargins.bottom;
  double right = self->_composeFooterMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)composeFooterInsets
{
  double top = self->_composeFooterInsets.top;
  double left = self->_composeFooterInsets.left;
  double bottom = self->_composeFooterInsets.bottom;
  double right = self->_composeFooterInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)composeHeaderVerticalPadding
{
  return self->_composeHeaderVerticalPadding;
}

- (UIEdgeInsets)composeHeaderLabelMargins
{
  double top = self->_composeHeaderLabelMargins.top;
  double left = self->_composeHeaderLabelMargins.left;
  double bottom = self->_composeHeaderLabelMargins.bottom;
  double right = self->_composeHeaderLabelMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)composePrivacyMessageInset
{
  return self->_composePrivacyMessageInset;
}

- (double)composeCornerRadius
{
  return self->_composeCornerRadius;
}

- (UIColor)composeRecipientViewBackgroundColor
{
  return self->_composeRecipientViewBackgroundColor;
}

- (double)reviewSectionHeaderHeight
{
  return self->_reviewSectionHeaderHeight;
}

- (double)reviewFooterBottomInset
{
  return self->_reviewFooterBottomInset;
}

- (double)reviewBannerHeight
{
  return self->_reviewBannerHeight;
}

- (double)reviewHeaderCornerRadius
{
  return self->_reviewHeaderCornerRadius;
}

- (double)reviewHeaderTopInset
{
  return self->_reviewHeaderTopInset;
}

- (int64_t)reviewGridContentMode
{
  return self->_reviewGridContentMode;
}

- (UIEdgeInsets)reviewGridContentInsets
{
  double top = self->_reviewGridContentInsets.top;
  double left = self->_reviewGridContentInsets.left;
  double bottom = self->_reviewGridContentInsets.bottom;
  double right = self->_reviewGridContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)reviewSafeAreaInsets
{
  double top = self->_reviewSafeAreaInsets.top;
  double left = self->_reviewSafeAreaInsets.left;
  double bottom = self->_reviewSafeAreaInsets.bottom;
  double right = self->_reviewSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)reviewGridItemSize
{
  double width = self->_reviewGridItemSize.width;
  double height = self->_reviewGridItemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)reviewGridInterItemSpacing
{
  double width = self->_reviewGridInterItemSpacing.width;
  double height = self->_reviewGridInterItemSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)reviewContentInsets
{
  double top = self->_reviewContentInsets.top;
  double left = self->_reviewContentInsets.left;
  double bottom = self->_reviewContentInsets.bottom;
  double right = self->_reviewContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIColor)reviewBackgroundColor
{
  return self->_reviewBackgroundColor;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (double)_reviewSectionHeaderHeightForContentSize:(id)a3
{
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a3)) {
    PXScaledValueForTextStyleWithSymbolicTraits();
  }
  return 54.0;
}

- (UIColor)bubbleBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E4FB1618], "px_messagesBubbleGray");
}

- (PXCMMSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PXCMMSpec *)self initWithExtendedTraitCollection:a3 options:a4 activityType:0];
}

- (PXCMMSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 activityType:(unint64_t)a5
{
  id v8 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PXCMMSpec;
  v9 = [(PXFeatureSpec *)&v41 initWithExtendedTraitCollection:v8 options:a4];
  v10 = v9;
  if (v9)
  {
    v9->_activityType = a5;
    v11 = [[PXPhotosDetailsSpec alloc] initWithExtendedTraitCollection:v8 options:a4];
    v12 = [(PXPhotosDetailsSpec *)v11 widgetSpec];
    v13 = [[PXPhotosDetailsHeaderSpec alloc] initWithExtendedTraitCollection:v8 options:a4];
    v14 = [[PXPhotosDetailsAssetsSpec alloc] initWithExtendedTraitCollection:v8 options:a4];
    [v8 safeAreaInsets];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    uint64_t v23 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    reviewBackgroundColor = v10->_reviewBackgroundColor;
    v10->_reviewBackgroundColor = (UIColor *)v23;

    [(PXPhotosDetailsAssetsSpec *)v14 gridContentInsets];
    v10->_reviewGridContentInsets.double top = v25;
    v10->_reviewGridContentInsets.double left = v26;
    v10->_reviewGridContentInsets.double bottom = v27;
    v10->_reviewGridContentInsets.double right = v28;
    v10->_reviewSafeAreaInsets.double top = v16;
    v10->_reviewSafeAreaInsets.double left = v18;
    v10->_reviewSafeAreaInsets.double bottom = v20;
    v10->_reviewSafeAreaInsets.double right = v22;
    [(PXPhotosDetailsAssetsSpec *)v14 gridInterItemSpacing];
    v10->_reviewGridInterItemSpacing.double width = v29;
    v10->_reviewGridInterItemSpacing.double height = v30;
    [(PXPhotosDetailsAssetsSpec *)v14 gridItemSize];
    v10->_reviewGridItemSize.double width = v31;
    v10->_reviewGridItemSize.double height = v32;
    v10->_reviewGridContentMode = [(PXPhotosDetailsAssetsSpec *)v14 gridContentMode];
    v10->_reviewHeaderTopInset = 0.0;
    v10->_reviewBannerHeight = 80.0;
    v10->_reviewFooterBottomInset = 0.0;
    long long v33 = *((_OWORD *)off_1E5DAAF10 + 1);
    *(_OWORD *)&v10->_reviewContentInsets.double top = *(_OWORD *)off_1E5DAAF10;
    *(_OWORD *)&v10->_reviewContentInsets.double bottom = v33;
    if ([(PXFeatureSpec *)v11 shouldInsetAllPhotoDetailsContent])
    {
      [v12 distanceBetweenTopAndHeaderlessWidgetContentTop];
      v10->_reviewHeaderTopInset = v34 + v10->_reviewHeaderTopInset;
      [v12 distanceBetweenFooterlessWidgetContentBottomAndBottom];
      v10->_reviewFooterBottomInset = v35 + v10->_reviewFooterBottomInset;
      [v12 contentGuideInsets];
      PXEdgeInsetsMax();
    }
    [(PXPhotosDetailsHeaderSpec *)v13 defaultCornerRadius];
    v10->_reviewHeaderCornerRadius = v36;
    [v8 traitCollection];
    [(id)objc_claimAutoreleasedReturnValue() preferredContentSizeCategory];
    [(PXCMMSpec *)v10 _reviewSectionHeaderHeightForContentSize:objc_claimAutoreleasedReturnValue()];
    v10->_reviewSectionHeaderHeight = v37;
    v10->_bubbleStatusIconCornerRadius = 10.0;
    uint64_t v38 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
    composeRecipientViewBackgroundColor = v10->_composeRecipientViewBackgroundColor;
    v10->_composeRecipientViewBackgroundColor = (UIColor *)v38;

    v10->_composeCornerRadius = 5.0;
    PXEdgeInsetsMake();
  }

  return 0;
}

+ (double)maxBubbleWidthForDisplayScale:(double)a3
{
  return 947.0 / a3;
}

@end