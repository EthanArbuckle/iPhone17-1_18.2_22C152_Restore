@interface CRLCanvasMovieKnobAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxIsPlaying;
- (CRLMovieRepAccessibility)crlaxParentRepForKnob;
- (id)crlaxLabel;
- (id)crlaxUserInputLabels;
- (id)crlaxValue;
@end

@implementation CRLCanvasMovieKnobAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLMovieKnob";
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

- (CRLMovieRepAccessibility)crlaxParentRepForKnob
{
  char v8 = 0;
  v7.receiver = self;
  v7.super_class = (Class)CRLCanvasMovieKnobAccessibility;
  v2 = [(CRLCanvasKnobAccessibility *)&v7 crlaxParentRepForKnob];
  id v3 = objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsSafeCategory(v3, (uint64_t)v2, 1, &v8);
  if (v8) {
    abort();
  }
  v5 = (void *)v4;

  return (CRLMovieRepAccessibility *)v5;
}

- (id)crlaxLabel
{
  unsigned int v2 = [(CRLCanvasMovieKnobAccessibility *)self crlaxIsPlaying];
  id v3 = +[NSBundle mainBundle];
  uint64_t v4 = v3;
  if (v2) {
    CFStringRef v5 = @"Pause movie";
  }
  else {
    CFStringRef v5 = @"Play movie";
  }
  v6 = [v3 localizedStringForKey:v5 value:0 table:0];

  return v6;
}

- (id)crlaxUserInputLabels
{
  unsigned int v2 = [(CRLCanvasMovieKnobAccessibility *)self crlaxIsPlaying];
  id v3 = +[NSBundle mainBundle];
  uint64_t v4 = v3;
  if (v2) {
    CFStringRef v5 = @"Pause";
  }
  else {
    CFStringRef v5 = @"Play";
  }
  v6 = [v3 localizedStringForKey:v5 value:0 table:0];
  v9 = v6;
  objc_super v7 = +[NSArray arrayWithObjects:&v9 count:1];

  return v7;
}

- (id)crlaxValue
{
  return 0;
}

- (BOOL)crlaxIsPlaying
{
  unsigned int v2 = [(CRLCanvasMovieKnobAccessibility *)self crlaxParentRepForKnob];
  id v3 = [v2 crlaxTarget];
  unsigned __int8 v4 = [v3 isPlaying];

  return v4;
}

@end