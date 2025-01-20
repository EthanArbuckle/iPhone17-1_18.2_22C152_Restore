@interface SECUserSession
- (_TtC10seserviced14SECUserSession)init;
- (void)armCredentialForCardEmulation:(id)a3 sceneIdentifier:(id)a4 reply:(id)a5;
- (void)armCurrentCredentialForCardEmulationWithSceneIdentifier:(id)a3 reply:(id)a4;
- (void)authorizeCredentialInWiredModeWith:(id)a3 instanceAID:(id)a4 sceneIdentifier:(id)a5 reply:(id)a6;
- (void)createCredentialWithServerConfigUUID:(id)a3 friendlyName:(id)a4 reply:(id)a5;
- (void)deleteCredential:(id)a3 reply:(id)a4;
- (void)endCardEmulationWithReply:(id)a3;
- (void)endWiredModeWithReply:(id)a3;
- (void)endWithReply:(id)a3;
- (void)getSessionStateWithReply:(id)a3;
- (void)listCredentialUUIDAndNamesWithReply:(id)a3;
- (void)modifyAccessForCredential:(id)a3 addingOwners:(id)a4 removingOwners:(id)a5 addingUsers:(id)a6 removingUsers:(id)a7 reply:(id)a8;
- (void)setCredentialInWiredModeWith:(id)a3 reply:(id)a4;
- (void)transceive:(id)a3 reply:(id)a4;
@end

@implementation SECUserSession

- (void)armCredentialForCardEmulation:(id)a3 sceneIdentifier:(id)a4 reply:(id)a5
{
  v35 = self;
  uint64_t v6 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v6 - 8, v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = v9;
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v14 = __chkstk_darwin(v10, v13);
  v15 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v16);
  v18 = (char *)&v32 - v17;
  v19 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v32 = v21;
  uint64_t v33 = v20;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v19;
  uint64_t v23 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v9, 1, 1, v23);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v18, v10);
  unint64_t v24 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v25 = (v12 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  v26 = (char *)swift_allocObject();
  *((void *)v26 + 2) = 0;
  *((void *)v26 + 3) = 0;
  v27 = v35;
  *((void *)v26 + 4) = v35;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v26[v24], v15, v10);
  v28 = (uint64_t *)&v26[v25];
  uint64_t v29 = v32;
  uint64_t *v28 = v33;
  v28[1] = v29;
  v30 = &v26[(v25 + 23) & 0xFFFFFFFFFFFFFFF8];
  *(void *)v30 = sub_10011FE58;
  *((void *)v30 + 1) = v22;
  v31 = v27;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10028E720((uint64_t)v34, (uint64_t)&unk_1004559F0, (uint64_t)v26);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v18, v10);
}

- (void)endCardEmulationWithReply:(id)a3
{
  uint64_t v5 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = self;
  v12[5] = sub_10011F6D0;
  v12[6] = v10;
  uint64_t v13 = self;
  swift_retain();
  sub_10028E720((uint64_t)v8, (uint64_t)&unk_1004559E0, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)endWithReply:(id)a3
{
  uint64_t v5 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = self;
  v12[5] = sub_1001D4A94;
  v12[6] = v10;
  uint64_t v13 = self;
  swift_retain();
  sub_10028E720((uint64_t)v8, (uint64_t)&unk_100457E08, (uint64_t)v12);
  swift_release();
  swift_release();
}

- (void)listCredentialUUIDAndNamesWithReply:(id)a3
{
  uint64_t v5 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = self;
  v12[5] = sub_1001D49C0;
  v12[6] = v10;
  uint64_t v13 = self;
  swift_retain();
  sub_10028E720((uint64_t)v8, (uint64_t)&unk_100457E00, (uint64_t)v12);
  swift_release();
  swift_release();
}

- (void)createCredentialWithServerConfigUUID:(id)a3 friendlyName:(id)a4 reply:(id)a5
{
  v35 = self;
  uint64_t v6 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v6 - 8, v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = v9;
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v14 = __chkstk_darwin(v10, v13);
  v15 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v16);
  v18 = (char *)&v32 - v17;
  v19 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v32 = v21;
  uint64_t v33 = v20;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v19;
  uint64_t v23 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v9, 1, 1, v23);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v18, v10);
  unint64_t v24 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v25 = (v12 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  v26 = (char *)swift_allocObject();
  *((void *)v26 + 2) = 0;
  *((void *)v26 + 3) = 0;
  v27 = v35;
  *((void *)v26 + 4) = v35;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v26[v24], v15, v10);
  v28 = (uint64_t *)&v26[v25];
  uint64_t v29 = v32;
  uint64_t *v28 = v33;
  v28[1] = v29;
  v30 = (void (**)(uint64_t, uint64_t))&v26[(v25 + 23) & 0xFFFFFFFFFFFFFFF8];
  char *v30 = sub_100129A64;
  v30[1] = (void (*)(uint64_t, uint64_t))v22;
  v31 = v27;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10028E720((uint64_t)v34, (uint64_t)&unk_100457DA0, (uint64_t)v26);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v18, v10);
}

- (void)deleteCredential:(id)a3 reply:(id)a4
{
  uint64_t v6 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v6 - 8, v7);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v14 = __chkstk_darwin(v10, v13);
  v15 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v16);
  v18 = (char *)&v27 - v17;
  v19 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  uint64_t v21 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v9, 1, 1, v21);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v18, v10);
  unint64_t v22 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v23 = (v12 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (char *)swift_allocObject();
  *((void *)v24 + 2) = 0;
  *((void *)v24 + 3) = 0;
  *((void *)v24 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v24[v22], v15, v10);
  unint64_t v25 = &v24[v23];
  *(void *)unint64_t v25 = sub_10011FE58;
  *((void *)v25 + 1) = v20;
  v26 = self;
  swift_retain();
  sub_10028E720((uint64_t)v9, (uint64_t)&unk_100457D78, (uint64_t)v24);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v18, v10);
}

- (void)modifyAccessForCredential:(id)a3 addingOwners:(id)a4 removingOwners:(id)a5 addingUsers:(id)a6 removingUsers:(id)a7 reply:(id)a8
{
  uint64_t v36 = (uint64_t)a6;
  uint64_t v37 = (uint64_t)a7;
  v40 = self;
  uint64_t v9 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = v12;
  uint64_t v41 = type metadata accessor for UUID();
  uint64_t v13 = *(void *)(v41 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v16 = __chkstk_darwin(v41, v15);
  uint64_t v33 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v17);
  v19 = (char *)&v32 - v18;
  uint64_t v20 = _Block_copy(a8);
  v39 = v19;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v35 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v36 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v34 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = v20;
  uint64_t v22 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v12, 1, 1, v22);
  uint64_t v23 = v41;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))((char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v19, v41);
  unint64_t v24 = (*(unsigned __int8 *)(v13 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v25 = (char *)swift_allocObject();
  *((void *)v25 + 2) = 0;
  *((void *)v25 + 3) = 0;
  v26 = v40;
  *((void *)v25 + 4) = v40;
  *((void *)v25 + 5) = v21;
  uint64_t v27 = v36;
  *((void *)v25 + 6) = v35;
  *((void *)v25 + 7) = v27;
  v28 = v33;
  *((void *)v25 + 8) = v34;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v25[v24], v28, v23);
  uint64_t v29 = (void (**)(uint64_t))&v25[(v14 + v24 + 7) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v30 = v37;
  *uint64_t v29 = sub_10011F6D0;
  v29[1] = (void (*)(uint64_t))v30;
  v31 = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10028E720((uint64_t)v38, (uint64_t)&unk_100457D68, (uint64_t)v25);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v13 + 8))(v39, v41);
}

- (void)getSessionStateWithReply:(id)a3
{
  uint64_t v5 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = self;
  v12[5] = sub_1001D3B88;
  v12[6] = v10;
  uint64_t v13 = self;
  swift_retain();
  sub_10028E720((uint64_t)v8, (uint64_t)&unk_100457D58, (uint64_t)v12);
  swift_release();
  swift_release();
}

- (_TtC10seserviced14SECUserSession)init
{
  result = (_TtC10seserviced14SECUserSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1001D0630(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced14SECUserSession_wrappedState), *(void **)&self->wrappedState[OBJC_IVAR____TtC10seserviced14SECUserSession_wrappedState], *(void **)&self->wrappedState[OBJC_IVAR____TtC10seserviced14SECUserSession_wrappedState + 8], *(void *)&self->wrappedState[OBJC_IVAR____TtC10seserviced14SECUserSession_wrappedState + 16]);
  swift_bridgeObjectRelease();
  sub_10008BECC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10seserviced14SECUserSession_installFinishedCallback));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC10seserviced14SECUserSession_sessionIdentifier;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10007594C((uint64_t)self + OBJC_IVAR____TtC10seserviced14SECUserSession_networkController);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_10008BECC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10seserviced14SECUserSession_sessionManagementDelegate));
  swift_unknownObjectWeakDestroy();

  swift_release();
}

- (void)setCredentialInWiredModeWith:(id)a3 reply:(id)a4
{
  uint64_t v6 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v14 = __chkstk_darwin(v10, v13);
  uint64_t v15 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v16);
  uint64_t v18 = (char *)&v27 - v17;
  v19 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  uint64_t v21 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v9, 1, 1, v21);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v18, v10);
  unint64_t v22 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v23 = (v12 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (char *)swift_allocObject();
  *((void *)v24 + 2) = 0;
  *((void *)v24 + 3) = 0;
  *((void *)v24 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v24[v22], v15, v10);
  unint64_t v25 = &v24[v23];
  *(void *)unint64_t v25 = sub_10011FE58;
  *((void *)v25 + 1) = v20;
  v26 = self;
  swift_retain();
  sub_10028E720((uint64_t)v9, (uint64_t)&unk_100459B20, (uint64_t)v24);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v18, v10);
}

- (void)authorizeCredentialInWiredModeWith:(id)a3 instanceAID:(id)a4 sceneIdentifier:(id)a5 reply:(id)a6
{
  v50 = self;
  uint64_t v9 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = v12;
  uint64_t v52 = type metadata accessor for UUID();
  uint64_t v13 = *(void *)(v52 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v16 = __chkstk_darwin(v52, v15);
  uint64_t v17 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v18);
  uint64_t v20 = (char *)&v45 - v19;
  uint64_t v21 = _Block_copy(a6);
  unint64_t v22 = v20;
  v51 = v20;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v23 = a4;
  id v24 = a5;
  unint64_t v25 = v50;
  v26 = (_TtC10seserviced14SECUserSession *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v49 = v27;
  v50 = v26;

  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v47 = v29;
  uint64_t v48 = v28;

  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v21;
  uint64_t v31 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v12, 1, 1, v31);
  uint64_t v32 = v52;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v17, v22, v52);
  unint64_t v33 = (*(unsigned __int8 *)(v13 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v34 = (v14 + v33 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v35 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v36 = (v35 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v37 = (char *)swift_allocObject();
  *((void *)v37 + 2) = 0;
  *((void *)v37 + 3) = 0;
  *((void *)v37 + 4) = v25;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v37[v33], v17, v32);
  v38 = (_TtC10seserviced14SECUserSession **)&v37[v34];
  unint64_t v40 = v49;
  v39 = v50;
  char *v38 = v50;
  v38[1] = (_TtC10seserviced14SECUserSession *)v40;
  uint64_t v41 = (uint64_t *)&v37[v35];
  uint64_t v42 = v47;
  *uint64_t v41 = v48;
  v41[1] = v42;
  v43 = &v37[v36];
  *(void *)v43 = sub_10011FE58;
  *((void *)v43 + 1) = v30;
  v44 = v25;
  sub_10006D0EC((uint64_t)v39, v40);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10028E720((uint64_t)v46, (uint64_t)&unk_100459B08, (uint64_t)v37);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_10006D144((uint64_t)v39, v40);

  (*(void (**)(char *, uint64_t))(v13 + 8))(v51, v32);
}

- (void)transceive:(id)a3 reply:(id)a4
{
  uint64_t v7 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  id v12 = a3;
  uint64_t v13 = self;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v11;
  id v18 = [self currentConnection];
  if (v18)
  {
    uint64_t v19 = v18;
    unsigned int v20 = [v18 processIdentifier];
    uint64_t v21 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v10, 1, 1, v21);
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = 0;
    *(void *)(v22 + 24) = 0;
    *(void *)(v22 + 32) = v13;
    *(_DWORD *)(v22 + 40) = v20;
    *(void *)(v22 + 48) = v14;
    *(void *)(v22 + 56) = v16;
    *(void *)(v22 + 64) = sub_100219A48;
    *(void *)(v22 + 72) = v17;
    id v23 = v13;
    sub_10006D0EC(v14, v16);
    swift_retain();
    sub_10028E720((uint64_t)v10, (uint64_t)&unk_100459AF8, v22);
    swift_release();

    swift_release();
    sub_10006D144(v14, v16);
  }
  else
  {
    __break(1u);
  }
}

- (void)armCurrentCredentialForCardEmulationWithSceneIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v6 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v10;
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
  unint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = self;
  v16[5] = sub_10011FE58;
  v16[6] = v14;
  v16[7] = v11;
  v16[8] = v13;
  uint64_t v17 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_10028E720((uint64_t)v9, (uint64_t)&unk_100459AC8, (uint64_t)v16);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)endWiredModeWithReply:(id)a3
{
  uint64_t v5 = sub_10006C51C(&qword_100455C60);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = self;
  v12[5] = sub_10011F6D0;
  v12[6] = v10;
  uint64_t v13 = self;
  swift_retain();
  sub_10028E720((uint64_t)v8, (uint64_t)&unk_100459AB0, (uint64_t)v12);

  swift_release();
  swift_release();
}

@end