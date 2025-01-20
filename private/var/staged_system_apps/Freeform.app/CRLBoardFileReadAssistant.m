@interface CRLBoardFileReadAssistant
- (_TtC8Freeform25CRLBoardFileReadAssistant)init;
- (void)getOriginalBoardUUIDWithCompletionHandler:(id)a3;
- (void)readBoardWithCompletionHandler:(id)a3;
@end

@implementation CRLBoardFileReadAssistant

- (void)readBoardWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1016782B0;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1016782B8;
  v13[5] = v12;
  v14 = self;
  sub_100E6DE90((uint64_t)v8, (uint64_t)&unk_1016782C0, (uint64_t)v13);
  swift_release();
}

- (void)getOriginalBoardUUIDWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1016782A0;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10169FAB0;
  v13[5] = v12;
  v14 = self;
  sub_100E6DE90((uint64_t)v8, (uint64_t)&unk_10169A060, (uint64_t)v13);
  swift_release();
}

- (_TtC8Freeform25CRLBoardFileReadAssistant)init
{
  result = (_TtC8Freeform25CRLBoardFileReadAssistant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform25CRLBoardFileReadAssistant_url;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

@end