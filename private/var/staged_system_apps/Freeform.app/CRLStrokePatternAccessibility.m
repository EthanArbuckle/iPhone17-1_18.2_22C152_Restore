@interface CRLStrokePatternAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxIsDefaultStroke;
- (NSString)crlaxStyleInfoDescription;
- (NSString)crlaxStyleInfoDescriptionOmittingStroke;
- (id)_crlaxLocalizedDescriptionForPattern:(id)a3 omittingStroke:(BOOL)a4;
- (id)_crlaxStrokePatternName;
- (id)_crlaxStyleInfoDescription:(BOOL)a3;
- (int64_t)_crlaxStrokePattern;
- (void)crlaxSetDefaultStroke:(BOOL)a3;
@end

@implementation CRLStrokePatternAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLStrokePattern";
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

- (BOOL)crlaxIsDefaultStroke
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9C28);
}

- (void)crlaxSetDefaultStroke:(BOOL)a3
{
}

- (NSString)crlaxStyleInfoDescription
{
  return (NSString *)[(CRLStrokePatternAccessibility *)self _crlaxStyleInfoDescription:0];
}

- (NSString)crlaxStyleInfoDescriptionOmittingStroke
{
  return (NSString *)[(CRLStrokePatternAccessibility *)self _crlaxStyleInfoDescription:1];
}

- (id)_crlaxStyleInfoDescription:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CRLStrokePatternAccessibility *)self crlaxIsDefaultStroke])
  {
    v5 = +[NSBundle mainBundle];
    v6 = v5;
    if (v3) {
      CFStringRef v7 = @"Default";
    }
    else {
      CFStringRef v7 = @"Default stroke";
    }
    uint64_t v8 = [v5 localizedStringForKey:v7 value:0 table:0];
    goto LABEL_8;
  }
  v6 = [(CRLStrokePatternAccessibility *)self _crlaxStrokePatternName];
  if (v6)
  {
    uint64_t v8 = [(CRLStrokePatternAccessibility *)self _crlaxLocalizedDescriptionForPattern:v6 omittingStroke:v3];
LABEL_8:
    v9 = (void *)v8;
    goto LABEL_10;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (id)_crlaxStrokePatternName
{
  BOOL v3 = +[CRLStrokePattern solidPattern];
  unsigned __int8 v4 = [(CRLStrokePatternAccessibility *)self isEqual:v3];

  if (v4) {
    return @"solidPattern";
  }
  v6 = +[CRLStrokePattern emptyPattern];
  unsigned __int8 v7 = [(CRLStrokePatternAccessibility *)self isEqual:v6];

  if (v7) {
    return @"emptyPattern";
  }
  uint64_t v8 = +[CRLStrokePattern shortDashPattern];
  unsigned __int8 v9 = [(CRLStrokePatternAccessibility *)self isEqual:v8];

  if (v9) {
    return @"shortDashPattern";
  }
  v10 = +[CRLStrokePattern mediumDashPattern];
  unsigned __int8 v11 = [(CRLStrokePatternAccessibility *)self isEqual:v10];

  if (v11) {
    return @"mediumDashPattern";
  }
  v12 = +[CRLStrokePattern longDashPattern];
  unsigned __int8 v13 = [(CRLStrokePatternAccessibility *)self isEqual:v12];

  if (v13) {
    return @"longDashPattern";
  }
  v14 = +[CRLStrokePattern roundDashPattern];
  unsigned int v15 = [(CRLStrokePatternAccessibility *)self isEqual:v14];

  if (v15) {
    return @"roundDashPattern";
  }
  else {
    return 0;
  }
}

- (id)_crlaxLocalizedDescriptionForPattern:(id)a3 omittingStroke:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (qword_1016A9C38) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v4;
  }
  if (!v6)
  {
    v50[0] = @"solidPattern";
    v46 = +[NSBundle mainBundle];
    v44 = [v46 localizedStringForKey:@"Solid" value:0 table:0];
    v51[0] = v44;
    v50[1] = @"emptyPattern";
    v42 = +[NSBundle mainBundle];
    v40 = [v42 localizedStringForKey:@"Empty" value:0 table:0];
    v51[1] = v40;
    v50[2] = @"shortDashPattern";
    v38 = +[NSBundle mainBundle];
    unsigned __int8 v7 = [v38 localizedStringForKey:@"Short dash" value:0 table:0];
    v51[2] = v7;
    v50[3] = @"mediumDashPattern";
    uint64_t v8 = +[NSBundle mainBundle];
    unsigned __int8 v9 = [v8 localizedStringForKey:@"Medium dash" value:0 table:0];
    v51[3] = v9;
    v50[4] = @"longDashPattern";
    +[NSBundle mainBundle];
    unsigned __int8 v11 = v10 = v4;
    v12 = [v11 localizedStringForKey:@"Long dash" value:0 table:0];
    v51[4] = v12;
    v50[5] = @"roundDashPattern";
    unsigned __int8 v13 = +[NSBundle mainBundle];
    [v13 localizedStringForKey:@"Rounded dash" value:0 table:0];
    unsigned int v15 = v14 = v5;
    v51[5] = v15;
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:6];
    v17 = (void *)qword_1016A9C38;
    qword_1016A9C38 = v16;

    id v5 = v14;
    BOOL v4 = v10;
  }
  if (!qword_1016A9C30 && !v4)
  {
    v48[0] = @"solidPattern";
    v47 = +[NSBundle mainBundle];
    v45 = [v47 localizedStringForKey:@"Solid stroke" value:0 table:0];
    v49[0] = v45;
    v48[1] = @"emptyPattern";
    v43 = +[NSBundle mainBundle];
    v41 = [v43 localizedStringForKey:@"Empty stroke" value:0 table:0];
    v49[1] = v41;
    v48[2] = @"shortDashPattern";
    v39 = +[NSBundle mainBundle];
    v18 = [v39 localizedStringForKey:@"Short dash stroke" value:0 table:0];
    v49[2] = v18;
    v48[3] = @"mediumDashPattern";
    v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"Medium dash stroke" value:0 table:0];
    v49[3] = v20;
    v48[4] = @"longDashPattern";
    +[NSBundle mainBundle];
    v22 = BOOL v21 = v4;
    [v22 localizedStringForKey:@"Long dash stroke" value:0 table:0];
    v24 = id v23 = v5;
    v49[4] = v24;
    v48[5] = @"roundDashPattern";
    v25 = +[NSBundle mainBundle];
    v26 = [v25 localizedStringForKey:@"Rounded dash stroke" value:0 table:0];
    v49[5] = v26;
    uint64_t v27 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:6];
    v28 = (void *)qword_1016A9C30;
    qword_1016A9C30 = v27;

    id v5 = v23;
    BOOL v4 = v21;
  }
  v29 = &qword_1016A9C38;
  if (!v4) {
    v29 = &qword_1016A9C30;
  }
  v30 = [(id)*v29 objectForKeyedSubscript:v5];
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    if (![v30 length])
    {
      int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Unrecognized pattern %@, could not get localization key", v32, v33, v34, v35, v36, (uint64_t)v5))abort(); {
    }
      }
  }

  return v30;
}

- (int64_t)_crlaxStrokePattern
{
  v2 = [(CRLStrokePatternAccessibility *)self crlaxTarget];
  id v3 = [v2 patternType];

  return (int64_t)v3;
}

@end