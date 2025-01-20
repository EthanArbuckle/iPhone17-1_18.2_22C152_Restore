@interface TextButton
- (CGSize)intrinsicContentSize;
- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton)init;
- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton)initWithCoder:(id)a3;
- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTitle:(id)a3 forState:(unint64_t)a4;
@end

@implementation TextButton

- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton)init
{
  return (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton *)sub_2D5374();
}

- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton_hasExcessiveHeightCharacters) = 0;
  id v4 = a3;

  result = (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  if (a3)
  {
    uint64_t v6 = sub_AB6510();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  v9 = self;
  sub_2D57CC(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = [(TextButton *)v2 titleLabel];
  if (v3)
  {
    id v4 = v3;
    [v3 intrinsicContentSize];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    v13.receiver = v2;
    v13.super_class = (Class)type metadata accessor for TextButton();
    [(TextButton *)&v13 intrinsicContentSize];
    double v6 = v9;
    double v8 = v10;
  }
  double v11 = v6;
  double v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TextButton();
  id v2 = v7.receiver;
  [(TextButton *)&v7 layoutSubviews];
  id v3 = [v2 titleLabel];
  if (v3)
  {
    id v4 = v3;
    [v3 frame];
    double Width = CGRectGetWidth(v8);
    [v2 frame];
    double v6 = CGRectGetWidth(v9);
    if (Width > v6) {
      double v6 = Width;
    }
    [v4 setPreferredMaxLayoutWidth:v6];

    id v2 = v4;
  }
}

- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton)initWithFrame:(CGRect)a3
{
}

@end