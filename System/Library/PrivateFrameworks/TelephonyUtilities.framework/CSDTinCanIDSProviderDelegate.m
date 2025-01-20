@interface CSDTinCanIDSProviderDelegate
- (CSDTinCanIDSProviderDelegate)initWithCallSource:(id)a3 queue:(id)a4;
- (CSDTinCanIDSProviderDelegate)initWithCapabilities:(id)a3 callSource:(id)a4 queue:(id)a5;
- (CSDTinCanIDSProviderDelegate)initWithCapabilities:(id)a3 queue:(id)a4;
- (id)callUpdateForChat:(id)a3;
- (void)chat:(id)a3 receivedData:(id)a4;
- (void)chatConnected:(id)a3;
- (void)chatEnded:(id)a3;
- (void)chatStartedConnecting:(id)a3;
- (void)provider:(id)a3 performSetMutedCallAction:(id)a4;
- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4;
- (void)provider:(id)a3 performStartCallAction:(id)a4;
- (void)providerDidBegin:(id)a3;
@end

@implementation CSDTinCanIDSProviderDelegate

- (CSDTinCanIDSProviderDelegate)initWithCapabilities:(id)a3 callSource:(id)a4 queue:(id)a5
{
  swift_unknownObjectRetain();
  id v7 = a4;
  id v8 = a5;
  sub_1001F9358();
  return result;
}

- (CSDTinCanIDSProviderDelegate)initWithCallSource:(id)a3 queue:(id)a4
{
  return (CSDTinCanIDSProviderDelegate *)sub_1001FA350(a3, a4);
}

- (id)callUpdateForChat:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  id v5 = sub_1001FA40C();
  swift_unknownObjectRelease();

  return v5;
}

- (void)provider:(id)a3 performStartCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001FA4D4();
}

- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001FAF78((uint64_t)v6, v7);
}

- (void)provider:(id)a3 performSetMutedCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001FB394();
}

- (void)providerDidBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1001FB7F8();
}

- (void)chatStartedConnecting:(id)a3
{
}

- (void)chatConnected:(id)a3
{
}

- (void)chatEnded:(id)a3
{
}

- (void)chat:(id)a3 receivedData:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v10 = self;
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;

  sub_1001FC19C();
  sub_1001F7498(v7, v9);
  swift_unknownObjectRelease();
}

- (CSDTinCanIDSProviderDelegate)initWithCapabilities:(id)a3 queue:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  sub_1001FC664();
}

- (void).cxx_destruct
{
  swift_release();
  sub_1001FCD14();
  sub_1001FCD14();
  sub_1001FCD14();
  sub_1001FCD14();

  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CSDTinCanIDSProviderDelegate_queue);
}

@end