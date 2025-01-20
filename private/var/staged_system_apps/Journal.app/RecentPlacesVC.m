@interface RecentPlacesVC
- (_TtC7Journal14RecentPlacesVC)initWithCoder:(id)a3;
- (_TtC7Journal14RecentPlacesVC)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Journal14RecentPlacesVC)initWithStyle:(int64_t)a3;
- (void)refreshData;
- (void)viewDidLoad;
@end

@implementation RecentPlacesVC

- (void)viewDidLoad
{
  v2 = self;
  sub_1005267B8();
}

- (void)refreshData
{
  uint64_t v3 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  v7 = self;
  uint64_t v8 = static MainActor.shared.getter();
  v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  sub_100328A60((uint64_t)v5, (uint64_t)&unk_100810A90, (uint64_t)v9);

  swift_release();
}

- (_TtC7Journal14RecentPlacesVC)initWithStyle:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal14RecentPlacesVC_dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal14RecentPlacesVC_cancellable) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RecentPlacesVC();
  return [(RecentPlacesVC *)&v5 initWithStyle:a3];
}

- (_TtC7Journal14RecentPlacesVC)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal14RecentPlacesVC_dataSource) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal14RecentPlacesVC_cancellable) = 0;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal14RecentPlacesVC_dataSource) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal14RecentPlacesVC_cancellable) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for RecentPlacesVC();
  v9 = [(RecentPlacesVC *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC7Journal14RecentPlacesVC)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal14RecentPlacesVC_dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal14RecentPlacesVC_cancellable) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RecentPlacesVC();
  return [(RecentPlacesVC *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_release();
}

@end