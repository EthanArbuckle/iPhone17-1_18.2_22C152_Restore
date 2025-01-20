@interface RouteAdvisoriesView
- (ActionCoordinator)coordinator;
- (BOOL)isVisible;
- (NSArray)viewModels;
- (RouteAdvisoriesView)init;
- (UIStackView)advisoryStackView;
- (void)_logAnalyticsIfNeeded;
- (void)didMoveToWindow;
- (void)refreshContent;
- (void)setAdvisories:(id)a3 coordinator:(id)a4;
- (void)setAdvisoryStackView:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setOverrideTextColor:(id)a3 isSelected:(BOOL)a4;
- (void)setViewModels:(id)a3;
- (void)setupSubViews;
@end

@implementation RouteAdvisoriesView

- (RouteAdvisoriesView)init
{
  v5.receiver = self;
  v5.super_class = (Class)RouteAdvisoriesView;
  v2 = -[RouteAdvisoriesView initWithFrame:](&v5, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = v2;
  if (v2) {
    [(RouteAdvisoriesView *)v2 setupSubViews];
  }
  return v3;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)RouteAdvisoriesView;
  [(RouteAdvisoriesView *)&v4 didMoveToWindow];
  v3 = [(RouteAdvisoriesView *)self window];

  if (v3) {
    [(RouteAdvisoriesView *)self _logAnalyticsIfNeeded];
  }
}

- (void)setupSubViews
{
  id v3 = objc_alloc_init((Class)UIStackView);
  [(RouteAdvisoriesView *)self setAdvisoryStackView:v3];

  objc_super v4 = [(RouteAdvisoriesView *)self advisoryStackView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v5 = [(RouteAdvisoriesView *)self advisoryStackView];
  [v5 setAxis:1];

  v6 = [(RouteAdvisoriesView *)self advisoryStackView];
  [v6 setAlignment:0];

  v7 = [(RouteAdvisoriesView *)self advisoryStackView];
  [v7 setDistribution:0];

  v8 = [(RouteAdvisoriesView *)self advisoryStackView];
  [v8 setSpacing:3.0];

  v9 = [(RouteAdvisoriesView *)self advisoryStackView];
  LODWORD(v10) = 1148846080;
  [v9 setContentHuggingPriority:1 forAxis:v10];

  v11 = [(RouteAdvisoriesView *)self advisoryStackView];
  [(RouteAdvisoriesView *)self addSubview:v11];

  v28 = [(RouteAdvisoriesView *)self advisoryStackView];
  v27 = [v28 leadingAnchor];
  v26 = [(RouteAdvisoriesView *)self leadingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v29[0] = v25;
  v24 = [(RouteAdvisoriesView *)self advisoryStackView];
  v23 = [v24 trailingAnchor];
  v22 = [(RouteAdvisoriesView *)self trailingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v29[1] = v21;
  v12 = [(RouteAdvisoriesView *)self advisoryStackView];
  v13 = [v12 topAnchor];
  v14 = [(RouteAdvisoriesView *)self topAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v29[2] = v15;
  v16 = [(RouteAdvisoriesView *)self advisoryStackView];
  v17 = [v16 bottomAnchor];
  v18 = [(RouteAdvisoriesView *)self bottomAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v29[3] = v19;
  v20 = +[NSArray arrayWithObjects:v29 count:4];
  [(RouteAdvisoriesView *)self addConstraints:v20];
}

- (void)setOverrideTextColor:(id)a3 isSelected:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  p_overrideTextColor = &self->_overrideTextColor;
  unint64_t v9 = self->_overrideTextColor;
  unint64_t v10 = (unint64_t)v7;
  if (v10 | v9
    && (unsigned int v11 = [(id)v9 isEqual:v10], (id)v10, (id)v9, !v11)
    || self->_isSelected != v4)
  {
    objc_storeStrong((id *)&self->_overrideTextColor, a3);
    self->_isSelected = v4;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v12 = [(RouteAdvisoriesView *)self advisoryStackView];
    v13 = [v12 arrangedSubviews];

    id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * (void)v17) setOverrideTextColor:*p_overrideTextColor];
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v15);
    }
  }
}

- (BOOL)isVisible
{
  v2 = [(RouteAdvisoriesView *)self advisoryStackView];
  id v3 = [v2 arrangedSubviews];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)setAdvisories:(id)a3 coordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  viewModels = self->_viewModels;
  unint64_t v12 = (unint64_t)v7;
  id v10 = viewModels;
  if (v12 | (unint64_t)v10)
  {
    unsigned __int8 v11 = [(id)v12 isEqual:v10];

    if ((v11 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewModels, a3);
      objc_storeWeak((id *)&self->_coordinator, v8);
      self->_hasLoggedAdvisoryAnalytics = 0;
      [(RouteAdvisoriesView *)self refreshContent];
    }
  }
}

- (void)_logAnalyticsIfNeeded
{
  if (!self->_hasLoggedAdvisoryAnalytics)
  {
    if ([(NSArray *)self->_viewModels count])
    {
      id v3 = [(RouteAdvisoriesView *)self window];

      if (v3)
      {
        long long v15 = 0u;
        long long v16 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        BOOL v4 = self->_viewModels;
        id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5)
        {
          id v6 = v5;
          uint64_t v7 = *(void *)v14;
          do
          {
            for (i = 0; i != v6; i = (char *)i + 1)
            {
              if (*(void *)v14 != v7) {
                objc_enumerationMutation(v4);
              }
              unint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
              id v10 = [v9 advisory];

              if (v10)
              {
                unsigned __int8 v11 = +[MKMapService sharedService];
                unint64_t v12 = [v9 advisory];
                [v11 captureUserAction:247 onTarget:504 forAdvisory:v12];
              }
            }
            id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
          }
          while (v6);
        }

        self->_hasLoggedAdvisoryAnalytics = 1;
      }
    }
  }
}

- (void)refreshContent
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  objc_initWeak(&location, self);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_viewModels;
  id v4 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v25;
    long long v16 = v19;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v8 = [[RouteAdvisoryView alloc] initWithViewModel:v7];
        unint64_t v9 = [v7 handler];

        if (v9)
        {
          id v10 = [v7 handler];
          [(RouteAdvisoryView *)v8 setActionHandler:v10];
        }
        else
        {
          unsigned __int8 v11 = [v7 advisory];
          unsigned int v12 = [v11 isClickable];

          if (v12)
          {
            long long v13 = [v7 advisory];
            [(RouteAdvisoryView *)v8 setAlwaysClickable:1];
            objc_initWeak(&from, v8);
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472;
            v19[0] = sub_100BC78D8;
            v19[1] = &unk_10131A9C8;
            objc_copyWeak(&v21, &location);
            id v14 = v13;
            id v20 = v14;
            objc_copyWeak(&v22, &from);
            [(RouteAdvisoryView *)v8 setActionHandler:v18];
            objc_destroyWeak(&v22);

            objc_destroyWeak(&v21);
            objc_destroyWeak(&from);

            goto LABEL_11;
          }
        }
        [(RouteAdvisoryView *)v8 setAlwaysClickable:v9 != 0];
LABEL_11:
        -[RouteAdvisoryView setOverrideTextColor:](v8, "setOverrideTextColor:", self->_overrideTextColor, v16);
        [v3 addObject:v8];
      }
      id v4 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v4);
  }

  [(RouteAdvisoriesView *)self _logAnalyticsIfNeeded];
  long long v15 = [(RouteAdvisoriesView *)self advisoryStackView];
  [v15 _maps_setArrangedSubviews:v3];

  objc_destroyWeak(&location);
}

- (UIStackView)advisoryStackView
{
  return self->_advisoryStackView;
}

- (void)setAdvisoryStackView:(id)a3
{
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void)setViewModels:(id)a3
{
}

- (ActionCoordinator)coordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);

  return (ActionCoordinator *)WeakRetained;
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_storeStrong((id *)&self->_advisoryStackView, 0);

  objc_storeStrong((id *)&self->_overrideTextColor, 0);
}

@end