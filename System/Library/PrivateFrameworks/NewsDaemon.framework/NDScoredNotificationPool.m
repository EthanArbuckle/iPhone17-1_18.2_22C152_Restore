@interface NDScoredNotificationPool
- (NDScoredNotificationPool)init;
- (void)enumerateItemsUsingBlock:(id)a3;
- (void)refreshIfNeededWithCompletionHandler:(id)a3;
- (void)refreshIfOlderThan:(NSDate *)a3 completionHandler:(id)a4;
@end

@implementation NDScoredNotificationPool

- (void)enumerateItemsUsingBlock:(id)a3
{
  v5 = _Block_copy(a3);
  v4 = self;
  OS_dispatch_queue.sync<A>(execute:)();
  _Block_release(v5);
}

- (void)refreshIfNeededWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000170E8(&qword_10006B220);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10006BB30;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10006BB38;
  v12[5] = v11;
  v13 = self;
  sub_100040A38((uint64_t)v7, (uint64_t)&unk_10006BB40, (uint64_t)v12);
  swift_release();
}

- (void)refreshIfOlderThan:(NSDate *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000170E8(&qword_10006B220);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10006BA80;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10006BA90;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100040A38((uint64_t)v9, (uint64_t)&unk_10006BAA0, (uint64_t)v14);
  swift_release();
}

- (NDScoredNotificationPool)init
{
  result = (NDScoredNotificationPool *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR___NDScoredNotificationPool_cacheDirectory;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NDScoredNotificationPool__index);
}

@end