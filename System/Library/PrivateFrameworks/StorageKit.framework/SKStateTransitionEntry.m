@interface SKStateTransitionEntry
+ (id)entryWithState:(id)a3 event:(id)a4;
+ (id)entryWithState:(id)a3 event:(id)a4 action:(id)a5;
+ (id)entryWithState:(id)a3 event:(id)a4 action:(id)a5 nextState:(id)a6;
+ (id)entryWithState:(id)a3 event:(id)a4 selector:(SEL)a5;
+ (id)entryWithState:(id)a3 event:(id)a4 selector:(SEL)a5 nextState:(id)a6;
- (NSString)event;
- (NSString)nextState;
- (NSString)state;
- (SEL)selector;
- (id)action;
- (void)setAction:(id)a3;
- (void)setEvent:(id)a3;
- (void)setNextState:(id)a3;
- (void)setSelector:(SEL)a3;
- (void)setState:(id)a3;
@end

@implementation SKStateTransitionEntry

+ (id)entryWithState:(id)a3 event:(id)a4 action:(id)a5 nextState:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)objc_opt_class());
  [v13 setState:v12];

  [v13 setEvent:v11];
  [v13 setAction:v10];

  [v13 setNextState:v9];
  [v13 setSelector:0];

  return v13;
}

+ (id)entryWithState:(id)a3 event:(id)a4 action:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() entryWithState:v9 event:v8 action:v7 nextState:0];

  return v10;
}

+ (id)entryWithState:(id)a3 event:(id)a4 selector:(SEL)a5 nextState:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)objc_opt_class());
  [v12 setState:v11];

  [v12 setEvent:v10];
  [v12 setAction:0];
  [v12 setNextState:v9];

  [v12 setSelector:a5];

  return v12;
}

+ (id)entryWithState:(id)a3 event:(id)a4 selector:(SEL)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(id)objc_opt_class() entryWithState:v8 event:v7 selector:a5 nextState:0];

  return v9;
}

+ (id)entryWithState:(id)a3 event:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() entryWithState:v6 event:v5 action:0];

  return v7;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_selector = v3;
}

- (NSString)nextState
{
  return self->_nextState;
}

- (void)setNextState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end