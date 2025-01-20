@interface WFToastManager
- (BOOL)toastSessionWithIdentifier:(id)a3 forDuration:(double)a4;
- (WFSessionKitAssertion)toastedSession;
- (WFToastManager)init;
- (WFToastManager)initWithDelegate:(id)a3;
- (WFToastManagerDelegate)delegate;
- (void)eatTheToastWithReason:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation WFToastManager

- (WFToastManagerDelegate)delegate
{
  v2 = (void *)sub_1C7D87B0C();
  return (WFToastManagerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1C7D87BB8();
}

- (WFSessionKitAssertion)toastedSession
{
  v2 = self;
  v3 = (void *)sub_1C7D87D88();

  return (WFSessionKitAssertion *)v3;
}

- (WFToastManager)initWithDelegate:(id)a3
{
  return (WFToastManager *)ToastManager.init(with:)();
}

- (BOOL)toastSessionWithIdentifier:(id)a3 forDuration:(double)a4
{
  uint64_t v6 = sub_1C7E992D0();
  uint64_t v8 = v7;
  v9 = self;
  LOBYTE(v6) = sub_1C7D880E0(v6, v8, a4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)eatTheToastWithReason:(id)a3
{
  uint64_t v4 = sub_1C7E992D0();
  unint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1C7D892F4(v4, v6);

  swift_bridgeObjectRelease();
}

- (WFToastManager)init
{
  return (WFToastManager *)ToastManager.init()();
}

- (void).cxx_destruct
{
  sub_1C7D8A328((uint64_t)self + OBJC_IVAR___WFToastManager_delegate);
  swift_release();

  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WFToastManager_timer);
}

@end