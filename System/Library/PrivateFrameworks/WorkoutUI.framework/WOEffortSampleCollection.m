@interface WOEffortSampleCollection
- (HKQuantity)preferredQuantity;
- (HKQuantitySample)effortSample;
- (HKQuantitySample)estimatedEffortSample;
- (HKQuantitySample)preferredSample;
- (WOEffortSampleCollection)init;
- (WOEffortSampleCollection)initWithEffortSample:(id)a3 estimatedEffortSample:(id)a4;
@end

@implementation WOEffortSampleCollection

- (HKQuantitySample)effortSample
{
  return (HKQuantitySample *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___WOEffortSampleCollection_effortSample));
}

- (HKQuantitySample)estimatedEffortSample
{
  return (HKQuantitySample *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___WOEffortSampleCollection_estimatedEffortSample));
}

- (WOEffortSampleCollection)initWithEffortSample:(id)a3 estimatedEffortSample:(id)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOEffortSampleCollection_effortSample) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOEffortSampleCollection_estimatedEffortSample) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for EffortSampleCollection();
  id v6 = a3;
  id v7 = a4;
  return [(WOEffortSampleCollection *)&v9 init];
}

- (HKQuantitySample)preferredSample
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOEffortSampleCollection_effortSample);
  v3 = v2;
  if (!v2)
  {
    v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOEffortSampleCollection_estimatedEffortSample);
    if (v3) {
      id v4 = v3;
    }
  }
  id v5 = v2;
  return (HKQuantitySample *)v3;
}

- (HKQuantity)preferredQuantity
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOEffortSampleCollection_effortSample);
  if (v3)
  {
    id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOEffortSampleCollection_effortSample);
LABEL_5:
    id v6 = self;
    id v7 = v3;
    id v8 = objc_msgSend(v4, sel_quantity);

    goto LABEL_6;
  }
  id v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOEffortSampleCollection_estimatedEffortSample);
  if (v5)
  {
    id v4 = v5;
    v3 = 0;
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_6:
  return (HKQuantity *)v8;
}

- (WOEffortSampleCollection)init
{
  result = (WOEffortSampleCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WOEffortSampleCollection_estimatedEffortSample);
}

@end