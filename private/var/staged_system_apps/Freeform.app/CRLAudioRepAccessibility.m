@interface CRLAudioRepAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_isInQuickSelectMode;
- (BOOL)accessibilityActivate;
- (BOOL)crlaxCanPlay;
- (BOOL)crlaxIsPlaying;
- (BOOL)crlaxShouldExposeAsAttachmentToken;
- (BOOL)crlaxSupportsPublicCustomRotors;
- (BOOL)isAccessibilityElement;
- (CGPoint)_accessibilityVisiblePoint;
- (CGRect)_accessibilityFrameOfPlayPauseButton;
- (CRLAVPlayerControllerAccessibility)crlaxPlayerControllerForcingCreationIfNotPreExisting;
- (CRLMovieItemAccessibility)_crlaxMovieInfo;
- (NSString)crlaxLabel;
- (NSString)crlaxValue;
- (id)accessibilityHint;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
- (void)crlaxTogglePlayback;
@end

@implementation CRLAudioRepAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLAudioRep";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (NSString)crlaxLabel
{
  id v3 = [(CRLAudioRepAccessibility *)self crlaxTarget];
  v4 = [v3 movieItem];

  v5 = [v4 accessibilityDescription];
  v6 = [v4 title];
  v7 = [v4 creator];
  v8 = [v4 localizedName];
  v9 = [(CRLAudioRepAccessibility *)self _crlaxMovieInfo];
  v10 = [v9 crlaxDurationDescription];

  if (![v6 length])
  {
    v17 = [v4 movieAssetPayload];
    uint64_t v18 = [v17 filename];

    v6 = (void *)v18;
  }
  v19 = __CRLAccessibilityStringForVariables(1, v5, v11, v12, v13, v14, v15, v16, (uint64_t)v6);

  return (NSString *)v19;
}

- (NSString)crlaxValue
{
  if ([(CRLAudioRepAccessibility *)self crlaxIsPlaying])
  {
    v2 = +[NSBundle mainBundle];
    id v3 = [v2 localizedStringForKey:@"playing" value:0 table:0];
  }
  else
  {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)crlaxShouldExposeAsAttachmentToken
{
  return 1;
}

- (CRLAVPlayerControllerAccessibility)crlaxPlayerControllerForcingCreationIfNotPreExisting
{
  char v8 = 0;
  v2 = [(CRLAudioRepAccessibility *)self crlaxTarget];
  id v3 = [v2 playerControllerForcingCreationIfNotPreExisting];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLAVPlayerControllerAccessibility *)v6;
}

- (BOOL)crlaxCanPlay
{
  v2 = [(CRLAudioRepAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isPlayable];

  return v3;
}

- (BOOL)crlaxIsPlaying
{
  v2 = [(CRLAudioRepAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isPlaying];

  return v3;
}

- (void)crlaxTogglePlayback
{
  id v2 = [(CRLAudioRepAccessibility *)self crlaxTarget];
  [v2 i_togglePlayback];
}

- (id)accessibilityUserInputLabels
{
  unsigned __int8 v3 = +[NSMutableArray array];
  v4 = [(CRLAudioRepAccessibility *)self crlaxTarget];
  uint64_t v5 = [v4 movieItem];

  v6 = [v5 accessibilityDescription];
  v7 = [v5 title];
  if ([v6 length]) {
    [v3 addObject:v6];
  }
  if ([v7 length]) {
    [v3 addObject:v7];
  }
  id v8 = [v3 copy];

  return v8;
}

- (CRLMovieItemAccessibility)_crlaxMovieInfo
{
  char v8 = 0;
  id v2 = [(CRLAudioRepAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 movieItem];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLMovieItemAccessibility *)v6;
}

- (BOOL)crlaxSupportsPublicCustomRotors
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CRLAudioRepAccessibility;
  return UIAccessibilityTraitStartsMediaSession | [(CRLCanvasRepAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityHint
{
  v11.receiver = self;
  v11.super_class = (Class)CRLAudioRepAccessibility;
  objc_super v3 = [(CRLCanvasRepAccessibility *)&v11 accessibilityHint];
  if (![(CRLAudioRepAccessibility *)self _isInQuickSelectMode]
    && [(CRLCanvasRepAccessibility *)self crlaxIsSelected])
  {
    v4 = [(CRLAudioRepAccessibility *)self crlaxTarget];
    unsigned int v5 = [v4 i_playButtonFitsInFrame];

    if (v5)
    {
      if ([(CRLAudioRepAccessibility *)self crlaxIsPlaying])
      {
        v6 = +[NSBundle mainBundle];
        v7 = v6;
        CFStringRef v8 = @"Double tap to pause audio.";
      }
      else
      {
        if (![(CRLAudioRepAccessibility *)self crlaxCanPlay]) {
          goto LABEL_10;
        }
        v6 = +[NSBundle mainBundle];
        v7 = v6;
        CFStringRef v8 = @"Double tap to play audio.";
      }
    }
    else
    {
      v6 = +[NSBundle mainBundle];
      v7 = v6;
      CFStringRef v8 = @"Double tap to show full-screen preview";
    }
    uint64_t v9 = [v6 localizedStringForKey:v8 value:0 table:0];

    objc_super v3 = (void *)v9;
  }
LABEL_10:

  return v3;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  v4.receiver = self;
  v4.super_class = (Class)CRLAudioRepAccessibility;
  if ([(CRLCanvasRepAccessibility *)&v4 _accessibilitySupportsActivateAction]) {
    return 1;
  }
  else {
    return [(CRLAudioRepAccessibility *)self crlaxCanPlay];
  }
}

- (BOOL)accessibilityActivate
{
  if (![(CRLAudioRepAccessibility *)self _isInQuickSelectMode])
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLAudioRepAccessibility;
    if (![(CRLCanvasRepAccessibility *)&v8 accessibilityActivate])
    {
      objc_super v4 = [(CRLAudioRepAccessibility *)self crlaxTarget];
      unsigned __int8 v5 = [v4 i_playButtonFitsInFrame];

      if (v5)
      {
        BOOL v3 = [(CRLAudioRepAccessibility *)self crlaxCanPlay];
        if (!v3) {
          return v3;
        }
        [(CRLAudioRepAccessibility *)self crlaxTogglePlayback];
      }
      else
      {
        v6 = [(CRLAudioRepAccessibility *)self crlaxTarget];
        [v6 enterPreviewMode];
      }
    }
    LOBYTE(v3) = 1;
    return v3;
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (CGPoint)_accessibilityVisiblePoint
{
  [(CRLCanvasRepAccessibility *)self accessibilityActivationPoint];
  point.double x = v3;
  double v5 = v4;
  v6 = [(CRLAudioRepAccessibility *)self crlaxTarget];
  v7 = [v6 layout];
  objc_super v8 = [v7 geometry];
  [v8 size];
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = [(CRLCanvasRepAccessibility *)self crlaxLayout];
  uint64_t v14 = [v13 crlaxTarget];
  if (([v14 isInGroup] & 1) != 0 || v12 == 0.0)
  {
LABEL_43:

    goto LABEL_44;
  }

  if (v10 != 0.0)
  {
    uint64_t v13 = [(CRLCanvasRepAccessibility *)self crlaxLayout];
    uint64_t v15 = [v13 crlaxInspectorGeometry];
    uint64_t v14 = v15;
    if (v15)
    {
      CGFloat log = v5;
      CGFloat b = CGAffineTransformIdentity.b;
      CGFloat c = CGAffineTransformIdentity.c;
      CGFloat d = CGAffineTransformIdentity.d;
      CGFloat tx = CGAffineTransformIdentity.tx;
      CGFloat ty = CGAffineTransformIdentity.ty;
      [v15 crlaxAngleInRadians];
      CGFloat v88 = b;
      v103.a = CGAffineTransformIdentity.a;
      v103.CGFloat b = b;
      CGFloat v86 = d;
      CGFloat v87 = c;
      v103.CGFloat c = c;
      v103.CGFloat d = d;
      CGFloat v84 = ty;
      CGFloat v85 = tx;
      v103.CGFloat tx = tx;
      v103.CGFloat ty = ty;
      CGAffineTransformRotate((CGAffineTransform *)v104, &v103, -v21);
      double v22 = *(double *)v104;
      double v23 = *(double *)&v104[8];
      double v24 = *(double *)&v104[16];
      double v25 = *(double *)&v104[24];
      double v27 = *(double *)&v104[32];
      double v26 = *(double *)&v104[40];
      v28 = [(CRLCanvasRepAccessibility *)self crlaxCanvas];
      v29 = v28;
      if (v28)
      {
        double v30 = v26 + v12 * 0.25 * v25 + v23 * (v10 * 0.5);
        double v31 = v27 + v12 * 0.25 * v24 + v22 * (v10 * 0.5);
        [v28 crlaxViewScale];
        v103.a = CGAffineTransformIdentity.a;
        v103.CGFloat b = v88;
        v103.CGFloat c = v87;
        v103.CGFloat d = v86;
        v103.CGFloat tx = v85;
        v103.CGFloat ty = v84;
        CGAffineTransformScale((CGAffineTransform *)v104, &v103, v32, v32);
        double pointa = *(double *)&v104[32] + v30 * *(double *)&v104[16] + *(double *)v104 * v31;
        double loga = *(double *)&v104[40] + v30 * *(double *)&v104[24] + *(double *)&v104[8] * v31;
        v33 = [v13 crlaxTarget];
        v34 = v33;
        if (v33)
        {
          [v33 transform];
          double v35 = v102;
          [v34 transform];
          double v36 = v101;
        }
        else
        {
          double v36 = 0.0;
          double v35 = 0.0;
        }
        v37 = [(CRLCanvasRepAccessibility *)self crlaxCanvas];
        [v37 crlaxScreenPointFromUnscaledCanvas:v35, v36];
        CGFloat v39 = v38;
        CGFloat v41 = v40;

        v103.a = CGAffineTransformIdentity.a;
        v103.CGFloat b = v88;
        v103.CGFloat c = v87;
        v103.CGFloat d = v86;
        v103.CGFloat tx = v85;
        v103.CGFloat ty = v84;
        CGAffineTransformTranslate((CGAffineTransform *)v104, &v103, v39, v41);
        CGPoint point = (CGPoint)vaddq_f64(*(float64x2_t *)&v104[32], vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v104[16], loga), *(float64x2_t *)v104, pointa));
        [(CRLCanvasRepAccessibility *)self accessibilityFrame];
        CGFloat v43 = v42;
        CGFloat v45 = v44;
        CGFloat v47 = v46;
        CGFloat v49 = v48;
        [(CRLCanvasRepAccessibility *)self accessibilityFrame];
        if (!CGRectContainsPoint(v106, point))
        {
          unsigned int v50 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E9960);
          }
          v51 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            logCGFloat c = v51;
            v91 = NSStringFromCGPoint(point);
            v110.origin.double x = v43;
            v110.origin.y = v45;
            v110.size.width = v47;
            v110.size.height = v49;
            v89 = NSStringFromCGRect(v110);
            *(_DWORD *)v104 = 67110402;
            *(_DWORD *)&v104[4] = v50;
            *(_WORD *)&v104[8] = 2082;
            *(void *)&v104[10] = "-[CRLAudioRepAccessibility(iOS) _accessibilityVisiblePoint]";
            *(_WORD *)&v104[18] = 2082;
            *(void *)&v104[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Canvas/Accessi"
                                   "bility/iOS/CRLAudioRepAccessibility+iOS.m";
            *(_WORD *)&v104[28] = 1024;
            *(_DWORD *)&v104[30] = 143;
            *(_WORD *)&v104[34] = 2112;
            *(void *)&v104[36] = v91;
            *(_WORD *)&v104[44] = 2112;
            *(void *)&v104[46] = v89;
            _os_log_error_impl((void *)&_mh_execute_header, logc, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Attempted to compute an accessibilityVisiblePoint but it was outside the accessibilityFrame. (Point: %@, frame: %@)", v104, 0x36u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E9980);
          }
          v52 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010668E0(v52);
          }
          v53 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRepAccessibility(iOS) _accessibilityVisiblePoint]");
          v54 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Canvas/Accessibility/iOS/CRLAudioRepAccessibility+iOS.m"];
          v55 = NSStringFromCGPoint(point);
          v107.origin.double x = v43;
          v107.origin.y = v45;
          v107.size.width = v47;
          v107.size.height = v49;
          v56 = NSStringFromCGRect(v107);
          +[CRLAssertionHandler handleFailureInFunction:v53, v54, 143, 0, "Attempted to compute an accessibilityVisiblePoint but it was outside the accessibilityFrame. (Point: %@, frame: %@)", v55, v56 file lineNumber isFatal description];
        }
        v57 = [(CRLCanvasRepAccessibility *)self accessibilityPath];
        v58 = v57;
        if (v57 && ([v57 containsPoint:point] & 1) == 0)
        {
          logCGFloat b = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E99A0);
          }
          v59 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v83 = v59;
            v92 = NSStringFromCGPoint(point);
            *(_DWORD *)v104 = 67110402;
            *(_DWORD *)&v104[4] = logb;
            *(_WORD *)&v104[8] = 2082;
            *(void *)&v104[10] = "-[CRLAudioRepAccessibility(iOS) _accessibilityVisiblePoint]";
            *(_WORD *)&v104[18] = 2082;
            *(void *)&v104[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Canvas/Accessi"
                                   "bility/iOS/CRLAudioRepAccessibility+iOS.m";
            *(_WORD *)&v104[28] = 1024;
            *(_DWORD *)&v104[30] = 149;
            *(_WORD *)&v104[34] = 2112;
            *(void *)&v104[36] = v92;
            *(_WORD *)&v104[44] = 2112;
            *(void *)&v104[46] = v58;
            _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Attempted to compute an accessibilityVisiblePoint but it was outside the non-nil accessibilityPath. (Point: %@, path: %@)", v104, 0x36u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E99C0);
          }
          v60 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010668E0(v60);
          }
          v61 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRepAccessibility(iOS) _accessibilityVisiblePoint]");
          v62 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Canvas/Accessibility/iOS/CRLAudioRepAccessibility+iOS.m"];
          v63 = NSStringFromCGPoint(point);
          +[CRLAssertionHandler handleFailureInFunction:v61, v62, 149, 0, "Attempted to compute an accessibilityVisiblePoint but it was outside the non-nil accessibilityPath. (Point: %@, path: %@)", v63, v58 file lineNumber isFatal description];
        }
        v64 = [(CRLAudioRepAccessibility *)self crlaxTarget];
        unsigned int v65 = [v64 i_playButtonFitsInFrame];

        if (v65)
        {
          [(CRLAudioRepAccessibility *)self _accessibilityFrameOfPlayPauseButton];
          CGFloat v67 = v66;
          CGFloat v69 = v68;
          CGFloat v71 = v70;
          CGFloat v73 = v72;
          [(CRLAudioRepAccessibility *)self _accessibilityFrameOfPlayPauseButton];
          if (CGRectContainsPoint(v108, point))
          {
            unsigned int v74 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014E99E0);
            }
            v75 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              logCGFloat d = v75;
              v93 = NSStringFromCGPoint(point);
              v111.origin.double x = v67;
              v111.origin.y = v69;
              v111.size.width = v71;
              v111.size.height = v73;
              v90 = NSStringFromCGRect(v111);
              *(_DWORD *)v104 = 67110402;
              *(_DWORD *)&v104[4] = v74;
              *(_WORD *)&v104[8] = 2082;
              *(void *)&v104[10] = "-[CRLAudioRepAccessibility(iOS) _accessibilityVisiblePoint]";
              *(_WORD *)&v104[18] = 2082;
              *(void *)&v104[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Canvas/Acces"
                                     "sibility/iOS/CRLAudioRepAccessibility+iOS.m";
              *(_WORD *)&v104[28] = 1024;
              *(_DWORD *)&v104[30] = 156;
              *(_WORD *)&v104[34] = 2112;
              *(void *)&v104[36] = v93;
              *(_WORD *)&v104[44] = 2112;
              *(void *)&v104[46] = v90;
              _os_log_error_impl((void *)&_mh_execute_header, logd, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Attempted to compute an accessibilityVisiblePoint but it was inside of the play/pause button. (Point: %@, button frame: %@)", v104, 0x36u);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014E9A00);
            }
            v76 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_1010668E0(v76);
            }
            v77 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRepAccessibility(iOS) _accessibilityVisiblePoint]");
            v78 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Canvas/Accessibility/iOS/CRLAudioRepAccessibility+iOS.m"];
            v79 = NSStringFromCGPoint(point);
            v109.origin.double x = v67;
            v109.origin.y = v69;
            v109.size.width = v71;
            v109.size.height = v73;
            v80 = NSStringFromCGRect(v109);
            +[CRLAssertionHandler handleFailureInFunction:v77, v78, 156, 0, "Attempted to compute an accessibilityVisiblePoint but it was inside of the play/pause button. (Point: %@, button frame: %@)", v79, v80 file lineNumber isFatal description];
          }
        }
        CGFloat log = point.y;
      }
      double v5 = log;
    }
    goto LABEL_43;
  }
LABEL_44:
  double x = point.x;
  double v82 = v5;
  result.y = v82;
  result.double x = x;
  return result;
}

- (CGRect)_accessibilityFrameOfPlayPauseButton
{
  id v2 = [(CRLAudioRepAccessibility *)self crlaxTarget];
  CGFloat v3 = [v2 audioImageRenderable];
  double v4 = [v3 layer];

  [v4 accessibilityFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.double x = v13;
  return result;
}

- (BOOL)_isInQuickSelectMode
{
  id v2 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  CGFloat v3 = [v2 crlaxTarget];
  double v4 = [v3 layerHost];
  double v5 = [v4 asiOSCVC];
  unsigned __int8 v6 = [v5 isCurrentlyInQuickSelectMode];

  return v6;
}

@end