@interface StateOfMindOverlayContext
- (_TtC14MentalHealthUI25StateOfMindOverlayContext)init;
- (id)contextItemForLastUpdate;
- (id)overlayDisplayTypeForTimeScope:(int64_t)a3;
- (id)sampleTypeForDateRangeUpdates;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation StateOfMindOverlayContext

- (id)sampleTypeForDateRangeUpdates
{
  sub_255FB58F8(0, (unint64_t *)&unk_269F44CF0);
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_stateOfMindType);

  return v2;
}

- (id)overlayDisplayTypeForTimeScope:(int64_t)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC14MentalHealthUI25StateOfMindOverlayContext_overlayDisplayType));
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  uint64_t v11 = sub_2561753E8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a7);
  sub_2561753B8();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  id v17 = a4;
  v18 = self;
  sub_25602341C((uint64_t)v14, a5, (void (*)(void, void))sub_256023B50, v16);

  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (id)contextItemForLastUpdate
{
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14MentalHealthUI25StateOfMindOverlayContext_currentContextItem);
  if (v3)
  {
    v4 = self;
    v5 = v3;
  }
  else
  {
    v6 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0xC0);
    v7 = self;
    v5 = (void *)v6(MEMORY[0x263F8EE78]);
    v3 = 0;
  }
  id v8 = v3;

  return v5;
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (_TtC14MentalHealthUI25StateOfMindOverlayContext)init
{
  result = (_TtC14MentalHealthUI25StateOfMindOverlayContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI25StateOfMindOverlayContext_overlayChartController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI25StateOfMindOverlayContext_overlayDisplayType));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI25StateOfMindOverlayContext_overlayPredicate));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14MentalHealthUI25StateOfMindOverlayContext_currentContextItem);
}

@end