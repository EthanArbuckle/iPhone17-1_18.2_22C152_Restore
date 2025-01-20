@interface CRLInspectorTextFieldNumberFormatter
+ (CRLInspectorTextFieldNumberFormatter)angleFormatter;
+ (CRLInspectorTextFieldNumberFormatter)dateFormatter;
+ (CRLInspectorTextFieldNumberFormatter)longDurationFormatter;
+ (CRLInspectorTextFieldNumberFormatter)percentFormatter;
+ (CRLInspectorTextFieldNumberFormatter)pointsFormatter;
+ (CRLInspectorTextFieldNumberFormatter)precisePointsFormatter;
+ (CRLInspectorTextFieldNumberFormatter)rulerLengthFormatter;
+ (CRLInspectorTextFieldNumberFormatter)secondsFormatter;
+ (CRLInspectorTextFieldNumberFormatter)verboseSecondsFormatter;
+ (void)initialize;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CRLInspectorTextFieldNumberFormatter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(CRLInspectorTextFieldNumberFormatter);
    v3 = (void *)qword_1016A9C90;
    qword_1016A9C90 = (uint64_t)v2;

    v4 = +[NSBundle mainBundle];
    v5 = [v4 localizedStringForKey:@"0 pt" value:0 table:0];
    [qword_1016A9C90 crl_setFormat:v5];

    v6 = [CRLAccessibilityValueFormat alloc];
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"0" value:0 table:0];
    v9 = CRLAccessibilityStringsDictKey(@"inspector.field.points");
    v10 = [(CRLAccessibilityValueFormat *)v6 initWithNumberFormat:v8 andUnitStringsDictKey:v9];
    [(id)qword_1016A9C90 setCrlaxValueFormat:v10];

    [(id)qword_1016A9C90 setCrlaxRulerUnitType:2];
    [(id)qword_1016A9C90 setLenient:1];
    v11 = objc_alloc_init(CRLInspectorTextFieldNumberFormatter);
    v12 = (void *)qword_1016A9C98;
    qword_1016A9C98 = (uint64_t)v11;

    v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"0.## pt" value:0 table:0];
    [qword_1016A9C98 crl_setFormat:v14];

    v15 = [CRLAccessibilityValueFormat alloc];
    v16 = +[NSBundle mainBundle];
    v17 = [v16 localizedStringForKey:@"0.##" value:0 table:0];
    v18 = CRLAccessibilityStringsDictKey(@"inspector.field.points");
    v19 = [(CRLAccessibilityValueFormat *)v15 initWithNumberFormat:v17 andUnitStringsDictKey:v18];
    [(id)qword_1016A9C98 setCrlaxValueFormat:v19];

    [(id)qword_1016A9C98 setCrlaxRulerUnitType:2];
    [(id)qword_1016A9C98 setLenient:1];
    v20 = objc_alloc_init(CRLInspectorTextFieldNumberFormatter);
    v21 = (void *)qword_1016A9CA0;
    qword_1016A9CA0 = (uint64_t)v20;

    v22 = +[NSBundle mainBundle];
    v23 = [v22 localizedStringForKey:@"0 px" value:0 table:0];
    [qword_1016A9CA0 crl_setFormat:v23];

    v24 = [CRLAccessibilityValueFormat alloc];
    v25 = +[NSBundle mainBundle];
    v26 = [v25 localizedStringForKey:@"0" value:0 table:0];
    v27 = CRLAccessibilityStringsDictKey(@"inspector.field.pixels");
    v28 = [(CRLAccessibilityValueFormat *)v24 initWithNumberFormat:v26 andUnitStringsDictKey:v27];
    [(id)qword_1016A9CA0 setCrlaxValueFormat:v28];

    [(id)qword_1016A9CA0 setCrlaxRulerUnitType:4];
    [(id)qword_1016A9CA0 setLenient:1];
    v29 = objc_alloc_init(CRLInspectorTextFieldNumberFormatter);
    v30 = (void *)qword_1016A9CA8;
    qword_1016A9CA8 = (uint64_t)v29;

    v31 = +[NSBundle mainBundle];
    v32 = [v31 localizedStringForKey:@"0.## px" value:0 table:0];
    [qword_1016A9CA8 crl_setFormat:v32];

    v33 = [CRLAccessibilityValueFormat alloc];
    v34 = +[NSBundle mainBundle];
    v35 = [v34 localizedStringForKey:@"0.##" value:0 table:0];
    v36 = CRLAccessibilityStringsDictKey(@"inspector.field.pixels");
    v37 = [(CRLAccessibilityValueFormat *)v33 initWithNumberFormat:v35 andUnitStringsDictKey:v36];
    [(id)qword_1016A9CA8 setCrlaxValueFormat:v37];

    [(id)qword_1016A9CA8 setCrlaxRulerUnitType:4];
    [(id)qword_1016A9CA8 setLenient:1];
    v38 = objc_alloc_init(CRLInspectorTextFieldNumberFormatter);
    v39 = (void *)qword_1016A9CB0;
    qword_1016A9CB0 = (uint64_t)v38;

    v40 = (void *)qword_1016A9CB0;
    v41 = +[NSNumber numberWithDouble:1.0 / 72.0];
    [v40 setMultiplier:v41];

    v42 = +[NSBundle mainBundle];
    v43 = [v42 localizedStringForKey:@"0.## in" value:0 table:0];
    [qword_1016A9CB0 crl_setFormat:v43];

    v44 = [CRLAccessibilityValueFormat alloc];
    v45 = +[NSBundle mainBundle];
    v46 = [v45 localizedStringForKey:@"0.##" value:0 table:0];
    v47 = CRLAccessibilityStringsDictKey(@"inspector.field.inches");
    v48 = [(CRLAccessibilityValueFormat *)v44 initWithNumberFormat:v46 andUnitStringsDictKey:v47];
    [(id)qword_1016A9CB0 setCrlaxValueFormat:v48];

    [(id)qword_1016A9CB0 setCrlaxRulerUnitType:0];
    [(id)qword_1016A9CB0 setLenient:1];
    v49 = objc_alloc_init(CRLInspectorTextFieldNumberFormatter);
    v50 = (void *)qword_1016A9CB8;
    qword_1016A9CB8 = (uint64_t)v49;

    v51 = (void *)qword_1016A9CB8;
    v52 = +[NSNumber numberWithDouble:1.0 / 28.346457];
    [v51 setMultiplier:v52];

    v53 = +[NSBundle mainBundle];
    v54 = [v53 localizedStringForKey:@"0.## cm" value:0 table:0];
    [qword_1016A9CB8 crl_setFormat:v54];

    v55 = [CRLAccessibilityValueFormat alloc];
    v56 = +[NSBundle mainBundle];
    v57 = [v56 localizedStringForKey:@"0.##" value:0 table:0];
    v58 = CRLAccessibilityStringsDictKey(@"inspector.field.centimeters");
    v59 = [(CRLAccessibilityValueFormat *)v55 initWithNumberFormat:v57 andUnitStringsDictKey:v58];
    [(id)qword_1016A9CB8 setCrlaxValueFormat:v59];

    [(id)qword_1016A9CB8 setCrlaxRulerUnitType:1];
    [(id)qword_1016A9CB8 setLenient:1];
    v60 = objc_alloc_init(CRLInspectorTextFieldPointLengthFormatter);
    v61 = (void *)qword_1016A9CC0;
    qword_1016A9CC0 = (uint64_t)v60;

    [(id)qword_1016A9CC0 setLenient:1];
    v62 = objc_alloc_init(CRLInspectorTextFieldPrecisePointLengthFormatter);
    v63 = (void *)qword_1016A9CC8;
    qword_1016A9CC8 = (uint64_t)v62;

    [(id)qword_1016A9CC8 setLenient:1];
    v64 = objc_alloc_init(CRLInspectorTextFieldLengthFormatter);
    v65 = (void *)qword_1016A9CD0;
    qword_1016A9CD0 = (uint64_t)v64;

    [(id)qword_1016A9CD0 setLenient:1];
    v66 = objc_alloc_init(CRLInspectorTextFieldAngleFormatter);
    v67 = (void *)qword_1016A9CD8;
    qword_1016A9CD8 = (uint64_t)v66;

    [(id)qword_1016A9CD8 setLenient:1];
    v68 = objc_alloc_init(CRLInspectorTextFieldPercentFormatter);
    v69 = (void *)qword_1016A9CE0;
    qword_1016A9CE0 = (uint64_t)v68;

    [(id)qword_1016A9CE0 setLenient:1];
    v70 = objc_alloc_init(CRLSecondsDurationFormatter);
    v71 = (void *)qword_1016A9CE8;
    qword_1016A9CE8 = (uint64_t)v70;

    [(id)qword_1016A9CE8 setLenient:1];
    v72 = objc_alloc_init(CRLVerboseSecondsDurationFormatter);
    v73 = (void *)qword_1016A9CF0;
    qword_1016A9CF0 = (uint64_t)v72;

    v74 = (void *)qword_1016A9CF0;
    [v74 setLenient:1];
  }
}

+ (CRLInspectorTextFieldNumberFormatter)rulerLengthFormatter
{
  return (CRLInspectorTextFieldNumberFormatter *)(id)qword_1016A9CD0;
}

+ (CRLInspectorTextFieldNumberFormatter)pointsFormatter
{
  return (CRLInspectorTextFieldNumberFormatter *)(id)qword_1016A9CC0;
}

+ (CRLInspectorTextFieldNumberFormatter)precisePointsFormatter
{
  return (CRLInspectorTextFieldNumberFormatter *)(id)qword_1016A9CC8;
}

+ (CRLInspectorTextFieldNumberFormatter)angleFormatter
{
  return (CRLInspectorTextFieldNumberFormatter *)(id)qword_1016A9CD8;
}

+ (CRLInspectorTextFieldNumberFormatter)percentFormatter
{
  return (CRLInspectorTextFieldNumberFormatter *)(id)qword_1016A9CE0;
}

+ (CRLInspectorTextFieldNumberFormatter)longDurationFormatter
{
  return 0;
}

+ (CRLInspectorTextFieldNumberFormatter)secondsFormatter
{
  return (CRLInspectorTextFieldNumberFormatter *)(id)qword_1016A9CE8;
}

+ (CRLInspectorTextFieldNumberFormatter)verboseSecondsFormatter
{
  return (CRLInspectorTextFieldNumberFormatter *)(id)qword_1016A9CF0;
}

+ (CRLInspectorTextFieldNumberFormatter)dateFormatter
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLInspectorTextFieldNumberFormatter;
  id v4 = [(CRLInspectorTextFieldNumberFormatter *)&v7 copyWithZone:a3];
  v5 = [(CRLInspectorTextFieldAbstractNumberFormatter *)self crlaxValueFormat];
  [v4 setCrlaxValueFormat:v5];

  return v4;
}

@end