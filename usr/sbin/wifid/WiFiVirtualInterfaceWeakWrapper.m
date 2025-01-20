@interface WiFiVirtualInterfaceWeakWrapper
- (__WiFiVirtualInterface)virtualInterface;
- (void)setVirtualInterface:(__WiFiVirtualInterface *)a3;
@end

@implementation WiFiVirtualInterfaceWeakWrapper

- (__WiFiVirtualInterface)virtualInterface
{
  return self->_virtualInterface;
}

- (void)setVirtualInterface:(__WiFiVirtualInterface *)a3
{
  self->_virtualInterface = a3;
}

@end