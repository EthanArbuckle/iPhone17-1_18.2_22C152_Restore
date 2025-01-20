@interface AddEventViewControllerManager
- (AddEventViewControllerManager)initWithCalendarModel:(id)a3;
- (AddItemViewControllerManagerDelegate)addItemViewControllerManagerDelegate;
- (BOOL)canDismiss;
- (BOOL)hasUnsavedChanges;
- (BOOL)ignoreUnsavedChanges;
- (BOOL)willPresentDialogOnSave;
- (EKCalendar)calendarToMakeVisibleOnSave;
- (NSString)newItemBackButtonTitle;
- (NSString)newItemTitle;
- (UIViewController)viewController;
- (id)_eventEditorForTestingOnly;
- (id)calendarModel;
- (id)confirmDismissAlertController;
- (id)createViewController:(id)a3;
- (id)pasteboardManagerForEventEditViewController:(id)a3;
- (void)attemptDisplayReviewPrompt;
- (void)cancelEditing;
- (void)completeAndSaveWithContinueBlock:(id)a3;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)presentationControllerDidAttemptToDismiss;
- (void)setAddItemViewControllerManagerDelegate:(id)a3;
- (void)setEditorBackgroundColor:(id)a3;
- (void)setIgnoreUnsavedChanges:(BOOL)a3;
- (void)updateStateFromUI:(id)a3;
- (void)updateUIFromState:(id)a3;
@end

@implementation AddEventViewControllerManager

- (AddEventViewControllerManager)initWithCalendarModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AddEventViewControllerManager;
  v6 = [(AddEventViewControllerManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_model, a3);
  }

  return v7;
}

- (NSString)newItemTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"NewEventItemTitle" value:@"Event" table:0];

  return v3;
}

- (NSString)newItemBackButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"NewEventItemBackButtonTitle" value:@"New Event" table:0];

  return v3;
}

- (id)createViewController:(id)a3
{
  viewController = self->_viewController;
  if (!viewController)
  {
    id v5 = a3;
    v6 = +[EKEventEditViewController editViewControllerImplementation];
    v7 = self->_viewController;
    self->_viewController = v6;

    v8 = [v5 addItemState];
    objc_super v9 = [v8 event];
    [(EKEventEditViewControllerImpl *)self->_viewController setEvent:v9];

    v10 = [v5 addItemState];
    v11 = [v10 event];
    v12 = [v11 eventStore];
    [(EKEventEditViewControllerImpl *)self->_viewController setEventStore:v12];

    [(EKEventEditViewControllerImpl *)self->_viewController setEditViewDelegate:self];
    -[EKEventEditViewControllerImpl setTimeImplicitlySet:](self->_viewController, "setTimeImplicitlySet:", [v5 creationMethod] == (id)2);
    v13 = [v5 suggestionKey];
    [(EKEventEditViewControllerImpl *)self->_viewController setSuggestionKey:v13];

    -[EKEventEditViewControllerImpl setEventCreationMethod:](self->_viewController, "setEventCreationMethod:", [v5 creationMethod]);
    v14 = [v5 addItemState];

    v15 = [v14 event];
    v16 = [v15 startDate];
    originalStartDate = self->_originalStartDate;
    self->_originalStartDate = v16;

    viewController = self->_viewController;
  }

  return viewController;
}

- (void)updateUIFromState:(id)a3
{
}

- (void)updateStateFromUI:(id)a3
{
  id v6 = a3;
  v4 = [(EKEventEditViewControllerImpl *)self->_viewController event];
  id v5 = [v4 startDate];
  LOBYTE(self) = [v5 isEqualToDate:self->_originalStartDate];

  if ((self & 1) == 0) {
    [v6 setExplicitTime:1];
  }
}

- (UIViewController)viewController
{
  return (UIViewController *)self->_viewController;
}

- (id)_eventEditorForTestingOnly
{
  return [(EKEventEditViewControllerImpl *)self->_viewController _eventEditorForTestingOnly];
}

- (void)setEditorBackgroundColor:(id)a3
{
}

- (BOOL)canDismiss
{
  return [(EKEventEditViewControllerImpl *)self->_viewController isModalInPresentation] ^ 1;
}

- (id)confirmDismissAlertController
{
  return [(EKEventEditViewControllerImpl *)self->_viewController confirmDismissAlertController];
}

- (void)presentationControllerDidAttemptToDismiss
{
}

- (BOOL)hasUnsavedChanges
{
  return [(EKEventEditViewControllerImpl *)self->_viewController hasUnsavedChanges];
}

- (BOOL)willPresentDialogOnSave
{
  return [(EKEventEditViewControllerImpl *)self->_viewController willPresentDialogOnSave];
}

- (void)completeAndSaveWithContinueBlock:(id)a3
{
}

- (void)setIgnoreUnsavedChanges:(BOOL)a3
{
}

- (BOOL)ignoreUnsavedChanges
{
  return [(EKEventEditViewControllerImpl *)self->_viewController ignoreUnsavedChanges];
}

- (void)cancelEditing
{
}

- (EKCalendar)calendarToMakeVisibleOnSave
{
  v2 = [(EKEventEditViewControllerImpl *)self->_viewController event];
  v3 = [v2 calendar];

  return (EKCalendar *)v3;
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addItemViewControllerManagerDelegate);
  [WeakRetained addItemViewControllerManager:self didCompleteWithAction:a4];
}

- (id)pasteboardManagerForEventEditViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addItemViewControllerManagerDelegate);
  v4 = [WeakRetained pasteboardManager];

  return v4;
}

- (id)calendarModel
{
  return self->_model;
}

- (void)attemptDisplayReviewPrompt
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addItemViewControllerManagerDelegate);
  [WeakRetained attemptDisplayReviewPrompt];
}

- (AddItemViewControllerManagerDelegate)addItemViewControllerManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addItemViewControllerManagerDelegate);

  return (AddItemViewControllerManagerDelegate *)WeakRetained;
}

- (void)setAddItemViewControllerManagerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_addItemViewControllerManagerDelegate);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_originalStartDate, 0);

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end