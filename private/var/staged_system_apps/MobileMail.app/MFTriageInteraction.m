@interface MFTriageInteraction
+ (MFTriageInteraction)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6;
+ (MFTriageInteraction)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 query:(id)a7;
+ (MFTriageInteraction)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6;
+ (MFTriageInteraction)interactionWithQuery:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6;
- (BOOL)_requiresConfirmationPrompt;
- (BOOL)includeTitleInMenuAction;
- (BOOL)isDestructive;
- (BOOL)isPermitted;
- (BOOL)isSelectAll;
- (BOOL)isTriggeredFromMenuAction;
- (BOOL)needShrinkAnimationAfterCompletion;
- (BOOL)shouldAskForConfirmation;
- (BOOL)shouldDelayContextualActionHandlerCompletion;
- (BOOL)shouldOverrideFlagState;
- (BOOL)supportsSelectAll;
- (BOOL)titleIncludesAllMessages;
- (BOOL)titleIncludesCount;
- (EMQuery)query;
- (MFCardAction)cardAction;
- (MFTriageInteraction)init;
- (MFTriageInteraction)initWithQuery:(id)a3;
- (MFTriageInteractionDelegate)delegate;
- (MSMessageListItemSelection)messageListItemSelection;
- (MSTriageAction)triageAction;
- (MUIPresentationSource)presentationSource;
- (NSString)accessibilityIdentifer;
- (NSString)title;
- (NSString)updateReason;
- (NSUndoManager)undoManager;
- (UIAction)menuAction;
- (UIAlertAction)alertAction;
- (UIColor)color;
- (UIContextualAction)swipeAction;
- (UIImage)previewImage;
- (UIImage)swipeActionIcon;
- (id)_cardActionWithTitle:(id)a3 shortTitle:(id)a4 preparation:(id)a5 completion:(id)a6;
- (id)_fillIconImageName;
- (id)_icon;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)_tintColor;
- (id)alertActionWithCompletion:(id)a3;
- (id)cardActionWithCompletion:(id)a3;
- (id)cardActionWithPreparation:(id)a3 completion:(id)a4;
- (id)contextualActionHandlerCompletion;
- (id)menuActionWithCompletion:(id)a3;
- (id)menuActionWithPreparation:(id)a3 completion:(id)a4;
- (id)messageRepositoryForTriageAction:(id)a3;
- (id)previewActionItemForSwipe:(BOOL)a3;
- (id)swipeActionWithPreparation:(id)a3 completion:(id)a4;
- (int64_t)_preferredAlertActionStyle;
- (int64_t)actor;
- (int64_t)messageCount;
- (int64_t)origin;
- (void)_dispatchInteractionWithCompletion:(id)a3;
- (void)_performAsynchronousInteractionBoilerplateWithBlock:(id)a3 completion:(id)a4;
- (void)_performContinuation:(id)a3 withAlertController:(id)a4;
- (void)_performContinuation:(id)a3 withAlertController:(id)a4 title:(id)a5 shouldDismissPresentingViewController:(BOOL)a6;
- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4;
- (void)_performInteractionBoilerplateWithBlock:(id)a3 completion:(id)a4;
- (void)_performInteractionIfPermittedWithContinuation:(id)a3;
- (void)_presentConfirmationSheet:(id)a3;
- (void)performInteraction;
- (void)performInteractionWithCompletion:(id)a3;
- (void)setActor:(int64_t)a3;
- (void)setContextualActionHandlerCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIncludeTitleInMenuAction:(BOOL)a3;
- (void)setMessageListItemSelection:(id)a3;
- (void)setOrigin:(int64_t)a3;
- (void)setPresentationSource:(id)a3;
- (void)setQuery:(id)a3;
- (void)setShouldAskForConfirmation:(BOOL)a3;
- (void)setTitleIncludesAllMessages:(BOOL)a3;
- (void)setTitleIncludesCount:(BOOL)a3;
- (void)setTriageAction:(id)a3;
- (void)setTriggeredFromMenuAction:(BOOL)a3;
- (void)setUndoManager:(id)a3;
@end

@implementation MFTriageInteraction

+ (MFTriageInteraction)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 query:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v16 = v15;
  if (v13 && v15)
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"MFTriageInteraction.m", 35, @"Invalid parameter not satisfying: %@", @"!(query && selection)" object file lineNumber description];
  }
  id v17 = [objc_alloc((Class)a1) initWithQuery:v16];
  [v17 setMessageListItemSelection:v13];
  [v17 setUndoManager:v14];
  [v17 setOrigin:a5];
  [v17 setActor:a6];

  return (MFTriageInteraction *)v17;
}

+ (MFTriageInteraction)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  v6 = [a1 interactionWithMessageListItemSelection:a3 undoManager:a4 origin:a5 actor:a6 query:0];

  return (MFTriageInteraction *)v6;
}

+ (MFTriageInteraction)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  if (![v11 count])
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"MFTriageInteraction.m", 50, @"Invalid parameter not satisfying: %@", @"messageListItems.count" object file lineNumber description];
  }
  id v13 = [objc_alloc((Class)MSMessageListItemSelection) initWithMessageListItems:v11];
  id v14 = [a1 interactionWithMessageListItemSelection:v13 undoManager:v12 origin:a5 actor:a6];

  return (MFTriageInteraction *)v14;
}

+ (MFTriageInteraction)interactionWithQuery:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  v6 = [a1 interactionWithMessageListItemSelection:0 undoManager:a4 origin:a5 actor:a6 query:a3];

  return (MFTriageInteraction *)v6;
}

- (MFTriageInteraction)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFTriageInteraction;
  result = [(MFTriageInteraction *)&v3 init];
  if (result) {
    *(_WORD *)&result->_includeTitleInMenuAction = 257;
  }
  return result;
}

- (MFTriageInteraction)initWithQuery:(id)a3
{
  id v5 = a3;
  v6 = [(MFTriageInteraction *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_query, a3);
  }

  return v7;
}

- (void)performInteraction
{
}

- (void)_performInteractionBoilerplateWithBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001FA4D8;
    v9[3] = &unk_10060D658;
    id v10 = v6;
    v8 = objc_retainBlock(v9);
  }
  else
  {
    v8 = 0;
  }
  [(MFTriageInteraction *)self _performAsynchronousInteractionBoilerplateWithBlock:v8 completion:v7];
}

- (void)_performAsynchronousInteractionBoilerplateWithBlock:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *))a3;
  id v7 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001FA6F4;
  v13[3] = &unk_1006058A8;
  v13[4] = self;
  BOOL v14 = v6 != 0;
  v8 = objc_retainBlock(v13);
  v9 = (void (**)(void))v8;
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001FA784;
    v10[3] = &unk_10060D680;
    id v11 = v8;
    id v12 = v7;
    v10[4] = self;
    v6[2](v6, v10);
  }
  else if (v7)
  {
    (*((void (**)(id, MFTriageInteraction *, void))v7 + 2))(v7, self, 0);
  }
  if (![(MFTriageInteraction *)self shouldDelayContextualActionHandlerCompletion])v9[2](v9); {
}
  }

- (void)performInteractionWithCompletion:(id)a3
{
}

- (void)_dispatchInteractionWithCompletion:(id)a3
{
  id v7 = a3;
  v4 = [(MFTriageInteraction *)self triageAction];
  id v5 = [(MFTriageInteraction *)self undoManager];
  id v6 = [(MFTriageInteraction *)self undoTitle];
  [v4 performWithUndoManager:v5 actionName:v6 completion:v7];
}

- (BOOL)_requiresConfirmationPrompt
{
  return 0;
}

- (void)_performContinuation:(id)a3 withAlertController:(id)a4
{
}

- (void)_performContinuation:(id)a3 withAlertController:(id)a4 title:(id)a5 shouldDismissPresentingViewController:(BOOL)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void *))a4;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001FAAE4;
  v25[3] = &unk_1006084B0;
  id v12 = v10;
  id v26 = v12;
  id v13 = +[UIAlertController mf_actionSheetWithTitle:a5 cancellationHandler:v25];
  int64_t v14 = [(MFTriageInteraction *)self _preferredAlertActionStyle];
  id v15 = [(MFTriageInteraction *)self title];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_1001FAAF8;
  v21 = &unk_10060D6A8;
  id v16 = v12;
  BOOL v24 = a6;
  v22 = self;
  id v23 = v16;
  id v17 = +[UIAlertAction actionWithTitle:v15 style:v14 handler:&v18];
  [v13 addAction:v17, v18, v19, v20, v21];

  v11[2](v11, v13);
}

- (void)_performInteractionIfPermittedWithContinuation:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001FAC20;
  v3[3] = &unk_10060D6D0;
  v3[4] = self;
  [(MFTriageInteraction *)self _performContinuation:a3 withAlertController:v3];
}

- (void)_presentConfirmationSheet:(id)a3
{
  id v10 = a3;
  id v5 = [(MFTriageInteraction *)self presentationSource];

  if (!v5)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MFTriageInteraction.m" lineNumber:167 description:@"Presenting a triage interaction confirmation prompt requires a presentationSource."];
  }
  id v6 = [(MFTriageInteraction *)self delegate];
  id v7 = [v6 presentingViewControllerForTriageInteraction:self];

  v8 = [(MFTriageInteraction *)self presentationSource];
  [v10 mf_presentConfirmationSheetFromViewController:v7 withSource:v8];
}

- (NSString)title
{
}

- (NSString)accessibilityIdentifer
{
  return 0;
}

- (id)_iconImageName
{
  return 0;
}

- (id)_previewImageName
{
  return 0;
}

- (id)_tintColor
{
  return 0;
}

- (id)_icon
{
  v2 = [(MFTriageInteraction *)self _fillIconImageName];
  if (v2)
  {
    objc_super v3 = +[UIImage mf_systemImageNamed:v2 textStyle:UIFontTextStyleSubheadline scale:2 weight:7];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (UIImage)swipeActionIcon
{
  v2 = [(MFTriageInteraction *)self _fillIconImageName];
  if (v2)
  {
    objc_super v3 = +[UIImage systemImageNamed:v2];
  }
  else
  {
    objc_super v3 = 0;
  }

  return (UIImage *)v3;
}

- (UIImage)previewImage
{
  v2 = [(MFTriageInteraction *)self _previewImageName];
  if (v2)
  {
    objc_super v3 = +[UIImage systemImageNamed:v2];
  }
  else
  {
    objc_super v3 = 0;
  }

  return (UIImage *)v3;
}

- (id)_fillIconImageName
{
  v2 = [(MFTriageInteraction *)self _iconImageName];
  objc_super v3 = v2;
  if (v2 && [v2 rangeOfString:@".fill"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = +[NSString stringWithFormat:@"%@.fill", v3];

    objc_super v3 = (void *)v4;
  }

  return v3;
}

- (UIColor)color
{
  return (UIColor *)+[UIColor mailInteractiveColor];
}

- (BOOL)isPermitted
{
  return 1;
}

- (BOOL)supportsSelectAll
{
  return 0;
}

- (BOOL)isSelectAll
{
  if (![(MFTriageInteraction *)self supportsSelectAll]) {
    return 0;
  }
  objc_super v3 = [(MFTriageInteraction *)self messageListItemSelection];
  unsigned __int8 v4 = [v3 isSelectAll];

  return v4;
}

- (BOOL)needShrinkAnimationAfterCompletion
{
  return 0;
}

- (int64_t)messageCount
{
  v2 = [(MFTriageInteraction *)self messageListItemSelection];
  objc_super v3 = [v2 messageListItems];
  id v4 = [v3 em_messageListItemTotalCount];

  return (int64_t)v4;
}

- (NSString)updateReason
{
  return 0;
}

- (BOOL)shouldOverrideFlagState
{
  if ([(MFTriageInteraction *)self isSelectAll]) {
    return 1;
  }
  id v4 = [(MFTriageInteraction *)self messageListItemSelection];
  if ([v4 isActingOnSender])
  {
    BOOL v3 = 1;
  }
  else
  {
    id v5 = [(MFTriageInteraction *)self query];
    BOOL v3 = v5 != 0;
  }
  return v3;
}

- (int64_t)_preferredAlertActionStyle
{
  return 0;
}

- (id)alertActionWithCompletion:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MFTriageInteraction *)self _preferredAlertActionStyle];
  id v6 = [(MFTriageInteraction *)self alertTitle];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001FB27C;
  v10[3] = &unk_1006084D8;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  v8 = +[UIAlertAction actionWithTitle:v6 style:v5 handler:v10];

  return v8;
}

- (id)swipeActionWithPreparation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MFTriageInteraction *)self swipeTitle];
  v9 = [(MFTriageInteraction *)self swipeActionIcon];
  id v10 = [(MFTriageInteraction *)self _swipeColor];
  uint64_t v11 = [(MFTriageInteraction *)self isDestructive];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001FB4B4;
  v19[3] = &unk_10060D6F8;
  v19[4] = self;
  id v12 = v6;
  id v20 = v12;
  id v13 = v7;
  id v21 = v13;
  int64_t v14 = objc_retainBlock(v19);
  id v15 = +[UIContextualAction contextualActionWithStyle:v11 title:v8 handler:v14];
  id v16 = +[UIColor whiteColor];
  id v17 = [v9 imageWithTintColor:v16 renderingMode:1];
  [v15 setImage:v17];

  [v15 setBackgroundColor:v10];

  return v15;
}

- (id)menuActionWithCompletion:(id)a3
{
  BOOL v3 = [(MFTriageInteraction *)self menuActionWithPreparation:0 completion:a3];

  return v3;
}

- (id)menuActionWithPreparation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MFTriageInteraction *)self includeTitleInMenuAction])
  {
    v8 = [(MFTriageInteraction *)self previewTitle];
  }
  else
  {
    v8 = &stru_100619928;
  }
  v9 = [(MFTriageInteraction *)self previewImage];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001FB730;
  v14[3] = &unk_10060AE48;
  v14[4] = self;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  id v12 = +[UIAction actionWithTitle:v8 image:v9 identifier:0 handler:v14];

  if ([(MFTriageInteraction *)self isDestructive]) {
    [v12 setAttributes:2];
  }

  return v12;
}

- (UIAction)menuAction
{
  return (UIAction *)[(MFTriageInteraction *)self menuActionWithCompletion:0];
}

- (UIAlertAction)alertAction
{
  return (UIAlertAction *)[(MFTriageInteraction *)self alertActionWithCompletion:0];
}

- (UIContextualAction)swipeAction
{
  return (UIContextualAction *)[(MFTriageInteraction *)self swipeActionWithPreparation:0 completion:0];
}

- (id)previewActionItemForSwipe:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(MFTriageInteraction *)self _icon];
    int64_t v5 = [(MFTriageInteraction *)self color];
    id v6 = [(MFTriageInteraction *)self shortTitle];
  }
  else
  {
    id v6 = [(MFTriageInteraction *)self title];
    id v4 = 0;
    int64_t v5 = 0;
  }
  if ([(MFTriageInteraction *)self isDestructive]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001FB904;
  v10[3] = &unk_10060D720;
  v10[4] = self;
  v8 = +[UIPreviewAction _actionWithTitle:v6 style:v7 color:v5 image:v4 handler:v10];

  return v8;
}

- (MFCardAction)cardAction
{
  return (MFCardAction *)[(MFTriageInteraction *)self cardActionWithCompletion:0];
}

- (id)cardActionWithCompletion:(id)a3
{
  BOOL v3 = [(MFTriageInteraction *)self cardActionWithPreparation:0 completion:a3];

  return v3;
}

- (id)cardActionWithPreparation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MFTriageInteraction *)self cardTitle];
  v9 = [(MFTriageInteraction *)self cardShortTitle];
  id v10 = [(MFTriageInteraction *)self _cardActionWithTitle:v8 shortTitle:v9 preparation:v6 completion:v7];

  return v10;
}

- (id)_cardActionWithTitle:(id)a3 shortTitle:(id)a4 preparation:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int64_t v14 = [(MFTriageInteraction *)self _iconImageName];
  id v15 = [(MFTriageInteraction *)self _tintColor];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001FBC00;
  v21[3] = &unk_10060D770;
  id v16 = v13;
  v21[4] = self;
  id v22 = v16;
  id v17 = v12;
  id v23 = v17;
  v18 = +[MFCardAction cardActionWithTitle:v10 shortTitle:v11 imageName:v14 tintColor:v15 handler:v21];

  uint64_t v19 = [(MFTriageInteraction *)self accessibilityIdentifer];
  [v18 setAccessibilityIdentifer:v19];

  return v18;
}

- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001FBF40;
  v14[3] = &unk_10060CCE0;
  v14[4] = self;
  id v7 = a4;
  id v15 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001FC018;
  v11[3] = &unk_10060D798;
  v11[4] = self;
  v8 = objc_retainBlock(v14);
  id v12 = v8;
  id v9 = v6;
  id v13 = v9;
  id v10 = objc_retainBlock(v11);
  if ([(MFTriageInteraction *)self _requiresConfirmationPrompt]
    && [(MFTriageInteraction *)self shouldAskForConfirmation])
  {
    [(MFTriageInteraction *)self _performInteractionIfPermittedWithContinuation:v10];
  }
  else
  {
    ((void (*)(void *, uint64_t))v10[2])(v10, 1);
  }
}

- (id)messageRepositoryForTriageAction:(id)a3
{
  id v4 = [(MFTriageInteraction *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v5 = [v4 messageRepositoryForTriageInteraction:self];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (MFTriageInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFTriageInteractionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldAskForConfirmation
{
  return self->_shouldAskForConfirmation;
}

- (void)setShouldAskForConfirmation:(BOOL)a3
{
  self->_shouldAskForConfirmation = a3;
}

- (MUIPresentationSource)presentationSource
{
  return self->_presentationSource;
}

- (void)setPresentationSource:(id)a3
{
}

- (BOOL)includeTitleInMenuAction
{
  return self->_includeTitleInMenuAction;
}

- (void)setIncludeTitleInMenuAction:(BOOL)a3
{
  self->_includeTitleInMenuAction = a3;
}

- (BOOL)titleIncludesCount
{
  return self->_titleIncludesCount;
}

- (void)setTitleIncludesCount:(BOOL)a3
{
  self->_titleIncludesCount = a3;
}

- (BOOL)titleIncludesAllMessages
{
  return self->_titleIncludesAllMessages;
}

- (void)setTitleIncludesAllMessages:(BOOL)a3
{
  self->_titleIncludesAllMessages = a3;
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (int64_t)actor
{
  return self->_actor;
}

- (void)setActor:(int64_t)a3
{
  self->_actor = a3;
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (BOOL)isTriggeredFromMenuAction
{
  return self->_triggeredFromMenuAction;
}

- (void)setTriggeredFromMenuAction:(BOOL)a3
{
  self->_triggeredFromMenuAction = a3;
}

- (MSMessageListItemSelection)messageListItemSelection
{
  return self->_messageListItemSelection;
}

- (void)setMessageListItemSelection:(id)a3
{
}

- (EMQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void)setUndoManager:(id)a3
{
}

- (MSTriageAction)triageAction
{
  return self->_triageAction;
}

- (void)setTriageAction:(id)a3
{
}

- (id)contextualActionHandlerCompletion
{
  return self->_contextualActionHandlerCompletion;
}

- (void)setContextualActionHandlerCompletion:(id)a3
{
}

- (BOOL)shouldDelayContextualActionHandlerCompletion
{
  return self->_shouldDelayContextualActionHandlerCompletion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contextualActionHandlerCompletion, 0);
  objc_storeStrong((id *)&self->_triageAction, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_messageListItemSelection, 0);
  objc_storeStrong((id *)&self->_presentationSource, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end