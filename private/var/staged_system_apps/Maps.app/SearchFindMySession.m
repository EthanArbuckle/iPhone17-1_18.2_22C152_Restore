@interface SearchFindMySession
- (_TtC4Maps19SearchFindMySession)init;
@end

@implementation SearchFindMySession

- (_TtC4Maps19SearchFindMySession)init
{
  uint64_t v3 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19SearchFindMySession_session) = 0;
  MySession = (objc_class *)type metadata accessor for SearchFindMySession();
  v12.receiver = self;
  v12.super_class = MySession;
  v7 = [(SearchFindMySession *)&v12 init];
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v7;
  v10 = v7;
  sub_100042AF4((uint64_t)v5, (uint64_t)&unk_1015D7838, (uint64_t)v9);
  swift_release();
  return v10;
}

- (void).cxx_destruct
{
}

@end