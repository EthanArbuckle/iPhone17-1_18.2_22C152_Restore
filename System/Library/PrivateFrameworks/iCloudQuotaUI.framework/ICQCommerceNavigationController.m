@interface ICQCommerceNavigationController
- (unint64_t)supportedInterfaceOrientations;
@end

@implementation ICQCommerceNavigationController

- (unint64_t)supportedInterfaceOrientations
{
  return MEMORY[0x270F55308](self, a2);
}

@end