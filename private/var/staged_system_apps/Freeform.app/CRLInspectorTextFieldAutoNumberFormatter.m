@interface CRLInspectorTextFieldAutoNumberFormatter
- (id)textAttributesForZero;
- (id)zeroSymbol;
@end

@implementation CRLInspectorTextFieldAutoNumberFormatter

- (id)zeroSymbol
{
  return &stru_101538650;
}

- (id)textAttributesForZero
{
  v2 = +[UIColor grayColor];
  NSAttributedStringKey v5 = NSForegroundColorAttributeName;
  v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

@end