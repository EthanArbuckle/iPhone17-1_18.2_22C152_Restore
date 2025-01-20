@interface BKLibraryBookshelfCellMetrics_List
+ (id)sectionName;
- (BKLibraryBookshelfCellMetrics_List)init;
- (BOOL)shrinkInEditMode;
- (CGSize)coverSize;
- (CGSize)smallCoverSize;
- (TUIFontAttributes)authorFontAttributes;
- (TUIFontAttributes)titleFontAttributes;
- (UIColor)dragBarTintColor;
- (UIColor)separatorColor;
- (UIEdgeInsets)coverMargins;
- (UIEdgeInsets)smallCoverMargins;
- (double)audiobookControlDiameter;
- (double)authorSpacing;
- (double)cellHeight;
- (double)dragCornerRadius;
- (double)dragShadowOpacity;
- (double)dragShadowRadius;
- (double)editModeMargin;
- (double)fontScale;
- (double)shrinkAlpha;
- (double)shrinkAmount;
- (double)smallCellHeight;
- (double)titleSpacing;
- (void)configureWithSection:(id)a3;
- (void)setAudiobookControlDiameter:(double)a3;
- (void)setAuthorFontAttributes:(id)a3;
- (void)setAuthorSpacing:(double)a3;
- (void)setCellHeight:(double)a3;
- (void)setCoverMargins:(UIEdgeInsets)a3;
- (void)setCoverSize:(CGSize)a3;
- (void)setDragBarTintColor:(id)a3;
- (void)setDragCornerRadius:(double)a3;
- (void)setDragShadowOpacity:(double)a3;
- (void)setDragShadowRadius:(double)a3;
- (void)setEditModeMargin:(double)a3;
- (void)setFontScale:(double)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setShrinkAlpha:(double)a3;
- (void)setShrinkAmount:(double)a3;
- (void)setShrinkInEditMode:(BOOL)a3;
- (void)setSmallCellHeight:(double)a3;
- (void)setSmallCoverMargins:(UIEdgeInsets)a3;
- (void)setSmallCoverSize:(CGSize)a3;
- (void)setTitleFontAttributes:(id)a3;
- (void)setTitleSpacing:(double)a3;
@end

@implementation BKLibraryBookshelfCellMetrics_List

- (BKLibraryBookshelfCellMetrics_List)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfCellMetrics_List;
  v2 = [(BKLibraryBookshelfCellMetrics_Grid *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BKLibraryBookshelfCellMetrics *)v2 setCellType:1];
  }
  return v3;
}

+ (id)sectionName
{
  return @"bookCellListUser";
}

- (void)configureWithSection:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)BKLibraryBookshelfCellMetrics_List;
  id v4 = a3;
  [(BKLibraryBookshelfCellMetrics_Grid *)&v13 configureWithSection:v4];
  [v4 floatForKey:@"cell-height" v13.receiver, v13.super_class];
  -[BKLibraryBookshelfCellMetrics_List setCellHeight:](self, "setCellHeight:");
  [v4 floatForKey:@"small-cell-height"];
  -[BKLibraryBookshelfCellMetrics_List setSmallCellHeight:](self, "setSmallCellHeight:");
  [v4 sizeForKey:@"cover-size"];
  -[BKLibraryBookshelfCellMetrics_List setCoverSize:](self, "setCoverSize:");
  [v4 sizeForKey:@"small-cover-size"];
  -[BKLibraryBookshelfCellMetrics_List setSmallCoverSize:](self, "setSmallCoverSize:");
  [v4 insetsForKey:@"cover-margins"];
  -[BKLibraryBookshelfCellMetrics_List setCoverMargins:](self, "setCoverMargins:");
  [v4 insetsForKey:@"small-cover-margins"];
  -[BKLibraryBookshelfCellMetrics_List setSmallCoverMargins:](self, "setSmallCoverMargins:");
  [v4 floatForKey:@"title-spacing"];
  -[BKLibraryBookshelfCellMetrics_List setTitleSpacing:](self, "setTitleSpacing:");
  [v4 floatForKey:@"author-spacing"];
  -[BKLibraryBookshelfCellMetrics_List setAuthorSpacing:](self, "setAuthorSpacing:");
  [v4 floatForKey:@"edit-margin"];
  -[BKLibraryBookshelfCellMetrics_List setEditModeMargin:](self, "setEditModeMargin:");
  objc_super v5 = [v4 colorForKey:@"sep-color"];
  [(BKLibraryBookshelfCellMetrics_List *)self setSeparatorColor:v5];

  v6 = [v4 colorForKey:@"drag-bar-color"];
  [(BKLibraryBookshelfCellMetrics_List *)self setDragBarTintColor:v6];

  -[BKLibraryBookshelfCellMetrics_List setShrinkInEditMode:](self, "setShrinkInEditMode:", [v4 BOOLForKey:@"edit-mode-shrink"]);
  [v4 floatForKey:@"edit-mode-shrink-amount"];
  -[BKLibraryBookshelfCellMetrics_List setShrinkAmount:](self, "setShrinkAmount:");
  [v4 floatForKey:@"edit-mode-shrink-alpha"];
  -[BKLibraryBookshelfCellMetrics_List setShrinkAlpha:](self, "setShrinkAlpha:");
  [v4 floatForKey:@"drag-corner-radius"];
  -[BKLibraryBookshelfCellMetrics_List setDragCornerRadius:](self, "setDragCornerRadius:");
  [v4 floatForKey:@"drag-shadow-opacity"];
  -[BKLibraryBookshelfCellMetrics_List setDragShadowOpacity:](self, "setDragShadowOpacity:");
  [v4 floatForKey:@"drag-shadow-radius"];
  -[BKLibraryBookshelfCellMetrics_List setDragShadowRadius:](self, "setDragShadowRadius:");
  [v4 floatForKey:@"audiobook-control-diameter"];
  -[BKLibraryBookshelfCellMetrics_List setAudiobookControlDiameter:](self, "setAudiobookControlDiameter:");
  [v4 floatForKey:@"font-scale"];
  -[BKLibraryBookshelfCellMetrics_List setFontScale:](self, "setFontScale:");
  v7 = [v4 fontSpecForKey:@"titleFont"];
  [(BKLibraryBookshelfCellMetrics_List *)self fontScale];
  v8 = [v7 fontSpecWithScale:];
  v9 = [v8 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_List *)self setTitleFontAttributes:v9];

  v10 = [v4 fontSpecForKey:@"authorFont"];

  [(BKLibraryBookshelfCellMetrics_List *)self fontScale];
  v11 = [v10 fontSpecWithScale:];
  v12 = [v11 attributesForAttributedString];
  [(BKLibraryBookshelfCellMetrics_List *)self setAuthorFontAttributes:v12];
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

- (double)audiobookControlDiameter
{
  return self->audiobookControlDiameter;
}

- (void)setAudiobookControlDiameter:(double)a3
{
  self->audiobookControlDiameter = a3;
}

- (CGSize)coverSize
{
  double width = self->_coverSize.width;
  double height = self->_coverSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCoverSize:(CGSize)a3
{
  self->_coverSize = a3;
}

- (CGSize)smallCoverSize
{
  double width = self->_smallCoverSize.width;
  double height = self->_smallCoverSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSmallCoverSize:(CGSize)a3
{
  self->_smallCoverSize = a3;
}

- (UIEdgeInsets)coverMargins
{
  double top = self->_coverMargins.top;
  double left = self->_coverMargins.left;
  double bottom = self->_coverMargins.bottom;
  double right = self->_coverMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCoverMargins:(UIEdgeInsets)a3
{
  self->_coverMargins = a3;
}

- (UIEdgeInsets)smallCoverMargins
{
  double top = self->_smallCoverMargins.top;
  double left = self->_smallCoverMargins.left;
  double bottom = self->_smallCoverMargins.bottom;
  double right = self->_smallCoverMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSmallCoverMargins:(UIEdgeInsets)a3
{
  self->_smallCoverMargins = a3;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (void)setSeparatorColor:(id)a3
{
}

- (UIColor)dragBarTintColor
{
  return self->_dragBarTintColor;
}

- (void)setDragBarTintColor:(id)a3
{
}

- (double)editModeMargin
{
  return self->_editModeMargin;
}

- (void)setEditModeMargin:(double)a3
{
  self->_editModeMargin = a3;
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

- (TUIFontAttributes)authorFontAttributes
{
  return self->_authorFontAttributes;
}

- (void)setAuthorFontAttributes:(id)a3
{
}

- (TUIFontAttributes)titleFontAttributes
{
  return self->_titleFontAttributes;
}

- (void)setTitleFontAttributes:(id)a3
{
}

- (double)fontScale
{
  return self->_fontScale;
}

- (void)setFontScale:(double)a3
{
  self->_fontScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleFontAttributes, 0);
  objc_storeStrong((id *)&self->_authorFontAttributes, 0);
  objc_storeStrong((id *)&self->_dragBarTintColor, 0);

  objc_storeStrong((id *)&self->_separatorColor, 0);
}

@end