@interface LyonSwiftDecoder
+ (id)getInstance;
- (_TtC24AppletTranslationLibrary16LyonSwiftDecoder)init;
- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8;
- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (int64_t)stateNumber;
- (void)cleanup;
@end

@implementation LyonSwiftDecoder

+ (id)getInstance
{
  if (qword_1EA6086A0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EA608878;

  return v2;
}

- (int64_t)stateNumber
{
  unsigned int v2 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR____TtC24AppletTranslationLibrary16LyonSwiftDecoder_state);
  if (!(v2 >> 6)) {
    return 2;
  }
  if (v2 >> 6 == 1) {
    return 3;
  }
  if (v2 == 128) {
    return 1;
  }
  return 4;
}

- (_TtC24AppletTranslationLibrary16LyonSwiftDecoder)init
{
  return (_TtC24AppletTranslationLibrary16LyonSwiftDecoder *)sub_1CA5BCE04();
}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = self;
  uint64_t v19 = sub_1CA5FD598();
  unint64_t v21 = v20;

  uint64_t v22 = sub_1CA5FD8A8();
  uint64_t v24 = v23;

  sub_1CA5C322C(v19, v21, v22, v24);
  swift_bridgeObjectRelease();

  sub_1CA5B6EF4(v19, v21);
  v25 = (void *)sub_1CA5FD838();
  swift_bridgeObjectRelease();

  return v25;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  return sub_1CA5C0224((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, "LyonDecoder doesn't support GetState");
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  sub_1CA5C3910();
  v7 = (void *)sub_1CA5FD838();
  swift_bridgeObjectRelease();

  return v7;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  return sub_1CA5C0224((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, "LyonDecoder doesn't support processEndOfTransaction");
}

- (void)cleanup
{
  unsigned int v2 = self;
  sub_1CA5C02E4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end