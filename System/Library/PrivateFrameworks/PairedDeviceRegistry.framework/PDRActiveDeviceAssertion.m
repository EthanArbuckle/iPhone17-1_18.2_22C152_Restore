@interface PDRActiveDeviceAssertion
- (BOOL)isActive;
- (PDRActiveDeviceAssertion)init;
- (PDRDevice)device;
- (void)invalidate;
@end

@implementation PDRActiveDeviceAssertion

- (PDRActiveDeviceAssertion)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDRActiveDeviceAssertion;
  return [(PDRActiveDeviceAssertion *)&v3 init];
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PDRDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
}

- (void)invalidate
{
  uint64_t v4 = objc_opt_class();
  MEMORY[0x270EF2BB8](self, a2, v4);
}

@end