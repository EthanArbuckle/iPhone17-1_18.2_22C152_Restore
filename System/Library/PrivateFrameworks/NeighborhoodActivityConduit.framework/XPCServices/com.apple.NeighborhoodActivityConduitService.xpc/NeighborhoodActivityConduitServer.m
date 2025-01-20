@interface NeighborhoodActivityConduitServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer)init;
- (void)activeSplitSessionTVDeviceWithCompletion:(id)a3;
- (void)dealloc;
- (void)disconnectTVDevice:(id)a3 completion:(id)a4;
- (void)handoffConversation:(id)a3 toTVDevice:(id)a4 completion:(id)a5;
- (void)inviteTVDevice:(id)a3 toConversation:(id)a4 completion:(id)a5;
- (void)isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion:(id)a3;
- (void)nearbyTVDevicesWithCompletion:(id)a3;
- (void)pullConversation:(id)a3 fromTVDevice:(id)a4 completion:(id)a5;
- (void)registerSplitSessionApprovalEnabled:(BOOL)a3;
- (void)respondToSuggestionWithResult:(id)a3 completion:(id)a4;
- (void)setSuggestedTVDeviceName:(id)a3 completion:(id)a4;
- (void)startConversationWith:(id)a3 on:(id)a4 completion:(id)a5;
- (void)suggestionWithCompletion:(id)a3;
@end

@implementation NeighborhoodActivityConduitServer

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  if (qword_100116160 != -1) {
    swift_once();
  }
  CFNotificationCenterRemoveObserver(v5, 0, (CFNotificationName)qword_100116F50, 0);

  v6.receiver = v4;
  v6.super_class = ObjectType;
  [(NeighborhoodActivityConduitServer *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer_conduit));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer_suggestionController));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer_splitSessionApprovalConnection);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  swift_allocObject();
  swift_unknownObjectWeakInit();
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1000E2760();

  swift_release();
  return v11;
}

- (void)nearbyTVDevicesWithCompletion:(id)a3
{
  uint64_t v5 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v5 - 8, v6);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = sub_1000E25E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = sub_1000156A4;
  v12[5] = v10;
  v12[6] = self;
  v13 = self;
  swift_retain();
  sub_1000A82D8((uint64_t)v8, (uint64_t)&unk_100117168, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)activeSplitSessionTVDeviceWithCompletion:(id)a3
{
  uint64_t v5 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v5 - 8, v6);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = sub_1000E25E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = sub_100015F54;
  v12[5] = v10;
  v12[6] = self;
  v13 = self;
  swift_retain();
  sub_1000A82D8((uint64_t)v8, (uint64_t)&unk_100117158, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = self;
  swift_retain();
  sub_1000E2110();
  swift_release();
  (*((void (**)(void *, void, void))v4 + 2))(v4, v6, 0);
  _Block_release(v4);
}

- (void)suggestionWithCompletion:(id)a3
{
  uint64_t v5 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v5 - 8, v6);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = sub_1000E25E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = self;
  v12[5] = sub_100015F54;
  v12[6] = v10;
  v13 = self;
  swift_retain();
  sub_1000A82D8((uint64_t)v8, (uint64_t)&unk_100117148, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)setSuggestedTVDeviceName:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v6 - 8, v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = sub_1000E23F0();
  uint64_t v13 = v12;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v10;
  uint64_t v15 = sub_1000E25E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = self;
  v16[5] = v11;
  v16[6] = v13;
  v16[7] = sub_10001526C;
  v16[8] = v14;
  v17 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1000A82D8((uint64_t)v9, (uint64_t)&unk_100117138, (uint64_t)v16);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)inviteTVDevice:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  v32 = self;
  uint64_t v7 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = v10;
  uint64_t v11 = sub_1000E1140();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v15 = __chkstk_darwin(v11, v14);
  v16 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15, v17);
  v19 = (char *)&v31 - v18;
  v20 = _Block_copy(a5);
  sub_1000E1110();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v20;
  uint64_t v22 = sub_1000E25E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v10, 1, 1, v22);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v16, v19, v11);
  unint64_t v23 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v24 = (v13 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  v25 = (char *)swift_allocObject();
  *((void *)v25 + 2) = 0;
  *((void *)v25 + 3) = 0;
  v26 = v32;
  *((void *)v25 + 4) = v32;
  *((void *)v25 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v25[v23], v16, v11);
  v27 = &v25[v24];
  *(void *)v27 = sub_100015F50;
  *((void *)v27 + 1) = v21;
  id v28 = a3;
  v29 = v26;
  id v30 = v28;
  swift_retain();
  sub_1000A82D8((uint64_t)v31, (uint64_t)&unk_100117128, (uint64_t)v25);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v19, v11);
}

- (void)disconnectTVDevice:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = sub_1000E25E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = sub_100015F50;
  v14[7] = v12;
  id v15 = a3;
  v16 = self;
  id v17 = v15;
  swift_retain();
  sub_1000A82D8((uint64_t)v10, (uint64_t)&unk_100117118, (uint64_t)v14);

  swift_release();
  swift_release();
}

- (void)respondToSuggestionWithResult:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = sub_1000E25E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = sub_100015F50;
  v14[7] = v12;
  id v15 = a3;
  v16 = self;
  id v17 = v15;
  swift_retain();
  sub_1000A82D8((uint64_t)v10, (uint64_t)&unk_100117108, (uint64_t)v14);

  swift_release();
  swift_release();
}

- (void)registerSplitSessionApprovalEnabled:(BOOL)a3
{
  v4 = self;
  sub_10001330C(a3);
}

- (void)handoffConversation:(id)a3 toTVDevice:(id)a4 completion:(id)a5
{
  v33 = self;
  id v34 = a4;
  uint64_t v6 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = v9;
  uint64_t v10 = sub_1000E1140();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v14 = __chkstk_darwin(v10, v13);
  id v15 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v16);
  uint64_t v18 = (char *)&v31 - v17;
  v19 = _Block_copy(a5);
  sub_1000E1110();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  uint64_t v21 = sub_1000E25E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v9, 1, 1, v21);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v18, v10);
  unint64_t v22 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v23 = (v12 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (char *)swift_allocObject();
  *((void *)v24 + 2) = 0;
  *((void *)v24 + 3) = 0;
  v25 = v33;
  *((void *)v24 + 4) = v33;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v24[v22], v15, v10);
  v26 = v34;
  *(void *)&v24[v23] = v34;
  v27 = &v24[(v23 + 15) & 0xFFFFFFFFFFFFFFF8];
  *(void *)v27 = sub_100015F50;
  *((void *)v27 + 1) = v20;
  id v28 = v26;
  v29 = v25;
  id v30 = v28;
  swift_retain();
  sub_1000A82D8((uint64_t)v32, (uint64_t)&unk_1001170F8, (uint64_t)v24);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v18, v10);
}

- (void)pullConversation:(id)a3 fromTVDevice:(id)a4 completion:(id)a5
{
  v33 = self;
  id v34 = a4;
  uint64_t v6 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = v9;
  uint64_t v10 = sub_1000E1140();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v14 = __chkstk_darwin(v10, v13);
  id v15 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v16);
  uint64_t v18 = (char *)&v31 - v17;
  v19 = _Block_copy(a5);
  sub_1000E1110();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  uint64_t v21 = sub_1000E25E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v9, 1, 1, v21);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v18, v10);
  unint64_t v22 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v23 = (v12 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (char *)swift_allocObject();
  *((void *)v24 + 2) = 0;
  *((void *)v24 + 3) = 0;
  v25 = v33;
  *((void *)v24 + 4) = v33;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v24[v22], v15, v10);
  v26 = v34;
  *(void *)&v24[v23] = v34;
  v27 = (void (**)(char, uint64_t))&v24[(v23 + 15) & 0xFFFFFFFFFFFFFFF8];
  char *v27 = sub_100014B18;
  v27[1] = (void (*)(char, uint64_t))v20;
  id v28 = v26;
  v29 = v25;
  id v30 = v28;
  swift_retain();
  sub_1000A82D8((uint64_t)v32, (uint64_t)&unk_1001170E8, (uint64_t)v24);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v18, v10);
}

- (void)startConversationWith:(id)a3 on:(id)a4 completion:(id)a5
{
  uint64_t v8 = sub_100004D9C((uint64_t *)&unk_1001170B0);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  sub_100006C20(0, (unint64_t *)&unk_100117230);
  sub_10001494C(&qword_1001170C0, (unint64_t *)&unk_100117230);
  uint64_t v13 = sub_1000E2660();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  uint64_t v15 = sub_1000E25E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 1, 1, v15);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = sub_1000149DC;
  v16[5] = v14;
  v16[6] = self;
  v16[7] = v13;
  v16[8] = a4;
  id v17 = a4;
  uint64_t v18 = self;
  id v19 = v17;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1000A82D8((uint64_t)v11, (uint64_t)&unk_1001170D0, (uint64_t)v16);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (_TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer)init
{
  result = (_TtC44com_apple_NeighborhoodActivityConduitService33NeighborhoodActivityConduitServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end