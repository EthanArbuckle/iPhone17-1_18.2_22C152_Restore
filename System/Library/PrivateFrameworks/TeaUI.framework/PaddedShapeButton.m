@interface PaddedShapeButton
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (CGPoint)contentOffset;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC5TeaUI17PaddedShapeButton)initWithCoder:(id)a3;
- (_TtC5TeaUI17PaddedShapeButton)initWithFrame:(CGRect)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation PaddedShapeButton

- (CGPoint)contentOffset
{
  double v2 = sub_1B5F311EC();
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
}

- (_TtC5TeaUI17PaddedShapeButton)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI17PaddedShapeButton *)PaddedShapeButton.init(frame:)();
}

- (_TtC5TeaUI17PaddedShapeButton)initWithCoder:(id)a3
{
  id v3 = a3;
  PaddedShapeButton.init(coder:)();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_1B5F315A0(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (BOOL)isHighlighted
{
  double v2 = self;
  unsigned __int8 v3 = sub_1B5F31A64((SEL *)&selRef_isHighlighted);

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_1B5F31700(a3);
}

- (BOOL)isEnabled
{
  double v2 = self;
  unsigned __int8 v3 = sub_1B5F31A64((SEL *)&selRef_isEnabled);

  return v3 & 1;
}

- (void)setEnabled:(BOOL)a3
{
  v4 = self;
  sub_1B5F31AF4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI17PaddedShapeButton_onMenuPresentation));
  unsigned __int8 v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5TeaUI17PaddedShapeButton__backgroundColor);
}

@end