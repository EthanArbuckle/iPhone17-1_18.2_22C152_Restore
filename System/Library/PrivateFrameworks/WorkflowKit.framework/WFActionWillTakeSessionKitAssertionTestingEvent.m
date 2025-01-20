@interface WFActionWillTakeSessionKitAssertionTestingEvent
- (WFActionWillTakeSessionKitAssertionTestingEvent)initWithAction:(id)a3;
- (WFActionWillTakeSessionKitAssertionTestingEvent)initWithAction:(id)a3 sessionConfiguration:(id)a4;
@end

@implementation WFActionWillTakeSessionKitAssertionTestingEvent

- (WFActionWillTakeSessionKitAssertionTestingEvent)initWithAction:(id)a3 sessionConfiguration:(id)a4
{
  return (WFActionWillTakeSessionKitAssertionTestingEvent *)ActionWillTakeSessionKitAssertionTestingEvent.init(action:sessionConfiguration:)(a3, (uint64_t)a4);
}

- (WFActionWillTakeSessionKitAssertionTestingEvent)initWithAction:(id)a3
{
  id v3 = a3;
  ActionWillTakeSessionKitAssertionTestingEvent.init(action:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___WFActionWillTakeSessionKitAssertionTestingEvent_sessionConfiguration));
}

@end