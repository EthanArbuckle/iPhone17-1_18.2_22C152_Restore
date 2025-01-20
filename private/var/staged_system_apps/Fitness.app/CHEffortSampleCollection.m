@interface CHEffortSampleCollection
- (CHEffortSampleCollection)init;
- (CHEffortSampleCollection)initWithEffortSample:(id)a3 estimatedEffortSample:(id)a4;
- (CHEffortSampleCollection)initWithQuantitySamples:(id)a3;
- (CHEffortSampleCollection)initWithSamples:(id)a3;
- (HKQuantity)preferredQuantity;
- (HKQuantitySample)preferredSample;
- (WOEffortSampleCollection)collection;
@end

@implementation CHEffortSampleCollection

- (WOEffortSampleCollection)collection
{
  return (WOEffortSampleCollection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                             + OBJC_IVAR___CHEffortSampleCollection_collection));
}

- (CHEffortSampleCollection)initWithEffortSample:(id)a3 estimatedEffortSample:(id)a4
{
  objc_allocWithZone((Class)type metadata accessor for EffortSampleCollection());
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  id v10 = v8;
  v11 = self;
  *(Class *)((char *)&v11->super.isa + OBJC_IVAR___CHEffortSampleCollection_collection) = (Class)EffortSampleCollection.init(effortSample:estimatedEffortSample:)();

  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for CHEffortSampleCollection();
  v12 = [(CHEffortSampleCollection *)&v14 init];

  return v12;
}

- (CHEffortSampleCollection)initWithQuantitySamples:(id)a3
{
  sub_10007E2D8(0, (unint64_t *)&qword_100951108);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for EffortUtilities();
  v4 = self;
  uint64_t v5 = static EffortUtilities.effortSampleCollection(for:)();
  swift_bridgeObjectRelease();
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___CHEffortSampleCollection_collection) = (Class)v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for CHEffortSampleCollection();
  return [(CHEffortSampleCollection *)&v7 init];
}

- (CHEffortSampleCollection)initWithSamples:(id)a3
{
  sub_10007E2D8(0, &qword_100950760);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (CHEffortSampleCollection *)sub_100245B58(v3);
}

- (HKQuantitySample)preferredSample
{
  v2 = self;
  unint64_t v3 = (void *)dispatch thunk of EffortSampleCollection.preferredSample.getter();

  return (HKQuantitySample *)v3;
}

- (HKQuantity)preferredQuantity
{
  v2 = self;
  unint64_t v3 = (void *)dispatch thunk of EffortSampleCollection.preferredQuantity.getter();

  return (HKQuantity *)v3;
}

- (CHEffortSampleCollection)init
{
  result = (CHEffortSampleCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end