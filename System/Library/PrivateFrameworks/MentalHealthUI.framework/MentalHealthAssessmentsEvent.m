@interface MentalHealthAssessmentsEvent
- (BOOL)isEventSubmissionIHAGated;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation MentalHealthAssessmentsEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (NSString)eventName
{
  v2 = (void *)sub_256177EA8();

  return (NSString *)v2;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  sub_25613372C(MEMORY[0x263F8EE78]);
  v4 = (void *)sub_256177DD8();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4 = a3;
  swift_retain();
  sub_25611E894(v4);
  swift_release();

  v5 = (void *)sub_256177DD8();
  swift_bridgeObjectRelease();

  return v5;
}

@end