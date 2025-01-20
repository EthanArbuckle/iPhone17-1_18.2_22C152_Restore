@interface CLAONSenseWiFiService
+ (_TtC10CLAONSense21CLAONSenseWiFiService)shared;
- (BOOL)isAvailable;
- (BOOL)registerForWifiScanResultsWithQueue:(id)a3 error:(id *)a4 callback:(id)a5;
- (BOOL)registerForWifiScanResultsWithQueue:(id)a3 intervalSec:(float)a4 error:(id *)a5 callback:(id)a6;
- (_TtC10CLAONSense21CLAONSenseWiFiService)init;
@end

@implementation CLAONSenseWiFiService

+ (_TtC10CLAONSense21CLAONSenseWiFiService)shared
{
  if (qword_102488F58 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10248D838;

  return (_TtC10CLAONSense21CLAONSenseWiFiService *)v2;
}

- (BOOL)isAvailable
{
  return isAvailable()();
}

- (BOOL)registerForWifiScanResultsWithQueue:(id)a3 intervalSec:(float)a4 error:(id *)a5 callback:(id)a6
{
  uint64_t v9 = sub_1003469A4(&qword_1024798E0);
  __chkstk_darwin(v9 - 8);
  v11 = &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = _Block_copy(a6);
  uint64_t v13 = type metadata accessor for ALResultOptions();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  id v14 = a3;
  v15 = self;
  v17[4] = 0;
  sub_1015CCE78(v14);
  sub_100346B8C((uint64_t)v11, &qword_1024798E0);

  _Block_release(v12);
  return 1;
}

- (BOOL)registerForWifiScanResultsWithQueue:(id)a3 error:(id *)a4 callback:(id)a5
{
  uint64_t v8 = sub_1003469A4(&qword_1024798E0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = _Block_copy(a5);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = *(void (**)(uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0xC8);
  id v14 = a3;
  v15 = self;
  swift_retain();
  v13(sub_1015CD570, v12);
  uint64_t v16 = type metadata accessor for ALResultOptions();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 1, 1, v16);
  v18[4] = 1;
  sub_1015CCE78(v14);
  sub_100346B8C((uint64_t)v10, &qword_1024798E0);
  swift_release();

  return 1;
}

- (_TtC10CLAONSense21CLAONSenseWiFiService)init
{
  sub_1015CAE00((char *)self + OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService_associatedState, &byte_10248AB18);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService_requester) = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService_desc);
  void *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService__callback);
  v5 = (objc_class *)type metadata accessor for CLAONSenseWiFiService();
  void *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return [(CLAONSenseWiFiService *)&v7 init];
}

- (void).cxx_destruct
{
  sub_100D546EC((uint64_t)self + OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService_associatedState);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService__callback);

  sub_1015CB550(v3);
}

@end