@interface SBHIDValueModifyingButtonSetArbiter
- (BOOL)processKeyboardEvent:(__IOHIDEvent *)a3;
- (SBHIDValueModifyingButtonSetArbiter)initWithHIDKeyPressEventUsages:(id)a3 initialRepeatDelay:(double)a4 subsequentRepeatDelay:(double)a5;
- (SBHIDValueModifyingButtonSetArbiterDelegate)delegate;
- (double)initialRepeatDelay;
- (double)subsequentRepeatDelay;
- (void)_fireRepeatingActionTimer;
- (void)_invalidateRepeatingActionTimer;
- (void)_performActionForButton:(id)a3;
- (void)_startRepeatingActionTimer;
- (void)dealloc;
- (void)performActionsForButtonDown:(id)a3;
- (void)performActionsForButtonLongPress:(id)a3;
- (void)performActionsForButtonUp:(id)a3;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setInitialRepeatDelay:(double)a3;
- (void)setSubsequentRepeatDelay:(double)a3;
@end

@implementation SBHIDValueModifyingButtonSetArbiter

- (SBHIDValueModifyingButtonSetArbiter)initWithHIDKeyPressEventUsages:(id)a3 initialRepeatDelay:(double)a4 subsequentRepeatDelay:(double)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SBHIDValueModifyingButtonSetArbiter;
  v9 = [(SBHIDValueModifyingButtonSetArbiter *)&v32 init];
  v10 = v9;
  if (v9)
  {
    if (a5 > 0.0 && a4 == 0.0) {
      a4 = a5;
    }
    v9->_initialRepeatDelay = a4;
    v9->_subsequentRepeatDelay = a5;
    v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v13 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v8;
    uint64_t v14 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v19 = objc_alloc_init(SBHIDButtonStateArbiter);
          [(SBHIDButtonStateArbiter *)v19 setLongPressTimeout:a4];
          [(SBHIDButtonStateArbiter *)v19 setDelegate:v10];
          v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v18, "unsignedIntValue"));
          [(NSDictionary *)v12 setObject:v19 forKeyedSubscript:v20];

          v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v18, "unsignedIntValue"));
          v22 = [MEMORY[0x1E4F29238] valueWithPointer:v19];
          [(NSDictionary *)v13 setObject:v21 forKeyedSubscript:v22];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v15);
    }

    usageToButtonDictionary = v10->_usageToButtonDictionary;
    v10->_usageToButtonDictionary = v12;
    v24 = v12;

    buttonToUsageDictionary = v10->_buttonToUsageDictionary;
    v10->_buttonToUsageDictionary = v13;
  }
  return v10;
}

- (void)dealloc
{
  [(BSAbsoluteMachTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBHIDValueModifyingButtonSetArbiter;
  [(SBHIDValueModifyingButtonSetArbiter *)&v3 dealloc];
}

- (BOOL)processKeyboardEvent:(__IOHIDEvent *)a3
{
  int IntegerValue = IOHIDEventGetIntegerValue();
  int v6 = IOHIDEventGetIntegerValue();
  usageToButtonDictionary = self->_usageToButtonDictionary;
  id v8 = [NSNumber numberWithUnsignedInt:v6 | (IntegerValue << 16)];
  v9 = [(NSDictionary *)usageToButtonDictionary objectForKeyedSubscript:v8];

  if (v9) {
    [v9 processEvent:a3];
  }

  return v9 != 0;
}

- (void)reset
{
  [(SBHIDValueModifyingButtonSetArbiter *)self _invalidateRepeatingActionTimer];
  [(SBHIDButtonStateArbiter *)self->_currentDownButton reset];
  currentDownButton = self->_currentDownButton;
  self->_currentDownButton = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained buttonSetArbiterDidReset:self];
  }
}

- (void)performActionsForButtonUp:(id)a3
{
  if (self->_currentDownButton == a3)
  {
    [(SBHIDValueModifyingButtonSetArbiter *)self reset];
    currentDownButton = self->_currentDownButton;
    self->_currentDownButton = 0;
  }
}

- (void)performActionsForButtonDown:(id)a3
{
  v4 = (SBHIDButtonStateArbiter *)a3;
  [(SBHIDValueModifyingButtonSetArbiter *)self _invalidateRepeatingActionTimer];
  currentDownButton = self->_currentDownButton;
  if (currentDownButton) {
    BOOL v6 = currentDownButton == v4;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    [(SBHIDButtonStateArbiter *)currentDownButton reset];
  }
  v7 = self->_currentDownButton;
  self->_currentDownButton = v4;
  id v8 = v4;

  [(SBHIDValueModifyingButtonSetArbiter *)self _performActionForButton:v8];
}

- (void)performActionsForButtonLongPress:(id)a3
{
  v5 = (SBHIDButtonStateArbiter *)a3;
  v7 = v5;
  if (self->_currentDownButton != v5)
  {
    BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBHIDValueModifyingButtonSetArbiter.m" lineNumber:115 description:@"bug somewhere in this class"];

    v5 = v7;
  }
  [(SBHIDValueModifyingButtonSetArbiter *)self _performActionForButton:v5];
  [(SBHIDValueModifyingButtonSetArbiter *)self _startRepeatingActionTimer];
}

- (void)_performActionForButton:(id)a3
{
  buttonToUsageDictionary = self->_buttonToUsageDictionary;
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
  id v9 = [(NSDictionary *)buttonToUsageDictionary objectForKeyedSubscript:v5];

  unsigned int v6 = [v9 unsignedIntValue];
  LOWORD(buttonToUsageDictionary) = v6;
  uint64_t v7 = HIWORD(v6);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained buttonSetArbiter:self performActionForButtonPage:v7 usage:(unsigned __int16)buttonToUsageDictionary];
}

- (void)_fireRepeatingActionTimer
{
}

- (void)_startRepeatingActionTimer
{
  if (self->_subsequentRepeatDelay > 0.0)
  {
    objc_initWeak(&location, self);
    objc_super v3 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBHIDValueModifyingButtonSetArbiter.timer"];
    timer = self->_timer;
    self->_timer = v3;

    v5 = self->_timer;
    double subsequentRepeatDelay = self->_subsequentRepeatDelay;
    uint64_t v7 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__SBHIDValueModifyingButtonSetArbiter__startRepeatingActionTimer__block_invoke;
    v9[3] = &unk_1E6AF5838;
    objc_copyWeak(&v10, &location);
    [(BSAbsoluteMachTimer *)v5 scheduleRepeatingWithFireInterval:v7 repeatInterval:v9 leewayInterval:subsequentRepeatDelay queue:subsequentRepeatDelay handler:0.01];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __65__SBHIDValueModifyingButtonSetArbiter__startRepeatingActionTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fireRepeatingActionTimer];
}

- (void)_invalidateRepeatingActionTimer
{
  [(BSAbsoluteMachTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (SBHIDValueModifyingButtonSetArbiterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHIDValueModifyingButtonSetArbiterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)initialRepeatDelay
{
  return self->_initialRepeatDelay;
}

- (void)setInitialRepeatDelay:(double)a3
{
  self->_initialRepeatDelay = a3;
}

- (double)subsequentRepeatDelay
{
  return self->_subsequentRepeatDelay;
}

- (void)setSubsequentRepeatDelay:(double)a3
{
  self->_double subsequentRepeatDelay = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentDownButton, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_buttonToUsageDictionary, 0);
  objc_storeStrong((id *)&self->_usageToButtonDictionary, 0);
}

@end