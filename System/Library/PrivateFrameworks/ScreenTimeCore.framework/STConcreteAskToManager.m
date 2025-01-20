@interface STConcreteAskToManager
- (_TtC15ScreenTimeAgent22STConcreteAskToManager)init;
- (void)sendAskToMessageForAskForTimeRequest:(id)a3 completion:(id)a4;
@end

@implementation STConcreteAskToManager

- (void)sendAskToMessageForAskForTimeRequest:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1000A475C(v7, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC15ScreenTimeAgent22STConcreteAskToManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STConcreteAskToManager();
  return [(STConcreteAskToManager *)&v3 init];
}

@end