@interface ArticleViewerAppStateMonitor
- (_TtC12NewsArticles28ArticleViewerAppStateMonitor)init;
- (void)performOnApplicationDidBecomeActive:(id)a3;
- (void)performOnApplicationDidEnterBackground:(id)a3;
- (void)performOnApplicationWillEnterForeground:(id)a3;
- (void)performOnApplicationWindowDidBecomeBackground:(id)a3;
- (void)performOnApplicationWindowDidBecomeForeground:(id)a3;
@end

@implementation ArticleViewerAppStateMonitor

- (_TtC12NewsArticles28ArticleViewerAppStateMonitor)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (objc_class *)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles28ArticleViewerAppStateMonitor_onForegroundClosures) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12NewsArticles28ArticleViewerAppStateMonitor_onEnterBackgroundClosures) = v4;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12NewsArticles28ArticleViewerAppStateMonitor_onWindowForegroundClosures) = v4;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12NewsArticles28ArticleViewerAppStateMonitor_onWindowBackgroundClosures) = v4;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(ArticleViewerAppStateMonitor *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)performOnApplicationWillEnterForeground:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1BF648930;
  *(void *)(v6 + 24) = v5;
  v7 = (void **)((char *)self + OBJC_IVAR____TtC12NewsArticles28ArticleViewerAppStateMonitor_onForegroundClosures);
  swift_beginAccess();
  v8 = *v7;
  v9 = self;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1BF700654(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  unint64_t v12 = v8[2];
  unint64_t v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_1BF700654((void *)(v11 > 1), v12 + 1, 1, v8);
    *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = sub_1BF64894C;
  v13[5] = v6;
  swift_endAccess();

  swift_release();
}

- (void)performOnApplicationDidBecomeActive:(id)a3
{
  v3 = _Block_copy(a3);

  _Block_release(v3);
}

- (void)performOnApplicationDidEnterBackground:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1BF648930;
  *(void *)(v6 + 24) = v5;
  v7 = (void **)((char *)self + OBJC_IVAR____TtC12NewsArticles28ArticleViewerAppStateMonitor_onEnterBackgroundClosures);
  swift_beginAccess();
  v8 = *v7;
  v9 = self;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1BF700654(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  unint64_t v12 = v8[2];
  unint64_t v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_1BF700654((void *)(v11 > 1), v12 + 1, 1, v8);
    *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = sub_1BF64894C;
  v13[5] = v6;
  swift_endAccess();

  swift_release();
}

- (void)performOnApplicationWindowDidBecomeForeground:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1BF648930;
  *(void *)(v6 + 24) = v5;
  v7 = (void **)((char *)self + OBJC_IVAR____TtC12NewsArticles28ArticleViewerAppStateMonitor_onWindowForegroundClosures);
  swift_beginAccess();
  v8 = *v7;
  v9 = self;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1BF700654(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  unint64_t v12 = v8[2];
  unint64_t v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_1BF700654((void *)(v11 > 1), v12 + 1, 1, v8);
    *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = sub_1BF64894C;
  v13[5] = v6;
  swift_endAccess();

  swift_release();
}

- (void)performOnApplicationWindowDidBecomeBackground:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1BF6488E8;
  *(void *)(v6 + 24) = v5;
  v7 = (void **)((char *)self + OBJC_IVAR____TtC12NewsArticles28ArticleViewerAppStateMonitor_onWindowBackgroundClosures);
  swift_beginAccess();
  v8 = *v7;
  v9 = self;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1BF700654(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  unint64_t v12 = v8[2];
  unint64_t v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_1BF700654((void *)(v11 > 1), v12 + 1, 1, v8);
    *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = sub_1BF4B0FEC;
  v13[5] = v6;
  swift_endAccess();

  swift_release();
}

@end