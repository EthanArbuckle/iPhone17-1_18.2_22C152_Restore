@interface TSSStyleAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxPropertyRepresentsObjectType:(int)a3;
- (NSString)tsaxName;
- (NSString)tsaxStyleIdentifier;
- (NSString)tsaxStyleInfoDescription;
- (TSSPropertySetAccessibility)tsaxProperties;
- (float)tsaxFloatValueForProperty:(int)a3;
- (id)tsaxDescriptionForObjectProperty:(int)a3;
- (id)tsaxObjectForProperty:(int)a3;
- (int)tsaxIntValueForProperty:(int)a3;
@end

@implementation TSSStyleAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSSStyle";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxName
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSSStyleAccessibility *)self tsaxValueForKey:@"name"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSSPropertySetAccessibility)tsaxProperties
{
  char v13 = 0;
  v3 = objc_opt_class();
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_259BD0;
  v11 = sub_259BE0;
  uint64_t v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_259BEC;
  v6[3] = &unk_4573D8;
  v6[4] = self;
  v6[5] = &v7;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  uint64_t v4 = v8[5];
  _Block_object_dispose(&v7, 8);
  result = (TSSPropertySetAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, v4, 1, &v13);
  if (v13) {
    abort();
  }
  return result;
}

- (NSString)tsaxStyleIdentifier
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSSStyleAccessibility *)self tsaxValueForKey:@"styleIdentifier"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)tsaxObjectForProperty:(int)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_259BD0;
  v11 = sub_259BE0;
  uint64_t v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_259D80;
  v5[3] = &unk_46BA50;
  v5[4] = self;
  v5[5] = &v7;
  int v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  v3 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (int)tsaxIntValueForProperty:(int)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_259E84;
  v5[3] = &unk_46BA50;
  v5[4] = self;
  v5[5] = &v7;
  int v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  int v3 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (float)tsaxFloatValueForProperty:(int)a3
{
  uint64_t v7 = 0;
  v8 = (float *)&v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_259F90;
  v5[3] = &unk_46BA50;
  v5[4] = self;
  v5[5] = &v7;
  int v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  float v3 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (id)tsaxDescriptionForObjectProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v5 = -[TSSStyleAccessibility _tsaxPropertyRepresentsObjectType:](self, "_tsaxPropertyRepresentsObjectType:");
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if ((v5 & 1) == 0)
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Property must represent object type.", v7, v8, v9, v10, v11, v22))goto LABEL_22; {
    }
      }
  }
  if (!v5) {
    return 0;
  }
  uint64_t v12 = [(TSSStyleAccessibility *)self tsaxObjectForProperty:v3];
  if ([(NSNull *)v12 conformsToProtocol:&OBJC_PROTOCOL___TSAccessibilityStyleInfoProvider])
  {
    return [(NSNull *)v12 tsaxStyleInfoDescription];
  }
  if (v12 != +[NSNull null])
  {
    if (!TSAccessibilityShouldPerformValidationChecks()) {
      return 0;
    }
    int v14 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    uint64_t v15 = objc_opt_class();
    if (!__TSAccessibilityHandleValidationErrorWithDescription(v14, 0, @"%@ does not conform to TSAccessibilityStyleInfoProvider.", v16, v17, v18, v19, v20, v15))return 0; {
LABEL_22:
    }
    abort();
  }
  switch((int)v3)
  {
    case 516:
      CFStringRef v21 = @"fill.none";
      break;
    case 517:
      CFStringRef v21 = @"stroke.none";
      break;
    case 519:
      CFStringRef v21 = @"reflection.none";
      break;
    case 520:
      CFStringRef v21 = @"shadow.none";
      break;
    default:
      CFStringRef v21 = @"style.property.none";
      break;
  }

  return TSAccessibilityLocalizedString((uint64_t)v21);
}

- (NSString)tsaxStyleInfoDescription
{
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    uint64_t v3 = objc_opt_class();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"-[TSSStyleAccessibility tsaxStyleInfoDescription] is abstract. Please implement tsaxStyleInfoDescription in %@.", v4, v5, v6, v7, v8, v3))abort(); {
  }
    }
  return 0;
}

- (BOOL)_tsaxPropertyRepresentsObjectType:(int)a3
{
  return (a3 - 516) <= 4 && a3 != 518 || a3 == 212;
}

@end