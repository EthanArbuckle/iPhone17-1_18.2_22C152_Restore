@interface FMR1GlyphButton
- (BOOL)isUserInteractionEnabled;
- (_TtC10TVRemoteUI15FMR1GlyphButton)initWithCoder:(id)a3;
- (_TtC10TVRemoteUI15FMR1GlyphButton)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)ringDisplayLinkUpdateWithDisplaylink:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation FMR1GlyphButton

- (_TtC10TVRemoteUI15FMR1GlyphButton)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized FMR1GlyphButton.init(coder:)();
}

- (void)dealloc
{
  v2 = self;
  FMR1GlyphButton.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC10TVRemoteUI15FMR1GlyphButton_style));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI15FMR1GlyphButton_normalBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI15FMR1GlyphButton_ringDisplayLink));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI15FMR1GlyphButton_ringPerimiterAnimationSpring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI15FMR1GlyphButton_ringFadeAnimationSpring));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)ringDisplayLinkUpdateWithDisplaylink:(id)a3
{
  id v4 = a3;
  v5 = self;
  FMR1GlyphButton.ringDisplayLinkUpdate(displaylink:)(v4);
}

- (void)drawRect:(CGRect)a3
{
  id v3 = self;
  specialized FMR1GlyphButton.draw(_:)();
}

- (BOOL)isUserInteractionEnabled
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMR1GlyphButton();
  return [(FMR1GlyphButton *)&v3 isUserInteractionEnabled];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  id v4 = self;
  FMR1GlyphButton.isUserInteractionEnabled.setter(a3);
}

- (_TtC10TVRemoteUI15FMR1GlyphButton)initWithFrame:(CGRect)a3
{
  result = (_TtC10TVRemoteUI15FMR1GlyphButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end