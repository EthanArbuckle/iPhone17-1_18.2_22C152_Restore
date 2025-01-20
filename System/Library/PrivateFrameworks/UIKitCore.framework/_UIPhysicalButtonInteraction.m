@interface _UIPhysicalButtonInteraction
- (BOOL)_isEnabled;
- (BOOL)_isProxyInteraction;
- (BOOL)_wantsRelaxedVisibilityRequirement;
- (BOOL)_wantsSystemShellExclusivePriority;
- (NSArray)_driverClasses;
- (NSSet)_configurations;
- (NSString)_name;
- (NSString)debugDescription;
- (UIView)view;
- (_UIPhysicalButtonConfigurationSet)_configurationSet;
- (_UIPhysicalButtonInteraction)init;
- (_UIPhysicalButtonInteraction)initWithConfigurations:(id)a3 delegate:(id)a4;
- (_UIPhysicalButtonInteractionDelegate)_delegate;
- (id)_bsActionDriver;
- (id)_configurationForButton:(unint64_t)a3;
- (id)_driverForType:(uint64_t)a1;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)_propagatePropertiesToConfigurationSetReturningIfHasExclusiveBehavior:(uint64_t)a1;
- (unint64_t)_identifier;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_driver:(id)a3 didCreateProposedAction:(id)a4;
- (void)_enumerateConfigurationsSynchronizingPropertiesAndNotifyingArbiter:(uint64_t)a1;
- (void)_evaluateWithinSceneBoundsIfNeededWithChangeHandler:(uint64_t)a1;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_installViewComponentsAndRegisterIfAble;
- (void)_registerWithArbiterIfAble;
- (void)_registerWithArbiterSkippingEvaluationAndObservation;
- (void)_setConfigurations:(id)a3;
- (void)_setEnabled:(BOOL)a3;
- (void)_setIdentifier:(unint64_t)a3;
- (void)_setName:(id)a3;
- (void)_setWantsRelaxedVisibilityRequirement:(BOOL)a3;
- (void)_setWantsSystemShellExclusivePriority:(BOOL)a3;
- (void)_uninstallViewComponentsAndUnregister;
- (void)_unregisterFromArbiter;
- (void)_willMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_windowDidMoveToScene:(id)a3;
- (void)_windowWillMoveToScene:(id)a3;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIPhysicalButtonInteraction

- (void)_willMoveFromWindow:(id)a3 toWindow:(id)a4
{
  if (!self->_enabled) {
    return;
  }
  v7 = [a4 _windowHostingScene];
  if (self->_arbiterRegistrationToken)
  {
    if (a3 && a4 && v7)
    {
      *(unsigned char *)&self->_interactionFlags |= 1u;
LABEL_7:
      v8 = v7;
      -[_UIPhysicalButtonInteraction _unregisterFromArbiter]((uint64_t)self);
      v7 = v8;
      goto LABEL_11;
    }
    if (!a4 || !v7) {
      goto LABEL_7;
    }
  }
LABEL_11:
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  if ((a3->var0 & 6) != 0 && (*(unsigned char *)&self->_interactionFlags & 0x10) != 0) {
    -[_UIPhysicalButtonInteraction _evaluateWithinSceneBoundsIfNeededWithChangeHandler:]((uint64_t)self, (uint64_t)&__block_literal_global_525);
  }
}

- (void)willMoveToView:(id)a3
{
  -[_UIPhysicalButtonInteraction _uninstallViewComponentsAndUnregister]((uint64_t)self);
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  id v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    BOOL enabled = self->_enabled;

    if (enabled)
    {
      -[_UIPhysicalButtonInteraction _installViewComponentsAndRegisterIfAble]((uint64_t)self);
    }
  }
}

- (void)_unregisterFromArbiter
{
  v5[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v5[0] = 0x1ED1601C0;
    v5[1] = 0x1ED1601E0;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
    -[NSNotificationCenter _uiRemoveObserver:names:](v2, (void *)a1, v3);

    *(unsigned char *)(a1 + 32) &= 0xDDu;
    [*(id *)(a1 + 80) invalidate];
    v4 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;
  }
}

- (void)_uninstallViewComponentsAndUnregister
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 32) & 0x10) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      -[UIView _removeGeometryChangeObserver:](WeakRetained, (void *)a1);
    }
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));

    if (v3)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v4 = *(id *)(a1 + 8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v4);
            }
            v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
            id v10 = objc_loadWeakRetained((id *)(a1 + 40));
            objc_msgSend(v9, "_uninstallFromViewIfNeeded:", v10, (void)v11);
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v6);
      }
    }
    -[_UIPhysicalButtonInteraction _unregisterFromArbiter](a1);
  }
}

- (void)_installViewComponentsAndRegisterIfAble
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 32) & 0x10) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      -[UIView _addGeometryChangeObserver:](WeakRetained, (void *)a1);
    }
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));

    if (v3)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v4 = *(id *)(a1 + 8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v4);
            }
            v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
            id v10 = objc_loadWeakRetained((id *)(a1 + 40));
            objc_msgSend(v9, "_installToViewIfNeeded:", v10, (void)v11);
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v6);
      }
    }
    -[_UIPhysicalButtonInteraction _registerWithArbiterIfAble](a1);
  }
}

- (_UIPhysicalButtonInteraction)initWithConfigurations:(id)a3 delegate:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"_UIPhysicalButtonInteraction.m", 412, @"Invalid parameter not satisfying: %@", @"configurations" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"_UIPhysicalButtonInteraction.m", 413, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_3:
  id v28 = 0;
  char IsMostlyValid = _UIPhysicalButtonConfigurationNSSetIsMostlyValid(a3, &v28);
  id v9 = v28;
  if ((IsMostlyValid & 1) == 0)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIPhysicalButtonInteraction.m", 418, @"%s: Invalid configurations for reason: %@; configurations: %@",
      "-[_UIPhysicalButtonInteraction initWithConfigurations:delegate:]",
      v9,
      a3);
  }
  v27.receiver = self;
  v27.super_class = (Class)_UIPhysicalButtonInteraction;
  id v10 = [(_UIPhysicalButtonInteraction *)&v27 init];
  if (v10)
  {
    uint64_t v11 = +[_UIPhysicalButtonConfigurationSet _configurationSetFromNSSet:]((uint64_t)_UIPhysicalButtonConfigurationSet, a3);
    configurationSet = v10->_configurationSet;
    v10->_configurationSet = (_UIPhysicalButtonConfigurationSet *)v11;

    *(unsigned char *)&v10->_interactionFlags &= ~0x10u;
    if (-[_UIPhysicalButtonInteraction _propagatePropertiesToConfigurationSetReturningIfHasExclusiveBehavior:]((uint64_t)v10, v10->_configurationSet))*(unsigned char *)&v10->_interactionFlags |= 0x10u; {
    objc_storeWeak((id *)&v10->_delegate, a4);
    }
    v10->_BOOL enabled = 1;
    if (!v10->_drivers)
    {
      uint64_t v13 = objc_opt_new();
      drivers = v10->_drivers;
      v10->_drivers = (NSMutableArray *)v13;

      v15 = [(_UIPhysicalButtonInteraction *)v10 _driverClasses];
      if (!v15)
      {
        v26 = [MEMORY[0x1E4F28B00] currentHandler];
        [v26 handleFailureInMethod:sel__createDriversIfNeeded, v10, @"_UIPhysicalButtonInteraction.m", 604, @"%s: Invalid driver classes returned by subclass: %@", "-[_UIPhysicalButtonInteraction _createDriversIfNeeded]", v10 object file lineNumber description];
      }
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = (void *)[objc_alloc(*(Class *)(*((void *)&v29 + 1) + 8 * i)) initWithReceiver:v10];
            [(NSMutableArray *)v10->_drivers addObject:v21];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v18);
      }
    }
  }

  return v10;
}

- (uint64_t)_propagatePropertiesToConfigurationSetReturningIfHasExclusiveBehavior:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = a2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      char v6 = 0;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v3);
          }
          id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          objc_msgSend(v9, "_setWantsSystemShellExclusivePriority:", (*(unsigned __int8 *)(a1 + 32) >> 3) & 1, (void)v11);
          if (*(void *)(a1 + 72)) {
            objc_msgSend(v9, "_setName:");
          }
          v6 |= [v9 _behavior] != 2;
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

- (NSArray)_driverClasses
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return (NSArray *)v2;
}

- (BOOL)_wantsRelaxedVisibilityRequirement
{
  return (*(unsigned char *)&self->_interactionFlags >> 2) & 1;
}

- (_UIPhysicalButtonConfigurationSet)_configurationSet
{
  return self->_configurationSet;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (BOOL)_isEnabled
{
  return self->_enabled;
}

- (id)succinctDescription
{
  v2 = [(_UIPhysicalButtonInteraction *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = objc_loadWeakRetained((id *)&self->_view);
  if (v4)
  {
    uint64_t v5 = NSString;
    char v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    v8 = [v5 stringWithFormat:@"<%@: %p>", v7, v4];
  }
  else
  {
    v8 = @"(nil)";
  }

  id v9 = (id)[v3 appendObject:v8 withName:@"view"];
  id v10 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v10)
  {
    long long v11 = NSString;
    long long v12 = (objc_class *)objc_opt_class();
    long long v13 = NSStringFromClass(v12);
    long long v14 = [v11 stringWithFormat:@"<%@: %p>", v13, v10];
  }
  else
  {
    long long v14 = @"(nil)";
  }

  id v15 = (id)[v3 appendObject:v14 withName:@"delegate"];
  if ([(NSString *)self->_name length]) {
    [v3 appendString:self->_name withName:@"name"];
  }
  id v16 = (id)[v3 appendBool:self->_enabled withName:@"enabled"];
  id v17 = (id)[v3 appendBool:self->_arbiterRegistrationToken != 0 withName:@"hasRegistered"];
  uint64_t v18 = _UIPhysicalButtonSuccinctConfigurationsDescriptionForSet(&self->_configurationSet->super.isa);
  id v19 = (id)[v3 appendObject:v18 withName:@"configurations"];

  id v20 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMutableArray count](self->_orderedActionsForAllPhysicalButtons, "count"), @"activeActions");
  return v3;
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  if (!self->_enabled) {
    return;
  }
  id v16 = [a3 _windowHostingScene];
  id v7 = [a4 _windowHostingScene];
  arbiterRegistrationToken = self->_arbiterRegistrationToken;
  unsigned __int8 interactionFlags = self->_interactionFlags;
  int v10 = (a3 != 0) & interactionFlags;
  if (!a4) {
    int v10 = 0;
  }
  if (!((unint64_t)a3 | (unint64_t)arbiterRegistrationToken)) {
    int v10 = 1;
  }
  if (arbiterRegistrationToken) {
    BOOL v11 = v16 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v14 = !v11 && v7 != 0 && v16 != v7;
  if (v10 == 1 && v7 != 0)
  {
    *(unsigned char *)&self->_unsigned __int8 interactionFlags = interactionFlags & 0xFE;
LABEL_30:
    -[_UIPhysicalButtonInteraction _registerWithArbiterIfAble]((uint64_t)self);
    goto LABEL_31;
  }
  if (!a3 && a4 && !arbiterRegistrationToken && !v7) {
    goto LABEL_30;
  }
  if (v14)
  {
    -[_UIPhysicalButtonInteraction _unregisterFromArbiter]((uint64_t)self);
    goto LABEL_30;
  }
LABEL_31:
}

- (void)_registerWithArbiterIfAble
{
  if (!a1) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained _window];

  id v3 = [v5 _windowHostingScene];
  if (v3)
  {
    -[_UIPhysicalButtonInteraction _registerWithArbiterSkippingEvaluationAndObservation](a1);
    if (!v5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v5)
  {
    *(unsigned char *)(a1 + 32) |= 2u;
LABEL_7:
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:a1 selector:sel__windowWillMoveToScene_ name:0x1ED1601C0 object:v5];
    [v4 addObserver:a1 selector:sel__windowDidMoveToScene_ name:0x1ED1601E0 object:v5];
  }
LABEL_8:
}

- (void)_registerWithArbiterSkippingEvaluationAndObservation
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v3 = [WeakRetained _window];
    id v8 = [v3 _windowHostingScene];

    id v4 = [v8 _physicalButtonInteractionArbiter];
    if (!v8 || ([v8 _hasInvalidated] & 1) == 0)
    {
      if (!v4 || *(void *)(a1 + 80))
      {
        id v7 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__registerWithArbiterSkippingEvaluationAndObservation, a1, @"_UIPhysicalButtonInteraction.m", 664, @"%s: Invalid attempt to register with arbiter: %@; interaction: %@",
          "-[_UIPhysicalButtonInteraction _registerWithArbiterSkippingEvaluationAndObservation]",
          v4,
          a1);
      }
      else
      {
        uint64_t v5 = -[_UIPhysicalButtonInteractionArbiter _registerPhysicalButtonInteraction:]((uint64_t)v4, (void *)a1);
        char v6 = *(void **)(a1 + 80);
        *(void *)(a1 + 80) = v5;

        -[_UIPhysicalButtonInteraction _evaluateWithinSceneBoundsIfNeededWithChangeHandler:](a1, 0);
      }
    }
  }
}

- (void)_evaluateWithinSceneBoundsIfNeededWithChangeHandler:(uint64_t)a1
{
  if (a1 && *(void *)(a1 + 80) && (*(unsigned char *)(a1 + 32) & 0x10) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = [WeakRetained _window];
    uint64_t v5 = [v4 _windowHostingScene];
    unsigned int v6 = *(unsigned __int8 *)(a1 + 32);
    [WeakRetained frame];
    double v9 = v8 + v7 * 0.5;
    double v12 = v11 + v10 * 0.5;
    long long v13 = [v5 _coordinateSpace];
    objc_msgSend(WeakRetained, "convertPoint:toCoordinateSpace:", v13, v9, v12);
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [v13 bounds];
    v22.x = v15;
    v22.y = v17;
    if (CGRectContainsPoint(v23, v22)) {
      unsigned int v18 = 32;
    }
    else {
      unsigned int v18 = 0;
    }
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a1 + 32) & 0xDF | v18;
    if (a2 && ((v6 >> 5) & 1) != v18 >> 5)
    {
      id v19 = [v5 _physicalButtonInteractionArbiter];
      (*(void (**)(uint64_t, void *, void *))(a2 + 16))(a2, v19, v4);
    }
  }
}

- (_UIPhysicalButtonInteraction)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIPhysicalButtonInteraction.m", 405, @"%s: init is not allowed on %@", "-[_UIPhysicalButtonInteraction init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void)_enumerateConfigurationsSynchronizingPropertiesAndNotifyingArbiter:(uint64_t)a1
{
  if (a1)
  {
    *(unsigned char *)(a1 + 32) &= ~0x10u;
    if (-[_UIPhysicalButtonInteraction _propagatePropertiesToConfigurationSetReturningIfHasExclusiveBehavior:](a1, *(void **)(a1 + 48)))*(unsigned char *)(a1 + 32) |= 0x10u; {
    if (*(void *)(a1 + 80))
    }
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      id v5 = [WeakRetained _window];

      id v3 = [v5 _windowHostingScene];
      id v4 = [v3 _physicalButtonInteractionArbiter];

      -[_UIPhysicalButtonInteractionArbiter _setNeedsResolutionOfPhysicalButtonConfigurationsInWindow:forReason:]((uint64_t)v4, v5, 3uLL);
    }
  }
}

- (void)dealloc
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v7[0] = 0x1ED1601C0;
  v7[1] = 0x1ED1601E0;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  [(BSInvalidatable *)self->_arbiterRegistrationToken invalidate];
  arbiterRegistrationToken = self->_arbiterRegistrationToken;
  self->_arbiterRegistrationToken = 0;

  v6.receiver = self;
  v6.super_class = (Class)_UIPhysicalButtonInteraction;
  [(_UIPhysicalButtonInteraction *)&v6 dealloc];
}

- (BOOL)_isProxyInteraction
{
  return 0;
}

- (void)_setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v5 stringValue];
  [(_UIPhysicalButtonInteraction *)self _setName:v4];
}

- (void)_setName:(id)a3
{
  id v5 = self->_name;
  objc_super v6 = (NSString *)a3;
  double v10 = v6;
  if (v5 == v6)
  {
  }
  else
  {
    if (v6 && v5)
    {
      char v7 = [(NSString *)v5 isEqual:v6];

      if (v7) {
        return;
      }
    }
    else
    {
    }
    double v8 = (NSString *)[(NSString *)v10 copy];
    name = self->_name;
    self->_name = v8;

    -[_UIPhysicalButtonInteraction _enumerateConfigurationsSynchronizingPropertiesAndNotifyingArbiter:]((uint64_t)self);
  }
}

- (NSSet)_configurations
{
  return (NSSet *)-[_UIPhysicalButtonConfigurationSet _nsSetRepresentation](&self->_configurationSet->super.isa);
}

- (void)_setConfigurations:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    CGRect v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"_UIPhysicalButtonInteraction.m", 508, @"Invalid parameter not satisfying: %@", @"configurations" object file lineNumber description];
  }
  id v28 = 0;
  char IsMostlyValid = _UIPhysicalButtonConfigurationNSSetIsMostlyValid(a3, &v28);
  id v7 = v28;
  if (IsMostlyValid)
  {
    double v8 = self->_configurationSet;
    char interactionFlags = (char)self->_interactionFlags;
    double v10 = +[_UIPhysicalButtonConfigurationSet _configurationSetFromNSSet:]((uint64_t)_UIPhysicalButtonConfigurationSet, a3);
    int v11 = -[_UIPhysicalButtonInteraction _propagatePropertiesToConfigurationSetReturningIfHasExclusiveBehavior:]((uint64_t)self, v10);
    if (![(_UIPhysicalButtonConfigurationSet *)v8 isEqual:v10])
    {
      arbiterRegistrationToken = self->_arbiterRegistrationToken;
      if (arbiterRegistrationToken) {
        -[_UIPhysicalButtonInteraction _unregisterFromArbiter]((uint64_t)self);
      }
      objc_storeStrong((id *)&self->_configurationSet, v10);
      if (((((interactionFlags & 0x10) == 0) ^ v11) & 1) == 0)
      {
        char v13 = v11 ? 16 : 0;
        *(unsigned char *)&self->_char interactionFlags = *(unsigned char *)&self->_interactionFlags & 0xEF | v13;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

        if (WeakRetained)
        {
          char v15 = (char)self->_interactionFlags;
          double v16 = objc_loadWeakRetained((id *)&self->_view);
          CGFloat v17 = v16;
          if ((v15 & 0x10) != 0) {
            -[UIView _addGeometryChangeObserver:](v16, self);
          }
          else {
            -[UIView _removeGeometryChangeObserver:](v16, self);
          }
        }
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      unsigned int v18 = self->_drivers;
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v25 != v21) {
              objc_enumerationMutation(v18);
            }
            [*(id *)(*((void *)&v24 + 1) + 8 * i) _physicalButtonConfigurationsDidChange];
          }
          uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v20);
      }

      if (arbiterRegistrationToken) {
        -[_UIPhysicalButtonInteraction _registerWithArbiterIfAble]((uint64_t)self);
      }
    }
  }
  else
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    -[_UIPhysicalButtonConfigurationSet handleFailureInMethod:object:file:lineNumber:description:](v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIPhysicalButtonInteraction.m", 513, @"%s: Invalid configurations for reason: %@; configurations: %@",
      "-[_UIPhysicalButtonInteraction _setConfigurations:]",
      v7,
      a3);
  }
}

- (id)_configurationForButton:(unint64_t)a3
{
  return [(_UIPhysicalButtonConfigurationSet *)self->_configurationSet _configurationForButton:a3];
}

- (BOOL)_wantsSystemShellExclusivePriority
{
  return (*(unsigned char *)&self->_interactionFlags >> 3) & 1;
}

- (void)_setWantsSystemShellExclusivePriority:(BOOL)a3
{
  char interactionFlags = (char)self->_interactionFlags;
  if (((((interactionFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 8;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char interactionFlags = interactionFlags & 0xF7 | v4;
    -[_UIPhysicalButtonInteraction _enumerateConfigurationsSynchronizingPropertiesAndNotifyingArbiter:]((uint64_t)self);
  }
}

- (id)_driverForType:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = *(id *)(a1 + 8);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          double v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v8, "_driverType", (void)v11) == a2)
          {
            id v9 = v8;
            goto LABEL_12;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    id v9 = 0;
LABEL_12:
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)_bsActionDriver
{
  if (a1)
  {
    a1 = -[_UIPhysicalButtonInteraction _driverForType:]((uint64_t)a1, 0);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_BOOL enabled = a3;
    if (a3) {
      -[_UIPhysicalButtonInteraction _installViewComponentsAndRegisterIfAble]((uint64_t)self);
    }
    else {
      -[_UIPhysicalButtonInteraction _uninstallViewComponentsAndUnregister]((uint64_t)self);
    }
  }
}

- (void)_windowWillMoveToScene:(id)a3
{
  uint64_t v5 = [a3 object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_7;
  }
  uint64_t v11 = [a3 object];

  if (!v11)
  {
LABEL_7:
    double v8 = 0;
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v7 = [WeakRetained _window];

  double v8 = (void *)v11;
  if (v7 == (void *)v11)
  {
    arbiterRegistrationToken = self->_arbiterRegistrationToken;
    if (arbiterRegistrationToken)
    {
      [(BSInvalidatable *)arbiterRegistrationToken invalidate];
      double v10 = self->_arbiterRegistrationToken;
      self->_arbiterRegistrationToken = 0;

      double v8 = (void *)v11;
      *(unsigned char *)&self->_interactionFlags |= 2u;
    }
  }
LABEL_8:
}

- (void)_windowDidMoveToScene:(id)a3
{
  uint64_t v5 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [a3 object];

    uint64_t v6 = (void *)v9;
    if (v9)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
      double v8 = [WeakRetained _window];

      uint64_t v6 = (void *)v9;
      if (v8 == (void *)v9 && !self->_arbiterRegistrationToken && (*(unsigned char *)&self->_interactionFlags & 2) != 0)
      {
        *(unsigned char *)&self->_interactionFlags &= ~2u;
        -[_UIPhysicalButtonInteraction _registerWithArbiterSkippingEvaluationAndObservation]((uint64_t)self);
        uint64_t v6 = (void *)v9;
      }
    }
  }
  else
  {

    uint64_t v6 = 0;
  }
}

- (void)_setWantsRelaxedVisibilityRequirement:(BOOL)a3
{
  BOOL v3 = a3;
  int IsSpringBoard = _UIApplicationProcessIsSpringBoard();
  if (!IsSpringBoard && v3)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UIPhysicalButtonInteraction.m", 894, @"%s: Invalid request to relax visibility requirement for interaction: %@", "-[_UIPhysicalButtonInteraction _setWantsRelaxedVisibilityRequirement:]", self object file lineNumber description];
  }
  else if (IsSpringBoard)
  {
    char interactionFlags = (char)self->_interactionFlags;
    if (((((interactionFlags & 4) == 0) ^ v3) & 1) == 0)
    {
      char v8 = v3 ? 4 : 0;
      *(unsigned char *)&self->_char interactionFlags = interactionFlags & 0xFB | v8;
      if (self->_arbiterRegistrationToken)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
        id v13 = [WeakRetained _window];

        double v10 = [v13 _windowHostingScene];
        uint64_t v11 = [v10 _physicalButtonInteractionArbiter];

        -[_UIPhysicalButtonInteractionArbiter _setNeedsResolutionOfPhysicalButtonConfigurationsInWindow:forReason:]((uint64_t)v11, v13, 4uLL);
      }
    }
  }
}

- (void)_driver:(id)a3 didCreateProposedAction:(id)a4
{
  uint64_t v6 = objc_msgSend(a4, "_state", a3);
  if (!self->_actionsByPhysicalButton)
  {
    id v7 = (NSMutableDictionary *)objc_opt_new();
    actionsByPhysicalButton = self->_actionsByPhysicalButton;
    self->_actionsByPhysicalButton = v7;
  }
  if (!self->_orderedActionsForAllPhysicalButtons)
  {
    uint64_t v9 = (NSMutableArray *)objc_opt_new();
    orderedActionsForAllPhysicalButtons = self->_orderedActionsForAllPhysicalButtons;
    self->_orderedActionsForAllPhysicalButtons = v9;
  }
  id v23 = a4;
  uint64_t v11 = [v23 _button];
  long long v12 = self->_actionsByPhysicalButton;
  id v13 = [NSNumber numberWithUnsignedInteger:v11];
  long long v14 = [(NSMutableDictionary *)v12 objectForKey:v13];

  if (v14)
  {
    char v15 = self->_actionsByPhysicalButton;
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:v11];
    [(NSMutableDictionary *)v15 removeObjectForKey:v16];

    [(NSMutableArray *)self->_orderedActionsForAllPhysicalButtons removeObjectIdenticalTo:v14];
  }
  CGFloat v17 = self->_actionsByPhysicalButton;
  unsigned int v18 = [NSNumber numberWithUnsignedInteger:v11];
  [(NSMutableDictionary *)v17 setObject:v23 forKey:v18];

  [(NSMutableArray *)self->_orderedActionsForAllPhysicalButtons addObject:v23];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v20 = (void *)[(NSMutableArray *)self->_orderedActionsForAllPhysicalButtons copy];
  [WeakRetained _physicalButtonInteraction:self handleAction:v23 withActiveActions:v20];

  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    uint64_t v21 = self->_actionsByPhysicalButton;
    CGPoint v22 = [NSNumber numberWithUnsignedInteger:v11];
    [(NSMutableDictionary *)v21 removeObjectForKey:v22];

    [(NSMutableArray *)self->_orderedActionsForAllPhysicalButtons removeObjectIdenticalTo:v23];
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIPhysicalButtonInteraction *)self debugDescriptionWithMultilinePrefix:&stru_1ED0E84C0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(_UIPhysicalButtonInteraction *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(_UIPhysicalButtonInteraction *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  char has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v6 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v6 setActiveMultilinePrefix:a3];
  id v7 = objc_loadWeakRetained((id *)&self->_view);
  if (v7)
  {
    char v8 = NSString;
    uint64_t v9 = (objc_class *)objc_opt_class();
    double v10 = NSStringFromClass(v9);
    uint64_t v11 = [v8 stringWithFormat:@"<%@: %p>", v10, v7];
  }
  else
  {
    uint64_t v11 = @"(nil)";
  }

  id v12 = (id)[v6 appendObject:v11 withName:@"view"];
  id v13 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v13)
  {
    long long v14 = NSString;
    char v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    CGFloat v17 = [v14 stringWithFormat:@"<%@: %p>", v16, v13];
  }
  else
  {
    CGFloat v17 = @"(nil)";
  }

  id v18 = (id)[v6 appendObject:v17 withName:@"delegate"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __70___UIPhysicalButtonInteraction_descriptionBuilderWithMultilinePrefix___block_invoke;
  v23[3] = &unk_1E52DC3D0;
  id v19 = v6;
  id v24 = v19;
  long long v25 = self;
  char v26 = has_internal_diagnostics;
  id v20 = (id)[v19 modifyBody:v23];
  id v21 = v19;

  return v21;
}

- (_UIPhysicalButtonInteractionDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIPhysicalButtonInteractionDelegate *)WeakRetained;
}

- (unint64_t)_identifier
{
  return self->_identifier;
}

- (NSString)_name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arbiterRegistrationToken, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configurationSet, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_orderedActionsForAllPhysicalButtons, 0);
  objc_storeStrong((id *)&self->_actionsByPhysicalButton, 0);
  objc_storeStrong((id *)&self->_drivers, 0);
}

@end