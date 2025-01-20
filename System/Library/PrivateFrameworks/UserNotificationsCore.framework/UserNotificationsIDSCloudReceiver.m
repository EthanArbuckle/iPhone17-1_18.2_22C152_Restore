@interface UserNotificationsIDSCloudReceiver
- (_TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver)init;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
@end

@implementation UserNotificationsIDSCloudReceiver

- (_TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver)init
{
  result = (_TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_26094056C((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver_notificationDelegate);
  sub_26094056C((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver_attachmentDelegate);
  sub_26094056C((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver_categoriesDelegate);
  sub_26094056C((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver_actionsDelegate);
  v3 = (char *)self + OBJC_IVAR____TtC21UserNotificationsCore33UserNotificationsIDSCloudReceiver_coordinationDelegate;

  sub_26094056C((uint64_t)v3);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = a6;
  if (a5)
  {
    uint64_t v12 = sub_260A84B30();
    if (v8)
    {
LABEL_3:
      uint64_t v13 = sub_260A84BC0();
      id v8 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
LABEL_6:
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  v18 = self;
  sub_260A4C87C(a3, a4, v12, v13, (uint64_t)v8, a7);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B3F7910);
  MEMORY[0x270FA5388](v15 - 8);
  id v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_260A83AF0();
    uint64_t v18 = sub_260A83B40();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = sub_260A83B40();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 1, 1, v19);
  }
  if (a6) {
    a6 = (id)sub_260A84B30();
  }
  if (a7)
  {
    uint64_t v20 = sub_260A84BC0();
    a7 = v21;
  }
  else
  {
    uint64_t v20 = 0;
  }
  id v22 = a3;
  id v23 = a4;
  id v24 = a8;
  v25 = self;
  sub_260A50CC0(a3, a4, (uint64_t)v17, (uint64_t)a6, v20, (uint64_t)a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_26093FEC8((uint64_t)v17, (uint64_t *)&unk_26B3F7910);
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  v9 = a5;
  if (a5)
  {
    id v12 = a3;
    id v13 = a4;
    id v14 = a6;
    id v15 = a7;
    uint64_t v16 = self;
    id v17 = v9;
    v9 = (void *)sub_260A83B80();
    unint64_t v19 = v18;

    if (a6)
    {
LABEL_3:
      uint64_t v20 = sub_260A84BC0();
      unint64_t v22 = v21;

      goto LABEL_6;
    }
  }
  else
  {
    id v23 = a3;
    id v24 = a4;
    id v25 = a6;
    id v26 = a7;
    v27 = self;
    unint64_t v19 = 0xF000000000000000;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = 0;
  unint64_t v22 = 0;
LABEL_6:
  sub_260A4EE04(a3, a4, (uint8_t *)v9, v19, v20, v22, a7);
  swift_bridgeObjectRelease();
  sub_260971540((uint64_t)v9, v19);
}

@end