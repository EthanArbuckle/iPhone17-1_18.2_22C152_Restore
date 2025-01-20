@interface CRLInspectorTextFieldPercentFormatter
+ (CRLInspectorTextFieldPercentFormatter)sharedFormatter;
- (CRLInspectorTextFieldPercentFormatter)init;
- (CRLInspectorTextFieldPercentFormatter)initWithCoder:(id)a3;
- (id)p_clampNumber:(id)a3 toMinimum:(id)a4 andMaximum:(id)a5 wasNumberClamped:(BOOL *)a6;
- (id)p_numberScaledWithMultiplerForNumber:(id)a3;
- (id)p_numberUnscaledWithMultiplerForNumber:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (void)p_commonInitPercentFormatter;
@end

@implementation CRLInspectorTextFieldPercentFormatter

+ (CRLInspectorTextFieldPercentFormatter)sharedFormatter
{
  return (CRLInspectorTextFieldPercentFormatter *)+[CRLInspectorTextFieldNumberFormatter percentFormatter];
}

- (void)p_commonInitPercentFormatter
{
  [(CRLInspectorTextFieldPercentFormatter *)self setNumberStyle:3];

  [(CRLInspectorTextFieldPercentFormatter *)self setMultiplier:&off_10155E078];
}

- (CRLInspectorTextFieldPercentFormatter)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLInspectorTextFieldPercentFormatter;
  v3 = [(CRLInspectorTextFieldClampNumberFormatter *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(CRLInspectorTextFieldPercentFormatter *)v3 p_commonInitPercentFormatter];
  }
  return v4;
}

- (CRLInspectorTextFieldPercentFormatter)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRLInspectorTextFieldPercentFormatter;
  v2 = [(CRLInspectorTextFieldClampNumberFormatter *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CRLInspectorTextFieldPercentFormatter *)v2 p_commonInitPercentFormatter];
  }
  return v3;
}

- (id)p_numberUnscaledWithMultiplerForNumber:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_super v6 = sub_1002469D0(v5, v4);

  uint64_t v7 = [(CRLInspectorTextFieldPercentFormatter *)self multiplier];
  v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    id v13 = v6;
  }
  else
  {
    [v6 doubleValue];
    double v11 = v10;
    [v8 doubleValue];
    id v13 = +[NSNumber numberWithDouble:v11 / v12];
  }
  v14 = v13;

  return v14;
}

- (id)p_numberScaledWithMultiplerForNumber:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_super v6 = sub_1002469D0(v5, v4);

  uint64_t v7 = [(CRLInspectorTextFieldPercentFormatter *)self multiplier];
  v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    id v13 = v6;
  }
  else
  {
    [v6 doubleValue];
    double v11 = v10;
    [v8 doubleValue];
    id v13 = +[NSNumber numberWithDouble:v11 * v12];
  }
  v14 = v13;

  return v14;
}

- (id)p_clampNumber:(id)a3 toMinimum:(id)a4 andMaximum:(id)a5 wasNumberClamped:(BOOL *)a6
{
  id v10 = a5;
  id v11 = a4;
  double v12 = [(CRLInspectorTextFieldPercentFormatter *)self p_numberScaledWithMultiplerForNumber:a3];
  v16.receiver = self;
  v16.super_class = (Class)CRLInspectorTextFieldPercentFormatter;
  id v13 = [(CRLInspectorTextFieldClampNumberFormatter *)&v16 p_clampNumber:v12 toMinimum:v11 andMaximum:v10 wasNumberClamped:a6];

  v14 = [(CRLInspectorTextFieldPercentFormatter *)self p_numberUnscaledWithMultiplerForNumber:v13];

  return v14;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = (_UNKNOWN **)a3;
  uint64_t v5 = objc_opt_class();
  objc_super v6 = sub_1002469D0(v5, v4);
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 doubleValue];
    double v9 = v8;
    id v10 = [(CRLInspectorTextFieldPercentFormatter *)self multiplier];
    [v10 doubleValue];
    *(float *)&double v11 = v9 * v11;
    float v12 = roundf(*(float *)&v11);

    if (v12 == 0.0 || fabsf(v12) < 0.01)
    {

      id v4 = &off_10155E088;
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)CRLInspectorTextFieldPercentFormatter;
  id v13 = [(CRLInspectorTextFieldClampNumberFormatter *)&v15 stringForObjectValue:v4];

  return v13;
}

@end