@interface CRLInspectorTextFieldAngleFormatter
+ (CRLInspectorTextFieldAngleFormatter)sharedFormatter;
- (BOOL)normalizesAngle;
- (CRLInspectorTextFieldAngleFormatter)init;
- (CRLInspectorTextFieldAngleFormatter)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)crlaxLocalizedDescriptionFromValue:(id)a3;
- (id)p_clampNumber:(id)a3 toMinimum:(id)a4 andMaximum:(id)a5 wasNumberClamped:(BOOL *)a6;
- (id)stringForObjectValue:(id)a3 originalValue:(id)a4;
- (void)p_commonInitAngleFormatter;
- (void)setNormalizesAngle:(BOOL)a3;
@end

@implementation CRLInspectorTextFieldAngleFormatter

+ (CRLInspectorTextFieldAngleFormatter)sharedFormatter
{
  return (CRLInspectorTextFieldAngleFormatter *)+[CRLInspectorTextFieldNumberFormatter angleFormatter];
}

- (void)p_commonInitAngleFormatter
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"0.#°;-0.#°" value:0 table:0];
  [(CRLInspectorTextFieldAngleFormatter *)self crl_setFormat:v4];

  self->_normalizesAngle = 1;

  [(CRLInspectorTextFieldAngleFormatter *)self setMaximumFractionDigits:0];
}

- (CRLInspectorTextFieldAngleFormatter)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLInspectorTextFieldAngleFormatter;
  v3 = [(CRLInspectorTextFieldClampNumberFormatter *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(CRLInspectorTextFieldAngleFormatter *)v3 p_commonInitAngleFormatter];
  }
  return v4;
}

- (CRLInspectorTextFieldAngleFormatter)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRLInspectorTextFieldAngleFormatter;
  v2 = [(CRLInspectorTextFieldClampNumberFormatter *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CRLInspectorTextFieldAngleFormatter *)v2 p_commonInitAngleFormatter];
  }
  return v3;
}

- (id)stringForObjectValue:(id)a3 originalValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  v9 = sub_1002469D0(v8, v6);
  v10 = v9;
  if (v9)
  {
    [v9 doubleValue];
    uint64_t v12 = +[NSNumber numberWithDouble:(double)fmod(v11, 360.0)];

    id v6 = (id)v12;
  }
  v15.receiver = self;
  v15.super_class = (Class)CRLInspectorTextFieldAngleFormatter;
  v13 = [(CRLInspectorTextFieldClampNumberFormatter *)&v15 stringForObjectValue:v6 originalValue:v7];

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLInspectorTextFieldAngleFormatter;
  id v4 = [(CRLInspectorTextFieldNumberFormatter *)&v6 copyWithZone:a3];
  [v4 setNormalizesAngle:[self normalizesAngle]];
  return v4;
}

- (id)p_clampNumber:(id)a3 toMinimum:(id)a4 andMaximum:(id)a5 wasNumberClamped:(BOOL *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (![(CRLInspectorTextFieldAngleFormatter *)self normalizesAngle])
  {
    v19.receiver = self;
    v19.super_class = (Class)CRLInspectorTextFieldAngleFormatter;
    id v13 = [(CRLInspectorTextFieldClampNumberFormatter *)&v19 p_clampNumber:v10 toMinimum:v11 andMaximum:v12 wasNumberClamped:a6];
    goto LABEL_11;
  }
  id v13 = v10;
  if ([v13 compare:&off_10155E088] != (id)-1
    && [v13 compare:&off_10155E098] != (id)1)
  {
    BOOL v17 = 0;
    if (!a6) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  [v13 doubleValue];
  double v15 = fmod(v14, 360.0);
  if (v15 < 0.0) {
    double v15 = v15 + 360.0;
  }
  uint64_t v16 = +[NSNumber numberWithDouble:v15];

  BOOL v17 = 1;
  id v13 = (id)v16;
  if (a6) {
LABEL_10:
  }
    *a6 = v17;
LABEL_11:

  return v13;
}

- (id)crlaxLocalizedDescriptionFromValue:(id)a3
{
  id v4 = a3;
  objc_super v5 = CRLAccessibilityStringsDictKey(@"angle.unit.degrees");
  if (v5)
  {
    [v4 crl_CGFloatValue];
    uint64_t v7 = v6;

    uint64_t v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v7);
  }
  else
  {
    uint64_t v8 = [(CRLInspectorTextFieldAngleFormatter *)self stringFromNumber:v4];
  }

  return v8;
}

- (BOOL)normalizesAngle
{
  return self->_normalizesAngle;
}

- (void)setNormalizesAngle:(BOOL)a3
{
  self->_normalizesAngle = a3;
}

@end