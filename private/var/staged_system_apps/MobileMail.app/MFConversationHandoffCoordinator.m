@interface MFConversationHandoffCoordinator
+ (OS_os_log)log;
- (MFConversationHandoffCoordinator)initWithUserActivityProvider:(id)a3 currentVisibleMessageStrategy:(id)a4;
- (MFCurrentVisibleMessageStrategy)currentVisibleMessageStrategy;
- (MFUserActivityProvider)userActivityProvider;
- (MessageContentRepresentationRequest)handoffMessageRequest;
- (id)_createUserActivity;
- (void)_updateUserActivity:(id)a3 withHandoffAvailabilityForContentRepresentation:(id)a4 message:(id)a5;
- (void)_updateUserActivity:(id)a3 withPersistentIDForMessage:(id)a4 completion:(id)a5;
- (void)_updateUserActivity:(id)a3 withSearchableItemAttributeSetForMessage:(id)a4;
- (void)setCurrentVisibleMessageStrategy:(id)a3;
- (void)setHandoffMessageRequest:(id)a3;
- (void)setUserActivityProvider:(id)a3;
- (void)updateHandoffMessageBasedOnMessageVisibility;
- (void)updateUserActivityState;
- (void)updateUserActivityState:(BOOL)a3;
@end

@implementation MFConversationHandoffCoordinator

- (MFConversationHandoffCoordinator)initWithUserActivityProvider:(id)a3 currentVisibleMessageStrategy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MFConversationHandoffCoordinator;
  v8 = [(MFConversationHandoffCoordinator *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_userActivityProvider, v6);
    objc_storeStrong((id *)&v9->_currentVisibleMessageStrategy, a4);
  }

  return v9;
}

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001883B0;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699A58 != -1) {
    dispatch_once(&qword_100699A58, block);
  }
  v2 = (void *)qword_100699A50;

  return (OS_os_log *)v2;
}

- (void)updateUserActivityState
{
}

- (void)updateUserActivityState:(BOOL)a3
{
  v5 = [(MFConversationHandoffCoordinator *)self handoffMessageRequest];
  id v6 = [(MFConversationHandoffCoordinator *)self userActivityProvider];
  id v7 = [v6 userActivity];
  if (!v7)
  {
    id v7 = [(MFConversationHandoffCoordinator *)self _createUserActivity];
  }
  [v7 setPersistentIdentifier:0];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v6);
  v8 = [v5 messageFuture];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100188650;
  v11[3] = &unk_10060B268;
  id v9 = v5;
  id v12 = v9;
  objc_copyWeak(&v14, &location);
  id v10 = v7;
  id v13 = v10;
  objc_copyWeak(&v15, &from);
  BOOL v16 = a3;
  [v8 addSuccessBlock:v11];
  [v8 addFailureBlock:&stru_10060B288];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)setHandoffMessageRequest:(id)a3
{
  id v5 = a3;
  if ((-[MessageContentRepresentationRequest isEqual:](self->_handoffMessageRequest, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_handoffMessageRequest, a3);
    [(MFConversationHandoffCoordinator *)self updateUserActivityState:1];
  }
}

- (void)updateHandoffMessageBasedOnMessageVisibility
{
  id v4 = [(MFConversationHandoffCoordinator *)self currentVisibleMessageStrategy];
  v3 = [v4 currentVisibleMessageContentRequest];
  [(MFConversationHandoffCoordinator *)self setHandoffMessageRequest:v3];
}

- (id)_createUserActivity
{
  id v2 = objc_alloc((Class)NSUserActivity);
  id v3 = [v2 initWithActivityType:MSMailActivityHandoffTypeDisplayMessage];

  return v3;
}

- (void)_updateUserActivity:(id)a3 withSearchableItemAttributeSetForMessage:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  id v6 = objc_alloc((Class)CSSearchableItemAttributeSet);
  id v7 = [v10 activityType];
  id v8 = [v6 initWithItemContentType:v7];

  id v9 = [v5 contentID];
  if (v9)
  {
    [v8 setRelatedUniqueIdentifier:v9];
    [v10 setEligibleForSearch:1];
  }
  else
  {

    id v8 = 0;
    [v10 setEligibleForSearch:0];
  }
  [v10 setContentAttributeSet:v8];
}

- (void)_updateUserActivity:(id)a3 withHandoffAvailabilityForContentRepresentation:(id)a4 message:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[UIApplication sharedApplication];
  objc_super v11 = [v10 accountsProvider];
  id v12 = [v9 mailboxes];
  id v13 = [v12 firstObject];
  id v14 = [v13 account];
  id v15 = [v14 objectID];
  BOOL v16 = [v11 legacyMailAccountForObjectID:v15];

  uint64_t v17 = MSMailActivityHandoffTypeDisplayMessage;
  id v18 = [v16 supportsHandoffType:MSMailActivityHandoffTypeDisplayMessage];
  v19 = [v8 publicMessageURL];
  uint64_t v20 = [v19 absoluteString];
  v21 = (void *)v20;
  if (v19)
  {
    v25[0] = MSMailActivityHandoffTypeKey;
    v25[1] = MSMailActivityHandoffDisplayMessageKeyURL;
    v26[0] = v17;
    v26[1] = v20;
    v22 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    [v7 setUserInfo:v22];

    if (objc_opt_respondsToSelector()) {
      [v7 set_canonicalURL:v19];
    }
  }
  else
  {
    id v18 = 0;
  }
  [v7 setEligibleForHandoff:v18];
  [v7 setPersistentIdentifier:v21];
  v23 = [v9 subject];
  v24 = +[ECSubjectFormatter subjectStringForDisplayForSubject:v23];
  [v7 setTitle:v24];
}

- (void)_updateUserActivity:(id)a3 withPersistentIDForMessage:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(MFConversationHandoffCoordinator *)self currentVisibleMessageStrategy];
  id v12 = [v9 objectID];
  id v13 = [v11 persistentIDForEMMessageObjectID:v12];

  id v14 = +[EFScheduler mainThreadScheduler];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001892A0;
  v23[3] = &unk_10060B2B0;
  id v15 = v8;
  id v24 = v15;
  id v16 = v10;
  id v25 = v16;
  [v13 onScheduler:v14 addSuccessBlock:v23];

  uint64_t v17 = +[EFScheduler mainThreadScheduler];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100189330;
  v20[3] = &unk_100605A60;
  id v18 = v9;
  id v21 = v18;
  id v19 = v16;
  id v22 = v19;
  [v13 onScheduler:v17 addFailureBlock:v20];
}

- (MFUserActivityProvider)userActivityProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userActivityProvider);

  return (MFUserActivityProvider *)WeakRetained;
}

- (void)setUserActivityProvider:(id)a3
{
}

- (MFCurrentVisibleMessageStrategy)currentVisibleMessageStrategy
{
  return self->_currentVisibleMessageStrategy;
}

- (void)setCurrentVisibleMessageStrategy:(id)a3
{
}

- (MessageContentRepresentationRequest)handoffMessageRequest
{
  return self->_handoffMessageRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoffMessageRequest, 0);
  objc_storeStrong((id *)&self->_currentVisibleMessageStrategy, 0);

  objc_destroyWeak((id *)&self->_userActivityProvider);
}

@end