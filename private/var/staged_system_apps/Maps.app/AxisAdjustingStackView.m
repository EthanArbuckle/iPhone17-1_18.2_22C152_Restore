@interface AxisAdjustingStackView
- (AxisAdjustingStackView)initWithArrangedTruncatableSubviews:(id)a3;
- (AxisAdjustingStackView)initWithFrame:(CGRect)a3;
- (AxisAdjustingStackViewDelegate)delegate;
- (BOOL)hasCalculatedIdealEndRouteButtonStackViewAxis;
- (NSHashTable)truncatableViews;
- (double)previousWidth;
- (void)_commonInit;
- (void)_forceUpdateStackViewAlignment;
- (void)addArrangedTruncatableSubview:(id)a3;
- (void)addTruncatableView:(id)a3;
- (void)dealloc;
- (void)insertArrangedTruncatableSubview:(id)a3 atIndex:(unint64_t)a4;
- (void)invalidateStackViewAxis;
- (void)layoutIfNeeded;
- (void)removeArrangedTruncatableSubview:(id)a3;
- (void)removeTruncatableView:(id)a3;
- (void)setCalculatedIdealEndRouteButtonStackViewAxis:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPreviousWidth:(double)a3;
- (void)setTruncatableViews:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateStackViewAxisIfNeeded;
@end

@implementation AxisAdjustingStackView

- (AxisAdjustingStackView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AxisAdjustingStackView;
  v3 = -[AxisAdjustingStackView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AxisAdjustingStackView *)v3 _commonInit];
  }
  return v4;
}

- (void)dealloc
{
  v3 = sub_10093DFE8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    objc_super v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)AxisAdjustingStackView;
  [(AxisAdjustingStackView *)&v4 dealloc];
}

- (AxisAdjustingStackView)initWithArrangedTruncatableSubviews:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AxisAdjustingStackView;
  v5 = [(AxisAdjustingStackView *)&v17 init];
  objc_super v6 = v5;
  if (v5)
  {
    [(AxisAdjustingStackView *)v5 _commonInit];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          -[AxisAdjustingStackView addArrangedTruncatableSubview:](v6, "addArrangedTruncatableSubview:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v11), (void)v13);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return v6;
}

- (void)_commonInit
{
  v3 = sub_10093DFE8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 134349056;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", (uint8_t *)&v6, 0xCu);
  }

  [(AxisAdjustingStackView *)self setAxis:0];
  id v4 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:0 capacity:0];
  truncatableViews = self->_truncatableViews;
  self->_truncatableViews = v4;

  self->_previousWidth = NAN;
}

- (void)layoutIfNeeded
{
  v7.receiver = self;
  v7.super_class = (Class)AxisAdjustingStackView;
  [(AxisAdjustingStackView *)&v7 layoutIfNeeded];
  [(AxisAdjustingStackView *)self frame];
  double v4 = v3;
  if (!CGFloatIsValid() || vabdd_f64(self->_previousWidth, v4) > 2.22044605e-16)
  {
    v5 = sub_10093DFE8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      double previousWidth = self->_previousWidth;
      *(_DWORD *)buf = 134349568;
      id v9 = self;
      __int16 v10 = 2048;
      double v11 = previousWidth;
      __int16 v12 = 2048;
      double v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Width changed from %f to %f", buf, 0x20u);
    }

    self->_double previousWidth = v4;
    [(AxisAdjustingStackView *)self _forceUpdateStackViewAlignment];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)AxisAdjustingStackView;
  id v4 = a3;
  [(AxisAdjustingStackView *)&v13 traitCollectionDidChange:v4];
  v5 = [(AxisAdjustingStackView *)self traitCollection];
  int v6 = [v5 preferredContentSizeCategory];
  objc_super v7 = [v4 preferredContentSizeCategory];

  uint64_t v8 = sub_1000E93B0(v6, v7);
  if (v8)
  {
    id v9 = sub_10093DFE8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      __int16 v10 = [(AxisAdjustingStackView *)self traitCollection];
      double v11 = [v10 preferredContentSizeCategory];
      *(_DWORD *)buf = 134349314;
      long long v15 = self;
      __int16 v16 = 2112;
      objc_super v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Preferred content size category changed to %@", buf, 0x16u);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10093E540;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)addTruncatableView:(id)a3
{
  id v4 = a3;
  if (![(NSHashTable *)self->_truncatableViews containsObject:v4])
  {
    v5 = sub_10093DFE8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 134349314;
      objc_super v7 = self;
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Adding truncatable view: %@", (uint8_t *)&v6, 0x16u);
    }

    [(NSHashTable *)self->_truncatableViews addObject:v4];
    [(AxisAdjustingStackView *)self _forceUpdateStackViewAlignment];
  }
}

- (void)removeTruncatableView:(id)a3
{
  id v4 = a3;
  if ([(NSHashTable *)self->_truncatableViews containsObject:v4])
  {
    v5 = sub_10093DFE8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 134349314;
      objc_super v7 = self;
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Removing truncatable view: %@", (uint8_t *)&v6, 0x16u);
    }

    [(NSHashTable *)self->_truncatableViews removeObject:v4];
    [(AxisAdjustingStackView *)self _forceUpdateStackViewAlignment];
  }
}

- (void)addArrangedTruncatableSubview:(id)a3
{
  id v4 = a3;
  v5 = sub_10093DFE8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134349314;
    objc_super v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Adding arranged truncatable subview: %@", (uint8_t *)&v6, 0x16u);
  }

  [(AxisAdjustingStackView *)self addArrangedSubview:v4];
  [(AxisAdjustingStackView *)self addTruncatableView:v4];
}

- (void)insertArrangedTruncatableSubview:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = sub_10093DFE8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134349570;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Inserting arranged truncatable subview: %@ at index: %lu", (uint8_t *)&v8, 0x20u);
  }

  [(AxisAdjustingStackView *)self insertArrangedSubview:v6 atIndex:a4];
  [(AxisAdjustingStackView *)self addTruncatableView:v6];
}

- (void)removeArrangedTruncatableSubview:(id)a3
{
  id v4 = a3;
  v5 = sub_10093DFE8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134349314;
    objc_super v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Removing arranged truncatable subview: %@", (uint8_t *)&v6, 0x16u);
  }

  [(AxisAdjustingStackView *)self removeArrangedSubview:v4];
  [(AxisAdjustingStackView *)self removeTruncatableView:v4];
}

- (void)invalidateStackViewAxis
{
  self->_calculatedIdealEndRouteButtonStackViewAxis = 0;
}

- (void)updateStackViewAxisIfNeeded
{
  if (self->_calculatedIdealEndRouteButtonStackViewAxis || ![(NSHashTable *)self->_truncatableViews count]) {
    return;
  }
  double v3 = sub_10093DFE8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Updating stack view alignment", buf, 0xCu);
  }

  id v17 = [(AxisAdjustingStackView *)self axis];
  [(AxisAdjustingStackView *)self setAxis:0];
  [(AxisAdjustingStackView *)self setNeedsLayout];
  [(AxisAdjustingStackView *)self layoutIfNeeded];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_truncatableViews;
  id v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (!v5) {
    goto LABEL_23;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v19;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if ([v9 isHiddenOrHasHiddenAncestor])
      {
        __int16 v10 = sub_10093DFE8();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 134349314;
        v23 = self;
        __int16 v24 = 2112;
        v25 = v9;
        id v11 = v10;
        __int16 v12 = "[%{public}p] View or ancestor is hidden; ignoring: %@";
        goto LABEL_16;
      }
      unsigned int v13 = [v9 isTextTruncatedIgnoringLeading:1];
      __int16 v10 = sub_10093DFE8();
      BOOL v14 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
      if (v13)
      {
        if (v14)
        {
          *(_DWORD *)buf = 134349314;
          v23 = self;
          __int16 v24 = 2112;
          v25 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] View is truncated: %@", buf, 0x16u);
        }

        [(AxisAdjustingStackView *)self setAxis:1];
        goto LABEL_23;
      }
      if (v14)
      {
        *(_DWORD *)buf = 134349314;
        v23 = self;
        __int16 v24 = 2112;
        v25 = v9;
        id v11 = v10;
        __int16 v12 = "[%{public}p] View is NOT truncated: %@";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v12, buf, 0x16u);
      }
LABEL_17:
    }
    id v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_23:

  self->_calculatedIdealEndRouteButtonStackViewAxis = 1;
  if (v17 != [(AxisAdjustingStackView *)self axis])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained stackViewDidChangeLayout:self];
  }
  __int16 v16 = sub_10093DFE8();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Finished updating stack view alignment", buf, 0xCu);
  }
}

- (void)_forceUpdateStackViewAlignment
{
  self->_calculatedIdealEndRouteButtonStackViewAxis = 0;
  [(AxisAdjustingStackView *)self updateStackViewAxisIfNeeded];
}

- (AxisAdjustingStackViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AxisAdjustingStackViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasCalculatedIdealEndRouteButtonStackViewAxis
{
  return self->_calculatedIdealEndRouteButtonStackViewAxis;
}

- (void)setCalculatedIdealEndRouteButtonStackViewAxis:(BOOL)a3
{
  self->_calculatedIdealEndRouteButtonStackViewAxis = a3;
}

- (double)previousWidth
{
  return self->_previousWidth;
}

- (void)setPreviousWidth:(double)a3
{
  self->_double previousWidth = a3;
}

- (NSHashTable)truncatableViews
{
  return self->_truncatableViews;
}

- (void)setTruncatableViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncatableViews, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end