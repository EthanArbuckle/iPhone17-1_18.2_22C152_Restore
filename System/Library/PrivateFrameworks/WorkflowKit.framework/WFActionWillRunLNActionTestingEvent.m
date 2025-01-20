@interface WFActionWillRunLNActionTestingEvent
- (LNAction)lnAction;
- (WFActionWillRunLNActionTestingEvent)initWithAction:(id)a3 lnAction:(id)a4;
@end

@implementation WFActionWillRunLNActionTestingEvent

- (void).cxx_destruct
{
}

- (LNAction)lnAction
{
  return self->_lnAction;
}

- (WFActionWillRunLNActionTestingEvent)initWithAction:(id)a3 lnAction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFActionWillRunLNActionTestingEvent.m", 16, @"Invalid parameter not satisfying: %@", @"lnAction" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)WFActionWillRunLNActionTestingEvent;
  v9 = [(WFActionTestingEvent *)&v14 initWithAction:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lnAction, a4);
    v11 = v10;
  }

  return v10;
}

@end