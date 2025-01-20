@interface UIView(TelephonyUI)
- (uint64_t)tp_setCHCRPriority:()TelephonyUI;
- (uint64_t)tp_userInterfaceLayoutDirection;
@end

@implementation UIView(TelephonyUI)

- (uint64_t)tp_setCHCRPriority:()TelephonyUI
{
  objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:", 1);
  *(float *)&double v4 = a2;
  [a1 setContentCompressionResistancePriority:0 forAxis:v4];
  *(float *)&double v5 = a2;
  [a1 setContentHuggingPriority:1 forAxis:v5];
  *(float *)&double v6 = a2;
  return [a1 setContentHuggingPriority:0 forAxis:v6];
}

- (uint64_t)tp_userInterfaceLayoutDirection
{
  v2 = objc_opt_class();
  uint64_t v3 = [a1 semanticContentAttribute];
  return [v2 userInterfaceLayoutDirectionForSemanticContentAttribute:v3];
}

@end