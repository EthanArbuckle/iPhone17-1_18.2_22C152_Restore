@interface RootSplitViewManager
- (_TtC8VideosUI20RootSplitViewManager)init;
- (void)dealloc;
- (void)numberOfChildControllersDidChangeFor:(id)a3 from:(int64_t)a4 to:(int64_t)a5 animated:(BOOL)a6;
@end

@implementation RootSplitViewManager

- (_TtC8VideosUI20RootSplitViewManager)init
{
  sub_1E313DAA0();
  return result;
}

- (void)dealloc
{
  v2 = self;
  sub_1E314A224();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectWeakDestroy();
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8VideosUI20RootSplitViewManager_modeChanged));
  OUTLINED_FUNCTION_95_0();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_95_0();
  swift_release();
  OUTLINED_FUNCTION_95_0();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_95_0();
  swift_release();
}

- (void)numberOfChildControllersDidChangeFor:(id)a3 from:(int64_t)a4 to:(int64_t)a5 animated:(BOOL)a6
{
  id v9 = a3;
  v10 = self;
  sub_1E314BAE8(v9, a4, a5);
}

@end