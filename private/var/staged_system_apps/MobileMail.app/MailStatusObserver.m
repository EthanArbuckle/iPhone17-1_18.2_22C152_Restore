@interface MailStatusObserver
- (BOOL)_isMailboxObjectIDInActivityStatusMailboxes:(id)a3;
- (EFCancelable)badgeCountObserverCancelable;
- (EFCancelationToken)activityObserverCancelable;
- (EMActivityRegistry)activityRegistry;
- (EMMailboxRepository)mailboxRepository;
- (EMOutgoingMessageRepository)outgoingMessageRepository;
- (MailStatusObserver)initWithMailboxRepository:(id)a3 delegate:(id)a4;
- (MailStatusObserverDelegate)delegate;
- (NSArray)activityStatusMailboxes;
- (NSArray)badgeCountStatusMailboxes;
- (NSMutableArray)mailboxesToIgnoreFirstError;
- (NSPredicate)filterPredicate;
- (OS_dispatch_queue)queue;
- (int64_t)_matchingMailStatusState:(int64_t)a3;
- (int64_t)badgeCount;
- (void)_startBadgeCountObserversWithLabel:(id)a3;
- (void)activityRegistry:(id)a3 startedActivity:(id)a4;
- (void)checkForiCloudQuotaUpsellOffer;
- (void)dealloc;
- (void)icqOfferDidChange:(id)a3;
- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5;
- (void)setActivityObserverCancelable:(id)a3;
- (void)setActivityRegistry:(id)a3;
- (void)setActivityStatusMailboxes:(id)a3;
- (void)setBadgeCount:(int64_t)a3;
- (void)setBadgeCountObserverCancelable:(id)a3;
- (void)setBadgeCountStatusMailboxes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setMailboxRepository:(id)a3;
- (void)setOutgoingMessageRepository:(id)a3;
- (void)startObservingForActivityStatusMailboxes:(id)a3 badgeCountStatusMailboxes:(id)a4 filterPredicate:(id)a5 label:(id)a6;
- (void)startObservingForVisibleMailboxes:(id)a3 filterPredicate:(id)a4 label:(id)a5;
- (void)stopObserving;
@end

@implementation MailStatusObserver

- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5
{
  -[MailStatusObserver setBadgeCount:](self, "setBadgeCount:", a5, a4);
  id v7 = [(MailStatusObserver *)self delegate];
  if (v7) {
    [v7 badgeCountUpdated:self badgeCount:a5];
  }
}

- (void)setBadgeCount:(int64_t)a3
{
  self->_badgeCount = a3;
}

- (EFCancelationToken)activityObserverCancelable
{
  return self->_activityObserverCancelable;
}

- (void)setBadgeCountObserverCancelable:(id)a3
{
}

- (void)setActivityObserverCancelable:(id)a3
{
}

- (EFCancelable)badgeCountObserverCancelable
{
  return self->_badgeCountObserverCancelable;
}

- (void)activityRegistry:(id)a3 startedActivity:(id)a4
{
  id v5 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002EC00;
  v16[3] = &unk_100608DC8;
  objc_copyWeak(&v18, &location);
  id v6 = v5;
  id v17 = v6;
  id v7 = objc_retainBlock(v16);
  v8 = (void *)atomic_load(&self->_currentStatusObserverID);
  activityStatusUpdateScheduler = self->_activityStatusUpdateScheduler;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004D214;
  v12[3] = &unk_100608E40;
  objc_copyWeak(v15, &location);
  v15[1] = v8;
  id v13 = v6;
  id v14 = v7;
  v10 = v7;
  id v11 = v6;
  [(EFScheduler *)activityStatusUpdateScheduler performBlock:v12];

  objc_destroyWeak(v15);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)icqOfferDidChange:(id)a3
{
  v4 = +[ICQOfferManager sharedOfferManager];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000218F4;
  v5[3] = &unk_100608E90;
  v5[4] = self;
  [v4 getOfferWithCompletion:v5];
}

- (void)checkForiCloudQuotaUpsellOffer
{
}

- (int64_t)_matchingMailStatusState:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0xAAAAAAAAAAAAAAAALL;
  }
  else {
    return qword_1005A7FC0[a3];
  }
}

- (int64_t)badgeCount
{
  return self->_badgeCount;
}

- (MailStatusObserver)initWithMailboxRepository:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)MailStatusObserver;
  v9 = [(MailStatusObserver *)&v32 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mailboxRepository, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mobilemail.statusobserver", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    id v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mailboxesToIgnoreFirstError = v10->_mailboxesToIgnoreFirstError;
    v10->_mailboxesToIgnoreFirstError = v14;

    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    v28 = sub_1000573CC;
    v29 = &unk_100604618;
    id v30 = v8;
    v16 = v10;
    v31 = v16;
    uint64_t v17 = +[MFNetworkController addNetworkObserverBlock:&v26 queue:v10->_queue];
    id networkObserverID = v16->_networkObserverID;
    v16->_id networkObserverID = (id)v17;

    atomic_store(0, &v16->_currentStatusObserverID);
    uint64_t v19 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.statusobserver.activityRegistryUpdate", 17, v26, v27, v28, v29 qualityOfService];
    activityStatusUpdateScheduler = v16->_activityStatusUpdateScheduler;
    v16->_activityStatusUpdateScheduler = (EFScheduler *)v19;

    v21 = +[UIApplication sharedApplication];
    v22 = [v21 daemonInterface];
    uint64_t v23 = [v22 activityRegistry];
    activityRegistry = v16->_activityRegistry;
    v16->_activityRegistry = (EMActivityRegistry *)v23;
  }
  return v10;
}

- (MailStatusObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MailStatusObserverDelegate *)WeakRetained;
}

- (NSMutableArray)mailboxesToIgnoreFirstError
{
  return self->_mailboxesToIgnoreFirstError;
}

- (void)setFilterPredicate:(id)a3
{
}

- (void)setBadgeCountStatusMailboxes:(id)a3
{
}

- (void)setActivityStatusMailboxes:(id)a3
{
}

- (EMActivityRegistry)activityRegistry
{
  return self->_activityRegistry;
}

- (void)_startBadgeCountObserversWithLabel:(id)a3
{
  id v4 = a3;
  id v5 = [(MailStatusObserver *)self badgeCountStatusMailboxes];
  if ([v5 count])
  {
    id v28 = v4;
    id v6 = [(MailStatusObserver *)self delegate];
    uint64_t v27 = v6;
    if (v6) {
      unsigned int v7 = [v6 preferUnreadCountInsteadOfTotalCount:self];
    }
    else {
      unsigned int v7 = 0;
    }
    id v8 = +[EMMessageListItemPredicates predicateForMessagesInMailboxes:v5];
    v9 = +[NSMutableArray arrayWithObject:v8];

    v26 = v9;
    v10 = [(MailStatusObserver *)self filterPredicate];
    if (v10) {
      [v9 addObject:v10];
    }
    if (v7)
    {
      id v11 = +[EMMessageListItemPredicates predicateForUnreadMessages];
      if (([v10 isEqual:v11] & 1) == 0) {
        [v9 addObject:v11];
      }
    }
    uint64_t v24 = +[NSCompoundPredicate ef_andCompoundPredicateWithSubpredicates:v9];
    id v29 = [objc_alloc((Class)EMQuery) initWithTargetClass:objc_opt_class() predicate:v24 sortDescriptors:&__NSArray0__struct queryOptions:0 label:v4];
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = sub_100125DD0;
    v44 = sub_100125DE0;
    id v45 = 0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10001D684;
    v32[3] = &unk_100608E68;
    v34 = &v40;
    id v12 = objc_alloc_init((Class)NSMutableSet);
    id v33 = v12;
    v35 = &v36;
    id v13 = [v5 ef_filter:v32];
    id v14 = v13;
    if (*((unsigned char *)v37 + 24))
    {
      id v15 = 0;
    }
    else if (objc_msgSend(v13, "count", v24) || objc_msgSend(v12, "count"))
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100016540;
      v30[3] = &unk_100604E08;
      id v16 = v12;
      id v31 = v16;
      uint64_t v17 = [v14 ef_filter:v30];
      id v18 = [v17 ef_mapSelector:@"objectID"];

      id v19 = [objc_alloc((Class)NSSet) initWithArray:v18];
      id v15 = [objc_alloc((Class)EMMailboxScope) initWithMailboxTypes:v16 excludeTypes:0 mailboxObjectIDs:v19 excludeMailboxes:0];
    }
    else
    {
      id v15 = [(id)v41[5] mailboxScope];
    }
    v20 = +[UIApplication sharedApplication];
    v21 = [v20 daemonInterface];
    v22 = [v21 messageRepository];
    uint64_t v23 = [v22 startCountingQuery:v29 includingServerCountsForMailboxScope:v15 withObserver:self];
    [(MailStatusObserver *)self setBadgeCountObserverCancelable:v23];

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);

    id v4 = v28;
  }
}

- (NSArray)badgeCountStatusMailboxes
{
  return self->_badgeCountStatusMailboxes;
}

- (BOOL)_isMailboxObjectIDInActivityStatusMailboxes:(id)a3
{
  id v4 = a3;
  id v5 = [(MailStatusObserver *)self activityStatusMailboxes];
  id v6 = [(MailStatusObserver *)self mailboxRepository];
  unsigned __int8 v7 = 0;
  if (v6 && v5)
  {
    id v8 = +[EMMessageListItemPredicates predicateForMessagesInMailboxes:v5];
    v9 = +[EMMessageListItemPredicates mailboxScopeForPredicate:v8 withMailboxTypeResolver:v6];
    unsigned __int8 v7 = [v9 scopeContainsMailboxObjectID:v4 mailboxTypeResolver:v6];
  }
  return v7;
}

- (EMMailboxRepository)mailboxRepository
{
  return self->_mailboxRepository;
}

- (NSArray)activityStatusMailboxes
{
  return self->_activityStatusMailboxes;
}

- (void)startObservingForActivityStatusMailboxes:(id)a3 badgeCountStatusMailboxes:(id)a4 filterPredicate:(id)a5 label:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(MailStatusObserver *)self stopObserving];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  activityStatusUpdateScheduler = self->_activityStatusUpdateScheduler;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10004D4A0;
  v19[3] = &unk_100608DA0;
  objc_copyWeak(&v24, &location);
  id v15 = v10;
  id v20 = v15;
  id v16 = v11;
  id v21 = v16;
  id v17 = v12;
  id v22 = v17;
  id v18 = v13;
  id v23 = v18;
  [(EFScheduler *)activityStatusUpdateScheduler performBlock:v19];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)stopObserving
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  activityStatusUpdateScheduler = self->_activityStatusUpdateScheduler;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021B34;
  v4[3] = &unk_100604FE8;
  objc_copyWeak(&v5, &location);
  [(EFScheduler *)activityStatusUpdateScheduler performBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)startObservingForVisibleMailboxes:(id)a3 filterPredicate:(id)a4 label:(id)a5
{
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)dealloc
{
  sub_100021B90(self);
  if (self->_networkObserverID)
  {
    +[MFNetworkController removeNetworkObserver:](MFNetworkController, "removeNetworkObserver:");
    id networkObserverID = self->_networkObserverID;
    self->_id networkObserverID = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MailStatusObserver;
  [(MailStatusObserver *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
}

- (void)setMailboxRepository:(id)a3
{
}

- (EMOutgoingMessageRepository)outgoingMessageRepository
{
  return self->_outgoingMessageRepository;
}

- (void)setOutgoingMessageRepository:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setActivityRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxesToIgnoreFirstError, 0);
  objc_storeStrong((id *)&self->_badgeCountObserverCancelable, 0);
  objc_storeStrong((id *)&self->_activityObserverCancelable, 0);
  objc_storeStrong((id *)&self->_activityRegistry, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_badgeCountStatusMailboxes, 0);
  objc_storeStrong((id *)&self->_activityStatusMailboxes, 0);
  objc_storeStrong((id *)&self->_outgoingMessageRepository, 0);
  objc_storeStrong((id *)&self->_mailboxRepository, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_networkObserverID, 0);

  objc_storeStrong((id *)&self->_activityStatusUpdateScheduler, 0);
}

@end