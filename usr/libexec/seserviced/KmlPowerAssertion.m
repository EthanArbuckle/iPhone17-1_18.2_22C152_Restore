@interface KmlPowerAssertion
- (KmlPowerAssertion)init;
- (void)dealloc;
@end

@implementation KmlPowerAssertion

- (KmlPowerAssertion)init
{
  v3.receiver = self;
  v3.super_class = (Class)KmlPowerAssertion;
  return [(KmlPowerAssertion *)&v3 init];
}

- (void)dealloc
{
  sub_10032A618((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  queue = self->_queue;
  self->_queue = 0;

  v10.receiver = self;
  v10.super_class = (Class)KmlPowerAssertion;
  [(KmlPowerAssertion *)&v10 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionName, 0);
  objc_storeStrong((id *)&self->_powerAssertTransaction, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end