@interface NTKAstronomyComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
- (BOOL)alwaysShowIdealizedTemplateInSwitcher;
- (BOOL)supportsTapAction;
- (Class)richComplicationDisplayViewClassForDevice:(id)a3;
- (NTKAstronomyComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_currentTimelineEntryWithIdealizedDate:(BOOL)a3;
- (id)complicationApplicationIdentifier;
- (id)currentSwitcherTemplate;
- (unint64_t)timelineAnimationBehavior;
- (void)_handleLocationUpdate:(id)a3 anyLocation:(id)a4;
- (void)_invalidate;
- (void)_startObserving;
- (void)_stopObserving;
- (void)becomeActive;
- (void)becomeInactive;
- (void)dealloc;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
- (void)resume;
@end

@implementation NTKAstronomyComplicationDataSource

- (NTKAstronomyComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NTKAstronomyComplicationDataSource;
  v9 = [(CLKCComplicationDataSource *)&v16 initWithComplication:v8 family:a4 forDevice:a5];
  if (v9)
  {
    v9->_vista = [v8 vista];
    v10 = +[NTKLocationManager sharedLocationManager];
    uint64_t v11 = [v10 currentLocation];
    currentLocation = v9->_currentLocation;
    v9->_currentLocation = (CLLocation *)v11;

    uint64_t v13 = [v10 anyLocation];
    anyLocation = v9->_anyLocation;
    v9->_anyLocation = (CLLocation *)v13;

    [(NTKAstronomyComplicationDataSource *)v9 _startObserving];
  }

  return v9;
}

- (void)dealloc
{
  [(NTKAstronomyComplicationDataSource *)self _stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)NTKAstronomyComplicationDataSource;
  [(NTKAstronomyComplicationDataSource *)&v3 dealloc];
}

- (void)_startObserving
{
  if (!self->_listeningForNotifications)
  {
    self->_listeningForNotifications = 1;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__invalidate name:*MEMORY[0x1E4FB2708] object:0];
    [v3 addObserver:self selector:sel__invalidate name:*MEMORY[0x1E4F1C2E0] object:0];
    [v3 addObserver:self selector:sel__invalidate name:*MEMORY[0x1E4F1C370] object:0];
  }
}

- (void)_stopObserving
{
  self->_listeningForNotifications = 0;
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2708] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C2E0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];
}

- (BOOL)alwaysShowIdealizedTemplateInSwitcher
{
  return 1;
}

- (Class)richComplicationDisplayViewClassForDevice:(id)a3
{
  int64_t v4 = [(CLKCComplicationDataSource *)self family];
  v5 = 0;
  switch(v4)
  {
    case 8:
      v6 = [(CLKCComplicationDataSource *)self complication];
      uint64_t v7 = [v6 complicationType];

      if (v7 == 40) {
        goto LABEL_3;
      }
      v5 = 0;
      break;
    case 9:
    case 10:
    case 12:
LABEL_3:
      v5 = objc_opt_class();
      break;
    default:
      break;
  }
  return (Class)v5;
}

- (BOOL)supportsTapAction
{
  int v3 = _os_feature_enabled_impl();
  if (v3) {
    LOBYTE(v3) = self->_vista == 0;
  }
  return v3;
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  uint64_t v7 = (void (**)(id, void *))a5;
  if (_os_feature_enabled_impl() && !self->_vista)
  {
    v6 = [MEMORY[0x1E4F1CB10] nwcCurrentLocationURLForLocation:self->_currentLocation];
  }
  else
  {
    v6 = 0;
  }
  v7[2](v7, v6);
}

- (id)complicationApplicationIdentifier
{
  if (_os_feature_enabled_impl() && !self->_vista) {
    int v3 = @"com.apple.NanoWorldClock";
  }
  else {
    int v3 = 0;
  }
  return v3;
}

- (void)_handleLocationUpdate:(id)a3 anyLocation:(id)a4
{
  v6 = (CLLocation *)a3;
  uint64_t v7 = (CLLocation *)a4;
  currentLocation = self->_currentLocation;
  self->_currentLocation = v6;
  v9 = v6;

  anyLocation = self->_anyLocation;
  self->_anyLocation = v7;

  [(NTKAstronomyComplicationDataSource *)self _invalidate];
}

- (void)becomeActive
{
  int v3 = +[NTKLocationManager sharedLocationManager];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__NTKAstronomyComplicationDataSource_becomeActive__block_invoke;
  v6[3] = &unk_1E62C29C8;
  objc_copyWeak(&v7, &location);
  int64_t v4 = [v3 startLocationUpdatesWithIdentifier:@"ntk.astronomyComplicationDataSource" handler:v6];
  token = self->_token;
  self->_token = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __50__NTKAstronomyComplicationDataSource_becomeActive__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleLocationUpdate:v6 anyLocation:v5];
}

- (void)becomeInactive
{
  if (self->_token)
  {
    int v3 = +[NTKLocationManager sharedLocationManager];
    [v3 stopLocationUpdatesForToken:self->_token];

    token = self->_token;
    self->_token = 0;
  }
}

- (id)_currentTimelineEntryWithIdealizedDate:(BOOL)a3
{
  id v5 = +[CLKDate complicationDate];
  id v6 = v5;
  if (a3)
  {
    NTKIdealizedDate();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v5;
  }
  id v8 = v7;
  v9 = [[NTKAstronomyTimelineEntryModel alloc] initWithVista:self->_vista entryDate:v7 currentDate:v6 currentLocation:self->_currentLocation anyLocation:self->_anyLocation];
  v10 = [(NTKTimelineEntryModel *)v9 entryForComplicationFamily:[(CLKCComplicationDataSource *)self family]];

  return v10;
}

- (unint64_t)timelineAnimationBehavior
{
  return 0;
}

- (id)currentSwitcherTemplate
{
  v2 = [(NTKAstronomyComplicationDataSource *)self _currentTimelineEntryWithIdealizedDate:1];
  int v3 = [v2 complicationTemplate];

  return v3;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(NTKAstronomyComplicationDataSource *)self _currentTimelineEntryWithIdealizedDate:0];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)resume
{
  [(NTKAstronomyComplicationDataSource *)self _startObserving];
  [(NTKAstronomyComplicationDataSource *)self _invalidate];
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 - 39 < 3;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  char v5 = _os_feature_enabled_impl();
  if (a3 == 11 && (v5 & 1) != 0) {
    return 1;
  }
  return a3 == 12 || (unint64_t)(a3 - 8) < 3;
}

- (void)_invalidate
{
  id v2 = [(CLKCComplicationDataSource *)self delegate];
  [v2 invalidateEntries];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anyLocation, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end