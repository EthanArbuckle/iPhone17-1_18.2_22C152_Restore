@interface EKReminderEditViewControllerCreator
- (BOOL)useThisIntegrationEditorForEvent:(id)a3;
- (id)integrationViewControllerForEvent:(id)a3 eventEditViewDelegate:(id)a4;
@end

@implementation EKReminderEditViewControllerCreator

- (BOOL)useThisIntegrationEditorForEvent:(id)a3
{
  return [a3 isReminderIntegrationEvent];
}

- (id)integrationViewControllerForEvent:(id)a3 eventEditViewDelegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v5 calendarModel], (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_FAULT)) {
      sub_100147590((uint64_t)v5, v8);
    }
    v7 = 0;
  }
  v9 = [[_TtC9MobileCal28EKReminderEditViewController alloc] initWithModel:v7];
  [(EKReminderEditViewController *)v9 setEvent:v6];

  [(EKReminderEditViewController *)v9 setInternalEditViewDelegate:v5];

  return v9;
}

@end