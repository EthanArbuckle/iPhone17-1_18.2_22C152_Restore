@interface BrowseVenueBusinessController
- (BOOL)shouldBeVisible;
- (BOOL)showInCardFooterWhenCardHasExpandedLayout;
- (BOOL)updateContentViewForVenueAndReturnYESIfChanged;
- (BOOL)updatingVenueAsync;
- (BrowseVenueBusinessController)initWithDelegate:(id)a3;
- (LocalSearchBusinessControllerDelegate)delegate;
- (LocalSearchView)contentView;
- (VKVenueFeatureMarker)venue;
- (double)lastVenueUpdateTimestamp;
- (unint64_t)lastUpdatedMapType;
- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5;
- (void)handleMapTypeDidChange:(unint64_t)a3;
- (void)handleVenueWithFocusDidChange:(id)a3;
- (void)immediatelyHandleVenueWithFocusDidChange:(id)a3;
- (void)sendAnalyticsOnBecomeVisibleWithTarget:(int)a3;
- (void)sendAnalyticsOnUserActionWithTarget:(int)a3;
- (void)setContentView:(id)a3;
- (void)setLastUpdatedMapType:(unint64_t)a3;
- (void)setLastVenueUpdateTimestamp:(double)a3;
- (void)setUpdatingVenueAsync:(BOOL)a3;
- (void)setVenue:(id)a3;
@end

@implementation BrowseVenueBusinessController

- (BrowseVenueBusinessController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BrowseVenueBusinessController;
  v5 = [(BrowseVenueBusinessController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
  id v5 = a3;
  [(LocalSearchView *)self->_contentView setAccessibilityIdentifier:@"BrowseVenueContentView"];
  [(LocalSearchView *)self->_contentView setState:1];
  [(BrowseVenueBusinessController *)self updateContentViewForVenueAndReturnYESIfChanged];
  [v5 setText:0 forState:3];
  [v5 setText:0 forState:4];
}

- (BOOL)updateContentViewForVenueAndReturnYESIfChanged
{
  v3 = [(BrowseVenueBusinessController *)self venue];
  id v4 = [v3 shortName];

  id v5 = [v4 length];
  v6 = +[NSBundle mainBundle];
  v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 localizedStringForKey:@"Browse [venue with name]" value:@"localized string not found" table:0];

    uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4);
    v7 = (void *)v8;
  }
  else
  {
    uint64_t v9 = [v6 localizedStringForKey:@"Browse [venue without name]" value:@"localized string not found" table:0];
  }

  v10 = [(BrowseVenueBusinessController *)self contentView];
  uint64_t v11 = [v10 textForState:1];

  if (!(v11 | v9) || v11 && ([(id)v11 isEqualToString:v9] & 1) != 0)
  {
    BOOL v12 = 0;
  }
  else
  {
    v13 = [(BrowseVenueBusinessController *)self contentView];
    BOOL v12 = 1;
    [v13 setText:v9 forState:1];
  }
  return v12;
}

- (BOOL)shouldBeVisible
{
  v3 = [(BrowseVenueBusinessController *)self venue];
  if (v3)
  {
    unint64_t v4 = [(BrowseVenueBusinessController *)self lastUpdatedMapType];
    BOOL v5 = v4 - 1 >= 4 && v4 != 107;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)handleVenueWithFocusDidChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BrowseVenueBusinessController *)self venue];
  if ([v5 venueID])
  {
  }
  else
  {
    id v6 = [v4 venueID];

    if (!v6) {
      goto LABEL_12;
    }
  }
  if (![(BrowseVenueBusinessController *)self updatingVenueAsync])
  {
    v7 = [(BrowseVenueBusinessController *)self delegate];
    unsigned __int8 v8 = [v7 viewHasAppeared];

    if (v4 || (v8 & 1) != 0)
    {
      +[NSDate timeIntervalSinceReferenceDate];
      double v10 = v9;
      [(BrowseVenueBusinessController *)self lastVenueUpdateTimestamp];
      double v12 = v10 - v11;
      if (v12 >= 1.0) {
        int64_t v13 = 100000000;
      }
      else {
        int64_t v13 = (uint64_t)((1.0 - v12) * 1000000000.0);
      }
      [(BrowseVenueBusinessController *)self setUpdatingVenueAsync:1];
      dispatch_time_t v14 = dispatch_time(0, v13);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10059D024;
      block[3] = &unk_1012E5D08;
      block[4] = self;
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      [(BrowseVenueBusinessController *)self immediatelyHandleVenueWithFocusDidChange:0];
    }
  }
LABEL_12:
}

- (void)handleMapTypeDidChange:(unint64_t)a3
{
  if ([(BrowseVenueBusinessController *)self lastUpdatedMapType] != a3)
  {
    [(BrowseVenueBusinessController *)self setLastUpdatedMapType:a3];
    id v5 = [(BrowseVenueBusinessController *)self delegate];
    [v5 businessControllerVisibilityDidChange:self];
  }
}

- (void)immediatelyHandleVenueWithFocusDidChange:(id)a3
{
  id v9 = a3;
  id v4 = [(BrowseVenueBusinessController *)self venue];
  if ([v4 venueID])
  {
  }
  else
  {
    id v5 = [v9 venueID];

    if (!v5) {
      goto LABEL_14;
    }
  }
  id v6 = [(BrowseVenueBusinessController *)self venue];
  [(BrowseVenueBusinessController *)self setVenue:v9];
  if (![(BrowseVenueBusinessController *)self shouldBeVisible])
  {
    if (v9 && v6) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  unsigned int v7 = [(BrowseVenueBusinessController *)self updateContentViewForVenueAndReturnYESIfChanged];
  if (!v9 || !v6)
  {
LABEL_11:
    unsigned __int8 v8 = [(BrowseVenueBusinessController *)self delegate];
    [v8 businessControllerVisibilityDidChange:self];
    goto LABEL_12;
  }
  if (v7)
  {
    unsigned __int8 v8 = [(BrowseVenueBusinessController *)self delegate];
    [v8 businessControllerContentSizeDidChange:self];
LABEL_12:
  }
LABEL_13:

LABEL_14:
}

- (BOOL)showInCardFooterWhenCardHasExpandedLayout
{
  return 0;
}

- (void)sendAnalyticsOnUserActionWithTarget:(int)a3
{
}

- (void)sendAnalyticsOnBecomeVisibleWithTarget:(int)a3
{
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v12 = objc_alloc_init((Class)GEOPlaceActionDetails);
  id v9 = [(BrowseVenueBusinessController *)self venue];
  id v10 = [v9 businessID];

  if (v10) {
    [v12 setBusinessID:v10];
  }
  double v11 = +[MKMapService sharedService];
  [v11 captureUserAction:v6 onTarget:v5 eventValue:v8 placeActionDetails:v12];
}

- (LocalSearchView)contentView
{
  return self->_contentView;
}

- (LocalSearchBusinessControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LocalSearchBusinessControllerDelegate *)WeakRetained;
}

- (VKVenueFeatureMarker)venue
{
  return self->_venue;
}

- (void)setVenue:(id)a3
{
}

- (double)lastVenueUpdateTimestamp
{
  return self->_lastVenueUpdateTimestamp;
}

- (void)setLastVenueUpdateTimestamp:(double)a3
{
  self->_lastVenueUpdateTimestamp = a3;
}

- (BOOL)updatingVenueAsync
{
  return self->_updatingVenueAsync;
}

- (void)setUpdatingVenueAsync:(BOOL)a3
{
  self->_updatingVenueAsync = a3;
}

- (unint64_t)lastUpdatedMapType
{
  return self->_lastUpdatedMapType;
}

- (void)setLastUpdatedMapType:(unint64_t)a3
{
  self->_lastUpdatedMapType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end