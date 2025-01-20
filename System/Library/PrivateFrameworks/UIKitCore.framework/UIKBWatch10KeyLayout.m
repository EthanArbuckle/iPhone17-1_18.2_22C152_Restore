@interface UIKBWatch10KeyLayout
- (CGRect)frameForGridKeyAt:(int64_t)a3 inRow:(int64_t)a4;
- (CGRect)frameForLeftControlKeyAt:(int64_t)a3;
- (CGRect)frameForRightControlKeyAt:(int64_t)a3;
- (UIEdgeInsets)leftControlKeysInsets;
- (UIEdgeInsets)rightControlKeysInsets;
- (UIKBWatch10KeyLayout)initWithFrame:(CGRect)a3;
- (double)controlKeyWidthRatio;
- (id)layoutControlKeys:(int64_t)a3 in:(CGRect)a4;
- (int64_t)gridColumns;
- (int64_t)gridRows;
- (int64_t)leftControlKeys;
- (int64_t)rightControlKeys;
- (void)layout;
- (void)setControlKeyWidthRatio:(double)a3;
- (void)setGridColumns:(int64_t)a3;
- (void)setGridRows:(int64_t)a3;
- (void)setLeftControlKeys:(int64_t)a3;
- (void)setLeftControlKeysInsets:(UIEdgeInsets)a3;
- (void)setRightControlKeys:(int64_t)a3;
- (void)setRightControlKeysInsets:(UIEdgeInsets)a3;
@end

@implementation UIKBWatch10KeyLayout

- (UIKBWatch10KeyLayout)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)UIKBWatch10KeyLayout;
  v7 = [(UIKBWatch10KeyLayout *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_frame.origin.CGFloat x = x;
    v7->_frame.origin.CGFloat y = y;
    v7->_frame.size.CGFloat width = width;
    v7->_frame.size.CGFloat height = height;
    [(UIKBWatch10KeyLayout *)v7 setLeftControlKeys:1];
    [(UIKBWatch10KeyLayout *)v8 setRightControlKeys:1];
    [(UIKBWatch10KeyLayout *)v8 setGridRows:1];
    [(UIKBWatch10KeyLayout *)v8 setGridColumns:1];
    [(UIKBWatch10KeyLayout *)v8 setControlKeyWidthRatio:1.0];
  }
  return v8;
}

- (CGRect)frameForLeftControlKeyAt:(int64_t)a3
{
  v3 = [(NSArray *)self->_leftControlKeyFrames objectAtIndexedSubscript:a3];
  [v3 rectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)frameForRightControlKeyAt:(int64_t)a3
{
  v3 = [(NSArray *)self->_rightControlKeyFrames objectAtIndexedSubscript:a3];
  [v3 rectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)frameForGridKeyAt:(int64_t)a3 inRow:(int64_t)a4
{
  double v5 = [(NSMutableArray *)self->_gridKeyFrames objectAtIndexedSubscript:a3];
  double v6 = [v5 objectAtIndexedSubscript:a4];
  [v6 rectValue];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)layout
{
  [(UIKBWatch10KeyLayout *)self controlKeyWidthRatio];
  [(UIKBWatch10KeyLayout *)self gridColumns];
  v3 = +[UIScreen mainScreen];
  UIRoundToScreenScale(v3);
  double v5 = v4;

  [(UIKBWatch10KeyLayout *)self controlKeyWidthRatio];
  double v6 = +[UIScreen mainScreen];
  UIRoundToScreenScale(v6);
  double v8 = v7;

  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double height = self->_frame.size.height;
  [(UIKBWatch10KeyLayout *)self leftControlKeysInsets];
  -[UIKBWatch10KeyLayout layoutControlKeys:in:](self, "layoutControlKeys:in:", [(UIKBWatch10KeyLayout *)self leftControlKeys], x + v12, y + v13, v8 - (v12 + v14), height - (v13 + v15));
  double v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  leftControlKeyFrames = self->_leftControlKeyFrames;
  self->_leftControlKeyFrames = v16;

  double v18 = v8 + x;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[UIKBWatch10KeyLayout gridColumns](self, "gridColumns"));
  v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  gridKeyFrames = self->_gridKeyFrames;
  self->_gridKeyFrames = v19;

  [(UIKBWatch10KeyLayout *)self gridRows];
  v21 = +[UIScreen mainScreen];
  UIRoundToScreenScale(v21);
  double v23 = v22;

  if ([(UIKBWatch10KeyLayout *)self gridColumns] >= 1)
  {
    int64_t v24 = 0;
    do
    {
      v25 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[UIKBWatch10KeyLayout gridColumns](self, "gridColumns"));
      if ([(UIKBWatch10KeyLayout *)self gridRows] >= 1)
      {
        uint64_t v26 = 0;
        do
        {
          CGFloat v27 = self->_frame.origin.y + v23 * (double)v26;
          *(double *)v37 = v18;
          *(CGFloat *)&v37[1] = v27;
          *(double *)&v37[2] = v5;
          *(double *)&v37[3] = v23;
          v28 = [MEMORY[0x1E4F29238] valueWithBytes:v37 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
          [v25 addObject:v28];

          ++v26;
        }
        while (v26 < [(UIKBWatch10KeyLayout *)self gridRows]);
      }
      [(NSMutableArray *)self->_gridKeyFrames addObject:v25];
      double v18 = v5 + v18;

      ++v24;
    }
    while (v24 < [(UIKBWatch10KeyLayout *)self gridColumns]);
  }
  double v29 = self->_frame.origin.y;
  double v30 = self->_frame.size.height;
  [(UIKBWatch10KeyLayout *)self rightControlKeysInsets];
  -[UIKBWatch10KeyLayout layoutControlKeys:in:](self, "layoutControlKeys:in:", [(UIKBWatch10KeyLayout *)self rightControlKeys], v18 + v31, v29 + v32, v8 - (v31 + v33), v30 - (v32 + v34));
  v35 = (NSArray *)objc_claimAutoreleasedReturnValue();
  rightControlKeyFrames = self->_rightControlKeyFrames;
  self->_rightControlKeyFrames = v35;
}

- (id)layoutControlKeys:(int64_t)a3 in:(CGRect)a4
{
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
  double v9 = +[UIScreen mainScreen];
  UIRoundToScreenScale(v9);
  double v11 = v10;

  if (a3 >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      *(CGFloat *)double v15 = x;
      *(double *)&v15[1] = y + v11 * (double)v12;
      *(CGFloat *)&v15[2] = width;
      *(double *)&v15[3] = v11;
      double v13 = [MEMORY[0x1E4F29238] valueWithBytes:v15 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      [v8 addObject:v13];

      ++v12;
    }
    while (a3 != v12);
  }
  return v8;
}

- (int64_t)leftControlKeys
{
  return self->_leftControlKeys;
}

- (void)setLeftControlKeys:(int64_t)a3
{
  self->_leftControlKeys = a3;
}

- (UIEdgeInsets)leftControlKeysInsets
{
  double top = self->_leftControlKeysInsets.top;
  double left = self->_leftControlKeysInsets.left;
  double bottom = self->_leftControlKeysInsets.bottom;
  double right = self->_leftControlKeysInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLeftControlKeysInsets:(UIEdgeInsets)a3
{
  self->_leftControlKeysInsets = a3;
}

- (int64_t)gridRows
{
  return self->_gridRows;
}

- (void)setGridRows:(int64_t)a3
{
  self->_gridRows = a3;
}

- (int64_t)gridColumns
{
  return self->_gridColumns;
}

- (void)setGridColumns:(int64_t)a3
{
  self->_gridColumns = a3;
}

- (int64_t)rightControlKeys
{
  return self->_rightControlKeys;
}

- (void)setRightControlKeys:(int64_t)a3
{
  self->_rightControlKeys = a3;
}

- (UIEdgeInsets)rightControlKeysInsets
{
  double top = self->_rightControlKeysInsets.top;
  double left = self->_rightControlKeysInsets.left;
  double bottom = self->_rightControlKeysInsets.bottom;
  double right = self->_rightControlKeysInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setRightControlKeysInsets:(UIEdgeInsets)a3
{
  self->_rightControlKeysInsets = a3;
}

- (double)controlKeyWidthRatio
{
  return self->_controlKeyWidthRatio;
}

- (void)setControlKeyWidthRatio:(double)a3
{
  self->_controlKeyWidthRatio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridKeyFrames, 0);
  objc_storeStrong((id *)&self->_rightControlKeyFrames, 0);
  objc_storeStrong((id *)&self->_leftControlKeyFrames, 0);
}

@end