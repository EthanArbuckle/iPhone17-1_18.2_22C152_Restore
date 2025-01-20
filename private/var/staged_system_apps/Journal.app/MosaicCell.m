@interface MosaicCell
- (NSArray)accessibilityCustomActions;
- (_TtC7Journal10MosaicCell)initWithCoder:(id)a3;
- (_TtC7Journal10MosaicCell)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)applyLayoutAttributes:(id)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)overflowTappedWithSender:(id)a3;
- (void)setAccessibilityCustomActions:(id)a3;
@end

@implementation MosaicCell

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_100047454();

  return v7;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  id v10 = sub_100046F9C();
  id v11 = objc_allocWithZone((Class)UITargetedPreview);
  v12 = v9;
  id v13 = [v11 initWithView:v12 parameters:v10];

  swift_unknownObjectRelease();

  return v13;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  if (*((unsigned char *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC7Journal10MosaicCell_wantsResizeMenuDismissalPreview) == 1)
  {
    id v7 = a3;
    id v8 = a4;
    swift_unknownObjectRetain();
    v9 = self;
    id v10 = sub_100046F9C();
    id v11 = objc_allocWithZone((Class)UITargetedPreview);
    v12 = v9;
    id v13 = [v11 initWithView:v12 parameters:v10];

    swift_unknownObjectRelease();
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  if (a5)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = self;
    v14[4] = sub_100047420;
    v14[5] = v9;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 1107296256;
    v14[2] = sub_10017D530;
    v14[3] = &unk_100797330;
    id v10 = _Block_copy(v14);
    id v11 = self;
    id v12 = a3;
    id v13 = a4;
    swift_unknownObjectRetain();
    swift_release();
    [a5 addCompletion:v10];
    _Block_release(v10);

    swift_unknownObjectRelease();
  }
}

- (_TtC7Journal10MosaicCell)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal10MosaicCell *)sub_1004DD1C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal10MosaicCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004DFA2C();
}

- (void)overflowTappedWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004DFB60();
}

- (NSArray)accessibilityCustomActions
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MosaicCell();
  id v2 = v8.receiver;
  id v3 = [(MosaicCell *)&v8 accessibilityCustomActions];
  if (v3)
  {
    id v4 = v3;
    sub_10001B284(0, (unint64_t *)&unk_10080C360);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = sub_1004DEAD0();
  sub_1000C90D8((unint64_t)v5);

  sub_10001B284(0, (unint64_t *)&unk_10080C360);
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v6.super.isa;
}

- (void)setAccessibilityCustomActions:(id)a3
{
  isa = a3;
  if (a3)
  {
    sub_10001B284(0, (unint64_t *)&unk_10080C360);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v5 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    NSArray v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MosaicCell();
  [(MosaicCell *)&v7 setAccessibilityCustomActions:isa];
}

- (void)applyLayoutAttributes:(id)a3
{
  type metadata accessor for MosaicLayout.Attributes();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5)
  {
    long long v6 = *(_OWORD *)(v5 + OBJC_IVAR____TtCC7Journal12MosaicLayout10Attributes_cornerRadii + 16);
    v10[0] = *(_OWORD *)(v5 + OBJC_IVAR____TtCC7Journal12MosaicLayout10Attributes_cornerRadii);
    v10[1] = v6;
    long long v7 = *(_OWORD *)(v5 + OBJC_IVAR____TtCC7Journal12MosaicLayout10Attributes_cornerRadii + 48);
    v10[2] = *(_OWORD *)(v5 + OBJC_IVAR____TtCC7Journal12MosaicLayout10Attributes_cornerRadii + 32);
    v10[3] = v7;
    id v8 = a3;
    uint64_t v9 = self;
    sub_1004DE91C((uint64_t *)v10);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal10MosaicCell_xPlatterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal10MosaicCell_canvasAssetView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal10MosaicCell_overflowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal10MosaicCell_dynamicWaveformView));
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal10MosaicCell_delegate);
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal10MosaicCell_audioRecorder, &qword_100804048);
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal10MosaicCell_waveformProvider, (uint64_t *)&unk_100804050);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal10MosaicCell_journalAsset));

  swift_bridgeObjectRelease();
}

@end