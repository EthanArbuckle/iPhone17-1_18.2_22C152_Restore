@interface CRLCalligraphyStrokeAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (id)crlaxKnownStrokePatternLocalizationStrings;
@end

@implementation CRLCalligraphyStrokeAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLCalligraphyStroke";
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

- (id)crlaxKnownStrokePatternLocalizationStrings
{
  v2 = (void *)qword_1016A9A50;
  if (!qword_1016A9A50)
  {
    CFStringRef v8 = @"Calligraphy";
    id v3 = +[NSBundle mainBundle];
    v4 = [v3 localizedStringForKey:@"Calligraphy" value:0 table:0];
    v9 = v4;
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v6 = (void *)qword_1016A9A50;
    qword_1016A9A50 = v5;

    v2 = (void *)qword_1016A9A50;
  }

  return v2;
}

@end