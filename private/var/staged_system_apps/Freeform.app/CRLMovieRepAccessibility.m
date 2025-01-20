@interface CRLMovieRepAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)crlaxIsPlayable;
- (BOOL)crlaxIsPlaying;
- (BOOL)crlaxShouldExposeAsAttachmentToken;
- (BOOL)crlaxSupportsPublicCustomRotors;
- (BOOL)isAccessibilityElement;
- (CRLAVPlayerControllerAccessibility)crlaxPlayerControllerForcingCreationIfNotPreExisting;
- (CRLMovieItemAccessibility)_crlaxMovieInfo;
- (NSString)crlaxLabel;
- (NSString)crlaxMovieLabel;
- (NSString)crlaxValue;
- (id)accessibilityHint;
- (id)accessibilityUserInputLabels;
- (id)crlaxKnobLabel;
- (void)crlaxTogglePlayback;
@end

@implementation CRLMovieRepAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLMovieRep";
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

- (void)crlaxTogglePlayback
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10003AB94;
  v2[3] = &unk_1014CBBB0;
  v2[4] = self;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (NSString)crlaxLabel
{
  return [(CRLMovieRepAccessibility *)self crlaxMovieLabel];
}

- (NSString)crlaxMovieLabel
{
  id v3 = [(CRLMovieRepAccessibility *)self crlaxTarget];
  v4 = [v3 movieItem];

  v5 = [v4 accessibilityDescription];
  v6 = [v4 title];
  v7 = [(CRLMovieRepAccessibility *)self _crlaxMovieInfo];
  v8 = [v7 crlaxDurationDescription];

  v9 = [v4 localizedName];
  if (![v6 length])
  {
    v16 = [v4 movieAssetPayload];
    uint64_t v17 = [v16 filename];

    v6 = (void *)v17;
  }
  v18 = __CRLAccessibilityStringForVariables(1, v5, v10, v11, v12, v13, v14, v15, (uint64_t)v6);

  return (NSString *)v18;
}

- (NSString)crlaxValue
{
  if ([(CRLMovieRepAccessibility *)self crlaxIsPlaying])
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

- (BOOL)crlaxIsPlayable
{
  v2 = [(CRLMovieRepAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isPlayable];

  return v3;
}

- (BOOL)crlaxIsPlaying
{
  v2 = [(CRLMovieRepAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isPlaying];

  return v3;
}

- (id)crlaxKnobLabel
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"Movie" value:0 table:0];

  return v3;
}

- (BOOL)crlaxShouldExposeAsAttachmentToken
{
  return 1;
}

- (CRLAVPlayerControllerAccessibility)crlaxPlayerControllerForcingCreationIfNotPreExisting
{
  char v8 = 0;
  v2 = [(CRLMovieRepAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 playerControllerForcingCreationIfNotPreExisting];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLAVPlayerControllerAccessibility *)v6;
}

- (id)accessibilityUserInputLabels
{
  unsigned __int8 v3 = +[NSMutableArray array];
  v4 = [(CRLMovieRepAccessibility *)self crlaxTarget];
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
  v2 = [(CRLMovieRepAccessibility *)self crlaxTarget];
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

- (id)accessibilityHint
{
  v14.receiver = self;
  v14.super_class = (Class)CRLMovieRepAccessibility;
  unsigned __int8 v3 = [(CRLCanvasRepAccessibility *)&v14 accessibilityHint];
  if ([(CRLCanvasRepAccessibility *)self crlaxIsSelected])
  {
    uint64_t v10 = +[NSBundle mainBundle];
    uint64_t v11 = [v10 localizedStringForKey:@"Double tap to play." value:0 table:0];
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = __CRLAccessibilityStringForVariables(1, v11, v4, v5, v6, v7, v8, v9, (uint64_t)v3);

  return v12;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  v4.receiver = self;
  v4.super_class = (Class)CRLMovieRepAccessibility;
  if ([(CRLCanvasRepAccessibility *)&v4 _accessibilitySupportsActivateAction]) {
    return 1;
  }
  else {
    return [(CRLMovieRepAccessibility *)self crlaxIsPlayable];
  }
}

- (BOOL)accessibilityActivate
{
  unsigned __int8 v3 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  objc_super v4 = [v3 crlaxTarget];
  uint64_t v5 = [v4 layerHost];
  uint64_t v6 = [v5 asiOSCVC];
  unsigned __int8 v7 = [v6 isCurrentlyInQuickSelectMode];

  if (v7) {
    return 0;
  }
  uint64_t v9 = [(CRLCanvasRepAccessibility *)self crlaxRepForSelecting];
  if ([v9 crlaxIsSelected])
  {
    unsigned __int8 v10 = [(CRLMovieRepAccessibility *)self crlaxIsPlayable];

    if (v10)
    {
      [(CRLMovieRepAccessibility *)self crlaxTogglePlayback];
      return 1;
    }
  }
  else
  {
  }
  v11.receiver = self;
  v11.super_class = (Class)CRLMovieRepAccessibility;
  return [(CRLCanvasRepAccessibility *)&v11 accessibilityActivate];
}

@end