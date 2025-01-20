@interface CRLOneEuroFilterF
- (_TtC8Freeform17CRLOneEuroFilterF)init;
- (_TtC8Freeform17CRLOneEuroFilterF)initWithFreq:(float)a3 mincutoff:(float)a4 beta:(float)a5 dcutoff:(float)a6;
- (float)currValue;
- (float)filterWithValue:(float)a3 timestamp:(double)a4;
- (float)prevValue;
- (void)updateParamsWithFreq:(float)a3 mincutoff:(float)a4 beta:(float)a5 dcutoff:(float)a6;
@end

@implementation CRLOneEuroFilterF

- (float)currValue
{
  v2 = (float *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLOneEuroFilterF_f)
               + *(void *)((**(void **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLOneEuroFilterF_f) & swift_isaMask)
                           + 0x98));
  swift_beginAccess();
  return *v2;
}

- (float)prevValue
{
  v2 = (float *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLOneEuroFilterF_f)
               + *(void *)((**(void **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLOneEuroFilterF_f) & swift_isaMask)
                           + 0xA0));
  swift_beginAccess();
  return *v2;
}

- (_TtC8Freeform17CRLOneEuroFilterF)initWithFreq:(float)a3 mincutoff:(float)a4 beta:(float)a5 dcutoff:(float)a6
{
  id v11 = objc_allocWithZone((Class)sub_1005057FC(&qword_10167BA80));
  v12 = self;
  *(Class *)((char *)&v12->super.isa + OBJC_IVAR____TtC8Freeform17CRLOneEuroFilterF_f) = (Class)sub_1006DD41C(a3, a4, a5, a6);

  v14.receiver = v12;
  v14.super_class = (Class)type metadata accessor for CRLOneEuroFilterF();
  return [(CRLOneEuroFilterF *)&v14 init];
}

- (void)updateParamsWithFreq:(float)a3 mincutoff:(float)a4 beta:(float)a5 dcutoff:(float)a6
{
  v10 = self;
  CRLOneEuroFilterF.updateParams(freq:mincutoff:beta:dcutoff:)(a3, a4, a5, a6);
}

- (float)filterWithValue:(float)a3 timestamp:(double)a4
{
  void (*v6)(uint64_t *__return_ptr, float *, double);
  _TtC8Freeform17CRLOneEuroFilterF *v7;
  void *v8;
  float v10;
  uint64_t v11;

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform17CRLOneEuroFilterF_f);
  v10 = a3;
  v6 = *(void (**)(uint64_t *__return_ptr, float *, double))((swift_isaMask & *v5) + 0x1B8);
  v7 = self;
  v8 = v5;
  v6(&v11, &v10, a4);

  return *(float *)&v11;
}

- (_TtC8Freeform17CRLOneEuroFilterF)init
{
  result = (_TtC8Freeform17CRLOneEuroFilterF *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end