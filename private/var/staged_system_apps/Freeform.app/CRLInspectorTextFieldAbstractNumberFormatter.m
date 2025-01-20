@interface CRLInspectorTextFieldAbstractNumberFormatter
+ (id)formatter;
- (BOOL)inspectorTextFieldAllowsNilObjectValue;
- (CRLAccessibilityValueFormat)crlaxValueFormat;
- (CRLInspectorTextFieldAbstractNumberFormatter)init;
- (id)crlaxLocalizedDescriptionFromValue:(id)a3;
- (unint64_t)crlaxRulerUnitType;
- (void)setCrlaxRulerUnitType:(unint64_t)a3;
- (void)setCrlaxValueFormat:(id)a3;
- (void)setInspectorTextFieldAllowsNilObjectValue:(BOOL)a3;
@end

@implementation CRLInspectorTextFieldAbstractNumberFormatter

+ (id)formatter
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (CRLInspectorTextFieldAbstractNumberFormatter)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRLInspectorTextFieldAbstractNumberFormatter;
  id v2 = [(CRLInspectorTextFieldAbstractNumberFormatter *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CRLInspectorTextFieldAbstractNumberFormatter *)v2 setRoundingMode:6];
  }
  return v3;
}

- (id)crlaxLocalizedDescriptionFromValue:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (self->mTSAXValueFormat)
  {
    id v6 = [(CRLInspectorTextFieldAbstractNumberFormatter *)self copy];
    v7 = [(CRLAccessibilityValueFormat *)self->mTSAXValueFormat numberFormat];
    [v6 crl_setFormat:v7];

    v8 = [v6 stringFromNumber:v5];
    v9 = [(CRLAccessibilityValueFormat *)self->mTSAXValueFormat unitStringsDictKey];
    [v5 floatValue];
    v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v8, v10);
  }
  else
  {
    unint64_t mTSAXRulerUnitType = self->mTSAXRulerUnitType;
    if (mTSAXRulerUnitType == 5)
    {
      [(CRLInspectorTextFieldAbstractNumberFormatter *)self stringFromNumber:v4];
    }
    else
    {
      [v4 crl_CGFloatValue];
      +[CRLRulerUnitsAccessibility crlaxLocalizedDescriptionForUnits:value:](CRLRulerUnitsAccessibility, "crlaxLocalizedDescriptionForUnits:value:", mTSAXRulerUnitType);
    v11 = };
  }

  return v11;
}

- (BOOL)inspectorTextFieldAllowsNilObjectValue
{
  return self->mInspectorTextFieldAllowsNilObjectValue;
}

- (void)setInspectorTextFieldAllowsNilObjectValue:(BOOL)a3
{
  self->mInspectorTextFieldAllowsNilObjectValue = a3;
}

- (CRLAccessibilityValueFormat)crlaxValueFormat
{
  return self->mTSAXValueFormat;
}

- (void)setCrlaxValueFormat:(id)a3
{
}

- (unint64_t)crlaxRulerUnitType
{
  return self->mTSAXRulerUnitType;
}

- (void)setCrlaxRulerUnitType:(unint64_t)a3
{
  self->unint64_t mTSAXRulerUnitType = a3;
}

- (void).cxx_destruct
{
}

@end