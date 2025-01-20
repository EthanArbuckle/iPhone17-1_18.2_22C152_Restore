@interface MessageTriageInteractionHelper
+ (id)log;
- (BOOL)flagStateForFlagChangeTriageInteraction:(id)a3;
- (BOOL)flagStateForTriageAction:(int64_t)a3 messageListItems:(id)a4 isSelectAll:(BOOL)a5 supportsSelectAll:(BOOL)a6;
- (ComposeCapable)scene;
- (EFCancelable)unflaggedCountObserver;
- (EMMessage)primaryMessage;
- (EMMessageListItem)messageListItem;
- (EMMessageRepository)messageRepository;
- (EMQuery)unflaggedCountQuery;
- (MFTriageInteractionDelegate)delegate;
- (MFTriageInteractionTarget)target;
- (MessageTriageInteractionHelper)initWithDataSource:(id)a3 triageInteractionDelegate:(id)a4 scene:(id)a5;
- (MessageTriageInteractionHelper)initWithDataSource:(id)a3 triageInteractionDelegate:(id)a4 scene:(id)a5 presentingViewController:(id)a6;
- (MessageTriageInteractionHelperDataSource)dataSource;
- (NSArray)allMessagesInConversation;
- (NSArray)mailboxes;
- (NSArray)observedMailboxes;
- (NSArray)targetedMessages;
- (UIViewController)presentingViewController;
- (id)_queryForObservedMailboxesWithPredicate:(id)a3 label:(id)a4;
- (id)archiveOrDeleteTriageInteractionWithPresentationSource:(id)a3 target:(id)a4 origin:(int64_t)a5;
- (id)messageRepositoryForTriageInteraction:(id)a3;
- (id)presentingViewControllerForTriageInteraction:(id)a3;
- (id)triageInteractionForTriageAction:(int64_t)a3 withMessageListItems:(id)a4 presentationSource:(id)a5 presentingViewController:(id)a6 moveInteractionDelegate:(id)a7 filterInteractionDelegate:(id)a8 forPreview:(BOOL)a9 origin:(int64_t)a10;
- (id)triageInteractionForTriageAction:(int64_t)a3 withMessageListItems:(id)a4 presentationSource:(id)a5 presentingViewController:(id)a6 moveInteractionDelegate:(id)a7 forPreview:(BOOL)a8 origin:(int64_t)a9;
- (id)undoManager;
- (int64_t)targetPreference;
- (int64_t)unflaggedCount;
- (int64_t)unreadBadgetCount;
- (void)_startObservingMailboxes;
- (void)didLongPressTrashButtonWithPresentationSource:(id)a3 presentFromViewController:(id)a4 target:(id)a5 completion:(id)a6;
- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMessageRepository:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setScene:(id)a3;
- (void)setTarget:(id)a3;
- (void)setUnflaggedCount:(int64_t)a3;
- (void)setUnflaggedCountObserver:(id)a3;
- (void)setUnflaggedCountQuery:(id)a3;
- (void)setUnreadBadgetCount:(int64_t)a3;
- (void)startObservingMailboxes:(id)a3;
@end

@implementation MessageTriageInteractionHelper

- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5
{
  id v9 = a4;
  v7 = [(MessageTriageInteractionHelper *)self unflaggedCountQuery];
  unsigned int v8 = [v7 isEqual:v9];

  if (v8) {
    [(MessageTriageInteractionHelper *)self setUnflaggedCount:a5];
  }
}

- (id)_queryForObservedMailboxesWithPredicate:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(MessageTriageInteractionHelper *)self observedMailboxes];
  id v9 = +[EMMessageListItemPredicates predicateForMessagesInMailboxes:v8];

  v14[0] = v9;
  v14[1] = v6;
  v10 = +[NSArray arrayWithObjects:v14 count:2];
  v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];

  id v12 = [objc_alloc((Class)EMQuery) initWithTargetClass:objc_opt_class() predicate:v11 sortDescriptors:&__NSArray0__struct queryOptions:0 label:v7];

  return v12;
}

- (void)startObservingMailboxes:(id)a3
{
  id v8 = a3;
  v4 = [(MessageTriageInteractionHelper *)self mailboxes];
  unsigned __int8 v5 = [v4 isEqualToArray:v8];

  if ((v5 & 1) == 0)
  {
    id v6 = (NSArray *)[v8 copy];
    observedMailboxes = self->_observedMailboxes;
    self->_observedMailboxes = v6;

    [(MessageTriageInteractionHelper *)self _startObservingMailboxes];
  }
}

- (NSArray)mailboxes
{
  v2 = [(MessageTriageInteractionHelper *)self target];
  v3 = [v2 messageListItem];
  v4 = [v3 mailboxes];

  return (NSArray *)v4;
}

- (MFTriageInteractionTarget)target
{
  return self->_target;
}

- (void)_startObservingMailboxes
{
  id v9 = [(MessageTriageInteractionHelper *)self observedMailboxes];
  id v3 = [v9 count];

  if (v3)
  {
    v4 = [(MessageTriageInteractionHelper *)self unflaggedCountObserver];

    if (v4)
    {
      id v10 = [(MessageTriageInteractionHelper *)self unflaggedCountObserver];
      [v10 cancel];

      [(MessageTriageInteractionHelper *)self setUnflaggedCountObserver:0];
    }
    id v11 = +[EMMessageListItemPredicates predicateForUnflaggedMessages];
    -[MessageTriageInteractionHelper _queryForObservedMailboxesWithPredicate:label:](self, "_queryForObservedMailboxesWithPredicate:label:");
    unsigned __int8 v5 = (EMQuery *)objc_claimAutoreleasedReturnValue();
    unflaggedCountQuery = self->_unflaggedCountQuery;
    self->_unflaggedCountQuery = v5;

    id v12 = [(MessageTriageInteractionHelper *)self messageRepository];
    id v7 = [v12 startCountingQuery:self->_unflaggedCountQuery includingServerCountsForMailboxScope:0 withObserver:self];
    unflaggedCountObserver = self->_unflaggedCountObserver;
    self->_unflaggedCountObserver = v7;
  }
}

- (NSArray)observedMailboxes
{
  return self->_observedMailboxes;
}

- (MessageTriageInteractionHelper)initWithDataSource:(id)a3 triageInteractionDelegate:(id)a4 scene:(id)a5 presentingViewController:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MessageTriageInteractionHelper;
  v14 = [(MessageTriageInteractionHelper *)&v20 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_dataSource, v10);
    objc_storeWeak((id *)&v15->_delegate, v11);
    objc_storeWeak((id *)&v15->_scene, v12);
    objc_storeStrong((id *)&v15->_presentingViewController, a6);
    v16 = [v12 daemonInterface];
    uint64_t v17 = [v16 messageRepository];
    messageRepository = v15->_messageRepository;
    v15->_messageRepository = (EMMessageRepository *)v17;
  }
  return v15;
}

- (EMQuery)unflaggedCountQuery
{
  return self->_unflaggedCountQuery;
}

- (EFCancelable)unflaggedCountObserver
{
  return self->_unflaggedCountObserver;
}

- (void)setUnflaggedCount:(int64_t)a3
{
  self->_unflaggedCount = a3;
}

- (EMMessageRepository)messageRepository
{
  return self->_messageRepository;
}

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016CFF0;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699958 != -1) {
    dispatch_once(&qword_100699958, block);
  }
  v2 = (void *)qword_100699950;

  return v2;
}

- (MessageTriageInteractionHelper)initWithDataSource:(id)a3 triageInteractionDelegate:(id)a4 scene:(id)a5
{
  return [(MessageTriageInteractionHelper *)self initWithDataSource:a3 triageInteractionDelegate:a4 scene:a5 presentingViewController:0];
}

- (EMMessage)primaryMessage
{
  v2 = [(MessageTriageInteractionHelper *)self target];
  id v3 = [v2 primaryMessage];

  return (EMMessage *)v3;
}

- (EMMessageListItem)messageListItem
{
  v2 = [(MessageTriageInteractionHelper *)self target];
  id v3 = [v2 messageListItem];

  return (EMMessageListItem *)v3;
}

- (NSArray)targetedMessages
{
  if ((id)[(MessageTriageInteractionHelper *)self targetPreference] == (id)1)
  {
    id v3 = [(MessageTriageInteractionHelper *)self messageListItem];
    id v11 = v3;
    uint64_t v4 = +[NSArray arrayWithObjects:&v11 count:1];
LABEL_5:
    id v6 = (void *)v4;
    goto LABEL_6;
  }
  uint64_t v5 = [(MessageTriageInteractionHelper *)self primaryMessage];
  id v3 = (void *)v5;
  if (v5)
  {
    uint64_t v10 = v5;
    uint64_t v4 = +[NSArray arrayWithObjects:&v10 count:1];
    goto LABEL_5;
  }
  id v8 = [(MessageTriageInteractionHelper *)self messageListItem];
  id v9 = v8;
  id v6 = +[NSArray arrayWithObjects:&v9 count:1];

LABEL_6:

  return (NSArray *)v6;
}

- (NSArray)allMessagesInConversation
{
  if ([(MessageTriageInteractionHelper *)self targetPreference])
  {
    id v3 = [(MessageTriageInteractionHelper *)self messageListItem];
    id v6 = v3;
    uint64_t v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    uint64_t v4 = [(MessageTriageInteractionHelper *)self targetedMessages];
  }

  return (NSArray *)v4;
}

- (int64_t)targetPreference
{
  v2 = [(MessageTriageInteractionHelper *)self target];
  id v3 = [v2 targetPreference];

  return (int64_t)v3;
}

- (id)undoManager
{
  v2 = [(MessageTriageInteractionHelper *)self scene];
  id v3 = [v2 undoManager];

  return v3;
}

- (void)didLongPressTrashButtonWithPresentationSource:(id)a3 presentFromViewController:(id)a4 target:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(MessageTriageInteractionHelper *)self setTarget:a5];
  id v13 = [(MessageTriageInteractionHelper *)self primaryMessage];
  if (v13)
  {
    id v45 = v11;
    id v46 = v10;
    v48 = v12;
    v44 = v13;
    v43 = [(MessageTriageInteractionHelper *)self messageListItem];
    id v14 = [v43 count];
    v15 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
    v16 = +[NSBundle mainBundle];
    uint64_t v17 = [v16 localizedStringForKey:@"ARCHIVE_EMAIL" value:&stru_100619928 table:@"Main"];
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_10016DBDC;
    v61[3] = &unk_10060A780;
    v61[4] = self;
    id v18 = v13;
    id v62 = v18;
    id v19 = v10;
    id v63 = v19;
    id v20 = v11;
    id v64 = v20;
    id v21 = v48;
    id v65 = v21;
    v49 = +[UIAlertAction actionWithTitle:v17 style:0 handler:v61];

    v22 = [(MessageTriageInteractionHelper *)self mailboxes];
    LODWORD(v16) = +[EMMailbox deleteMovesToTrashForMailboxes:v22];

    v23 = +[NSBundle mainBundle];
    if (v16) {
      [v23 localizedStringForKey:@"TRASH_EMAIL" value:&stru_100619928 table:@"Main"];
    }
    else {
    v47 = [v23 localizedStringForKey:@"DELETE_EMAIL" value:&stru_100619928 table:@"Main"];
    }

    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10016DCC0;
    v56[3] = &unk_10060A780;
    v56[4] = self;
    id v24 = v18;
    id v57 = v24;
    id v25 = v19;
    id v58 = v25;
    id v26 = v20;
    id v59 = v26;
    id v27 = v21;
    id v60 = v27;
    v28 = +[UIAlertAction actionWithTitle:v47 style:2 handler:v56];
    if ([v24 shouldArchiveByDefault])
    {
      [v15 addAction:v49];
      v29 = v28;
      if ((unint64_t)v14 >= 2)
      {
        v30 = [(MessageTriageInteractionHelper *)self allMessagesInConversation];
        v31 = [(MessageTriageInteractionHelper *)self triageInteractionForTriageAction:9 withMessageListItems:v30 presentationSource:v25 presentingViewController:v26 moveInteractionDelegate:0 forPreview:0 origin:3];

        v32 = [v31 title];
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_10016DDA4;
        v53[3] = &unk_1006084D8;
        id v33 = v31;
        id v54 = v33;
        id v55 = v27;
        v34 = +[UIAlertAction actionWithTitle:v32 style:0 handler:v53];
        [v15 addAction:v34];
        v35 = &v54;
        v36 = &v55;
        v29 = v28;
LABEL_10:
      }
    }
    else
    {
      [v15 addAction:v28];
      v29 = v49;
      if ((unint64_t)v14 >= 2)
      {
        v37 = [(MessageTriageInteractionHelper *)self allMessagesInConversation];
        v38 = [(MessageTriageInteractionHelper *)self triageInteractionForTriageAction:8 withMessageListItems:v37 presentationSource:v25 presentingViewController:v26 moveInteractionDelegate:0 forPreview:0 origin:3];

        v32 = [v38 title];
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_10016DDB0;
        v50[3] = &unk_1006084D8;
        id v33 = v38;
        id v51 = v33;
        id v52 = v27;
        v34 = +[UIAlertAction actionWithTitle:v32 style:2 handler:v50];
        [v15 addAction:v34];
        v35 = &v51;
        v36 = &v52;
        v29 = v49;
        goto LABEL_10;
      }
    }
    [v15 addAction:v29];
    v39 = +[NSBundle mainBundle];
    v40 = [v39 localizedStringForKey:@"CANCEL" value:&stru_100619928 table:@"Main"];
    v41 = +[UIAlertAction actionWithTitle:v40 style:1 handler:0];
    [v15 addAction:v41];

    v42 = [v15 popoverPresentationController];
    [v25 mui_setAsSourceForPopoverPresentationController:v42];

    [v26 presentViewController:v15 animated:1 completion:0];
    id v11 = v45;
    id v10 = v46;
    id v12 = v48;
    id v13 = v44;
  }
}

- (id)archiveOrDeleteTriageInteractionWithPresentationSource:(id)a3 target:(id)a4 origin:(int64_t)a5
{
  id v8 = a3;
  [(MessageTriageInteractionHelper *)self setTarget:a4];
  id v9 = [(MessageTriageInteractionHelper *)self primaryMessage];
  id v10 = v9;
  if (v9)
  {
    unsigned int v11 = [v9 shouldArchiveByDefault];
    id v12 = [(MessageTriageInteractionHelper *)self undoManager];
    id v13 = [(MessageTriageInteractionHelper *)self delegate];
    if (v11)
    {
      id v19 = v10;
      id v14 = +[NSArray arrayWithObjects:&v19 count:1];
      uint64_t v15 = +[MFDestructiveTriageInteraction interactionWithMessageListItems:v14 undoManager:v12 origin:a5 actor:2];
    }
    else
    {
      id v18 = v10;
      id v14 = +[NSArray arrayWithObjects:&v18 count:1];
      uint64_t v15 = +[MFDestructiveTriageInteraction interactionWithMessageListItems:v14 undoManager:v12 origin:a5 actor:2];
    }
    v16 = (void *)v15;

    [v16 setDelegate:v13];
    [v16 setPresentationSource:v8];
    [v16 setType:0];
    [v16 setShouldAskForConfirmation:1];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)triageInteractionForTriageAction:(int64_t)a3 withMessageListItems:(id)a4 presentationSource:(id)a5 presentingViewController:(id)a6 moveInteractionDelegate:(id)a7 forPreview:(BOOL)a8 origin:(int64_t)a9
{
  LOBYTE(v11) = a8;
  id v9 = [(MessageTriageInteractionHelper *)self triageInteractionForTriageAction:a3 withMessageListItems:a4 presentationSource:a5 presentingViewController:a6 moveInteractionDelegate:a7 filterInteractionDelegate:0 forPreview:v11 origin:a9];

  return v9;
}

- (id)triageInteractionForTriageAction:(int64_t)a3 withMessageListItems:(id)a4 presentationSource:(id)a5 presentingViewController:(id)a6 moveInteractionDelegate:(id)a7 filterInteractionDelegate:(id)a8 forPreview:(BOOL)a9 origin:(int64_t)a10
{
  id v16 = a4;
  id v17 = a5;
  id v43 = a6;
  id v44 = a7;
  id v42 = a8;
  v47 = v16;
  id v18 = [v16 firstObject];
  if (a3 == 16)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v19 = v47;
    id v20 = [v19 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v56;
      a3 = 8;
LABEL_4:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v56 != v21) {
          objc_enumerationMutation(v19);
        }
        if ([*(id *)(*((void *)&v55 + 1) + 8 * v22) shouldArchiveByDefault]) {
          break;
        }
        if (v20 == (id)++v22)
        {
          id v20 = [v19 countByEnumeratingWithState:&v55 objects:v59 count:16];
          if (v20) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      a3 = 9;
    }
  }
  v41 = [(MessageTriageInteractionHelper *)self scene];
  v40 = [(MessageTriageInteractionHelper *)self dataSource];
  id v45 = [(MessageTriageInteractionHelper *)self delegate];
  id v46 = [(MessageTriageInteractionHelper *)self undoManager];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10016E800;
  v48[3] = &unk_10060A7A8;
  id v23 = v18;
  id v49 = v23;
  id v24 = v40;
  id v50 = v24;
  id v51 = self;
  id v25 = v41;
  id v52 = v25;
  id v26 = v17;
  id v53 = v26;
  BOOL v54 = a9;
  id v27 = objc_retainBlock(v48);
  v28 = 0;
  v29 = off_100601560;
  v30 = &off_1006016D0;
  switch(a3)
  {
    case 2:
      goto LABEL_26;
    case 6:
      v28 = +[MFFlagChangeTriageInteraction interactionWithMessageListItems:v47 undoManager:v46 origin:a10 actor:2 reason:4];
      [v28 setDelegate:self];
      goto LABEL_28;
    case 7:
      uint64_t v31 = +[MFMoveToPredictionTriageInteraction interactionWithMessageListItems:v47 undoManager:v46 origin:a10 actor:2 presentationSource:v26 delegate:v44 presentingViewController:v43 predictedMailbox:0];
      goto LABEL_27;
    case 8:
      goto LABEL_17;
    case 9:
      v29 = &off_1006014C8;
LABEL_17:
      uint64_t v31 = [(__objc2_class *)*v29 interactionWithMessageListItems:v47 undoManager:v46 origin:a10 actor:2];
      goto LABEL_27;
    case 10:
      v32 = +[MFConversationFlagTriageInteraction interactionWithMessageListItems:v47 undoManager:v46 origin:a10 actor:2];
      unsigned __int8 v33 = [v32 isPermitted];
      goto LABEL_20;
    case 11:
      v32 = +[MFConversationFlagTriageInteraction interactionWithMessageListItems:v47 undoManager:v46 origin:a10 actor:2];
      unsigned __int8 v33 = [v32 isPermitted];
LABEL_20:
      if ((v33 & 1) == 0) {
        goto LABEL_45;
      }
      v28 = v32;
      goto LABEL_28;
    case 12:
    case 13:
      uint64_t v34 = objc_opt_class();
      uint64_t v31 = ((void (*)(void *, uint64_t))v27[2])(v27, v34);
      goto LABEL_27;
    case 14:
      uint64_t v35 = objc_opt_class();
      v36 = ((void (*)(void *, uint64_t))v27[2])(v27, v35);
      v28 = v36;
      if (v36)
      {
        [v36 setAttachmentPolicy:1];
        [v28 setPresentationSource:v26];
        [v28 setDelegate:v45];
      }
      goto LABEL_28;
    case 15:
      v30 = &off_1006015B0;
LABEL_26:
      uint64_t v31 = [(__objc2_class *)*v30 interactionWithMessageListItems:v47 undoManager:v46 origin:a10 actor:2 reason:4];
      goto LABEL_27;
    case 17:
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_39;
      }
      v32 = [v24 messageListForMessageTriageInteractionHelper:self messageListItem:v23];
      if (v32)
      {
        uint64_t v38 = +[MFOpenWindowTriageInteraction interactionWithMessageListItem:v23 origin:a10 actor:2 messageList:v32];
        goto LABEL_38;
      }
      v39 = +[MessageTriageInteractionHelper log];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
      goto LABEL_44;
    case 18:
    case 19:
      uint64_t v31 = +[MFSenderBlockingTriageInteraction interactionWithMessageListItems:v47 undoManager:v46 origin:a10 actor:2 blockSender:a3 == 18];
LABEL_27:
      v28 = (void *)v31;
      goto LABEL_28;
    case 20:
      v28 = +[MFUnsubscribeTriageInteraction interactionWithReferenceMessageListItems:v47 origin:a10 actor:2];
      [v28 setPresentationSource:v26];
      [v28 setShouldAskForConfirmation:1];
      [v28 setDelegate:v45];
      goto LABEL_28;
    case 22:
      if (objc_opt_respondsToSelector())
      {
        v32 = [v24 messageListForMessageTriageInteractionHelper:self messageListItem:v23];
        if (v32)
        {
          uint64_t v38 = +[MFFilterTriageInteraction interactionWithMessageListItem:v23 origin:a10 actor:2 messageList:v32 delegate:v42];
LABEL_38:
          v28 = (void *)v38;
        }
        else
        {
          v39 = +[MessageTriageInteractionHelper log];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
LABEL_43:
            [v23 itemID];
            objc_claimAutoreleasedReturnValue();
            sub_10045BE7C();
          }
LABEL_44:

LABEL_45:
          v28 = 0;
        }
      }
      else
      {
LABEL_39:
        v28 = 0;
      }
LABEL_28:

      return v28;
    default:
      goto LABEL_28;
  }
}

- (id)presentingViewControllerForTriageInteraction:(id)a3
{
  id v3 = [(MessageTriageInteractionHelper *)self presentingViewController];

  return v3;
}

- (BOOL)flagStateForFlagChangeTriageInteraction:(id)a3
{
  id v5 = a3;
  if (![v5 supportsSelectAll]
    || ![v5 shouldOverrideFlagState])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v5 messageListItemSelection];
      id v9 = [v8 messageListItems];
      unsigned __int8 v7 = [v9 ef_any:&stru_10060A7C8];

      goto LABEL_12;
    }
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v7 = [(MessageTriageInteractionHelper *)self unflaggedCount] > 0;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  id v6 = [(MessageTriageInteractionHelper *)self dataSource];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MessageTriageInteractionHelper.m" lineNumber:371 description:@"dataSource needs to implement unreadBadgeCountForMessageTriageInteractionHelper:."];
  }
  unsigned __int8 v7 = [v6 unreadBadgeCountForMessageTriageInteractionHelper:self] == 0;

LABEL_12:
  return v7;
}

- (BOOL)flagStateForTriageAction:(int64_t)a3 messageListItems:(id)a4 isSelectAll:(BOOL)a5 supportsSelectAll:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v11 = a4;
  id v12 = v11;
  if (!v7 || !v6)
  {
    if (a3 == 2)
    {
      unsigned __int8 v15 = [v11 ef_all:&stru_10060A808];
    }
    else
    {
      if (a3 != 6)
      {
LABEL_11:
        BOOL v14 = 0;
        goto LABEL_15;
      }
      unsigned __int8 v15 = [v11 ef_any:&stru_10060A7E8];
    }
    BOOL v14 = v15;
    goto LABEL_15;
  }
  if (a3 == 6)
  {
    BOOL v14 = [(MessageTriageInteractionHelper *)self unflaggedCount] > 0;
    goto LABEL_15;
  }
  if (a3 != 2) {
    goto LABEL_11;
  }
  id v13 = [(MessageTriageInteractionHelper *)self dataSource];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MessageTriageInteractionHelper.m" lineNumber:392 description:@"dataSource needs to implement unreadBadgeCountForMessageTriageInteractionHelper:."];
  }
  BOOL v14 = [v13 unreadBadgeCountForMessageTriageInteractionHelper:self] == 0;

LABEL_15:
  return v14;
}

- (id)messageRepositoryForTriageInteraction:(id)a3
{
  id v3 = [(MessageTriageInteractionHelper *)self messageRepository];

  return v3;
}

- (int64_t)unreadBadgetCount
{
  return self->_unreadBadgetCount;
}

- (void)setUnreadBadgetCount:(int64_t)a3
{
  self->_unreadBadgetCount = a3;
}

- (MessageTriageInteractionHelperDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (MessageTriageInteractionHelperDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (MFTriageInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFTriageInteractionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ComposeCapable)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (ComposeCapable *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (void)setTarget:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void)setMessageRepository:(id)a3
{
}

- (void)setUnflaggedCountObserver:(id)a3
{
}

- (void)setUnflaggedCountQuery:(id)a3
{
}

- (int64_t)unflaggedCount
{
  return self->_unflaggedCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unflaggedCountQuery, 0);
  objc_storeStrong((id *)&self->_unflaggedCountObserver, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);

  objc_storeStrong((id *)&self->_observedMailboxes, 0);
}

@end