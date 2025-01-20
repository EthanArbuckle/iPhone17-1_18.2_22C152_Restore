@interface CRLiOSMiniFormatterBuilder
+ (double)defaultRowHeight;
+ (id)makeSmallButtonWith:(id)a3 title:(id)a4 action:(id)a5 backgroundColor:(id)a6 pressedBackgroundColor:(id)a7 foregroundColor:(id)a8 pressedForegroundColor:(id)a9 cornerRadius:(double)a10 italicTitle:(BOOL)a11;
- (_TtC8Freeform26CRLiOSMiniFormatterBuilder)init;
- (id)viewControllerForLargeContentViewerInteraction:(id)a3;
@end

@implementation CRLiOSMiniFormatterBuilder

+ (double)defaultRowHeight
{
  if (qword_10166EB60 != -1) {
    swift_once();
  }
  return *(double *)&qword_101719DE0;
}

+ (id)makeSmallButtonWith:(id)a3 title:(id)a4 action:(id)a5 backgroundColor:(id)a6 pressedBackgroundColor:(id)a7 foregroundColor:(id)a8 pressedForegroundColor:(id)a9 cornerRadius:(double)a10 italicTitle:(BOOL)a11
{
  if (a4)
  {
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v26 = v16;
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
  }
  swift_getObjCClassMetadata();
  id v24 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v22 = sub_1005200E8(a3, v25, v26, a5, a6, a7, v20, v21, a11);

  swift_bridgeObjectRelease();

  return v22;
}

- (id)viewControllerForLargeContentViewerInteraction:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1005228E4();

  return v6;
}

- (_TtC8Freeform26CRLiOSMiniFormatterBuilder)init
{
  result = (_TtC8Freeform26CRLiOSMiniFormatterBuilder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_presenter);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_interactiveCanvasController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_boardItemDataProvider));
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

@end