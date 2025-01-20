@interface TPSBiomeDataProvider
- (TPSBiomeDataProvider)init;
- (void)deregisterWakingForAllRegistrations;
- (void)deregisterWakingForRegistrationID:(id)a3;
- (void)registerWakingForEventWithEvent:(id)a3 registrationID:(id)a4 clientIdentifier:(id)a5 completion:(id)a6;
@end

@implementation TPSBiomeDataProvider

- (void)registerWakingForEventWithEvent:(id)a3 registrationID:(id)a4 clientIdentifier:(id)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = sub_19C9768B0();
  uint64_t v12 = v11;
  if (a5) {
    sub_19C9768B0();
  }
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  id v14 = a3;
  v15 = self;
  sub_19C9740DC(v14, v10, v12, sub_19C974084, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)deregisterWakingForAllRegistrations
{
  v2 = self;
  sub_19C97232C();
}

- (void)deregisterWakingForRegistrationID:(id)a3
{
  uint64_t v4 = sub_19C9768B0();
  uint64_t v6 = v5;
  v7 = self;
  sub_19C97299C(v4, v6);

  swift_bridgeObjectRelease();
}

- (TPSBiomeDataProvider)init
{
  return (TPSBiomeDataProvider *)TipsBiomeDataProvider.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSBiomeDataProvider_registrationQueue);
}

@end