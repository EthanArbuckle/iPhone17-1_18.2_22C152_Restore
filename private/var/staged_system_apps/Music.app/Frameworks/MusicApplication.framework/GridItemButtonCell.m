@interface GridItemButtonCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)buttonSubtitle;
- (NSString)buttonTitle;
- (_TtC16MusicApplication18GridItemButtonCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication18GridItemButtonCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setButtonSubtitle:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)tintColorDidChange;
@end

@implementation GridItemButtonCell

- (_TtC16MusicApplication18GridItemButtonCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication18GridItemButtonCell *)sub_290F7C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication18GridItemButtonCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2924EC();
}

- (NSString)buttonTitle
{
  return (NSString *)sub_8E8C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication18GridItemButtonCell_buttonTitle);
}

- (void)setButtonTitle:(id)a3
{
}

- (NSString)buttonSubtitle
{
  return (NSString *)sub_8E8C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication18GridItemButtonCell_buttonSubtitle);
}

- (void)setButtonSubtitle:(id)a3
{
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(GridItemButtonCell *)&v3 tintColorDidChange];
  sub_292268();
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_2918AC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = *(Class *)((char *)&self->super.super.super.super.super.isa
                          + OBJC_IVAR____TtC16MusicApplication18GridItemButtonCell_actionButton);
  v10.super_class = (Class)type metadata accessor for SubtitledButton();
  -[GridItemButtonCell sizeThatFits:](&v10, "sizeThatFits:", width, height);
  double v6 = v5 + 24.0;
  BOOL v7 = v5 > 50.0;
  double v8 = 74.0;
  if (v7) {
    double v8 = v6;
  }
  double v9 = width;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication18GridItemButtonCell_buttonHandler));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication18GridItemButtonCell_actionButton);
}

@end