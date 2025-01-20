@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC14WidgetRenderer11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (uint64_t)applicationDidReceiveMemoryWarning:;
@end

@implementation AppDelegate

- (_TtC14WidgetRenderer11AppDelegate)init
{
  v3 = (char *)self + OBJC_IVAR____TtC14WidgetRenderer11AppDelegate_lastDataProtectionValue;
  uint64_t v4 = *MEMORY[0x263F1FDA0];
  uint64_t v5 = sub_2618FB1F0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104))(v3, v4, v5);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC14WidgetRenderer11AppDelegate_dataProtectionMonitorSubscription) = 0;
  if (qword_26B413BD8 != -1) {
    swift_once();
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AppDelegate();
  return [(AppDelegate *)&v7 init];
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_2618ADF0C(&qword_26A939FE8, type metadata accessor for LaunchOptionsKey);
    sub_2618FB2A0();
  }
  id v6 = a3;
  objc_super v7 = self;
  char v8 = sub_2618AD68C();

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  BSDispatchQueueAssertMain();
  type metadata accessor for WidgetSceneDelegate();
  id v12 = objc_msgSend(v9, sel_role);
  id v13 = objc_allocWithZone(MEMORY[0x263F82B48]);
  v14 = (void *)sub_2618FB300();
  id v15 = objc_msgSend(v13, sel_initWithName_sessionRole_, v14, v12);

  objc_msgSend(v15, sel_setDelegateClass_, swift_getObjCClassFromMetadata());

  return v15;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC14WidgetRenderer11AppDelegate_lastDataProtectionValue;
  uint64_t v3 = sub_2618FB1F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_release();
}

- (uint64_t)applicationDidReceiveMemoryWarning:
{
  v0 = (char **)sub_2618F9F80();
  int64_t v1 = (int64_t)*(v0 - 1);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2618FB5B0();
  if (qword_26B4129D0 != -1) {
LABEL_37:
  }
    swift_once();
  sub_2618F9F70();
  sub_2618F9F50();
  (*(void (**)(char *, char **))(v1 + 8))(v3, v0);
  id v4 = objc_msgSend(self, sel_sharedApplication);
  id v5 = objc_msgSend(v4, sel_connectedScenes);

  uint64_t v6 = sub_2618A2568(0, &qword_26B414908);
  uint64_t v3 = (char *)sub_2618A201C((unint64_t *)&qword_26B414910, &qword_26B414908);
  uint64_t v7 = sub_2618FB480();

  v25[3] = v6;
  if ((v7 & 0xC000000000000001) != 0)
  {
    sub_2618FB770();
    sub_2618FB4A0();
    uint64_t v7 = v25[7];
    uint64_t v8 = v25[8];
    uint64_t v9 = v25[9];
    uint64_t v10 = v25[10];
    unint64_t v11 = v25[11];
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = -1 << *(unsigned char *)(v7 + 32);
    uint64_t v8 = v7 + 56;
    uint64_t v9 = ~v12;
    uint64_t v13 = -v12;
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v11 = v14 & *(void *)(v7 + 56);
  }
  v25[4] = v7 & 0x7FFFFFFFFFFFFFFFLL;
  v25[1] = v9;
  int64_t v1 = (unint64_t)(v9 + 64) >> 6;
  v0 = &selRef_initWithContentRect_;
  v25[2] = MEMORY[0x263F8EE50] + 8;
  while (v7 < 0)
  {
    uint64_t v18 = sub_2618FB7E0();
    if (!v18) {
      return sub_26188ED58();
    }
    uint64_t v3 = (char *)v18;
    v25[5] = v18;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v19 = (id)v25[6];
    swift_unknownObjectRelease();
    uint64_t v17 = v10;
    uint64_t v15 = v11;
    if (!v19) {
      return sub_26188ED58();
    }
LABEL_32:
    if (objc_msgSend(v19, sel_delegate))
    {
      type metadata accessor for WidgetSceneDelegate();
      uint64_t v23 = swift_dynamicCastClass();
      if (v23)
      {
        uint64_t v3 = (char *)v23;
        sub_2618973B8();
      }
      swift_unknownObjectRelease();
    }

    uint64_t v10 = v17;
    unint64_t v11 = v15;
  }
  if (v11)
  {
    uint64_t v15 = (v11 - 1) & v11;
    unint64_t v16 = __clz(__rbit64(v11)) | (v10 << 6);
    uint64_t v17 = v10;
    goto LABEL_31;
  }
  int64_t v20 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v20 >= v1) {
    return sub_26188ED58();
  }
  unint64_t v21 = *(void *)(v8 + 8 * v20);
  uint64_t v17 = v10 + 1;
  if (v21) {
    goto LABEL_30;
  }
  uint64_t v17 = v10 + 2;
  if (v10 + 2 >= v1) {
    return sub_26188ED58();
  }
  unint64_t v21 = *(void *)(v8 + 8 * v17);
  if (v21) {
    goto LABEL_30;
  }
  uint64_t v17 = v10 + 3;
  if (v10 + 3 >= v1) {
    return sub_26188ED58();
  }
  unint64_t v21 = *(void *)(v8 + 8 * v17);
  if (v21) {
    goto LABEL_30;
  }
  uint64_t v17 = v10 + 4;
  if (v10 + 4 >= v1) {
    return sub_26188ED58();
  }
  unint64_t v21 = *(void *)(v8 + 8 * v17);
  if (v21)
  {
LABEL_30:
    uint64_t v15 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v17 << 6);
LABEL_31:
    id v19 = *(id *)(*(void *)(v7 + 48) + 8 * v16);
    if (!v19) {
      return sub_26188ED58();
    }
    goto LABEL_32;
  }
  uint64_t v22 = v10 + 5;
  while (v1 != v22)
  {
    unint64_t v21 = *(void *)(v8 + 8 * v22++);
    if (v21)
    {
      uint64_t v17 = v22 - 1;
      goto LABEL_30;
    }
  }
  return sub_26188ED58();
}

@end