@interface CRLWPTextMagnifierFactory
+ (BOOL)shouldUseModernMagnifiers;
+ (id)textMagnfier;
@end

@implementation CRLWPTextMagnifierFactory

+ (id)textMagnfier
{
  +[CRLWPTextMagnifierFactory shouldUseModernMagnifiers];
  v2 = objc_opt_new();

  return v2;
}

+ (BOOL)shouldUseModernMagnifiers
{
  return 1;
}

@end