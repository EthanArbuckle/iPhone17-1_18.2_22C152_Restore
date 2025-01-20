@interface StateOfMindLoggingEvent
- (BOOL)isEventSubmissionIHAGated;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation StateOfMindLoggingEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  v2 = (void *)sub_256177EA8();

  return (NSString *)v2;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return sub_2560849D4((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_256083A78);
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return sub_2560849D4((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_256084504);
}

@end