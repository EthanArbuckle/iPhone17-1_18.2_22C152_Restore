@interface DOMNode(UIWebFormSelectPeripheralExtensions)
- (__CFString)itemTitle;
- (uint64_t)createPickerCell;
- (uint64_t)createSelectedItem;
@end

@implementation DOMNode(UIWebFormSelectPeripheralExtensions)

- (uint64_t)createSelectedItem
{
  return 0;
}

- (uint64_t)createPickerCell
{
  return 0;
}

- (__CFString)itemTitle
{
  return &stru_1ED0E84C0;
}

@end