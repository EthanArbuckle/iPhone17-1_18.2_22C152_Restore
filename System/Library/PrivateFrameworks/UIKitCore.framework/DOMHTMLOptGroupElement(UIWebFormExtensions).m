@interface DOMHTMLOptGroupElement(UIWebFormExtensions)
- (UIDOMHTMLOptGroupCell)createPickerCell;
- (UIDOMHTMLOptGroupSelectedItem)createSelectedItem;
- (uint64_t)itemTitle;
@end

@implementation DOMHTMLOptGroupElement(UIWebFormExtensions)

- (UIDOMHTMLOptGroupSelectedItem)createSelectedItem
{
  v1 = [[UIDOMHTMLOptGroupSelectedItem alloc] initWithHTMLOptGroupNode:a1];
  return v1;
}

- (UIDOMHTMLOptGroupCell)createPickerCell
{
  v1 = [[UIDOMHTMLOptGroupCell alloc] initWithHTMLOptGroupNode:a1];
  return v1;
}

- (uint64_t)itemTitle
{
  uint64_t v5 = 0;
  unsigned __int8 v4 = 0;
  [a1 getTextWritingDirection:&v5 override:&v4];
  v2 = (void *)[a1 label];
  return objc_msgSend(v2, "_uikit_stringWithWritingDirection:asOverride:", v5, v4);
}

@end