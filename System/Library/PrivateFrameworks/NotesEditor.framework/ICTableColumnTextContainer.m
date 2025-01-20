@interface ICTableColumnTextContainer
- (CGRect)lineFragmentRectForProposedRect:(CGRect)a3 atIndex:(unint64_t)a4 writingDirection:(int64_t)a5 remainingRect:(CGRect *)a6;
- (void)setSize:(CGSize)a3;
@end

@implementation ICTableColumnTextContainer

- (CGRect)lineFragmentRectForProposedRect:(CGRect)a3 atIndex:(unint64_t)a4 writingDirection:(int64_t)a5 remainingRect:(CGRect *)a6
{
  v31.receiver = self;
  v31.super_class = (Class)ICTableColumnTextContainer;
  -[ICTextContainer lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:](&v31, sel_lineFragmentRectForProposedRect_atIndex_writingDirection_remainingRect_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  objc_opt_class();
  v16 = [(ICTableColumnTextContainer *)self layoutManager];
  v17 = ICDynamicCast();

  v18 = [v17 columnTextStorage];
  v19 = [v17 tableLayoutManager];
  v30[0] = 0;
  v30[1] = 0;
  v20 = [v18 rowAtIndex:a4 rowRange:v30];
  if (v30[0] == a4)
  {
    v21 = [v19 rowPositions];
    v22 = [v21 objectForKey:v20];

    if (v22)
    {
      v23 = [v19 rowPositions];
      v24 = [v23 objectForKey:v20];
      [v24 doubleValue];
      double v11 = v25;
    }
  }

  double v26 = v9;
  double v27 = v11;
  double v28 = v13;
  double v29 = v15;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)setSize:(CGSize)a3
{
  double width = a3.width;
  [(ICTableColumnTextContainer *)self size];
  if (width != v6 || v5 != 1.79769313e308)
  {
    v8.receiver = self;
    v8.super_class = (Class)ICTableColumnTextContainer;
    -[ICTableColumnTextContainer setSize:](&v8, sel_setSize_, width, 1.79769313e308);
  }
}

@end