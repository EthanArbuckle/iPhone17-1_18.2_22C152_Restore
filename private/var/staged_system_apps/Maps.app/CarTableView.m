@interface CarTableView
- (BOOL)_shouldShowHeadersAndFooters;
- (UIEdgeInsets)_sectionContentInset;
- (double)_sectionCornerRadius;
- (id)_car_indexPathsForVisibleRows;
- (id)_car_visibleCells;
- (id)accessoryViewAtEdge:(int64_t)a3;
- (void)setAccessoryView:(id)a3 atEdge:(int64_t)a4;
@end

@implementation CarTableView

- (void)setAccessoryView:(id)a3 atEdge:(int64_t)a4
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CarTableView;
  [(CarTableView *)&v16 setAccessoryView:v5 atEdge:4];
  id v6 = [v5 _mapsCar_injectBlurView];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  [v5 _mapsCar_recursiveSubviewsWithClass:objc_opt_class()];
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) setCharge:0.0];
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
}

- (id)accessoryViewAtEdge:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CarTableView;
  v3 = [(CarTableView *)&v5 accessoryViewAtEdge:4];

  return v3;
}

- (UIEdgeInsets)_sectionContentInset
{
  double v2 = 0.0;
  double v3 = 10.0;
  double v4 = 10.0;
  double v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)_sectionCornerRadius
{
  return 4.0;
}

- (BOOL)_shouldShowHeadersAndFooters
{
  return 1;
}

- (id)_car_visibleCells
{
  double v3 = [(CarTableView *)self visibleCells];
  double v4 = v3;
  if (v3 && [v3 count])
  {
    [(CarTableView *)self frame];
    double v6 = v5;
    double v8 = v7;
    [(CarTableView *)self _sectionContentInset];
    double v11 = v6 - (v9 + v10);
    double v14 = v8 - (v12 + v13);
    [(CarTableView *)self contentOffset];
    uint64_t v16 = v15;
    [(CarTableView *)self contentOffset];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100CA90B8;
    v21[3] = &unk_101320800;
    v21[4] = v16;
    v21[5] = v17;
    *(double *)&v21[6] = v11;
    *(double *)&v21[7] = v14;
    v18 = [v4 indexesOfObjectsPassingTest:v21];
    v19 = [v4 objectsAtIndexes:v18];
  }
  else
  {
    v19 = &__NSArray0__struct;
  }

  return v19;
}

- (id)_car_indexPathsForVisibleRows
{
  double v3 = [(CarTableView *)self _car_visibleCells];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100CA919C;
  v6[3] = &unk_101320828;
  v6[4] = self;
  double v4 = sub_100099700(v3, v6);

  return v4;
}

@end