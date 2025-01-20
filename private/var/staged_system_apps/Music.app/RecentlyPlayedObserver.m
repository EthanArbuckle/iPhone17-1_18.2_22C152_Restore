@interface RecentlyPlayedObserver
- (_TtC5Music22RecentlyPlayedObserver)init;
- (void)registerHandler:(id)a3;
@end

@implementation RecentlyPlayedObserver

- (void)registerHandler:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = sub_100063814(&qword_10109BA40);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = self;
  v12[5] = sub_1006BDC80;
  v12[6] = v10;
  v12[7] = ObjectType;
  v13 = self;
  swift_retain();
  sub_100194C9C((uint64_t)v8, (uint64_t)&unk_1010B65C8, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (_TtC5Music22RecentlyPlayedObserver)init
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC5Music22RecentlyPlayedObserver_pushObserver;
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)*PushNotificationObserver.shared.unsafeMutableAddressor();
  swift_retain();

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return [(RecentlyPlayedObserver *)&v7 init];
}

- (void).cxx_destruct
{
}

@end