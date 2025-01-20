@interface THWAVTransportControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSArray)thaxTransportViews;
- (THWButtonControlRepAccessibility)thaxPlayButtonRep;
- (id)thaxLabelForButtonControlRep:(id)a3;
- (void)play;
@end

@implementation THWAVTransportControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWAVTransportController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (THWButtonControlRepAccessibility)thaxPlayButtonRep
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THWButtonControlRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWAVTransportControllerAccessibility *)self tsaxValueForKey:@"playButtonRep"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (NSArray)thaxTransportViews
{
  id v2 = [(THWAVTransportControllerAccessibility *)self tsaxValueForKey:@"transportUI"];
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)[v2 tsaxValueForKey:@"onCanvasViews"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)thaxLabelForButtonControlRep:(id)a3
{
  return THAccessibilityLocalizedString(@"av.play.description");
}

- (void)play
{
  v4.receiver = self;
  v4.super_class = (Class)THWAVTransportControllerAccessibility;
  [(THWAVTransportControllerAccessibility *)&v4 play];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_29B2B4;
  v3[3] = &unk_456DE0;
  v3[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

@end