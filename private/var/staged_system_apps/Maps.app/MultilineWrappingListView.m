@interface MultilineWrappingListView
- (CGRect)previousFrame;
- (CGSize)intrinsicContentSize;
- (MultilineWrappingListView)initWithCoder:(id)a3;
- (MultilineWrappingListView)initWithFrame:(CGRect)a3;
- (NSMutableArray)items;
- (NSNumber)cachedNumberOfLines;
- (NSNumber)cachedSingleLineWidth;
- (double)_paddingForItem:(id)a3;
- (double)horizontalSpacing;
- (double)interlineSpacing;
- (double)maxLineHeight;
- (double)singleLineWidth;
- (unint64_t)numberOfLines;
- (void)_addArrangedSubview:(id)a3 horizontalSpacing:(id)a4;
- (void)_commonInit;
- (void)_enumerateItemsForPreferredMaxLayoutWidth:(double)a3 block:(id)a4;
- (void)_enumerateLinesForPreferredMaxLayoutWidth:(double)a3 block:(id)a4;
- (void)_invalidateFrameSize;
- (void)_invalidateLayout;
- (void)addArrangedSubview:(id)a3;
- (void)addArrangedSubview:(id)a3 withCustomHorizontalSpacing:(double)a4;
- (void)layoutSubviews;
- (void)setCachedNumberOfLines:(id)a3;
- (void)setCachedSingleLineWidth:(id)a3;
- (void)setHorizontalSpacing:(double)a3;
- (void)setInterlineSpacing:(double)a3;
- (void)setItems:(id)a3;
- (void)setMaxLineHeight:(double)a3;
- (void)setPreviousFrame:(CGRect)a3;
- (void)willRemoveSubview:(id)a3;
@end

@implementation MultilineWrappingListView

- (MultilineWrappingListView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MultilineWrappingListView;
  v3 = [(MultilineWrappingListView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(MultilineWrappingListView *)v3 _commonInit];
  }
  return v4;
}

- (MultilineWrappingListView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MultilineWrappingListView;
  v3 = -[MultilineWrappingListView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MultilineWrappingListView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = (NSMutableArray *)objc_opt_new();
  items = self->_items;
  self->_items = v3;

  [(MultilineWrappingListView *)self frame];
  self->_previousFrame.origin.x = v5;
  self->_previousFrame.origin.y = v6;
  self->_previousFrame.size.width = v7;
  self->_previousFrame.size.height = v8;
}

- (unint64_t)numberOfLines
{
  v3 = [(MultilineWrappingListView *)self cachedNumberOfLines];

  if (!v3)
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v12 = 0;
    [(MultilineWrappingListView *)self bounds];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100C3A390;
    v8[3] = &unk_10131C0C8;
    v8[4] = &v9;
    [(MultilineWrappingListView *)self _enumerateLinesForPreferredMaxLayoutWidth:v8 block:CGRectGetWidth(v13)];
    v4 = +[NSNumber numberWithUnsignedInteger:v10[3]];
    [(MultilineWrappingListView *)self setCachedNumberOfLines:v4];

    _Block_object_dispose(&v9, 8);
  }
  CGFloat v5 = [(MultilineWrappingListView *)self cachedNumberOfLines];
  id v6 = [v5 unsignedIntegerValue];

  return (unint64_t)v6;
}

- (double)singleLineWidth
{
  v3 = [(MultilineWrappingListView *)self cachedSingleLineWidth];

  if (!v3)
  {
    uint64_t v10 = 0;
    uint64_t v11 = (double *)&v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100C3A4D0;
    v9[3] = &unk_10131C0C8;
    v9[4] = &v10;
    [(MultilineWrappingListView *)self _enumerateLinesForPreferredMaxLayoutWidth:v9 block:3.40282347e38];
    v4 = +[NSNumber numberWithDouble:v11[3]];
    [(MultilineWrappingListView *)self setCachedSingleLineWidth:v4];

    _Block_object_dispose(&v10, 8);
  }
  CGFloat v5 = [(MultilineWrappingListView *)self cachedSingleLineWidth];
  [v5 floatValue];
  double v7 = v6;

  return v7;
}

- (void)addArrangedSubview:(id)a3
{
}

- (void)addArrangedSubview:(id)a3 withCustomHorizontalSpacing:(double)a4
{
  id v6 = a3;
  id v7 = +[NSNumber numberWithDouble:a4];
  [(MultilineWrappingListView *)self _addArrangedSubview:v6 horizontalSpacing:v7];
}

- (void)_addArrangedSubview:(id)a3 horizontalSpacing:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v10 = [[StackViewItem alloc] initWithView:v7 horizontalSpacing:v6];

  CGFloat v8 = [(MultilineWrappingListView *)self items];
  [v8 addObject:v10];

  uint64_t v9 = [(StackViewItem *)v10 view];
  [(MultilineWrappingListView *)self addSubview:v9];

  [(MultilineWrappingListView *)self _invalidateLayout];
}

- (void)willRemoveSubview:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(MultilineWrappingListView *)self items];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100C3A73C;
  v9[3] = &unk_10131C0F0;
  id v6 = v4;
  id v10 = v6;
  id v7 = [v5 indexOfObjectPassingTest:v9];

  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    CGFloat v8 = [(MultilineWrappingListView *)self items];
    [v8 removeObjectAtIndex:v7];

    [(MultilineWrappingListView *)self _invalidateLayout];
  }
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)MultilineWrappingListView;
  [(MultilineWrappingListView *)&v10 layoutSubviews];
  [(MultilineWrappingListView *)self bounds];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100C3A868;
  v9[3] = &unk_10131C118;
  void v9[4] = self;
  [(MultilineWrappingListView *)self _enumerateItemsForPreferredMaxLayoutWidth:v9 block:CGRectGetWidth(v11)];
  [(MultilineWrappingListView *)self previousFrame];
  double v4 = v3;
  double v6 = v5;
  [(MultilineWrappingListView *)self frame];
  if (v4 != v8 || v6 != v7)
  {
    [(MultilineWrappingListView *)self frame];
    -[MultilineWrappingListView setPreviousFrame:](self, "setPreviousFrame:");
    [(MultilineWrappingListView *)self _invalidateFrameSize];
  }
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(MultilineWrappingListView *)self items];
  id v4 = [v3 count];

  if (v4)
  {
    [(MultilineWrappingListView *)self bounds];
    double Width = CGRectGetWidth(v17);
    if (fabs(Width) <= 2.22044605e-16) {
      double Width = 1.79769313e308;
    }
    uint64_t v11 = 0;
    uint64_t v12 = (double *)&v11;
    uint64_t v13 = 0x3010000000;
    v14 = &unk_1011B93F2;
    CGSize v15 = CGSizeZero;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100C3AA74;
    v10[3] = &unk_10131C0C8;
    v10[4] = &v11;
    [(MultilineWrappingListView *)self _enumerateLinesForPreferredMaxLayoutWidth:v10 block:Width];
    CGFloat v6 = v12[4];
    CGFloat v7 = v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    CGFloat v6 = UIViewNoIntrinsicMetric;
    CGFloat v7 = UIViewNoIntrinsicMetric;
  }
  double v8 = v6;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_invalidateLayout
{
  [(MultilineWrappingListView *)self setCachedSingleLineWidth:0];

  [(MultilineWrappingListView *)self _invalidateFrameSize];
}

- (void)_invalidateFrameSize
{
  [(MultilineWrappingListView *)self setCachedNumberOfLines:0];

  [(MultilineWrappingListView *)self invalidateIntrinsicContentSize];
}

- (void)_enumerateItemsForPreferredMaxLayoutWidth:(double)a3 block:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C3AC78;
  v6[3] = &unk_10131C140;
  CGFloat v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(MultilineWrappingListView *)v7 _enumerateLinesForPreferredMaxLayoutWidth:v6 block:a3];
}

- (void)_enumerateLinesForPreferredMaxLayoutWidth:(double)a3 block:(id)a4
{
  CGFloat v6 = (void (**)(id, id, double, double, double, double))a4;
  CGFloat v7 = objc_opt_new();
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100C3B1A8;
  v48[3] = &unk_10131C168;
  v48[4] = self;
  uint64_t v12 = objc_retainBlock(v48);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = [(MultilineWrappingListView *)self items];
  id v13 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v45;
    v42 = v12 + 16;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(obj);
        }
        CGRect v17 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v18 = [v17 view];
        [v18 _mapkit_fittingSize];
        double v20 = v19;
        double v22 = v21;

        if ([v7 count])
        {
          [(MultilineWrappingListView *)self _paddingForItem:v17];
          double v20 = v20 + v23;
        }
        v50.origin.double x = x;
        v50.origin.double y = y;
        v50.size.double width = width;
        v50.size.double height = height;
        if (v20 + CGRectGetMaxX(v50) > a3)
        {
          double v24 = (*((double (**)(char *, double, double, double, double))v12 + 2))(v12, x, y, width, height);
          double v26 = v25;
          double v28 = v27;
          double v30 = v29;
          id v31 = [v7 copy];
          v6[2](v6, v31, v24, v26, v28, v30);

          v51.origin.double x = v24;
          v51.origin.double y = v26;
          v51.size.double width = v28;
          v51.size.double height = v30;
          double MaxY = CGRectGetMaxY(v51);
          [(MultilineWrappingListView *)self interlineSpacing];
          double y = MaxY + v33;
          [v7 removeAllObjects];
          double height = 0.0;
          double width = 0.0;
          double x = 0.0;
        }
        [v7 addObject:v17];
        double width = v20 + width;
        if (height <= v22) {
          double height = v22;
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v14);
  }

  if ([v7 count])
  {
    double v34 = (*((double (**)(char *, double, double, double, double))v12 + 2))(v12, x, y, width, height);
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    id v41 = [v7 copy];
    v6[2](v6, v41, v34, v36, v38, v40);
  }
}

- (double)_paddingForItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 horizontalSpacing];
  if (v5)
  {
    CGFloat v6 = [v4 horizontalSpacing];
    [v6 floatValue];
    double v8 = v7;
  }
  else
  {
    [(MultilineWrappingListView *)self horizontalSpacing];
    double v8 = v9;
  }

  return v8;
}

- (double)horizontalSpacing
{
  return self->_horizontalSpacing;
}

- (void)setHorizontalSpacing:(double)a3
{
  self->_horizontalSpacing = a3;
}

- (double)interlineSpacing
{
  return self->_interlineSpacing;
}

- (void)setInterlineSpacing:(double)a3
{
  self->_interlineSpacing = a3;
}

- (double)maxLineHeight
{
  return self->_maxLineHeight;
}

- (void)setMaxLineHeight:(double)a3
{
  self->_maxLineHeight = a3;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSNumber)cachedNumberOfLines
{
  return self->_cachedNumberOfLines;
}

- (void)setCachedNumberOfLines:(id)a3
{
}

- (NSNumber)cachedSingleLineWidth
{
  return self->_cachedSingleLineWidth;
}

- (void)setCachedSingleLineWidth:(id)a3
{
}

- (CGRect)previousFrame
{
  double x = self->_previousFrame.origin.x;
  double y = self->_previousFrame.origin.y;
  double width = self->_previousFrame.size.width;
  double height = self->_previousFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousFrame:(CGRect)a3
{
  self->_previousFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSingleLineWidth, 0);
  objc_storeStrong((id *)&self->_cachedNumberOfLines, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end