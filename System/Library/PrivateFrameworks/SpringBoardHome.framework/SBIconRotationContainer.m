@interface SBIconRotationContainer
- (BOOL)isOffscreen;
- (BSInvalidatable)existingIconPauseLayoutAssertion;
- (NSString)location;
- (SBIcon)endIcon;
- (SBIcon)startIcon;
- (SBIconCoordinate)coordinate;
- (SBIconListView)listView;
- (SBIconRotationContainer)initWithFrame:(CGRect)a3 startIcon:(id)a4 endIcon:(id)a5 listView:(id)a6 coordinate:(SBIconCoordinate)a7 location:(id)a8 transitionAnimation:(int64_t)a9 offscreen:(BOOL)a10;
- (SBIconView)borrowedIconView;
- (SBIconView)endView;
- (SBIconView)startView;
- (id)addIconViewForIcon:(id)a3 configurationOptions:(unint64_t)a4;
- (int64_t)transitionAnimation;
- (void)_configureViewIfNecessary:(id)a3 forShowingSnapshotWhenDeactivated:(BOOL)a4;
- (void)borrowExistingIconViewForIcon:(id)a3;
- (void)concludeTransition;
- (void)layoutSubviews;
- (void)performTransition;
- (void)prepareToTransition;
- (void)setBorrowedIconView:(id)a3;
- (void)setExistingIconPauseLayoutAssertion:(id)a3;
- (void)setListView:(id)a3;
@end

@implementation SBIconRotationContainer

- (SBIconRotationContainer)initWithFrame:(CGRect)a3 startIcon:(id)a4 endIcon:(id)a5 listView:(id)a6 coordinate:(SBIconCoordinate)a7 location:(id)a8 transitionAnimation:(int64_t)a9 offscreen:(BOOL)a10
{
  int64_t row = a7.row;
  int64_t column = a7.column;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a8;
  v34.receiver = self;
  v34.super_class = (Class)SBIconRotationContainer;
  v24 = -[SBIconRotationContainer initWithFrame:](&v34, sel_initWithFrame_, x, y, width, height);
  v25 = v24;
  if (v24)
  {
    v24->_coordinate.int64_t column = column;
    v24->_coordinate.int64_t row = row;
    uint64_t v26 = [v23 copy];
    location = v25->_location;
    v25->_location = (NSString *)v26;

    v25->_transitionAnimation = a9;
    v25->_offscreen = a10;
    objc_storeWeak((id *)&v25->_listView, v22);
    if (v20)
    {
      [(SBIconRotationContainer *)v25 borrowExistingIconViewForIcon:v20];
      uint64_t v28 = [(SBIconRotationContainer *)v25 addIconViewForIcon:v20 configurationOptions:4];
      startView = v25->_startView;
      v25->_startView = (SBIconView *)v28;
    }
    if (v20 == v21 && !v25->_transitionAnimation)
    {
      v32 = v25->_startView;
      endView = v25->_endView;
      v25->_endView = v32;
    }
    else
    {
      if (!v21)
      {
LABEL_10:
        [(SBIconRotationContainer *)v25 layoutIfNeeded];
        goto LABEL_11;
      }
      uint64_t v30 = [(SBIconRotationContainer *)v25 addIconViewForIcon:v21 configurationOptions:4];
      endView = v25->_endView;
      v25->_endView = (SBIconView *)v30;
    }

    goto LABEL_10;
  }
LABEL_11:

  return v25;
}

- (void)borrowExistingIconViewForIcon:(id)a3
{
  id v4 = a3;
  id v8 = [(SBIconRotationContainer *)self listView];
  v5 = [v8 iconViewForIcon:v4];

  if (v5)
  {
    [v5 setHidden:1];
    [(SBIconRotationContainer *)self addSubview:v5];
    [(SBIconRotationContainer *)self setBorrowedIconView:v5];
    v6 = [v8 pauseLayoutForIconView:v5 forReason:@"rotation"];
    v7 = [(SBIconRotationContainer *)self existingIconPauseLayoutAssertion];
    [v7 invalidate];

    [(SBIconRotationContainer *)self setExistingIconPauseLayoutAssertion:v6];
  }
}

- (id)addIconViewForIcon:(id)a3 configurationOptions:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(SBIconRotationContainer *)self listView];
  id v8 = [v7 dequeueReusableIconView];
  if (v8)
  {
    v9 = v8;
    [v8 setConfigurationOptions:a4];
  }
  else
  {
    v9 = objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "baseIconViewClass")), "initWithConfigurationOptions:", a4);
  }
  [v7 configureIconView:v9 forIcon:v6];

  [(SBIconRotationContainer *)self _configureViewIfNecessary:v9 forShowingSnapshotWhenDeactivated:1];
  [v9 layoutIfNeeded];
  [(SBIconRotationContainer *)self addSubview:v9];

  return v9;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)SBIconRotationContainer;
  [(SBIconRotationContainer *)&v7 layoutSubviews];
  [(SBIconRotationContainer *)self bounds];
  UIRectGetCenter();
  double v4 = v3;
  double v6 = v5;
  -[SBIconView setCenter:](self->_startView, "setCenter:");
  -[SBIconView setCenter:](self->_endView, "setCenter:", v4, v6);
}

- (SBIcon)startIcon
{
  return [(SBIconView *)self->_startView icon];
}

- (SBIcon)endIcon
{
  return [(SBIconView *)self->_endView icon];
}

- (void)prepareToTransition
{
  [(SBIconView *)self->_startView setAlpha:1.0];
  [(SBIconView *)self->_startView setIconAccessoryAlpha:1.0];
  [(SBIconView *)self->_startView setIconLabelAlpha:1.0];
  [(SBIconRotationContainer *)self _configureViewIfNecessary:self->_startView forShowingSnapshotWhenDeactivated:1];
  endView = self->_endView;
  if (endView != self->_startView) {
    [(SBIconRotationContainer *)self _configureViewIfNecessary:endView forShowingSnapshotWhenDeactivated:1];
  }
  unint64_t v4 = [(SBIconRotationContainer *)self transitionAnimation];
  if (v4 <= 3)
  {
    double v5 = dbl_1D81E7320[v4];
    [(SBIconView *)self->_endView setAlpha:dbl_1D81E7300[v4]];
    [(SBIconView *)self->_endView setIconAccessoryAlpha:v5];
    double v6 = self->_endView;
    [(SBIconView *)v6 setIconLabelAlpha:v5];
  }
}

- (void)performTransition
{
  int64_t v3 = [(SBIconRotationContainer *)self transitionAnimation];
  if (v3 == 3)
  {
    [(SBIconView *)self->_startView setAlpha:0.0];
    endView = self->_endView;
    [(SBIconView *)endView setAlpha:1.0];
  }
  else
  {
    if (v3 == 2)
    {
      [(SBIconView *)self->_endView setAlpha:1.0];
      [(SBIconView *)self->_startView setIconAccessoryAlpha:0.0];
      startView = self->_startView;
      double v5 = 0.0;
    }
    else
    {
      if (v3 != 1) {
        return;
      }
      [(SBIconView *)self->_startView setAlpha:0.0];
      [(SBIconView *)self->_endView setIconAccessoryAlpha:1.0];
      startView = self->_endView;
      double v5 = 1.0;
    }
    [(SBIconView *)startView setIconLabelAlpha:v5];
  }
}

- (void)concludeTransition
{
  id v11 = [(SBIconRotationContainer *)self startView];
  id v3 = [(SBIconRotationContainer *)self endView];
  [(SBIconRotationContainer *)self _configureViewIfNecessary:v11 forShowingSnapshotWhenDeactivated:0];
  if (v3 != v11) {
    [(SBIconRotationContainer *)self _configureViewIfNecessary:v3 forShowingSnapshotWhenDeactivated:0];
  }
  unint64_t v4 = [(SBIconRotationContainer *)self listView];
  double v5 = [(SBIconRotationContainer *)self borrowedIconView];
  double v6 = v5;
  if (v5)
  {
    objc_super v7 = [v5 icon];
    id v8 = [v4 displayedIconViewForIcon:v7];

    if (v8 == v6)
    {
      [v6 setHidden:0];
      [v4 addSubview:v6];
    }
  }
  v9 = [(SBIconRotationContainer *)self existingIconPauseLayoutAssertion];
  [v9 invalidate];

  [(SBIconRotationContainer *)self setExistingIconPauseLayoutAssertion:0];
  v10 = [v4 iconViewProvider];
  [v10 recycleIconView:v11];
  if (v3 != v11) {
    [v10 recycleIconView:v3];
  }
  [(SBIconRotationContainer *)self setListView:0];
}

- (void)_configureViewIfNecessary:(id)a3 forShowingSnapshotWhenDeactivated:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [a3 customIconImageViewController];
  if (objc_opt_respondsToSelector()) {
    [v5 setShowsSnapshotWhenDeactivated:v4];
  }
}

- (SBIconCoordinate)coordinate
{
  p_coordinate = &self->_coordinate;
  int64_t column = self->_coordinate.column;
  int64_t row = p_coordinate->row;
  result.int64_t row = row;
  result.int64_t column = column;
  return result;
}

- (NSString)location
{
  return self->_location;
}

- (int64_t)transitionAnimation
{
  return self->_transitionAnimation;
}

- (BOOL)isOffscreen
{
  return self->_offscreen;
}

- (SBIconView)startView
{
  return self->_startView;
}

- (SBIconView)endView
{
  return self->_endView;
}

- (SBIconView)borrowedIconView
{
  return self->_borrowedIconView;
}

- (void)setBorrowedIconView:(id)a3
{
}

- (SBIconListView)listView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listView);
  return (SBIconListView *)WeakRetained;
}

- (void)setListView:(id)a3
{
}

- (BSInvalidatable)existingIconPauseLayoutAssertion
{
  return self->_existingIconPauseLayoutAssertion;
}

- (void)setExistingIconPauseLayoutAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingIconPauseLayoutAssertion, 0);
  objc_destroyWeak((id *)&self->_listView);
  objc_storeStrong((id *)&self->_borrowedIconView, 0);
  objc_storeStrong((id *)&self->_endView, 0);
  objc_storeStrong((id *)&self->_startView, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end