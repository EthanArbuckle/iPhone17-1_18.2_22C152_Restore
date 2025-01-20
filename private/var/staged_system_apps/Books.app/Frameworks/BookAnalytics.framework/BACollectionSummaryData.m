@interface BACollectionSummaryData
- (BACollectionSummaryData)init;
- (BACollectionSummaryData)initWithCollectionSummary:(id)a3;
@end

@implementation BACollectionSummaryData

- (BACollectionSummaryData)initWithCollectionSummary:(id)a3
{
  type metadata accessor for BridgedCollectionIDData();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BACollectionSummaryData_collectionSummary) = (Class)sub_27DEF0();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BridgedCollectionSummaryData();
  return [(BACollectionSummaryData *)&v5 init];
}

- (BACollectionSummaryData)init
{
  result = (BACollectionSummaryData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end