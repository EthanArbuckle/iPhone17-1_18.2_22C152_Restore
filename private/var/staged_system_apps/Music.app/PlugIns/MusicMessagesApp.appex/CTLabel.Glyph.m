@interface CTLabel.Glyph
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCO14MusicUtilities7CTLabel5Glyph)initWithCoder:(id)a3;
- (_TtCO14MusicUtilities7CTLabel5Glyph)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation CTLabel.Glyph

- (_TtCO14MusicUtilities7CTLabel5Glyph)initWithCoder:(id)a3
{
  result = (_TtCO14MusicUtilities7CTLabel5Glyph *)sub_100485590();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCO14MusicUtilities7CTLabel5Glyph_size);
  double v4 = *(double *)&self->cgGlyph[OBJC_IVAR____TtCO14MusicUtilities7CTLabel5Glyph_size];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double v3 = self;
  _s14MusicUtilities7CTLabelO5GlyphC4drawyySo6CGRectVF_0();
}

- (_TtCO14MusicUtilities7CTLabel5Glyph)initWithFrame:(CGRect)a3
{
}

@end