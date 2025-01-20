@interface CRLiOSVisualEffectHelper
+ (CRLiOSVisualEffectHelper)sharedHelper;
+ (id)blurEffectProvidedByHierarchyOfView:(id)a3;
- (BOOL)p_needsTraitVariantsForColorPreset:(int64_t)a3;
- (CATransform3D)p_touchDownTransformForView:(SEL)a3;
- (CGAffineTransform)p_touchDownAffineTransformForView:(SEL)a3;
- (CGSize)p_imageSizeForRadius:(double)a3 corners:(int64_t)a4 capInsets:(UIEdgeInsets *)a5;
- (CRLiOSVisualEffectHelper)init;
- (NSMapTable)controlsToMonitorForAnimations;
- (double)p_lastTouchEventTimestampForView:(id)a3;
- (double)p_touchUpSpringSettlingTime;
- (id)applicationKeyColorDarkenedIfNecessary;
- (id)colorForPreset:(int64_t)a3;
- (id)p_activeTouchDownAnimatorForView:(id)a3;
- (id)p_activeTouchUpAnimatorForView:(id)a3;
- (id)p_applicationKeyColor;
- (id)p_makeTouchDownAnimatorForViews:(id)a3;
- (id)p_makeTouchUpAnimatorForViews:(id)a3;
- (id)p_scrimOwnerForView:(id)a3;
- (id)p_touchDownTimingParameters;
- (id)p_touchUpTimingParameters;
- (id)resizableCornerImageWithRadius:(double)a3 corners:(int64_t)a4 colorPreset:(int64_t)a5;
- (id)resizableCornerImageWithRadius:(double)a3 corners:(int64_t)a4 colorPreset:(int64_t)a5 forTraitCollection:(id)a6;
- (int64_t)backdropCornersForIndex:(unint64_t)a3 ofCount:(unint64_t)a4 axis:(int64_t)a5;
- (unint64_t)p_layerCornerMaskForCorners:(int64_t)a3;
- (void)applyTouchDownAnimationToViews:(id)a3;
- (void)applyTouchUpAnimationToViews:(id)a3;
- (void)configureBackdropLayer:(id)a3 radius:(double)a4 corners:(int64_t)a5 color:(id)a6;
- (void)configureBackdropLayer:(id)a3 radius:(double)a4 corners:(int64_t)a5 color:(id)a6 forTraitCollection:(id)a7;
- (void)configureBackdropLayer:(id)a3 radius:(double)a4 corners:(int64_t)a5 colorPreset:(int64_t)a6;
- (void)configureBackdropLayer:(id)a3 radius:(double)a4 corners:(int64_t)a5 colorPreset:(int64_t)a6 forTraitCollection:(id)a7;
- (void)p_applyDragEnterEffectToScrimLayersInViews:(id)a3;
- (void)p_applyDragExitEffectToScrimLayersInViews:(id)a3;
- (void)p_controlDragEnter:(id)a3 event:(id)a4;
- (void)p_controlDragExit:(id)a3 event:(id)a4;
- (void)p_controlTouchCancel:(id)a3 event:(id)a4;
- (void)p_controlTouchDown:(id)a3 event:(id)a4;
- (void)p_controlTouchUpInside:(id)a3 event:(id)a4;
- (void)p_setActiveTouchDownAnimator:(id)a3 forView:(id)a4;
- (void)p_setActiveTouchUpAnimator:(id)a3 forView:(id)a4;
- (void)p_setLastTouchEventTimestamp:(double)a3 forView:(id)a4;
- (void)setControlsToMonitorForAnimations:(id)a3;
- (void)startHandlingTouchUpDownAnimationsForControl:(id)a3 withViews:(id)a4;
- (void)stopHandlingTouchUpDownAnimationsForControl:(id)a3;
@end

@implementation CRLiOSVisualEffectHelper

+ (id)blurEffectProvidedByHierarchyOfView:(id)a3
{
  id v3 = a3;
  v10 = v3;
  v11 = 0;
  if (v3)
  {
    v12 = v3;
    do
    {
      uint64_t v13 = sub_100246AC8(v12, 1, v4, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLiOSVisualEffectProviding);

      v11 = (void *)v13;
      if (!v13)
      {
        v14 = [v12 nextResponder];
        v11 = sub_100246AC8(v14, 1, v15, v16, v17, v18, v19, v20, (uint64_t)&OBJC_PROTOCOL___CRLiOSVisualEffectProviding);
        if (!v11)
        {
          uint64_t v21 = objc_opt_class();
          v22 = sub_1002469D0(v21, v14);
          v23 = [v22 presentationController];
          v11 = sub_100246AC8(v23, 1, v24, v25, v26, v27, v28, v29, (uint64_t)&OBJC_PROTOCOL___CRLiOSVisualEffectProviding);
        }
      }
      v30 = [v11 blurEffect];
      v31 = [v12 superview];

      if (v30) {
        break;
      }
      v12 = v31;
    }
    while (v31);
  }
  else
  {
    v31 = 0;
    v30 = 0;
  }
  id v32 = v30;

  return v32;
}

+ (CRLiOSVisualEffectHelper)sharedHelper
{
  if (qword_1016A9D00 != -1) {
    dispatch_once(&qword_1016A9D00, &stru_1014FC088);
  }
  v2 = (void *)qword_1016A9CF8;

  return (CRLiOSVisualEffectHelper *)v2;
}

- (CRLiOSVisualEffectHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSVisualEffectHelper;
  v2 = [(CRLiOSVisualEffectHelper *)&v6 init];
  if (v2)
  {
    id v3 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    controlsToMonitorForAnimations = v2->_controlsToMonitorForAnimations;
    v2->_controlsToMonitorForAnimations = v3;
  }
  return v2;
}

- (void)configureBackdropLayer:(id)a3 radius:(double)a4 corners:(int64_t)a5 colorPreset:(int64_t)a6
{
}

- (void)configureBackdropLayer:(id)a3 radius:(double)a4 corners:(int64_t)a5 colorPreset:(int64_t)a6 forTraitCollection:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  id v14 = [(CRLiOSVisualEffectHelper *)self colorForPreset:a6];
  [(CRLiOSVisualEffectHelper *)self configureBackdropLayer:v13 radius:a5 corners:v14 color:v12 forTraitCollection:a4];
}

- (void)configureBackdropLayer:(id)a3 radius:(double)a4 corners:(int64_t)a5 color:(id)a6
{
}

- (void)configureBackdropLayer:(id)a3 radius:(double)a4 corners:(int64_t)a5 color:(id)a6 forTraitCollection:(id)a7
{
  id v18 = a3;
  id v12 = a6;
  id v13 = a7;
  [v18 setCornerRadius:a4];
  [v18 setCornerCurve:kCACornerCurveContinuous];
  [v18 setMaskedCorners:[self p_layerCornerMaskForCorners:a5]];
  id v14 = v12;
  uint64_t v15 = v14;
  uint64_t v16 = v14;
  if (v13)
  {
    uint64_t v16 = [v14 resolvedColorWithTraitCollection:v13];
  }
  id v17 = v16;
  [v18 setBackgroundColor:[v17 CGColor]];
}

- (id)resizableCornerImageWithRadius:(double)a3 corners:(int64_t)a4 colorPreset:(int64_t)a5
{
  return [(CRLiOSVisualEffectHelper *)self resizableCornerImageWithRadius:a4 corners:a5 colorPreset:0 forTraitCollection:a3];
}

- (id)resizableCornerImageWithRadius:(double)a3 corners:(int64_t)a4 colorPreset:(int64_t)a5 forTraitCollection:(id)a6
{
  long long v10 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  long long v26 = *(_OWORD *)&UIEdgeInsetsZero.top;
  long long v27 = v10;
  id v11 = a6;
  [(CRLiOSVisualEffectHelper *)self p_imageSizeForRadius:a4 corners:&v26 capInsets:a3];
  double v13 = v12;
  double v15 = v14;
  id v16 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v12, v14];
  id v17 = objc_alloc_init((Class)CALayer);
  [v17 setFrame:0.0, 0.0, v13, v15];
  [(CRLiOSVisualEffectHelper *)self configureBackdropLayer:v17 radius:a4 corners:a5 colorPreset:v11 forTraitCollection:a3];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10046F05C;
  v24[3] = &unk_1014FC0B0;
  id v25 = v17;
  id v18 = v17;
  uint64_t v19 = [v16 imageWithActions:v24];
  uint64_t v20 = v19;
  if ((unint64_t)(a5 - 1) <= 1)
  {
    uint64_t v21 = [v19 imageWithRenderingMode:2];

    uint64_t v20 = (void *)v21;
  }
  v22 = [v20 resizableImageWithCapInsets:1 resizingMode:v26];

  return v22;
}

- (int64_t)backdropCornersForIndex:(unint64_t)a3 ofCount:(unint64_t)a4 axis:(int64_t)a5
{
  int v8 = sub_1003E86EC();
  int64_t v9 = 3;
  if (v8) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 3;
  }
  if (!v8) {
    int64_t v9 = 4;
  }
  if (a5 == 1) {
    int64_t v9 = 2;
  }
  if (a4 - 1 != a3) {
    int64_t v9 = 0;
  }
  if (a5 == 1) {
    uint64_t v10 = 1;
  }
  if (!a3) {
    int64_t v9 = v10;
  }
  if (a4 >= 2) {
    return v9;
  }
  else {
    return 5;
  }
}

- (id)colorForPreset:(int64_t)a3
{
  uint64_t v5 = +[UIColor clearColor];
  switch(a3)
  {
    case 1:
      uint64_t v6 = +[UIColor clearColor];
      goto LABEL_16;
    case 2:
      uint64_t v6 = +[UIColor blackColor];
      goto LABEL_16;
    case 3:
      uint64_t v6 = +[UIColor whiteColor];
      goto LABEL_16;
    case 4:
      uint64_t v6 = +[UIColor colorWithRed:0.97 green:0.97 blue:0.99 alpha:1.0];
      goto LABEL_16;
    case 5:
      double v7 = 0.04;
      goto LABEL_9;
    case 6:
      double v7 = 0.06;
      goto LABEL_9;
    case 7:
      double v7 = 0.15;
LABEL_9:
      double v8 = 0.0;
      goto LABEL_15;
    case 8:
      double v8 = 0.0;
      double v7 = 0.5;
      goto LABEL_15;
    case 9:
      double v7 = 0.05;
      goto LABEL_13;
    case 10:
      double v7 = 0.2;
LABEL_13:
      double v8 = 1.0;
      goto LABEL_15;
    case 11:
      double v8 = 1.0;
      double v7 = 0.25;
LABEL_15:
      uint64_t v6 = +[UIColor colorWithWhite:v8 alpha:v7];
      goto LABEL_16;
    case 12:
      uint64_t v6 = [(CRLiOSVisualEffectHelper *)self applicationKeyColorDarkenedIfNecessary];
      goto LABEL_16;
    case 13:
      id v11 = [(CRLiOSVisualEffectHelper *)self applicationKeyColorDarkenedIfNecessary];
      double v12 = v11;
      double v13 = 0.0625;
      goto LABEL_25;
    case 14:
      id v11 = [(CRLiOSVisualEffectHelper *)self applicationKeyColorDarkenedIfNecessary];
      double v12 = v11;
      double v13 = 0.2;
      goto LABEL_25;
    case 15:
      id v11 = [(CRLiOSVisualEffectHelper *)self applicationKeyColorDarkenedIfNecessary];
      double v12 = v11;
      double v13 = 0.25;
      goto LABEL_25;
    case 16:
      id v11 = [(CRLiOSVisualEffectHelper *)self applicationKeyColorDarkenedIfNecessary];
      double v12 = v11;
      double v13 = 0.9;
LABEL_25:
      uint64_t v14 = [v11 colorWithAlphaComponent:v13];
      goto LABEL_40;
    case 17:
      uint64_t v6 = +[UIColor systemBackgroundColor];
      goto LABEL_16;
    case 18:
      uint64_t v6 = +[UIColor secondarySystemBackgroundColor];
      goto LABEL_16;
    case 19:
      uint64_t v6 = +[UIColor tertiarySystemBackgroundColor];
      goto LABEL_16;
    case 20:
      uint64_t v6 = +[UIColor systemGroupedBackgroundColor];
      goto LABEL_16;
    case 21:
      uint64_t v6 = +[UIColor secondarySystemGroupedBackgroundColor];
      goto LABEL_16;
    case 22:
      uint64_t v6 = +[UIColor tertiarySystemGroupedBackgroundColor];
      goto LABEL_16;
    case 23:
      uint64_t v6 = +[UIColor systemGray2Color];
      goto LABEL_16;
    case 24:
      uint64_t v6 = +[UIColor systemGray3Color];
      goto LABEL_16;
    case 25:
      uint64_t v6 = +[UIColor systemGray4Color];
      goto LABEL_16;
    case 26:
      uint64_t v6 = +[UIColor systemGray5Color];
      goto LABEL_16;
    case 27:
      uint64_t v6 = +[UIColor systemGray6Color];
      goto LABEL_16;
    case 28:
      uint64_t v6 = +[UIColor labelColor];
      goto LABEL_16;
    case 29:
      uint64_t v6 = +[UIColor secondaryLabelColor];
      goto LABEL_16;
    case 30:
      uint64_t v6 = +[UIColor colorNamed:@"tsk_higherContrastGroupBackgroundColor"];
      goto LABEL_16;
    case 31:
      double v12 = [(CRLiOSVisualEffectHelper *)self applicationKeyColorDarkenedIfNecessary];
      double v17 = 0.0;
      double v18 = 0.0;
      double v16 = 0.0;
      [v12 getRed:&v18 green:&v17 blue:&v16 alpha:0];
      uint64_t v14 = +[UIColor colorWithRed:v18 * 0.2 + 0.138039196 green:v17 * 0.2 + 0.138039196 blue:v16 * 0.2 + 0.144313598 alpha:1.0];
LABEL_40:
      double v15 = (void *)v14;

      uint64_t v5 = v15;
      break;
    case 32:
      uint64_t v6 = +[UIColor tertiarySystemFillColor];
      goto LABEL_16;
    case 33:
      uint64_t v6 = +[UIColor quaternarySystemFillColor];
LABEL_16:
      int64_t v9 = (void *)v6;

      uint64_t v5 = v9;
      break;
    default:
      break;
  }

  return v5;
}

- (BOOL)p_needsTraitVariantsForColorPreset:(int64_t)a3
{
  return ((unint64_t)a3 < 0x1F) & (0x777E1000u >> a3);
}

- (unint64_t)p_layerCornerMaskForCorners:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 0;
  }
  else {
    return qword_101178B30[a3 - 1];
  }
}

- (CGSize)p_imageSizeForRadius:(double)a3 corners:(int64_t)a4 capInsets:(UIEdgeInsets *)a5
{
  double v5 = 0.0;
  double v6 = 1.0;
  switch(a4)
  {
    case 1:
      double v7 = a3;
      double v8 = a3;
      double v5 = a3;
      double v9 = 0.0;
      break;
    case 2:
      double v7 = a3;
      double v8 = 0.0;
      goto LABEL_9;
    case 3:
      double v7 = 1.0;
      double v6 = a3;
      double v8 = 0.0;
      double v5 = a3;
      double v9 = a3;
      goto LABEL_6;
    case 4:
      double v7 = 1.0;
      double v6 = a3;
      double v8 = a3;
      goto LABEL_10;
    case 5:
      double v7 = a3 + a3;
      double v6 = a3 + a3;
      double v8 = a3;
LABEL_9:
      double v5 = a3;
LABEL_10:
      double v9 = a3;
      break;
    default:
      double v7 = 1.0;
      double v8 = 0.0;
      double v9 = 0.0;
LABEL_6:
      a3 = 0.0;
      break;
  }
  a5->top = v8;
  a5->left = v5;
  a5->bottom = v9;
  a5->right = a3;
  double v10 = v6;
  result.height = v7;
  result.width = v10;
  return result;
}

- (id)p_applicationKeyColor
{
  v2 = +[UIApplication sharedApplication];
  id v3 = [v2 delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [v2 delegate];
    double v6 = [v5 defaultApplicationKeyColor];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)applicationKeyColorDarkenedIfNecessary
{
  v2 = [(CRLiOSVisualEffectHelper *)self p_applicationKeyColor];
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    double v12 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    double v9 = 0.0;
    if ([v2 getRed:&v12 green:&v11 blue:&v10 alpha:&v9])
    {
      uint64_t v3 = +[UIColor colorWithRed:v12 green:v11 blue:v10 alpha:v9];

      v2 = (void *)v3;
    }
    double v7 = 0.0;
    double v8 = 0.0;
    double v6 = 0.0;
    if ([v2 getHue:&v8 saturation:&v7 brightness:&v6 alpha:&v9])
    {
      uint64_t v4 = +[UIColor colorWithHue:v8 saturation:v7 brightness:v6 * 0.8 alpha:v9];

      v2 = (void *)v4;
    }
  }

  return v2;
}

- (void)applyTouchDownAnimationToViews:(id)a3
{
  id v4 = a3;
  double v5 = [v4 firstObject];
  if (v5)
  {
    uint64_t v6 = [(CRLiOSVisualEffectHelper *)self p_activeTouchDownAnimatorForView:v5];
    uint64_t v7 = [(CRLiOSVisualEffectHelper *)self p_activeTouchUpAnimatorForView:v5];
    if (v6 | v7)
    {
      if (v6 && [(id)v6 state] == (id)1)
      {
        id v8 = [(CRLiOSVisualEffectHelper *)self p_touchDownTimingParameters];
        [(id)v6 continueAnimationWithTimingParameters:v8 durationFactor:0.5];
      }
      else
      {
        if (!v7 || [(id)v7 state] != (id)1) {
          goto LABEL_8;
        }
        [(CRLiOSVisualEffectHelper *)self p_makeTouchDownAnimatorForViews:v4];
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_10046F938;
        v9[3] = &unk_1014FC0D8;
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = v10;
        [(id)v7 addCompletion:v9];
        [(id)v7 stopAnimation:0];
        [(id)v7 finishAnimationAtPosition:2];
      }
    }
    else
    {
      id v8 = [(CRLiOSVisualEffectHelper *)self p_makeTouchDownAnimatorForViews:v4];
      [v8 startAnimation];
    }

LABEL_8:
  }
}

- (void)applyTouchUpAnimationToViews:(id)a3
{
  id v4 = a3;
  double v5 = [v4 firstObject];
  if (v5)
  {
    uint64_t v6 = [(CRLiOSVisualEffectHelper *)self p_activeTouchUpAnimatorForView:v5];
    uint64_t v7 = [(CRLiOSVisualEffectHelper *)self p_activeTouchDownAnimatorForView:v5];
    if (!v6)
    {
      id v8 = [(CRLiOSVisualEffectHelper *)self p_makeTouchUpAnimatorForViews:v4];
      double v9 = v8;
      if (v7)
      {
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_10046FA54;
        v10[3] = &unk_1014FC0D8;
        id v11 = v8;
        [v7 addCompletion:v10];
      }
      else
      {
        [v8 startAnimation];
      }
    }
  }
}

- (void)startHandlingTouchUpDownAnimationsForControl:(id)a3 withViews:(id)a4
{
  id v6 = a4;
  controlsToMonitorForAnimations = self->_controlsToMonitorForAnimations;
  id v8 = a3;
  double v9 = [(NSMapTable *)controlsToMonitorForAnimations objectForKeyedSubscript:v8];

  if (v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC0F8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B6644();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC118);
    }
    id v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSVisualEffectHelper startHandlingTouchUpDownAnimationsForControl:withViews:]");
    double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSVisualEffectProviding.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:539 isFatal:0 description:"Should not start monitoring a control for animations that is already being monitored."];
  }
  [(NSMapTable *)self->_controlsToMonitorForAnimations setObject:v6 forKeyedSubscript:v8];
  [v8 addTarget:self action:"p_controlTouchDown:event:" forControlEvents:1];
  [v8 addTarget:self action:"p_controlDragEnter:event:" forControlEvents:16];
  [v8 addTarget:self action:"p_controlDragExit:event:" forControlEvents:32];
  [v8 addTarget:self action:"p_controlTouchCancel:event:" forControlEvents:256];
  [v8 addTarget:self action:"p_controlTouchCancel:event:" forControlEvents:128];
  [v8 addTarget:self action:"p_controlTouchUpInside:event:" forControlEvents:64];
}

- (void)stopHandlingTouchUpDownAnimationsForControl:(id)a3
{
  controlsToMonitorForAnimations = self->_controlsToMonitorForAnimations;
  id v5 = a3;
  id v6 = [(NSMapTable *)controlsToMonitorForAnimations objectForKeyedSubscript:v5];

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC138);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B66CC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC158);
    }
    uint64_t v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSVisualEffectHelper stopHandlingTouchUpDownAnimationsForControl:]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSVisualEffectProviding.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:552 isFatal:0 description:"Should not stop monitoring a control for animations that is not already being monitored."];
  }
  [(NSMapTable *)self->_controlsToMonitorForAnimations removeObjectForKey:v5];
  [v5 removeTarget:self action:"p_controlTouchDown:event:" forControlEvents:1];
  [v5 removeTarget:self action:"p_controlDragEnter:event:" forControlEvents:16];
  [v5 removeTarget:self action:"p_controlDragExit:event:" forControlEvents:32];
  [v5 removeTarget:self action:"p_controlTouchCancel:event:" forControlEvents:256];
  [v5 removeTarget:self action:"p_controlTouchCancel:event:" forControlEvents:128];
  [v5 removeTarget:self action:"p_controlTouchUpInside:event:" forControlEvents:64];
}

- (id)p_scrimOwnerForView:(id)a3
{
  return sub_100246AC8(a3, 1, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)&OBJC_PROTOCOL___CRLiOSVisualEffectScrimLayerOwning);
}

- (id)p_activeTouchDownAnimatorForView:(id)a3
{
  return objc_getAssociatedObject(a3, off_10166E7D0);
}

- (void)p_setActiveTouchDownAnimator:(id)a3 forView:(id)a4
{
}

- (id)p_activeTouchUpAnimatorForView:(id)a3
{
  return objc_getAssociatedObject(a3, off_10166E7D8);
}

- (void)p_setActiveTouchUpAnimator:(id)a3 forView:(id)a4
{
}

- (double)p_lastTouchEventTimestampForView:(id)a3
{
  uint64_t v3 = objc_getAssociatedObject(a3, off_10166E7E0);
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)p_setLastTouchEventTimestamp:(double)a3 forView:(id)a4
{
  double v5 = off_10166E7E0;
  id v6 = a4;
  id v7 = +[NSNumber numberWithDouble:a3];
  objc_setAssociatedObject(v6, v5, v7, (void *)0x301);
}

- (id)p_makeTouchDownAnimatorForViews:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)UIViewPropertyAnimator);
  id v6 = [(CRLiOSVisualEffectHelper *)self p_touchDownTimingParameters];
  id v7 = [v5 initWithDuration:v6 timingParameters:0.1];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100470294;
  v20[3] = &unk_1014CBE78;
  id v8 = v4;
  id v21 = v8;
  v22 = self;
  [v7 addAnimations:v20];
  double v9 = [v8 firstObject];
  [(CRLiOSVisualEffectHelper *)self p_setActiveTouchDownAnimator:v7 forView:v9];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10047040C;
  v16[3] = &unk_1014FC180;
  v16[4] = self;
  id v17 = v9;
  id v10 = v7;
  id v18 = v10;
  id v19 = v8;
  id v11 = v8;
  id v12 = v9;
  [v10 addCompletion:v16];
  double v13 = v19;
  id v14 = v10;

  return v14;
}

- (CGAffineTransform)p_touchDownAffineTransformForView:(SEL)a3
{
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return self;
}

- (CATransform3D)p_touchDownTransformForView:(SEL)a3
{
  long long v4 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&retstr->m33 = v4;
  long long v5 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&retstr->m43 = v5;
  long long v6 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&retstr->m13 = v6;
  long long v7 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&retstr->m23 = v7;
  return self;
}

- (id)p_makeTouchUpAnimatorForViews:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)UIViewPropertyAnimator);
  [(CRLiOSVisualEffectHelper *)self p_touchUpSpringSettlingTime];
  double v7 = v6;
  id v8 = [(CRLiOSVisualEffectHelper *)self p_touchUpTimingParameters];
  id v9 = [v5 initWithDuration:v8 timingParameters:v7];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100470734;
  v22[3] = &unk_1014CBE78;
  id v10 = v4;
  id v23 = v10;
  uint64_t v24 = self;
  [v9 addAnimations:v22];
  id v11 = [v10 firstObject];
  [(CRLiOSVisualEffectHelper *)self p_setActiveTouchUpAnimator:v9 forView:v11];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1004708A8;
  v18[3] = &unk_1014FC180;
  v18[4] = self;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  id v21 = v10;
  id v13 = v10;
  id v14 = v11;
  [v12 addCompletion:v18];
  double v15 = v21;
  id v16 = v12;

  return v16;
}

- (id)p_touchDownTimingParameters
{
  if (qword_1016A9D10 != -1) {
    dispatch_once(&qword_1016A9D10, &stru_1014FC1A0);
  }
  v2 = (void *)qword_1016A9D08;

  return v2;
}

- (id)p_touchUpTimingParameters
{
  if (qword_1016A9D20 != -1) {
    dispatch_once(&qword_1016A9D20, &stru_1014FC1C0);
  }
  v2 = (void *)qword_1016A9D18;

  return v2;
}

- (double)p_touchUpSpringSettlingTime
{
  if (qword_1016A9D30 != -1) {
    dispatch_once(&qword_1016A9D30, &stru_1014FC1E0);
  }
  return *(double *)&qword_1016A9D28;
}

- (void)p_applyDragEnterEffectToScrimLayersInViews:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(CRLiOSVisualEffectHelper *)self p_scrimOwnerForView:*(void *)(*((void *)&v11 + 1) + 8 * (void)v8)];
        id v10 = [v9 viewForScrimOpacityAnimation];
        [v10 setHidden:0];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)p_applyDragExitEffectToScrimLayersInViews:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(CRLiOSVisualEffectHelper *)self p_scrimOwnerForView:*(void *)(*((void *)&v11 + 1) + 8 * (void)v8)];
        id v10 = [v9 viewForScrimOpacityAnimation];
        [v10 setHidden:1];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)p_controlTouchDown:(id)a3 event:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NSMapTable *)self->_controlsToMonitorForAnimations objectForKeyedSubscript:a3];
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC200);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B67DC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC220);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSVisualEffectHelper p_controlTouchDown:event:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSVisualEffectProviding.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:722 isFatal:0 description:"Trying to apply animations to a control that's not being monitored."];
  }
  [v6 timestamp];
  double v12 = v11;
  long long v13 = [v7 firstObject];
  [(CRLiOSVisualEffectHelper *)self p_lastTouchEventTimestampForView:v13];
  double v15 = v14;

  if (v12 <= v15)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC240);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B6754();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC260);
    }
    id v19 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v19);
    }
    id v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSVisualEffectHelper p_controlTouchDown:event:]");
    id v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSVisualEffectProviding.m"];
    +[CRLAssertionHandler handleFailureInFunction:v18 file:v20 lineNumber:729 isFatal:0 description:"Button animation received out-of-order touch events. This may be due to calling [self refresh] or [tableView reloadData] directly instead of calling [self.refreshingDelegate refreshableInspectorPaneWantsToRefresh:self]."];
  }
  else
  {
    [(CRLiOSVisualEffectHelper *)self applyTouchDownAnimationToViews:v7];
    [v6 timestamp];
    double v17 = v16;
    id v18 = [v7 firstObject];
    [(CRLiOSVisualEffectHelper *)self p_setLastTouchEventTimestamp:v18 forView:v17];
  }
}

- (void)p_controlDragEnter:(id)a3 event:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NSMapTable *)self->_controlsToMonitorForAnimations objectForKeyedSubscript:a3];
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC280);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B6864();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC2A0);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSVisualEffectHelper p_controlDragEnter:event:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSVisualEffectProviding.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:735 isFatal:0 description:"Trying to apply animations to a control that's not being monitored."];
  }
  [v6 timestamp];
  double v12 = v11;
  long long v13 = [v7 firstObject];
  [(CRLiOSVisualEffectHelper *)self p_lastTouchEventTimestampForView:v13];
  double v15 = v14;

  if (v12 > v15)
  {
    [(CRLiOSVisualEffectHelper *)self p_applyDragEnterEffectToScrimLayersInViews:v7];
    [v6 timestamp];
    double v17 = v16;
    id v18 = [v7 firstObject];
    [(CRLiOSVisualEffectHelper *)self p_setLastTouchEventTimestamp:v18 forView:v17];
  }
}

- (void)p_controlDragExit:(id)a3 event:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NSMapTable *)self->_controlsToMonitorForAnimations objectForKeyedSubscript:a3];
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC2C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B68EC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC2E0);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSVisualEffectHelper p_controlDragExit:event:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSVisualEffectProviding.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:746 isFatal:0 description:"Trying to apply animations to a control that's not being monitored."];
  }
  [v6 timestamp];
  double v12 = v11;
  long long v13 = [v7 firstObject];
  [(CRLiOSVisualEffectHelper *)self p_lastTouchEventTimestampForView:v13];
  double v15 = v14;

  if (v12 > v15)
  {
    [(CRLiOSVisualEffectHelper *)self p_applyDragExitEffectToScrimLayersInViews:v7];
    [v6 timestamp];
    double v17 = v16;
    id v18 = [v7 firstObject];
    [(CRLiOSVisualEffectHelper *)self p_setLastTouchEventTimestamp:v18 forView:v17];
  }
}

- (void)p_controlTouchCancel:(id)a3 event:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NSMapTable *)self->_controlsToMonitorForAnimations objectForKeyedSubscript:a3];
  if (v7)
  {
    if (v6)
    {
LABEL_3:
      [v6 timestamp];
      double v9 = v8;
      goto LABEL_14;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC300);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B6974();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC320);
    }
    id v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    double v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSVisualEffectHelper p_controlTouchCancel:event:]");
    double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSVisualEffectProviding.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:757 isFatal:0 description:"Trying to apply animations to a control that's not being monitored."];

    if (v6) {
      goto LABEL_3;
    }
  }
  long long v13 = +[NSProcessInfo processInfo];
  [v13 systemUptime];
  double v9 = v14;

LABEL_14:
  double v15 = [v7 firstObject];
  [(CRLiOSVisualEffectHelper *)self p_lastTouchEventTimestampForView:v15];
  double v17 = v16;

  if (v9 > v17)
  {
    [(CRLiOSVisualEffectHelper *)self applyTouchUpAnimationToViews:v7];
    id v18 = [v7 firstObject];
    [(CRLiOSVisualEffectHelper *)self p_setLastTouchEventTimestamp:v18 forView:v9];
  }
}

- (void)p_controlTouchUpInside:(id)a3 event:(id)a4
{
  controlsToMonitorForAnimations = self->_controlsToMonitorForAnimations;
  id v7 = a4;
  double v8 = [(NSMapTable *)controlsToMonitorForAnimations objectForKeyedSubscript:a3];
  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC340);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B69FC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FC360);
    }
    double v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSVisualEffectHelper p_controlTouchUpInside:event:]");
    double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSVisualEffectProviding.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:770 isFatal:0 description:"Trying to apply animations to a control that's not being monitored."];
  }
  [(CRLiOSVisualEffectHelper *)self applyTouchUpAnimationToViews:v8];
  [v7 timestamp];
  double v13 = v12;

  double v14 = [v8 firstObject];
  [(CRLiOSVisualEffectHelper *)self p_setLastTouchEventTimestamp:v14 forView:v13];
}

- (NSMapTable)controlsToMonitorForAnimations
{
  return self->_controlsToMonitorForAnimations;
}

- (void)setControlsToMonitorForAnimations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end