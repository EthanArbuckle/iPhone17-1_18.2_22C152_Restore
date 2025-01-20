@interface _UIViewSystemSpacingInvalidationRecorder
- (NSArray)observingViews;
- (UIView)bottomView;
- (UIView)topView;
- (_UIViewSystemSpacingInvalidationRecorder)initWithTopView:(id)a3 bottomView:(id)a4;
- (id)_existingObservingViewTable;
- (id)_observingViewTable;
- (id)description;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)addObservingView:(id)a3;
- (void)dealloc;
- (void)removeObservingView:(id)a3;
@end

@implementation _UIViewSystemSpacingInvalidationRecorder

- (_UIViewSystemSpacingInvalidationRecorder)initWithTopView:(id)a3 bottomView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIViewSystemSpacingInvalidationRecorder;
  v8 = [(_UIViewSystemSpacingInvalidationRecorder *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_topView, v6);
    objc_storeWeak((id *)&v9->_bottomView, v7);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_topView);
    -[UIView _addGeometryChangeObserver:](WeakRetained, v9);

    v11 = objc_loadWeakRetained((id *)&v9->_bottomView);
    -[UIView _addGeometryChangeObserver:](v11, v9);

    id v12 = objc_loadWeakRetained((id *)&v9->_topView);
    [v12 _setShouldNotifyGeometryObserversForBaselineChanges:1];

    id v13 = objc_loadWeakRetained((id *)&v9->_bottomView);
    [v13 _setShouldNotifyGeometryObserversForBaselineChanges:1];
  }
  return v9;
}

- (void)dealloc
{
  WeakRetained = objc_loadWeakRetained((id *)&self->_topView);
  -[UIView _removeGeometryChangeObserver:](WeakRetained, self);

  v4 = objc_loadWeakRetained((id *)&self->_bottomView);
  -[UIView _removeGeometryChangeObserver:](v4, self);

  v5.receiver = self;
  v5.super_class = (Class)_UIViewSystemSpacingInvalidationRecorder;
  [(_UIViewSystemSpacingInvalidationRecorder *)&v5 dealloc];
}

- (NSArray)observingViews
{
  observingViewTable = self->_observingViewTable;
  if (observingViewTable)
  {
    v3 = [(NSMapTable *)observingViewTable objectEnumerator];
    v4 = [v3 allObjects];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v4;
}

- (id)_existingObservingViewTable
{
  return self->_observingViewTable;
}

- (id)_observingViewTable
{
  observingViewTable = self->_observingViewTable;
  if (!observingViewTable)
  {
    v4 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    objc_super v5 = self->_observingViewTable;
    self->_observingViewTable = v4;

    observingViewTable = self->_observingViewTable;
  }
  return observingViewTable;
}

- (void)addObservingView:(id)a3
{
  id v4 = a3;
  id v6 = [(_UIViewSystemSpacingInvalidationRecorder *)self _observingViewTable];
  objc_super v5 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v4);
  [v6 setObject:v4 forKey:v5];
}

- (void)removeObservingView:(id)a3
{
  id v4 = a3;
  id v6 = [(_UIViewSystemSpacingInvalidationRecorder *)self _existingObservingViewTable];
  objc_super v5 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v4);

  [v6 removeObjectForKey:v5];
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ((a3->var0 & 0x800) != 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = [(_UIViewSystemSpacingInvalidationRecorder *)self observingViews];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v13 = [v6 superview];

          if (v12 == v13)
          {
            [v12 setNeedsLayout];
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)_UIViewSystemSpacingInvalidationRecorder;
  v3 = [(_UIViewSystemSpacingInvalidationRecorder *)&v8 description];
  if (os_variant_has_internal_diagnostics())
  {
    objc_super v5 = [(_UIViewSystemSpacingInvalidationRecorder *)self topView];
    id v6 = [(_UIViewSystemSpacingInvalidationRecorder *)self bottomView];
    uint64_t v7 = objc_msgSend(v3, "stringByAppendingFormat:", @" topView=%p bottomView=%p observingViews=%p", v5, v6, self->_observingViewTable);

    v3 = (void *)v7;
  }
  return v3;
}

- (UIView)topView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topView);
  return (UIView *)WeakRetained;
}

- (UIView)bottomView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bottomView);
  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bottomView);
  objc_destroyWeak((id *)&self->_topView);
  objc_storeStrong((id *)&self->_observingViewTable, 0);
}

@end