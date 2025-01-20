@interface BookmarksTableViewCellLayoutManager
+ (id)sharedManager;
- (CGRect)accessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)accessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5;
- (NSString)currentContentSizeCategory;
- (int64_t)_numberOfLinesForCurrentContentSize;
- (void)layoutSubviewsOfCell:(id)a3;
- (void)setCurrentContentSizeCategory:(id)a3;
@end

@implementation BookmarksTableViewCellLayoutManager

+ (id)sharedManager
{
  v3 = (void *)sharedManager_sharedManager;
  if (!sharedManager_sharedManager)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedManager_sharedManager;
    sharedManager_sharedManager = (uint64_t)v4;

    v3 = (void *)sharedManager_sharedManager;
  }
  return v3;
}

- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BookmarksTableViewCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v22 textRectForCell:v8 rowWidth:v5 forSizing:a4];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if (![(UITableViewCellLayoutManager *)self accessoryShouldAppearForCell:v8])
  {
    [v8 separatorInset];
    double v14 = v14 - v17;
  }

  double v18 = v10;
  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)accessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BookmarksTableViewCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v18 accessoryStartingRectForCell:v8 forNewEditingState:v6 showingDeleteConfirmation:v5];
  double x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  if (!CGRectIsEmpty(v19))
  {
    [v8 separatorInset];
    double x = x - v13;
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)accessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BookmarksTableViewCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v18 accessoryEndingRectForCell:v8 forNewEditingState:v6 showingDeleteConfirmation:v5];
  double x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  if (!CGRectIsEmpty(v19))
  {
    [v8 separatorInset];
    double x = x - v13;
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.double x = v14;
  return result;
}

- (int64_t)_numberOfLinesForCurrentContentSize
{
  v2 = [(BookmarksTableViewCellLayoutManager *)self currentContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v2);

  if (IsAccessibilityCategory) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)layoutSubviewsOfCell:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BookmarksTableViewCellLayoutManager;
  [(UITableViewCellLayoutManager *)&v32 layoutSubviewsOfCell:v4];
  char v5 = [v4 _shouldReverseLayoutDirection];
  [v4 separatorInset];
  double v7 = v6;
  id v8 = [(BookmarksTableViewCellLayoutManager *)self currentContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v8);

  if (IsAccessibilityCategory) {
    double v7 = 20.0;
  }
  double v10 = [v4 imageView];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if (v5)
  {
    double v17 = [v4 contentView];
    [v17 bounds];
    double MaxX = CGRectGetMaxX(v33);

    _SFRoundFloatToPixels();
    double v20 = fmin(MaxX - (v7 - v19 - v14) - v14, MaxX + -8.0);
  }
  else
  {
    _SFRoundFloatToPixels();
    double v20 = fmax(v7 - v21 - v14, 8.0);
  }
  objc_msgSend(v10, "setFrame:", v20, v12, v14, v16);
  objc_super v22 = [v4 textLabel];
  objc_msgSend(v22, "setNumberOfLines:", -[BookmarksTableViewCellLayoutManager _numberOfLinesForCurrentContentSize](self, "_numberOfLinesForCurrentContentSize"));
  [v22 frame];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  if (v5)
  {
    v29 = [v4 contentView];
    [v29 bounds];
    CGFloat v30 = CGRectGetMaxX(v34) - v7 - v26;

    [v4 frame];
    [(BookmarksTableViewCellLayoutManager *)self textRectForCell:v4 rowWidth:0 forSizing:CGRectGetWidth(v35)];
    double v31 = fmin(v26, CGRectGetMaxX(v36) - v30);
    double v7 = v30 + v26 - v31;
  }
  else
  {
    [v4 frame];
    [(BookmarksTableViewCellLayoutManager *)self textRectForCell:v4 rowWidth:0 forSizing:CGRectGetWidth(v37)];
    double v31 = fmin(v26, CGRectGetMaxX(v38) - v7);
  }
  objc_msgSend(v22, "setFrame:", v7, v24, v31, v28);
}

- (NSString)currentContentSizeCategory
{
  return self->_currentContentSizeCategory;
}

- (void)setCurrentContentSizeCategory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end