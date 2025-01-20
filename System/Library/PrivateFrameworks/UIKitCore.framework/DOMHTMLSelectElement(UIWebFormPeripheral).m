@interface DOMHTMLSelectElement(UIWebFormPeripheral)
- (id)createPeripheral;
@end

@implementation DOMHTMLSelectElement(UIWebFormPeripheral)

- (id)createPeripheral
{
  return +[UIWebFormSelectPeripheral createPeripheralWithDOMHTMLSelectElement:a1];
}

@end