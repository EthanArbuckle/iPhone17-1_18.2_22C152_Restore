@interface DOMHTMLAreaElement(UIWebInteraction)
- (id)absoluteQuadsAtPoint:()UIWebInteraction;
@end

@implementation DOMHTMLAreaElement(UIWebInteraction)

- (id)absoluteQuadsAtPoint:()UIWebInteraction
{
  v6 = [a1 ownerDocument];
  v7 = [v6 webFrame];
  v8 = [v7 webView];

  objc_msgSend(v8, "convertPoint:toView:", 0, a2, a3);
  v9 = objc_msgSend(v8, "elementAtPoint:");
  v10 = [v9 objectForKey:*MEMORY[0x1E4FB6E38]];

  v11 = [a1 absoluteQuadsWithOwner:v10];

  return v11;
}

@end