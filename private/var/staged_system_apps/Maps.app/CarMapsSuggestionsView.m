@interface CarMapsSuggestionsView
+ (BOOL)requiresConstraintBasedLayout;
- ($65C3FA8A572F9D8A414E710B16373297)lastLayoutConfig;
- (BOOL)_needsViewLayout;
- (BOOL)isAccessibilityElement;
- (BOOL)navigationAidedDrivingEnabled;
- (BOOL)routeIsNavigable;
- (BOOL)showSelectLabel;
- (CarETAOnlyGuidanceSign)etaOnlyView;
- (CarMapsSuggestionsView)init;
- (GuidanceETA)currentETA;
- (MapsSuggestionsRouteGeniusEntry)currentSuggestion;
- (NSArray)currentConstraints;
- (NSTimer)hideSelectLabelTimer;
- (NSTimer)layoutUpdateTimer;
- (UILabel)selectLabel;
- (unint64_t)accessibilityTraits;
- (unint64_t)suggestionKey;
- (void)_externalDeviceUpdated:(id)a3;
- (void)_hideSelectLabel;
- (void)_setNeedsViewLayout;
- (void)_updateContents;
- (void)_updateViewLayout;
- (void)dealloc;
- (void)setCurrentConstraints:(id)a3;
- (void)setCurrentETA:(id)a3;
- (void)setCurrentSuggestion:(id)a3;
- (void)setEtaOnlyView:(id)a3;
- (void)setHideSelectLabelTimer:(id)a3;
- (void)setLastLayoutConfig:(id)a3;
- (void)setLayoutUpdateTimer:(id)a3;
- (void)setNavigationAidedDrivingEnabled:(BOOL)a3;
- (void)setRouteIsNavigable:(BOOL)a3;
- (void)setSelectLabel:(id)a3;
- (void)setShowSelectLabel:(BOOL)a3;
- (void)setSuggestionKey:(unint64_t)a3;
- (void)startHideSelectLabelTimer;
- (void)stopHideSelectLabelTimer;
@end

@implementation CarMapsSuggestionsView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarMapsSuggestionsView)init
{
  v29.receiver = self;
  v29.super_class = (Class)CarMapsSuggestionsView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v5 = -[CarMapsSuggestionsView initWithFrame:](&v29, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v7 = v5;
  if (v5)
  {
    LODWORD(v6) = 1144750080;
    [(CarMapsSuggestionsView *)v5 setContentHuggingPriority:1 forAxis:v6];
    v7->_routeIsNavigable = 1;
    v7->_showSelectLabel = 1;
    v8 = +[MapsExternalDevice sharedInstance];
    v7->_navigationAidedDrivingEnabled = [v8 isNavigationAidedDrivingEnabled];

    BOOL v9 = !v7->_navigationAidedDrivingEnabled;
    v7->_lastLayoutConfig.showSelectLabel = !v7->_showSelectLabel;
    v7->_lastLayoutConfig.navigationAidedDrivingEnabled = v9;
    v7->_lastLayoutConfig.suggestionKedouble y = 0;
    v10 = -[CarETAOnlyGuidanceSign initWithFrame:]([CarETAOnlyGuidanceSign alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    etaOnlyView = v7->_etaOnlyView;
    v7->_etaOnlyView = v10;

    [(CarETAOnlyGuidanceSign *)v7->_etaOnlyView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarMapsSuggestionsView *)v7 addSubview:v7->_etaOnlyView];
    v12 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    selectLabel = v7->_selectLabel;
    v7->_selectLabel = v12;

    [(UILabel *)v7->_selectLabel setLineBreakMode:4];
    v14 = +[UIColor _carSystemTertiaryColor];
    [(UILabel *)v7->_selectLabel setTextColor:v14];

    [(UILabel *)v7->_selectLabel setNumberOfLines:2];
    v15 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption1 weight:UIFontWeightRegular];
    [(UILabel *)v7->_selectLabel setFont:v15];

    [(UILabel *)v7->_selectLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v16) = 1148846080;
    [(UILabel *)v7->_selectLabel setContentCompressionResistancePriority:1 forAxis:v16];
    v28 = [(CarETAOnlyGuidanceSign *)v7->_etaOnlyView topAnchor];
    v17 = [(CarMapsSuggestionsView *)v7 topAnchor];
    v18 = [v28 constraintEqualToAnchor:v17];
    v30[0] = v18;
    v19 = [(CarETAOnlyGuidanceSign *)v7->_etaOnlyView leadingAnchor];
    v20 = [(CarMapsSuggestionsView *)v7 leadingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v30[1] = v21;
    v22 = [(CarETAOnlyGuidanceSign *)v7->_etaOnlyView trailingAnchor];
    v23 = [(CarMapsSuggestionsView *)v7 trailingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v30[2] = v24;
    v25 = +[NSArray arrayWithObjects:v30 count:3];
    +[NSLayoutConstraint activateConstraints:v25];

    [(CarMapsSuggestionsView *)v7 _updateViewLayout];
    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v7 selector:"_externalDeviceUpdated:" name:@"MapsExternalDeviceUpdated" object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CarMapsSuggestionsView;
  [(CarMapsSuggestionsView *)&v4 dealloc];
}

- (void)_externalDeviceUpdated:(id)a3
{
  id v4 = +[MapsExternalDevice sharedInstance];
  -[CarMapsSuggestionsView setNavigationAidedDrivingEnabled:](self, "setNavigationAidedDrivingEnabled:", [v4 isNavigationAidedDrivingEnabled]);
}

- (void)setNavigationAidedDrivingEnabled:(BOOL)a3
{
  if (self->_navigationAidedDrivingEnabled != a3)
  {
    self->_navigationAidedDrivingEnabled = a3;
    [(CarMapsSuggestionsView *)self _setNeedsViewLayout];
  }
}

- (void)_setNeedsViewLayout
{
  unsigned int v3 = [(CarMapsSuggestionsView *)self _needsViewLayout];
  id v4 = [(CarMapsSuggestionsView *)self layoutUpdateTimer];

  if (v3)
  {
    if (!v4)
    {
      objc_initWeak(&location, self);
      v7 = _NSConcreteStackBlock;
      uint64_t v8 = 3221225472;
      BOOL v9 = sub_100DB1760;
      v10 = &unk_1012E73C8;
      objc_copyWeak(&v11, &location);
      v5 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v7 block:0.0];
      -[CarMapsSuggestionsView setLayoutUpdateTimer:](self, "setLayoutUpdateTimer:", v5, v7, v8, v9, v10);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  else if (v4)
  {
    double v6 = [(CarMapsSuggestionsView *)self layoutUpdateTimer];
    [v6 invalidate];

    [(CarMapsSuggestionsView *)self setLayoutUpdateTimer:0];
  }
}

- (BOOL)_needsViewLayout
{
  unint64_t v3 = [(CarMapsSuggestionsView *)self suggestionKey];
  [(CarMapsSuggestionsView *)self lastLayoutConfig];
  if (v3 != v4
    || (unsigned int v5 = [(CarMapsSuggestionsView *)self showSelectLabel],
        v5 == (((unint64_t)[(CarMapsSuggestionsView *)self lastLayoutConfig] & 1) == 0)))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    unsigned int v6 = [(CarMapsSuggestionsView *)self navigationAidedDrivingEnabled];
    return v6 ^ ((unint64_t)[(CarMapsSuggestionsView *)self lastLayoutConfig] >> 8) & 1;
  }
  return v7;
}

- (void)_updateViewLayout
{
  unint64_t v3 = [(CarMapsSuggestionsView *)self layoutUpdateTimer];
  [v3 invalidate];

  [(CarMapsSuggestionsView *)self setLayoutUpdateTimer:0];
  uint64_t v4 = [(CarMapsSuggestionsView *)self currentConstraints];
  +[NSLayoutConstraint deactivateConstraints:v4];

  id v27 = (id)objc_opt_new();
  unsigned int v5 = [(CarMapsSuggestionsView *)self selectLabel];
  [v5 removeFromSuperview];

  if ([(CarMapsSuggestionsView *)self showSelectLabel])
  {
    unsigned int v6 = [(CarMapsSuggestionsView *)self selectLabel];
    [(CarMapsSuggestionsView *)self addSubview:v6];

    BOOL v7 = [(CarMapsSuggestionsView *)self selectLabel];
    uint64_t v8 = [v7 firstBaselineAnchor];
    BOOL v9 = [(CarMapsSuggestionsView *)self etaOnlyView];
    v10 = [v9 lastBaselineAnchor];
    id v11 = [v8 constraintEqualToAnchor:v10 constant:18.0];
    [v27 addObject:v11];

    v12 = [(CarMapsSuggestionsView *)self selectLabel];
    v13 = [v12 leadingAnchor];
    v14 = [(CarMapsSuggestionsView *)self leadingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:10.0];
    [v27 addObject:v15];

    double v16 = [(CarMapsSuggestionsView *)self selectLabel];
    v17 = [v16 trailingAnchor];
    v18 = [(CarMapsSuggestionsView *)self trailingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18 constant:-10.0];
    [v27 addObject:v19];

    v20 = [(CarMapsSuggestionsView *)self selectLabel];
    [v20 lastBaselineAnchor];
  }
  else
  {
    v20 = [(CarMapsSuggestionsView *)self etaOnlyView];
    [v20 bottomAnchor];
  v21 = };
  v22 = [(CarMapsSuggestionsView *)self bottomAnchor];
  v23 = [v21 constraintEqualToAnchor:v22 constant:-10.0];
  [v27 addObject:v23];

  [(CarMapsSuggestionsView *)self setCurrentConstraints:v27];
  unsigned int v24 = [(CarMapsSuggestionsView *)self showSelectLabel];
  LODWORD(v21) = [(CarMapsSuggestionsView *)self navigationAidedDrivingEnabled];
  unint64_t v25 = [(CarMapsSuggestionsView *)self suggestionKey];
  uint64_t v26 = 256;
  if (!v21) {
    uint64_t v26 = 0;
  }
  -[CarMapsSuggestionsView setLastLayoutConfig:](self, "setLastLayoutConfig:", v26 | v24, v25);
  +[NSLayoutConstraint activateConstraints:v27];
}

- (void)_updateContents
{
  uint64_t v4 = 16;
  unsigned int v5 = [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion entry];
  id v35 = [v5 stringForKey:@"MapsSuggestionsResumeRouteDefaultTitle"];

  unsigned int v6 = v35;
  if (!v35)
  {
    unsigned int v5 = [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion entry];
    unsigned int v6 = [v5 title];
  }
  BOOL v7 = [(CarMapsSuggestionsView *)self etaOnlyView];
  [v7 setTitle:v6];

  if (!v35)
  {
  }
  uint64_t v8 = [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion route];
  BOOL v9 = [v8 legs];
  id v10 = [v9 count];
  if (v10)
  {
    uint64_t v4 = [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion route];
    v2 = [(id)v4 legs];
    id v11 = (char *)[v2 count] - 1;
  }
  else
  {
    id v11 = 0;
  }
  v12 = [(CarMapsSuggestionsView *)self etaOnlyView];
  [v12 setNumberOfStops:v11];

  if (v10)
  {
  }
  unsigned int v13 = [(CarMapsSuggestionsView *)self routeIsNavigable];
  if (v13)
  {
    v14 = [(CarMapsSuggestionsView *)self currentETA];
  }
  else
  {
    v14 = 0;
  }
  v15 = [(CarMapsSuggestionsView *)self etaOnlyView];
  [v15 setLatestETA:v14];

  if (v13) {
  if ([(CarMapsSuggestionsView *)self routeIsNavigable])
  }
  {
    double v16 = [(CarMapsSuggestionsView *)self etaOnlyView];
    [v16 setSubtitleOverride:0];
  }
  else
  {
    double v16 = CarDisplayDirectionsNotAvailableErrorTitle();
    v17 = [(CarMapsSuggestionsView *)self etaOnlyView];
    [v17 setSubtitleOverride:v16];
  }
  v18 = +[CarDisplayController sharedInstance];
  unsigned int v19 = [v18 supportsTouchInteractionModel];

  v20 = +[NSBundle mainBundle];
  v21 = v20;
  if (v19) {
    CFStringRef v22 = @"CAR_PROACTIVE_TAP";
  }
  else {
    CFStringRef v22 = @"CAR_PROACTIVE_SELECT";
  }
  v23 = [v20 localizedStringForKey:v22 value:@"localized string not found" table:0];

  unsigned int v24 = [(CarMapsSuggestionsView *)self selectLabel];
  [v24 setText:v23];

  unint64_t v25 = +[NSMutableArray array];
  uint64_t v26 = [(CarMapsSuggestionsView *)self etaOnlyView];
  id v27 = [v26 title];

  if (v27)
  {
    v28 = [(CarMapsSuggestionsView *)self etaOnlyView];
    objc_super v29 = [v28 title];
    [v25 addObject:v29];
  }
  v30 = [(CarMapsSuggestionsView *)self selectLabel];
  v31 = [v30 text];

  if (v31)
  {
    v32 = [(CarMapsSuggestionsView *)self selectLabel];
    v33 = [v32 text];
    [v25 addObject:v33];
  }
  id v34 = [v25 copy];
  [(CarMapsSuggestionsView *)self setAccessibilityUserInputLabels:v34];
}

- (void)setShowSelectLabel:(BOOL)a3
{
  if (self->_showSelectLabel != a3)
  {
    self->_showSelectLabel = a3;
    if (a3) {
      [(CarMapsSuggestionsView *)self startHideSelectLabelTimer];
    }
    else {
      [(CarMapsSuggestionsView *)self stopHideSelectLabelTimer];
    }
    [(CarMapsSuggestionsView *)self _setNeedsViewLayout];
  }
}

- (void)setCurrentSuggestion:(id)a3
{
  id v4 = a3;
  [(CarMapsSuggestionsView *)self setSuggestionKey:(char *)[(CarMapsSuggestionsView *)self suggestionKey] + 1];
  unsigned int v5 = [v4 route];
  if (v5)
  {
    unsigned int v6 = [v4 route];
    -[CarMapsSuggestionsView setRouteIsNavigable:](self, "setRouteIsNavigable:", [v6 isNavigable]);
  }
  else
  {
    [(CarMapsSuggestionsView *)self setRouteIsNavigable:0];
  }

  BOOL v7 = [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion entry];
  id v13 = [v7 geoMapItem];

  currentSuggestion = self->_currentSuggestion;
  self->_currentSuggestion = (MapsSuggestionsRouteGeniusEntry *)v4;
  id v9 = v4;

  id v10 = [(MapsSuggestionsRouteGeniusEntry *)self->_currentSuggestion entry];

  id v11 = [v10 geoMapItem];

  [(CarMapsSuggestionsView *)self _updateContents];
  if (![(CarMapsSuggestionsView *)self showSelectLabel])
  {
    uint64_t v12 = 1;
    if (v13 && v11) {
      uint64_t v12 = GEOMapItemIsEqualToMapItemForPurpose() ^ 1;
    }
    [(CarMapsSuggestionsView *)self setShowSelectLabel:v12];
  }
  [(CarMapsSuggestionsView *)self _setNeedsViewLayout];
}

- (void)setCurrentETA:(id)a3
{
  id v9 = a3;
  id v5 = [v9 remainingMinutes];
  if (v5 != (id)[(GuidanceETA *)self->_currentETA remainingMinutes]
    || ([v9 etaDate],
        unsigned int v6 = objc_claimAutoreleasedReturnValue(),
        [(GuidanceETA *)self->_currentETA etaDate],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v6 isEqual:v7],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    objc_storeStrong((id *)&self->_currentETA, a3);
    [(CarMapsSuggestionsView *)self _updateContents];
  }
}

- (void)startHideSelectLabelTimer
{
  [(CarMapsSuggestionsView *)self stopHideSelectLabelTimer];
  GEOConfigGetDouble();
  if (v3 > 0.0)
  {
    +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_hideSelectLabel", 0, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CarMapsSuggestionsView *)self setHideSelectLabelTimer:v4];
  }
}

- (void)stopHideSelectLabelTimer
{
  double v3 = [(CarMapsSuggestionsView *)self hideSelectLabelTimer];
  [v3 invalidate];

  [(CarMapsSuggestionsView *)self setHideSelectLabelTimer:0];
}

- (void)_hideSelectLabel
{
  [(CarMapsSuggestionsView *)self stopHideSelectLabelTimer];

  [(CarMapsSuggestionsView *)self setShowSelectLabel:0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CarMapsSuggestionsView;
  return UIAccessibilityTraitButton | [(CarMapsSuggestionsView *)&v3 accessibilityTraits];
}

- (MapsSuggestionsRouteGeniusEntry)currentSuggestion
{
  return self->_currentSuggestion;
}

- (GuidanceETA)currentETA
{
  return self->_currentETA;
}

- (CarETAOnlyGuidanceSign)etaOnlyView
{
  return (CarETAOnlyGuidanceSign *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEtaOnlyView:(id)a3
{
}

- (UILabel)selectLabel
{
  return (UILabel *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSelectLabel:(id)a3
{
}

- (NSArray)currentConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentConstraints:(id)a3
{
}

- (NSTimer)hideSelectLabelTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHideSelectLabelTimer:(id)a3
{
}

- (NSTimer)layoutUpdateTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLayoutUpdateTimer:(id)a3
{
}

- ($65C3FA8A572F9D8A414E710B16373297)lastLayoutConfig
{
  objc_copyStruct(v4, &self->_lastLayoutConfig, 16, 1, 0);
  uint64_t v2 = v4[0];
  unint64_t v3 = v4[1];
  result.var2 = v3;
  result.var0 = v2;
  result.var1 = BYTE1(v2);
  return result;
}

- (void)setLastLayoutConfig:(id)a3
{
  $65C3FA8A572F9D8A414E710B16373297 v3 = a3;
  objc_copyStruct(&self->_lastLayoutConfig, &v3, 16, 1, 0);
}

- (unint64_t)suggestionKey
{
  return self->_suggestionKey;
}

- (void)setSuggestionKey:(unint64_t)a3
{
  self->_suggestionKedouble y = a3;
}

- (BOOL)showSelectLabel
{
  return self->_showSelectLabel;
}

- (BOOL)navigationAidedDrivingEnabled
{
  return self->_navigationAidedDrivingEnabled;
}

- (BOOL)routeIsNavigable
{
  return self->_routeIsNavigable;
}

- (void)setRouteIsNavigable:(BOOL)a3
{
  self->_routeIsNavigable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutUpdateTimer, 0);
  objc_storeStrong((id *)&self->_hideSelectLabelTimer, 0);
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_selectLabel, 0);
  objc_storeStrong((id *)&self->_etaOnlyView, 0);
  objc_storeStrong((id *)&self->_currentETA, 0);

  objc_storeStrong((id *)&self->_currentSuggestion, 0);
}

@end