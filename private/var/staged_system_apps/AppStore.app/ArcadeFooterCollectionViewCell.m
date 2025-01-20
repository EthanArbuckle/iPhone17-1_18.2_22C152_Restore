@interface ArcadeFooterCollectionViewCell
- (_TtC8AppStore30ArcadeFooterCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore30ArcadeFooterCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)buttonTapped;
- (void)didTapFootnoteWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation ArcadeFooterCollectionViewCell

- (_TtC8AppStore30ArcadeFooterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore30ArcadeFooterCollectionViewCell *)sub_10062F3E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore30ArcadeFooterCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100631834();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100630294();
}

- (void)buttonTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_buttonActionBlock);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_100060050((uint64_t)v2);
    v2(v3);
    sub_10006012C((uint64_t)v2);
  }
}

- (void)didTapFootnoteWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100631E60();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_100084CF0(0, (unint64_t *)&qword_100990050);
  sub_100105B50();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a4;
  v8 = self;
  sub_100630AE8(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_100084CF0(0, (unint64_t *)&qword_100990050);
  sub_100105B50();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_footnoteView);
  *(unsigned char *)(v6 + OBJC_IVAR____TtC8AppStore12FootnoteView_isHighlighted) = 0;
  uint64_t v7 = qword_10097E060;
  id v8 = a4;
  v9 = self;
  if (v7 != -1) {
    swift_once();
  }
  [*(id *)(v6 + OBJC_IVAR____TtC8AppStore12FootnoteView_textLabel) setTextColor:qword_100984070];
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  v11.receiver = v9;
  v11.super_class = (Class)type metadata accessor for ArcadeFooterCollectionViewCell();
  [(ArcadeFooterCollectionViewCell *)&v11 touchesEnded:isa withEvent:v8];

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_footnoteTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_buttonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_footnoteView));
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_footnoteActionBlock));
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_buttonActionBlock));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore30ArcadeFooterCollectionViewCell_metrics, &qword_100987858);
}

@end