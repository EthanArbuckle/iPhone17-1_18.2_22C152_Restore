@interface CRLVerboseSecondsDurationFormatter
+ (CRLVerboseSecondsDurationFormatter)sharedFormatter;
- (void)p_commonInitDurationFormatter;
@end

@implementation CRLVerboseSecondsDurationFormatter

+ (CRLVerboseSecondsDurationFormatter)sharedFormatter
{
  return (CRLVerboseSecondsDurationFormatter *)+[CRLInspectorTextFieldNumberFormatter verboseSecondsFormatter];
}

- (void)p_commonInitDurationFormatter
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"0.## sec" value:0 table:0];
  [(CRLVerboseSecondsDurationFormatter *)self crl_setFormat:v4];

  v5 = [CRLAccessibilityValueFormat alloc];
  id v9 = +[NSBundle mainBundle];
  v6 = [v9 localizedStringForKey:@"0.##" value:0 table:0];
  v7 = CRLAccessibilityStringsDictKey(@"inspector.field.seconds");
  v8 = [(CRLAccessibilityValueFormat *)v5 initWithNumberFormat:v6 andUnitStringsDictKey:v7];
  [(CRLInspectorTextFieldAbstractNumberFormatter *)self setCrlaxValueFormat:v8];
}

@end