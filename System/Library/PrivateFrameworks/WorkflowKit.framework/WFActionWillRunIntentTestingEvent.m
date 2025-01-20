@interface WFActionWillRunIntentTestingEvent
- (INIntent)intent;
- (WFActionWillRunIntentTestingEvent)initWithAction:(id)a3 intent:(id)a4;
@end

@implementation WFActionWillRunIntentTestingEvent

- (void).cxx_destruct
{
}

- (INIntent)intent
{
  return self->_intent;
}

- (WFActionWillRunIntentTestingEvent)initWithAction:(id)a3 intent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFActionWillRunIntentTestingEvent.m", 16, @"Invalid parameter not satisfying: %@", @"intent" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)WFActionWillRunIntentTestingEvent;
  v9 = [(WFActionTestingEvent *)&v14 initWithAction:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intent, a4);
    v11 = v10;
  }

  return v10;
}

@end