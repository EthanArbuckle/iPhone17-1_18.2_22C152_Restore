@interface CRLImmutableBoard
+ (id)copyInMemoryBoardWithoutRemappingWithBoard:(id)a3 error:(id *)a4;
- (_TtC8Freeform17CRLImmutableBoard)initWithBoard:(id)a3;
- (id)qa_drawingDataAndReturnError:(id *)a3;
@end

@implementation CRLImmutableBoard

- (_TtC8Freeform17CRLImmutableBoard)initWithBoard:(id)a3
{
  return (_TtC8Freeform17CRLImmutableBoard *)sub_100D135E4((char *)a3);
}

+ (id)copyInMemoryBoardWithoutRemappingWithBoard:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = sub_100D1D1B4(v4);

  return v5;
}

- (id)qa_drawingDataAndReturnError:(id *)a3
{
  v3 = self;
  id v4 = sub_100D13860();
  unint64_t v6 = v5;

  v7.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100510084((uint64_t)v4, v6);

  return v7.super.isa;
}

@end