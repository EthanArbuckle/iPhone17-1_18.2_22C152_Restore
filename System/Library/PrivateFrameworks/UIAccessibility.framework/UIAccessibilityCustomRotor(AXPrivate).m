@interface UIAccessibilityCustomRotor(AXPrivate)
- (id)_accessibilityAXAttributedName;
@end

@implementation UIAccessibilityCustomRotor(AXPrivate)

- (id)_accessibilityAXAttributedName
{
  if (_accessibilityAXAttributedName_onceToken != -1) {
    dispatch_once(&_accessibilityAXAttributedName_onceToken, &__block_literal_global_1);
  }
  v2 = (objc_class *)objc_opt_class();
  v3 = sel_name;
  Method InstanceMethod = class_getInstanceMethod(v2, sel_name);
  v5 = (objc_class *)objc_opt_class();
  Method v6 = class_getInstanceMethod(v5, sel_attributedName);
  BOOL v7 = InstanceMethod != (Method)_accessibilityAXAttributedName_baseNameMethod
    && v6 == (Method)_accessibilityAXAttributedName_baseAttributedNameMethod;
  if (v7) {
    v8 = sel_name;
  }
  else {
    v8 = sel_attributedName;
  }
  if (v7) {
    v3 = sel_attributedName;
  }
  v9 = (void (*)(void *, char *))[a1 impOrNullForSelector:v8];
  if (!v9 || (v9(a1, v8), (v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11 = (void (*)(void *, char *))[a1 impOrNullForSelector:v3];
    if (v11)
    {
      v10 = v11(a1, v3);
    }
    else
    {
      v10 = 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F488F0]) initWithCFAttributedString:v10];

    v10 = (void *)v12;
  }

  return v10;
}

@end