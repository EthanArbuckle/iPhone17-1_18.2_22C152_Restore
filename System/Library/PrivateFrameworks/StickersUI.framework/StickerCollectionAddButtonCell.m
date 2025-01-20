@interface StickerCollectionAddButtonCell
- (_TtC10StickersUI30StickerCollectionAddButtonCell)initWithCoder:(id)a3;
- (_TtC10StickersUI30StickerCollectionAddButtonCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)layoutSubviews;
@end

@implementation StickerCollectionAddButtonCell

- (_TtC10StickersUI30StickerCollectionAddButtonCell)initWithFrame:(CGRect)a3
{
  return (_TtC10StickersUI30StickerCollectionAddButtonCell *)sub_25E4A0FEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10StickersUI30StickerCollectionAddButtonCell)initWithCoder:(id)a3
{
  return (_TtC10StickersUI30StickerCollectionAddButtonCell *)sub_25E4A1178(a3);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StickerCollectionAddButtonCell();
  v2 = (char *)v3.receiver;
  [(StickerCollectionAddButtonCell *)&v3 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  CGPointMake(objc_msgSend(v2, sel_bounds));
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC10StickersUI30StickerCollectionAddButtonCell_button], sel_setFrame_);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_25E4A2050();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4A2040();
  v8 = self;
  sub_25E4A13A8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_25E43DCDC((uint64_t)self + OBJC_IVAR____TtC10StickersUI30StickerCollectionAddButtonCell_delegate);
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC10StickersUI30StickerCollectionAddButtonCell_button);
}

@end