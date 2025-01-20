@interface _UIPhysicalButtonInteractionDynamicButtonDriver
- (_UIPhysicalButtonInteractionDynamicButtonDriver)init;
- (_UIPhysicalButtonInteractionDynamicButtonDriver)initWithReceiver:(id)a3;
- (int64_t)_driverType;
- (void)_dynamicButtonGestureRecognizer:(id)a3 dynamicButtonsDidUpdate:(id)a4 allDynamicButtons:(id)a5;
- (void)_installToViewIfNeeded:(id)a3;
- (void)_physicalButtonConfigurationsDidChange;
- (void)_uninstallFromViewIfNeeded:(id)a3;
@end

@implementation _UIPhysicalButtonInteractionDynamicButtonDriver

- (void)_installToViewIfNeeded:(id)a3
{
  dynamicButtonGesture = self->_dynamicButtonGesture;
  if (!dynamicButtonGesture)
  {
    v6 = [_UIDynamicButtonNotifyingGestureRecognizer alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
    v8 = [WeakRetained _configurationSet];
    v9 = (_UIDynamicButtonNotifyingGestureRecognizer *)-[_UIDynamicButtonNotifyingGestureRecognizer initWithPhysicalButtonConfigurations:dynamicButtonObserver:](v6, v8, self);
    v10 = self->_dynamicButtonGesture;
    self->_dynamicButtonGesture = v9;

    dynamicButtonGesture = self->_dynamicButtonGesture;
  }
  [a3 addGestureRecognizer:dynamicButtonGesture];
}

- (_UIPhysicalButtonInteractionDynamicButtonDriver)initWithReceiver:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPhysicalButtonInteractionDynamicButtonDriver;
  v4 = [(_UIPhysicalButtonInteractionDynamicButtonDriver *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeWeak((id *)&v4->_receiver, a3);
  }
  return v5;
}

- (_UIPhysicalButtonInteractionDynamicButtonDriver)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIPhysicalButtonInteractionDynamicButtonDriver.m", 31, @"%s: init is not allowed on %@", "-[_UIPhysicalButtonInteractionDynamicButtonDriver init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void)_uninstallFromViewIfNeeded:(id)a3
{
}

- (void)_physicalButtonConfigurationsDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
  v3 = [WeakRetained _configurationSet];
  dynamicButtonGesture = self->_dynamicButtonGesture;
  if (dynamicButtonGesture) {
    -[_UIDynamicButtonNotifyingGestureRecognizer _evaluateAllowedPhysicalButtons]((uint64_t)dynamicButtonGesture);
  }
}

- (int64_t)_driverType
{
  return 1;
}

- (void)_dynamicButtonGestureRecognizer:(id)a3 dynamicButtonsDidUpdate:(id)a4 allDynamicButtons:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &_dynamicButtonGestureRecognizer_dynamicButtonsDidUpdate_allDynamicButtons____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v26 = *(id *)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v27 = NSString;
        v28 = self;
        v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        v31 = [v27 stringWithFormat:@"<%@: %p>", v30, v28];
      }
      else
      {
        v31 = @"(nil)";
      }
      v32 = v31;
      id v33 = objc_loadWeakRetained((id *)&self->_receiver);
      if (v33)
      {
        v34 = NSString;
        v35 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v35);
        v37 = [v34 stringWithFormat:@"<%@: %p>", v36, v33];
      }
      else
      {
        v37 = @"(nil)";
      }

      *(_DWORD *)buf = 138412802;
      v54 = v32;
      __int16 v55 = 2112;
      v56 = v37;
      __int16 v57 = 2112;
      id v58 = a4;
      _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_ERROR, "Received updated dynamic buttons for driver: %@; interaction: %@; buttons: %@",
        buf,
        0x20u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
  v42 = [WeakRetained _configurationSet];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = a4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v40 = *(void *)v48;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v48 != v40) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v47 + 1) + 8 * v11);
        uint64_t v13 = [v12 _physicalButton];
        v14 = [v42 _configurationForButton:v13];
        if (v14)
        {
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v15 = a5;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v44;
            while (2)
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v44 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
                if (v20 != v12 && [v20 _physicalButton] == v13)
                {

                  [v12 _phase];
                  goto LABEL_20;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v51 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          unint64_t v21 = [v12 _phase];
          if (v21 > 4) {
LABEL_20:
          }
            uint64_t v22 = 1;
          else {
            uint64_t v22 = qword_186B949A0[v21];
          }
          v23 = +[_UIPhysicalButtonAction _actionFromDynamicButton:withConfiguration:state:andDriver:]((uint64_t)_UIPhysicalButtonAction, v12, v14, v22, [(_UIPhysicalButtonInteractionDynamicButtonDriver *)self _driverType]);
          id v24 = objc_loadWeakRetained((id *)&self->_receiver);
          [v24 _driver:self didCreateProposedAction:v23];
        }
        else
        {
          v23 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIPhysicalButtonInteractionDynamicButtonDriver.m", 78, @"Invalid state: no configuration for physical button allowed by gesture: allowedPhysicalButtons: %lu; physicalButtonConfigurations: %@",
            [(_UIAbstractDynamicButtonGestureRecognizer *)self->_dynamicButtonGesture _allowedPhysicalButtons], v42);
        }

        ++v11;
      }
      while (v11 != v10);
      uint64_t v25 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
      uint64_t v10 = v25;
    }
    while (v25);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicButtonGesture, 0);
  objc_destroyWeak((id *)&self->_receiver);
}

@end