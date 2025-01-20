@interface SiriAnalyticsXPCMessageEnvelope
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSData)payload;
- (SiriAnalyticsXPCMessageEnvelope)init;
- (SiriAnalyticsXPCMessageEnvelope)initWithCoder:(id)a3;
- (SiriAnalyticsXPCMessageEnvelope)initWithEventTypeId:(int64_t)a3 payload:(id)a4;
- (int64_t)eventTypeId;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriAnalyticsXPCMessageEnvelope

+ (BOOL)supportsSecureCoding
{
  return static XPCMessageEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (int64_t)eventTypeId
{
  return XPCMessageEnvelope.eventTypeId.getter();
}

- (NSData)payload
{
  uint64_t v2 = XPCMessageEnvelope.payload.getter();
  unint64_t v4 = v3;
  v5 = (void *)sub_1A2C0CD20();
  sub_1A2B3EB94(v2, v4);
  return (NSData *)v5;
}

- (SiriAnalyticsXPCMessageEnvelope)initWithEventTypeId:(int64_t)a3 payload:(id)a4
{
  id v5 = a4;
  uint64_t v6 = sub_1A2C0CD30();
  uint64_t v8 = v7;

  return (SiriAnalyticsXPCMessageEnvelope *)XPCMessageEnvelope.init(eventTypeId:payload:)(a3, v6, v8);
}

- (SiriAnalyticsXPCMessageEnvelope)initWithCoder:(id)a3
{
  return (SiriAnalyticsXPCMessageEnvelope *)XPCMessageEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1A2B9DE64(v4);
}

- (SiriAnalyticsXPCMessageEnvelope)init
{
}

- (void).cxx_destruct
{
}

@end