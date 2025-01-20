@interface SiriRemembersService
- (_TtC14siriinferenced20SiriRemembersService)init;
- (void)donateToInteractionStoreWithDonationData:(id)a3 completionHandler:(id)a4;
@end

@implementation SiriRemembersService

- (void)donateToInteractionStoreWithDonationData:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1000168E8((uint64_t)v7, (uint64_t)v8, (void (**)(void, uint64_t))v6);
  _Block_release(v6);
}

- (_TtC14siriinferenced20SiriRemembersService)init
{
  return (_TtC14siriinferenced20SiriRemembersService *)sub_100016F9C();
}

@end