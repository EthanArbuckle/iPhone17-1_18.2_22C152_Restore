@interface SDAuthenticationRegistrationManager
- (OS_dispatch_queue)queue;
- (void)handleKeyBagStateChanged;
@end

@implementation SDAuthenticationRegistrationManager

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)*(id *)&self->queue[3];
}

- (void)handleKeyBagStateChanged
{
  swift_retain();
  sub_100332C90();

  swift_release();
}

@end