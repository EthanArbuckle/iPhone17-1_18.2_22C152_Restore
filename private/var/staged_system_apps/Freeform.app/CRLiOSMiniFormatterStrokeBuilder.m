@interface CRLiOSMiniFormatterStrokeBuilder
- (void)interactionEnded:(id)a3;
- (void)interactionStarted:(id)a3;
- (void)segmentedControlChangedWithSelectedIndices:(id)a3;
- (void)stepperValueDidChange:(id)a3;
@end

@implementation CRLiOSMiniFormatterStrokeBuilder

- (void)segmentedControlChangedWithSelectedIndices:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexSet();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  sub_1009D9BE0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)stepperValueDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1009DADE4(a3);
}

- (void)interactionStarted:(id)a3
{
  id v5 = (char *)self + OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_presenter;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    id v9 = a3;
    uint64_t v10 = self;
    v8(ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)interactionEnded:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1009DB6AC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLiOSMiniFormatterStrokeBuilder_dataProvider));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform32CRLiOSMiniFormatterStrokeBuilder_strokeWidthLabel);
}

@end