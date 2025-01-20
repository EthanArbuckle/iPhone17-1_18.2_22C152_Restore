@interface WFSetupServerAnisetteDataProvider
+ (BOOL)supportsSecureCoding;
- (ACAccount)transportableAuthKitAccount;
- (AKDevice)companionAuthDevice;
- (CUMessageSession)session;
- (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider)init;
- (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)eraseAnisetteWithCompletion:(id)a3;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4;
- (void)provisionAnisetteWithCompletion:(id)a3;
- (void)setCompanionAuthDevice:(id)a3;
- (void)setSession:(id)a3;
- (void)setTransportableAuthKitAccount:(id)a3;
- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4;
@end

@implementation WFSetupServerAnisetteDataProvider

- (CUMessageSession)session
{
  return (CUMessageSession *)sub_25E79C2A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
}

- (void)setSession:(id)a3
{
}

- (AKDevice)companionAuthDevice
{
  return (AKDevice *)sub_25E79C2A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice);
}

- (void)setCompanionAuthDevice:(id)a3
{
}

- (ACAccount)transportableAuthKitAccount
{
  return (ACAccount *)sub_25E79C2A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount);
}

- (void)setTransportableAuthKitAccount:(id)a3
{
}

- (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider)init
{
  return (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider *)WFSetupServerAnisetteDataProvider.init()();
}

- (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider *)sub_25E7BB730();

  return v4;
}

- (void)provisionAnisetteWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_25E79B1B0;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  WFSetupServerAnisetteDataProvider.provisionAnisette(completion:)((void (*)(void, void *))v7, v6);
  sub_25E785F38((uint64_t)v7);
}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  if (a3)
  {
    uint64_t v6 = self;
    id v7 = a3;
    a3 = (id)sub_25E7BC210();
    unint64_t v9 = v8;

    if (v5)
    {
LABEL_3:
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v5;
      v11 = sub_25E79B1B0;
      goto LABEL_6;
    }
  }
  else
  {
    v12 = self;
    unint64_t v9 = 0xF000000000000000;
    if (v5) {
      goto LABEL_3;
    }
  }
  v11 = 0;
  uint64_t v10 = 0;
LABEL_6:
  WFSetupServerAnisetteDataProvider.syncAnisette(withSIMData:completion:)((uint64_t)a3, v9, (void (*)(void, void *))v11, v10);
  sub_25E785F38((uint64_t)v11);
  sub_25E77D710((uint64_t)a3, v9);
}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    id v7 = sub_25E79B18C;
  }
  else
  {
    id v7 = 0;
    uint64_t v6 = 0;
  }
  unint64_t v8 = self;
  WFSetupServerAnisetteDataProvider.eraseAnisette(completion:)((void (*)(void, void *))v7, v6);
  sub_25E785F38((uint64_t)v7);
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  uint64_t v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_25E79B1AC;
  }
  else
  {
    uint64_t v7 = 0;
  }
  unint64_t v8 = self;
  WFSetupServerAnisetteDataProvider.fetchAnisetteDataAndProvisionIfNecessary(_:withCompletion:)(a3, (void (*)(void, void))v6, v7);
  sub_25E785F38((uint64_t)v6);
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  uint64_t v6 = (void (*)(uint64_t, uint64_t))_Block_copy(a4);
  uint64_t v7 = v6;
  if (a3)
  {
    uint64_t v8 = sub_25E7BC3E0();
    a3 = v9;
    if (v7)
    {
LABEL_3:
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v7;
      uint64_t v7 = sub_25E79B184;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
LABEL_6:
  v11 = self;
  WFSetupServerAnisetteDataProvider.legacyAnisetteData(forDSID:withCompletion:)(v8, (uint64_t)a3, (void (*)(void, void *))v7, v10);
  sub_25E785F38((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  WFSetupServerAnisetteDataProvider.encode(with:)((NSCoder)v4);
}

@end