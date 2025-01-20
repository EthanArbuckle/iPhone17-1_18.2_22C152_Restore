@interface CenteringCellLayoutManager
+ (id)layoutManagerForTableViewCellStyle:(int64_t)a3;
- (CGRect)_adjustedContentViewFrame:(CGRect)a3 cell:(id)a4 rowWidth:(double)a5 accessoryViewFrame:(CGRect)a6;
- (CGRect)_offsetAccessoryViewFrame:(CGRect)a3 forCell:(id)a4;
- (CGRect)accessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)accessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5;
- (CGRect)contentEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4;
- (CGRect)contentRectForCell:(id)a3 forState:(unint64_t)a4 rowWidth:(double)a5;
- (CGRect)contentStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4;
- (CenteringCellLayoutManager)initWithTableViewCellStyle:(int64_t)a3;
- (UIEdgeInsets)_marginForRowWith:(double)a3;
- (UIEdgeInsets)minimumHorizontalMargins;
- (double)maximumCellContentWidth;
- (void)setMaximumCellContentWidth:(double)a3;
- (void)setMinimumHorizontalMargins:(UIEdgeInsets)a3;
@end

@implementation CenteringCellLayoutManager

+ (id)layoutManagerForTableViewCellStyle:(int64_t)a3
{
  id v3 = [objc_alloc((Class)a1) initWithTableViewCellStyle:a3];

  return v3;
}

- (CenteringCellLayoutManager)initWithTableViewCellStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CenteringCellLayoutManager;
  id v3 = [(CenteringCellLayoutManager *)&v7 init];
  v4 = v3;
  if (v3)
  {
    v3->_maximumCellContentWidth = 1.79769313e308;
    v5 = v3;
  }

  return v4;
}

- (CGRect)contentRectForCell:(id)a3 forState:(unint64_t)a4 rowWidth:(double)a5
{
  v33.receiver = self;
  v33.super_class = (Class)CenteringCellLayoutManager;
  id v8 = a3;
  [(CenteringCellLayoutManager *)&v33 contentRectForCell:v8 forState:a4 rowWidth:a5];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  -[CenteringCellLayoutManager accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:](self, "accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", v8, [v8 isEditing], [v8 showingDeleteConfirmation]);
  -[CenteringCellLayoutManager _adjustedContentViewFrame:cell:rowWidth:accessoryViewFrame:](self, "_adjustedContentViewFrame:cell:rowWidth:accessoryViewFrame:", v8, v10, v12, v14, v16, a5, v17, v18, v19, v20, v33.receiver, v33.super_class);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  double v29 = v22;
  double v30 = v24;
  double v31 = v26;
  double v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)contentStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  BOOL v4 = a4;
  v35.receiver = self;
  v35.super_class = (Class)CenteringCellLayoutManager;
  id v6 = a3;
  [(CenteringCellLayoutManager *)&v35 contentStartingRectForCell:v6 forNewEditingState:v4];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  -[CenteringCellLayoutManager accessoryStartingRectForCell:forNewEditingState:showingDeleteConfirmation:](self, "accessoryStartingRectForCell:forNewEditingState:showingDeleteConfirmation:", v6, v4, [v6 showingDeleteConfirmation]);
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  [v6 bounds];
  -[CenteringCellLayoutManager _adjustedContentViewFrame:cell:rowWidth:accessoryViewFrame:](self, "_adjustedContentViewFrame:cell:rowWidth:accessoryViewFrame:", v6, v8, v10, v12, v14, CGRectGetWidth(v36), v16, v18, v20, v22, v35.receiver, v35.super_class);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  double v31 = v24;
  double v32 = v26;
  double v33 = v28;
  double v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (CGRect)contentEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  BOOL v4 = a4;
  v35.receiver = self;
  v35.super_class = (Class)CenteringCellLayoutManager;
  id v6 = a3;
  [(CenteringCellLayoutManager *)&v35 contentEndingRectForCell:v6 forNewEditingState:v4];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  -[CenteringCellLayoutManager accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:](self, "accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", v6, v4, [v6 showingDeleteConfirmation]);
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  [v6 bounds];
  -[CenteringCellLayoutManager _adjustedContentViewFrame:cell:rowWidth:accessoryViewFrame:](self, "_adjustedContentViewFrame:cell:rowWidth:accessoryViewFrame:", v6, v8, v10, v12, v14, CGRectGetWidth(v36), v16, v18, v20, v22, v35.receiver, v35.super_class);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  double v31 = v24;
  double v32 = v26;
  double v33 = v28;
  double v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (CGRect)_adjustedContentViewFrame:(CGRect)a3 cell:(id)a4 rowWidth:(double)a5 accessoryViewFrame:(CGRect)a6
{
  CGFloat y = a3.origin.y;
  CGFloat height = a3.size.height;
  id v8 = a4;
  [(CenteringCellLayoutManager *)self _marginForRowWith:a5];
  double v10 = v9;
  double v12 = v11;
  id v13 = [v8 semanticContentAttribute];

  UIUserInterfaceLayoutDirection v14 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:v13];
  if (v14 == UIUserInterfaceLayoutDirectionRightToLeft) {
    double v15 = v12;
  }
  else {
    double v15 = v10;
  }
  double v16 = a5 - (v10 + v12);
  v31.origin.x = CGRectZero.origin.x;
  v31.origin.CGFloat y = CGRectZero.origin.y;
  v31.size.width = CGRectZero.size.width;
  v31.size.CGFloat height = CGRectZero.size.height;
  if (CGRectEqualToRect(v31, a6))
  {
    CGFloat v18 = y;
    CGFloat v17 = height;
  }
  else if (v14 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    double MaxX = CGRectGetMaxX(a6);
    v32.origin.x = v12;
    CGFloat v18 = y;
    CGFloat v17 = height;
    v32.origin.CGFloat y = y;
    v32.size.width = v16;
    v32.size.CGFloat height = height;
    double v20 = MaxX - CGRectGetMinX(v32);
    [(CenteringCellLayoutManager *)self minimumHorizontalMargins];
    double v16 = v16 - (v20 + v21);
    double v15 = v12 + v20 + v21;
  }
  else
  {
    v33.origin.x = v10;
    v33.origin.CGFloat y = y;
    v33.size.width = v16;
    v33.size.CGFloat height = height;
    double v28 = CGRectGetMaxX(v33);
    CGFloat v18 = y;
    CGFloat v17 = height;
    double v22 = v28 - CGRectGetMinX(a6);
    [(CenteringCellLayoutManager *)self minimumHorizontalMargins];
    double v16 = v16 - (v22 + v23);
    double v15 = v10;
  }
  double v24 = v15;
  double v25 = v18;
  double v26 = v16;
  double v27 = v17;
  result.size.CGFloat height = v27;
  result.size.width = v26;
  result.origin.CGFloat y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)accessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CenteringCellLayoutManager;
  id v8 = a3;
  [(CenteringCellLayoutManager *)&v21 accessoryStartingRectForCell:v8 forNewEditingState:v6 showingDeleteConfirmation:v5];
  -[CenteringCellLayoutManager _offsetAccessoryViewFrame:forCell:](self, "_offsetAccessoryViewFrame:forCell:", v8, v21.receiver, v21.super_class);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.CGFloat height = v20;
  result.size.width = v19;
  result.origin.CGFloat y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)accessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CenteringCellLayoutManager;
  id v8 = a3;
  [(CenteringCellLayoutManager *)&v21 accessoryEndingRectForCell:v8 forNewEditingState:v6 showingDeleteConfirmation:v5];
  -[CenteringCellLayoutManager _offsetAccessoryViewFrame:forCell:](self, "_offsetAccessoryViewFrame:forCell:", v8, v21.receiver, v21.super_class);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.CGFloat height = v20;
  result.size.width = v19;
  result.origin.CGFloat y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)_offsetAccessoryViewFrame:(CGRect)a3 forCell:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  v17.origin.CGFloat x = CGRectZero.origin.x;
  v17.origin.CGFloat y = CGRectZero.origin.y;
  v17.size.CGFloat width = CGRectZero.size.width;
  v17.size.CGFloat height = CGRectZero.size.height;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double v10 = x;
  if (!CGRectEqualToRect(v17, v22))
  {
    [v9 bounds];
    [(CenteringCellLayoutManager *)self _marginForRowWith:CGRectGetWidth(v18)];
    double v10 = v11;
    if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [v9 semanticContentAttribute]) != (id)1)
    {
      [v9 bounds];
      double MaxX = CGRectGetMaxX(v19);
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.CGFloat width = width;
      v20.size.CGFloat height = height;
      double v10 = MaxX - CGRectGetWidth(v20) - v10;
    }
  }

  double v13 = v10;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (UIEdgeInsets)_marginForRowWith:(double)a3
{
  [(CenteringCellLayoutManager *)self maximumCellContentWidth];
  double v6 = a3 - v5;
  [(CenteringCellLayoutManager *)self minimumHorizontalMargins];
  double v8 = v7;
  [(CenteringCellLayoutManager *)self minimumHorizontalMargins];
  if (v6 <= v8 + v9)
  {
    [(CenteringCellLayoutManager *)self minimumHorizontalMargins];
  }
  else
  {
    double v10 = v6 * 0.5;
    double v11 = 0.0;
    double v12 = v6 * 0.5;
    double v13 = 0.0;
  }
  result.right = v12;
  result.bottom = v13;
  result.left = v10;
  result.top = v11;
  return result;
}

- (double)maximumCellContentWidth
{
  return self->_maximumCellContentWidth;
}

- (void)setMaximumCellContentWidth:(double)a3
{
  self->_maximumCellContentWidth = a3;
}

- (UIEdgeInsets)minimumHorizontalMargins
{
  double top = self->_minimumHorizontalMargins.top;
  double left = self->_minimumHorizontalMargins.left;
  double bottom = self->_minimumHorizontalMargins.bottom;
  double right = self->_minimumHorizontalMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMinimumHorizontalMargins:(UIEdgeInsets)a3
{
  self->_minimumHorizontalMargins = a3;
}

@end