@interface DOMElement(UIWebFormExtensions)
- (void)getTextWritingDirection:()UIWebFormExtensions override:;
@end

@implementation DOMElement(UIWebFormExtensions)

- (void)getTextWritingDirection:()UIWebFormExtensions override:
{
  result = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "getComputedStyle:pseudoElement:", a1, &stru_1ED0E84C0);
  v7 = result;
  if (a3)
  {
    result = objc_msgSend((id)objc_msgSend(result, "direction"), "isEqualToString:", @"ltr");
    *a3 = result ^ 1;
  }
  if (a4)
  {
    result = objc_msgSend((id)objc_msgSend(v7, "unicodeBidi"), "isEqualToString:", @"bidi-override");
    *a4 = (_BYTE)result;
  }
  return result;
}

@end