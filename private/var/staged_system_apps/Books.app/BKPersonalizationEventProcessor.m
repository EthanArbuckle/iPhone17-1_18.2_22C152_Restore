@interface BKPersonalizationEventProcessor
- (BKPersonalizationEventProcessor)init;
- (BKPersonalizationEventProcessor)initWithDonor:(id)a3;
@end

@implementation BKPersonalizationEventProcessor

- (BKPersonalizationEventProcessor)initWithDonor:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKPersonalizationEventProcessor_donor) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PersonalizationEventProcessor();
  id v4 = a3;
  return [(BKPersonalizationEventProcessor *)&v6 init];
}

- (BKPersonalizationEventProcessor)init
{
  result = (BKPersonalizationEventProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end