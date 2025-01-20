@interface ChromeMapSettings
+ (id)_nameForType:(unint64_t)a3;
+ (void)_registerDefaultsIfNeeded;
+ (void)initialize;
- (BOOL)_isCamera:(id)a3 equalToCamera:(id)a4;
- (BOOL)hasCenterCoordinate;
- (BOOL)hasPitched;
- (BOOL)hasTrackingMode;
- (BOOL)hasZoomLevel;
- (BOOL)pitched;
- (CLLocationCoordinate2D)centerCoordinate;
- (ChromeMapSettings)init;
- (ChromeMapSettings)initWithType:(unint64_t)a3 userInterfaceIdiom:(int64_t)a4;
- (ChromeMapSettingsDelegate)delegate;
- (MKMapView)mapView;
- (NSString)name;
- (NSTimer)saveTimer;
- (double)zoomLevel;
- (id)_defaultsKeysForType:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)trackingMode;
- (int64_t)userInterfaceIdiom;
- (unint64_t)type;
- (void)_readFromUserDefaultsWithKeys:(id)a3;
- (void)_saveIfNeeded;
- (void)_writeToUserDefaultsWithKeys:(id)a3;
- (void)applyToMapViewAnimated:(BOOL)a3 duration:(double)a4 completion:(id)a5;
- (void)clear;
- (void)readFromMapSettings:(id)a3;
- (void)readFromMapView;
- (void)reload;
- (void)save;
- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3;
- (void)setDelegate:(id)a3;
- (void)setMapView:(id)a3;
- (void)setName:(id)a3;
- (void)setNeedsSaving;
- (void)setPitched:(BOOL)a3;
- (void)setSaveTimer:(id)a3;
- (void)setTrackingMode:(int64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setUserInterfaceIdiom:(int64_t)a3;
- (void)setZoomLevel:(double)a3;
@end

@implementation ChromeMapSettings

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _[a1 _registerDefaultsIfNeeded];
  }
}

- (ChromeMapSettings)init
{
  return [(ChromeMapSettings *)self initWithType:0 userInterfaceIdiom:-1];
}

- (ChromeMapSettings)initWithType:(unint64_t)a3 userInterfaceIdiom:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ChromeMapSettings;
  v6 = [(ChromeMapSettings *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(ChromeMapSettings *)v6 setUserInterfaceIdiom:a4];
    [(ChromeMapSettings *)v7 setType:a3];
  }
  return v7;
}

- (void)reload
{
  id v3 = [(ChromeMapSettings *)self _defaultsKeysForType:self->_type];
  [(ChromeMapSettings *)self _readFromUserDefaultsWithKeys:v3];
}

- (void)setType:(unint64_t)a3
{
  if (self->_type != a3)
  {
    [(ChromeMapSettings *)self _saveIfNeeded];
    self->_type = a3;
    v5 = [(id)objc_opt_class() _nameForType:self->_type];
    name = self->_name;
    self->_name = v5;

    id v7 = [(ChromeMapSettings *)self _defaultsKeysForType:self->_type];
    [(ChromeMapSettings *)self _readFromUserDefaultsWithKeys:v7];
  }
}

+ (id)_nameForType:(unint64_t)a3
{
  CFStringRef v3 = @"other";
  if (a3 == 2) {
    CFStringRef v3 = @"navigation-overview";
  }
  if (a3 == 1) {
    return @"browsing";
  }
  else {
    return (id)v3;
  }
}

- (id)_defaultsKeysForType:(unint64_t)a3
{
  if ((id)[(ChromeMapSettings *)self userInterfaceIdiom] != (id)3)
  {
    if (a3 == 1)
    {
      v9[0] = @"centerCoordinate.latitude";
      v9[1] = @"centerCoordinate.longitude";
      v10[0] = @"map.browse.centerCoordinate.latitude";
      v10[1] = @"map.browse.centerCoordinate.longitude";
      v9[2] = @"zoomLevel";
      v9[3] = @"pitched";
      v10[2] = @"map.browse.zoomLevel";
      v10[3] = @"map.browse.pitched";
      v9[4] = @"trackingMode";
      v10[4] = @"map.browse.trackingMode";
      v4 = (const __CFString **)v10;
      v5 = (const __CFString **)v9;
      goto LABEL_7;
    }
LABEL_8:
    id v7 = 0;
    goto LABEL_11;
  }
  if (a3 == 2)
  {
    CFStringRef v11 = @"zoomLevel";
    CFStringRef v12 = @"StarkNavigationOverviewZoomLevel";
    v4 = &v12;
    v5 = &v11;
    uint64_t v6 = 1;
    goto LABEL_10;
  }
  if (a3 != 1) {
    goto LABEL_8;
  }
  v13[0] = @"centerCoordinate.latitude";
  v13[1] = @"centerCoordinate.longitude";
  v14[0] = @"StarkMapCenterLatitude";
  v14[1] = @"StarkMapCenterLongitude";
  v13[2] = @"zoomLevel";
  v13[3] = @"pitched";
  v14[2] = @"StarkMapZoomLevel";
  v14[3] = @"StarkEnter3DMode";
  v13[4] = @"trackingMode";
  v14[4] = @"StarkUserTrackingMode";
  v4 = (const __CFString **)v14;
  v5 = (const __CFString **)v13;
LABEL_7:
  uint64_t v6 = 5;
LABEL_10:
  id v7 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v5 count:v6];
LABEL_11:

  return v7;
}

- (BOOL)hasCenterCoordinate
{
  double latitude = self->_centerCoordinate.latitude;
  double longitude = self->_centerCoordinate.longitude;
  BOOL v4 = longitude >= -180.0;
  if (longitude > 180.0) {
    BOOL v4 = 0;
  }
  if (latitude < -90.0) {
    BOOL v4 = 0;
  }
  return latitude <= 90.0 && v4;
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3
{
  if (vabdd_f64(a3.latitude, self->_centerCoordinate.latitude) >= 0.00000000999999994
    || vabdd_f64(a3.longitude, self->_centerCoordinate.longitude) >= 0.00000000999999994)
  {
    self->_centerCoordinate = a3;
    [(ChromeMapSettings *)self setNeedsSaving];
  }
}

- (BOOL)hasZoomLevel
{
  return self->_zoomLevel != 0;
}

- (double)zoomLevel
{
  [(NSNumber *)self->_zoomLevel floatValue];
  return v2;
}

- (void)setZoomLevel:(double)a3
{
  v5 = sub_100598388();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = self;
    if (!v6)
    {
      CFStringRef v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      objc_super v9 = [(ChromeMapSettings *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        CFStringRef v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    CFStringRef v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    __int16 v18 = 2048;
    double v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] setZoomLevel (%f)", buf, 0x16u);
  }
  zoomLevel = self->_zoomLevel;
  if (!zoomLevel || ([(NSNumber *)zoomLevel floatValue], v13 != a3))
  {
    if (a3 <= 0.0)
    {
      v14 = 0;
    }
    else
    {
      v14 = +[NSNumber numberWithDouble:a3];
    }
    v15 = self->_zoomLevel;
    self->_zoomLevel = v14;

    [(ChromeMapSettings *)self setNeedsSaving];
  }
}

- (BOOL)hasTrackingMode
{
  return self->_trackingMode != 0;
}

- (int64_t)trackingMode
{
  return [(NSNumber *)self->_trackingMode integerValue];
}

- (void)setTrackingMode:(int64_t)a3
{
  trackingMode = self->_trackingMode;
  if (trackingMode && [(NSNumber *)trackingMode integerValue] == a3) {
    return;
  }
  uint64_t v6 = sub_100598388();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = self;
    v8 = (objc_class *)objc_opt_class();
    objc_super v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      v10 = [(ChromeMapSettings *)v7 performSelector:"accessibilityIdentifier"];
      CFStringRef v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        CFStringRef v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_9;
      }
    }
    CFStringRef v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_9:

    id v13 = v12;
    if ((unint64_t)a3 >= 3)
    {
      v15 = +[NSNumber numberWithInteger:a3];
      v14 = +[NSString stringWithFormat:@"Unknown %@", v15];
    }
    else
    {
      v14 = *(&off_1012F0870 + a3);
    }
    *(_DWORD *)buf = 138543618;
    id v19 = v13;
    __int16 v20 = 2114;
    v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] setTrackingMode (%{public}@)", buf, 0x16u);
  }
  v16 = +[NSNumber numberWithInteger:a3];
  v17 = self->_trackingMode;
  self->_trackingMode = v16;

  if (a3) {
    self->_centerCoordinate = *(CLLocationCoordinate2D *)MKCoordinateInvalid;
  }
  [(ChromeMapSettings *)self setNeedsSaving];
}

- (BOOL)hasPitched
{
  return self->_pitched != 0;
}

- (BOOL)pitched
{
  return [(NSNumber *)self->_pitched BOOLValue];
}

- (void)setPitched:(BOOL)a3
{
  BOOL v3 = a3;
  pitched = self->_pitched;
  if (!pitched || [(NSNumber *)pitched BOOLValue] != a3)
  {
    uint64_t v6 = +[NSNumber numberWithBool:v3];
    id v7 = self->_pitched;
    self->_pitched = v6;

    [(ChromeMapSettings *)self setNeedsSaving];
  }
}

- (void)setMapView:(id)a3
{
  id obj = a3;
  p_mapView = &self->_mapView;
  id WeakRetained = objc_loadWeakRetained((id *)p_mapView);

  uint64_t v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_mapView, obj);
    uint64_t v6 = obj;
  }
}

- (void)readFromMapView
{
  BOOL v3 = [(ChromeMapSettings *)self mapView];
  if (v3)
  {
    id v7 = v3;
    id v4 = [v3 userTrackingMode];
    if (v4)
    {
      double v5 = MKCoordinateInvalid[0];
      double v6 = MKCoordinateInvalid[1];
    }
    else
    {
      [v7 centerCoordinate];
    }
    -[ChromeMapSettings setCenterCoordinate:](self, "setCenterCoordinate:", v5, v6);
    [(ChromeMapSettings *)self setTrackingMode:v4];
    [v7 _zoomLevel];
    -[ChromeMapSettings setZoomLevel:](self, "setZoomLevel:");
    -[ChromeMapSettings setPitched:](self, "setPitched:", [v7 _isPitched]);
    BOOL v3 = v7;
  }
}

- (void)readFromMapSettings:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([v4 hasCenterCoordinate])
    {
      [v4 centerCoordinate];
      -[ChromeMapSettings setCenterCoordinate:](self, "setCenterCoordinate:");
    }
    if ([v4 hasTrackingMode]) {
      -[ChromeMapSettings setTrackingMode:](self, "setTrackingMode:", [v4 trackingMode]);
    }
    if ([v4 hasZoomLevel])
    {
      [v4 zoomLevel];
      -[ChromeMapSettings setZoomLevel:](self, "setZoomLevel:");
    }
    if ([v4 hasPitched]) {
      -[ChromeMapSettings setPitched:](self, "setPitched:", [v4 pitched]);
    }
  }
}

- (void)applyToMapViewAnimated:(BOOL)a3 duration:(double)a4 completion:(id)a5
{
  BOOL v143 = a3;
  v146 = (void (**)(id, void))a5;
  double v6 = +[NSUUID UUID];
  id v7 = [v6 UUIDString];

  v8 = sub_100598388();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    goto LABEL_17;
  }
  objc_super v9 = self;
  if (!v9)
  {
    v14 = @"<nil>";
    goto LABEL_10;
  }
  v10 = (objc_class *)objc_opt_class();
  CFStringRef v11 = NSStringFromClass(v10);
  if (objc_opt_respondsToSelector())
  {
    CFStringRef v12 = [(ChromeMapSettings *)v9 performSelector:"accessibilityIdentifier"];
    id v13 = v12;
    if (v12 && ![v12 isEqualToString:v11])
    {
      v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

      goto LABEL_8;
    }
  }
  v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_8:

LABEL_10:
  if (v143) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  v16 = v15;
  if (v146) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  __int16 v18 = v17;
  *(_DWORD *)buf = 138544386;
  *(void *)&uint8_t buf[4] = v14;
  *(_WORD *)&buf[12] = 2114;
  *(void *)&buf[14] = v7;
  *(_WORD *)&buf[22] = 2114;
  v165 = v16;
  __int16 v166 = 2048;
  double v167 = a4;
  __int16 v168 = 2114;
  v169 = v18;
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] applyToMapViewAnimated:duration:completion: %{public}@ (animated:%{public}@, duration:%#.2lfs, completion:%{public}@)", buf, 0x34u);

LABEL_17:
  id v19 = +[NSThread callStackSymbols];
  __int16 v20 = dispatch_get_global_queue(-2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100599BBC;
  block[3] = &unk_1012E66E0;
  block[4] = self;
  id v144 = v7;
  id v162 = v144;
  id v142 = v19;
  id v163 = v142;
  dispatch_async(v20, block);

  v145 = [(ChromeMapSettings *)self dictionaryRepresentation];
  applicationsByRunIndex = self->_applicationsByRunIndex;
  v22 = +[NSNumber numberWithUnsignedInteger:self->_runningApplicationCount];
  v23 = [(NSMutableDictionary *)applicationsByRunIndex objectForKeyedSubscript:v22];

  if (!v23
    || ([v23 settingsDictionary],
        v24 = objc_claimAutoreleasedReturnValue(),
        unsigned int v25 = [v24 isEqualToDictionary:v145],
        v24,
        !v25))
  {
    v33 = [(ChromeMapSettings *)self mapView];
    v26 = v33;
    if (!v33) {
      goto LABEL_135;
    }
    v34 = [v33 window];
    if (v34)
    {
      v35 = [v26 window];
      v36 = [v35 windowScene];
      if ([v36 activationState] == (id)2)
      {
      }
      else
      {
        v37 = [v26 window];
        v38 = [v37 windowScene];
        BOOL v39 = [v38 activationState] == (id)-1;

        if (!v39) {
          goto LABEL_32;
        }
      }
    }
    BOOL v143 = 0;
LABEL_32:
    v40 = [(ChromeMapSettings *)self delegate];
    char v41 = objc_opt_respondsToSelector();

    if ((v41 & 1) == 0) {
      goto LABEL_35;
    }
    LOBYTE(location) = v143;
    v42 = [(ChromeMapSettings *)self delegate];
    unsigned __int8 v43 = [v42 mapSettings:self shouldApplyAnimated:&location];

    if (v43)
    {
      BOOL v143 = (_BYTE)location != 0;
LABEL_35:
      unsigned __int8 v138 = [(ChromeMapSettings *)self pitched];
      id v140 = [(ChromeMapSettings *)self trackingMode];
      [(ChromeMapSettings *)self zoomLevel];
      [(ChromeMapSettings *)self centerCoordinate];
      double v45 = v44;
      double v47 = v46;
      if (v140)
      {
        v48 = +[MKLocationManager sharedLocationManager];
        unsigned int v49 = [v48 isAuthorizedForPreciseLocation];

        if (v49)
        {
          memset(buf, 0, sizeof(buf));
          [v26 _userTrackingBehavior];
          buf[0] = 0;
          uint64_t v160 = *(void *)&buf[16];
          long long v159 = *(_OWORD *)buf;
          [v26 _setUserTrackingBehavior:&v159];
        }
        else
        {
          long long v157 = *(_OWORD *)VKAnnotationTrackingBehaviorDefault;
          uint64_t v158 = VKAnnotationTrackingBehaviorDefault[2];
          [v26 _setUserTrackingBehavior:&v157];
        }
      }
      else if ([v26 userTrackingMode])
      {
        [v26 setUserTrackingMode:0 animated:0];
      }
      v57 = [v26 userLocation];
      v58 = [v57 location];
      if (v58)
      {
      }
      else
      {
        v59 = +[MKLocationManager sharedLocationManager];
        v58 = [v59 lastLocation];

        if (!v58) {
          goto LABEL_62;
        }
      }
      if (v140 || v47 < -180.0 || v47 > 180.0 || v45 < -90.0 || v45 > 90.0)
      {
        v60 = sub_100598388();
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
LABEL_61:

          [(__CFString *)v58 coordinate];
          double v45 = v67;
          double v47 = v68;
          goto LABEL_62;
        }
        v61 = self;
        v62 = (objc_class *)objc_opt_class();
        v63 = NSStringFromClass(v62);
        if (objc_opt_respondsToSelector())
        {
          v64 = [(ChromeMapSettings *)v61 performSelector:"accessibilityIdentifier"];
          v65 = v64;
          if (v64 && ![v64 isEqualToString:v63])
          {
            v66 = +[NSString stringWithFormat:@"%@<%p, %@>", v63, v61, v65];

            goto LABEL_60;
          }
        }
        v66 = +[NSString stringWithFormat:@"%@<%p>", v63, v61];
LABEL_60:

        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v66;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v144;
        *(_WORD *)&buf[22] = 2112;
        v165 = v58;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "[%{public}@] Will try to use centerCoordinate from userLocation: %{public}@ %@", buf, 0x20u);

        goto LABEL_61;
      }
LABEL_62:
      if (v47 < -180.0 || v47 > 180.0 || v45 < -90.0 || v45 > 90.0)
      {
        v91 = sub_100598388();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v144;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v58;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "Will not apply %{public}@ due to invalid center  coordinate, userLocation: %@", buf, 0x16u);
        }

        if (v146) {
          v146[2](v146, 0);
        }
        goto LABEL_134;
      }
      [v26 bounds];
      double v70 = v69;
      double v72 = v71;
      [v26 _edgeInsets];
      double v75 = v70 - (v73 + v74);
      double v78 = v72 - (v76 + v77);
      MKCoordinateRegionMakeWithZoomLevel();
      MKMapRectForCoordinateRegion();
      double v83 = v79;
      double v84 = v80;
      double v85 = v81;
      double v86 = v82;
      if (a4 < 0.0)
      {
        id v87 = [objc_alloc((Class)GEOMapRegion) initWithMapRect:v79, v80, v81, v82];
        a4 = 0.0;
        if (v143)
        {
          v88 = [v26 _mapLayer];
          [v88 durationToAnimateToMapRegion:v87];
          a4 = v89;
        }
      }
      +[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", v83, v84, v85, v86, v75, v78);
      v139 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v138)
      {
        if ([v26 _isPitched])
        {
          v90 = [v26 camera];
          [v90 pitch];
          -[__CFString setPitch:](v139, "setPitch:");
        }
      }
      else
      {
        [(__CFString *)v139 setPitch:0.0];
      }
      if (v140 == (id)2)
      {
        if ([v26 userTrackingMode] == (id)2)
        {
          v92 = [v26 camera];
          [v92 heading];
          -[__CFString setHeading:](v139, "setHeading:");
        }
      }
      else
      {
        [(__CFString *)v139 setHeading:0.0];
      }
      [(__CFString *)v139 centerCoordinate];
      if (v94 >= -180.0 && v94 <= 180.0 && v93 >= -90.0 && v93 <= 90.0)
      {
        if (v140 == [v26 userTrackingMode])
        {
          v95 = [v26 camera];
          unsigned int v96 = [(ChromeMapSettings *)self _isCamera:v139 equalToCamera:v95];

          if (v96)
          {
            v97 = sub_100598388();
            if (!os_log_type_enabled(v97, OS_LOG_TYPE_INFO)) {
              goto LABEL_100;
            }
            v98 = self;
            v99 = (objc_class *)objc_opt_class();
            v100 = NSStringFromClass(v99);
            if (objc_opt_respondsToSelector())
            {
              v101 = [(ChromeMapSettings *)v98 performSelector:"accessibilityIdentifier"];
              v102 = v101;
              if (v101 && ![v101 isEqualToString:v100])
              {
                v103 = +[NSString stringWithFormat:@"%@<%p, %@>", v100, v98, v102];

                goto LABEL_99;
              }
            }
            v103 = +[NSString stringWithFormat:@"%@<%p>", v100, v98];
LABEL_99:

            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v103;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v144;
            _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_INFO, "[%{public}@] Will not apply %{public}@ because the map is already correctly framed", buf, 0x16u);

LABEL_100:
            if (v146) {
              v146[2](v146, 1);
            }
LABEL_133:

LABEL_134:
            goto LABEL_135;
          }
        }
        ++self->_runningApplicationCount;
        objc_initWeak(&location, self);
        v112 = [[ChromeMapSettingsApplication alloc] initWithSettingsDictionary:v145];
        [(ChromeMapSettingsApplication *)v112 addCompletionHandler:v146];
        v137 = v112;
        unint64_t runningApplicationCount = self->_runningApplicationCount;
        v114 = self->_applicationsByRunIndex;
        if (!v114)
        {
          unint64_t v115 = self->_runningApplicationCount;
          v116 = +[NSMutableDictionary dictionary];
          v117 = self->_applicationsByRunIndex;
          self->_applicationsByRunIndex = v116;

          v114 = self->_applicationsByRunIndex;
          unint64_t runningApplicationCount = v115;
        }
        v136 = (void *)runningApplicationCount;
        v118 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
        [(NSMutableDictionary *)v114 setObject:v137 forKeyedSubscript:v118];

        v119 = sub_100598388();
        if (!os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
        {
LABEL_126:

          v130 = [(ChromeMapSettings *)self delegate];
          char v131 = objc_opt_respondsToSelector();

          if (v131)
          {
            v132 = [(ChromeMapSettings *)self delegate];
            [v132 mapSettings:self willApplyAnimated:v143];
          }
          v152[0] = _NSConcreteStackBlock;
          v152[1] = 3221225472;
          v152[2] = sub_100599D58;
          v152[3] = &unk_1012E85E0;
          v152[4] = self;
          id v133 = v144;
          id v153 = v133;
          v154 = v26;
          v155 = v139;
          v134 = objc_retainBlock(v152);
          v147[0] = _NSConcreteStackBlock;
          v147[1] = 3221225472;
          v147[2] = sub_100599EF0;
          v147[3] = &unk_1012F07E8;
          objc_copyWeak(v149, &location);
          BOOL v150 = v143;
          unsigned __int8 v151 = v138;
          v149[1] = v136;
          v149[2] = v140;
          v147[4] = self;
          id v148 = v133;
          v135 = objc_retainBlock(v147);
          if (v143)
          {
            +[UIView animateWithDuration:v134 animations:v135 completion:a4];
          }
          else
          {
            ((void (*)(void *))v134[2])(v134);
            ((void (*)(void *, uint64_t))v135[2])(v135, 1);
          }

          objc_destroyWeak(v149);
          objc_destroyWeak(&location);
          goto LABEL_133;
        }
        v120 = self;
        v121 = (objc_class *)objc_opt_class();
        v122 = NSStringFromClass(v121);
        if (objc_opt_respondsToSelector())
        {
          v123 = [(ChromeMapSettings *)v120 performSelector:"accessibilityIdentifier"];
          v124 = v123;
          if (v123 && ([v123 isEqualToString:v122] & 1) == 0)
          {
            v125 = +[NSString stringWithFormat:@"%@<%p, %@>", v122, v120, v124];

            goto LABEL_119;
          }
        }
        v125 = +[NSString stringWithFormat:@"%@<%p>", v122, v120];
LABEL_119:

        if (v143) {
          v126 = @"YES";
        }
        else {
          v126 = @"NO";
        }
        v127 = v126;
        if (v146) {
          v128 = @"YES";
        }
        else {
          v128 = @"NO";
        }
        v129 = v128;
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = v125;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v144;
        *(_WORD *)&buf[22] = 2112;
        v165 = v127;
        __int16 v166 = 2048;
        double v167 = a4;
        __int16 v168 = 2112;
        v169 = v129;
        _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_INFO, "[%{public}@] Will apply %{public}@ (animated:%@, duration:%#.2lfs, completion:%@)", buf, 0x34u);

        goto LABEL_126;
      }
      v104 = sub_100598388();
      if (!os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      {
LABEL_109:

        if (v146) {
          v146[2](v146, 0);
        }
        goto LABEL_133;
      }
      v105 = self;
      v106 = (objc_class *)objc_opt_class();
      v107 = NSStringFromClass(v106);
      if (objc_opt_respondsToSelector())
      {
        v108 = [(ChromeMapSettings *)v105 performSelector:"accessibilityIdentifier"];
        v109 = v108;
        if (v108 && ![v108 isEqualToString:v107])
        {
          v110 = +[NSString stringWithFormat:@"%@<%p, %@>", v107, v105, v109];

          goto LABEL_108;
        }
      }
      v110 = +[NSString stringWithFormat:@"%@<%p>", v107, v105];
LABEL_108:

      [v26 bounds];
      v111 = NSStringFromCGRect(v170);
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v110;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v144;
      *(_WORD *)&buf[22] = 2112;
      v165 = v139;
      __int16 v166 = 2112;
      double v167 = *(double *)&v111;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "[%{public}@] Will not apply %{public}@ due to invalid center coordinate on the camera. Camera is %@ and map view bounds is %@", buf, 0x2Au);

      goto LABEL_109;
    }
    v50 = sub_100598388();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
LABEL_47:

      if (v146) {
        v146[2](v146, 0);
      }
      goto LABEL_135;
    }
    v51 = self;
    v52 = (objc_class *)objc_opt_class();
    v53 = NSStringFromClass(v52);
    if (objc_opt_respondsToSelector())
    {
      v54 = [(ChromeMapSettings *)v51 performSelector:"accessibilityIdentifier"];
      v55 = v54;
      if (v54 && ![v54 isEqualToString:v53])
      {
        v56 = +[NSString stringWithFormat:@"%@<%p, %@>", v53, v51, v55];

        goto LABEL_46;
      }
    }
    v56 = +[NSString stringWithFormat:@"%@<%p>", v53, v51];
LABEL_46:

    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v56;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v144;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "[%{public}@] Will not apply, not permitted by delegate %{public}@", buf, 0x16u);

    goto LABEL_47;
  }
  [v23 addCompletionHandler:v146];
  v26 = sub_100598388();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = self;
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    if (objc_opt_respondsToSelector())
    {
      v30 = [(ChromeMapSettings *)v27 performSelector:"accessibilityIdentifier"];
      v31 = v30;
      if (v30 && ![v30 isEqualToString:v29])
      {
        v32 = +[NSString stringWithFormat:@"%@<%p, %@>", v29, v27, v31];

        goto LABEL_25;
      }
    }
    v32 = +[NSString stringWithFormat:@"%@<%p>", v29, v27];
LABEL_25:

    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v32;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v144;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[%{public}@] piggy-backing on an in-flight application %{public}@", buf, 0x16u);
  }
LABEL_135:
}

- (BOOL)_isCamera:(id)a3 equalToCamera:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 centerCoordinate];
  [v6 centerCoordinate];
  if (CLCoordinateEqualToCoordinateEpsilon()
    && ([v5 heading], double v8 = v7, objc_msgSend(v6, "heading"), v8 == v9)
    && ([v5 pitch], double v11 = v10, objc_msgSend(v6, "pitch"), v11 == v12))
  {
    [v5 altitude];
    double v14 = v13;
    [v6 altitude];
    BOOL v16 = v14 == v15;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

+ (void)_registerDefaultsIfNeeded
{
  if (qword_10160F188 != -1) {
    dispatch_once(&qword_10160F188, &stru_1012F0808);
  }
}

- (void)clear
{
  BOOL v3 = sub_100598388();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      double v9 = @"<nil>";
      goto LABEL_10;
    }
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      double v7 = [(ChromeMapSettings *)v4 performSelector:"accessibilityIdentifier"];
      double v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        double v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    double v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    double v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Resetting to original default values", buf, 0xCu);
  }
  self->_centerCoordinate = *(CLLocationCoordinate2D *)MKCoordinateInvalid;
  trackingMode = self->_trackingMode;
  self->_trackingMode = 0;

  zoomLevel = self->_zoomLevel;
  self->_zoomLevel = 0;

  pitched = self->_pitched;
  self->_pitched = 0;

  [(ChromeMapSettings *)self save];
  [(ChromeMapSettings *)self reload];
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)ChromeMapSettings;
  BOOL v3 = [(ChromeMapSettings *)&v12 description];
  id v4 = [(ChromeMapSettings *)self name];
  id v5 = +[NSNumber numberWithUnsignedInteger:[(ChromeMapSettings *)self type]];
  id v6 = +[NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&self->_centerCoordinate.latitude, *(void *)&self->_centerCoordinate.longitude];
  unint64_t v7 = [(NSNumber *)self->_trackingMode integerValue];
  if (v7 >= 3)
  {
    double v9 = +[NSNumber numberWithInteger:v7];
    double v8 = +[NSString stringWithFormat:@"Unknown %@", v9];
  }
  else
  {
    double v8 = *(&off_1012F0870 + v7);
  }
  double v10 = +[NSString stringWithFormat:@"%@ <name:%@, type:%@, centerCoordinate:%@, trackingMode:%@, zoomLevel:%@, pitched:%@>", v3, v4, v5, v6, v8, self->_zoomLevel, self->_pitched];

  return v10;
}

- (void)setNeedsSaving
{
  BOOL v3 = [(ChromeMapSettings *)self saveTimer];
  [v3 invalidate];

  [(ChromeMapSettings *)self setSaveTimer:0];
  id v4 = [(ChromeMapSettings *)self _defaultsKeysForType:[(ChromeMapSettings *)self type]];
  if ([v4 count])
  {
    id v5 = [(ChromeMapSettings *)self type];
    objc_initWeak(&location, self);
    unint64_t v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    double v9 = sub_10059AA94;
    double v10 = &unk_1012F0830;
    objc_copyWeak(v12, &location);
    v12[1] = v5;
    id v11 = v4;
    id v6 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v7 block:1.0];
    -[ChromeMapSettings setSaveTimer:](self, "setSaveTimer:", v6, v7, v8, v9, v10);

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

- (void)save
{
  BOOL v3 = [(ChromeMapSettings *)self saveTimer];
  [v3 invalidate];

  [(ChromeMapSettings *)self setSaveTimer:0];
  id v4 = [(ChromeMapSettings *)self _defaultsKeysForType:[(ChromeMapSettings *)self type]];
  if ([v4 count]) {
    [(ChromeMapSettings *)self _writeToUserDefaultsWithKeys:v4];
  }
}

- (void)_saveIfNeeded
{
  BOOL v3 = [(ChromeMapSettings *)self saveTimer];

  if (v3)
  {
    [(ChromeMapSettings *)self save];
  }
}

- (void)_readFromUserDefaultsWithKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(ChromeMapSettings *)self saveTimer];
  [v5 invalidate];

  [(ChromeMapSettings *)self setSaveTimer:0];
  if ([v4 count])
  {
    id v6 = +[NSUserDefaults standardUserDefaults];
    unint64_t v7 = [v4 objectForKeyedSubscript:@"centerCoordinate.latitude"];
    uint64_t v8 = [v4 objectForKeyedSubscript:@"centerCoordinate.longitude"];
    double v9 = [v4 objectForKeyedSubscript:@"zoomLevel"];
    double v10 = [v4 objectForKeyedSubscript:@"trackingMode"];
    id v11 = [v4 objectForKeyedSubscript:@"pitched"];
    if (v7)
    {
      objc_super v12 = [v6 objectForKey:v7];

      if (v8)
      {
LABEL_4:
        uint64_t v13 = [v6 objectForKey:v8];
        p_centerCoordinate = &self->_centerCoordinate;
        v38 = (void *)v13;
        if (v12 && v13)
        {
          [v6 doubleForKey:v7];
          CLLocationDegrees v16 = v15;
          [v6 doubleForKey:v8];
          self->_centerCoordinate.double latitude = v16;
          self->_centerCoordinate.double longitude = v17;
          if (!v9)
          {
LABEL_7:
            zoomLevel = self->_zoomLevel;
            self->_zoomLevel = 0;
            goto LABEL_12;
          }
LABEL_11:
          id v19 = [v6 objectForKey:v9];
          zoomLevel = self->_zoomLevel;
          self->_zoomLevel = v19;
LABEL_12:

          if (v10)
          {
            __int16 v20 = [v6 objectForKey:v10];
            p_trackingMode = (id *)&self->_trackingMode;
            trackingMode = self->_trackingMode;
            self->_trackingMode = v20;
          }
          else
          {
            p_trackingMode = (id *)&self->_trackingMode;
            trackingMode = self->_trackingMode;
            self->_trackingMode = 0;
          }

          if ([*p_trackingMode isEqual:&off_1013A79C0])
          {
            id v23 = *p_trackingMode;
            id *p_trackingMode = &off_1013A7990;
          }
          if (v11)
          {
            v24 = [v6 objectForKey:v11];
            pitched = self->_pitched;
            self->_pitched = v24;
          }
          else
          {
            pitched = self->_pitched;
            self->_pitched = 0;
          }

          v26 = sub_100598388();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
            goto LABEL_27;
          }
          v36 = v11;
          v27 = self;
          v28 = (objc_class *)objc_opt_class();
          v29 = NSStringFromClass(v28);
          v37 = v10;
          if (objc_opt_respondsToSelector())
          {
            v30 = [(ChromeMapSettings *)v27 performSelector:"accessibilityIdentifier"];
            v31 = v30;
            if (v30 && ![v30 isEqualToString:v29])
            {
              v32 = v8;
              v33 = v9;
              v34 = v7;
              v35 = +[NSString stringWithFormat:@"%@<%p, %@>", v29, v27, v31];

              goto LABEL_26;
            }
          }
          v32 = v8;
          v33 = v9;
          v34 = v7;
          v35 = +[NSString stringWithFormat:@"%@<%p>", v29, v27];
LABEL_26:

          *(_DWORD *)buf = 138543362;
          v40 = v35;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[%{public}@] Read from defaults", buf, 0xCu);

          unint64_t v7 = v34;
          double v9 = v33;
          uint64_t v8 = v32;
          id v11 = v36;
          double v10 = v37;
LABEL_27:

          goto LABEL_28;
        }
LABEL_10:
        CLLocationCoordinate2D *p_centerCoordinate = *(CLLocationCoordinate2D *)MKCoordinateInvalid;
        if (!v9) {
          goto LABEL_7;
        }
        goto LABEL_11;
      }
    }
    else
    {
      objc_super v12 = 0;
      if (v8) {
        goto LABEL_4;
      }
    }
    v38 = 0;
    p_centerCoordinate = &self->_centerCoordinate;
    goto LABEL_10;
  }
LABEL_28:
}

- (void)_writeToUserDefaultsWithKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(ChromeMapSettings *)self saveTimer];
  [v5 invalidate];

  [(ChromeMapSettings *)self setSaveTimer:0];
  if (![v4 count]) {
    goto LABEL_32;
  }
  id v6 = sub_100598388();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unint64_t v7 = self;
    if (!v7)
    {
      objc_super v12 = @"<nil>";
      goto LABEL_11;
    }
    uint64_t v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      double v10 = [(ChromeMapSettings *)v7 performSelector:"accessibilityIdentifier"];
      id v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        objc_super v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_9;
      }
    }
    objc_super v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543362;
    unsigned int v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Saving to defaults", buf, 0xCu);
  }
  uint64_t v13 = +[NSUserDefaults standardUserDefaults];
  double v14 = [v4 objectForKeyedSubscript:@"centerCoordinate.latitude"];
  double v15 = [v4 objectForKeyedSubscript:@"centerCoordinate.longitude"];
  CLLocationDegrees v16 = [v4 objectForKeyedSubscript:@"zoomLevel"];
  CLLocationDegrees v17 = [v4 objectForKeyedSubscript:@"trackingMode"];
  __int16 v18 = [v4 objectForKeyedSubscript:@"pitched"];
  if (v14 && v15)
  {
    id v19 = 0;
    double longitude = self->_centerCoordinate.longitude;
    if (longitude < -180.0 || longitude > 180.0 || (double latitude = self->_centerCoordinate.latitude, latitude < -90.0))
    {
      v22 = 0;
    }
    else
    {
      v22 = 0;
      if (latitude <= 90.0)
      {
        id v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v22 = +[NSNumber numberWithDouble:self->_centerCoordinate.longitude];
      }
    }
    [v13 setObject:v19 forKey:v14];
    [v13 setObject:v22 forKey:v15];
  }
  if (v16) {
    [v13 setObject:self->_zoomLevel forKey:v16];
  }
  if (v17)
  {
    if ((id)[(ChromeMapSettings *)self userInterfaceIdiom] == (id)3
      && ([(NSNumber *)self->_trackingMode isEqual:&off_1013A79C0] & 1) != 0)
    {
      trackingMode = (NSNumber *)&off_1013A7990;
    }
    else
    {
      trackingMode = self->_trackingMode;
    }
    [v13 setObject:trackingMode forKey:v17];
  }
  if (v18) {
    [v13 setObject:self->_pitched forKey:v18];
  }

LABEL_32:
}

- (id)dictionaryRepresentation
{
  BOOL v3 = +[NSMutableDictionary dictionary];
  if ([(ChromeMapSettings *)self hasCenterCoordinate])
  {
    id v4 = +[NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&self->_centerCoordinate.latitude, *(void *)&self->_centerCoordinate.longitude];
    [v3 setObject:v4 forKeyedSubscript:@"centerCoordinate"];
  }
  if ([(ChromeMapSettings *)self hasPitched]) {
    [v3 setObject:self->_pitched forKeyedSubscript:@"pitched"];
  }
  if ([(ChromeMapSettings *)self hasTrackingMode]) {
    [v3 setObject:self->_trackingMode forKeyedSubscript:@"trackingMode"];
  }
  if ([(ChromeMapSettings *)self hasZoomLevel]) {
    [v3 setObject:self->_zoomLevel forKeyedSubscript:@"zoomLevel"];
  }
  id v5 = [v3 copy];

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (ChromeMapSettingsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ChromeMapSettingsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (CLLocationCoordinate2D)centerCoordinate
{
  double latitude = self->_centerCoordinate.latitude;
  double longitude = self->_centerCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  self->_userInterfaceIdiom = a3;
}

- (NSTimer)saveTimer
{
  return self->_saveTimer;
}

- (void)setSaveTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveTimer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_applicationsByRunIndex, 0);
  objc_storeStrong((id *)&self->_pitched, 0);
  objc_storeStrong((id *)&self->_trackingMode, 0);

  objc_storeStrong((id *)&self->_zoomLevel, 0);
}

@end