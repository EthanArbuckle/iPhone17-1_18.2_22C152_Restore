@interface DOMElement(BrowserExtras)
- (BOOL)inDocument;
- (uint64_t)isHidden;
@end

@implementation DOMElement(BrowserExtras)

- (BOOL)inDocument
{
  id v1 = a1;
  id v2 = [v1 ownerDocument];
  do
  {
    v3 = v1;
    id v1 = [v1 parentNode];
  }
  while (v1 && v1 != v2);

  return v1 != 0;
}

- (uint64_t)isHidden
{
  if (![a1 offsetWidth] || !objc_msgSend(a1, "offsetHeight")) {
    return 1;
  }
  id v2 = [a1 ownerDocument];
  v3 = [v2 getComputedStyle:a1 pseudoElement:&stru_1ED0E84C0];

  v4 = [v3 getPropertyValue:@"visibility"];
  LODWORD(v2) = [v4 isEqualToString:@"visible"];

  uint64_t v5 = v2 ^ 1;
  return v5;
}

@end