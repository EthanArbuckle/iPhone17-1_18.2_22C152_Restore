@interface UITextField(SUScriptTextFieldAdditions)
- (uint64_t)configureFromScriptTextField:()SUScriptTextFieldAdditions;
@end

@implementation UITextField(SUScriptTextFieldAdditions)

- (uint64_t)configureFromScriptTextField:()SUScriptTextFieldAdditions
{
  objc_msgSend(a1, "setAutocapitalizationType:", __SUAutocapitalizationTypeForString(objc_msgSend(a3, "_autocapitalizationType")));
  objc_msgSend(a1, "setAutocorrectionType:", __SUAutocorrectionTypeForString(objc_msgSend(a3, "_autocorrectionType")));
  objc_msgSend(a1, "setKeyboardType:", __SUKeyboardTypeForString(objc_msgSend(a3, "_keyboardType")));
  objc_msgSend(a1, "setPlaceholder:", (id)objc_msgSend(a3, "_copyPlaceholder"));
  id v5 = (id)[a3 _copyValue];

  return [a1 setText:v5];
}

@end