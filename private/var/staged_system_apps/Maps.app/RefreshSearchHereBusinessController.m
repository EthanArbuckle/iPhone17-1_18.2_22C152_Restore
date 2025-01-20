@interface RefreshSearchHereBusinessController
- ($C79183323B9A0D5602617FF3BE5395AC)visibleMapRect;
- (BOOL)didStopRespondingToGesture:(id)a3;
- (BOOL)isCatalyst;
- (BOOL)shouldBeVisible;
- (BOOL)shouldShowManualRedoButton;
- (BOOL)showInCardFooterWhenCardHasExpandedLayout;
- (LocalSearchBusinessControllerDelegate)delegate;
- (LocalSearchView)contentView;
- (RedoSearchController)redoSearchController;
- (RefreshSearchHereBusinessController)initWithDelegate:(id)a3;
- (SearchSession)searchSession;
- (unint64_t)state;
- (void)didStartRespondingToGesture:(id)a3;
- (void)resetRedoSearchController;
- (void)sendAnalyticsOnBecomeVisibleWithTarget:(int)a3;
- (void)setContentView:(id)a3;
- (void)setRedoSearchController:(id)a3;
- (void)setSearchSession:(id)a3;
- (void)setVisibleMapRect:(id)a3;
- (void)updateState;
- (void)updateTrigger;
@end

@implementation RefreshSearchHereBusinessController

- (RefreshSearchHereBusinessController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RefreshSearchHereBusinessController;
  v5 = [(RefreshSearchHereBusinessController *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_alloc_init(RedoSearchController);
    redoSearchController = v6->_redoSearchController;
    v6->_redoSearchController = v7;
  }
  return v6;
}

- (void)setSearchSession:(id)a3
{
  objc_storeStrong((id *)&self->_searchSession, a3);
  self->_triggered = 0;

  [(RefreshSearchHereBusinessController *)self updateState];
}

- (void)resetRedoSearchController
{
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
  id v5 = a3;
  [(LocalSearchView *)self->_contentView setAccessibilityIdentifier:@"LocalSearchContentView"];
  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"Search Here" value:@"localized string not found" table:0];
  [v5 setText:v7 forState:1];

  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"Searching Here" value:@"localized string not found" table:0];
  [v5 setText:v9 forState:3];

  objc_super v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"No results found in this area." value:@"localized string not found" table:0];
  [v5 setText:v11 forState:4];

  [(RefreshSearchHereBusinessController *)self updateState];
}

- (void)didStartRespondingToGesture:(id)a3
{
  id v4 = a3;
  [v4 visibleMapRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(RefreshSearchHereBusinessController *)self visibleMapRect];
  if (v6 == v16 && v8 == v13 && v10 == v14 && v12 == v15)
  {
    v26 = sub_1005771BC();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Requested region is equal to existing region, ignoring.", v27, 2u);
    }
  }
  else
  {
    v20 = [v4 mapRegion];
    [v4 _zoomLevel];
    double v22 = v21;
    [v4 visibleMapRect];
    -[RefreshSearchHereBusinessController setVisibleMapRect:](self, "setVisibleMapRect:");
    v23 = [(RedoSearchController *)self->_redoSearchController originalState];

    if (!v23)
    {
      v24 = [[RedoSearchMapState alloc] initWithMapRegion:v20 zoomLevel:v22];
      [(RedoSearchController *)self->_redoSearchController setOriginalState:v24];
    }
    [(RefreshSearchHereBusinessController *)self updateState];
    if (self->_triggered)
    {
      v25 = [[RedoSearchMapState alloc] initWithMapRegion:v20 zoomLevel:v22];
      [(RedoSearchController *)self->_redoSearchController setOriginalState:v25];
    }
  }
}

- (BOOL)didStopRespondingToGesture:(id)a3
{
  id v4 = a3;
  double v5 = [v4 mapRegion];
  [v4 _zoomLevel];
  double v7 = v6;
  [v4 visibleMapRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  -[RefreshSearchHereBusinessController setVisibleMapRect:](self, "setVisibleMapRect:", v9, v11, v13, v15);
  double v16 = [[RedoSearchMapState alloc] initWithMapRegion:v5 zoomLevel:v7];
  [(RedoSearchController *)self->_redoSearchController setCurrentState:v16];

  [(RefreshSearchHereBusinessController *)self updateState];
  [(RefreshSearchHereBusinessController *)self updateTrigger];
  if (self->_triggered)
  {
    v17 = [[RedoSearchMapState alloc] initWithMapRegion:v5 zoomLevel:v7];
    [(RedoSearchController *)self->_redoSearchController setOriginalState:v17];

    BOOL triggered = self->_triggered;
  }
  else
  {
    BOOL triggered = 0;
  }

  return triggered;
}

- (BOOL)shouldShowManualRedoButton
{
  if (self->_triggered) {
    return 0;
  }
  id v4 = [(SearchSession *)self->_searchSession searchInfo];
  double v5 = v4;
  if (v4 && [v4 shouldAllowManualRedoButton])
  {
    redoSearchController = self->_redoSearchController;
    double v7 = [v5 searchRedoButtonThreshold];
    double v8 = [v5 results];
    unsigned __int8 v2 = [(RedoSearchController *)redoSearchController shouldShowManualRedoSearchButton:v7 searchResults:v8];
  }
  else
  {
    unsigned __int8 v2 = 0;
  }

  return v2;
}

- (void)updateState
{
  unint64_t v3 = [(RefreshSearchHereBusinessController *)self state];
  id v4 = [(RefreshSearchHereBusinessController *)self contentView];
  id v5 = [v4 state];

  if ((id)v3 != v5)
  {
    double v6 = [(RefreshSearchHereBusinessController *)self delegate];
    double v7 = v6;
    if (v5 && v3) {
      [v6 businessControllerContentSizeDidChange:self];
    }
    else {
      [v6 businessControllerVisibilityDidChange:self];
    }

    id v8 = [(RefreshSearchHereBusinessController *)self contentView];
    [v8 setState:v3];
  }
}

- (void)updateTrigger
{
  unint64_t v3 = [(RefreshSearchHereBusinessController *)self delegate];
  unsigned int v4 = [v3 isEnabled];

  if (v4)
  {
    id v11 = [(SearchSession *)self->_searchSession searchInfo];
    if ([v11 canRedoSearch])
    {
      id v5 = [(SearchSession *)self->_searchSession searchInfo];
      double v6 = [v5 searchAutoRedoThreshold];

      if (!v6) {
        return;
      }
      redoSearchController = self->_redoSearchController;
      id v11 = [(SearchSession *)self->_searchSession searchInfo];
      id v8 = [v11 searchAutoRedoThreshold];
      double v9 = [(SearchSession *)self->_searchSession searchInfo];
      double v10 = [v9 results];
      self->_BOOL triggered = [(RedoSearchController *)redoSearchController shouldTriggerAutoRedoWithThreshold:v8 searchResults:v10];
    }
  }
}

- (unint64_t)state
{
  if ([(SearchSession *)self->_searchSession isRedoOrAutoRedoSearchType]
    && [(SearchSession *)self->_searchSession isLoading])
  {
    return 3;
  }
  if (self->_triggered) {
    return 2;
  }
  if (![(SearchSession *)self->_searchSession isRedoOrAutoRedoSearchType]) {
    return 0;
  }
  unsigned int v4 = [(SearchSession *)self->_searchSession lastError];
  BOOL v5 = v4 != 0;

  return 4 * v5;
}

- (BOOL)isCatalyst
{
  return 0;
}

- (BOOL)shouldBeVisible
{
  return 0;
}

- (BOOL)showInCardFooterWhenCardHasExpandedLayout
{
  return 1;
}

- (void)sendAnalyticsOnBecomeVisibleWithTarget:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:2016 onTarget:v3 eventValue:0];
}

- (LocalSearchView)contentView
{
  return self->_contentView;
}

- (SearchSession)searchSession
{
  return self->_searchSession;
}

- (LocalSearchBusinessControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LocalSearchBusinessControllerDelegate *)WeakRetained;
}

- (RedoSearchController)redoSearchController
{
  return self->_redoSearchController;
}

- (void)setRedoSearchController:(id)a3
{
}

- ($C79183323B9A0D5602617FF3BE5395AC)visibleMapRect
{
  double x = self->_visibleMapRect.origin.x;
  double y = self->_visibleMapRect.origin.y;
  double width = self->_visibleMapRect.size.width;
  double height = self->_visibleMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void)setVisibleMapRect:(id)a3
{
  self->_visibleMapRect = ($AF866507483A7485D187EE11486BA295)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redoSearchController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchSession, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end