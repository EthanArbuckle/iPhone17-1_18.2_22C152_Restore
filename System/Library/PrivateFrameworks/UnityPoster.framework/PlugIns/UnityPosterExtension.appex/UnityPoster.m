@interface UnityPoster
- (BOOL)editor:(id)a3 shouldAllowUserToSelectTimeFontConfiguration:(id)a4;
- (BOOL)editorShouldAllowUserToAdjustTimeColor:(id)a3;
- (BOOL)wantsLowBrightness:(id)a3;
- (CGRect)_timeLayoutRect;
- (id)_alternateGreenColor;
- (id)_alternateRedColor;
- (id)_alternateYellowColor;
- (id)_greenColor;
- (id)_redColor;
- (id)_yellowColor;
- (id)currentLowerQuiltViewForLookIdentifier:(id)a3;
- (id)currentUpperQuiltViewForLookIdentifier:(id)a3;
- (id)initialLookIdentifierForEditor:(id)a3;
- (id)interpolatedColorForIdentifier:(id)a3 progress:(double)a4;
- (id)looksForEditor:(id)a3;
- (int64_t)deviceOrientationFromEnvironment:(id)a3;
- (void)_setupConfigurationWithBounds:(CGRect)a3 upperQuiltView:(id)a4 lowerQuiltView:(id)a5;
- (void)_setupLowerQuiltViewsIfNecessaryInParentView:(id)a3 lookIdentifier:(id)a4;
- (void)_setupQuiltViewIfNecessaryInParentView:(id)a3 lookIdentifier:(id)a4;
- (void)_setupUpperQuiltViewsIfNecessaryInParentView:(id)a3 lookIdentifier:(id)a4;
- (void)_setupViewsInBackgroundView:(id)a3 foregroundView:(id)a4 lookIdentifier:(id)a5;
- (void)_updateColorsForIdentifier:(id)a3 upperQuiltView:(id)a4 lowerQuiltView:(id)a5 progress:(double)a6;
- (void)cleanupQuiltViews;
- (void)editor:(id)a3 didFinishTransitionToLook:(id)a4;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 didTransitionToLook:(id)a4 progress:(double)a5;
- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)editor:(id)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidInvalidate:(id)a3;
- (void)regenerateConfiguration;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)rendererDidInvalidate:(id)a3;
- (void)setupFullscreenConstraintsForView:(id)a3 container:(id)a4;
- (void)updateConfiguration:(id)a3 completion:(id)a4;
- (void)updateCurrentLowerQuiltView:(id)a3 lookIdentifier:(id)a4;
- (void)updateCurrentQuiltView:(id)a3 forLookIdentifier:(id)a4;
- (void)updateCurrentQuiltViewsForLookIdentifier:(id)a3 interfaceOrientation:(int64_t)a4 unlockProgress:(double)a5;
- (void)updateCurrentUpperQuiltView:(id)a3 lookIdentifier:(id)a4;
- (void)updateDescriptors:(id)a3 completion:(id)a4;
@end

@implementation UnityPoster

- (void)setupFullscreenConstraintsForView:(id)a3 container:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = [v5 leadingAnchor];
  v18 = [v6 leadingAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v20[0] = v17;
  v7 = [v5 trailingAnchor];
  v8 = [v6 trailingAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v20[1] = v9;
  v10 = [v5 topAnchor];
  v11 = [v6 topAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v20[2] = v12;
  v13 = [v5 bottomAnchor];

  v14 = [v6 bottomAnchor];

  v15 = [v13 constraintEqualToAnchor:v14];
  v20[3] = v15;
  v16 = +[NSArray arrayWithObjects:v20 count:4];
  +[NSLayoutConstraint activateConstraints:v16];
}

- (id)_redColor
{
  if (qword_10000D348 != -1) {
    dispatch_once(&qword_10000D348, &stru_100008348);
  }
  v2 = (void *)qword_10000D340;
  return v2;
}

- (id)_greenColor
{
  if (qword_10000D358 != -1) {
    dispatch_once(&qword_10000D358, &stru_100008368);
  }
  v2 = (void *)qword_10000D350;
  return v2;
}

- (id)_yellowColor
{
  if (qword_10000D368 != -1) {
    dispatch_once(&qword_10000D368, &stru_100008388);
  }
  v2 = (void *)qword_10000D360;
  return v2;
}

- (id)_alternateRedColor
{
  if (qword_10000D378 != -1) {
    dispatch_once(&qword_10000D378, &stru_1000083A8);
  }
  v2 = (void *)qword_10000D370;
  return v2;
}

- (id)_alternateGreenColor
{
  if (qword_10000D388 != -1) {
    dispatch_once(&qword_10000D388, &stru_1000083C8);
  }
  v2 = (void *)qword_10000D380;
  return v2;
}

- (id)_alternateYellowColor
{
  if (qword_10000D398[0] != -1) {
    dispatch_once(qword_10000D398, &stru_1000083E8);
  }
  v2 = (void *)qword_10000D390;
  return v2;
}

- (id)interpolatedColorForIdentifier:(id)a3 progress:(double)a4
{
  id v6 = a3;
  v7 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  *(float *)&double v8 = a4;
  [v7 _solveForInput:v8];
  float v10 = v9;
  if ([v6 isEqualToString:@"4color"])
  {
    v11 = +[UIColor blackColor];
    uint64_t v12 = [(UnityPoster *)self _yellowColor];
LABEL_5:
    v13 = (void *)v12;
    goto LABEL_7;
  }
  if ([v6 isEqualToString:@"3color"])
  {
    v11 = [(UnityPoster *)self _yellowColor];
    uint64_t v12 = +[UIColor blackColor];
    goto LABEL_5;
  }
  v13 = 0;
  v11 = 0;
LABEL_7:
  double v22 = 0.0;
  double v23 = 0.0;
  uint64_t v20 = 0;
  double v21 = 0.0;
  [v11 getRed:&v23 green:&v22 blue:&v21 alpha:&v20];
  double v18 = 0.0;
  double v19 = 0.0;
  uint64_t v16 = 0;
  double v17 = 0.0;
  [v13 getRed:&v19 green:&v18 blue:&v17 alpha:&v16];
  v14 = +[UIColor colorWithRed:(1.0 - v10) * v23 + v10 * v19 green:(1.0 - v10) * v22 + v10 * v18 blue:(1.0 - v10) * v21 + v10 * v17 alpha:1.0];

  return v14;
}

- (void)_updateColorsForIdentifier:(id)a3 upperQuiltView:(id)a4 lowerQuiltView:(id)a5 progress:(double)a6
{
  id v18 = a3;
  id v10 = a4;
  unityOptions = self->_unityOptions;
  id v12 = a5;
  if ([(UnityOptions *)unityOptions lowBrightness]) {
    [(UnityPoster *)self _alternateRedColor];
  }
  else {
  v13 = [(UnityPoster *)self _redColor];
  }
  if ([(UnityOptions *)self->_unityOptions lowBrightness]) {
    [(UnityPoster *)self _alternateGreenColor];
  }
  else {
  v14 = [(UnityPoster *)self _greenColor];
  }
  if ([(UnityOptions *)self->_unityOptions lowBrightness]) {
    [(UnityPoster *)self _alternateYellowColor];
  }
  else {
  v15 = [(UnityPoster *)self _yellowColor];
  }
  [v10 setTopQuiltColor:v14];
  [v10 setBottomLeftQuiltColor:0];
  [v10 setBottomRightQuiltColor:v14];
  if (fabs(a6) <= 0.000001)
  {
    if ([v18 isEqualToString:@"4color"])
    {
      [v10 setIntersectionPieceColor:v15];
      goto LABEL_16;
    }
    uint64_t v16 = +[UIColor blackColor];
  }
  else
  {
    uint64_t v16 = [(UnityPoster *)self interpolatedColorForIdentifier:v18 progress:a6];
  }
  double v17 = (void *)v16;
  [v10 setIntersectionPieceColor:v16];

LABEL_16:
  [v12 setTopQuiltColor:0];
  [v12 setBottomLeftQuiltColor:v13];
  [v12 setIntersectionPieceColor:0];
  [v12 setBottomRightQuiltColor:0];
}

- (void)_setupQuiltViewIfNecessaryInParentView:(id)a3 lookIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (!self->_quiltViews)
  {
    v7 = +[NSMutableDictionary dictionary];
    quiltViews = self->_quiltViews;
    self->_quiltViews = v7;
  }
  if (v6)
  {
    id v9 = [(NSMutableDictionary *)self->_quiltViews objectForKey:v6];
    if (v9)
    {
LABEL_5:

      goto LABEL_7;
    }
    if (!self->_sharedQuiltView)
    {
      id v10 = objc_alloc((Class)UPQuiltViewPad);
      [v11 bounds];
      id v9 = objc_msgSend(v10, "initWithFrame:identifier:", v6);
      [(UnityPoster *)self _timeLayoutRect];
      objc_msgSend(v9, "setTimeRect:");
      +[CSProminentLayoutController frameForElements:16 variant:1];
      objc_msgSend(v9, "setLandscapeWidgetRect:");
      [v9 updateQuiltsWithIdentifier:v6 deviceInterfaceOrientation:self->_currentDeviceInterfaceOrientation unlockProgress:0.0];
      [v11 addSubview:v9];
      [(UnityPoster *)self setupFullscreenConstraintsForView:v9 container:v11];
      [(UnityPoster *)self updateCurrentQuiltView:v9 forLookIdentifier:v6];
      goto LABEL_5;
    }
  }
LABEL_7:
}

- (void)_setupUpperQuiltViewsIfNecessaryInParentView:(id)a3 lookIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (!self->_upperQuiltViews)
  {
    v7 = +[NSMutableDictionary dictionary];
    upperQuiltViews = self->_upperQuiltViews;
    self->_upperQuiltViews = v7;
  }
  if (v6)
  {
    id v9 = [(NSMutableDictionary *)self->_upperQuiltViews objectForKey:v6];
    if (v9)
    {
LABEL_5:

      goto LABEL_7;
    }
    if (!self->_sharedUpperQuiltView)
    {
      id v9 = [(UnityPoster *)self currentUpperQuiltViewForLookIdentifier:v6];
      if (!v9)
      {
        id v10 = objc_alloc((Class)UPQuiltViewPhone);
        [v11 bounds];
        id v9 = objc_msgSend(v10, "initWithFrame:");
        [(UnityPoster *)self _timeLayoutRect];
        objc_msgSend(v9, "setTimeRect:");
        +[CSProminentLayoutController frameForElements:16 variant:1];
        objc_msgSend(v9, "setLandscapeWidgetRect:");
        [v11 addSubview:v9];
        [(UnityPoster *)self updateCurrentUpperQuiltView:v9 lookIdentifier:v6];
        [(UnityPoster *)self setupFullscreenConstraintsForView:v9 container:v11];
      }
      goto LABEL_5;
    }
  }
LABEL_7:
}

- (void)_setupLowerQuiltViewsIfNecessaryInParentView:(id)a3 lookIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (!self->_lowerQuiltViews)
  {
    v7 = +[NSMutableDictionary dictionary];
    lowerQuiltViews = self->_lowerQuiltViews;
    self->_lowerQuiltViews = v7;
  }
  if (v6)
  {
    id v9 = [(NSMutableDictionary *)self->_lowerQuiltViews objectForKey:v6];
    if (v9)
    {
LABEL_5:

      goto LABEL_7;
    }
    if (!self->_sharedLowerQuiltView)
    {
      id v9 = [(UnityPoster *)self currentLowerQuiltViewForLookIdentifier:v6];
      if (!v9)
      {
        id v10 = objc_alloc((Class)UPQuiltViewPhone);
        [v11 bounds];
        id v9 = objc_msgSend(v10, "initWithFrame:");
        [(UnityPoster *)self _timeLayoutRect];
        objc_msgSend(v9, "setTimeRect:");
        [v9 setQuiltViewDelegate:self];
        [v11 addSubview:v9];
        [(UnityPoster *)self updateCurrentLowerQuiltView:v9 lookIdentifier:v6];
        [(UnityPoster *)self setupFullscreenConstraintsForView:v9 container:v11];
      }
      goto LABEL_5;
    }
  }
LABEL_7:
}

- (void)_setupViewsInBackgroundView:(id)a3 foregroundView:(id)a4 lookIdentifier:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  [v25 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  id v18 = +[UIDevice currentDevice];
  id v19 = [v18 userInterfaceIdiom];

  if (v19 == (id)1)
  {
    [(UnityPoster *)self _setupQuiltViewIfNecessaryInParentView:v8 lookIdentifier:self->_currentLookIdentifier];
  }
  else
  {
    uint64_t v20 = +[UIDevice currentDevice];
    id v21 = [v20 userInterfaceIdiom];

    if (!v21)
    {
      [(UnityPoster *)self _setupUpperQuiltViewsIfNecessaryInParentView:v8 lookIdentifier:v9];
      [(UnityPoster *)self _setupLowerQuiltViewsIfNecessaryInParentView:v25 lookIdentifier:v9];
      double v22 = +[UIColor blackColor];
      [v25 setBackgroundColor:v22];

      double v23 = [(UnityPoster *)self currentUpperQuiltViewForLookIdentifier:v9];
      v24 = [(UnityPoster *)self currentLowerQuiltViewForLookIdentifier:v9];
      -[UnityPoster _setupConfigurationWithBounds:upperQuiltView:lowerQuiltView:](self, "_setupConfigurationWithBounds:upperQuiltView:lowerQuiltView:", v23, v24, v11, v13, v15, v17);
      [(UnityPoster *)self _updateColorsForIdentifier:v9 upperQuiltView:v23 lowerQuiltView:v24 progress:0.0];
      [(UnityPoster *)self updateCurrentUpperQuiltView:v23 lookIdentifier:v9];
      [(UnityPoster *)self updateCurrentLowerQuiltView:v24 lookIdentifier:v9];
    }
  }
}

- (void)_setupConfigurationWithBounds:(CGRect)a3 upperQuiltView:(id)a4 lowerQuiltView:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  id v12 = a4;
  +[CSProminentLayoutController frameForElements:1 variant:1];
  id v13 = objc_alloc((Class)UPQuiltConfigurationPhone);
  [(UnityPoster *)self _timeLayoutRect];
  id v18 = objc_msgSend(v13, "initWithRandomizationSeedValue:viewport:timeBounds:lineVariance:", 0, x, y, width, height, v14, v15, v16, v17, 0x3FC999999999999ALL);
  [v12 setConfiguration:v18];

  [v11 setConfiguration:v18];
}

- (CGRect)_timeLayoutRect
{
  +[CSProminentLayoutController frameForElements:1 variant:1 forcePortraitBounds:1];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)cleanupQuiltViews
{
  double v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    p_quiltViews = &self->_quiltViews;
    id v6 = [(NSMutableDictionary *)self->_quiltViews allValues];
    id v7 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v34;
      uint64_t v10 = 96;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * i) removeFromSuperview];
        }
        id v8 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v10 = 96;
    }
  }
  else
  {
    id v12 = +[UIDevice currentDevice];
    id v13 = [v12 userInterfaceIdiom];

    if (v13) {
      return;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    double v14 = [(NSMutableDictionary *)self->_lowerQuiltViews allValues];
    id v15 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * (void)j) removeFromSuperview];
        }
        id v16 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v16);
    }

    [(NSMutableDictionary *)self->_lowerQuiltViews removeAllObjects];
    [(UPQuiltViewPhone *)self->_sharedLowerQuiltView removeFromSuperview];
    sharedLowerQuiltView = self->_sharedLowerQuiltView;
    self->_sharedLowerQuiltView = 0;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    p_quiltViews = &self->_upperQuiltViews;
    id v6 = [(NSMutableDictionary *)self->_upperQuiltViews allValues];
    id v20 = [v6 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v26;
      uint64_t v10 = 64;
      do
      {
        for (k = 0; k != v21; k = (char *)k + 1)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * (void)k) removeFromSuperview];
        }
        id v21 = [v6 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v21);
    }
    else
    {
      uint64_t v10 = 64;
    }
  }

  [(NSMutableDictionary *)*p_quiltViews removeAllObjects];
  [*(id *)((char *)&self->super.isa + v10) removeFromSuperview];
  v24 = *(Class *)((char *)&self->super.isa + v10);
  *(Class *)((char *)&self->super.isa + v10) = 0;
}

- (BOOL)wantsLowBrightness:(id)a3
{
  id v3 = a3;
  if ([v3 isLowLuminance])
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [v3 traitCollection];
    if ([v5 _backlightLuminance] == (id)1)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [v3 traitCollection];
      BOOL v4 = [v6 _backlightLuminance] == 0;
    }
  }

  return v4;
}

- (int64_t)deviceOrientationFromEnvironment:(id)a3
{
  int64_t result = (int64_t)[a3 deviceOrientation];
  if ((unint64_t)result <= 1) {
    return 1;
  }
  return result;
}

- (void)updateCurrentQuiltViewsForLookIdentifier:(id)a3 interfaceOrientation:(int64_t)a4 unlockProgress:(double)a5
{
  sharedQuiltView = self->_sharedQuiltView;
  if (sharedQuiltView)
  {
    [(UPQuiltViewPad *)sharedQuiltView updateQuiltsWithIdentifier:a3 deviceInterfaceOrientation:a4 unlockProgress:a5];
  }
  else
  {
    quiltViews = self->_quiltViews;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100003010;
    v8[3] = &unk_100008408;
    v8[4] = a4;
    *(double *)&v8[5] = a5;
    [(NSMutableDictionary *)quiltViews enumerateKeysAndObjectsUsingBlock:v8];
  }
}

- (void)updateCurrentQuiltView:(id)a3 forLookIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = v7;
  if (self->_renderer) {
    objc_storeStrong((id *)&self->_sharedQuiltView, a3);
  }
  else {
    [(NSMutableDictionary *)self->_quiltViews setObject:v7 forKey:a4];
  }
}

- (void)updateCurrentUpperQuiltView:(id)a3 lookIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = v7;
  if (self->_renderer) {
    objc_storeStrong((id *)&self->_sharedUpperQuiltView, a3);
  }
  else {
    [(NSMutableDictionary *)self->_upperQuiltViews setObject:v7 forKey:a4];
  }
}

- (void)updateCurrentLowerQuiltView:(id)a3 lookIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = v7;
  if (self->_renderer) {
    objc_storeStrong((id *)&self->_sharedLowerQuiltView, a3);
  }
  else {
    [(NSMutableDictionary *)self->_lowerQuiltViews setObject:v7 forKey:a4];
  }
}

- (id)currentUpperQuiltViewForLookIdentifier:(id)a3
{
  if (self->_renderer)
  {
    id v3 = self->_sharedUpperQuiltView;
  }
  else
  {
    id v3 = [(NSMutableDictionary *)self->_upperQuiltViews objectForKey:a3];
  }
  return v3;
}

- (id)currentLowerQuiltViewForLookIdentifier:(id)a3
{
  if (self->_renderer)
  {
    id v3 = self->_sharedLowerQuiltView;
  }
  else
  {
    id v3 = [(NSMutableDictionary *)self->_lowerQuiltViews objectForKey:a3];
  }
  return v3;
}

- (void)regenerateConfiguration
{
  id v4 = [(UnityPoster *)self currentUpperQuiltViewForLookIdentifier:self->_currentLookIdentifier];
  id v3 = [(UnityPoster *)self currentLowerQuiltViewForLookIdentifier:self->_currentLookIdentifier];
  [v3 bounds];
  -[UnityPoster _setupConfigurationWithBounds:upperQuiltView:lowerQuiltView:](self, "_setupConfigurationWithBounds:upperQuiltView:lowerQuiltView:", v4, v3);
}

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_renderer, a3);
  if (!self->_unityOptions)
  {
    uint64_t v9 = (UnityOptions *)objc_alloc_init((Class)UnityOptions);
    unityOptions = self->_unityOptions;
    self->_unityOptions = v9;
  }
  [(UnityOptions *)self->_unityOptions setLowBrightness:[(UnityPoster *)self wantsLowBrightness:v8]];
  self->_isPreview = [v8 isPreview];
  *(_OWORD *)&self->_double unlockProgress = xmmword_100005F40;
  id v11 = [v8 contents];
  id v12 = [v11 loadUserInfoWithError:0];

  currentLookIdentifier = [v12 objectForKey:@"lookIdentifier"];
  if (currentLookIdentifier && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (currentLookIdentifier == self->_currentLookIdentifier) {
      goto LABEL_9;
    }
    double v14 = currentLookIdentifier;
    currentLookIdentifier = self->_currentLookIdentifier;
    self->_currentLookIdentifier = &v14->isa;
  }
  else
  {
    double v14 = @"3color";
  }

  currentLookIdentifier = &v14->isa;
LABEL_9:
  id v15 = [v7 backgroundView];
  id v16 = [v7 foregroundView];
  [(UnityPoster *)self _setupViewsInBackgroundView:v15 foregroundView:v16 lookIdentifier:self->_currentLookIdentifier];

  [(UnityPoster *)self _greenColor];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000356C;
  v29[3] = &unk_100008430;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v30 = v17;
  [v7 updatePreferences:v29];
  double wakeProgress = self->_wakeProgress;
  [v8 backlightProgress];
  if (wakeProgress != v19)
  {
    [v8 backlightProgress];
    self->_double wakeProgress = v20;
  }
  double v21 = 0.0;
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    double unlockProgress = self->_unlockProgress;
    [v8 unlockProgress];
    if (unlockProgress == v23) {
      goto LABEL_15;
    }
    [v8 unlockProgress];
    double v21 = v24;
  }
  self->_double unlockProgress = v21;
LABEL_15:
  self->_currentDeviceInterfaceOrientation = [(UnityPoster *)self deviceOrientationFromEnvironment:v8];
  long long v25 = +[UIDevice currentDevice];
  id v26 = [v25 userInterfaceIdiom];

  if (!v26)
  {
    long long v27 = [(UnityPoster *)self currentUpperQuiltViewForLookIdentifier:self->_currentLookIdentifier];
    long long v28 = [(UnityPoster *)self currentLowerQuiltViewForLookIdentifier:self->_currentLookIdentifier];
    [v27 updateQuiltsWithUnlockProgress:self->_unlockProgress wakeProgress:self->_wakeProgress];
    [v28 updateQuiltsWithUnlockProgress:self->_unlockProgress wakeProgress:self->_wakeProgress];
  }
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v29 = a4;
  self->_isPreview = [v29 isPreview];
  double wakeProgress = self->_wakeProgress;
  [v29 backlightProgress];
  if (wakeProgress != v7)
  {
    [v29 backlightProgress];
    self->_double wakeProgress = v8;
  }
  BOOL v9 = [(UnityPoster *)self wantsLowBrightness:v29];
  if (v9 != [(UnityOptions *)self->_unityOptions lowBrightness]) {
    [(UnityOptions *)self->_unityOptions setLowBrightness:v9];
  }
  uint64_t v10 = [v29 contents];
  id v11 = [v10 loadUserInfoWithError:0];

  id v12 = [v11 objectForKey:@"lookIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = +[UIDevice currentDevice];
    id v14 = [v13 userInterfaceIdiom];

    if (!v14)
    {
      id v15 = [(UnityPoster *)self currentUpperQuiltViewForLookIdentifier:self->_currentLookIdentifier];
      id v16 = [(UnityPoster *)self currentLowerQuiltViewForLookIdentifier:self->_currentLookIdentifier];
      [(UnityPoster *)self _updateColorsForIdentifier:v12 upperQuiltView:v15 lowerQuiltView:v16 progress:0.0];
    }
  }
  double v17 = 0.0;
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    double unlockProgress = self->_unlockProgress;
    [v29 unlockProgress];
    if (unlockProgress == v19) {
      goto LABEL_12;
    }
    [v29 unlockProgress];
    double v17 = v20;
  }
  self->_double unlockProgress = v17;
LABEL_12:
  double v21 = +[UIDevice currentDevice];
  id v22 = [v21 userInterfaceIdiom];

  if (v22 == (id)1)
  {
    int64_t v23 = [(UnityPoster *)self deviceOrientationFromEnvironment:v29];
    int64_t currentDeviceInterfaceOrientation = v23;
    if (v23 != self->_currentDeviceInterfaceOrientation)
    {
      self->_int64_t currentDeviceInterfaceOrientation = v23;
      -[UnityPoster updateCurrentQuiltViewsForLookIdentifier:interfaceOrientation:unlockProgress:](self, "updateCurrentQuiltViewsForLookIdentifier:interfaceOrientation:unlockProgress:", v12, 0.0);
      int64_t currentDeviceInterfaceOrientation = self->_currentDeviceInterfaceOrientation;
    }
    [(UnityPoster *)self updateCurrentQuiltViewsForLookIdentifier:v12 interfaceOrientation:currentDeviceInterfaceOrientation unlockProgress:self->_unlockProgress];
  }
  long long v25 = +[UIDevice currentDevice];
  id v26 = [v25 userInterfaceIdiom];

  if (!v26)
  {
    long long v27 = [(UnityPoster *)self currentUpperQuiltViewForLookIdentifier:self->_currentLookIdentifier];
    long long v28 = [(UnityPoster *)self currentLowerQuiltViewForLookIdentifier:self->_currentLookIdentifier];
    [v27 updateQuiltsWithUnlockProgress:self->_unlockProgress wakeProgress:self->_wakeProgress];
    [v28 updateQuiltsWithUnlockProgress:self->_unlockProgress wakeProgress:self->_wakeProgress];
  }
}

- (void)rendererDidInvalidate:(id)a3
{
  [(UnityPoster *)self cleanupQuiltViews];
  renderer = self->_renderer;
  self->_renderer = 0;
}

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_editor, a3);
  id v7 = a4;
  int64_t v8 = [(UnityPoster *)self deviceOrientationFromEnvironment:v7];

  int64_t currentDeviceInterfaceOrientation = self->_currentDeviceInterfaceOrientation;
  if (!currentDeviceInterfaceOrientation || v8 != currentDeviceInterfaceOrientation)
  {
    self->_int64_t currentDeviceInterfaceOrientation = v8;
    [(UnityPoster *)self updateCurrentQuiltViewsForLookIdentifier:self->_currentLookIdentifier interfaceOrientation:v8 unlockProgress:0.0];
  }
}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  int64_t v6 = [(UnityPoster *)self deviceOrientationFromEnvironment:a4];
  if (v6 != self->_currentDeviceInterfaceOrientation)
  {
    self->_int64_t currentDeviceInterfaceOrientation = v6;
    currentLookIdentifier = self->_currentLookIdentifier;
    [(UnityPoster *)self updateCurrentQuiltViewsForLookIdentifier:currentLookIdentifier interfaceOrientation:v6 unlockProgress:0.0];
  }
}

- (id)looksForEditor:(id)a3
{
  id v3 = objc_alloc((Class)PRTimeFontConfiguration);
  id v4 = [v3 initWithTimeFontIdentifier:PRTimeFontIdentifierPrivateSystemSoftHeavy];
  id v5 = objc_alloc((Class)PRMutableEditingLook);
  int64_t v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"THREE_COLOR_LABEL" value:&stru_1000085D0 table:@"Localizable"];
  id v8 = [objc_alloc((Class)PRPosterColor) initWithLUTIdentifier:@"green_lut3"];
  id v9 = [v5 initWithIdentifier:@"3color" displayName:v7 initialTimeFontConfiguration:v4 initialTitleColor:v8];

  id v10 = objc_alloc((Class)PRMutableEditingLook);
  id v11 = +[NSBundle mainBundle];
  id v12 = [v11 localizedStringForKey:@"FOUR_COLOR_LABEL" value:&stru_1000085D0 table:@"Localizable"];
  id v13 = [objc_alloc((Class)PRPosterColor) initWithLUTIdentifier:@"green_lut4"];
  id v14 = [v10 initWithIdentifier:@"4color" displayName:v12 initialTimeFontConfiguration:v4 initialTitleColor:v13];

  v17[0] = v9;
  v17[1] = v14;
  id v15 = +[NSArray arrayWithObjects:v17 count:2];

  return v15;
}

- (id)initialLookIdentifierForEditor:(id)a3
{
  id v3 = [a3 environment];
  id v4 = [v3 sourceContents];
  id v5 = [v4 loadUserInfoWithError:0];

  int64_t v6 = [v5 objectForKey:@"lookIdentifier"];
  id v7 = v6;
  if (!v6) {
    int64_t v6 = @"3color";
  }
  id v8 = v6;

  return v8;
}

- (BOOL)editor:(id)a3 shouldAllowUserToSelectTimeFontConfiguration:(id)a4
{
  return 0;
}

- (BOOL)editorShouldAllowUserToAdjustTimeColor:(id)a3
{
  return 0;
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v22 = a4;
  id v7 = a5;
  id v8 = +[UIDevice currentDevice];
  id v9 = [v8 userInterfaceIdiom];

  if (v9 == (id)1)
  {
    id v10 = [v7 identifier];

    if (v10)
    {
      id v11 = [v7 identifier];
      currentLookIdentifier = self->_currentLookIdentifier;
      self->_currentLookIdentifier = v11;
    }
    id v13 = [v22 foregroundView];
    [(UnityPoster *)self _setupQuiltViewIfNecessaryInParentView:v13 lookIdentifier:self->_currentLookIdentifier];

    id v14 = [(NSMutableDictionary *)self->_quiltViews objectForKey:self->_currentLookIdentifier];
    [v14 updateQuiltsWithIdentifier:self->_currentLookIdentifier deviceInterfaceOrientation:self->_currentDeviceInterfaceOrientation unlockProgress:0.0];
  }
  else
  {
    id v15 = +[UIDevice currentDevice];
    id v16 = [v15 userInterfaceIdiom];

    if (v16) {
      goto LABEL_10;
    }
    double v17 = [v7 identifier];

    if (v17)
    {
      id v18 = [v7 identifier];
      double v19 = self->_currentLookIdentifier;
      self->_currentLookIdentifier = v18;
    }
    id v14 = [v22 backgroundView];
    double v20 = [v22 foregroundView];
    double v21 = [v7 identifier];
    [(UnityPoster *)self _setupViewsInBackgroundView:v14 foregroundView:v20 lookIdentifier:v21];
  }
LABEL_10:
}

- (void)editor:(id)a3 didTransitionToLook:(id)a4 progress:(double)a5
{
  id v17 = a4;
  id v8 = [a3 currentLook];
  unityOptions = self->_unityOptions;
  if (!unityOptions)
  {
    id v10 = (UnityOptions *)objc_alloc_init((Class)UnityOptions);
    id v11 = self->_unityOptions;
    self->_unityOptions = v10;

    unityOptions = self->_unityOptions;
  }
  [(UnityOptions *)unityOptions setLowBrightness:0];
  id v12 = +[UIDevice currentDevice];
  id v13 = [v12 userInterfaceIdiom];

  if (!v13)
  {
    id v14 = [(UnityPoster *)self currentUpperQuiltViewForLookIdentifier:self->_currentLookIdentifier];
    id v15 = [(UnityPoster *)self currentLowerQuiltViewForLookIdentifier:self->_currentLookIdentifier];
    id v16 = [v17 identifier];
    [(UnityPoster *)self _updateColorsForIdentifier:v16 upperQuiltView:v14 lowerQuiltView:v15 progress:a5];
  }
}

- (void)editor:(id)a3 didFinishTransitionToLook:(id)a4
{
  id v10 = a4;
  id v5 = +[UIDevice currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)1)
  {
    id v7 = [v10 identifier];

    if (v7)
    {
      id v8 = [v10 identifier];
      currentLookIdentifier = self->_currentLookIdentifier;
      self->_currentLookIdentifier = v8;
    }
    [(UnityPoster *)self updateCurrentQuiltViewsForLookIdentifier:self->_currentLookIdentifier interfaceOrientation:self->_currentDeviceInterfaceOrientation unlockProgress:self->_unlockProgress];
  }
}

- (void)editor:(id)a3 finalizeWithCompletion:(id)a4
{
  id v21 = a3;
  id v5 = (void (**)(void))a4;
  id v6 = [v21 environment];
  id v7 = [v6 sourceContents];
  id v8 = [v7 descriptorIdentifier];

  id v9 = [v21 environment];
  id v10 = [v9 sourceContents];
  id v11 = [v10 loadUserInfoWithError:0];

  id v12 = [v11 mutableCopy];
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = +[NSMutableDictionary dictionary];
  }
  id v15 = v14;

  if (v8) {
    CFStringRef v16 = v8;
  }
  else {
    CFStringRef v16 = @"<unknown>";
  }
  [v15 setObject:v16 forKey:@"descriptor"];
  id v17 = [v21 currentLook];
  id v18 = [v17 identifier];
  [v15 setObject:v18 forKey:@"lookIdentifier"];

  double v19 = [v21 environment];
  double v20 = [v19 targetConfiguration];
  [v20 storeUserInfo:v15 error:0];

  v5[2](v5);
}

- (void)editorDidInvalidate:(id)a3
{
  editor = self->_editor;
  self->_editor = 0;

  [(UnityPoster *)self cleanupQuiltViews];
}

- (void)updateDescriptors:(id)a3 completion:(id)a4
{
  id v30 = a3;
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    id v26 = v5;
    id v29 = +[NSMutableArray arrayWithCapacity:3];
    v38[0] = @"3color";
    v38[1] = @"4color";
    v39[0] = @"green_lut3";
    v39[1] = @"green_lut4";
    +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v28 = *(void *)v32;
      uint64_t v27 = PRTimeFontIdentifierPrivateSystemSoftHeavy;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v32 != v28) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          id v12 = [v30 objectForKeyedSubscript:v11];
          id v13 = v12;
          if (!v12
            || ([v12 preferredTitleColors],
                id v14 = objc_claimAutoreleasedReturnValue(),
                [v14 firstObject],
                id v15 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v16 = [v15 isLUTBackedColor],
                v15,
                v14,
                (v16 & 1) == 0))
          {
            id v17 = +[PRMutablePosterDescriptor mutableDescriptorWithIdentifier:v11];
            id v18 = objc_alloc((Class)PRPosterColor);
            double v19 = [v7 objectForKey:v11];
            id v20 = [v18 initWithLUTIdentifier:v19];
            id v36 = v20;
            id v21 = +[NSArray arrayWithObjects:&v36 count:1];
            [v17 setPreferredTitleColors:v21];

            id v22 = [objc_alloc((Class)PRTimeFontConfiguration) initWithTimeFontIdentifier:v27];
            id v35 = v22;
            int64_t v23 = +[NSArray arrayWithObjects:&v35 count:1];
            [v17 setPreferredTimeFontConfigurations:v23];

            double v24 = +[NSMutableDictionary dictionary];
            [v24 setObject:v11 forKey:@"lookIdentifier"];
            [v17 storeUserInfo:v24 error:0];
            id v25 = objc_alloc_init((Class)ATXPosterDescriptorGalleryOptions);
            [v25 setAllowsSystemSuggestedComplications:0];
            [v17 storeGalleryOptions:v25 error:0];

            id v13 = v17;
          }
          [v29 addObject:v13];
        }
        id v9 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v9);
    }

    id v6 = v26;
    (*((void (**)(id, void *, void))v26 + 2))(v26, v29, 0);
  }
}

- (void)updateConfiguration:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, id, void))a4 + 2))(a4, a3, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLookIdentifier, 0);
  objc_storeStrong((id *)&self->_quiltViews, 0);
  objc_storeStrong((id *)&self->_sharedQuiltView, 0);
  objc_storeStrong((id *)&self->_upperQuiltViews, 0);
  objc_storeStrong((id *)&self->_lowerQuiltViews, 0);
  objc_storeStrong((id *)&self->_sharedLowerQuiltView, 0);
  objc_storeStrong((id *)&self->_sharedUpperQuiltView, 0);
  objc_storeStrong((id *)&self->_unityOptions, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

@end