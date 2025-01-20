@interface BKLibraryBookshelfCellMetrics_WantToRead
+ (id)sectionName;
- (BKLibraryBookshelfCellMetrics_WantToRead)init;
- (BOOL)shrinkInEditMode;
- (BOOL)stackedLayout;
- (CGSize)bookCoverSize;
- (TUIFontAttributes)authorFontAttributes;
- (TUIFontAttributes)dateLabelFontAttributes;
- (TUIFontAttributes)descriptionFontAttributes;
- (TUIFontAttributes)readBuyFontAttributes;
- (TUIFontAttributes)readBuyStoreFontAttributes;
- (TUIFontAttributes)starRatingCountFontAttributes;
- (TUIFontAttributes)titleFontAttributes;
- (UIColor)buyStateBackgroundFillColor;
- (UIColor)cellSeparatorColor;
- (UIColor)moreTintColor;
- (UIColor)ratingEmptyColor;
- (UIColor)ratingFillColor;
- (UIColor)ratingFrameColor;
- (UIColor)readBuyFillColor;
- (UIColor)readBuyFillHilightColor;
- (UIColor)readBuyFrameColor;
- (UIColor)readBuyStoreFillColor;
- (UIColor)readBuyStoreFillHilightColor;
- (UIColor)readBuyStoreFrameColor;
- (UIColor)readBuyStoreTextColor;
- (UIColor)readBuyStoreTextDisabledColor;
- (UIColor)readBuyStoreTextHilightColor;
- (UIColor)readBuyTextColor;
- (UIColor)readBuyTextHilightColor;
- (double)audiobookControlDiameter;
- (double)audiobookControlMargin;
- (double)authorSpacing;
- (double)bookCoverLeftMargin;
- (double)cellHeight;
- (double)cellSpacing;
- (double)checkMarkSpacing;
- (double)cloudSpacing;
- (double)descriptionBottomMargin;
- (double)descriptionLeftMargin;
- (double)descriptionRightMargin;
- (double)descriptionSpacing;
- (double)descriptionTopMargin;
- (double)dragCornerRadius;
- (double)dragHandleHorizontalSpacing;
- (double)dragShadowOpacity;
- (double)dragShadowRadius;
- (double)editMargin;
- (double)editModeMargin;
- (double)lockupMargin;
- (double)moreHeight;
- (double)moreSpacing;
- (double)ratingCountWidth;
- (double)ratingHeight;
- (double)ratingHorizontalSpacing;
- (double)ratingSpacing;
- (double)ratingWidth;
- (double)readBuyFrameWidth;
- (double)readBuyLeadingEdgeSpacing;
- (double)readBuySpacing;
- (double)readBuyTitleInset;
- (double)readBuyTrailingEdgeSpacing;
- (double)shrinkAlpha;
- (double)shrinkAmount;
- (double)smallCellHeight;
- (double)stackedButtonHorizontalSpacing;
- (double)titleMaxLines;
- (double)titleSpacing;
- (unint64_t)descriptionVisibleRows;
- (void)configureWithSection:(id)a3;
- (void)setAudiobookControlDiameter:(double)a3;
- (void)setAudiobookControlMargin:(double)a3;
- (void)setAuthorFontAttributes:(id)a3;
- (void)setAuthorSpacing:(double)a3;
- (void)setBookCoverLeftMargin:(double)a3;
- (void)setBookCoverSize:(CGSize)a3;
- (void)setBuyStateBackgroundFillColor:(id)a3;
- (void)setCellHeight:(double)a3;
- (void)setCellSeparatorColor:(id)a3;
- (void)setCellSpacing:(double)a3;
- (void)setCheckMarkSpacing:(double)a3;
- (void)setCloudSpacing:(double)a3;
- (void)setDateLabelFontAttributes:(id)a3;
- (void)setDescriptionBottomMargin:(double)a3;
- (void)setDescriptionFontAttributes:(id)a3;
- (void)setDescriptionLeftMargin:(double)a3;
- (void)setDescriptionRightMargin:(double)a3;
- (void)setDescriptionSpacing:(double)a3;
- (void)setDescriptionTopMargin:(double)a3;
- (void)setDescriptionVisibleRows:(unint64_t)a3;
- (void)setDragCornerRadius:(double)a3;
- (void)setDragHandleHorizontalSpacing:(double)a3;
- (void)setDragShadowOpacity:(double)a3;
- (void)setDragShadowRadius:(double)a3;
- (void)setEditMargin:(double)a3;
- (void)setEditModeMargin:(double)a3;
- (void)setLockupMargin:(double)a3;
- (void)setMoreHeight:(double)a3;
- (void)setMoreSpacing:(double)a3;
- (void)setMoreTintColor:(id)a3;
- (void)setRatingCountWidth:(double)a3;
- (void)setRatingEmptyColor:(id)a3;
- (void)setRatingFillColor:(id)a3;
- (void)setRatingFrameColor:(id)a3;
- (void)setRatingHeight:(double)a3;
- (void)setRatingHorizontalSpacing:(double)a3;
- (void)setRatingSpacing:(double)a3;
- (void)setRatingWidth:(double)a3;
- (void)setReadBuyFillColor:(id)a3;
- (void)setReadBuyFillHilightColor:(id)a3;
- (void)setReadBuyFontAttributes:(id)a3;
- (void)setReadBuyFrameColor:(id)a3;
- (void)setReadBuyFrameWidth:(double)a3;
- (void)setReadBuyLeadingEdgeSpacing:(double)a3;
- (void)setReadBuySpacing:(double)a3;
- (void)setReadBuyStoreFillColor:(id)a3;
- (void)setReadBuyStoreFillHilightColor:(id)a3;
- (void)setReadBuyStoreFontAttributes:(id)a3;
- (void)setReadBuyStoreFrameColor:(id)a3;
- (void)setReadBuyStoreTextColor:(id)a3;
- (void)setReadBuyStoreTextDisabledColor:(id)a3;
- (void)setReadBuyStoreTextHilightColor:(id)a3;
- (void)setReadBuyTextColor:(id)a3;
- (void)setReadBuyTextHilightColor:(id)a3;
- (void)setReadBuyTitleInset:(double)a3;
- (void)setReadBuyTrailingEdgeSpacing:(double)a3;
- (void)setShrinkAlpha:(double)a3;
- (void)setShrinkAmount:(double)a3;
- (void)setShrinkInEditMode:(BOOL)a3;
- (void)setSmallCellHeight:(double)a3;
- (void)setStackedButtonHorizontalSpacing:(double)a3;
- (void)setStackedLayout:(BOOL)a3;
- (void)setStarRatingCountFontAttributes:(id)a3;
- (void)setTitleFontAttributes:(id)a3;
- (void)setTitleMaxLines:(double)a3;
- (void)setTitleSpacing:(double)a3;
@end

@implementation BKLibraryBookshelfCellMetrics_WantToRead

- (BKLibraryBookshelfCellMetrics_WantToRead)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfCellMetrics_WantToRead;
  v2 = [(BKLibraryBookshelfCellMetrics_WantToRead *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BKLibraryBookshelfCellMetrics *)v2 setCellType:3];
  }
  return v3;
}

+ (id)sectionName
{
  return @"bookCellListWantToRead";
}

- (void)configureWithSection:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)BKLibraryBookshelfCellMetrics_WantToRead;
  [(BKLibraryBookshelfCellMetrics *)&v51 configureWithSection:v4];
  objc_super v5 = [v4 colorForKey:@"readBuy-fill-color"];
  if (v5)
  {
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyFillColor:v5];
  }
  else
  {
    v6 = +[UIColor blackColor];
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyFillColor:v6];
  }
  v7 = [v4 colorForKey:@"readBuy-fill-hilight-color"];
  [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyFillHilightColor:v7];

  v8 = [v4 colorForKey:@"readBuy-fill-hilight-color"];
  if (v8)
  {
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyFillHilightColor:v8];
  }
  else
  {
    v9 = +[UIColor whiteColor];
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyFillHilightColor:v9];
  }
  v10 = [v4 colorForKey:@"readBuy-frame-color"];
  if (v10)
  {
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyFrameColor:v10];
  }
  else
  {
    v11 = +[UIColor blackColor];
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyFrameColor:v11];
  }
  v12 = [v4 colorForKey:@"readBuy-text-color"];
  if (v12)
  {
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyTextColor:v12];
  }
  else
  {
    v13 = +[UIColor whiteColor];
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyTextColor:v13];
  }
  v14 = [v4 colorForKey:@"readBuy-text-hilight-color"];
  if (v14)
  {
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyTextHilightColor:v14];
  }
  else
  {
    v15 = +[UIColor blackColor];
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyTextHilightColor:v15];
  }
  v16 = [v4 colorForKey:@"readBuy-store-fill-color"];
  if (v16)
  {
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyStoreFillColor:v16];
  }
  else
  {
    v17 = +[UIColor whiteColor];
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyStoreFillColor:v17];
  }
  v18 = [v4 colorForKey:@"readBuy-store-fill-hilight-color"];
  if (v18)
  {
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyStoreFillHilightColor:v18];
  }
  else
  {
    v19 = +[UIColor blackColor];
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyStoreFillHilightColor:v19];
  }
  v20 = [v4 colorForKey:@"readBuy-store-frame-color"];
  if (v20)
  {
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyStoreFrameColor:v20];
  }
  else
  {
    v21 = +[UIColor blackColor];
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyStoreFrameColor:v21];
  }
  v22 = [v4 colorForKey:@"readBuy-store-text-color"];
  if (v22)
  {
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyStoreTextColor:v22];
  }
  else
  {
    v23 = +[UIColor blackColor];
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyStoreTextColor:v23];
  }
  v24 = [v4 colorForKey:@"readBuy-store-text-hilight-color"];
  if (v24)
  {
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyStoreTextHilightColor:v24];
  }
  else
  {
    v25 = +[UIColor whiteColor];
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyStoreTextHilightColor:v25];
  }
  v26 = [v4 colorForKey:@"readBuy-store-disabled-color"];
  if (v26)
  {
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyStoreTextDisabledColor:v26];
  }
  else
  {
    v27 = +[UIColor grayColor];
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyStoreTextDisabledColor:v27];
  }
  v28 = [v4 colorForKey:@"buy-button-background-color"];
  if (v28)
  {
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setBuyStateBackgroundFillColor:v28];
  }
  else
  {
    v29 = +[UIColor whiteColor];
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setBuyStateBackgroundFillColor:v29];
  }
  v30 = [v4 colorForKey:@"more-tint-color"];
  if (v30)
  {
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setMoreTintColor:v30];
  }
  else
  {
    v31 = +[UIColor grayColor];
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setMoreTintColor:v31];
  }
  v32 = [v4 colorForKey:@"rating-frame-color"];
  if (v32)
  {
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setRatingFrameColor:v32];
  }
  else
  {
    v33 = +[UIColor blackColor];
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setRatingFrameColor:v33];
  }
  v34 = [v4 colorForKey:@"rating-fill-color"];
  if (v34)
  {
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setRatingFillColor:v34];
  }
  else
  {
    v35 = +[UIColor blackColor];
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setRatingFillColor:v35];
  }
  v36 = [v4 colorForKey:@"rating-empty-color"];
  if (v36)
  {
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setRatingEmptyColor:v36];
  }
  else
  {
    v37 = +[UIColor grayColor];
    [(BKLibraryBookshelfCellMetrics_WantToRead *)self setRatingEmptyColor:v37];
  }
  [v4 sizeForKey:@"book-cover-size"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setBookCoverSize:](self, "setBookCoverSize:");
  [v4 floatForKey:@"book-cover-left-margin"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setBookCoverLeftMargin:](self, "setBookCoverLeftMargin:");
  [v4 floatForKey:@"cell-spacing"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setCellSpacing:](self, "setCellSpacing:");
  -[BKLibraryBookshelfCellMetrics_WantToRead setStackedLayout:](self, "setStackedLayout:", [v4 BOOLForKey:@"stacked-layout"]);
  [v4 floatForKey:@"cell-height"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setCellHeight:](self, "setCellHeight:");
  [v4 floatForKey:@"checkmark-spacing"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setCheckMarkSpacing:](self, "setCheckMarkSpacing:");
  [v4 floatForKey:@"cloud-spacing"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setCloudSpacing:](self, "setCloudSpacing:");
  [v4 floatForKey:@"lockup-margin"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setLockupMargin:](self, "setLockupMargin:");
  [v4 floatForKey:@"edit-mode-margin"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setEditModeMargin:](self, "setEditModeMargin:");
  [v4 floatForKey:@"drag-handle-horizontal-spacing"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setDragHandleHorizontalSpacing:](self, "setDragHandleHorizontalSpacing:");
  [v4 floatForKey:@"title-vertical-spacing"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setTitleSpacing:](self, "setTitleSpacing:");
  [v4 floatForKey:@"author-spacing"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setAuthorSpacing:](self, "setAuthorSpacing:");
  [v4 floatForKey:@"title-max-lines"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setTitleMaxLines:](self, "setTitleMaxLines:");
  [v4 floatForKey:@"rating-spacing"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setRatingSpacing:](self, "setRatingSpacing:");
  [v4 floatForKey:@"rating-height"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setRatingHeight:](self, "setRatingHeight:");
  [v4 floatForKey:@"rating-width"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setRatingWidth:](self, "setRatingWidth:");
  [v4 floatForKey:@"rating-count-width"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setRatingCountWidth:](self, "setRatingCountWidth:");
  [v4 floatForKey:@"rating-horizontal-spacing"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setRatingHorizontalSpacing:](self, "setRatingHorizontalSpacing:");
  [v4 floatForKey:@"readBuy-frame-width"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyFrameWidth:](self, "setReadBuyFrameWidth:");
  [v4 floatForKey:@"readBuy-title-inset"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyTitleInset:](self, "setReadBuyTitleInset:");
  [v4 floatForKey:@"readBuy-leading-edge-spacing"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyLeadingEdgeSpacing:](self, "setReadBuyLeadingEdgeSpacing:");
  [v4 floatForKey:@"readBuy-trailing-edge-spacing"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuyTrailingEdgeSpacing:](self, "setReadBuyTrailingEdgeSpacing:");
  [v4 floatForKey:@"readBuy-spacing"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setReadBuySpacing:](self, "setReadBuySpacing:");
  [v4 floatForKey:@"stacked-button-horizontal-spacing"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setStackedButtonHorizontalSpacing:](self, "setStackedButtonHorizontalSpacing:");
  [v4 floatForKey:@"more-spacing"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setMoreSpacing:](self, "setMoreSpacing:");
  [v4 floatForKey:@"description-spacing"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setDescriptionSpacing:](self, "setDescriptionSpacing:");
  [v4 floatForKey:@"description-left-margin"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setDescriptionLeftMargin:](self, "setDescriptionLeftMargin:");
  [v4 floatForKey:@"description-right-margin"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setDescriptionRightMargin:](self, "setDescriptionRightMargin:");
  [v4 floatForKey:@"description-top-margin"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setDescriptionTopMargin:](self, "setDescriptionTopMargin:");
  [v4 floatForKey:@"description-bottom-margin"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setDescriptionBottomMargin:](self, "setDescriptionBottomMargin:");
  -[BKLibraryBookshelfCellMetrics_WantToRead setDescriptionVisibleRows:](self, "setDescriptionVisibleRows:", [v4 integerForKey:@"description-visible-rows"]);
  [v4 floatForKey:@"more-height"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setMoreHeight:](self, "setMoreHeight:");
  -[BKLibraryBookshelfCellMetrics_WantToRead setShrinkInEditMode:](self, "setShrinkInEditMode:", [v4 BOOLForKey:@"edit-mode-shrink"]);
  [v4 floatForKey:@"edit-mode-shrink-amount"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setShrinkAmount:](self, "setShrinkAmount:");
  [v4 floatForKey:@"edit-mode-shrink-alpha"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setShrinkAlpha:](self, "setShrinkAlpha:");
  [v4 floatForKey:@"edit-margin"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setEditMargin:](self, "setEditMargin:");
  v38 = [v4 colorForKey:@"cell-separator-color"];
  [(BKLibraryBookshelfCellMetrics_WantToRead *)self setCellSeparatorColor:v38];

  [v4 floatForKey:@"drag-corner-radius"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setDragCornerRadius:](self, "setDragCornerRadius:");
  [v4 floatForKey:@"drag-shadow-opacity"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setDragShadowOpacity:](self, "setDragShadowOpacity:");
  [v4 floatForKey:@"drag-shadow-radius"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setDragShadowRadius:](self, "setDragShadowRadius:");
  [v4 floatForKey:@"audiobook-control-margin"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setAudiobookControlMargin:](self, "setAudiobookControlMargin:");
  [v4 floatForKey:@"audiobook-control-diameter"];
  -[BKLibraryBookshelfCellMetrics_WantToRead setAudiobookControlDiameter:](self, "setAudiobookControlDiameter:");
  v39 = [v4 fontSpecForKey:@"titleFont"];
  v40 = [v39 attributesForAttributedStringCentered:0 truncated:1];
  [(BKLibraryBookshelfCellMetrics_WantToRead *)self setTitleFontAttributes:v40];

  v41 = [v4 fontSpecForKey:@"authorFont"];
  v42 = [v41 attributesForAttributedStringCentered:0 truncated:1];
  [(BKLibraryBookshelfCellMetrics_WantToRead *)self setAuthorFontAttributes:v42];

  v43 = [v4 fontSpecForKey:@"descriptionFont"];
  v44 = [v43 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_WantToRead *)self setDescriptionFontAttributes:v44];

  v45 = [v4 fontSpecForKey:@"readBuyFont"];
  v46 = [v45 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyFontAttributes:v46];

  v47 = [v4 fontSpecForKey:@"readBuyStoreFont"];
  v48 = [v47 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_WantToRead *)self setReadBuyStoreFontAttributes:v48];

  v49 = [v4 fontSpecForKey:@"starRatingCountFont"];
  v50 = [v49 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_WantToRead *)self setStarRatingCountFontAttributes:v50];
}

- (double)cellHeight
{
  return self->cellHeight;
}

- (void)setCellHeight:(double)a3
{
  self->cellHeight = a3;
}

- (double)smallCellHeight
{
  return self->smallCellHeight;
}

- (void)setSmallCellHeight:(double)a3
{
  self->smallCellHeight = a3;
}

- (BOOL)shrinkInEditMode
{
  return self->shrinkInEditMode;
}

- (void)setShrinkInEditMode:(BOOL)a3
{
  self->shrinkInEditMode = a3;
}

- (double)shrinkAmount
{
  return self->shrinkAmount;
}

- (void)setShrinkAmount:(double)a3
{
  self->shrinkAmount = a3;
}

- (double)shrinkAlpha
{
  return self->shrinkAlpha;
}

- (void)setShrinkAlpha:(double)a3
{
  self->shrinkAlpha = a3;
}

- (CGSize)bookCoverSize
{
  double width = self->_bookCoverSize.width;
  double height = self->_bookCoverSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBookCoverSize:(CGSize)a3
{
  self->_bookCoverSize = a3;
}

- (double)bookCoverLeftMargin
{
  return self->_bookCoverLeftMargin;
}

- (void)setBookCoverLeftMargin:(double)a3
{
  self->_bookCoverLeftMargin = a3;
}

- (double)cellSpacing
{
  return self->_cellSpacing;
}

- (void)setCellSpacing:(double)a3
{
  self->_cellSpacing = a3;
}

- (BOOL)stackedLayout
{
  return self->_stackedLayout;
}

- (void)setStackedLayout:(BOOL)a3
{
  self->_stackedLayout = a3;
}

- (double)stackedButtonHorizontalSpacing
{
  return self->_stackedButtonHorizontalSpacing;
}

- (void)setStackedButtonHorizontalSpacing:(double)a3
{
  self->_stackedButtonHorizontalSpacing = a3;
}

- (double)titleMaxLines
{
  return self->_titleMaxLines;
}

- (void)setTitleMaxLines:(double)a3
{
  self->_titleMaxLines = a3;
}

- (double)lockupMargin
{
  return self->_lockupMargin;
}

- (void)setLockupMargin:(double)a3
{
  self->_lockupMargin = a3;
}

- (double)editModeMargin
{
  return self->_editModeMargin;
}

- (void)setEditModeMargin:(double)a3
{
  self->_editModeMargin = a3;
}

- (double)dragHandleHorizontalSpacing
{
  return self->_dragHandleHorizontalSpacing;
}

- (void)setDragHandleHorizontalSpacing:(double)a3
{
  self->_dragHandleHorizontalSpacing = a3;
}

- (double)cloudSpacing
{
  return self->_cloudSpacing;
}

- (void)setCloudSpacing:(double)a3
{
  self->_cloudSpacing = a3;
}

- (double)checkMarkSpacing
{
  return self->_checkMarkSpacing;
}

- (void)setCheckMarkSpacing:(double)a3
{
  self->_checkMarkSpacing = a3;
}

- (double)titleSpacing
{
  return self->_titleSpacing;
}

- (void)setTitleSpacing:(double)a3
{
  self->_titleSpacing = a3;
}

- (double)authorSpacing
{
  return self->_authorSpacing;
}

- (void)setAuthorSpacing:(double)a3
{
  self->_authorSpacing = a3;
}

- (double)ratingHeight
{
  return self->_ratingHeight;
}

- (void)setRatingHeight:(double)a3
{
  self->_ratingHeight = a3;
}

- (double)ratingWidth
{
  return self->_ratingWidth;
}

- (void)setRatingWidth:(double)a3
{
  self->_ratingWidth = a3;
}

- (double)ratingSpacing
{
  return self->_ratingSpacing;
}

- (void)setRatingSpacing:(double)a3
{
  self->_ratingSpacing = a3;
}

- (double)ratingCountWidth
{
  return self->_ratingCountWidth;
}

- (void)setRatingCountWidth:(double)a3
{
  self->_ratingCountWidth = a3;
}

- (double)ratingHorizontalSpacing
{
  return self->_ratingHorizontalSpacing;
}

- (void)setRatingHorizontalSpacing:(double)a3
{
  self->_ratingHorizontalSpacing = a3;
}

- (double)readBuyFrameWidth
{
  return self->_readBuyFrameWidth;
}

- (void)setReadBuyFrameWidth:(double)a3
{
  self->_readBuyFrameWidth = a3;
}

- (double)readBuyTitleInset
{
  return self->_readBuyTitleInset;
}

- (void)setReadBuyTitleInset:(double)a3
{
  self->_readBuyTitleInset = a3;
}

- (double)readBuyLeadingEdgeSpacing
{
  return self->_readBuyLeadingEdgeSpacing;
}

- (void)setReadBuyLeadingEdgeSpacing:(double)a3
{
  self->_readBuyLeadingEdgeSpacing = a3;
}

- (double)readBuyTrailingEdgeSpacing
{
  return self->_readBuyTrailingEdgeSpacing;
}

- (void)setReadBuyTrailingEdgeSpacing:(double)a3
{
  self->_readBuyTrailingEdgeSpacing = a3;
}

- (double)readBuySpacing
{
  return self->_readBuySpacing;
}

- (void)setReadBuySpacing:(double)a3
{
  self->_readBuySpacing = a3;
}

- (double)moreHeight
{
  return self->_moreHeight;
}

- (void)setMoreHeight:(double)a3
{
  self->_moreHeight = a3;
}

- (double)moreSpacing
{
  return self->_moreSpacing;
}

- (void)setMoreSpacing:(double)a3
{
  self->_moreSpacing = a3;
}

- (double)descriptionSpacing
{
  return self->_descriptionSpacing;
}

- (void)setDescriptionSpacing:(double)a3
{
  self->_descriptionSpacing = a3;
}

- (double)descriptionLeftMargin
{
  return self->_descriptionLeftMargin;
}

- (void)setDescriptionLeftMargin:(double)a3
{
  self->_descriptionLeftMargin = a3;
}

- (double)descriptionRightMargin
{
  return self->_descriptionRightMargin;
}

- (void)setDescriptionRightMargin:(double)a3
{
  self->_descriptionRightMargin = a3;
}

- (double)descriptionTopMargin
{
  return self->_descriptionTopMargin;
}

- (void)setDescriptionTopMargin:(double)a3
{
  self->_descriptionTopMargin = a3;
}

- (double)descriptionBottomMargin
{
  return self->_descriptionBottomMargin;
}

- (void)setDescriptionBottomMargin:(double)a3
{
  self->_descriptionBottomMargin = a3;
}

- (unint64_t)descriptionVisibleRows
{
  return self->_descriptionVisibleRows;
}

- (void)setDescriptionVisibleRows:(unint64_t)a3
{
  self->_descriptionVisibleRows = a3;
}

- (double)editMargin
{
  return self->_editMargin;
}

- (void)setEditMargin:(double)a3
{
  self->_editMargin = a3;
}

- (double)dragCornerRadius
{
  return self->_dragCornerRadius;
}

- (void)setDragCornerRadius:(double)a3
{
  self->_dragCornerRadius = a3;
}

- (double)dragShadowOpacity
{
  return self->_dragShadowOpacity;
}

- (void)setDragShadowOpacity:(double)a3
{
  self->_dragShadowOpacity = a3;
}

- (double)dragShadowRadius
{
  return self->_dragShadowRadius;
}

- (void)setDragShadowRadius:(double)a3
{
  self->_dragShadowRadius = a3;
}

- (UIColor)cellSeparatorColor
{
  return self->_cellSeparatorColor;
}

- (void)setCellSeparatorColor:(id)a3
{
}

- (UIColor)readBuyFillColor
{
  return self->_readBuyFillColor;
}

- (void)setReadBuyFillColor:(id)a3
{
}

- (UIColor)readBuyFillHilightColor
{
  return self->_readBuyFillHilightColor;
}

- (void)setReadBuyFillHilightColor:(id)a3
{
}

- (UIColor)readBuyFrameColor
{
  return self->_readBuyFrameColor;
}

- (void)setReadBuyFrameColor:(id)a3
{
}

- (UIColor)readBuyTextColor
{
  return self->_readBuyTextColor;
}

- (void)setReadBuyTextColor:(id)a3
{
}

- (UIColor)readBuyTextHilightColor
{
  return self->_readBuyTextHilightColor;
}

- (void)setReadBuyTextHilightColor:(id)a3
{
}

- (UIColor)readBuyStoreFillColor
{
  return self->_readBuyStoreFillColor;
}

- (void)setReadBuyStoreFillColor:(id)a3
{
}

- (UIColor)readBuyStoreFillHilightColor
{
  return self->_readBuyStoreFillHilightColor;
}

- (void)setReadBuyStoreFillHilightColor:(id)a3
{
}

- (UIColor)readBuyStoreFrameColor
{
  return self->_readBuyStoreFrameColor;
}

- (void)setReadBuyStoreFrameColor:(id)a3
{
}

- (UIColor)readBuyStoreTextColor
{
  return self->_readBuyStoreTextColor;
}

- (void)setReadBuyStoreTextColor:(id)a3
{
}

- (UIColor)readBuyStoreTextHilightColor
{
  return self->_readBuyStoreTextHilightColor;
}

- (void)setReadBuyStoreTextHilightColor:(id)a3
{
}

- (UIColor)readBuyStoreTextDisabledColor
{
  return self->_readBuyStoreTextDisabledColor;
}

- (void)setReadBuyStoreTextDisabledColor:(id)a3
{
}

- (UIColor)buyStateBackgroundFillColor
{
  return self->_buyStateBackgroundFillColor;
}

- (void)setBuyStateBackgroundFillColor:(id)a3
{
}

- (UIColor)moreTintColor
{
  return self->_moreTintColor;
}

- (void)setMoreTintColor:(id)a3
{
}

- (UIColor)ratingFrameColor
{
  return self->_ratingFrameColor;
}

- (void)setRatingFrameColor:(id)a3
{
}

- (UIColor)ratingFillColor
{
  return self->_ratingFillColor;
}

- (void)setRatingFillColor:(id)a3
{
}

- (UIColor)ratingEmptyColor
{
  return self->_ratingEmptyColor;
}

- (void)setRatingEmptyColor:(id)a3
{
}

- (TUIFontAttributes)titleFontAttributes
{
  return self->_titleFontAttributes;
}

- (void)setTitleFontAttributes:(id)a3
{
}

- (TUIFontAttributes)authorFontAttributes
{
  return self->_authorFontAttributes;
}

- (void)setAuthorFontAttributes:(id)a3
{
}

- (TUIFontAttributes)descriptionFontAttributes
{
  return self->_descriptionFontAttributes;
}

- (void)setDescriptionFontAttributes:(id)a3
{
}

- (TUIFontAttributes)dateLabelFontAttributes
{
  return self->_dateLabelFontAttributes;
}

- (void)setDateLabelFontAttributes:(id)a3
{
}

- (TUIFontAttributes)starRatingCountFontAttributes
{
  return self->_starRatingCountFontAttributes;
}

- (void)setStarRatingCountFontAttributes:(id)a3
{
}

- (TUIFontAttributes)readBuyFontAttributes
{
  return self->_readBuyFontAttributes;
}

- (void)setReadBuyFontAttributes:(id)a3
{
}

- (TUIFontAttributes)readBuyStoreFontAttributes
{
  return self->_readBuyStoreFontAttributes;
}

- (void)setReadBuyStoreFontAttributes:(id)a3
{
}

- (double)audiobookControlMargin
{
  return self->_audiobookControlMargin;
}

- (void)setAudiobookControlMargin:(double)a3
{
  self->_audiobookControlMargin = a3;
}

- (double)audiobookControlDiameter
{
  return self->_audiobookControlDiameter;
}

- (void)setAudiobookControlDiameter:(double)a3
{
  self->_audiobookControlDiameter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readBuyStoreFontAttributes, 0);
  objc_storeStrong((id *)&self->_readBuyFontAttributes, 0);
  objc_storeStrong((id *)&self->_starRatingCountFontAttributes, 0);
  objc_storeStrong((id *)&self->_dateLabelFontAttributes, 0);
  objc_storeStrong((id *)&self->_descriptionFontAttributes, 0);
  objc_storeStrong((id *)&self->_authorFontAttributes, 0);
  objc_storeStrong((id *)&self->_titleFontAttributes, 0);
  objc_storeStrong((id *)&self->_ratingEmptyColor, 0);
  objc_storeStrong((id *)&self->_ratingFillColor, 0);
  objc_storeStrong((id *)&self->_ratingFrameColor, 0);
  objc_storeStrong((id *)&self->_moreTintColor, 0);
  objc_storeStrong((id *)&self->_buyStateBackgroundFillColor, 0);
  objc_storeStrong((id *)&self->_readBuyStoreTextDisabledColor, 0);
  objc_storeStrong((id *)&self->_readBuyStoreTextHilightColor, 0);
  objc_storeStrong((id *)&self->_readBuyStoreTextColor, 0);
  objc_storeStrong((id *)&self->_readBuyStoreFrameColor, 0);
  objc_storeStrong((id *)&self->_readBuyStoreFillHilightColor, 0);
  objc_storeStrong((id *)&self->_readBuyStoreFillColor, 0);
  objc_storeStrong((id *)&self->_readBuyTextHilightColor, 0);
  objc_storeStrong((id *)&self->_readBuyTextColor, 0);
  objc_storeStrong((id *)&self->_readBuyFrameColor, 0);
  objc_storeStrong((id *)&self->_readBuyFillHilightColor, 0);
  objc_storeStrong((id *)&self->_readBuyFillColor, 0);

  objc_storeStrong((id *)&self->_cellSeparatorColor, 0);
}

@end