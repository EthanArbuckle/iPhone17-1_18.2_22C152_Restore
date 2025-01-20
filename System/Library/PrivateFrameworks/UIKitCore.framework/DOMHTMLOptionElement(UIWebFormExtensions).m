@interface DOMHTMLOptionElement(UIWebFormExtensions)
- (UIDOMHTMLOptionPickerCell)createPickerCell;
- (UIDOMHTMLOptionSelectedItem)createSelectedItem;
- (uint64_t)itemTitle;
- (uint64_t)populateCell:()UIWebFormExtensions;
@end

@implementation DOMHTMLOptionElement(UIWebFormExtensions)

- (UIDOMHTMLOptionSelectedItem)createSelectedItem
{
  v1 = [[UIDOMHTMLOptionSelectedItem alloc] initWithHTMLOptionNode:a1];
  return v1;
}

- (UIDOMHTMLOptionPickerCell)createPickerCell
{
  v1 = [[UIDOMHTMLOptionPickerCell alloc] initWithHTMLOptionNode:a1];
  return v1;
}

- (uint64_t)populateCell:()UIWebFormExtensions
{
  objc_msgSend((id)objc_msgSend(a3, "textLabel"), "setText:", objc_msgSend(a1, "itemTitle"));
  objc_msgSend((id)objc_msgSend(a3, "textLabel"), "setEnabled:", objc_msgSend(a1, "disabled") ^ 1);
  objc_msgSend(a3, "setSelectionStyle:", objc_msgSend(a1, "disabled") ^ 1);
  if ([a1 selected]) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 0;
  }
  return [a3 setAccessoryType:v5];
}

- (uint64_t)itemTitle
{
  v2 = objc_msgSend((id)objc_msgSend(a1, "text"), "_uikit_stringByTrimmingWhitespaceAndNewlines");
  uint64_t v5 = 0;
  unsigned __int8 v4 = 0;
  [a1 getTextWritingDirection:&v5 override:&v4];
  return objc_msgSend(v2, "_uikit_stringWithWritingDirection:asOverride:", v5, v4);
}

@end