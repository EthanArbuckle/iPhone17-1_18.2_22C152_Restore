@interface DOMHTMLTextAreaElement(UITextInputAdditions)
- (id)textInputTraits;
- (uint64_t)isSingleLineDocument;
- (uint64_t)isTextControl;
- (uint64_t)setSelectionWithPoint:()UITextInputAdditions;
@end

@implementation DOMHTMLTextAreaElement(UITextInputAdditions)

- (id)textInputTraits
{
  v8.receiver = a1;
  v8.super_class = (Class)&off_1ED6CF198;
  id v2 = objc_msgSendSuper2(&v8, sel_textInputTraits);
  int v3 = [a1 isSecure];
  LODWORD(v4) = [a1 _autocapitalizeType] - 1;
  if (v4 >= 4) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = v4;
  }
  if (v3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }
  [v2 setAutocapitalizationType:v5];
  if (([a1 autocorrect] & ~v3) != 0) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  [v2 setAutocorrectionType:v6];
  objc_msgSend(v2, "setTextSuggestionDelegate:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_formDelegate"));
  return v2;
}

- (uint64_t)isSingleLineDocument
{
  return 0;
}

- (uint64_t)isTextControl
{
  return 1;
}

- (uint64_t)setSelectionWithPoint:()UITextInputAdditions
{
  WebThreadLock();
  double v6 = (double)(int)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "innerLineHeight:", a1)* 0.5;
  return objc_msgSend(a1, "setSelectionWithPoint:inset:", a2, a3, v6);
}

@end