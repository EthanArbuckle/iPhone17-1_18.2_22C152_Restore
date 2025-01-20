@interface WFActionTestingEvent
- (WFAction)action;
- (WFActionTestingEvent)initWithAction:(id)a3;
@end

@implementation WFActionTestingEvent

- (void).cxx_destruct
{
}

- (WFAction)action
{
  return self->_action;
}

- (WFActionTestingEvent)initWithAction:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFActionTestingEvent;
  v6 = [(WFActionTestingEvent *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_action, a3);
    v8 = v7;
  }

  return v7;
}

@end