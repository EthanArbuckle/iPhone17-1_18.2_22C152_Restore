@interface CHBackgroundTaskAssertion
- (CHBackgroundTaskAssertion)init;
- (void)activate;
- (void)invalidate;
@end

@implementation CHBackgroundTaskAssertion

- (CHBackgroundTaskAssertion)init
{
  v2 = (char *)self + OBJC_IVAR___CHBackgroundTaskAssertion_identifier;
  *(void *)v2 = 0;
  v2[8] = 1;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CHBackgroundTaskAssertion_state) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BackgroundTaskAssertion();
  return [(CHBackgroundTaskAssertion *)&v4 init];
}

- (void)activate
{
  v2 = self;
  sub_100334D38();
}

- (void)invalidate
{
  v2 = self;
  sub_10002828C();
}

@end