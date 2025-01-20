@interface CRLOneEuroFilterPoint
- (CGPoint)currValue;
- (CGPoint)filterWithValue:(CGPoint)a3 timestamp:(double)a4;
- (CGPoint)prevValue;
- (_TtC8Freeform21CRLOneEuroFilterPoint)init;
- (_TtC8Freeform21CRLOneEuroFilterPoint)initWithFreq:(double)a3 mincutoff:(double)a4 beta:(double)a5 dcutoff:(double)a6;
- (void)updateParamsWithFreq:(double)a3 mincutoff:(double)a4 beta:(double)a5 dcutoff:(double)a6;
@end

@implementation CRLOneEuroFilterPoint

- (CGPoint)currValue
{
  v3 = (double *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_xFilter)
                + *(void *)((**(void **)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_xFilter) & swift_isaMask)
                            + 0x98));
  swift_beginAccess();
  double v4 = *v3;
  v5 = (double *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_yFilter)
                + *(void *)((swift_isaMask & **(void **)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_yFilter))
                            + 0x98));
  swift_beginAccess();
  double v6 = *v5;
  double v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (CGPoint)prevValue
{
  v3 = (double *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_xFilter)
                + *(void *)((**(void **)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_xFilter) & swift_isaMask)
                            + 0xA0));
  swift_beginAccess();
  double v4 = *v3;
  v5 = (double *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_yFilter)
                + *(void *)((swift_isaMask & **(void **)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_yFilter))
                            + 0xA0));
  swift_beginAccess();
  double v6 = *v5;
  double v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (_TtC8Freeform21CRLOneEuroFilterPoint)initWithFreq:(double)a3 mincutoff:(double)a4 beta:(double)a5 dcutoff:(double)a6
{
  v11 = (objc_class *)sub_1005057FC(qword_10167BA98);
  id v12 = objc_allocWithZone(v11);
  v13 = self;
  *(Class *)((char *)&v13->super.isa + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_xFilter) = (Class)sub_1006DD9B8(a3, a4, a5, a6);
  id v14 = objc_allocWithZone(v11);
  *(Class *)((char *)&v13->super.isa + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_yFilter) = (Class)sub_1006DD9B8(a3, a4, a5, a6);

  v16.receiver = v13;
  v16.super_class = (Class)type metadata accessor for CRLOneEuroFilterPoint();
  return [(CRLOneEuroFilterPoint *)&v16 init];
}

- (void)updateParamsWithFreq:(double)a3 mincutoff:(double)a4 beta:(double)a5 dcutoff:(double)a6
{
  v10 = self;
  CRLOneEuroFilterPoint.updateParams(freq:mincutoff:beta:dcutoff:)(a3, a4, a5, a6);
}

- (CGPoint)filterWithValue:(CGPoint)a3 timestamp:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  double v7 = self;
  double v8 = CRLOneEuroFilterPoint.filter(value:timestamp:)(x, y, a4);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (_TtC8Freeform21CRLOneEuroFilterPoint)init
{
  CGPoint result = (_TtC8Freeform21CRLOneEuroFilterPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLOneEuroFilterPoint_yFilter);
}

@end