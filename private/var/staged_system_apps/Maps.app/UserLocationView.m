@interface UserLocationView
- (BOOL)_shouldRotateForCourseWithMode:(int64_t)a3;
- (BOOL)_shouldUseNavPuck;
- (BOOL)isPersistent;
- (UserLocationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (int64_t)mode;
- (void)_setAnimatingToCoordinate:(BOOL)a3;
- (void)_setPresentationCoordinate:(CLLocationCoordinate2D)a3;
- (void)_setPresentationCourse:(double)a3;
- (void)_setTracking:(BOOL)a3;
- (void)_setVKNavigationPuckMarker:(id)a3;
- (void)_transitionTo:(int64_t)a3;
- (void)_transitionToNavPuckWithDuration:(double)a3;
- (void)_transitionToNormalPuckWithDuration:(double)a3;
- (void)_updateForMode:(int64_t)a3 animated:(BOOL)a4;
- (void)_updateNavPuckAnimated:(BOOL)a3;
- (void)_updateVKNavigationPuckMarkerFromCurrentState;
- (void)locationManagerFailedToUpdateLocation;
- (void)setAnnotation:(id)a3;
- (void)setInNavMode:(BOOL)a3 animated:(BOOL)a4;
- (void)setMode:(int64_t)a3;
- (void)setMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setViewMode:(int64_t)a3;
- (void)updateStateFromLocation:(id)a3 duration:(double)a4;
@end

@implementation UserLocationView

- (void)_setVKNavigationPuckMarker:(id)a3
{
  id v4 = a3;
  v5 = sub_100053B74();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_setVKNavigationPuckMarker: %@", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)UserLocationView;
  [(UserLocationView *)&v6 _setVKNavigationPuckMarker:v4];
  [(UserLocationView *)self _updateVKNavigationPuckMarkerFromCurrentState];
}

- (void)_setAnimatingToCoordinate:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UserLocationView;
  -[UserLocationView _setAnimatingToCoordinate:](&v6, "_setAnimatingToCoordinate:");
  v5 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v5 setAnimatingToCoordinate:v3];
}

- (void)_updateForMode:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = sub_100053B74();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    int64_t v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Updating for UserLocationMarkerMode: %ld", (uint8_t *)&v11, 0xCu);
  }

  BOOL v8 = [(UserLocationView *)self _shouldRotateForCourseWithMode:a3];
  [(UserLocationView *)self setAllowsAccuracyRing:a3 != 1];
  [(UserLocationView *)self setShouldInnerPulse:a3 != 1];
  v9 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v9 setMode:a3 == 2];

  v10 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v10 setShowCourse:v8];

  [(UserLocationView *)self _updateNavPuckAnimated:v4];
}

- (void)_updateNavPuckAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(UserLocationView *)self _shouldUseNavPuck];
  objc_super v6 = sub_100053B74();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      int v10 = 67109120;
      BOOL v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "_updateNavPuckAnimated: to nav puck, animated: %d", (uint8_t *)&v10, 8u);
    }

    double v8 = 0.0;
    if (v3) {
      double v8 = 1.0;
    }
    [(UserLocationView *)self _transitionToNavPuckWithDuration:v8];
  }
  else
  {
    if (v7)
    {
      int v10 = 67109120;
      BOOL v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "_updateNavPuckAnimated: to normal puck, animated: %d", (uint8_t *)&v10, 8u);
    }

    double v9 = 0.0;
    if (v3) {
      double v9 = 1.0;
    }
    [(UserLocationView *)self _transitionToNormalPuckWithDuration:v9];
  }
}

- (void)_transitionToNormalPuckWithDuration:(double)a3
{
  BOOL isNavPuckActive = self->_isNavPuckActive;
  objc_super v6 = sub_100053B74();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (isNavPuckActive)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Transitioning to normal puck", buf, 2u);
    }

    self->_BOOL isNavPuckActive = 0;
    [(UserLocationView *)self setEnabled:1];
    [(VKTimedAnimation *)self->_transitionAnimation stop];
    if (a3 <= 0.0
      || ([(UserLocationView *)self superview],
          double v8 = objc_claimAutoreleasedReturnValue(),
          BOOL v9 = v8 == 0,
          v8,
          v9))
    {
      v16 = sub_100053B74();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Transitioning to normal puck un-animated", buf, 2u);
      }

      v17 = [(UserLocationView *)self _vkNavigationPuckMarker];
      [v17 setScale:0.0];

      v18 = [(UserLocationView *)self _vkNavigationPuckMarker];
      [v18 setEnabled:0];

      long long v19 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v20[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v20[1] = v19;
      v20[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      [(UserLocationView *)self setTransform:v20];
      [(UserLocationView *)self setAlpha:1.0];
    }
    else
    {
      objc_initWeak(&location, self);
      int v10 = (VKTimedAnimation *)[objc_alloc((Class)VKTimedAnimation) initWithDuration:a3];
      transitionAnimation = self->_transitionAnimation;
      self->_transitionAnimation = v10;

      int64_t v12 = sub_100053B74();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = self->_transitionAnimation;
        *(_DWORD *)buf = 138412290;
        v29 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Transitioning to normal puck animated with animation: %@", buf, 0xCu);
      }

      [(UserLocationView *)self _vkNavigationPuckMarker];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100C3EBFC;
      v25[3] = &unk_1012FC680;
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      id v26 = v14;
      [(VKTimedAnimation *)self->_transitionAnimation setStepHandler:v25];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100C3EC0C;
      v22[3] = &unk_1012E5D30;
      objc_copyWeak(&v24, &location);
      id v15 = v14;
      id v23 = v15;
      [(VKTimedAnimation *)self->_transitionAnimation setCompletionHandler:v22];
      [v15 runAnimation:self->_transitionAnimation];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100C3ED20;
      v21[3] = &unk_1012E5D08;
      v21[4] = self;
      +[UIView animateWithDuration:v21 animations:a3];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Not transitioning to normal puck because the nav puck is not currently active", buf, 2u);
    }
  }
}

- (BOOL)_shouldUseNavPuck
{
  return self->_mode == 1;
}

- (void)setAnnotation:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UserLocationView;
  id v4 = a3;
  [(UserLocationView *)&v6 setAnnotation:v4];
  unsigned int v5 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v5 setAnnotation:v4];
}

- (void)_updateVKNavigationPuckMarkerFromCurrentState
{
  BOOL v3 = sub_100053B74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int64_t mode = self->_mode;
    BOOL isNavPuckActive = self->_isNavPuckActive;
    int v29 = 134218240;
    int64_t v30 = mode;
    __int16 v31 = 1024;
    BOOL v32 = isNavPuckActive;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "_updateVKNavigationPuckMarkerFromCurrentState _mode: %ld _isNavPuckActive: %d", (uint8_t *)&v29, 0x12u);
  }

  BOOL v6 = self->_mode == 2;
  BOOL v7 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v7 setMode:v6];

  BOOL v8 = [(UserLocationView *)self _shouldRotateForCourseWithMode:self->_mode];
  BOOL v9 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v9 setShowCourse:v8];

  id v10 = [(UserLocationView *)self _isTracking];
  BOOL v11 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v11 setTracking:v10];

  [(UserLocationView *)self _presentationCourse];
  double v13 = v12;
  id v14 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v14 setPresentationCourse:v13];

  [(UserLocationView *)self _presentationCoordinate];
  double v16 = v15;
  double v18 = v17;
  long long v19 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v19 setPresentationCoordinate:v16, v18];

  id v20 = [(UserLocationView *)self _isAnimatingToCoordinate];
  v21 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v21 setAnimatingToCoordinate:v20];

  v22 = [(UserLocationView *)self annotation];
  id v23 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v23 setAnnotation:v22];

  if (self->_isNavPuckActive) {
    float v24 = 1.0;
  }
  else {
    float v24 = 0.0;
  }
  v25 = [(UserLocationView *)self _vkNavigationPuckMarker];
  *(float *)&double v26 = v24;
  [v25 setScale:v26];

  BOOL v27 = self->_isNavPuckActive;
  v28 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v28 setEnabled:v27];

  [(UserLocationView *)self _updateNavPuckAnimated:0];
}

- (void)updateStateFromLocation:(id)a3 duration:(double)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UserLocationView;
  [(UserLocationView *)&v14 updateStateFromLocation:v6 duration:a4];
  BOOL v7 = +[MKLocationManager sharedLocationManager];
  [v7 currentVehicleHeading];
  double v9 = v8;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unsigned __int8 v11 = [(UserLocationView *)self isStale];
  if (isKindOfClass)
  {
    if ((v11 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_5:
    [(UserLocationView *)self locationManagerFailedToUpdateLocation];
    uint64_t v12 = 1;
    goto LABEL_11;
  }
  if (v11) {
    goto LABEL_5;
  }
  if (self->_mode != 1)
  {
LABEL_10:
    uint64_t v12 = 0;
    goto LABEL_11;
  }
  uint64_t v12 = 0;
  if ((objc_msgSend(v6, "_navigation_hasValidCourse") & 1) == 0 && v9 < 0.0) {
    goto LABEL_5;
  }
LABEL_11:
  double v13 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v13 setStale:v12];
}

- (void)setViewMode:(int64_t)a3
{
  if (self->_viewMode != a3)
  {
    unsigned int v5 = sub_100053B74();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 134217984;
      int64_t v7 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting view mode: %ld", (uint8_t *)&v6, 0xCu);
    }

    self->_inNavigationMapMode = 0;
    self->_viewMode = a3;
    [(UserLocationView *)self _updateNavPuckAnimated:0];
  }
}

- (void)setMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_mode != a3)
  {
    self->_int64_t mode = a3;
    -[UserLocationView _updateForMode:animated:](self, "_updateForMode:animated:");
  }
}

- (UserLocationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)UserLocationView;
  id v4 = [(UserLocationView *)&v6 initWithAnnotation:a3 reuseIdentifier:a4];
  v4->_int64_t mode = 0;
  [(UserLocationView *)v4 _updateForMode:0 animated:0];
  return v4;
}

- (BOOL)_shouldRotateForCourseWithMode:(int64_t)a3
{
  return a3 == 1;
}

- (void)setMode:(int64_t)a3
{
}

- (void)setInNavMode:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_inNavMode != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    int64_t v7 = sub_100053B74();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      double v8 = @"NO";
      if (v5) {
        double v8 = @"YES";
      }
      double v9 = v8;
      int v10 = 138412290;
      unsigned __int8 v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting is in nav mode: %@", (uint8_t *)&v10, 0xCu);
    }
    self->_inNavMode = v5;
    [(UserLocationView *)self _updateNavPuckAnimated:v4];
  }
}

- (void)_setTracking:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UserLocationView;
  -[UserLocationView _setTracking:](&v6, "_setTracking:");
  BOOL v5 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v5 setTracking:v3];
}

- (void)_setPresentationCourse:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UserLocationView;
  -[UserLocationView _setPresentationCourse:](&v6, "_setPresentationCourse:");
  BOOL v5 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v5 setPresentationCourse:a3];
}

- (void)_setPresentationCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  v7.receiver = self;
  v7.super_class = (Class)UserLocationView;
  -[UserLocationView _setPresentationCoordinate:](&v7, "_setPresentationCoordinate:");
  objc_super v6 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v6 setPresentationCoordinate:latitude longitude];
}

- (void)_transitionToNavPuckWithDuration:(double)a3
{
  if (self->_isNavPuckActive
    || ([(UserLocationView *)self _vkNavigationPuckMarker],
        double v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    BOOL v4 = sub_100053B74();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_isNavPuckActive) {
        BOOL v5 = @"YES";
      }
      else {
        BOOL v5 = @"NO";
      }
      objc_super v6 = v5;
      objc_super v7 = [(UserLocationView *)self _vkNavigationPuckMarker];
      *(_DWORD *)buf = 138412546;
      __int16 v31 = (VKTimedAnimation *)v6;
      __int16 v32 = 2048;
      v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Not transitioning to navigation puck because either the nav puck is already active (%@) or vkNavigationPuckMarker is nil (%p)", buf, 0x16u);
    }
  }
  else
  {
    int v10 = sub_100053B74();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Transitioning to navigation puck", buf, 2u);
    }

    self->_BOOL isNavPuckActive = 1;
    [(UserLocationView *)self setEnabled:0];
    [(VKTimedAnimation *)self->_transitionAnimation stop];
    unsigned __int8 v11 = [(UserLocationView *)self _vkNavigationPuckMarker];
    [v11 setEnabled:1];

    if (a3 <= 0.0
      || ([(UserLocationView *)self superview],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          BOOL v13 = v12 == 0,
          v12,
          v13))
    {
      long long v19 = sub_100053B74();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Transitioning to navigation puck un-animated", buf, 2u);
      }

      id v20 = [(UserLocationView *)self _vkNavigationPuckMarker];
      LODWORD(v21) = 1.0;
      [v20 setScale:v21];

      CGAffineTransformMakeScale(&v23, 0.0, 0.0);
      CGAffineTransform v22 = v23;
      [(UserLocationView *)self setTransform:&v22];
      [(UserLocationView *)self setAlpha:0.0];
    }
    else
    {
      objc_initWeak(&location, self);
      objc_super v14 = (VKTimedAnimation *)[objc_alloc((Class)VKTimedAnimation) initWithDuration:a3];
      transitionAnimation = self->_transitionAnimation;
      self->_transitionAnimation = v14;

      double v16 = sub_100053B74();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        double v17 = self->_transitionAnimation;
        *(_DWORD *)buf = 138412290;
        __int16 v31 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Transitioning to navigation puck animated with animation: %@", buf, 0xCu);
      }

      [(UserLocationView *)self _vkNavigationPuckMarker];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100C3EA78;
      v27[3] = &unk_1012FC680;
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      id v28 = v18;
      [(VKTimedAnimation *)self->_transitionAnimation setStepHandler:v27];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100C3EA88;
      v25[3] = &unk_1012E6998;
      objc_copyWeak(&v26, &location);
      [(VKTimedAnimation *)self->_transitionAnimation setCompletionHandler:v25];
      [v18 runAnimation:self->_transitionAnimation];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100C3EB9C;
      v24[3] = &unk_1012E5D08;
      v24[4] = self;
      +[UIView animateWithDuration:v24 animations:a3];
      objc_destroyWeak(&v26);

      objc_destroyWeak(&location);
    }
  }
}

- (void)_transitionTo:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UserLocationView;
  -[UserLocationView _transitionTo:](&v8, "_transitionTo:");
  BOOL v5 = sub_100053B74();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 + 1) > 5) {
      CFStringRef v6 = &stru_101324E70;
    }
    else {
      CFStringRef v6 = *(&off_10131C1A8 + a3 + 1);
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Transitioning to VKMapMode: %@", buf, 0xCu);
  }

  BOOL v7 = a3 == 1;
  if (self->_inNavigationMapMode != v7)
  {
    self->_inNavigationMapMode = v7;
    [(UserLocationView *)self _updateNavPuckAnimated:1];
  }
}

- (void)locationManagerFailedToUpdateLocation
{
  v4.receiver = self;
  v4.super_class = (Class)UserLocationView;
  [(UserLocationView *)&v4 locationManagerFailedToUpdateLocation];
  BOOL v3 = [(UserLocationView *)self _vkNavigationPuckMarker];
  [v3 setStale:[self isStale]];
}

- (BOOL)isPersistent
{
  return (unint64_t)(self->_mode - 1) < 2;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
}

@end