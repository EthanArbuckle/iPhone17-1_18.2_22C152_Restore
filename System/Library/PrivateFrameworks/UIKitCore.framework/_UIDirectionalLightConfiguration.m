@interface _UIDirectionalLightConfiguration
- (BOOL)reverse;
- (_UIColorPalette)colorPalette;
- (_UIDirectionalLightConfiguration)init;
- (_UIDirectionalLightConfiguration)initWithColorPalette:(id)a3;
- (_UIDirectionalLightConfiguration)initWithPalette:(id)a3;
- (_UIDirectionalLightPalette)palette;
- (double)duration;
- (unint64_t)direction;
- (void)setColorPalette:(id)a3;
- (void)setDirection:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setPalette:(id)a3;
- (void)setReverse:(BOOL)a3;
@end

@implementation _UIDirectionalLightConfiguration

- (_UIColorPalette)colorPalette
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_colorPalette);
  swift_beginAccess();
  return (_UIColorPalette *)*v2;
}

- (void)setColorPalette:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_colorPalette);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (unint64_t)direction
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR____UIDirectionalLightConfiguration_direction);
  swift_beginAccess();
  return *v2;
}

- (void)setDirection:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR____UIDirectionalLightConfiguration_direction);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (BOOL)reverse
{
  v2 = (BOOL *)self + OBJC_IVAR____UIDirectionalLightConfiguration_reverse;
  swift_beginAccess();
  return *v2;
}

- (void)setReverse:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____UIDirectionalLightConfiguration_reverse;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)duration
{
  v2 = (double *)((char *)self + OBJC_IVAR____UIDirectionalLightConfiguration_duration);
  swift_beginAccess();
  return *v2;
}

- (void)setDuration:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR____UIDirectionalLightConfiguration_duration);
  swift_beginAccess();
  double *v4 = a3;
}

- (_UIDirectionalLightConfiguration)initWithColorPalette:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_colorPalette) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_direction) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_reverse) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_duration) = (Class)0x4014000000000000;
  v5.receiver = self;
  v5.super_class = (Class)_UIDirectionalLightConfiguration;
  id v3 = a3;
  return [(_UIDirectionalLightConfiguration *)&v5 init];
}

- (_UIDirectionalLightConfiguration)initWithPalette:(id)a3
{
  id v3 = *(objc_class **)((char *)a3 + OBJC_IVAR____UIDirectionalLightPalette_colorPalette);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_colorPalette) = v3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_direction) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_reverse) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIDirectionalLightConfiguration_duration) = (Class)0x4014000000000000;
  v6.receiver = self;
  v6.super_class = (Class)_UIDirectionalLightConfiguration;
  v4 = v3;
  return [(_UIDirectionalLightConfiguration *)&v6 init];
}

- (_UIDirectionalLightPalette)palette
{
  type metadata accessor for _UIDirectionalLightPalette((uint64_t)self);
  id v3 = self;
  id v4 = sub_1859E28F8([(_UIDirectionalLightConfiguration *)v3 colorPalette]);

  return (_UIDirectionalLightPalette *)v4;
}

- (void)setPalette:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_super v5 = [(_UIDirectionalLightConfiguration *)v4 palette];
  id v6 = *(id *)((char *)&v5->super.isa + OBJC_IVAR____UIDirectionalLightPalette_colorPalette);

  [(_UIDirectionalLightConfiguration *)v4 setColorPalette:v6];
}

- (_UIDirectionalLightConfiguration)init
{
  result = (_UIDirectionalLightConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end