@interface MKPowerAssertion
- (MKPowerAssertion)init;
- (void)dealloc;
- (void)powerAssertion;
- (void)setPowerAssertion:(void *)a3;
@end

@implementation MKPowerAssertion

- (MKPowerAssertion)init
{
  v4.receiver = self;
  v4.super_class = (Class)MKPowerAssertion;
  v2 = [(MKPowerAssertion *)&v4 init];
  if (v2) {
    v2->_powerAssertion = (void *)CPPowerAssertionCreate();
  }
  return v2;
}

- (void)dealloc
{
  powerAssertion = self->_powerAssertion;
  if (powerAssertion)
  {
    CFRelease(powerAssertion);
    self->_powerAssertion = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MKPowerAssertion;
  [(MKPowerAssertion *)&v4 dealloc];
}

- (void)powerAssertion
{
  return self->_powerAssertion;
}

- (void)setPowerAssertion:(void *)a3
{
  self->_powerAssertion = a3;
}

@end