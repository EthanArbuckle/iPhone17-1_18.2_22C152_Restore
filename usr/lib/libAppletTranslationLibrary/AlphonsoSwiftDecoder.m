@interface AlphonsoSwiftDecoder
+ (id)getInstance;
- (_TtC24AppletTranslationLibrary20AlphonsoSwiftDecoder)init;
- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8;
- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
@end

@implementation AlphonsoSwiftDecoder

+ (id)getInstance
{
  if (qword_1EA6086B0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EA608940;

  return v2;
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
  unint64_t v24 = v23;

  sub_1CA5C8284(v19, v21, v22, v24);
  swift_bridgeObjectRelease();

  sub_1CA5B6EF4(v19, v21);
  v25 = (void *)sub_1CA5FD838();
  swift_bridgeObjectRelease();

  return v25;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  uint64_t v9 = sub_1CA5FD8A8();
  unint64_t v11 = v10;
  id v12 = a3;
  id v13 = self;
  sub_1CA5C8828(v12, v9, v11);
  swift_bridgeObjectRelease();

  id v14 = (void *)sub_1CA5FD838();
  swift_bridgeObjectRelease();

  return v14;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  sub_1CA5C91E8();
  v7 = (void *)sub_1CA5FD838();
  swift_bridgeObjectRelease();

  return v7;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  sub_1CA5F1004(MEMORY[0x1E4FBC860]);
  v7 = (void *)sub_1CA5FD838();
  swift_bridgeObjectRelease();

  return v7;
}

- (_TtC24AppletTranslationLibrary20AlphonsoSwiftDecoder)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AlphonsoSwiftDecoder();
  return [(AlphonsoSwiftDecoder *)&v3 init];
}

@end