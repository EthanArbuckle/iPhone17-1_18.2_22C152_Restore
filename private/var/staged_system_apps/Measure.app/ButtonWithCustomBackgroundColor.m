@interface ButtonWithCustomBackgroundColor
- (BOOL)isHighlighted;
- (_TtC7Measure31ButtonWithCustomBackgroundColor)initWithCoder:(id)a3;
- (_TtC7Measure31ButtonWithCustomBackgroundColor)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation ButtonWithCustomBackgroundColor

- (_TtC7Measure31ButtonWithCustomBackgroundColor)initWithCoder:(id)a3
{
  result = (_TtC7Measure31ButtonWithCustomBackgroundColor *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ButtonWithCustomBackgroundColor();
  return [(ButtonWithCustomBackgroundColor *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ButtonWithCustomBackgroundColor();
  v4 = (char *)v7.receiver;
  [(ButtonWithCustomBackgroundColor *)&v7 setHighlighted:v3];
  unsigned int v5 = [v4 isHighlighted];
  v6 = &OBJC_IVAR____TtC7Measure31ButtonWithCustomBackgroundColor_backgroundColorHighlighted;
  if (!v5) {
    v6 = &OBJC_IVAR____TtC7Measure31ButtonWithCustomBackgroundColor_backgroundColorNormal;
  }
  [v4 setBackgroundColor:*(void *)&v4[*v6]];
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000437F0();
}

- (_TtC7Measure31ButtonWithCustomBackgroundColor)initWithFrame:(CGRect)a3
{
  result = (_TtC7Measure31ButtonWithCustomBackgroundColor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure31ButtonWithCustomBackgroundColor_backgroundColorNormal));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Measure31ButtonWithCustomBackgroundColor_backgroundColorHighlighted);
}

@end