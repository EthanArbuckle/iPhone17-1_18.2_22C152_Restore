@interface UIFocusDebugger
+ (id)_ancestryForEnvironment:(id)a3;
+ (id)_legacy_checkFocusabilityForView:(id)a3;
+ (id)_statusForFocusSystem:(id)a3 scene:(id)a4 includeSceneLog:(BOOL)a5 includeDeferralTarget:(BOOL)a6;
+ (id)_verboseStatus;
+ (id)checkFocusabilityForItem:(id)item;
+ (id)focusGroupsForEnvironment:(id)environment;
+ (id)help;
+ (id)preferredFocusEnvironmentsForEnvironment:(id)environment;
+ (id)simulateFocusUpdateRequestFromEnvironment:(id)environment;
+ (id)status;
@end

@implementation UIFocusDebugger

+ (id)help
{
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least()) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."];
  }
  v2 = [MEMORY[0x1E4F28E78] string];
  [v2 appendString:@"\nFocus Debugging Utilities:"];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __23__UIFocusDebugger_help__block_invoke;
  aBlock[3] = &unk_1E52EE210;
  id v8 = v2;
  id v3 = v2;
  v4 = (void (**)(void *, __CFString *, __CFString *, __CFString *, __CFString *))_Block_copy(aBlock);
  v4[2](v4, @"Status", @"po UIFocusDebugger.status()", @"po [UIFocusDebugger status]", @"Outputs information for the currently focused item.");
  v4[2](v4, @"Diagnosing Focusability Issues", @"po UIFocusDebugger.checkFocusability(for: <item reference>)", @"po [UIFocusDebugger checkFocusabilityForItem:<item reference>]", @"Outputs a diagnosis of the specified item's focusability, including any known issues that may be preventing focusability.");
  v5 = +[_UIFocusDebuggerStringOutput outputWithString:v3];

  return v5;
}

void __23__UIFocusDebugger_help__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  v9 = *(void **)(a1 + 32);
  id v12 = a5;
  id v10 = a4;
  id v11 = a3;
  [v9 appendFormat:@"\n\n%@:", a2];
  [*(id *)(a1 + 32) appendFormat:@"\n\tSwift: %@", v11];

  [*(id *)(a1 + 32) appendFormat:@"\n\tObjC:  %@", v10];
  [*(id *)(a1 + 32) appendFormat:@"\n\n\tOverview:\n\t%@", v12];
}

+ (id)status
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least()) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."];
  }
  v2 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v3 = [(id)UIApp connectedScenes];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v4 = +[UIFocusSystem _allFocusSystems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v10 = [v9 _hostFocusSystem];

        if (!v10)
        {
          id v11 = +[_UIFocusSystemSceneComponent sceneComponentForFocusSystem:v9];
          id v12 = [v11 _scene];

          if (v12 && [v3 containsObject:v12]) {
            [v2 setObject:v12 forKey:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }
  v24 = v3;

  v13 = +[_UIDebugLogNode rootNode];
  unint64_t v14 = [v2 count];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v15 = [v2 keyEnumerator];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        v21 = objc_msgSend(v2, "objectForKey:", v20, v24);
        v22 = [a1 _statusForFocusSystem:v20 scene:v21 includeSceneLog:v14 > 1 includeDeferralTarget:0];
        [v13 addMessage:v22];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v17);
  }

  return v13;
}

+ (id)_verboseStatus
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least()) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."];
  }
  id v3 = +[_UIDebugLogNode rootNode];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = +[UIFocusSystem _allFocusSystems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = +[_UIFocusSystemSceneComponent sceneComponentForFocusSystem:v9];
        id v11 = [v10 _scene];

        id v12 = [a1 _statusForFocusSystem:v9 scene:v11 includeSceneLog:1 includeDeferralTarget:1];
        [v3 addMessage:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)_statusForFocusSystem:(id)a3 scene:(id)a4 includeSceneLog:(BOOL)a5 includeDeferralTarget:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least()) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."];
  }
  id v11 = [v9 focusedItem];
  id v12 = v9;
  if (v12)
  {
    v13 = NSString;
    long long v14 = (objc_class *)objc_opt_class();
    long long v15 = NSStringFromClass(v14);
    long long v16 = [v13 stringWithFormat:@"<%@: %p>", v15, v12];
  }
  else
  {
    long long v16 = @"(nil)";
  }

  long long v17 = +[_UIDebugLogMessage messageWithStyle:1 string:v16];

  int v18 = [v12 _isEnabled];
  uint64_t v19 = @"NO";
  if (v18) {
    uint64_t v19 = @"YES";
  }
  uint64_t v20 = +[_UIDebugLogMessage messageWithFormat:@"enabled: %@", v19];
  [v17 addMessage:v20];

  if (v10 && v7)
  {
    v21 = NSString;
    id v22 = v10;
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    v25 = [v21 stringWithFormat:@"<%@: %p>", v24, v22];

    long long v26 = +[_UIDebugLogMessage messageWithFormat:@"scene: %@", v25];
    [v17 addMessage:v26];
  }
  id v27 = v11;
  if (v27)
  {
    long long v28 = NSString;
    long long v29 = (objc_class *)objc_opt_class();
    long long v30 = NSStringFromClass(v29);
    long long v31 = [v28 stringWithFormat:@"<%@: %p>", v30, v27];
  }
  else
  {
    long long v31 = @"(nil)";
  }

  long long v32 = +[_UIDebugLogMessage messageWithFormat:@"focused item: %@", v31];
  [v17 addMessage:v32];

  if (v6)
  {
    long long v33 = [v12 valueForKeyPath:@"_deferredFocusUpdateTarget"];
    if (v33)
    {
      v34 = NSString;
      v35 = (objc_class *)objc_opt_class();
      uint64_t v36 = NSStringFromClass(v35);
      v37 = [v34 stringWithFormat:@"<%@: %p>", v36, v33];
    }
    else
    {
      v37 = @"(nil)";
    }
    v38 = +[_UIDebugLogMessage messageWithFormat:@"deferral target: %@", v37];
    [v17 addMessage:v38];
  }
  return v17;
}

+ (id)_legacy_checkFocusabilityForView:(id)a3
{
  id v3 = a3;
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least()) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."];
  }
  v4 = +[UIFocusDebugger checkFocusabilityForItem:v3];
  uint64_t v5 = [v4 description];
  BOOL v6 = ;

  return v6;
}

+ (id)checkFocusabilityForItem:(id)item
{
  id v5 = item;
  if (!v5)
  {
    long long v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"UIFocusDebugger.m", 207, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  BOOL v6 = +[UIFocusSystem focusSystemForEnvironment:v5];
  BOOL v7 = v6;
  if (!v6)
  {
    v21 = @"This item is not part of any focus system, so focusability is not applicable.";
LABEL_16:
    id v22 = +[_UIFocusDebuggerStringOutput outputWithString:v21];
    goto LABEL_26;
  }
  id v8 = [v6 focusedItem];

  if (v8 == v5)
  {
    v21 = @"This item is currently focused.";
    goto LABEL_16;
  }
  id v9 = objc_alloc_init(_UIDebugIssueReport);
  int v10 = [v5 canBecomeFocused];
  if ((v10 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_8;
    }
    id v11 = [(_UIDebugIssueReport *)v9 issues];
    uint64_t v12 = [v11 count];

    [v5 _diagnoseFocusabilityForReport:v9];
    v13 = [(_UIDebugIssueReport *)v9 issues];
    uint64_t v14 = [v13 count];

    if (v12 == v14)
    {
LABEL_8:
      long long v15 = +[_UIDebugIssue issueWithDescription:@"This item returns NO from -canBecomeFocused."];
      [(_UIDebugIssueReport *)v9 addIssue:v15];
    }
  }
  int IsEligibleForFocusInteraction = _UIFocusEnvironmentIsEligibleForFocusInteraction(v5);
  if (!IsEligibleForFocusInteraction
    || (objc_opt_respondsToSelector() & 1) != 0
    && [v5 _shouldAlwaysDiagnoseFocusInteractionEligibility])
  {
    if (objc_opt_respondsToSelector())
    {
      long long v17 = [(_UIDebugIssueReport *)v9 issues];
      uint64_t v18 = [v17 count];

      [v5 _diagnoseFocusInteractionEligibilityForReport:v9];
      uint64_t v19 = [(_UIDebugIssueReport *)v9 issues];
      BOOL v20 = v18 != [v19 count];
    }
    else
    {
      BOOL v20 = 0;
    }
    if (((IsEligibleForFocusInteraction | v20) & 1) == 0)
    {
      v23 = +[_UIDebugIssue issueWithDescription:@"This item is not eligible for focus, but the reason is unknown."];
      [(_UIDebugIssueReport *)v9 addIssue:v23];
LABEL_24:

      goto LABEL_25;
    }
  }
  else
  {
    BOOL v20 = 0;
  }
  if (((v20 | v10 ^ 1) & 1) == 0)
  {
    v23 = [v7 _focusMapContainer];
    if (v23)
    {
      v24 = [[_UIFocusMap alloc] initWithFocusSystem:v7 rootContainer:v23 coordinateSpace:0 searchInfo:0 ignoresRootContainerClippingRect:0];
      [(_UIFocusMap *)v24 diagnoseFocusabilityForItem:v5 report:v9];
    }
    goto LABEL_24;
  }
LABEL_25:
  v25 = objc_alloc_init(_UIDebugIssueReportFormatter);
  [(_UIDebugIssueReportFormatter *)v25 setHeader:@"The following issues were found that would prevent this item from being focusable:"];
  [(_UIDebugIssueReportFormatter *)v25 setNoIssuesDescription:@"This item should be focusable.\n\nIf you are still having trouble focusing this item, consider the following:\n – This tool will not detect if this item is denied focus as the result of returning NO from -shouldUpdateFocusInContext:.\n – This tool will not detect if another item or guide is redirecting focus movement away from this item.\n – This tool may not detect if this item has dynamic conditions that affect its focusability."];
  long long v26 = [(_UIDebugIssueReportFormatter *)v25 stringFromReport:v9];
  id v22 = +[_UIFocusDebuggerStringOutput outputWithString:v26];

LABEL_26:
  return v22;
}

+ (id)simulateFocusUpdateRequestFromEnvironment:(id)environment
{
  id v5 = environment;
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least()) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."];
  }
  if (!v5)
  {
    v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2, a1, @"UIFocusDebugger.m", 279, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  BOOL v6 = +[UIFocusSystem focusSystemForEnvironment:v5];
  if (!v6)
  {
    long long v17 = +[_UIFocusDebuggerStringOutput outputWithString:@"This environment is not part of any focus system, and so cannot request a focus update."];
    goto LABEL_30;
  }
  v53 = [[_UIFocusUpdateRequest alloc] initWithFocusSystem:v6 environment:v5];
  id v7 = [[UIFocusUpdateContext alloc] _initWithFocusUpdateRequest:v53];
  id v8 = objc_alloc_init(_UIDebugLogReport);
  [v7 _setPreferredFocusReport:v8];

  id v9 = objc_alloc_init(_UIDebugIssueReport);
  [v7 _setValidationReport:v9];

  int v10 = objc_alloc_init(_UIDebugLogReport);
  uint64_t v11 = [v7 previouslyFocusedItem];
  if (v11)
  {
    uint64_t v12 = NSString;
    v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    long long v15 = [v12 stringWithFormat:@"<%@: %p>", v14, v11];

    long long v16 = [v12 stringWithFormat:@"(%@ is currently focused)", v15];
  }
  else
  {
    long long v16 = @"(Nothing is currently focused)";
  }
  id v18 = v5;
  if (v5)
  {
    uint64_t v19 = NSString;
    BOOL v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    id v22 = [v19 stringWithFormat:@"<%@: %p>", v21, v18];
  }
  else
  {
    id v22 = @"(nil)";
  }
  v55 = (void *)v11;

  v54 = v16;
  [(_UIDebugLogReport *)v10 addMessageWithFormat:@"Simulating a fake focus update request from %@... %@", v22, v16];

  [(_UIDebugLogReport *)v10 addLineBreak];
  v23 = objc_alloc_init(_UIDebugIssueReport);
  objc_msgSend(v6, "_debug_isEnvironmentEligibleForFocusUpdate:debugReport:", v18, v23);
  v24 = [(_UIDebugIssueReport *)v23 issues];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    long long v26 = objc_alloc_init(_UIDebugIssueReportFormatter);
    [(_UIDebugIssueReportFormatter *)v26 setHeader:@"The following issues were found that would normally prevent this environment's request from being accepted by the focus system (these will be ignored for the purposes of this test):"];
    id v27 = [(_UIDebugIssueReportFormatter *)v26 stringFromReport:v23];
    [(_UIDebugLogReport *)v10 addMessage:v27];

    [(_UIDebugLogReport *)v10 addLineBreak];
  }
  long long v28 = [v7 nextFocusedItem];
  long long v29 = +[_UIDebugReportFormatter defaultFormatter];
  long long v30 = [v7 _preferredFocusReport];
  long long v31 = [v29 stringFromReport:v30];
  [(_UIDebugLogReport *)v10 addMessage:v31];

  int v32 = [v7 _isValidInFocusSystem:v6];
  long long v33 = [v7 _validationReport];
  v34 = [v33 issues];
  uint64_t v35 = [v34 count];

  if (v35)
  {
    [(_UIDebugLogReport *)v10 addLineBreak];
    uint64_t v36 = +[UIFocusUpdateContext _defaultValidationReportFormatter];
    v37 = [v7 _validationReport];
    v38 = [v36 stringFromReport:v37];
    [(_UIDebugLogReport *)v10 addMessage:v38];
  }
  [(_UIDebugLogReport *)v10 resetIndentLevel];
  [(_UIDebugLogReport *)v10 addLineBreak];
  if (!v32)
  {
    if (v28 == v55)
    {
      if (v55)
      {
        v45 = NSString;
        id v46 = v55;
        v47 = (objc_class *)objc_opt_class();
        v48 = NSStringFromClass(v47);
        v43 = [v45 stringWithFormat:@"<%@: %p>", v48, v46];

        [(_UIDebugLogReport *)v10 addMessageWithFormat:@"Simulated Result: No change, %@ is still focused.", v43];
        goto LABEL_26;
      }
      v44 = @"Simulated Result: No change, nothing is still focused.";
    }
    else
    {
      v44 = @"Simulated Result: Failed to update focus.";
    }
LABEL_28:
    [(_UIDebugLogReport *)v10 addMessage:v44];
    goto LABEL_29;
  }
  if (!v28)
  {
    v44 = @"Simulated Result: Successfully updated focus to nil.";
    goto LABEL_28;
  }
  v39 = NSString;
  id v40 = v28;
  v41 = (objc_class *)objc_opt_class();
  v42 = NSStringFromClass(v41);
  v43 = [v39 stringWithFormat:@"<%@: %p>", v42, v40];

  [(_UIDebugLogReport *)v10 addMessageWithFormat:@"Simulated Result: Successfully updated focus to %@.", v43];
LABEL_26:

LABEL_29:
  v49 = +[_UIDebugReportFormatter defaultFormatter];
  v50 = [v49 stringFromReport:v10];

  long long v17 = +[_UIFocusDebuggerStringOutput outputWithString:v50];

LABEL_30:
  return v17;
}

+ (id)_ancestryForEnvironment:(id)a3
{
  id v5 = a3;
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least()) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."];
  }
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"UIFocusDebugger.m", 368, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  BOOL v6 = objc_alloc_init(_UIDebugLogReport);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43__UIFocusDebugger__ancestryForEnvironment___block_invoke;
  v14[3] = &unk_1E52EE238;
  long long v15 = v6;
  id v16 = v5;
  id v7 = v5;
  id v8 = v6;
  _UIFocusEnvironmentEnumerateAncestorEnvironments(v7, v14);
  id v9 = +[_UIDebugReportFormatter defaultFormatter];
  int v10 = [v9 stringFromReport:v8];

  uint64_t v11 = +[_UIFocusDebuggerStringOutput outputWithString:v10];

  return v11;
}

void __43__UIFocusDebugger__ancestryForEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v10 = v3;
  if (v3)
  {
    id v5 = NSString;
    BOOL v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = [v5 stringWithFormat:@"<%@: %p>", v7, v10];
  }
  else
  {
    id v8 = @"(nil)";
  }
  [v4 addMessage:v8];

  id v9 = v10;
  if (*(id *)(a1 + 40) == v10)
  {
    [*(id *)(a1 + 32) incrementIndentLevel];
    id v9 = v10;
  }
}

+ (id)focusGroupsForEnvironment:(id)environment
{
  id v3 = environment;
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least()) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."];
  }
  v4 = +[UIFocusSystem focusSystemForEnvironment:v3];
  id v5 = [[_UIFocusMovementRequest alloc] initWithFocusSystem:v4];
  BOOL v6 = [[_UIFocusMovementInfo alloc] initWithHeading:16 linearHeading:0 isInitial:1 shouldLoadScrollableContainer:0 looping:1 groupFilter:2 inputType:5];
  [(_UIFocusMovementRequest *)v5 setMovementInfo:v6];

  id v7 = [v4 _movementPerformer];
  id v8 = [v7 contextForFocusMovement:v5];

  id v9 = objc_opt_new();
  id v10 = +[_UIDebugLogMessage messageWithStyle:1 string:@"Focus Group Hierarchy:"];
  [v9 addMessage:v10];

  uint64_t v11 = [v8 _focusMapSearchInfo];
  uint64_t v12 = [v11 focusGroupMap];
  v13 = [v12 focusGroups];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __45__UIFocusDebugger_focusGroupsForEnvironment___block_invoke;
  v19[3] = &unk_1E52EE260;
  id v20 = v9;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__UIFocusDebugger_focusGroupsForEnvironment___block_invoke_2;
  v17[3] = &unk_1E52EE288;
  id v18 = v20;
  id v14 = v20;
  __recursePreOrderDepthFirstTraversal(v13, sel_childGroups, 0, v19, v17);
  long long v15 = [v14 rootNode];

  return v15;
}

uint64_t __45__UIFocusDebugger_focusGroupsForEnvironment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  BOOL v6 = v5;
  if (a3
    || ([v5 parentGroup], id v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    id v7 = [v6 description];
    id v8 = +[_UIDebugLogMessage messageWithString:v7];

    [*(id *)(a1 + 32) pushNode:v8];
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id *__45__UIFocusDebugger_focusGroupsForEnvironment___block_invoke_2(id *result, uint64_t a2, uint64_t a3, int a4)
{
  if (a4) {
    return (id *)(id)[result[4] popNode];
  }
  return result;
}

+ (id)preferredFocusEnvironmentsForEnvironment:(id)environment
{
  id v3 = environment;
  if ((_UIKitProcessIsBeingDebugged() & 1) == 0 && dyld_program_sdk_at_least()) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"It looks like you are calling a UIFocusDebugger method outside of lldb. That is not allowed."];
  }
  v4 = +[_UIDebugLogNode rootNode];
  id v5 = +[UIFocusSystem focusSystemForEnvironment:v3];
  if (v5)
  {
    BOOL v6 = +[_UIDebugLogMessage messageWithStyle:1 string:@"Preferred focus environments:"];
    [v4 addMessage:v6];

    id v7 = objc_opt_new();
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithObject:v4];
    uint64_t v9 = [[_UIFocusEnvironmentPreferenceEnumerator alloc] initWithEnumerationMode:1];
    [(_UIFocusEnvironmentPreferenceEnumerator *)v9 setAllowsInferringPreferences:0];
    [(_UIFocusEnvironmentPreferenceEnumerator *)v9 setDebugLog:v4];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__UIFocusDebugger_preferredFocusEnvironmentsForEnvironment___block_invoke;
    v12[3] = &unk_1E52EE2B0;
    id v13 = v7;
    id v14 = v5;
    id v10 = v7;
    [(_UIFocusEnvironmentPreferenceEnumerator *)v9 enumeratePreferencesForEnvironment:v3 usingBlock:v12];
  }
  else
  {
    id v8 = +[_UIDebugLogMessage messageWithStyle:4 string:@"The environment is not connected to a focus system."];
    [v4 addMessage:v8];
  }

  return v4;
}

void __60__UIFocusDebugger_preferredFocusEnvironmentsForEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if ([v14 isPreferredByItself])
  {
    *a3 = 1;
  }
  else
  {
    id v5 = [v14 environment];
    unsigned int v6 = [*(id *)(a1 + 32) containsObject:v5];
    id v7 = _UIFocusItemSafeCast(v5);
    id v8 = v7;
    if (v6)
    {
      uint64_t v9 = +[UIColor systemYellowColor];
      id v10 = @"Environment seen previously. Skipping.";
      uint64_t v11 = @"!";
    }
    else if (v7 && _UIFocusItemIsFocusedOrFocusableInFocusSystem(v7, *(void **)(a1 + 40)))
    {
      uint64_t v9 = +[UIColor systemBlueColor];
      id v10 = @"Environment is focusable.";
      uint64_t v11 = @"*";
    }
    else
    {
      uint64_t v9 = 0;
      id v10 = 0;
      uint64_t v11 = &stru_1ED0E84C0;
    }
    if ([(__CFString *)v10 length])
    {
      uint64_t v12 = +[_UIDebugLogMessage messageWithPrefix:v11 color:v9 string:v10];
      id v13 = [v14 debugStack];
      [v13 addMessage:v12];
    }
    [*(id *)(a1 + 32) addObject:v5];
    *a3 = v6;
  }
}

@end