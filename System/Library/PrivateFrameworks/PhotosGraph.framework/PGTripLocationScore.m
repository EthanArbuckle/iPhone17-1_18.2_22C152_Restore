@interface PGTripLocationScore
- (NSString)description;
- (PGGraphNamedLocationNode)locationNode;
- (PGTripLocationScore)init;
- (PGTripLocationScore)initWithLocationNode:(id)a3 score:(double)a4 momentNodes:(id)a5;
- (double)score;
@end

@implementation PGTripLocationScore

- (PGGraphNamedLocationNode)locationNode
{
  return (PGGraphNamedLocationNode *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                             + OBJC_IVAR___PGTripLocationScore_locationNode));
}

- (double)score
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___PGTripLocationScore__score);
}

- (PGTripLocationScore)initWithLocationNode:(id)a3 score:(double)a4 momentNodes:(id)a5
{
  sub_1D181F2D8(0, (unint64_t *)&qword_1EA65A260);
  v8 = (objc_class *)sub_1D1EBE1B0();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGTripLocationScore_locationNode) = (Class)a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___PGTripLocationScore__score) = a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGTripLocationScore_momentNodes) = v8;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TripLocationScore();
  id v9 = a3;
  return [(PGTripLocationScore *)&v11 init];
}

- (NSString)description
{
  return (NSString *)sub_1D1A575B8(self, (uint64_t)a2, (void (*)(void))sub_1D1A4B9C4);
}

- (PGTripLocationScore)init
{
  result = (PGTripLocationScore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end