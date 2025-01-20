@interface StickerCollectionMoreButtonCell
- (_TtC10StickersUI31StickerCollectionMoreButtonCell)initWithCoder:(id)a3;
- (_TtC10StickersUI31StickerCollectionMoreButtonCell)initWithFrame:(CGRect)a3;
- (void)didPressButton:(id)a3;
- (void)layoutSubviews;
@end

@implementation StickerCollectionMoreButtonCell

- (_TtC10StickersUI31StickerCollectionMoreButtonCell)initWithFrame:(CGRect)a3
{
  return (_TtC10StickersUI31StickerCollectionMoreButtonCell *)sub_25E49061C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10StickersUI31StickerCollectionMoreButtonCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC10StickersUI31StickerCollectionMoreButtonCell_circleView;
  id v6 = objc_allocWithZone(MEMORY[0x263F82E00]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC10StickersUI31StickerCollectionMoreButtonCell_button;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F824E8]), sel_init);
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC10StickersUI31StickerCollectionMoreButtonCell_delegate);
  void *v9 = 0;
  v9[1] = 0;

  result = (_TtC10StickersUI31StickerCollectionMoreButtonCell *)sub_25E4A2EA0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for StickerCollectionMoreButtonCell();
  v2 = (char *)v9.receiver;
  [(StickerCollectionMoreButtonCell *)&v9 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_contentView, v9.receiver, v9.super_class);
  objc_msgSend(v3, sel_bounds);
  double v5 = v4;

  id v6 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC10StickersUI31StickerCollectionMoreButtonCell_circleView], sel_layer);
  id v7 = v6;
  double v8 = 20.0;
  if (v5 <= 40.0) {
    double v8 = v5 * 0.5;
  }
  objc_msgSend(v6, sel_setCornerRadius_, v8);
}

- (void)didPressButton:(id)a3
{
  double v4 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.super.isa) + 0x68);
  swift_unknownObjectRetain();
  double v8 = self;
  if (v4())
  {
    uint64_t v6 = v5;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(ObjectType, v6);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI31StickerCollectionMoreButtonCell_circleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI31StickerCollectionMoreButtonCell_button));

  swift_unknownObjectRelease();
}

@end