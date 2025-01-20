@interface MFReadLaterTriageInteraction
+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6;
+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 state:(id)a7;
+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6;
+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 state:(id)a7;
- (BOOL)_hasReadLater;
- (BOOL)hasReadLater;
- (BOOL)isPresentCustom;
- (BOOL)isRemoveReadLater;
- (MFReadLaterTriageInteraction)init;
- (NSDate)selectedDate;
- (UIMenu)menu;
- (_TtC10MobileMail33MFReadLaterTriageInteractionState)state;
- (id)_alertControllerWithCompletion:(id)a3;
- (id)_iconImageName;
- (id)_initialReadLaterDate;
- (id)_menuWithPreparation:(id)a3 completion:(id)a4;
- (id)accessibilityIdentifer;
- (id)color;
- (id)datePickerCompletion;
- (id)datePickerPreparation;
- (id)localizedStringForAction:(int64_t)a3;
- (id)menuWithCompletion:(id)a3;
- (id)shortTitle;
- (id)swipeActionWithPreparation:(id)a3 completion:(id)a4;
- (id)title;
- (id)triageAction;
- (int64_t)datePickerPresentationStyle;
- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4;
- (void)_performReadLaterAction:(int64_t)a3 preparation:(id)a4 completion:(id)a5;
- (void)_presentCustomDatePickerWithPreparation:(id)a3 completion:(id)a4;
- (void)datePickerViewController:(id)a3 didSelectDate:(id)a4;
- (void)datePickerViewControllerDidDeleteDate:(id)a3;
- (void)setDatePickerCompletion:(id)a3;
- (void)setDatePickerPreparation:(id)a3;
- (void)setDatePickerPresentationStyle:(int64_t)a3;
- (void)setState:(id)a3;
- (void)setTriageAction:(id)a3;
@end

@implementation MFReadLaterTriageInteraction

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = +[MFReadLaterTriageInteractionState stateWithMessageListItems:v9];
  v12 = +[MFReadLaterTriageInteraction interactionWithMessageListItems:v9 undoManager:v10 origin:a5 actor:a6 state:v11];

  return v12;
}

+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  if ([v11 isSelectAll])
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:a1 file:@"MFReadLaterTriageInteraction.m" lineNumber:38 description:@"Select all is not supported"];
  }
  v13 = [v11 messageListItems];
  v14 = +[MFReadLaterTriageInteractionState stateWithMessageListItems:v13];

  v15 = +[MFReadLaterTriageInteraction interactionWithMessageListItemSelection:v11 undoManager:v12 origin:a5 actor:a6 state:v14];

  return v15;
}

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 state:(id)a7
{
  id v12 = a7;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___MFReadLaterTriageInteraction;
  v13 = [super interactionWithMessageListItems:a3 undoManager:a4 origin:a5 actor:a6];
  [v13 setState:v12];

  return v13;
}

+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 state:(id)a7
{
  id v12 = a7;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___MFReadLaterTriageInteraction;
  v13 = [super interactionWithMessageListItemSelection:a3 undoManager:a4 origin:a5 actor:a6];
  [v13 setState:v12];

  return v13;
}

- (MFReadLaterTriageInteraction)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFReadLaterTriageInteraction;
  result = [(MFTriageInteraction *)&v3 init];
  if (result) {
    result->_datePickerPresentationStyle = 7;
  }
  return result;
}

- (id)_alertControllerWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _EFLocalizedString();
  v6 = +[UIAlertController alertControllerWithTitle:v5 message:0 preferredStyle:0];

  [v6 setModalPresentationStyle:7];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001D8428;
  v12[3] = &unk_10060CBF8;
  id v7 = v6;
  id v13 = v7;
  v14 = self;
  id v8 = v4;
  id v15 = v8;
  id v9 = objc_retainBlock(v12);
  if (+[EMInternalPreferences preferenceEnabled:19])((void (*)(void *, void, void))v9[2])(v9, 0, 0); {
  ((void (*)(void *, uint64_t, void))v9[2])(v9, 1, 0);
  }
  if ((+[MSSendLaterContext contextForCurrentDate] & 4) != 0)((void (*)(void *, uint64_t, void))v9[2])(v9, 2, 0); {
  ((void (*)(void *, uint64_t, void))v9[2])(v9, 3, 0);
  }
  ((void (*)(void *, uint64_t, void))v9[2])(v9, 4, 0);
  ((void (*)(void *, uint64_t, uint64_t))v9[2])(v9, 5, 1);
  id v10 = v7;

  return v10;
}

- (UIMenu)menu
{
  return (UIMenu *)[(MFReadLaterTriageInteraction *)self _menuWithPreparation:0 completion:0];
}

- (id)menuWithCompletion:(id)a3
{
  objc_super v3 = [(MFReadLaterTriageInteraction *)self _menuWithPreparation:0 completion:a3];

  return v3;
}

- (id)_menuWithPreparation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001D8828;
  v20[3] = &unk_10060CC48;
  v20[4] = self;
  id v8 = v6;
  id v21 = v8;
  id v9 = v7;
  id v22 = v9;
  id v10 = objc_retainBlock(v20);
  id v11 = objc_alloc_init((Class)NSMutableArray);
  if (+[EMInternalPreferences preferenceEnabled:19])
  {
    id v12 = ((void (*)(void *, void))v10[2])(v10, 0);
    [v11 addObject:v12];
  }
  id v13 = ((void (*)(void *, uint64_t))v10[2])(v10, 1);
  [v11 addObject:v13];

  if ((+[MSSendLaterContext contextForCurrentDate] & 4) != 0)
  {
    v14 = ((void (*)(void *, uint64_t))v10[2])(v10, 2);
    [v11 addObject:v14];
  }
  id v15 = ((void (*)(void *, uint64_t))v10[2])(v10, 3);
  [v11 addObject:v15];

  v16 = ((void (*)(void *, uint64_t))v10[2])(v10, 4);
  [v11 addObject:v16];

  v17 = _EFLocalizedString();
  v18 = +[UIMenu menuWithTitle:v17 image:0 identifier:0 options:0 children:v11];

  return v18;
}

- (void)_performReadLaterAction:(int64_t)a3 preparation:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MFReadLaterTriageInteraction *)self state];
  [v10 perform:a3];
  if ([v10 shouldPresentCustomDatePicker])
  {
    [(MFReadLaterTriageInteraction *)self _presentCustomDatePickerWithPreparation:0 completion:v9];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MFReadLaterTriageInteraction;
    [(MFTriageInteraction *)&v11 _performInteractionAfterPreparation:v8 completion:v9];
  }
}

- (id)swipeActionWithPreparation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  unsigned int v8 = [(MFReadLaterTriageInteraction *)self isDestructive];
  id v9 = [(MFReadLaterTriageInteraction *)self shortTitle];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001D8D10;
  v19[3] = &unk_10060CC70;
  objc_copyWeak(&v22, &location);
  id v10 = v6;
  id v20 = v10;
  id v11 = v7;
  id v21 = v11;
  v19[4] = self;
  id v12 = +[UIContextualAction contextualActionWithStyle:v8 title:v9 handler:v19];

  id v13 = [(MFReadLaterTriageInteraction *)self color];
  [v12 setBackgroundColor:v13];

  v14 = [(MFTriageInteraction *)self swipeActionIcon];
  [v12 setImage:v14];

  id v15 = [(MFReadLaterTriageInteraction *)self state];
  unsigned int v16 = [v15 isInitialState];

  if (v16)
  {
    v17 = [(MFReadLaterTriageInteraction *)self _menuWithPreparation:v10 completion:v11];
    [v12 _setMenu:v17];
  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v12;
}

- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001D8EF8;
  v10[3] = &unk_10060CC98;
  v10[4] = self;
  id v7 = a4;
  id v11 = v7;
  id v8 = v6;
  id v12 = v8;
  id v9 = +[EFScheduler mainThreadScheduler];
  [v9 performBlock:v10];
}

- (id)triageAction
{
  triageAction = self->_triageAction;
  if (!triageAction)
  {
    id v4 = objc_alloc((Class)MSReadLaterTriageAction);
    v5 = [(MFTriageInteraction *)self messageListItemSelection];
    int64_t v6 = [(MFTriageInteraction *)self origin];
    int64_t v7 = [(MFTriageInteraction *)self actor];
    id v8 = [(MFReadLaterTriageInteraction *)self state];
    id v9 = [v8 date];
    id v10 = [v9 ec_integerDate];
    id v11 = (MSTriageAction *)[v4 initWithMessageListSelection:v5 origin:v6 actor:v7 delegate:self readLaterDate:v10];
    id v12 = self->_triageAction;
    self->_triageAction = v11;

    triageAction = self->_triageAction;
  }

  return triageAction;
}

- (id)localizedStringForAction:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = _EFLocalizedString();
  }
  return v4;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerRemindMe;
}

- (id)shortTitle
{
  [(MFReadLaterTriageInteraction *)self isRemoveReadLater];
  v2 = _EFLocalizedString();

  return v2;
}

- (id)title
{
  [(MFReadLaterTriageInteraction *)self _hasReadLater];
  v2 = _EFLocalizedString();

  return v2;
}

- (id)color
{
  if ([(MFReadLaterTriageInteraction *)self isRemoveReadLater]) {
    +[UIColor mailRemoveReminderColor];
  }
  else {
  v2 = +[UIColor mailReadLaterActionColor];
  }

  return v2;
}

- (id)_iconImageName
{
  if ([(MFReadLaterTriageInteraction *)self isRemoveReadLater])
  {
    uint64_t v3 = (void **)&MFImageGlyphRemoveReadLater;
  }
  else
  {
    unsigned int v4 = [(MFReadLaterTriageInteraction *)self _hasReadLater];
    uint64_t v3 = (void **)&MFImageGlyphUpdateReadLater;
    if (!v4) {
      uint64_t v3 = (void **)&MFImageGlyphReadLater;
    }
  }
  v5 = *v3;

  return v5;
}

- (BOOL)hasReadLater
{
  v2 = [(MFReadLaterTriageInteraction *)self state];
  unsigned __int8 v3 = [v2 hasReadLater];

  return v3;
}

- (BOOL)isRemoveReadLater
{
  v2 = [(MFReadLaterTriageInteraction *)self state];
  unsigned __int8 v3 = [v2 isRemoveDate];

  return v3;
}

- (BOOL)_hasReadLater
{
  v2 = [(MFTriageInteraction *)self messageListItemSelection];
  unsigned __int8 v3 = [v2 messageListItems];
  unsigned __int8 v4 = [v3 ef_any:&stru_10060CCB8];

  return v4;
}

- (id)_initialReadLaterDate
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(MFTriageInteraction *)self messageListItemSelection];
  unsigned __int8 v3 = [v2 messageListItems];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v11 != v5) {
        objc_enumerationMutation(v3);
      }
      int64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * v6) readLater];
      id v8 = [v7 date];

      if (v8) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v8 = 0;
  }

  return v8;
}

- (BOOL)isPresentCustom
{
  v2 = [(MFReadLaterTriageInteraction *)self state];
  unsigned __int8 v3 = [v2 shouldPresentCustomDatePicker];

  return v3;
}

- (void)_presentCustomDatePickerWithPreparation:(id)a3 completion:(id)a4
{
  id v6 = a4;
  [(MFReadLaterTriageInteraction *)self setDatePickerPreparation:a3];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  id v20 = sub_1001D98C4;
  id v21 = &unk_10060CCE0;
  int64_t v7 = self;
  id v22 = v7;
  id v8 = v6;
  id v23 = v8;
  [(MFReadLaterTriageInteraction *)v7 setDatePickerCompletion:&v18];
  id v9 = objc_alloc((Class)MFDatePickerViewController);
  BOOL v10 = [(MFReadLaterTriageInteraction *)v7 _hasReadLater];
  long long v11 = [(MFReadLaterTriageInteraction *)v7 _initialReadLaterDate];
  id v12 = [v9 initWithType:1 shouldShowDeleteButton:v10 initialDate:v11];

  [v12 setDelegate:v7];
  id v13 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v12];
  [v13 setModalPresentationStyle:[self datePickerPresentationStyle]];
  v14 = [(MFTriageInteraction *)v7 presentationSource];
  id v15 = [v13 popoverPresentationController];
  [v14 mui_setAsSourceForPopoverPresentationController:v15];

  unsigned int v16 = [(MFTriageInteraction *)v7 delegate];
  v17 = [v16 presentingViewControllerForTriageInteraction:v7];

  [v17 presentViewController:v13 animated:1 completion:0];
}

- (NSDate)selectedDate
{
  v2 = [(MFReadLaterTriageInteraction *)self state];
  unsigned __int8 v3 = [v2 date];

  return (NSDate *)v3;
}

- (void)datePickerViewController:(id)a3 didSelectDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MFReadLaterTriageInteraction *)self state];
  [v8 didSelectCustomDate:v7];

  [v6 dismissViewControllerAnimated:1 completion:0];
  id v9 = [(MFReadLaterTriageInteraction *)self datePickerCompletion];
  BOOL v10 = [(MFReadLaterTriageInteraction *)self datePickerPreparation];
  v11.receiver = self;
  v11.super_class = (Class)MFReadLaterTriageInteraction;
  [(MFTriageInteraction *)&v11 _performInteractionAfterPreparation:v10 completion:v9];

  [(MFReadLaterTriageInteraction *)self setDatePickerCompletion:0];
}

- (void)datePickerViewControllerDidDeleteDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFReadLaterTriageInteraction *)self state];
  [v5 removeDate];

  [v4 dismissViewControllerAnimated:1 completion:0];
  id v6 = [(MFReadLaterTriageInteraction *)self datePickerCompletion];
  id v7 = [(MFReadLaterTriageInteraction *)self datePickerPreparation];
  v8.receiver = self;
  v8.super_class = (Class)MFReadLaterTriageInteraction;
  [(MFTriageInteraction *)&v8 _performInteractionAfterPreparation:v7 completion:v6];

  [(MFReadLaterTriageInteraction *)self setDatePickerCompletion:0];
  [(MFReadLaterTriageInteraction *)self setDatePickerPreparation:0];
}

- (void)setTriageAction:(id)a3
{
}

- (_TtC10MobileMail33MFReadLaterTriageInteractionState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (int64_t)datePickerPresentationStyle
{
  return self->_datePickerPresentationStyle;
}

- (void)setDatePickerPresentationStyle:(int64_t)a3
{
  self->_datePickerPresentationStyle = a3;
}

- (id)datePickerPreparation
{
  return self->_datePickerPreparation;
}

- (void)setDatePickerPreparation:(id)a3
{
}

- (id)datePickerCompletion
{
  return self->_datePickerCompletion;
}

- (void)setDatePickerCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_datePickerCompletion, 0);
  objc_storeStrong(&self->_datePickerPreparation, 0);
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_triageAction, 0);
}

@end