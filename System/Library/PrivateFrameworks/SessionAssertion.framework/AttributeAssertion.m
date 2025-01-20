@interface AttributeAssertion
- (void)invalidate;
@end

@implementation AttributeAssertion

- (void)invalidate
{
  swift_retain();
  sub_1B8F821F4();

  swift_release();
}

@end