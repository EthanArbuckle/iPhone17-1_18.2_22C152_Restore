@interface CTLabel.Frame
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCO14MusicUtilities7CTLabel5Frame)initWithCoder:(id)a3;
- (_TtCO14MusicUtilities7CTLabel5Frame)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation CTLabel.Frame

- (_TtCO14MusicUtilities7CTLabel5Frame)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCO14MusicUtilities7CTLabel5Frame_colorOverride) = 0;
  id v4 = a3;

  result = (_TtCO14MusicUtilities7CTLabel5Frame *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCO14MusicUtilities7CTLabel5Frame_suggestedSize);
  double v4 = *(double *)&self->ctFrame[OBJC_IVAR____TtCO14MusicUtilities7CTLabel5Frame_suggestedSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  CTLabel.Frame.draw(_:)(x, y, width, height);
}

- (_TtCO14MusicUtilities7CTLabel5Frame)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCO14MusicUtilities7CTLabel5Frame_colorOverride);
}

@end