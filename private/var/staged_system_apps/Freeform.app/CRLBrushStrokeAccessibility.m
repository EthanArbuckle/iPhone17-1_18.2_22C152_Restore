@interface CRLBrushStrokeAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (id)crlaxKnownStrokePatternLocalizationStrings;
@end

@implementation CRLBrushStrokeAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLBrushStroke";
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
  v2 = (void *)qword_1016A9118;
  if (!qword_1016A9118)
  {
    v18[0] = @"Chalk2";
    v17 = +[NSBundle mainBundle];
    v16 = [v17 localizedStringForKey:@"Chalk" value:0 table:0];
    v19[0] = v16;
    v18[1] = @"Dry Brush";
    v15 = +[NSBundle mainBundle];
    id v3 = [v15 localizedStringForKey:@"Dry brush" value:0 table:0];
    v19[1] = v3;
    v18[2] = @"Feathered Brush";
    v4 = +[NSBundle mainBundle];
    v5 = [v4 localizedStringForKey:@"Feathered brush" value:0 table:0];
    v19[2] = v5;
    v18[3] = @"Pen";
    v6 = +[NSBundle mainBundle];
    v7 = [v6 localizedStringForKey:@"Pen" value:0 table:0];
    v19[3] = v7;
    v18[4] = @"Pencil";
    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"Pencil" value:0 table:0];
    v19[4] = v9;
    v18[5] = @"Crayon";
    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"Crayon" value:0 table:0];
    v19[5] = v11;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:6];
    v13 = (void *)qword_1016A9118;
    qword_1016A9118 = v12;

    v2 = (void *)qword_1016A9118;
  }

  return v2;
}

@end