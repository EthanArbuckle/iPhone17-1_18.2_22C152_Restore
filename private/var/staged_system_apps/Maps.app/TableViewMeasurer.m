@interface TableViewMeasurer
- (CGRect)rectForHeaderInSection:(int64_t)a3;
- (CGRect)rectForRowAtIndexPath:(id)a3;
- (MeasurableView)view;
- (TableViewMeasurer)initWithMeasurableView:(id)a3;
- (double)fittingHeight;
- (id)headerRectCache;
- (id)rowRectCache;
- (void)_measureRectsUntilRowAtIndexPath:(id)a3;
- (void)_updateForCurrentTableWidth;
- (void)invalidatePreviousMeasurements;
- (void)setView:(id)a3;
@end

@implementation TableViewMeasurer

- (TableViewMeasurer)initWithMeasurableView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TableViewMeasurer;
  v5 = [(TableViewMeasurer *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    v7 = v6;
  }

  return v6;
}

- (void)setView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_view, obj);
    [(TableViewMeasurer *)self invalidatePreviousMeasurements];
    v5 = obj;
  }
}

- (double)fittingHeight
{
  v3 = [(TableViewMeasurer *)self view];
  [v3 layoutIfNeeded];

  id v4 = [(TableViewMeasurer *)self view];
  [v4 _maps_commitUpdates];

  v5 = [(TableViewMeasurer *)self view];
  [v5 _maps_contentSize];
  double v7 = v6;

  return v7;
}

- (CGRect)rectForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  id v6 = [v4 section];
  double v7 = [(TableViewMeasurer *)self view];
  id v8 = [v7 _maps_numberOfSections];

  if ((uint64_t)v6 >= (uint64_t)v8) {
    goto LABEL_7;
  }
  id v9 = [v5 row];
  v10 = [(TableViewMeasurer *)self view];
  id v11 = [v10 _maps_numberOfRowsInSection:[v5 section]];

  if ((uint64_t)v9 < (uint64_t)v11)
  {
    [(TableViewMeasurer *)self _updateForCurrentTableWidth];
    v12 = [(TableViewMeasurer *)self rowRectCache];
    v13 = [v12 objectForKey:v5];
    if (!v13)
    {
      [(TableViewMeasurer *)self _measureRectsUntilRowAtIndexPath:v5];
      v13 = [v12 objectForKey:v5];
    }
    v14 = v13;
    [v13 CGRectValue];
    CGFloat x = v15;
    CGFloat y = v17;
    CGFloat width = v19;
    CGFloat height = v21;
  }
  else
  {
LABEL_7:
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (CGRect)rectForHeaderInSection:(int64_t)a3
{
  v5 = [(TableViewMeasurer *)self view];
  id v6 = [v5 _maps_numberOfSections];

  if ((uint64_t)v6 <= a3)
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  else
  {
    [(TableViewMeasurer *)self _updateForCurrentTableWidth];
    double v7 = [(TableViewMeasurer *)self headerRectCache];
    id v8 = +[NSNumber numberWithInteger:a3];
    id v9 = [v7 objectForKey:v8];

    if (!v9)
    {
      v10 = +[NSIndexPath indexPathForRow:-1 inSection:a3];
      [(TableViewMeasurer *)self _measureRectsUntilRowAtIndexPath:v10];

      id v11 = +[NSNumber numberWithInteger:a3];
      id v9 = [v7 objectForKey:v11];
    }
    [v9 CGRectValue];
    CGFloat x = v12;
    CGFloat y = v14;
    CGFloat width = v16;
    CGFloat height = v18;
  }
  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)invalidatePreviousMeasurements
{
  [(NSCache *)self->_rowRectCache removeAllObjects];
  headerRectCache = self->_headerRectCache;

  [(NSCache *)headerRectCache removeAllObjects];
}

- (void)_updateForCurrentTableWidth
{
  v3 = [(TableViewMeasurer *)self view];
  [v3 bounds];
  double v5 = v4;

  widthForRectCache = self->_widthForRectCache;
  if (!widthForRectCache
    || ([(NSNumber *)widthForRectCache floatValue], vabdd_f64(v5, v7) > 0.00000011920929))
  {
    [(NSCache *)self->_rowRectCache removeAllObjects];
    [(NSCache *)self->_headerRectCache removeAllObjects];
  }
  id v8 = +[NSNumber numberWithDouble:v5];
  id v9 = self->_widthForRectCache;
  self->_widthForRectCache = v8;
}

- (void)_measureRectsUntilRowAtIndexPath:(id)a3
{
  id v36 = a3;
  double v4 = [(TableViewMeasurer *)self rowRectCache];
  double v5 = [(TableViewMeasurer *)self headerRectCache];
  if (((unint64_t)[v36 section] & 0x8000000000000000) == 0)
  {
    id v6 = 0;
    do
    {
      float v7 = +[NSNumber numberWithInteger:v6];
      id v8 = [v5 objectForKey:v7];

      if (!v8)
      {
        id v9 = [(TableViewMeasurer *)self view];
        [v9 _maps_rectForHeaderInSection:v6];
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;

        double v18 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v11, v13, v15, v17);
        double v19 = +[NSNumber numberWithInteger:v6];
        [v5 setObject:v18 forKey:v19];
      }
      if (v6 == [v36 section])
      {
        uint64_t v20 = (uint64_t)[v36 row] + 1;
      }
      else
      {
        double v21 = [(TableViewMeasurer *)self view];
        uint64_t v20 = [v21 _maps_numberOfRowsInSection:v6];
      }
      if (v20 >= 1)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          double v23 = +[NSIndexPath indexPathForRow:i inSection:v6];
          double v24 = [v4 objectForKey:v23];

          if (!v24)
          {
            double v25 = [(TableViewMeasurer *)self view];
            [v25 _maps_rectForRowAtIndexPath:v23];
            double v27 = v26;
            double v29 = v28;
            double v31 = v30;
            double v33 = v32;

            v34 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v27, v29, v31, v33);
            [v4 setObject:v34 forKey:v23];
          }
        }
      }
    }
    while ((uint64_t)v6++ < (uint64_t)[v36 section]);
  }
}

- (id)rowRectCache
{
  rowRectCache = self->_rowRectCache;
  if (!rowRectCache)
  {
    double v4 = (NSCache *)objc_alloc_init((Class)NSCache);
    double v5 = self->_rowRectCache;
    self->_rowRectCache = v4;

    rowRectCache = self->_rowRectCache;
  }

  return rowRectCache;
}

- (id)headerRectCache
{
  headerRectCache = self->_headerRectCache;
  if (!headerRectCache)
  {
    double v4 = (NSCache *)objc_alloc_init((Class)NSCache);
    double v5 = self->_headerRectCache;
    self->_headerRectCache = v4;

    headerRectCache = self->_headerRectCache;
  }

  return headerRectCache;
}

- (MeasurableView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (MeasurableView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_widthForRectCache, 0);
  objc_storeStrong((id *)&self->_headerRectCache, 0);

  objc_storeStrong((id *)&self->_rowRectCache, 0);
}

@end