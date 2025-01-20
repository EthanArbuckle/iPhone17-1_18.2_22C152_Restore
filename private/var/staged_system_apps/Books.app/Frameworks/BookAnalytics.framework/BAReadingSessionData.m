@interface BAReadingSessionData
- (BAReadingSessionData)init;
- (BAReadingSessionData)initWithPercentCompletionStart:(id)a3 percentCompletionEnd:(id)a4 isFreeSample:(id)a5 deviceOrientation:(int64_t)a6;
- (NSNumber)percentCompletionEnd;
- (NSNumber)percentCompletionStart;
@end

@implementation BAReadingSessionData

- (NSNumber)percentCompletionStart
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___BAReadingSessionData_percentCompletionStart));
}

- (NSNumber)percentCompletionEnd
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___BAReadingSessionData_percentCompletionEnd));
}

- (BAReadingSessionData)initWithPercentCompletionStart:(id)a3 percentCompletionEnd:(id)a4 isFreeSample:(id)a5 deviceOrientation:(int64_t)a6
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAReadingSessionData_percentCompletionStart) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAReadingSessionData_percentCompletionEnd) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAReadingSessionData_isFreeSample) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAReadingSessionData_deviceOrientation) = (Class)a6;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for BridgedReadingSessionData();
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  return [(BAReadingSessionData *)&v13 init];
}

- (BAReadingSessionData)init
{
  result = (BAReadingSessionData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAReadingSessionData_isFreeSample);
}

@end