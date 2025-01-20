@interface DOMHTMLInputElement(UITextInputAdditions)
- (id)textInputTraits;
- (uint64_t)isEditing;
- (uint64_t)isSecure;
- (uint64_t)isTextControl;
- (uint64_t)keyboardType;
- (uint64_t)setSelectionWithPoint:()UITextInputAdditions;
- (uint64_t)text;
@end

@implementation DOMHTMLInputElement(UITextInputAdditions)

- (id)textInputTraits
{
  v17.receiver = a1;
  v17.super_class = (Class)&off_1ED6BCF80;
  id v2 = objc_msgSendSuper2(&v17, sel_textInputTraits);
  v3 = (void *)[a1 form];
  v4 = (void *)[a1 type];
  if (!v3) {
    goto LABEL_13;
  }
  if ([v3 action])
  {
    if (([v4 isEqual:@"search"] & 1) == 0
      && objc_msgSend((id)objc_msgSend(a1, "name"), "rangeOfString:options:", @"search", 1) == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend((id)objc_msgSend(a1, "idName"), "rangeOfString:options:", @"search", 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend((id)objc_msgSend(a1, "title"), "rangeOfString:options:", @"search", 1) == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = 6;
      }
    }
    else
    {
      uint64_t v5 = 6;
    }
    [v2 setReturnKeyType:v5];
  }
  if ([v3 action]) {
    BOOL v6 = objc_msgSend((id)objc_msgSend(v3, "action"), "rangeOfString:options:", @"login", 1) != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
LABEL_13:
  }
    BOOL v6 = 0;
  if ([v4 isEqualToString:@"email"]) {
    int v7 = 1;
  }
  else {
    int v7 = [v4 isEqualToString:@"url"];
  }
  int v8 = [a1 isSecure];
  LODWORD(v9) = [a1 _autocapitalizeType] - 1;
  if (v9 >= 4) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = v9;
  }
  int v10 = v8 | v6 | v7;
  if (v10) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v9;
  }
  [v2 setAutocapitalizationType:v11];
  BOOL v12 = ([a1 autocorrect] & ~v10) == 0;
  uint64_t v13 = 1;
  if (v12) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = 2;
  }
  [v2 setAutocorrectionType:v14];
  objc_msgSend(v2, "setTextSuggestionDelegate:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_formDelegate"));
  objc_msgSend(v2, "setTextContentType:", objc_msgSend(a1, "getAttribute:", @"autocomplete"));
  v15 = (void *)[a1 getAttribute:@"inputmode"];
  if (([v15 hasPrefix:@"latin"] & 1) == 0)
  {
    if ([v15 hasPrefix:@"full-width-latin"])
    {
      uint64_t v13 = 2;
    }
    else if ([v15 hasPrefix:@"kana"])
    {
      uint64_t v13 = 3;
    }
    else if ([v15 hasPrefix:@"katakana"])
    {
      uint64_t v13 = 4;
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  [v2 setTextScriptType:v13];
  return v2;
}

- (uint64_t)text
{
  WebThreadLock();
  return [a1 value];
}

- (uint64_t)isSecure
{
  WebThreadLock();
  id v2 = (void *)[a1 type];
  return [v2 isEqual:@"password"];
}

- (uint64_t)isTextControl
{
  WebThreadLock();
  return [a1 _isTextField];
}

- (uint64_t)keyboardType
{
  WebThreadLock();
  id v2 = (void *)[a1 type];
  v3 = (void *)[a1 getAttribute:@"pattern"];
  if (v3)
  {
    v4 = v3;
    if (([v3 isEqualToString:@"\\d*"] & 1) != 0
      || ([v4 isEqualToString:@"[0-9]*"] & 1) != 0)
    {
      return 4;
    }
  }
  if ([v2 isEqualToString:@"email"]) {
    return 7;
  }
  if ([v2 isEqualToString:@"number"]) {
    return 2;
  }
  if ([v2 isEqualToString:@"tel"]) {
    return 5;
  }
  if ([v2 isEqualToString:@"url"]) {
    return 3;
  }
  return 0;
}

- (uint64_t)setSelectionWithPoint:()UITextInputAdditions
{
  WebThreadLock();
  double v6 = (double)(int)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "innerLineHeight:", a1)* 0.5;
  return objc_msgSend(a1, "setSelectionWithPoint:inset:", a2, a3, v6);
}

- (uint64_t)isEditing
{
  WebThreadLock();
  return [a1 isFocused];
}

@end