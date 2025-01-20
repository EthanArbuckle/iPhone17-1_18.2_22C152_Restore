@interface _UIPageCurl
- (BOOL)_areAnimationsInFlightOrPending;
- (BOOL)_isManualPageCurlInProgressAndUncommitted;
- (BOOL)_isPreviousCurlCompatibleWithCurlOfType:(int64_t)a3 inDirection:(int64_t)a4;
- (BOOL)_populateFromValue:(double *)a3 toValue:(double *)a4 fromState:(id)a5 forAnimationWithKeyPath:(id)a6;
- (CGPoint)_referenceLocationForInitialLocation:(CGPoint)a3 direction:(int64_t)a4;
- (CGRect)_pageViewFrame:(BOOL)a3;
- (NSNumber)_wrappedManualPageCurlDirection;
- (_UIPageCurl)initWithSpineLocation:(int64_t)a3 andContentRect:(CGRect)a4 inContentView:(id)a5;
- (double)_baseAngleOffsetForState:(id)a3;
- (double)_distanceToTravelWithCurrentSpineLocation;
- (double)_durationForManualCurlEndAnimationWithSuggestedVelocity:(double)a3 shouldComplete:(BOOL)a4;
- (double)_inputTimeForProgress:(double)a3 distanceToTravel:(double)a4 radius:(double *)a5 minRadius:(double)a6 angle:(double)a7 dAngle:(double)a8 touchLocation:(CGPoint)a9 state:(id)a10;
- (double)_manualPageCurlMaxDAngle;
- (id)_animationKeyPaths;
- (id)_newAnimationForState:(id)a3 withKeyPath:(id)a4 duration:(double)a5 fromValue:(id)a6;
- (id)_newCurlFilter;
- (int64_t)_spineLocation;
- (int64_t)_validatedPageCurlTypeForPageCurlType:(int64_t)a3 inDirection:(int64_t)a4;
- (void)_abortManualCurlAtLocation:(CGPoint)a3 withSuggestedVelocity:(double)a4;
- (void)_beginCurlWithState:(id)a3 previousState:(id)a4;
- (void)_cancelAllActiveTransitionsAndAbandonCallbacks:(BOOL)a3;
- (void)_cancelTransitionWithState:(id)a3 invalidatingPageCurl:(BOOL)a4;
- (void)_cleanupState:(id)a3;
- (void)_completeManualCurlAtLocation:(CGPoint)a3 withSuggestedVelocity:(double)a4;
- (void)_endManualCurlAtLocation:(CGPoint)a3 withSuggestedVelocity:(double)a4 shouldComplete:(BOOL)a5;
- (void)_enqueueCurlOfType:(int64_t)a3 fromLocation:(CGPoint)a4 inDirection:(int64_t)a5 withView:(id)a6 revealingView:(id)a7 completion:(id)a8 finally:(id)a9;
- (void)_ensureCurlFilterOnLayer:(id)a3;
- (void)_forceCleanupState:(id)a3 finished:(BOOL)a4 completed:(BOOL)a5;
- (void)_pageCurlAnimationDidStop:(id)a3 withState:(id)a4;
- (void)_setContentRect:(CGRect)a3;
- (void)_setManualPageCurlMaxDAngle:(double)a3;
- (void)_updateCurlFromState:(id)a3 withTime:(double)a4 radius:(double)a5 angle:(double)a6 addingAnimations:(id)a7;
- (void)_updateManualCurlToLocation:(CGPoint)a3;
- (void)_updatedInputsFromState:(id)a3 forLocation:(CGPoint)a4 time:(double *)a5 radius:(double *)a6 angle:(double *)a7;
- (void)dealloc;
@end

@implementation _UIPageCurl

- (_UIPageCurl)initWithSpineLocation:(int64_t)a3 andContentRect:(CGRect)a4 inContentView:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v13 = a5;
  v33.receiver = self;
  v33.super_class = (Class)_UIPageCurl;
  v14 = [(_UIPageCurl *)&v33 init];
  if (v14)
  {
    if ((unint64_t)a3 > 0x20 || ((1 << a3) & 0x10001011ELL) == 0)
    {
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, @"_UIPageCurl.m", 500, @"'%ld' is not a permissible spine location", a3);
    }
    v14->_int64_t spineLocation = a3;
    v14->_contentRect.origin.CGFloat x = x;
    v14->_contentRect.origin.CGFloat y = y;
    v14->_contentRect.size.CGFloat width = width;
    v14->_contentRect.size.CGFloat height = height;
    objc_storeStrong((id *)&v14->_contentView, a5);
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingStateQueue = v14->_pendingStateQueue;
    v14->_pendingStateQueue = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    activeStateQueue = v14->_activeStateQueue;
    v14->_activeStateQueue = v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    completedStates = v14->_completedStates;
    v14->_completedStates = v20;

    int64_t spineLocation = v14->_spineLocation;
    CGFloat v24 = v14->_contentRect.origin.x;
    CGFloat v23 = v14->_contentRect.origin.y;
    CGFloat v26 = v14->_contentRect.size.width;
    CGFloat v25 = v14->_contentRect.size.height;
    double v27 = 3.14159265;
    switch(spineLocation)
    {
      case 1:
        goto LABEL_10;
      case 2:
        goto LABEL_9;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_15;
      case 4:
        double v28 = CGRectGetWidth(v14->_contentRect) * 0.5;
        goto LABEL_11;
      case 8:
        double v28 = CGRectGetHeight(v14->_contentRect) * 0.5;
        goto LABEL_13;
      default:
        if (spineLocation == 16)
        {
LABEL_10:
          double v28 = CGRectGetWidth(v14->_contentRect);
LABEL_11:
          v34.origin.CGFloat x = v24;
          v34.origin.CGFloat y = v23;
          v34.size.CGFloat width = v26;
          v34.size.CGFloat height = v25;
          double v29 = CGRectGetHeight(v34);
        }
        else
        {
          if (spineLocation != 32) {
            goto LABEL_15;
          }
LABEL_9:
          double v28 = CGRectGetHeight(v14->_contentRect);
LABEL_13:
          v35.origin.CGFloat x = v24;
          v35.origin.CGFloat y = v23;
          v35.size.CGFloat width = v26;
          v35.size.CGFloat height = v25;
          double v29 = CGRectGetWidth(v35);
        }
        float v30 = v28;
        float v31 = v29 * 0.5;
        double v27 = atan2f(v30, v31);
LABEL_15:
        v14->_manualPageCurlMaxDAngle = v27;
        break;
    }
  }

  return v14;
}

- (void)dealloc
{
  [(_UIPageCurl *)self _cancelAllActiveTransitionsAndAbandonCallbacks:1];
  v3.receiver = self;
  v3.super_class = (Class)_UIPageCurl;
  [(_UIPageCurl *)&v3 dealloc];
}

- (BOOL)_isManualPageCurlInProgressAndUncommitted
{
  manualPageCurlState = self->_manualPageCurlState;
  if (manualPageCurlState) {
    LOBYTE(manualPageCurlState) = [(_UIPageCurlState *)manualPageCurlState curlState] < 5;
  }
  return (char)manualPageCurlState;
}

- (BOOL)_areAnimationsInFlightOrPending
{
  return [(NSMutableArray *)self->_activeStateQueue count]
      || [(NSMutableArray *)self->_pendingStateQueue count] != 0;
}

- (NSNumber)_wrappedManualPageCurlDirection
{
  manualPageCurlState = self->_manualPageCurlState;
  if (manualPageCurlState)
  {
    manualPageCurlState = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(manualPageCurlState, "transitionDirection"));
  }
  return (NSNumber *)manualPageCurlState;
}

- (void)_setContentRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!CGRectEqualToRect(self->_contentRect, a3))
  {
    self->_contentRect.origin.CGFloat x = x;
    self->_contentRect.origin.CGFloat y = y;
    self->_contentRect.size.CGFloat width = width;
    self->_contentRect.size.CGFloat height = height;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v8 = self->_activeStateQueue;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v14 = (id)objc_msgSend(v13, "frontPageView", (void)v16);
          id v15 = (id)[v13 backPageView];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

- (CGRect)_pageViewFrame:(BOOL)a3
{
  CGFloat x = self->_contentRect.origin.x;
  CGFloat y = self->_contentRect.origin.y;
  double width = self->_contentRect.size.width;
  double height = self->_contentRect.size.height;
  int64_t spineLocation = self->_spineLocation;
  if (spineLocation == 8)
  {
    double height = CGRectGetHeight(self->_contentRect) * 0.5;
    if (!a3) {
      CGFloat y = CGRectGetMidY(self->_contentRect);
    }
  }
  else if (spineLocation == 4)
  {
    double width = CGRectGetWidth(self->_contentRect) * 0.5;
    if (!a3) {
      CGFloat x = CGRectGetMidX(self->_contentRect);
    }
  }
  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (id)_newCurlFilter
{
  id v2 = objc_alloc(MEMORY[0x1E4F39BC0]);
  objc_super v3 = (void *)[v2 initWithType:*MEMORY[0x1E4F3A2D0]];
  [v3 setName:@"curl"];
  [v3 setCachesInputImage:1];
  id v4 = +[UIColor whiteColor];
  objc_msgSend(v3, "setValue:forKeyPath:", objc_msgSend(v4, "CGColor"), @"inputFrontColor");

  id v5 = +[UIColor colorWithWhite:0.956862745 alpha:0.8];
  objc_msgSend(v3, "setValue:forKeyPath:", objc_msgSend(v5, "CGColor"), @"inputBackColor0");

  id v6 = +[UIColor colorWithWhite:0.7 alpha:1.0];
  objc_msgSend(v3, "setValue:forKeyPath:", objc_msgSend(v6, "CGColor"), @"inputBackColor1");

  id v7 = +[UIColor colorWithWhite:0.15 alpha:1.0];
  objc_msgSend(v3, "setValue:forKeyPath:", objc_msgSend(v7, "CGColor"), @"inputShadowColor");

  return v3;
}

- (id)_newAnimationForState:(id)a3 withKeyPath:(id)a4 duration:(double)a5 fromValue:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  [v12 setKeyPath:v10];
  [v12 setDuration:UIAnimationDragCoefficient() * a5];
  [v12 setFillMode:*MEMORY[0x1E4F39F98]];
  if (v11) {
    [v12 setFromValue:v11];
  }
  if (![v10 isEqualToString:@"filters.curl.inputTime"])
  {
    if ([v10 isEqualToString:@"filters.curl.inputRadius"])
    {
      id v14 = (void *)MEMORY[0x1E4F39C10];
      id v15 = &kUIPageCurlSmoothControlPoints;
    }
    else
    {
      if (![v10 isEqualToString:@"filters.curl.inputAngle"]) {
        goto LABEL_13;
      }
      long long v16 = (void *)MEMORY[0x1E4F39C10];
      if ([v9 curlType] >= 3) {
        id v15 = &kUIPageCurlEaseInControlPoints;
      }
      else {
        id v15 = &kUIPageCurlEaseOutControlPoints;
      }
      id v14 = v16;
    }
    long long v17 = [v14 uiFunctionWithControlPoints:v15];
    [v12 setTimingFunction:v17];

    goto LABEL_13;
  }
  double v13 = [MEMORY[0x1E4F39C10] uiFunctionWithControlPoints:&kUIPageCurlSmoothControlPoints];
  [v12 setTimingFunction:v13];

  [v12 setDelegate:v9];
LABEL_13:

  return v12;
}

- (double)_baseAngleOffsetForState:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  int64_t spineLocation = self->_spineLocation;
  double v8 = 3.14159265;
  if (spineLocation == 1) {
    goto LABEL_19;
  }
  if (spineLocation == 4)
  {
    if (![v5 transitionDirection]) {
      goto LABEL_19;
    }
    int64_t spineLocation = self->_spineLocation;
  }
  if (spineLocation == 3) {
    goto LABEL_19;
  }
  if (spineLocation == 16) {
    goto LABEL_18;
  }
  if (spineLocation != 4) {
    goto LABEL_10;
  }
  if ([v6 transitionDirection] == 1)
  {
LABEL_18:
    double v8 = 0.0;
    goto LABEL_19;
  }
  int64_t spineLocation = self->_spineLocation;
LABEL_10:
  double v8 = 4.71238898;
  if (spineLocation != 2)
  {
    if (spineLocation == 8)
    {
      if (![v6 transitionDirection]) {
        goto LABEL_19;
      }
      int64_t spineLocation = self->_spineLocation;
    }
    double v8 = 1.57079633;
    if (spineLocation != 32 && (spineLocation != 8 || [v6 transitionDirection] != 1))
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"_UIPageCurl.m" lineNumber:602 description:@"Not implemented yet!"];

      goto LABEL_18;
    }
  }
LABEL_19:

  return v8;
}

- (BOOL)_populateFromValue:(double *)a3 toValue:(double *)a4 fromState:(id)a5 forAnimationWithKeyPath:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  if ([v12 isEqualToString:@"filters.curl.inputTime"])
  {
    if ([v11 curlType] <= 2)
    {
      if (a3) {
        *a3 = 0.0;
      }
      if (a4) {
        *a4 = 1.0;
      }
    }
    else
    {
      if (a3) {
        *a3 = 1.0;
      }
      if (a4) {
        *a4 = 0.0;
      }
    }
    goto LABEL_67;
  }
  if ([v12 isEqualToString:@"filters.curl.inputRadius"])
  {
    unint64_t spineLocation = self->_spineLocation;
    if (spineLocation <= 0x20 && ((1 << spineLocation) & 0x100000104) != 0) {
      double Height = CGRectGetHeight(self->_contentRect);
    }
    else {
      double Height = CGRectGetWidth(self->_contentRect);
    }
    double v17 = Height;
    int64_t v18 = self->_spineLocation;
    if (v18 == 8 || v18 == 4)
    {
      if (a3)
      {
        if ([v11 curlType] == 1)
        {
          double v19 = 150.0;
        }
        else
        {
          uint64_t v21 = [v11 curlType];
          double v19 = v17 * 0.0203252033;
          if (v21 == 4) {
            double v19 = 150.0;
          }
        }
        *a3 = v19;
      }
      if (!a4) {
        goto LABEL_67;
      }
      uint64_t v22 = [v11 curlType];
      double v23 = 1.0;
      if (v22 != 1)
      {
        uint64_t v24 = objc_msgSend(v11, "curlType", 1.0);
        double v23 = v17 * 0.00101626016;
        if (v24 == 4) {
          double v23 = 1.0;
        }
      }
    }
    else
    {
      if (a3)
      {
        if ([v11 curlType] == 1) {
          double v20 = 0.152439024;
        }
        else {
          double v20 = dbl_186B94310[[v11 curlType] == 4];
        }
        *a3 = v17 * v20;
      }
      if (!a4) {
        goto LABEL_67;
      }
      double v23 = v17 * 0.304878049;
    }
    goto LABEL_66;
  }
  if (![v12 isEqualToString:@"filters.curl.inputAngle"]) {
    goto LABEL_70;
  }
  int64_t v15 = self->_spineLocation;
  double v16 = 3.14159265;
  if (v15 != 1)
  {
    if (v15 == 4)
    {
      if (![v11 transitionDirection]) {
        goto LABEL_54;
      }
      int64_t v15 = self->_spineLocation;
    }
    if (v15 != 3)
    {
      if (v15 == 16)
      {
LABEL_24:
        double v16 = 0.0;
        goto LABEL_54;
      }
      if (v15 == 4)
      {
        if ([v11 transitionDirection] == 1) {
          goto LABEL_24;
        }
        int64_t v15 = self->_spineLocation;
      }
      double v16 = 4.71238898;
      if (v15 == 2) {
        goto LABEL_54;
      }
      if (v15 == 8)
      {
        if (![v11 transitionDirection]) {
          goto LABEL_54;
        }
        int64_t v15 = self->_spineLocation;
      }
      double v16 = 1.57079633;
      if (v15 == 32 || v15 == 8 && [v11 transitionDirection] == 1) {
        goto LABEL_54;
      }
      float v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2 object:self file:@"_UIPageCurl.m" lineNumber:640 description:@"Not implemented yet!"];

LABEL_70:
      BOOL v29 = 0;
      goto LABEL_68;
    }
  }
LABEL_54:
  if (a3)
  {
    double v25 = 0.785398163;
    if (self->_spineLocation != 3) {
      double v25 = 0.0;
    }
    double v26 = v16 + v25;
    if ([v11 curlType] == 1 || objc_msgSend(v11, "curlType") == 4) {
      double v27 = dbl_186B94300[v16 > 1.57079633];
    }
    else {
      double v27 = -0.174532925;
    }
    *a3 = v26 + v27;
  }
  if (!a4) {
    goto LABEL_67;
  }
  double v28 = 0.785398163;
  if (self->_spineLocation != 3) {
    double v28 = 0.0;
  }
  double v23 = v16 + v28;
LABEL_66:
  *a4 = v23;
LABEL_67:
  BOOL v29 = 1;
LABEL_68:

  return v29;
}

- (void)_ensureCurlFilterOnLayer:(id)a3
{
  id v6 = a3;
  if (([v6 uiHasFilterWithName:@"curl"] & 1) == 0)
  {
    id v4 = [(_UIPageCurl *)self _newCurlFilter];
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v4, 0);
    [v6 setFilters:v5];
  }
}

- (double)_inputTimeForProgress:(double)a3 distanceToTravel:(double)a4 radius:(double *)a5 minRadius:(double)a6 angle:(double)a7 dAngle:(double)a8 touchLocation:(CGPoint)a9 state:(id)a10
{
  id v13 = a10;
  double v115 = *a5;
  uint64_t v14 = [v13 curlType];
  unint64_t spineLocation = self->_spineLocation;
  uint64_t v16 = [v13 transitionDirection];
  double v17 = -2.0;
  if (v14 < 3) {
    double v17 = 0.0;
  }
  if (spineLocation)
  {
    if (!v16)
    {
LABEL_8:
      double v17 = 0.0;
      if (v14 < 3) {
        double v17 = -2.0;
      }
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v18 = (spineLocation >> 4) & 1;
    if (spineLocation == 4) {
      LOBYTE(v18) = 1;
    }
    if (!v16 && (v18 & 1) != 0) {
      goto LABEL_8;
    }
  }
  if (spineLocation <= 0x20 && ((1 << spineLocation) & 0x100000104) != 0)
  {
    if (v14 >= 3) {
      int v20 = -1;
    }
    else {
      int v20 = -3;
    }
    if (v14 < 3) {
      int v21 = -1;
    }
    else {
      int v21 = -3;
    }
    if (!v16) {
      int v21 = v20;
    }
    double v17 = (double)v21;
  }
LABEL_25:
  uint64_t v22 = (uint64_t)v17;
  double x = self->_contentRect.origin.x;
  double y = self->_contentRect.origin.y;
  CGFloat height = self->_contentRect.size.height;
  CGFloat rect = self->_contentRect.size.width;
  if ((uint64_t)v17)
  {
    CGAffineTransformMakeTranslation(&t1, x - (x + self->_contentRect.size.width * 0.5), y - (y + self->_contentRect.size.height * 0.5));
    CGAffineTransformMakeRotation(&t2, -1.57079633);
    CGAffineTransformConcat(&v123, &t1, &t2);
    CGFloat a = v123.a;
    CGFloat b = v123.b;
    CGFloat c = v123.c;
    CGFloat d = v123.d;
    double v104 = a7;
    tdouble x = v123.tx;
    tdouble y = v123.ty;
    v124.origin.double x = x;
    v124.origin.double y = y;
    v124.size.CGFloat height = height;
    v124.size.double width = rect;
    CGRect v125 = CGRectApplyAffineTransform(v124, &v123);
    double x = v125.origin.x;
    double y = v125.origin.y;
    CGFloat height = v125.size.height;
    CGFloat rect = v125.size.width;
    CGAffineTransformMakeTranslation(&v120, v125.origin.x + v125.size.width * 0.5 - v125.origin.x, v125.origin.y + v125.size.height * 0.5 - v125.origin.y);
    v119.CGFloat a = a;
    v119.CGFloat b = b;
    v119.CGFloat c = c;
    v119.CGFloat d = d;
    v119.tdouble x = tx;
    v119.tdouble y = ty;
    a7 = v104;
    CGAffineTransformConcat(&v123, &v119, &v120);
    double v25 = v123.a;
    double v26 = v123.b;
    double v27 = v123.c;
    double v28 = v123.d;
    CGFloat v29 = v123.tx;
    double v30 = v123.ty;
  }
  else
  {
    double v25 = *MEMORY[0x1E4F1DAB8];
    double v26 = *(double *)(MEMORY[0x1E4F1DAB8] + 8);
    double v27 = *(double *)(MEMORY[0x1E4F1DAB8] + 16);
    double v28 = *(double *)(MEMORY[0x1E4F1DAB8] + 24);
    CGFloat v29 = *(double *)(MEMORY[0x1E4F1DAB8] + 32);
    double v30 = *(double *)(MEMORY[0x1E4F1DAB8] + 40);
  }
  if (v22 <= -2)
  {
    v126.origin.double x = x;
    v126.origin.double y = y;
    v126.size.CGFloat height = height;
    v126.size.double width = rect;
    CGFloat v37 = v29;
    CGFloat Width = CGRectGetWidth(v126);
    CGAffineTransformMakeTranslation(&v117, -Width, 0.0);
    v123.CGFloat a = v25;
    v123.CGFloat b = v26;
    v123.CGFloat c = v27;
    v123.CGFloat d = v28;
    v123.tdouble x = v37;
    v123.tdouble y = v30;
    CGAffineTransformConcat(&v118, &v123, &v117);
    CGAffineTransformMakeScale(&v116, -1.0, 1.0);
    CGAffineTransformConcat(&v123, &v118, &v116);
    double v25 = v123.a;
    double v26 = v123.b;
    double v27 = v123.c;
    double v28 = v123.d;
    CGFloat v29 = v123.tx;
    double v30 = v123.ty;
  }
  if (a8 == 0.0)
  {
    double v39 = 0.0;
  }
  else
  {
    double v39 = (double)v22 * 1.57079633 + a7;
    if (v39 < 0.0) {
      double v39 = -v39;
    }
  }
  double v105 = v39;
  double v102 = a9.y * v27 + a9.x * v25;
  CGRect contentRect = self->_contentRect;
  double v40 = v30 + a9.y * v28 + a9.x * v26;
  v123.CGFloat a = v25;
  v123.CGFloat b = v26;
  v123.CGFloat c = v27;
  v123.CGFloat d = v28;
  double v107 = v29;
  v123.tdouble x = v29;
  v123.tdouble y = v30;
  CGRect v128 = CGRectApplyAffineTransform(contentRect, &v123);
  CGFloat v41 = v128.origin.x;
  CGFloat v42 = v128.origin.y;
  CGFloat v43 = v128.size.width;
  CGFloat v44 = v128.size.height;
  [v13 referenceLocation];
  rectCGFloat a = v44;
  CGFloat v109 = v42;
  if (v40 < v30 + v26 * v45 + v28 * v46)
  {
    v129.origin.double x = v41;
    v129.origin.double y = v42;
    v129.size.double width = v43;
    v129.size.CGFloat height = v44;
    CGFloat MinY = CGRectGetMinY(v129);
    v130.size.CGFloat height = v44;
    double v48 = v40;
    double v49 = MinY;
    v130.origin.double x = v41;
    v130.origin.double y = v42;
    v130.size.double width = v43;
    double v40 = v49 + CGRectGetMaxY(v130) - v48;
  }
  double v101 = v40;
  double v108 = v107 + v102;
  if (a8 == 0.0)
  {
    double v58 = a4 * 0.5;
    double v59 = a3 * a4 - a4 * 0.5;
    double v60 = -v59;
    if (v59 >= 0.0) {
      double v60 = a3 * a4 - a4 * 0.5;
    }
    double v61 = (v58 - v60 + v115 * -3.14159265) * 0.5;
    if (v59 >= 0.0) {
      double v62 = a4 * 0.5;
    }
    else {
      double v62 = a3 * a4;
    }
    double v57 = v62 - v61;
    double v103 = a3 * a4 + a3 * a4;
  }
  else
  {
    float v50 = v105;
    __float2 v51 = __sincosf_stret(v50);
    float cosval = v51.__cosval;
    float v53 = v105 * 0.5;
    float v54 = sinf(v53);
    double v55 = v115
        * 6.28318531
        * (v51.__cosval
         + 1.0
         + ((float)((float)(1.0 / v51.__sinval) * (float)(1.0 / v51.__sinval))
          + (float)((float)(1.0 / v51.__sinval) * (float)(1.0 / v51.__sinval)))
         * powf(v54, 6.0))
        + v40 * 8.0 * (float)(cosval * cosval) * v51.__sinval
        - v115 * 8.0 * (float)(v51.__sinval * v51.__sinval);
    float v56 = v105 * 4.0;
    double v57 = (v108 / v51.__sinval * sinf(v56) + v55) * (float)((float)(1.0 / cosval) * (float)(1.0 / cosval)) * 0.125;
    double v103 = 0.0;
    double v58 = 0.0;
    double v59 = 0.0;
  }
  CGFloat v63 = v109;
  CGFloat v64 = v43;
  CGFloat v65 = v41;
  if (v105 >= 0.0) {
    double v66 = v105;
  }
  else {
    double v66 = -v105;
  }
  int64_t v67 = self->_spineLocation;
  if (v67 == 8 || v67 == 4)
  {
    CGFloat v68 = recta;
    double v69 = CGRectGetWidth(*(CGRect *)&v65) * 0.5;
  }
  else
  {
    CGFloat v70 = recta;
    double v69 = CGRectGetWidth(*(CGRect *)&v65);
  }
  rectCGFloat b = v66;
  float v71 = v66;
  __float2 v72 = __sincosf_stret(v71);
  double v73 = v57 * v72.__cosval + v57 * v72.__sinval * tanf(v71);
  double v74 = v69 * 4.0;
  if (self->_spineLocation != 3) {
    double v74 = v69;
  }
  if (v73 > v74)
  {
    double v57 = v69 * v72.__cosval;
    if (a8 == 0.0)
    {
      double v91 = v59 + v58 + v57 + v57 - v103;
      if (v59 >= 0.0) {
        double v91 = v57 + v57 - v58 - v59;
      }
      double v90 = v91 / 3.14159265;
    }
    else
    {
      float v75 = v105 * 4.0;
      double v76 = v108 * sinf(v75);
      float v77 = v105;
      __float2 v78 = __sincosf_stret(v77);
      double v79 = 1.0 / v78.__sinval * v76;
      double v80 = 1.0 / v78.__cosval;
      float v81 = v80;
      double v82 = (float)(v81 * v81);
      double v83 = v57 * 8.0 - v79 * v82 - v101 * 8.0 * v78.__sinval;
      float v84 = v105;
      float v85 = tanf(v84);
      double v86 = v80 * 3.14159265 + v82 * 3.14159265 - (float)(v85 * v85) * 4.0;
      float v87 = v105 * 0.5;
      float v88 = sinf(v87);
      double v89 = powf(v88, 6.0)
          * 6.28318531
          * (float)((float)(1.0 / v78.__sinval) * (float)(1.0 / v78.__sinval))
          * (float)((float)(1.0 / v78.__cosval) * (float)(1.0 / v78.__cosval))
          + v86;
      double v90 = v83 / (v89 + v89);
    }
    if (v90 < a6) {
      double v90 = a6;
    }
    double v115 = v90;
    *a5 = v90;
  }
  double pageDiagonalLength = self->_pageDiagonalLength;
  float v93 = rectb - self->_pageDiagonalAngle;
  double v94 = pageDiagonalLength * cosf(v93);
  double v95 = -v94;
  if (v94 >= 0.0) {
    double v95 = v94;
  }
  double v96 = v57 / (v115 + v95);

  return v96;
}

- (double)_distanceToTravelWithCurrentSpineLocation
{
  int64_t spineLocation = self->_spineLocation;
  switch(spineLocation)
  {
    case 1:
    case 3:
      goto LABEL_8;
    case 2:
      goto LABEL_7;
    case 4:
      CGFloat x = self->_contentRect.origin.x;
      CGFloat y = self->_contentRect.origin.y;
      CGFloat width = self->_contentRect.size.width;
      CGFloat height = self->_contentRect.size.height;
      return CGRectGetWidth(*(CGRect *)&x);
    case 5:
    case 6:
    case 7:
      goto LABEL_9;
    case 8:
      CGFloat v12 = self->_contentRect.origin.x;
      CGFloat v13 = self->_contentRect.origin.y;
      CGFloat v14 = self->_contentRect.size.width;
      CGFloat v15 = self->_contentRect.size.height;
      return CGRectGetHeight(*(CGRect *)&v12);
    default:
      if (spineLocation == 16)
      {
LABEL_8:
        double v9 = CGRectGetWidth(self->_contentRect);
      }
      else if (spineLocation == 32)
      {
LABEL_7:
        double v9 = CGRectGetHeight(self->_contentRect);
      }
      else
      {
LABEL_9:
        float v10 = CGRectGetWidth(self->_contentRect);
        float v11 = CGRectGetHeight(self->_contentRect);
        double v9 = hypotf(v10, v11);
      }
      return v9 + v9;
  }
}

- (void)_updatedInputsFromState:(id)a3 forLocation:(CGPoint)a4 time:(double *)a5 radius:(double *)a6 angle:(double *)a7
{
  double y = a4.y;
  double x = a4.x;
  id v13 = a3;
  CGFloat v14 = self->_contentRect.origin.x;
  CGFloat v15 = self->_contentRect.origin.y;
  CGFloat width = self->_contentRect.size.width;
  CGFloat height = self->_contentRect.size.height;
  v111.origin.double x = v14;
  v111.origin.double y = v15;
  v111.size.CGFloat width = width;
  v111.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v111);
  v112.origin.double x = v14;
  v112.origin.double y = v15;
  v112.size.CGFloat width = width;
  v112.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v112);
  if (MinX < x) {
    double MinX = x;
  }
  if (MaxX <= MinX) {
    double v20 = MaxX;
  }
  else {
    double v20 = MinX;
  }
  v113.origin.double x = v14;
  v113.origin.double y = v15;
  v113.size.CGFloat width = width;
  v113.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v113);
  v114.origin.double x = v14;
  v114.origin.double y = v15;
  v114.size.CGFloat width = width;
  v114.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v114);
  if (MinY < y) {
    double MinY = y;
  }
  if (MaxY <= MinY) {
    double v23 = MaxY;
  }
  else {
    double v23 = MinY;
  }
  [v13 referenceLocation];
  double v25 = v24;
  double v27 = v26;
  int64_t spineLocation = self->_spineLocation;
  uint64_t v29 = [v13 transitionDirection];
  uint64_t v30 = v29;
  CGFloat v32 = self->_contentRect.origin.x;
  CGFloat v31 = self->_contentRect.origin.y;
  CGFloat v34 = self->_contentRect.size.width;
  CGFloat v33 = self->_contentRect.size.height;
  if (spineLocation)
  {
    double v40 = CGRectGetMinX(self->_contentRect);
    v115.origin.double x = v32;
    v115.origin.double y = v31;
    v115.size.CGFloat width = v34;
    v115.size.CGFloat height = v33;
    double v25 = v40 - CGRectGetWidth(v115);
  }
  else
  {
    if (spineLocation == 4)
    {
      CGFloat v35 = self->_contentRect.origin.x;
      CGFloat v36 = self->_contentRect.origin.y;
      CGFloat v37 = self->_contentRect.size.width;
      CGFloat v38 = self->_contentRect.size.height;
      if (v29) {
        double v39 = CGRectGetMaxX(*(CGRect *)&v35);
      }
      else {
        double v39 = CGRectGetMinX(*(CGRect *)&v35);
      }
      double v25 = v39;
      goto LABEL_30;
    }
    if ((spineLocation & 0x10) != 0)
    {
      double v41 = CGRectGetMaxX(self->_contentRect);
      v116.origin.double x = v32;
      v116.origin.double y = v31;
      v116.size.CGFloat width = v34;
      v116.size.CGFloat height = v33;
      double v25 = v41 + CGRectGetWidth(v116);
    }
  }
  if (spineLocation == 3 || (spineLocation & 2) == 0)
  {
    if (spineLocation == 8)
    {
      CGFloat v43 = v32;
      CGFloat v44 = v31;
      CGFloat v45 = v34;
      CGFloat v46 = v33;
      if (v30) {
        double v47 = CGRectGetMaxY(*(CGRect *)&v43);
      }
      else {
        double v47 = CGRectGetMinY(*(CGRect *)&v43);
      }
      double v27 = v47;
    }
    else if ((spineLocation & 0x20) != 0)
    {
      v119.origin.double x = v32;
      v119.origin.double y = v31;
      v119.size.CGFloat width = v34;
      v119.size.CGFloat height = v33;
      double v48 = CGRectGetMaxY(v119);
      v120.origin.double x = v32;
      v120.origin.double y = v31;
      v120.size.CGFloat width = v34;
      v120.size.CGFloat height = v33;
      double v27 = v48 + CGRectGetHeight(v120);
    }
  }
  else
  {
    v117.origin.double x = v32;
    v117.origin.double y = v31;
    v117.size.CGFloat width = v34;
    v117.size.CGFloat height = v33;
    double v42 = CGRectGetMinY(v117);
    v118.origin.double x = v32;
    v118.origin.double y = v31;
    v118.size.CGFloat width = v34;
    v118.size.CGFloat height = v33;
    double v27 = v42 - CGRectGetHeight(v118);
  }
LABEL_30:
  [(_UIPageCurl *)self _distanceToTravelWithCurrentSpineLocation];
  double v50 = v49;
  unint64_t v51 = self->_spineLocation;
  double v107 = v27;
  if (v51 > 0x20) {
    goto LABEL_110;
  }
  if (((1 << v51) & 0x1001A) == 0)
  {
    if (((1 << v51) & 0x100000104) != 0)
    {
      double v52 = v23 - v27;
      goto LABEL_35;
    }
LABEL_110:
    double v53 = sqrt((v25 - v20) * (v25 - v20) + (v27 - v23) * (v27 - v23));
    goto LABEL_38;
  }
  double v52 = v20 - v25;
LABEL_35:
  if (v52 < 0.0) {
    double v52 = -v52;
  }
  double v53 = v52 / v50;
LABEL_38:
  double v54 = 0.0;
  double v55 = fmax(v53, 0.0);
  if (v55 >= 1.0) {
    double v56 = 0.0;
  }
  else {
    double v56 = 1.0 - v55;
  }
  if ([v13 curlType] != 1 && objc_msgSend(v13, "curlType") != 4) {
    double v54 = 0.1;
  }
  if ([v13 curlType] == 1)
  {
    int64_t v57 = self->_spineLocation;
LABEL_52:
    double v99 = 1.0;
    goto LABEL_53;
  }
  uint64_t v58 = [v13 curlType];
  int64_t v57 = self->_spineLocation;
  if (v58 == 4) {
    goto LABEL_52;
  }
  if (v57 == 8 || v57 == 4) {
    goto LABEL_52;
  }
  double v99 = 0.9;
LABEL_53:
  double v106 = v25;
  if (v57 != 4 && (v57 & 0x11) == 0)
  {
    if (v57 == 2 || v57 == 8 && ![v13 transitionDirection])
    {
      double v72 = CGRectGetMaxY(self->_contentRect) - v50 * v54;
      if (v23 <= v72) {
        double v73 = v23;
      }
      else {
        double v73 = v72;
      }
      objc_msgSend(v13, "referenceLocation", *(void *)&v99);
      long double v75 = v74 - v20;
      [v13 referenceLocation];
      double v77 = atan2(v75, v73 - v76) + 1.57079633;
      if (v77 >= 0.0) {
        double v66 = v77;
      }
      else {
        double v66 = v77 + 6.28318531;
      }
    }
    else
    {
      double v60 = v50 * v54 + CGRectGetMinY(self->_contentRect);
      if (v23 >= v60) {
        double v61 = v23;
      }
      else {
        double v61 = v60;
      }
      objc_msgSend(v13, "referenceLocation", *(void *)&v99);
      long double v63 = v20 - v62;
      [v13 referenceLocation];
      double v65 = atan2(v63, v64 - v61) + 4.71238898;
      if (v65 + -6.28318531 <= 0.0) {
        double v66 = v65;
      }
      else {
        double v66 = v65 + -6.28318531;
      }
    }
    goto LABEL_83;
  }
  if (v57 == 1) {
    goto LABEL_69;
  }
  if (v57 == 4)
  {
    if (![v13 transitionDirection])
    {
LABEL_69:
      double v67 = CGRectGetMaxX(self->_contentRect) - v50 * v54;
      if (v20 <= v67) {
        double v68 = v20;
      }
      else {
        double v68 = v67;
      }
      objc_msgSend(v13, "referenceLocation", *(void *)&v99);
      long double v70 = v69 - v23;
      [v13 referenceLocation];
      double v66 = atan2(v70, v71 - v68) + 3.14159265;
      goto LABEL_83;
    }
    int64_t v57 = self->_spineLocation;
  }
  if (v57 == 3) {
    goto LABEL_69;
  }
  double v78 = v50 * v54 + CGRectGetMinX(self->_contentRect);
  if (v20 >= v78) {
    double v79 = v20;
  }
  else {
    double v79 = v78;
  }
  objc_msgSend(v13, "referenceLocation", *(void *)&v99);
  long double v81 = v23 - v80;
  [v13 referenceLocation];
  double v66 = atan2(v81, v79 - v82);
LABEL_83:
  [(_UIPageCurl *)self _baseAngleOffsetForState:v13];
  double v84 = v83;
  double manualPageCurlMaxDAngle = self->_manualPageCurlMaxDAngle;
  double v86 = -manualPageCurlMaxDAngle;
  if (v66 - v84 > -manualPageCurlMaxDAngle) {
    double v86 = v66 - v84;
  }
  if (manualPageCurlMaxDAngle <= v86) {
    double v87 = self->_manualPageCurlMaxDAngle;
  }
  else {
    double v87 = v86;
  }
  double v109 = 0.0;
  double v110 = 0.0;
  [(_UIPageCurl *)self _fromValue:&v110 toValue:&v109 fromState:v13 forAnimationWithKeyPath:@"filters.curl.inputRadius"];
  [v13 curlType];
  int64_t v88 = self->_spineLocation;
  double v89 = v50 * 0.152439024;
  BOOL v90 = v88 == 4 || v88 == 8;
  int v91 = v90;
  double v92 = 0.25;
  if (v90) {
    double v92 = 0.5;
  }
  if (v56 >= v92)
  {
    double v94 = 0.304878049;
    if (v91) {
      double v94 = 0.00101626016;
    }
    double v93 = v89 + (v56 - v92) / (1.0 - v92) * (v50 * v94 - v89);
  }
  else
  {
    double v93 = v110 + v56 / v92 * (v89 - v110);
  }
  if ([v13 curlType] == 1 || objc_msgSend(v13, "curlType") == 4)
  {
    if (v109 <= v110) {
      double v95 = v109;
    }
    else {
      double v95 = v110;
    }
    int64_t v96 = self->_spineLocation;
  }
  else
  {
    unint64_t v97 = self->_spineLocation;
    if (v97 <= 0x20 && ((1 << v97) & 0x100000104) != 0) {
      double v98 = CGRectGetHeight(self->_contentRect);
    }
    else {
      double v98 = CGRectGetWidth(self->_contentRect);
    }
    int64_t v96 = self->_spineLocation;
    if (v96 == 8 || v96 == 4) {
      double v98 = v98 * 0.5;
    }
    double v95 = v98 * 0.0879120879;
  }
  double v100 = v84 + v87;
  if (v96 == 8 || v96 == 4)
  {
    double v101 = sqrt((v106 - v20) * (v106 - v20) + (v107 - v23) * (v107 - v23)) / v50;
    if (v101 <= 0.25) {
      double v102 = (0.25 - v101) * -4.0 + 1.0;
    }
    else {
      double v102 = 1.0;
    }
    double v95 = v102 * v95;
  }
  double v103 = v110;
  if (v110 > v109) {
    double v103 = v109;
  }
  if (v103 > v95) {
    double v103 = v95;
  }
  if (v103 < v93) {
    double v103 = v93;
  }
  if (v50 * 0.2 <= v103) {
    double v103 = v50 * 0.2;
  }
  double v108 = v103;
  -[_UIPageCurl _inputTimeForProgress:distanceToTravel:radius:minRadius:angle:dAngle:touchLocation:state:](self, "_inputTimeForProgress:distanceToTravel:radius:minRadius:angle:dAngle:touchLocation:state:", &v108, v13, v56, v50);
  if (a5)
  {
    if (v54 >= v104) {
      double v104 = v54;
    }
    if (v105 <= v104) {
      double v104 = v105;
    }
    *a5 = v104;
  }
  if (a6) {
    *a6 = v108;
  }
  if (a7) {
    *a7 = v100;
  }
}

- (id)_animationKeyPaths
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"filters.curl.inputTime", @"filters.curl.inputRadius", @"filters.curl.inputAngle", 0);
}

- (void)_updateCurlFromState:(id)a3 withTime:(double)a4 radius:(double)a5 angle:(double)a6 addingAnimations:(id)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  id v14 = objc_alloc(MEMORY[0x1E4F1C978]);
  CGFloat v15 = [v12 frontPageView];
  uint64_t v16 = [v15 layer];
  double v17 = [v12 backPageView];
  uint64_t v18 = [v17 layer];
  double v19 = objc_msgSend(v14, "initWithObjects:", v16, v18, 0);

  CGFloat v38 = v13;
  uint64_t v20 = [v13 count];
  CGFloat v37 = [(_UIPageCurl *)self _animationKeyPaths];
  [MEMORY[0x1E4F39CF8] activate];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v19;
  uint64_t v42 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v42)
  {
    id v21 = v13;
    if (!v20) {
      id v21 = v37;
    }
    double v40 = v21;
    uint64_t v41 = *(void *)v51;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v51 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = v22;
        double v23 = *(void **)(*((void *)&v50 + 1) + 8 * v22);
        id v24 = v40;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v44 = v24;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v45 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v47 != v45) {
                objc_enumerationMutation(v44);
              }
              double v28 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              if (v20)
              {
                id v29 = [*(id *)(*((void *)&v46 + 1) + 8 * i) keyPath];
              }
              else
              {
                id v29 = v28;
              }
              uint64_t v30 = v29;
              CGFloat v31 = _UIPageCurlFilterPropertyNameForAnimationKeyPath(v29);
              char v32 = [v30 isEqualToString:@"filters.curl.inputTime"];
              double v33 = a4;
              if ((v32 & 1) == 0)
              {
                if (objc_msgSend(v30, "isEqualToString:", @"filters.curl.inputRadius", a4)) {
                  double v33 = a5;
                }
                else {
                  double v33 = a6;
                }
              }
              *(float *)&double v33 = v33;
              CGFloat v34 = [NSNumber numberWithFloat:v33];
              if (v20)
              {
                id v35 = v28;
                if ([v12 curlState] == 1 || objc_msgSend(v12, "curlState") == 5) {
                  [v35 setToValue:v34];
                }
                [v23 addAnimation:v35 forKey:v31];
                if ([v12 curlState] == 1
                  || [v12 curlState] == 3
                  || [v12 curlState] == 5)
                {
                  id v36 = [v35 delegate];

                  if (v36 == v12) {
                    [v12 incrementCompletionCount];
                  }
                }
              }
              [v23 setValue:v34 forKeyPath:v30];
            }
            uint64_t v26 = [v44 countByEnumeratingWithState:&v46 objects:v54 count:16];
          }
          while (v26);
        }

        uint64_t v22 = v43 + 1;
      }
      while (v43 + 1 != v42);
      uint64_t v42 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v42);
  }
}

- (CGPoint)_referenceLocationForInitialLocation:(CGPoint)a3 direction:(int64_t)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  int64_t spineLocation = self->_spineLocation;
  if (spineLocation > 2)
  {
    if ((unint64_t)(spineLocation - 3) >= 2 && spineLocation != 16) {
      goto LABEL_29;
    }
    if (a4) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = spineLocation == 4;
    }
    int v11 = v10;
    if (spineLocation != 3 && v11 == 0)
    {
      BOOL v14 = a4 == 1 && spineLocation == 4;
      if (spineLocation != 16 && !v14)
      {
        CGFloat v15 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v16 = v15;
        SEL v17 = a2;
        uint64_t v18 = self;
        uint64_t v19 = 1022;
        goto LABEL_45;
      }
      double MinX = CGRectGetMinX(self->_contentRect);
LABEL_35:
      CGFloat x = MinX;
      goto LABEL_46;
    }
LABEL_33:
    double MinX = CGRectGetMaxX(self->_contentRect);
    goto LABEL_35;
  }
  if (spineLocation == 1) {
    goto LABEL_33;
  }
  if (spineLocation != 2)
  {
LABEL_29:
    if (!a4 && spineLocation == 8) {
      goto LABEL_31;
    }
    BOOL v23 = a4 == 1 && spineLocation == 8;
    if (spineLocation == 32 || v23)
    {
      double MinY = CGRectGetMinY(self->_contentRect);
      goto LABEL_32;
    }
    CGFloat v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = v15;
    SEL v17 = a2;
    uint64_t v18 = self;
    uint64_t v19 = 1030;
LABEL_45:
    [v15 handleFailureInMethod:v17 object:v18 file:@"_UIPageCurl.m" lineNumber:v19 description:@"Not implemented yet!"];

    goto LABEL_46;
  }
LABEL_31:
  double MinY = CGRectGetMaxY(self->_contentRect);
LABEL_32:
  CGFloat y = MinY;
LABEL_46:
  double v24 = x;
  double v25 = y;
  result.CGFloat y = v25;
  result.CGFloat x = v24;
  return result;
}

- (int64_t)_validatedPageCurlTypeForPageCurlType:(int64_t)a3 inDirection:(int64_t)a4
{
  if (a4)
  {
    if (a4 != 1 || (unint64_t)(self->_spineLocation - 1) >= 3) {
      return a3;
    }
    goto LABEL_10;
  }
  int64_t spineLocation = self->_spineLocation;
  if (spineLocation == 32 || spineLocation == 16)
  {
LABEL_10:
    if (a3 == 4 || a3 == 1) {
      return 4;
    }
    else {
      return 3;
    }
  }
  return a3;
}

- (BOOL)_isPreviousCurlCompatibleWithCurlOfType:(int64_t)a3 inDirection:(int64_t)a4
{
  id v7 = [(NSMutableArray *)self->_activeStateQueue lastObject];
  double v8 = v7;
  if (self->_manualPageCurlState)
  {
    char v9 = 0;
  }
  else if (v7)
  {
    char v9 = objc_msgSend(v7, "isCompatibleWithCurlOfType:inDirection:", -[_UIPageCurl _validatedPageCurlTypeForPageCurlType:inDirection:](self, "_validatedPageCurlTypeForPageCurlType:inDirection:", a3, a4), a4);
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)_enqueueCurlOfType:(int64_t)a3 fromLocation:(CGPoint)a4 inDirection:(int64_t)a5 withView:(id)a6 revealingView:(id)a7 completion:(id)a8 finally:(id)a9
{
  double y = a4.y;
  double x = a4.x;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (v18)
  {
    int64_t v22 = [(_UIPageCurl *)self _validatedPageCurlTypeForPageCurlType:a3 inDirection:a5];
    int64_t v23 = v22;
    if (v22 == 4 || v22 == 1)
    {
      double v24 = -[_UIPageCurlState initWithPageCurl:andCurlType:fromLocation:withReferenceLocation:inDirection:withView:revealingView:completion:finally:]([_UIPageCurlState alloc], "initWithPageCurl:andCurlType:fromLocation:withReferenceLocation:inDirection:withView:revealingView:completion:finally:", self, v22, a5, v18, v19, v20, x, y, x, y, v21);
      if (!v24) {
        goto LABEL_15;
      }
    }
    else
    {
      if ([(NSMutableArray *)self->_pendingStateQueue count]) {
        goto LABEL_15;
      }
      if (self->_manualPageCurlState) {
        goto LABEL_15;
      }
      -[_UIPageCurl _referenceLocationForInitialLocation:direction:](self, "_referenceLocationForInitialLocation:direction:", a5, x, y);
      double v24 = -[_UIPageCurlState initWithPageCurl:andCurlType:fromLocation:withReferenceLocation:inDirection:withView:revealingView:completion:finally:]([_UIPageCurlState alloc], "initWithPageCurl:andCurlType:fromLocation:withReferenceLocation:inDirection:withView:revealingView:completion:finally:", self, v23, a5, v18, v19, v20, x, y, v36, v37, v21);
      objc_storeStrong((id *)&self->_manualPageCurlState, v24);
      if (!v24) {
        goto LABEL_15;
      }
    }
    if ([(NSMutableArray *)self->_activeStateQueue count]
      || [(NSMutableArray *)self->_pendingStateQueue count])
    {
      if (![(NSMutableArray *)self->_pendingStateQueue count]
        && [(NSMutableArray *)self->_activeStateQueue count]
        && ([(NSMutableArray *)self->_activeStateQueue lastObject],
            double v25 = objc_claimAutoreleasedReturnValue(),
            int v26 = objc_msgSend(v25, "isCompatibleWithCurlOfType:inDirection:", -[_UIPageCurlState curlType](v24, "curlType"), -[_UITransitionState effectiveTransitionDirection](v24, "effectiveTransitionDirection")), v25, v26))
      {
        double v27 = [(NSMutableArray *)self->_activeStateQueue lastObject];
        [(NSMutableArray *)self->_activeStateQueue _ui_enqueue:v24];
        double delayBetweenSuccessiveAnimations = self->_delayBetweenSuccessiveAnimations;
        id v29 = [v27 beginDate];
        [v29 timeIntervalSinceNow];
        double v31 = delayBetweenSuccessiveAnimations + v30;

        double v32 = v31 * 1000000000.0;
        if (v31 <= 0.0) {
          double v32 = 0.0;
        }
        dispatch_time_t v33 = dispatch_time(0, (uint64_t)v32);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __101___UIPageCurl__enqueueCurlOfType_fromLocation_inDirection_withView_revealingView_completion_finally___block_invoke;
        block[3] = &unk_1E52DCB30;
        block[4] = self;
        double v40 = v24;
        id v41 = v27;
        id v34 = v27;
        id v35 = v24;
        dispatch_after(v33, MEMORY[0x1E4F14428], block);
      }
      else
      {
        if ([(_UIPageCurlState *)v24 curlType] != 1 && [(_UIPageCurlState *)v24 curlType] != 4)
        {
          CGFloat v38 = [MEMORY[0x1E4F28B00] currentHandler];
          [v38 handleFailureInMethod:a2 object:self file:@"_UIPageCurl.m" lineNumber:1082 description:@"Attempting to enqueue a manual curl as a pending state"];
        }
        [(NSMutableArray *)self->_pendingStateQueue _ui_enqueue:v24];
      }
    }
    else
    {
      [(NSMutableArray *)self->_activeStateQueue _ui_enqueue:v24];
      [(_UIPageCurl *)self _beginCurlWithState:v24 previousState:0];
    }
  }
LABEL_15:
}

- (void)_cleanupState:(id)a3
{
}

- (void)_forceCleanupState:(id)a3 finished:(BOOL)a4 completed:(BOOL)a5
{
}

- (void)_cancelTransitionWithState:(id)a3 invalidatingPageCurl:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if (v4) {
      [v6 invalidatePageCurl];
    }
    if ([v7 curlType] == 1)
    {
      uint64_t v8 = 1;
    }
    else if ([v7 curlType] == 4)
    {
      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v8 = 5;
    }
    [v7 setCurlState:v8 willComplete:0];
    id v9 = objc_alloc(MEMORY[0x1E4F1C978]);
    BOOL v10 = [v7 frontPageView];
    int v11 = [v10 layer];
    int v26 = v7;
    id v12 = [v7 backPageView];
    id v13 = [v12 layer];
    BOOL v14 = objc_msgSend(v9, "initWithObjects:", v11, v13, 0);

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v14;
    uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v20 = [(_UIPageCurl *)self _animationKeyPaths];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v29 != v23) {
                  objc_enumerationMutation(v20);
                }
                double v25 = _UIPageCurlFilterPropertyNameForAnimationKeyPath(*(void **)(*((void *)&v28 + 1) + 8 * j));
                [v19 removeAnimationForKey:v25];
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }
            while (v22);
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v16);
    }

    id v7 = v26;
  }
}

- (void)_cancelAllActiveTransitionsAndAbandonCallbacks:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[_UIPageCurl _abortManualCurlAtLocation:withSuggestedVelocity:](self, "_abortManualCurlAtLocation:withSuggestedVelocity:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 0.0);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_activeStateQueue;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        -[_UIPageCurl _cancelTransitionWithState:invalidatingPageCurl:](self, "_cancelTransitionWithState:invalidatingPageCurl:", v10, v3, (void)v11);
        if (v3) {
          [v10 finally];
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_pendingStateQueue removeAllObjects];
}

- (void)_beginCurlWithState:(id)a3 previousState:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [v6 frontPageView];
    uint64_t v9 = [v6 backPageView];
    if ([v7 isActive])
    {
      BOOL v10 = [v7 frontPageView];
      uint64_t v11 = [v6 curlType];
      contentView = self->_contentView;
      if (v11 > 2) {
        [(UIView *)contentView insertSubview:v8 aboveSubview:v10];
      }
      else {
        [(UIView *)contentView insertSubview:v8 belowSubview:v10];
      }
      [v6 addFrontPageContent];
      if (v9)
      {
        long long v13 = [v7 backPageView];
        uint64_t v14 = [v6 curlType];
        uint64_t v15 = self->_contentView;
        if (v14 > 2) {
          [(UIView *)v15 insertSubview:v9 belowSubview:v13];
        }
        else {
          [(UIView *)v15 insertSubview:v9 aboveSubview:v13];
        }
        [v6 addBackPageContent];
      }
    }
    else
    {
      [(UIView *)self->_contentView addSubview:v8];
      [v6 addFrontPageContent];
      if (v9)
      {
        [(UIView *)self->_contentView insertSubview:v9 aboveSubview:v8];
        [v6 addBackPageContent];
      }
    }
    if ([v6 curlState] == 2) {
      [v6 setCurlState:3 willComplete:0];
    }
    id v38 = v7;
    if (objc_msgSend(v6, "curlState", v9) == 3) {
      double v16 = 0.25;
    }
    else {
      double v16 = 0.4;
    }
    if ([v6 curlType] != 1 && objc_msgSend(v6, "curlType") != 4)
    {
      [v8 frame];
      long double v19 = v17;
      long double v20 = v18;
      int64_t spineLocation = self->_spineLocation;
      if (spineLocation == 4 || (spineLocation & 0x11) != 0)
      {
        long double v22 = v18;
        long double v23 = v17;
      }
      else
      {
        long double v22 = v17;
        long double v23 = v18;
      }
      self->_pageDiagonalAngle = atan2(v22, v23);
      self->_double pageDiagonalLength = hypot(v19, v20);
    }
    double v37 = v8;
    double v24 = [(_UIPageCurl *)self _animationKeyPaths];
    double v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v24, "count"));
    double v45 = 0.0;
    double v46 = 0.0;
    double v44 = 0.0;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v26 = v24;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v41 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          double v39 = 0.0;
          if ([v6 curlType] == 1 || objc_msgSend(v6, "curlType") == 4)
          {
            if ([v31 isEqualToString:@"filters.curl.inputTime"])
            {
              long long v32 = &v46;
            }
            else if ([v31 isEqualToString:@"filters.curl.inputRadius"])
            {
              long long v32 = &v45;
            }
            else
            {
              long long v32 = &v44;
            }
          }
          else
          {
            [v6 initialLocation];
            -[_UIPageCurl _updatedInputsFromState:forLocation:time:radius:angle:](self, "_updatedInputsFromState:forLocation:time:radius:angle:", v6, &v46, &v45, &v44);
            long long v32 = 0;
          }
          [(_UIPageCurl *)self _fromValue:&v39 toValue:v32 fromState:v6 forAnimationWithKeyPath:v31];
          HIDWORD(v33) = HIDWORD(v39);
          *(float *)&double v33 = v39;
          long long v34 = [NSNumber numberWithFloat:v33];
          id v35 = [(_UIPageCurl *)self _newAnimationForState:v6 withKeyPath:v31 duration:v34 fromValue:v16];

          [v25 addObject:v35];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v28);
    }

    [v6 markBeginDate];
    [(_UIPageCurl *)self _updateCurlFromState:v6 withTime:v25 radius:v46 angle:v45 addingAnimations:v44];
    if (([v6 curlType] == 1 || objc_msgSend(v6, "curlType") == 4)
      && ([v6 hasPendingAnimations] & 1) == 0)
    {
      [(_UIPageCurl *)self _forceCleanupState:v6 finished:1 completed:1];
    }

    id v7 = v38;
  }
}

- (void)_updateManualCurlToLocation:(CGPoint)a3
{
  manualPageCurlState = self->_manualPageCurlState;
  if (manualPageCurlState)
  {
    double y = a3.y;
    double x = a3.x;
    if ([(_UIPageCurlState *)manualPageCurlState curlState] <= 4)
    {
      double v8 = 0.0;
      double v9 = 0.0;
      double v7 = 0.0;
      -[_UIPageCurl _updatedInputsFromState:forLocation:time:radius:angle:](self, "_updatedInputsFromState:forLocation:time:radius:angle:", self->_manualPageCurlState, &v9, &v8, &v7, x, y);
      [(_UIPageCurl *)self _updateCurlFromState:self->_manualPageCurlState withTime:0 radius:v9 angle:v8 addingAnimations:v7];
    }
  }
}

- (double)_durationForManualCurlEndAnimationWithSuggestedVelocity:(double)a3 shouldComplete:(BOOL)a4
{
  if (a3 == 0.0) {
    return 0.25;
  }
  uint64_t v27 = v12;
  uint64_t v28 = v5;
  uint64_t v29 = v4;
  BOOL v16 = a4;
  if (a3 < 0.0) {
    a3 = -a3;
  }
  double v18 = fmin(fmax(a3, 2048.0), 4096.0);
  long double v19 = [(_UIPageCurlState *)self->_manualPageCurlState frontPageView];
  long double v20 = [v19 layer];
  uint64_t v21 = [v20 presentationLayer];
  long double v22 = [v21 valueForKeyPath:@"filters.curl.inputTime"];
  [v22 floatValue];
  double v24 = v23;

  if (v16) {
    double v24 = 1.0 - v24;
  }
  if ([(_UIPageCurlState *)self->_manualPageCurlState curlType] > 2) {
    double v24 = 1.0 - v24;
  }
  [(_UIPageCurl *)self _distanceToTravelWithCurrentSpineLocation];
  return v25 * v24 / v18;
}

- (void)_endManualCurlAtLocation:(CGPoint)a3 withSuggestedVelocity:(double)a4 shouldComplete:(BOOL)a5
{
  BOOL v33 = a5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  manualPageCurlState = self->_manualPageCurlState;
  if (manualPageCurlState && [(_UIPageCurlState *)manualPageCurlState curlState] <= 4)
  {
    [(_UIPageCurlState *)self->_manualPageCurlState setCurlState:5 willComplete:v33];
    double v39 = 0.0;
    double v40 = 0.0;
    double v38 = 0.0;
    uint64_t v8 = [(_UIPageCurl *)self _animationKeyPaths];
    long long v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    [(_UIPageCurl *)self _durationForManualCurlEndAnimationWithSuggestedVelocity:v33 shouldComplete:a4];
    double v10 = v9;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v8;
    uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v35;
      uint64_t v30 = *MEMORY[0x1E4F3A480];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          char v16 = objc_msgSend(v15, "isEqualToString:", @"filters.curl.inputTime", v30);
          if (v33)
          {
            if (v16)
            {
              double v17 = 0;
              double v18 = &v40;
            }
            else
            {
              int v19 = [v15 isEqualToString:@"filters.curl.inputRadius"];
              double v17 = 0;
              if (v19) {
                double v18 = &v39;
              }
              else {
                double v18 = &v38;
              }
            }
          }
          else if (v16)
          {
            double v18 = 0;
            double v17 = &v40;
          }
          else
          {
            int v20 = [v15 isEqualToString:@"filters.curl.inputRadius"];
            double v18 = 0;
            if (v20) {
              double v17 = &v39;
            }
            else {
              double v17 = &v38;
            }
          }
          [(_UIPageCurl *)self _fromValue:v17 toValue:v18 fromState:self->_manualPageCurlState forAnimationWithKeyPath:v15];
          uint64_t v21 = self->_manualPageCurlState;
          long double v22 = [(_UIPageCurlState *)v21 frontPageView];
          float v23 = [v22 layer];
          double v24 = [v23 presentationLayer];
          double v25 = [v24 valueForKeyPath:v15];
          id v26 = [(_UIPageCurl *)self _newAnimationForState:v21 withKeyPath:v15 duration:v25 fromValue:v10];

          if ([v15 isEqualToString:@"filters.curl.inputAngle"])
          {
            uint64_t v27 = [MEMORY[0x1E4F39C10] functionWithName:v30];
            [v26 setTimingFunction:v27];
          }
          [v32 addObject:v26];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v12);
    }

    uint64_t v28 = self->_manualPageCurlState;
    self->_manualPageCurlState = 0;
    uint64_t v29 = v28;

    [(_UITransitionState *)v29 markBeginDate];
    [(_UIPageCurl *)self _updateCurlFromState:v29 withTime:v32 radius:v40 angle:v39 addingAnimations:v38];
  }
}

- (void)_completeManualCurlAtLocation:(CGPoint)a3 withSuggestedVelocity:(double)a4
{
}

- (void)_abortManualCurlAtLocation:(CGPoint)a3 withSuggestedVelocity:(double)a4
{
}

- (void)_pageCurlAnimationDidStop:(id)a3 withState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    char v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_UIPageCurl.m", 1252, @"Invalid parameter not satisfying: %@", @"state" object file lineNumber description];
  }
  if (![(NSMutableArray *)self->_activeStateQueue count])
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_UIPageCurl.m", 1253, @"Received CA callback for state, but active state queue is empty" object file lineNumber description];
  }
  if (([v8 hasPendingAnimations] & 1) == 0
    && ([v8 curlType] == 1 || objc_msgSend(v8, "curlType") == 4 || objc_msgSend(v8, "curlState") == 5))
  {
    [(NSMutableSet *)self->_completedStates addObject:v8];
    completedStates = self->_completedStates;
    double v10 = [(NSMutableArray *)self->_activeStateQueue _ui_peek];
    LODWORD(completedStates) = [(NSMutableSet *)completedStates containsObject:v10];

    if (completedStates)
    {
      do
      {
        uint64_t v11 = [(NSMutableArray *)self->_activeStateQueue _ui_dequeue];
        [(_UIPageCurl *)self _cleanupState:v11];
        [(NSMutableSet *)self->_completedStates removeObject:v11];

        uint64_t v12 = self->_completedStates;
        uint64_t v13 = [(NSMutableArray *)self->_activeStateQueue _ui_peek];
        LOBYTE(v12) = [(NSMutableSet *)v12 containsObject:v13];
      }
      while ((v12 & 1) != 0);
    }
    if (![(NSMutableArray *)self->_activeStateQueue count]
      && [(NSMutableArray *)self->_pendingStateQueue count])
    {
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x3032000000;
      v21[3] = __Block_byref_object_copy__54;
      v21[4] = __Block_byref_object_dispose__54;
      id v22 = 0;
      uint64_t v14 = (void *)[(NSMutableArray *)self->_pendingStateQueue copy];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __51___UIPageCurl__pageCurlAnimationDidStop_withState___block_invoke;
      v18[3] = &unk_1E52E8FC0;
      int v20 = v21;
      v18[4] = self;
      id v15 = v14;
      id v19 = v15;
      [v15 enumerateObjectsUsingBlock:v18];

      _Block_object_dispose(v21, 8);
    }
  }
}

- (int64_t)_spineLocation
{
  return self->_spineLocation;
}

- (double)_manualPageCurlMaxDAngle
{
  return self->_manualPageCurlMaxDAngle;
}

- (void)_setManualPageCurlMaxDAngle:(double)a3
{
  self->_double manualPageCurlMaxDAngle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedStates, 0);
  objc_storeStrong((id *)&self->_activeStateQueue, 0);
  objc_storeStrong((id *)&self->_pendingStateQueue, 0);
  objc_storeStrong((id *)&self->_manualPageCurlState, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end