@interface TKTonePickerTableViewCellLayoutManager
- (CGRect)_adjustedTextFrameWithOriginalTextFrame:(CGRect)a3 forCell:(id)a4;
- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5;
- (double)minimumTextIndentation;
- (void)setMinimumTextIndentation:(double)a3;
@end

@implementation TKTonePickerTableViewCellLayoutManager

- (CGRect)_adjustedTextFrameWithOriginalTextFrame:(CGRect)a3 forCell:(id)a4
{
  CGFloat y = a3.origin.y;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double x = a3.origin.x;
  id v6 = a4;
  v7 = [v6 contentView];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  [v6 safeAreaInsets];
  double v17 = v16;
  double v19 = v18;
  v20 = (void *)MEMORY[0x263F1CB60];
  uint64_t v21 = [v6 semanticContentAttribute];

  uint64_t v22 = [v20 userInterfaceLayoutDirectionForSemanticContentAttribute:v21];
  [(TKTonePickerTableViewCellLayoutManager *)self minimumTextIndentation];
  double v24 = v23;
  if (v22)
  {
    v40.origin.double x = v9;
    v40.origin.CGFloat y = v11;
    v40.size.CGFloat width = v13;
    v40.size.CGFloat height = v15;
    double MaxX = CGRectGetMaxX(v40);
    v41.origin.double x = x;
    double v27 = width;
    CGFloat v26 = y;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    CGFloat v28 = height;
    v41.size.CGFloat height = height;
    double MinX = MaxX - CGRectGetMaxX(v41);
    double v17 = v19;
  }
  else
  {
    v42.origin.double x = x;
    double v27 = width;
    CGFloat v26 = y;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    CGFloat v28 = height;
    v42.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v42);
  }
  double v30 = v24 - MinX - v17;
  double v31 = 0.0;
  if (v30 >= 0.0) {
    double v31 = v30;
  }
  double v32 = -0.0;
  if (!v22) {
    double v32 = v31;
  }
  double v33 = x + v32;
  double v34 = v27 - v31;
  double v35 = v26;
  double v36 = v28;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v35;
  result.origin.double x = v33;
  return result;
}

- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5
{
  BOOL v5 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TKTonePickerTableViewCellLayoutManager;
  id v8 = a3;
  [(UITableViewCellLayoutManager *)&v21 textRectForCell:v8 rowWidth:v5 forSizing:a4];
  -[TKTonePickerTableViewCellLayoutManager _adjustedTextFrameWithOriginalTextFrame:forCell:](self, "_adjustedTextFrameWithOriginalTextFrame:forCell:", v8, v21.receiver, v21.super_class);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.double x = v17;
  return result;
}

- (double)minimumTextIndentation
{
  return self->_minimumTextIndentation;
}

- (void)setMinimumTextIndentation:(double)a3
{
  self->_minimumTextIndentation = a3;
}

@end