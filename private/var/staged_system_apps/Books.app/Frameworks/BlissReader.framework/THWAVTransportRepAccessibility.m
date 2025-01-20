@interface THWAVTransportRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (THWAVTransportControllerAccessibility)thaxTransportController;
- (id)thaxLayout;
@end

@implementation THWAVTransportRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWAVTransportRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)thaxLayout
{
  return [(TSDRepAccessibility *)self tsaxValueForKey:@"layout"];
}

- (THWAVTransportControllerAccessibility)thaxTransportController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THWAVTransportControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[-[THWAVTransportRepAccessibility thaxLayout](self, "thaxLayout") tsaxValueForKey:@"transportController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end