@interface LocalDraftsDeviceListener
- (_TtC7NewsUI225LocalDraftsDeviceListener)init;
- (void)browser:(id)a3 didNotStartBrowsingForPeers:(id)a4;
- (void)browser:(id)a3 foundPeer:(id)a4 withDiscoveryInfo:(id)a5;
- (void)browser:(id)a3 lostPeer:(id)a4;
- (void)dealloc;
- (void)session:(id)a3 didFinishReceivingResourceWithName:(id)a4 fromPeer:(id)a5 atURL:(id)a6 withError:(id)a7;
- (void)session:(id)a3 didReceiveCertificate:(id)a4 fromPeer:(id)a5 certificateHandler:(id)a6;
- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5;
@end

@implementation LocalDraftsDeviceListener

- (_TtC7NewsUI225LocalDraftsDeviceListener)init
{
  return (_TtC7NewsUI225LocalDraftsDeviceListener *)sub_1DF457F24();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI225LocalDraftsDeviceListener_serviceBrowser);
  v5 = self;
  objc_msgSend(v4, sel_stopBrowsingForPeers);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(LocalDraftsDeviceListener *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI225LocalDraftsDeviceListener_delegate);
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7NewsUI225LocalDraftsDeviceListener____lazy_storage___session);
}

- (void)browser:(id)a3 didNotStartBrowsingForPeers:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_1DF458B70();
}

- (void)browser:(id)a3 foundPeer:(id)a4 withDiscoveryInfo:(id)a5
{
  if (a5) {
    sub_1DFDFDAF0();
  }
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_1DF458CB8(v8, v9);

  swift_bridgeObjectRelease();
}

- (void)browser:(id)a3 lostPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1DF458E58(v7);
}

- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14 = self;
  uint64_t v11 = sub_1DFDE72D0();
  unint64_t v13 = v12;

  sub_1DF458F94();
  sub_1DEA5E6E4(v11, v13);
}

- (void)session:(id)a3 didFinishReceivingResourceWithName:(id)a4 fromPeer:(id)a5 atURL:(id)a6 withError:(id)a7
{
  sub_1DEA3C638();
  MEMORY[0x1F4188790](v12 - 8);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1DFDFDD20();
  uint64_t v17 = v16;
  if (a6)
  {
    sub_1DFDE7190();
    uint64_t v18 = sub_1DFDE7220();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v14, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = sub_1DFDE7220();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v14, 1, 1, v19);
  }
  id v20 = a3;
  id v21 = a5;
  v22 = self;
  id v23 = a7;
  sub_1DF459260(v15, v17, (uint64_t)v14);

  swift_bridgeObjectRelease();
  sub_1DEB4B7AC((uint64_t)v14);
}

- (void)session:(id)a3 didReceiveCertificate:(id)a4 fromPeer:(id)a5 certificateHandler:(id)a6
{
  id v10 = _Block_copy(a6);
  if (a4) {
    sub_1DFDFE220();
  }
  uint64_t v11 = (void (*)(void *, uint64_t))v10[2];
  id v12 = a3;
  id v13 = a5;
  v14 = self;
  v11(v10, 1);
  _Block_release(v10);

  swift_bridgeObjectRelease();
}

@end