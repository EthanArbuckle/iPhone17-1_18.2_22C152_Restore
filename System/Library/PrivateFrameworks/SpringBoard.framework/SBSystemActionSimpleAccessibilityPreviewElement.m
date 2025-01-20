@interface SBSystemActionSimpleAccessibilityPreviewElement
- (SBSystemActionSimpleAccessibilityPreviewElement)initWithSystemAction:(id)a3 contentProvider:(id)a4 keyColor:(id)a5;
- (uint64_t)_updateWithAccessibilityTripleClickStateIfNeeded:(uint64_t)a3 animated:;
- (void)_handleTripleClickOptionDidChangeNotification;
- (void)dealloc;
@end

@implementation SBSystemActionSimpleAccessibilityPreviewElement

- (SBSystemActionSimpleAccessibilityPreviewElement)initWithSystemAction:(id)a3 contentProvider:(id)a4 keyColor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 configuredAction];
  v13 = objc_msgSend(v12, "sb_configuredIntentAction");

  v14 = [v13 sectionIdentifier];
  char v15 = [v14 isEqualToString:@"Accessibility"];

  if (v15)
  {
    v31.receiver = self;
    v31.super_class = (Class)SBSystemActionSimpleAccessibilityPreviewElement;
    v16 = [(SBSystemActionSimplePreviewElement *)&v31 initWithSystemAction:v9 contentProvider:v10 keyColor:v11];
    v17 = v16;
    if (v16)
    {
      v16->_accessibilityTripleClickState = -1;
      v18 = [v10 trailingContentViewProvider];
      v19 = [v18 providedView];
      uint64_t v20 = objc_opt_class();
      id v21 = v19;
      if (v20)
      {
        if (objc_opt_isKindOfClass()) {
          v22 = v21;
        }
        else {
          v22 = 0;
        }
      }
      else
      {
        v22 = 0;
      }
      v23 = v22;

      trailingView = v17->_trailingView;
      v17->_trailingView = v23;

      v25 = (char *)-[WFConfiguredStaccatoIntentAction sb_accessibilityTripleClickState](v13);
      if ((unint64_t)(v25 - 1) <= 1)
      {
        v26 = v17->_trailingView;
        v27 = [MEMORY[0x1E4F428B8] systemBlueColor];
        [(WFApertureIconView *)v26 setSymbolColorOverride:v27];
      }
      if ((char *)v17->_accessibilityTripleClickState != v25)
      {
        v17->_accessibilityTripleClickState = (int64_t)v25;
        [(WFApertureIconView *)v17->_trailingView setEnabled:v25 != (char *)2 animated:0];
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v17, (CFNotificationCallback)_SBSystemActionSimpleAccessibilityPreviewElementTripleClickOptionDidChange, (CFStringRef)[MEMORY[0x1E4F49480] tripleClickOptionDidChangeNotification], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }

    return v17;
  }
  else
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[configuredIntentAction sectionIdentifier] isEqualToString:WFStaccatoActionSectionIdentifierAccessibility]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionSimpleAccessibilityPreviewElement initWithSystemAction:contentProvider:keyColor:](a2, (uint64_t)self, (uint64_t)v30);
    }
    [v30 UTF8String];
    result = (SBSystemActionSimpleAccessibilityPreviewElement *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (uint64_t)_updateWithAccessibilityTripleClickStateIfNeeded:(uint64_t)a3 animated:
{
  if (result)
  {
    if (*(void *)(result + 184) != a2)
    {
      *(void *)(result + 184) = a2;
      return [*(id *)(result + 192) setEnabled:a2 != 2 animated:a3];
    }
  }
  return result;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)[MEMORY[0x1E4F49480] tripleClickOptionDidChangeNotification], 0);
  v4.receiver = self;
  v4.super_class = (Class)SBSystemActionSimpleAccessibilityPreviewElement;
  [(SBSystemActionSimpleAccessibilityPreviewElement *)&v4 dealloc];
}

- (void)_handleTripleClickOptionDidChangeNotification
{
  if (a1)
  {
    v2 = -[SBSystemActionSimplePreviewElement systemAction](a1);
    v3 = [v2 configuredAction];
    objc_msgSend(v3, "sb_configuredIntentAction");
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_super v4 = -[WFConfiguredStaccatoIntentAction sb_accessibilityTripleClickState](v5);
    if (*(void **)(a1 + 184) != v4)
    {
      *(void *)(a1 + 184) = v4;
      [*(id *)(a1 + 192) setEnabled:v4 != (void *)2 animated:1];
    }
  }
}

- (void).cxx_destruct
{
}

- (void)initWithSystemAction:(const char *)a1 contentProvider:(uint64_t)a2 keyColor:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  char v15 = @"SBSystemActionSimpleAccessibilityPreviewElement.m";
  __int16 v16 = 1024;
  int v17 = 32;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end