@interface _UIStateMachine
- (_UIStateMachine)initWithSpec:(void *)a3 initialState:(unint64_t)a4;
- (_UIStateMachine)initWithStates:(unint64_t)a3 events:(unint64_t)a4 initialState:(unint64_t)a5;
- (unint64_t)state;
- (void)dealloc;
- (void)handleEvent:(unint64_t)a3 withContext:(_UIStateContext)a4;
- (void)setStateChangeObserver:(unint64_t)a3 observer:(id)a4;
- (void)setStaticTransitionFromState:(unint64_t)a3 withEvent:(unint64_t)a4 toState:(unint64_t)a5;
- (void)setTransitionHandlerForState:(unint64_t)a3 withEvent:(unint64_t)a4 transitionHandler:(id)a5;
- (void)setTransitionHandlerForState:(unint64_t)a3 withEvent:(unint64_t)a4 transitionHandler:(id)a5 postTransitionHandler:(id)a6;
- (void)spec;
@end

@implementation _UIStateMachine

- (_UIStateMachine)initWithSpec:(void *)a3 initialState:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStateMachine;
  result = [(_UIStateMachine *)&v7 init];
  if (result)
  {
    result->_spec = (const $D5D70FF55F94B7F814E4C50A540B7AFF *)a3;
    result->_state = a4;
    result->_externalSpec = 1;
  }
  return result;
}

- (void)handleEvent:(unint64_t)a3 withContext:(_UIStateContext)a4
{
}

- (unint64_t)state
{
  return self->_state;
}

- (_UIStateMachine)initWithStates:(unint64_t)a3 events:(unint64_t)a4 initialState:(unint64_t)a5
{
  unsigned int v6 = a4;
  unsigned int v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIStateMachine;
  v8 = [(_UIStateMachine *)&v12 init];
  if (v8)
  {
    uint64_t v9 = 24 * v6 + 8;
    v10 = ($D5D70FF55F94B7F814E4C50A540B7AFF *)malloc_type_calloc(1uLL, v9 * v7 + 32, 0xBEDE849DuLL);
    v10->var0.var0 = v9;
    v10->var0.var1 = v7;
    v10->var0.var2 = v6;
    v8->_spec = v10;
    v8->_state = a5;
    v8->_externalSpec = 0;
  }
  return v8;
}

- (void)dealloc
{
  if (!self->_externalSpec)
  {
    spec = ($D5D70FF55F94B7F814E4C50A540B7AFF *)self->_spec;
    if (spec->var0.var1)
    {
      unint64_t v4 = 0;
      var2 = spec->var2;
      do
      {
        unint64_t var0 = spec->var0.var0;
        unint64_t v7 = spec->var0.var0 * v4;
        v8 = *(id *)((char *)&var2->var0 + v7);
        *(id *)((char *)&var2->var0 + v7) = 0;

        if (spec->var0.var2)
        {
          unint64_t v9 = 0;
          v10 = (id *)((char *)&spec->var2[2].var0 + var0 * v4);
          do
          {
            v11 = *v10;
            $D5D70FF55F94B7F814E4C50A540B7AFF *v10 = 0;

            objc_super v12 = *(v10 - 1);
            *(v10 - 1) = 0;

            ++v9;
            v10 += 3;
          }
          while (v9 < spec->var0.var2);
        }
        ++v4;
      }
      while (v4 < spec->var0.var1);
    }
    free(spec);
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIStateMachine;
  [(_UIStateMachine *)&v13 dealloc];
}

- (void)setTransitionHandlerForState:(unint64_t)a3 withEvent:(unint64_t)a4 transitionHandler:(id)a5
{
}

- (void)setTransitionHandlerForState:(unint64_t)a3 withEvent:(unint64_t)a4 transitionHandler:(id)a5 postTransitionHandler:(id)a6
{
  spec = self->_spec;
  if (spec->var0.var1 <= a3)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = [NSString stringWithUTF8String:"-[_UIStateMachine(Legacy) setTransitionHandlerForState:withEvent:transitionHandler:postTransitionHandler:]"];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"_UIStateMachine.m", 201, @"Attempting to set transition handler with invalid fromState. State (@lu) is out of range for the initialized stateCount (%lu)", a3, self->_spec->var0.var1);

    spec = self->_spec;
  }
  if (spec->var0.var2 <= a4)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = [NSString stringWithUTF8String:"-[_UIStateMachine(Legacy) setTransitionHandlerForState:withEvent:transitionHandler:postTransitionHandler:]"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"_UIStateMachine.m", 202, @"Attempting to set transition handler with invalid event. State (@lu) is out of range for the initialized eventCount (%lu)", a4, self->_spec->var0.var2);

    spec = self->_spec;
  }
  unint64_t v12 = (unint64_t)spec + 24 * a4 + spec->var0.var0 * a3;
  objc_super v13 = _Block_copy(a6);
  v14 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v13;

  v15 = _Block_copy(a5);
  v16 = *(void **)(v12 + 48);
  *(void *)(v12 + 48) = v15;

  *(_DWORD *)(v12 + 56) = 16842752;
}

- (void)setStaticTransitionFromState:(unint64_t)a3 withEvent:(unint64_t)a4 toState:(unint64_t)a5
{
  __int16 v5 = a5;
  spec = self->_spec;
  if (spec->var0.var1 <= a3)
  {
    objc_super v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = [NSString stringWithUTF8String:"-[_UIStateMachine(Legacy) setStaticTransitionFromState:withEvent:toState:]"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"_UIStateMachine.m", 212, @"Attempting to set static transition with invalid fromState. State (@lu) is out of range for the initialized stateCount (%lu)", a3, self->_spec->var0.var1);

    spec = self->_spec;
  }
  if (spec->var0.var2 <= a4)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"-[_UIStateMachine(Legacy) setStaticTransitionFromState:withEvent:toState:]"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"_UIStateMachine.m", 213, @"Attempting to set static transition with invalid event. State (@lu) is out of range for the initialized eventCount (%lu)", a4, self->_spec->var0.var2);

    spec = self->_spec;
  }
  unint64_t v10 = (unint64_t)spec + 24 * a4 + spec->var0.var0 * a3;
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

  unint64_t v12 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = 0;

  *(_WORD *)(v10 + 56) = v5;
}

- (void)setStateChangeObserver:(unint64_t)a3 observer:(id)a4
{
  unint64_t v4 = (char *)self->_spec + self->_spec->var0.var0 * a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59___UIStateMachine_Legacy__setStateChangeObserver_observer___block_invoke;
  aBlock[3] = &unk_1E5304558;
  aBlock[4] = a4;
  __int16 v5 = _Block_copy(aBlock);
  unsigned int v6 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = v5;
}

- (void)spec
{
  return (void *)self->_spec;
}

@end