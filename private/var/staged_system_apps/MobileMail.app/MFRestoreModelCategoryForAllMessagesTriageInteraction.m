@interface MFRestoreModelCategoryForAllMessagesTriageInteraction
+ (id)interactionWithMessageRepository:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5;
- (BOOL)_requiresConfirmationPrompt;
- (EMMessageRepository)messageRepository;
- (id)title;
- (id)triageAction;
- (int64_t)_preferredAlertActionStyle;
- (void)_performContinuation:(id)a3 withAlertController:(id)a4;
- (void)setMessageRepository:(id)a3;
- (void)setTriageAction:(id)a3;
@end

@implementation MFRestoreModelCategoryForAllMessagesTriageInteraction

+ (id)interactionWithMessageRepository:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5
{
  id v8 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___MFRestoreModelCategoryForAllMessagesTriageInteraction;
  v9 = [super interactionWithMessageListItemSelection:0 undoManager:0 origin:a4 actor:a5 query:0];
  v10 = v9;
  if (v9) {
    [v9 setMessageRepository:v8];
  }

  return v10;
}

- (id)title
{
  return (id)_EFLocalizedStringFromTable();
}

- (id)triageAction
{
  triageAction = self->_triageAction;
  if (!triageAction)
  {
    id v4 = objc_alloc((Class)MSRestoreModelCategoryForAllMessagesTriageAction);
    v5 = [(MFRestoreModelCategoryForAllMessagesTriageInteraction *)self messageRepository];
    v6 = [v4 initWithMessageRepository:v5 origin:[self origin] actor:[self actor]];
    v7 = self->_triageAction;
    self->_triageAction = v6;

    triageAction = self->_triageAction;
  }

  return triageAction;
}

- (BOOL)_requiresConfirmationPrompt
{
  return 1;
}

- (int64_t)_preferredAlertActionStyle
{
  return 2;
}

- (void)_performContinuation:(id)a3 withAlertController:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = _EFLocalizedStringFromTable();
  [(MFTriageInteraction *)self _performContinuation:v8 withAlertController:v6 title:v7 shouldDismissPresentingViewController:1];
}

- (void)setTriageAction:(id)a3
{
}

- (EMMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (void)setMessageRepository:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageRepository, 0);

  objc_storeStrong((id *)&self->_triageAction, 0);
}

@end