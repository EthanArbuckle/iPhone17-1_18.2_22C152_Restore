@interface ReplicatorControlClientObjcBridge
- (BOOL)isAllowListEnabled;
- (BOOL)isEnabled;
- (_TtC18ReplicatorServices33ReplicatorControlClientObjcBridge)init;
- (id)allowList;
- (id)devices;
- (id)pushToken:(id)a3;
- (void)setAllowList:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation ReplicatorControlClientObjcBridge

- (id)devices
{
  v2 = self;
  sub_25B2C8D2C();

  sub_25B2CA330();
  v3 = (void *)sub_25B37FAE0();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)isEnabled
{
  return sub_25B2C933C(self);
}

- (void)setEnabled:(BOOL)a3
{
  v4 = self;
  sub_25B2C9048(a3);
}

- (BOOL)isAllowListEnabled
{
  return sub_25B2C933C(self);
}

- (id)allowList
{
  v2 = self;
  uint64_t v3 = sub_25B2C93C0();

  if (v3)
  {
    sub_25B37F640();
    v4 = (void *)sub_25B37FAE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setAllowList:(id)a3
{
  if (a3)
  {
    sub_25B37F640();
    v4 = (void *)sub_25B37FAF0();
  }
  else
  {
    v4 = 0;
  }
  v5 = self;
  v6._rawValue = v4;
  sub_25B2C9534(v6);

  swift_bridgeObjectRelease();
}

- (id)pushToken:(id)a3
{
  uint64_t v4 = sub_25B37F640();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25B37F620();
  v8 = self;
  uint64_t v9 = sub_25B2C9824();
  unint64_t v11 = v10;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v12 = 0;
  if (v11 >> 60 != 15)
  {
    v12 = (void *)sub_25B37F560();
    sub_25B2CA2C4(v9, v11);
  }
  return v12;
}

- (_TtC18ReplicatorServices33ReplicatorControlClientObjcBridge)init
{
  uint64_t v3 = OBJC_IVAR____TtC18ReplicatorServices33ReplicatorControlClientObjcBridge_controlClient;
  type metadata accessor for ReplicatorControlClient();
  swift_allocObject();
  uint64_t v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)ReplicatorControlClient.init()();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ReplicatorControlClientObjcBridge();
  return [(ReplicatorControlClientObjcBridge *)&v6 init];
}

- (void).cxx_destruct
{
}

@end