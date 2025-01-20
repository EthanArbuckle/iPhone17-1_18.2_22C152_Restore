@interface SBFluidSwitcherGesture
- (NSString)description;
- (SBAppLayout)selectedAppLayout;
- (SBFluidSwitcherGesture)initWithType:(int64_t)a3 eventProvider:(id)a4;
- (UIGestureRecognizer)gestureRecognizerForStudyLog;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)gestureEvent;
- (id)studyLogData;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)selectedLayoutRole;
- (int64_t)state;
- (int64_t)type;
- (void)_setGestureRecognizerForStudyLog:(id)a3;
- (void)_setSelectedAppLayout:(id)a3;
- (void)_setSelectedLayoutRole:(int64_t)a3;
- (void)_setState:(int64_t)a3;
@end

@implementation SBFluidSwitcherGesture

- (SBFluidSwitcherGesture)initWithType:(int64_t)a3 eventProvider:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBFluidSwitcherGesture.m", 92, @"Invalid parameter not satisfying: %@", @"eventProvider" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)SBFluidSwitcherGesture;
  v8 = [(SBFluidSwitcherGesture *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    uint64_t v10 = [v7 copy];
    id eventProvider = v9->_eventProvider;
    v9->_id eventProvider = (id)v10;

    v9->_state = 1;
  }

  return v9;
}

- (id)gestureEvent
{
  v4 = (*((void (**)(void))self->_eventProvider + 2))();
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherGesture.m" lineNumber:107 description:@"The event provider must return a gesture event."];
  }
  return v4;
}

- (id)studyLogData
{
  if (self->_gestureRecognizerForStudyLog)
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
    v4 = [NSNumber numberWithUnsignedLong:self->_gestureRecognizerForStudyLog];
    [v3 setObject:v4 forKeyedSubscript:@"address"];

    uint64_t v5 = [(UIGestureRecognizer *)self->_gestureRecognizerForStudyLog name];
    v6 = (void *)v5;
    if (v5) {
      id v7 = (__CFString *)v5;
    }
    else {
      id v7 = &stru_1F3084718;
    }
    [v3 setObject:v7 forKeyedSubscript:@"name"];

    v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[UIGestureRecognizer state](self->_gestureRecognizerForStudyLog, "state"));
    [v3 setObject:v8 forKeyedSubscript:@"state"];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSString)description
{
  return (NSString *)[(SBFluidSwitcherGesture *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBFluidSwitcherGesture *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBFluidSwitcherGesture *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFluidSwitcherGesture *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__SBFluidSwitcherGesture_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

uint64_t __64__SBFluidSwitcherGesture_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = *(void *)(*(void *)(a1 + 40) + 40) - 1;
  if (v3 > 0xA) {
    id v4 = 0;
  }
  else {
    id v4 = off_1E6AFDC70[v3];
  }
  return [v2 appendString:v4 withName:@"type"];
}

- (int64_t)state
{
  return self->_state;
}

- (void)_setState:(int64_t)a3
{
  self->_state = a3;
}

- (SBAppLayout)selectedAppLayout
{
  return self->_selectedAppLayout;
}

- (void)_setSelectedAppLayout:(id)a3
{
}

- (UIGestureRecognizer)gestureRecognizerForStudyLog
{
  return self->_gestureRecognizerForStudyLog;
}

- (void)_setGestureRecognizerForStudyLog:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)selectedLayoutRole
{
  return self->_selectedLayoutRole;
}

- (void)_setSelectedLayoutRole:(int64_t)a3
{
  self->_selectedLayoutRole = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizerForStudyLog, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong(&self->_eventProvider, 0);
}

@end