@interface PPSWStringDonation
- (BOOL)shouldConsume;
- (NSString)extractionContent;
- (NSString)uniqueId;
- (PPSWStringDonation)init;
- (PPSWStringDonation)initWithLabeledStrings:(id)a3 bundleId:(id)a4 groupId:(id)a5 documentId:(id)a6;
- (PPSource)source;
- (double)absoluteTimestamp;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setExtractionContent:(id)a3;
- (void)setShouldConsume:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)setUniqueId:(id)a3;
@end

@implementation PPSWStringDonation

- (NSString)uniqueId
{
  return (NSString *)sub_1CA9CFC6C((uint64_t)self, (uint64_t)a2, (void (*)(void))StringDonation.uniqueId.getter);
}

- (void)setUniqueId:(id)a3
{
}

- (double)absoluteTimestamp
{
  return StringDonation.absoluteTimestamp.getter();
}

- (void)setAbsoluteTimestamp:(double)a3
{
}

- (PPSource)source
{
  v2 = sub_1CA9CFBB4();
  return (PPSource *)v2;
}

- (void)setSource:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1CA9CFC40((uint64_t)a3);
}

- (NSString)extractionContent
{
  return (NSString *)sub_1CA9CFC6C((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1CA9CFCBC);
}

- (void)setExtractionContent:(id)a3
{
}

- (BOOL)shouldConsume
{
  return sub_1CA9CFDCC() & 1;
}

- (void)setShouldConsume:(BOOL)a3
{
}

- (PPSWStringDonation)initWithLabeledStrings:(id)a3 bundleId:(id)a4 groupId:(id)a5 documentId:(id)a6
{
  sub_1CAB4E280();
  sub_1CAB4E2B0();
  sub_1CAB4E2B0();
  sub_1CAB4E2B0();
  StringDonation.init(labeledStrings:bundleId:groupId:documentId:)();
  return result;
}

- (PPSWStringDonation)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end