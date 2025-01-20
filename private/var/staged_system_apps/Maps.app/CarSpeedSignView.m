@interface CarSpeedSignView
- (BOOL)contentsHidden;
- (BOOL)isActive;
- (BOOL)isDimmed;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (CarSpeedSignView)initWithCarSceneType:(int64_t)a3;
- (double)dynamicScale;
- (int64_t)shieldIdiom;
- (int64_t)shieldSize;
- (void)_activate;
- (void)_deactivate;
- (void)_setLocation:(id)a3;
- (void)_updateLocationSource;
- (void)dealloc;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)refreshSpeedLimit;
- (void)setActive:(BOOL)a3;
- (void)setContentsHidden:(BOOL)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setDimmed:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CarSpeedSignView

- (void)dealloc
{
  [(CarSpeedSignView *)self _deactivate];
  v3.receiver = self;
  v3.super_class = (Class)CarSpeedSignView;
  [(CarSpeedSignView *)&v3 dealloc];
}

- (CarSpeedSignView)initWithCarSceneType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CarSpeedSignView;
  v4 = -[SpeedLimitView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_carSceneType = a3;
    v4->_active = 0;
    v4->_contentsHidden = 1;
    v6 = +[MNNavigationService sharedService];
    v5->_isNavigating = [v6 isInNavigatingState];

    [(CarSpeedSignView *)v5 setAccessibilityIdentifier:@"CarSpeedSignView"];
  }
  return v5;
}

- (int64_t)shieldIdiom
{
  return 1;
}

- (int64_t)shieldSize
{
  return 3;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    if (a3) {
      [(CarSpeedSignView *)self _activate];
    }
    else {
      [(CarSpeedSignView *)self _deactivate];
    }
  }
}

- (void)refreshSpeedLimit
{
  if (self->_isNavigating)
  {
    objc_super v3 = +[MNNavigationService sharedService];
    id v4 = [v3 lastLocation];
  }
  else
  {
    id v4 = 0;
  }
  [(CarSpeedSignView *)self _setLocation:v4];
}

- (void)setContentsHidden:(BOOL)a3
{
  if (self->_contentsHidden != a3)
  {
    self->_contentsHidden = a3;
    id v4 = sub_100015DB4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      unsigned int v5 = [(CarSpeedSignView *)self contentsHidden];
      v6 = @"NO";
      if (v5) {
        v6 = @"YES";
      }
      v7 = v6;
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[SpeedSign] Will post visibility changed notification (contentsHidden: %@)", (uint8_t *)&v9, 0xCu);
    }
    objc_super v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"CarSpeedSignViewDidChangeVisibility" object:self];
  }
}

- (double)dynamicScale
{
  objc_super v3 = [(CarSpeedSignView *)self window];
  id v4 = [v3 screen];
  if (v4)
  {
    int64_t carSceneType = self->_carSceneType;

    if (carSceneType == 7)
    {
      v6 = [(CarSpeedSignView *)self window];
      v7 = [v6 screen];
      [v7 _car_dynamicPointScaleValue];
      double v9 = v8;

      return v9;
    }
  }
  else
  {
  }
  v11.receiver = self;
  v11.super_class = (Class)CarSpeedSignView;
  [(SpeedLimitView *)&v11 dynamicScale];
  return result;
}

- (void)setDimmed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_dimmed != a3)
  {
    BOOL v4 = a3;
    self->_dimmed = a3;
    if (a4) {
      unsigned int v6 = !+[UIView _maps_shouldAdoptImplicitAnimationParameters];
    }
    else {
      unsigned int v6 = 0;
    }
    v7 = sub_100015DB4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if (v4) {
        double v8 = @"YES";
      }
      else {
        double v8 = @"NO";
      }
      double v9 = v8;
      if (v6) {
        v10 = @"YES";
      }
      else {
        v10 = @"NO";
      }
      objc_super v11 = v10;
      *(_DWORD *)buf = 138412546;
      v16 = v9;
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[SpeedSign] (dimmed: %@, animated: %@)", buf, 0x16u);
    }
    double v12 = 0.0;
    v13[1] = 3221225472;
    v13[0] = _NSConcreteStackBlock;
    v13[2] = sub_100C89C24;
    v13[3] = &unk_1012E6300;
    if (v6) {
      double v12 = 0.25;
    }
    v13[4] = self;
    BOOL v14 = v4;
    +[UIView animateWithDuration:v13 animations:v12];
  }
}

- (void)_updateLocationSource
{
  if (!self->_active
    || self->_isNavigating
    || (GEOConfigGetBOOL() & 1) == 0 && (CarDisplayIsDriveCameraEnabled() & 1) == 0)
  {
    if (!self->_roadMatcher) {
      return;
    }
    objc_super v3 = sub_100015DB4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[SpeedSign] Stopping road matcher", buf, 2u);
    }

    roadMatcher = self->_roadMatcher;
    self->_roadMatcher = 0;

    unsigned int v5 = +[MKLocationManager sharedLocationManager];
    [v5 stopListeningForLocationUpdates:self];
    goto LABEL_7;
  }
  if (!self->_roadMatcher)
  {
    unsigned int v6 = sub_100015DB4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[SpeedSign] Starting road mather", v9, 2u);
    }

    v7 = (GEORoadMatcher *)[objc_alloc((Class)GEORoadMatcher) initWithAuditToken:0];
    double v8 = self->_roadMatcher;
    self->_roadMatcher = v7;

    GEOConfigGetDouble();
    -[GEORoadMatcher setSearchRadius:](self->_roadMatcher, "setSearchRadius:");
    unsigned int v5 = +[MKLocationManager sharedLocationManager];
    [v5 listenForLocationUpdates:self];
LABEL_7:
  }
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  self->_isNavigating = MNNavigationServiceStateIsNavigating();
  [(CarSpeedSignView *)self _updateLocationSource];

  [(CarSpeedSignView *)self refreshSpeedLimit];
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
}

- (void)_setLocation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 speedLimit];
  id v6 = [v4 speedLimitShieldType];

  [(SpeedLimitView *)self setSpeedLimit:v5 shieldType:v6];
  uint64_t v7 = [(SpeedLimitView *)self hasContent] ^ 1;

  [(CarSpeedSignView *)self setContentsHidden:v7];
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  roadMatcher = self->_roadMatcher;
  id v5 = a3;
  id v6 = [v5 currentLocation];
  uint64_t v7 = [(GEORoadMatcher *)roadMatcher matchLocation:v6 forTransportType:0];

  id v8 = objc_alloc((Class)MNLocation);
  double v9 = [v5 lastLocation];

  id v10 = [v8 initWithRoadMatch:v7 rawLocation:v9 locationMatchType:2];
  objc_super v11 = sub_100015DB4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v12 = [v10 locationUnreliable];
    v13 = @"NO";
    if (v12) {
      v13 = @"YES";
    }
    BOOL v14 = v13;
    int v15 = 138478083;
    id v16 = v10;
    __int16 v17 = 2112;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[SpeedSign] matched location: %{private}@ (unreliable: %@)", (uint8_t *)&v15, 0x16u);
  }
  [(CarSpeedSignView *)self _setLocation:v10];
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (void)_activate
{
  self->_active = 1;
  objc_super v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will activate speed sign view", v5, 2u);
  }

  [(CarSpeedSignView *)self refreshSpeedLimit];
  id v4 = +[MNNavigationService sharedService];
  [v4 registerObserver:self];

  [(CarSpeedSignView *)self _updateLocationSource];
}

- (void)_deactivate
{
  self->_active = 0;
  objc_super v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will deactivate speed sign view", v5, 2u);
  }

  id v4 = +[MNNavigationService sharedService];
  [v4 unregisterObserver:self];

  [(SpeedLimitView *)self setSpeedLimit:0 shieldType:0];
  [(CarSpeedSignView *)self _updateLocationSource];
}

- (BOOL)contentsHidden
{
  return self->_contentsHidden;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (void)setDimmed:(BOOL)a3
{
  self->_dimmed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roadMatch, 0);

  objc_storeStrong((id *)&self->_roadMatcher, 0);
}

@end