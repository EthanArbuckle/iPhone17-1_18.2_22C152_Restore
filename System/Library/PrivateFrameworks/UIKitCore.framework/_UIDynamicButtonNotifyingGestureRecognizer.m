@interface _UIDynamicButtonNotifyingGestureRecognizer
- (BOOL)_shouldReceiveDynamicButton:(id)a3;
- (BOOL)shouldReceiveEvent:(id)a3;
- (id)initWithPhysicalButtonConfigurations:(void *)a3 dynamicButtonObserver:;
- (uint64_t)_evaluateAllowedPhysicalButtons;
- (void)_dynamicButtonsBegan:(id)a3 withEvent:(id)a4;
- (void)_dynamicButtonsCancelled:(id)a3 withEvent:(id)a4;
- (void)_dynamicButtonsChanged:(id)a3 withEvent:(id)a4;
- (void)_dynamicButtonsEnded:(id)a3 withEvent:(id)a4;
- (void)reset;
@end

@implementation _UIDynamicButtonNotifyingGestureRecognizer

- (id)initWithPhysicalButtonConfigurations:(void *)a3 dynamicButtonObserver:
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)_UIDynamicButtonNotifyingGestureRecognizer;
  v5 = (id *)objc_msgSendSuper2(&v8, sel_initWithTarget_action_, 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong(v5 + 37, a2);
    objc_storeWeak(v6 + 35, a3);
    -[_UIDynamicButtonNotifyingGestureRecognizer _evaluateAllowedPhysicalButtons]((uint64_t)v6);
    [v6 _setRequiresSystemGesturesToFail:0];
  }
  return v6;
}

- (uint64_t)_evaluateAllowedPhysicalButtons
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (void *)result;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = *(id *)(result + 296);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = 0;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v2);
          }
          unint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "_button", (void)v10);
          uint64_t v9 = 1 << v8;
          if (v8 >= 6) {
            uint64_t v9 = 0;
          }
          v5 |= v9;
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }
    else
    {
      uint64_t v5 = 0;
    }

    return [v1 _setAllowedPhysicalButtons:v5];
  }
  return result;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  return [a3 type] == 16;
}

- (BOOL)_shouldReceiveDynamicButton:(id)a3
{
  unint64_t v4 = [a3 _physicalButton];
  if (v4 >= 6) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 1 << v4;
  }
  return (v5 & ~[(_UIAbstractDynamicButtonGestureRecognizer *)self _allowedPhysicalButtons]) == 0;
}

- (void)_dynamicButtonsBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)_UIDynamicButtonNotifyingGestureRecognizer;
  -[_UIAbstractDynamicButtonGestureRecognizer _dynamicButtonsBegan:withEvent:](&v17, sel__dynamicButtonsBegan_withEvent_);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v7);
      }
      ++self->_activeDynamicButtons;
      if (!--v9)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }
  else
  {

    if (!self) {
      goto LABEL_11;
    }
  }
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible) {
    [(UIGestureRecognizer *)self setState:1];
  }
LABEL_11:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicButtonObserver);
  long long v12 = [a4 _allDynamicButtons];
  [WeakRetained _dynamicButtonGestureRecognizer:self dynamicButtonsDidUpdate:v7 allDynamicButtons:v12];
}

- (void)_dynamicButtonsChanged:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIDynamicButtonNotifyingGestureRecognizer;
  -[_UIAbstractDynamicButtonGestureRecognizer _dynamicButtonsChanged:withEvent:](&v9, sel__dynamicButtonsChanged_withEvent_);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicButtonObserver);
  uint64_t v8 = [a4 _allDynamicButtons];
  [WeakRetained _dynamicButtonGestureRecognizer:self dynamicButtonsDidUpdate:a3 allDynamicButtons:v8];
}

- (void)_dynamicButtonsEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)_UIDynamicButtonNotifyingGestureRecognizer;
  -[_UIAbstractDynamicButtonGestureRecognizer _dynamicButtonsEnded:withEvent:](&v17, sel__dynamicButtonsEnded_withEvent_);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v7);
      }
      --self->_activeDynamicButtons;
      if (!--v9)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }
  else
  {

    if (!self) {
      goto LABEL_11;
    }
  }
  if (!self->_activeDynamicButtons) {
    -[UIGestureRecognizer setState:](self, "setState:", 3, v13);
  }
LABEL_11:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicButtonObserver);
  long long v12 = [a4 _allDynamicButtons];
  [WeakRetained _dynamicButtonGestureRecognizer:self dynamicButtonsDidUpdate:v7 allDynamicButtons:v12];
}

- (void)_dynamicButtonsCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)_UIDynamicButtonNotifyingGestureRecognizer;
  -[_UIAbstractDynamicButtonGestureRecognizer _dynamicButtonsCancelled:withEvent:](&v17, sel__dynamicButtonsCancelled_withEvent_);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v7);
      }
      --self->_activeDynamicButtons;
      if (!--v9)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }
  else
  {

    if (!self) {
      goto LABEL_11;
    }
  }
  if (!self->_activeDynamicButtons) {
    -[UIGestureRecognizer setState:](self, "setState:", 4, v13);
  }
LABEL_11:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicButtonObserver);
  long long v12 = [a4 _allDynamicButtons];
  [WeakRetained _dynamicButtonGestureRecognizer:self dynamicButtonsDidUpdate:v7 allDynamicButtons:v12];
}

- (void)reset
{
  self->_activeDynamicButtons = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalButtonConfigurations, 0);
  objc_destroyWeak((id *)&self->_dynamicButtonObserver);
}

@end