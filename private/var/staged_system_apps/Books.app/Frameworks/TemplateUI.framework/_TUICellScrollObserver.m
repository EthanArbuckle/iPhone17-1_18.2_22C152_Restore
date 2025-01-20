@interface _TUICellScrollObserver
- (_TUICellScrollObserver)initWithPolicy:(id)a3 view:(id)a4 host:(id)a5 uuid:(id)a6 uid:(id)a7;
- (id)_computeHiddenCells;
- (void)reset;
- (void)updateScrollingWithVisibleBounds:(CGRect)a3 active:(BOOL)a4;
@end

@implementation _TUICellScrollObserver

- (_TUICellScrollObserver)initWithPolicy:(id)a3 view:(id)a4 host:(id)a5 uuid:(id)a6 uid:(id)a7
{
  id v13 = a3;
  v14 = (UIView *)a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_TUICellScrollObserver;
  v18 = [(_TUICellScrollObserver *)&v22 init];
  v19 = v18;
  if (v18)
  {
    v18->_view = v14;
    objc_storeStrong((id *)&v18->_policy, a3);
    v20 = [v15 renderOverrideProvider];
    v19->_provider = v20;

    objc_storeStrong((id *)&v19->_uuid, a6);
    objc_storeStrong((id *)&v19->_uid, a7);
  }

  return v19;
}

- (void)reset
{
  overrides = self->_overrides;
  if (overrides)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_15D35C;
    v6[3] = &unk_256858;
    v6[4] = self;
    [(NSArray *)overrides enumerateObjectsUsingBlock:v6];
    v4 = self->_overrides;
    self->_overrides = 0;
  }
  self->_active = 0;
  CGSize size = CGRectNull.size;
  self->_visibleBounds.origin = CGRectNull.origin;
  self->_visibleBounds.CGSize size = size;
}

- (id)_computeHiddenCells
{
  v3 = objc_opt_new();
  v4 = [(TUICellScrollPolicy *)self->_policy cells];
  v5 = *v4;
  v6 = v4[1];
  if (*v4 != v6)
  {
    uint64_t v7 = 0;
    do
    {
      v11.origin.x = *v5;
      v11.size.width = v5[2];
      CGRect visibleBounds = self->_visibleBounds;
      v11.origin.y = visibleBounds.origin.y;
      v11.size.height = visibleBounds.size.height;
      if (!CGRectIntersectsRect(visibleBounds, v11)) {
        [v3 addIndex:v7];
      }
      ++v7;
      v5 += 5;
    }
    while (v5 != v6);
  }

  return v3;
}

- (void)updateScrollingWithVisibleBounds:(CGRect)a3 active:(BOOL)a4
{
  self->_active = a4;
  self->_CGRect visibleBounds = a3;
  v5 = [(TUICellScrollPolicy *)self->_policy cells];
  if (self->_active)
  {
    v6 = 0;
  }
  else
  {
    v6 = [(_TUICellScrollObserver *)self _computeHiddenCells];
  }
  hiddenCells = self->_hiddenCells;
  if (hiddenCells != v6 && ![(NSIndexSet *)hiddenCells isEqualToIndexSet:v6])
  {
    overrides = self->_overrides;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_15D718;
    v24[3] = &unk_256858;
    v24[4] = self;
    [(NSArray *)overrides enumerateObjectsUsingBlock:v24];
    objc_storeStrong((id *)&self->_hiddenCells, v6);
    v9 = self->_overrides;
    self->_overrides = 0;

    if (self->_hiddenCells)
    {
      v10 = objc_opt_new();
      CGRect v11 = self->_hiddenCells;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_15D728;
      v21[3] = &unk_256880;
      v21[4] = self;
      v23 = v5;
      id v12 = v10;
      id v22 = v12;
      [(NSIndexSet *)v11 enumerateIndexesUsingBlock:v21];
      id v13 = [(NSIndexSet *)v6 mutableCopy];
      [v13 shiftIndexesStartingAtIndex:0 by:1];
      [v13 addIndexes:v6];
      [v13 removeIndex:0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v5[1] - *v5) >> 3)];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_15D838;
      v18[3] = &unk_256880;
      v18[4] = self;
      v20 = v5;
      id v14 = v12;
      id v19 = v14;
      [v13 enumerateIndexesUsingBlock:v18];
      id v15 = (NSArray *)[v14 copy];
      id v16 = self->_overrides;
      self->_overrides = v15;
    }
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_15D948;
  v17[3] = &unk_255D60;
  v17[4] = self;
  +[UIView animateWithDuration:v17 animations:0.25];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrides, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_hiddenCells, 0);
}

@end