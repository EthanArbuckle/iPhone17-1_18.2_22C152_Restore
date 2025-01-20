@interface TransitDirectionsBoardingInfoStepView
- (TransitDirectionsBoardingInfoStepViewDelegate)boardingInfoDelegate;
- (id)_initialConstraints;
- (void)_createSubviews;
- (void)_scheduleButtonTapped:(id)a3;
- (void)_updateNavigationStateAlpha:(double)a3;
- (void)configureWithItem:(id)a3;
- (void)setBoardingInfoDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setUseNavigationMetrics:(BOOL)a3;
@end

@implementation TransitDirectionsBoardingInfoStepView

- (void)_createSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)TransitDirectionsBoardingInfoStepView;
  [(TransitDirectionsStepView *)&v11 _createSubviews];
  v3 = -[TransitDirectionsBoardingInfoListView initWithFrame:]([TransitDirectionsBoardingInfoListView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  boardingInfoListView = self->_boardingInfoListView;
  self->_boardingInfoListView = v3;

  [(TransitDirectionsBoardingInfoListView *)self->_boardingInfoListView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TransitDirectionsBoardingInfoListView *)self->_boardingInfoListView setClipsToBounds:0];
  [(TransitDirectionsBoardingInfoListView *)self->_boardingInfoListView setTargetForAnalytics:606];
  v5 = self->_boardingInfoListView;
  v6 = +[TransitDirectionsBoardingInfoListView defaultFinalButtonTitle];
  [(TransitDirectionsBoardingInfoListView *)v5 setFinalButtonTitle:v6 target:self action:"_scheduleButtonTapped:"];

  [(TransitDirectionsBoardingInfoStepView *)self addSubview:self->_boardingInfoListView];
  if (sub_1000BBB44(self) == 5)
  {
    id v7 = objc_alloc((Class)MUPagingScrollControlsView);
    v8 = [(TransitDirectionsBoardingInfoListView *)self->_boardingInfoListView _scrollView];
    id v9 = [v7 initWithHorizontalScrollView:v8];

    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TransitDirectionsBoardingInfoStepView *)self addSubview:v9];
    scrollControlsView = self->_scrollControlsView;
    self->_scrollControlsView = (MUPagingScrollControlsView *)v9;
  }
}

- (id)_initialConstraints
{
  v39.receiver = self;
  v39.super_class = (Class)TransitDirectionsBoardingInfoStepView;
  id v38 = [(TransitDirectionsStepView *)&v39 _initialConstraints];
  v3 = [(TransitDirectionsBoardingInfoListView *)self->_boardingInfoListView leadingAnchor];
  v34 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  [v34 leadingAnchor];
  v32 = v36 = v3;
  v31 = [v3 constraintEqualToAnchor:];
  v41[0] = v31;
  v4 = [(TransitDirectionsBoardingInfoListView *)self->_boardingInfoListView topAnchor];
  v29 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  [v29 topAnchor];
  v28 = v30 = v4;
  v27 = [v4 constraintEqualToAnchor:];
  v41[1] = v27;
  scrollControlsView = self->_scrollControlsView;
  if (scrollControlsView)
  {
    [(TransitDirectionsBoardingInfoStepView *)self trailingAnchor];
  }
  else
  {
    v26 = [(TransitDirectionsStepView *)self contentLayoutGuide];
    [v26 trailingAnchor];
  v6 = };
  id v7 = [(TransitDirectionsBoardingInfoListView *)self->_boardingInfoListView trailingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v41[2] = v8;
  id v9 = [(TransitDirectionsStepView *)self contentLayoutGuide];
  v10 = [v9 bottomAnchor];
  objc_super v11 = [(TransitDirectionsBoardingInfoListView *)self->_boardingInfoListView bottomAnchor];
  [(TransitDirectionsBoardingInfoListView *)self->_boardingInfoListView _contentBottomAnchorAdjustment];
  v12 = [v10 constraintEqualToAnchor:v11];
  v41[3] = v12;
  v13 = +[NSArray arrayWithObjects:v41 count:4];
  [v38 addObjectsFromArray:v13];

  if (!scrollControlsView)
  {

    v6 = v26;
  }

  v14 = self->_scrollControlsView;
  if (v14)
  {
    v37 = [(MUPagingScrollControlsView *)v14 leadingAnchor];
    v35 = [(TransitDirectionsBoardingInfoStepView *)self leadingAnchor];
    v33 = [v37 constraintEqualToAnchor:v35 constant:3.0];
    v40[0] = v33;
    v15 = [(MUPagingScrollControlsView *)self->_scrollControlsView topAnchor];
    v16 = [(TransitDirectionsBoardingInfoListView *)self->_boardingInfoListView topAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v40[1] = v17;
    v18 = [(TransitDirectionsBoardingInfoStepView *)self trailingAnchor];
    v19 = [(MUPagingScrollControlsView *)self->_scrollControlsView trailingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19 constant:3.0];
    v40[2] = v20;
    v21 = [(TransitDirectionsBoardingInfoListView *)self->_boardingInfoListView bottomAnchor];
    v22 = [(MUPagingScrollControlsView *)self->_scrollControlsView bottomAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v40[3] = v23;
    v24 = +[NSArray arrayWithObjects:v40 count:4];
    [v38 addObjectsFromArray:v24];
  }

  return v38;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsBoardingInfoStepView;
  -[TransitDirectionsStepView setHighlighted:](&v5, "setHighlighted:");
  [(TransitDirectionsBoardingInfoListView *)self->_boardingInfoListView setHighlighted:v3];
}

- (void)_scheduleButtonTapped:(id)a3
{
  id v6 = [(TransitDirectionsBoardingInfoStepView *)self boardingInfoDelegate];
  v4 = [(TransitDirectionsStepView *)self transitListItem];
  objc_super v5 = [v4 parentItem];
  [v6 transitDirectionsBoardingInfoStepView:self didSelectScheduleForItem:v5];
}

- (void)configureWithItem:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TransitDirectionsBoardingInfoStepView;
  [(TransitDirectionsStepView *)&v16 configureWithItem:v4];
  id v5 = v4;
  id v6 = [v5 matchingRouteStep];
  id v7 = [v6 segment];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  v10 = [v9 transitLine];

  boardingInfoListView = self->_boardingInfoListView;
  if (v10) {
    BOOL v12 = [v10 departureTimeDisplayStyle] == (id)1;
  }
  else {
    BOOL v12 = 0;
  }
  [(TransitDirectionsBoardingInfoListView *)boardingInfoListView setDropPastDepartures:v12];
  v13 = [v5 boardingInfo];

  v14 = self->_boardingInfoListView;
  if (v13)
  {
    v15 = [v5 boardingInfo];
    [(TransitDirectionsBoardingInfoListView *)v14 setBoardingInfo:v15];
  }
  else
  {
    v15 = [v5 preboardingStrings];
    [(TransitDirectionsBoardingInfoListView *)v14 setPreboardingStrings:v15];
  }
}

- (void)setUseNavigationMetrics:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsBoardingInfoStepView;
  [(TransitDirectionsStepView *)&v6 setUseNavigationMetrics:a3];
  boardingInfoListView = self->_boardingInfoListView;
  if ([(TransitDirectionsStepView *)self useNavigationMetrics]) {
    uint64_t v5 = 610;
  }
  else {
    uint64_t v5 = 606;
  }
  [(TransitDirectionsBoardingInfoListView *)boardingInfoListView setTargetForAnalytics:v5];
}

- (void)_updateNavigationStateAlpha:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsBoardingInfoStepView;
  -[TransitDirectionsStepView _updateNavigationStateAlpha:](&v5, "_updateNavigationStateAlpha:");
  [(TransitDirectionsBoardingInfoListView *)self->_boardingInfoListView setAlpha:a3];
}

- (TransitDirectionsBoardingInfoStepViewDelegate)boardingInfoDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_boardingInfoDelegate);

  return (TransitDirectionsBoardingInfoStepViewDelegate *)WeakRetained;
}

- (void)setBoardingInfoDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_boardingInfoDelegate);
  objc_storeStrong((id *)&self->_scrollControlsView, 0);

  objc_storeStrong((id *)&self->_boardingInfoListView, 0);
}

@end