@interface MusicVideoVerticalLockupCollectionViewCell
- (_TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MusicVideoVerticalLockupCollectionViewCell

- (void)layoutSubviews
{
  v2 = self;
  sub_2C0D10();
}

- (_TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell_duration;
  *(void *)v8 = 0;
  v8[8] = 1;
  uint64_t v9 = OBJC_IVAR____TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell_textComponents;
  v10 = self;
  v11 = self;
  id v12 = [v10 preferredFontForTextStyle:UIFontTextStyleBody];
  v13 = self;
  *(void *)&v16[0] = [v13 whiteColor];
  *((void *)&v16[0] + 1) = [v13 clearColor];
  v16[1] = xmmword_AEF260;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  id v19 = v12;
  uint64_t v20 = 1;
  long long v21 = xmmword_AF7830;
  type metadata accessor for TextStackView.Component();
  swift_allocObject();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v9) = (Class)TextStackView.Component.init(identifier:labelProperties:)(0x6E6F697461727564, 0xE800000000000000, v16);
  *(Class *)((char *)&v11->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell_durationTextStackView) = 0;
  *(Class *)((char *)&v11->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell_gradientView) = 0;
  *((unsigned char *)&v11->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell_isGradientViewHidden) = 1;

  v15.receiver = v11;
  v15.super_class = (Class)type metadata accessor for MusicVideoVerticalLockupCollectionViewCell();
  return -[VerticalLockupCollectionViewCell initWithFrame:](&v15, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell *)sub_2C16A0((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell_durationTextStackView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication42MusicVideoVerticalLockupCollectionViewCell_gradientView);
}

@end