@interface _UISliderFluidTickConfiguration
- (BOOL)adjustPositionForTargetPosition:(float)a3 adjustedPosition:(float *)a4 startPosition:(float *)a5 endPosition:(float *)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)ticks;
- (UIColor)tickColor;
- (_UISliderFluidTickConfiguration)init;
- (_UISliderFluidTickConfiguration)initWithNumberOfTicks:(int64_t)a3 behavior:(int64_t)a4;
- (_UISliderFluidTickConfiguration)initWithTicks:(id)a3 behavior:(int64_t)a4;
- (float)snappingDistance;
- (id)copyWithZone:(void *)a3;
- (int64_t)behavior;
- (int64_t)tickStyle;
- (void)setSnappingDistance:(float)a3;
- (void)setTickColor:(id)a3;
- (void)setTickStyle:(int64_t)a3;
@end

@implementation _UISliderFluidTickConfiguration

- (int64_t)behavior
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____UISliderFluidTickConfiguration__behavior);
}

- (NSArray)ticks
{
  sub_1853B985C(0, &qword_1E8FAF060);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_186A1EB1C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (int64_t)tickStyle
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____UISliderFluidTickConfiguration_tickStyle);
}

- (void)setTickStyle:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UISliderFluidTickConfiguration_tickStyle) = (Class)a3;
}

- (UIColor)tickColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                            + OBJC_IVAR____UISliderFluidTickConfiguration_tickColor));
}

- (void)setTickColor:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UISliderFluidTickConfiguration_tickColor);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UISliderFluidTickConfiguration_tickColor) = (Class)a3;
  id v3 = a3;
}

- (float)snappingDistance
{
  return *(float *)((char *)&self->super.super.isa + OBJC_IVAR____UISliderFluidTickConfiguration_snappingDistance);
}

- (void)setSnappingDistance:(float)a3
{
  *(float *)((char *)&self->super.super.isa + OBJC_IVAR____UISliderFluidTickConfiguration_snappingDistance) = a3;
}

- (_UISliderFluidTickConfiguration)initWithTicks:(id)a3 behavior:(int64_t)a4
{
  sub_1853B985C(0, &qword_1E8FAF060);
  uint64_t v5 = sub_186A1EB3C();
  return (_UISliderFluidTickConfiguration *)_UISliderFluidTickConfiguration.init(ticks:behavior:)(v5, a4);
}

- (_UISliderFluidTickConfiguration)init
{
  sub_1853B985C(0, &qword_1E8FAF060);
  id v3 = (void *)sub_186A1EB1C();
  id v4 = [(_UISliderFluidTickConfiguration *)self initWithTicks:v3 behavior:0];

  return v4;
}

- (_UISliderFluidTickConfiguration)initWithNumberOfTicks:(int64_t)a3 behavior:(int64_t)a4
{
  sub_185A0CC78(a3);
  sub_1853B985C(0, &qword_1E8FAF060);
  v6 = (void *)sub_186A1EB1C();
  swift_bridgeObjectRelease();
  v7 = [(_UISliderFluidTickConfiguration *)self initWithTicks:v6 behavior:a4];

  return v7;
}

- (id)copyWithZone:(void *)a3
{
  id v4 = self;
  _UISliderFluidTickConfiguration.copy(with:)((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_0Tm(v7, v7[3]);
  uint64_t v5 = (void *)sub_186A1F83C();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_186A1F1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = _UISliderFluidTickConfiguration.isEqual(_:)((uint64_t)v8);

  sub_1853BFC80((uint64_t)v8);
  return v6 & 1;
}

- (BOOL)adjustPositionForTargetPosition:(float)a3 adjustedPosition:(float *)a4 startPosition:(float *)a5 endPosition:(float *)a6
{
  v10 = self;
  sub_185A0CE24(v10, a3);
  if ((v13 & 0x100000000) == 0)
  {
    if (!a4)
    {
      __break(1u);
      return v11;
    }
    *(_DWORD *)a4 = v11;
    if (a5) {
      *(_DWORD *)a5 = v12;
    }
    if (a6) {
      *(_DWORD *)a6 = v13;
    }
  }
  BOOL v14 = (v13 & 0x100000000) == 0;

  LOBYTE(v11) = v14;
  return v11;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UISliderFluidTickConfiguration_tickColor);
}

@end