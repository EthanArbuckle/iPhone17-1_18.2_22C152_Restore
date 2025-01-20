@interface SBEmitSBEventSwitcherEventResponse
- (NSDictionary)payload;
- (SBEmitSBEventSwitcherEventResponse)initWithSBEventWithEventType:(unint64_t)a3 payload:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)succinctDescriptionBuilder;
- (int64_t)type;
- (unint64_t)eventType;
@end

@implementation SBEmitSBEventSwitcherEventResponse

- (int64_t)type
{
  return 9;
}

- (SBEmitSBEventSwitcherEventResponse)initWithSBEventWithEventType:(unint64_t)a3 payload:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBEmitSBEventSwitcherEventResponse;
  v7 = [(SBChainableModifierEventResponse *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_eventType = a3;
    uint64_t v9 = [v6 copy];
    payload = v8->_payload;
    v8->_payload = (NSDictionary *)v9;
  }
  return v8;
}

- (id)succinctDescriptionBuilder
{
  v7.receiver = self;
  v7.super_class = (Class)SBEmitSBEventSwitcherEventResponse;
  v3 = [(SBChainableModifierEventResponse *)&v7 succinctDescriptionBuilder];
  v4 = NSStringFromAnalyticsEventType();
  [v3 appendString:v4 withName:@"eventType"];

  id v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSDictionary count](self->_payload, "count"), @"payloadCount");
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBEmitSBEventSwitcherEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = NSStringFromAnalyticsEventType();
  [v4 appendString:v5 withName:@"eventType"];

  [v4 appendDictionarySection:self->_payload withName:@"payload" skipIfEmpty:1];
  return v4;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
}

@end