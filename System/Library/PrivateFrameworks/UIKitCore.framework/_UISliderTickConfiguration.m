@interface _UISliderTickConfiguration
- (BOOL)adjustPositionForTargetPosition:(float)a3 adjustedPosition:(float *)a4 startPosition:(float *)a5 endPosition:(float *)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)ticks;
- (_UISliderTickConfiguration)init;
- (_UISliderTickConfiguration)initWithNumberOfTicks:(int64_t)a3 behavior:(int64_t)a4;
- (_UISliderTickConfiguration)initWithTicks:(id)a3 behavior:(int64_t)a4;
- (float)snappingDistance;
- (id)copyWithZone:(void *)a3;
- (int64_t)behavior;
- (void)setSnappingDistance:(float)a3;
@end

@implementation _UISliderTickConfiguration

- (int64_t)behavior
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____UISliderTickConfiguration__behavior);
}

- (NSArray)ticks
{
  sub_1853B985C(0, &qword_1E8FAF060);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_186A1EB1C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (float)snappingDistance
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____UISliderTickConfiguration_snappingDistance);
}

- (void)setSnappingDistance:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR____UISliderTickConfiguration_snappingDistance) = a3;
}

- (_UISliderTickConfiguration)initWithTicks:(id)a3 behavior:(int64_t)a4
{
  sub_1853B985C(0, &qword_1E8FAF060);
  uint64_t v5 = sub_186A1EB3C();
  return (_UISliderTickConfiguration *)_UISliderTickConfiguration.init(ticks:behavior:)(v5, a4);
}

- (_UISliderTickConfiguration)initWithNumberOfTicks:(int64_t)a3 behavior:(int64_t)a4
{
  sub_185A0CC78(a3);
  sub_1853B985C(0, &qword_1E8FAF060);
  v6 = (void *)sub_186A1EB1C();
  swift_bridgeObjectRelease();
  v7 = [(_UISliderTickConfiguration *)self initWithTicks:v6 behavior:a4];

  return v7;
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  _UISliderTickConfiguration.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_0Tm(v6, v6[3]);
  v4 = (void *)sub_186A1F83C();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_186A1F1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = _UISliderTickConfiguration.isEqual(_:)((uint64_t)v8);

  sub_1853BFC80((uint64_t)v8);
  return v6 & 1;
}

- (BOOL)adjustPositionForTargetPosition:(float)a3 adjustedPosition:(float *)a4 startPosition:(float *)a5 endPosition:(float *)a6
{
  v10 = self;
  uint64_t v11 = sub_185A0CE20(a3);
  if ((v12 & 0x100000000) == 0)
  {
    if (!a4)
    {
      __break(1u);
      return v11;
    }
    *(_DWORD *)a4 = v11;
    if (a5) {
      *a5 = *((float *)&v11 + 1);
    }
    if (a6) {
      *(_DWORD *)a6 = v12;
    }
  }
  BOOL v13 = (v12 & 0x100000000) == 0;

  LOBYTE(v11) = v13;
  return v11;
}

- (_UISliderTickConfiguration)init
{
  result = (_UISliderTickConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end