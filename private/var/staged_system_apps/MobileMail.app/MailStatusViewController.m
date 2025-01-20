@interface MailStatusViewController
+ (OS_os_log)log;
+ (id)signpostLog;
- (BOOL)_rebuildStatus;
- (BOOL)preferUnreadCountInsteadOfTotalCount:(id)a3;
- (BOOL)shouldShowSubtitle;
- (EFCancelable)progressObserverCancelable;
- (EFScheduler)mailboxStatusScheduler;
- (EMMailboxRepository)mailboxRepository;
- (EMOutgoingMessageRepository)outgoingMessageRepository;
- (MailMainScene)scene;
- (MailStatusBarView)statusBarView;
- (MailStatusDelegate)delegate;
- (MailStatusInfo)statusInfo;
- (MailStatusObserver)statusObserver;
- (MailStatusViewController)initWithMailboxRepository:(id)a3 outgoingMessageRepository:(id)a4 scene:(id)a5;
- (NSArray)activityStatusMailboxes;
- (NSArray)badgeCountStatusMailboxes;
- (NSMutableDictionary)mailboxStatusInfos;
- (UIBarButtonItem)mailStatusBarButtonItem;
- (UIColor)statusBarViewTintColor;
- (id)accountStatusErrorAttributedStringForAccountWithErrors:(id)a3;
- (id)actionBlockForAccountError:(id)a3 error:(id)a4 description:(id)a5 failureReason:(id)a6;
- (id)mailboxQualifier;
- (id)networkStatusErrorString;
- (id)pressedBlock;
- (int64_t)badgeCount;
- (int64_t)currentState;
- (int64_t)interfaceOrientation;
- (unint64_t)signpostID;
- (void)_performStatusUpdate;
- (void)_performStatusUpdateAndSignpostForMailboxObjectID:(id)a3;
- (void)_reset;
- (void)_subtitlePressed;
- (void)badgeCountUpdated:(id)a3 badgeCount:(int64_t)a4;
- (void)currentStatusInfoWithCompletion:(id)a3;
- (void)hasDelayedMessagesDidChange:(BOOL)a3;
- (void)iCloudQuotaOfferUpdated:(id)a3 offer:(id)a4;
- (void)mailStatusBarViewUndoButtonTapped:(id)a3;
- (void)mailboxStatusUpdated:(id)a3 statusInfo:(id)a4 forMailboxObjectID:(id)a5;
- (void)networkStatusChanged:(id)a3;
- (void)numberOfPendingMessagesChanged:(unint64_t)a3;
- (void)resetAccountErrors;
- (void)setActivityStatusMailboxes:(id)a3;
- (void)setBadgeCount:(int64_t)a3;
- (void)setBadgeCountStatusMailboxes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMailStatusBarButtonItem:(id)a3;
- (void)setMailboxRepository:(id)a3;
- (void)setMailboxStatusInfos:(id)a3;
- (void)setOutgoingMessageRepository:(id)a3;
- (void)setPressedBlock:(id)a3;
- (void)setProgressObserverCancelable:(id)a3;
- (void)setScene:(id)a3;
- (void)setStatusBarView:(id)a3;
- (void)setStatusBarViewTintColor:(id)a3;
- (void)setStatusInfo:(id)a3;
- (void)setStatusObserver:(id)a3;
- (void)signpostPreviousStatus:(id)a3 andCurrentStatus:(id)a4 usingMailboxObjectID:(id)a5;
- (void)startObservingForActivityStatusMailboxes:(id)a3 badgeCountStatusMailboxes:(id)a4 delegate:(id)a5 filterPredicate:(id)a6 label:(id)a7;
- (void)startObservingForVisibleMailboxes:(id)a3 delegate:(id)a4 filterPredicate:(id)a5 label:(id)a6;
- (void)stopObserving;
- (void)tintColorDidChange;
- (void)updateBarItemTitle:(id)a3 secondaryTitle:(id)a4;
@end

@implementation MailStatusViewController

- (void)badgeCountUpdated:(id)a3 badgeCount:(int64_t)a4
{
  v6 = [(MailStatusViewController *)self mailboxStatusScheduler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100057A20;
  v7[3] = &unk_1006048E0;
  v7[4] = self;
  v7[5] = a4;
  [v6 performBlock:v7];

  [(MailStatusViewController *)self _performStatusUpdate];
}

- (void)numberOfPendingMessagesChanged:(unint64_t)a3
{
  p_numberOfPendingMessagesLock = &self->_numberOfPendingMessagesLock;
  os_unfair_lock_lock(&self->_numberOfPendingMessagesLock);
  if (self->_numberOfPendingMessages == a3)
  {
    os_unfair_lock_unlock(p_numberOfPendingMessagesLock);
  }
  else
  {
    self->_numberOfPendingMessages = a3;
    os_unfair_lock_unlock(p_numberOfPendingMessagesLock);
    [(MailStatusViewController *)self _performStatusUpdate];
  }
}

- (BOOL)preferUnreadCountInsteadOfTotalCount:(id)a3
{
  v3 = [(MailStatusViewController *)self delegate];
  v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 shouldShowSubtitle];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)mailboxStatusUpdated:(id)a3 statusInfo:(id)a4 forMailboxObjectID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(MailStatusViewController *)self mailboxStatusScheduler];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100010554;
  v12[3] = &unk_100604668;
  v12[4] = self;
  id v10 = v8;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [v9 performSyncBlock:v12];

  [(MailStatusViewController *)self _performStatusUpdateAndSignpostForMailboxObjectID:v10];
}

- (EMOutgoingMessageRepository)outgoingMessageRepository
{
  return self->_outgoingMessageRepository;
}

- (void)networkStatusChanged:(id)a3
{
  v4 = +[MFNetworkController sharedInstance];
  id v5 = [v4 dataStatus];

  v6 = +[MailStatusViewController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = +[NSNumber numberWithInteger:v5];
    int v8 = 138543362;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Network status changed: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  [(MailStatusViewController *)self resetAccountErrors];
  [(MailStatusViewController *)self _performStatusUpdate];
}

- (void)resetAccountErrors
{
  v3 = [(MailStatusViewController *)self mailboxStatusScheduler];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100018210;
  v4[3] = &unk_1006047A0;
  v4[4] = self;
  [v3 performSyncBlock:v4];
}

- (void)_performStatusUpdate
{
}

- (void)iCloudQuotaOfferUpdated:(id)a3 offer:(id)a4
{
  id v5 = a4;
  id v8 = v5;
  v9 = self;
  v6 = +[EFScheduler mainThreadScheduler];
  [v6 performBlock:&v7];
}

- (void)_reset
{
  id v7 = [(MailStatusViewController *)self mailboxStatusInfos];
  [v7 removeAllObjects];

  [(MailStatusViewController *)self setBadgeCount:0];
  id v8 = [(MailStatusViewController *)self statusInfo];
  v3 = objc_alloc_init(MailStatusInfo);
  [(MailStatusInfo *)v3 setStatus:&stru_100619928];
  [(MailStatusInfo *)v3 setState:2];
  [(MailStatusViewController *)self setStatusInfo:v3];
  v4 = v3;
  [(MailStatusViewController *)self signpostPreviousStatus:v8 andCurrentStatus:v4 usingMailboxObjectID:0];
  id v5 = [(MailStatusViewController *)self statusBarView];
  [v5 setNeedsDisplayWithStatusInfo:v4];

  v6 = [(MailStatusViewController *)self statusObserver];
  [v6 checkForiCloudQuotaUpsellOffer];
}

- (MailStatusInfo)statusInfo
{
  p_statusInfoLock = &self->_statusInfoLock;
  os_unfair_lock_lock(&self->_statusInfoLock);
  v4 = self->_statusInfo;
  os_unfair_lock_unlock(p_statusInfoLock);

  return v4;
}

- (MailStatusBarView)statusBarView
{
  return self->_statusBarView;
}

- (BOOL)_rebuildStatus
{
  v52 = [(MailStatusViewController *)self mailboxStatusInfos];
  v65 = +[NSDate date];
  id v53 = objc_alloc_init((Class)NSMutableArray);
  [(MailStatusViewController *)self setPressedBlock:0];
  os_unfair_lock_lock(&self->_numberOfPendingMessagesLock);
  unint64_t numberOfPendingMessages = self->_numberOfPendingMessages;
  BOOL hasDelayedMessages = self->_hasDelayedMessages;
  os_unfair_lock_unlock(&self->_numberOfPendingMessagesLock);
  unint64_t v50 = numberOfPendingMessages;
  if (hasDelayedMessages)
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v4 = v52;
    id v5 = [v4 countByEnumeratingWithState:&v72 objects:v81 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v73;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v73 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v72 + 1) + 8 * i), v50];
          [v8 setState:4];
        }
        id v5 = [v4 countByEnumeratingWithState:&v72 objects:v81 count:16];
      }
      while (v5);
    }

    id v59 = 0;
    v60 = 0;
    v64 = 0;
    v9 = 0;
    v58 = 0;
    id v10 = 0;
    id v11 = 0;
    v62 = 0;
    v56 = 0;
    uint64_t v12 = 4;
    goto LABEL_12;
  }
  if (numberOfPendingMessages)
  {
    id v59 = 0;
    v60 = 0;
    v64 = 0;
    v9 = 0;
    v58 = 0;
    id v10 = 0;
    id v11 = 0;
    v62 = 0;
    v56 = 0;
    uint64_t v12 = 1;
LABEL_12:
    uint64_t v61 = v12;
    goto LABEL_13;
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = v52;
  id v23 = [obj countByEnumeratingWithState:&v68 objects:v80 count:16];
  if (!v23)
  {
    id v59 = 0;
    v60 = 0;
    v64 = 0;
    v9 = 0;
    v58 = 0;
    id v11 = 0;
    v56 = 0;
    uint64_t v61 = 1;
    v62 = 0;
    goto LABEL_53;
  }
  id v59 = 0;
  v60 = 0;
  v64 = 0;
  v9 = 0;
  v58 = 0;
  id v11 = 0;
  uint64_t v55 = *(void *)v69;
  v56 = 0;
  uint64_t v61 = 1;
  v62 = 0;
  do
  {
    id v57 = v23;
    for (j = 0; j != v57; j = (char *)j + 1)
    {
      if (*(void *)v69 != v55) {
        objc_enumerationMutation(obj);
      }
      uint64_t v25 = *(void *)(*((void *)&v68 + 1) + 8 * (void)j);
      v26 = [obj objectForKeyedSubscript:v25, v50];
      v27 = [v26 lastUpdateTime];
      BOOL v28 = [v27 compare:v65] == (id)1;

      if (v28)
      {
        uint64_t v29 = [v26 lastUpdateTime];

        v65 = (void *)v29;
      }
      v30 = [v26 progress];
      v31 = v30;
      if (v30 && (uint64_t)[v30 totalUnitCount] >= 1)
      {
        if (!v59) {
          id v59 = [objc_alloc((Class)NSProgress) initWithParent:0 userInfo:0];
        }
        uint64_t v32 = [v26 status];

        v9 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", [v31 totalUnitCount]);
        v33 = [v26 progress];
        [v9 setCompletedUnitCount:[v33 completedUnitCount]];

        [v59 addChild:v9 withPendingUnitCount:1];
        uint64_t v34 = 3;
        goto LABEL_40;
      }
      if (v61 == 3)
      {
        uint64_t v61 = 3;
        goto LABEL_41;
      }
      if ([v26 state] == (id)2)
      {
        uint64_t v32 = [v26 status];
        uint64_t v34 = 2;
LABEL_40:
        uint64_t v61 = v34;

        v9 = (void *)v32;
      }
LABEL_41:
      if ([v26 state] == (id)1)
      {
        uint64_t v35 = [v26 status];

        v58 = (void *)v35;
      }
      v36 = [v26 iCloudQuotaOfferText];

      if (v36)
      {
        uint64_t v37 = [v26 iCloudQuotaOfferText];

        uint64_t v38 = [v26 iCloudQuotaOfferLink];

        v64 = (void *)v37;
        v60 = (void *)v38;
      }
      if ([v26 hasAccountError])
      {
        v39 = [(MailStatusViewController *)self mailboxRepository];
        v40 = [v39 mailboxForObjectID:v25];
        v41 = [v40 result:0];

        v42 = [v41 account];
        if (v42) {
          [v53 addObject:v42];
        }
        uint64_t v43 = [v26 error];

        uint64_t v44 = [v26 accountErrorTitle];

        uint64_t v45 = [v26 failureReasonDescription];

        id v11 = (void *)v43;
        v62 = (void *)v44;
        v56 = (void *)v45;
      }
    }
    id v23 = [obj countByEnumeratingWithState:&v68 objects:v80 count:16];
  }
  while (v23);
LABEL_53:

  if ([v53 count])
  {
    uint64_t v46 = [(MailStatusViewController *)self accountStatusErrorAttributedStringForAccountWithErrors:v53];
    id v47 = [(MailStatusViewController *)self actionBlockForAccountError:v53 error:v11 description:v62 failureReason:v56];
    [(MailStatusViewController *)self setPressedBlock:v47];
    id v10 = (void *)v46;
    goto LABEL_57;
  }
  if (v60)
  {
    v48 = [(MailStatusViewController *)self scene];
    v49 = [v48 masterNavigationController];

    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_100127160;
    v66[3] = &unk_1006047A0;
    id v67 = v49;
    id v47 = v49;
    [(MailStatusViewController *)self setPressedBlock:v66];

    id v10 = 0;
LABEL_57:
  }
  else
  {
    id v10 = 0;
  }
  if (!v65)
  {
    v65 = +[NSDate now];
  }
LABEL_13:
  id v13 = objc_alloc_init(MailStatusInfo);
  [(MailStatusInfo *)v13 setState:v61];
  if (v9) {
    id v14 = v9;
  }
  else {
    id v14 = v58;
  }
  -[MailStatusInfo setStatus:](v13, "setStatus:", v14, v50);
  -[MailStatusInfo setHasAccountError:](v13, "setHasAccountError:", [v53 count] != 0);
  [(MailStatusInfo *)v13 setLastUpdateTime:v65];
  unsigned int v15 = [(MailStatusViewController *)self shouldShowSubtitle];
  if (v60) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v15;
  }
  [(MailStatusInfo *)v13 setShouldShowSubtitle:v16];
  v17 = [(MailStatusViewController *)self networkStatusErrorString];
  [(MailStatusInfo *)v13 setNetworkingAccountErrorString:v17];

  [(MailStatusInfo *)v13 setAccountErrorString:v10];
  [(MailStatusInfo *)v13 setBadgeCount:[(MailStatusViewController *)self badgeCount]];
  [(MailStatusInfo *)v13 setUnsentCount:v51];
  [(MailStatusInfo *)v13 setProgress:v59];
  [(MailStatusInfo *)v13 setICloudQuotaOfferText:v64];
  [(MailStatusInfo *)v13 setICloudQuotaOfferLink:v60];
  v18 = [(MailStatusViewController *)self statusInfo];
  unsigned __int8 v19 = [(MailStatusInfo *)v13 isEqual:v18];

  if ((v19 & 1) == 0)
  {
    v20 = +[MailStatusViewController log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [(MailStatusInfo *)v13 ef_publicDescription];
      *(_DWORD *)buf = 134218242;
      v77 = self;
      __int16 v78 = 2112;
      v79 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%p rebuildStatus - setting new statusInfo:%@", buf, 0x16u);
    }
    [(MailStatusViewController *)self setStatusInfo:v13];
  }

  return v19 ^ 1;
}

- (NSMutableDictionary)mailboxStatusInfos
{
  return self->_mailboxStatusInfos;
}

- (void)setStatusInfo:(id)a3
{
  id v8 = (MailStatusInfo *)a3;
  p_statusInfoLock = &self->_statusInfoLock;
  os_unfair_lock_lock(&self->_statusInfoLock);
  statusInfo = self->_statusInfo;
  p_statusInfo = &self->_statusInfo;
  if (statusInfo != v8) {
    objc_storeStrong((id *)p_statusInfo, a3);
  }
  os_unfair_lock_unlock(p_statusInfoLock);
}

- (void)setPressedBlock:(id)a3
{
}

- (id)networkStatusErrorString
{
  v2 = +[MFNetworkController sharedInstance];
  id v3 = [v2 dataStatus];

  id v4 = +[MailStatusViewController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = +[NSNumber numberWithInteger:v3];
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Current network data status: %{public}@", buf, 0xCu);
  }
  if (v3)
  {
    uint64_t v6 = +[NSBundle mainBundle];
    id v7 = MFLookupLocalizedString();
    id v8 = [v6 localizedStringForKey:v7 value:&stru_100619928 table:@"Main"];

    v9 = +[UIColor systemGrayColor];
    id v14 = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

    id v11 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v8 attributes:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000085D8;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699780 != -1) {
    dispatch_once(&qword_100699780, block);
  }
  v2 = (void *)qword_100699778;

  return (OS_os_log *)v2;
}

- (int64_t)badgeCount
{
  return self->_badgeCount;
}

- (void)setBadgeCount:(int64_t)a3
{
  self->_badgeCount = a3;
}

- (void)updateBarItemTitle:(id)a3 secondaryTitle:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(MailStatusViewController *)self mailStatusBarButtonItem];
  if (v7)
  {
    id v8 = [v11 length];

    if (v8)
    {
      v9 = +[NSMutableString stringWithString:v11];
      if (-[MailStatusViewController shouldShowSubtitle](self, "shouldShowSubtitle") && [v6 length])
      {
        [v9 appendString:@"\n\n"];
        [v9 appendString:v6];
      }
      if ([v9 length])
      {
        id v10 = [(MailStatusViewController *)self mailStatusBarButtonItem];
        [v10 setTitle:v9];
      }
    }
  }
}

- (UIBarButtonItem)mailStatusBarButtonItem
{
  return self->_mailStatusBarButtonItem;
}

- (void)signpostPreviousStatus:(id)a3 andCurrentStatus:(id)a4 usingMailboxObjectID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v30 = v8;
  id v31 = a5;
  id v10 = [v8 state];
  if (v10 == [v9 state])
  {
    BOOL v11 = 0;
    BOOL v12 = 0;
  }
  else
  {
    BOOL v11 = [v8 state] == (id)1;
    BOOL v12 = [v9 state] == (id)1;
  }
  uint64_t v13 = +[MailStatusViewController signpostLog];
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, self);

  unsigned int v15 = +[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  uint64_t v16 = [v31 ef_publicDescription];
  v17 = [v8 ef_publicDescription];
  id v18 = v9;
  unsigned __int8 v19 = [v9 ef_publicDescription];
  v20 = +[NSString stringWithFormat:@"mailbox=%@\n    previously= %@\n    currently=  %@", v16, v17, v19];

  if (v11)
  {
    v21 = v30;
    v22 = v18;
    id v23 = +[MailStatusViewController signpostLog];
    v24 = v23;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)buf = 138543618;
      v33 = v15;
      __int16 v34 = 2114;
      uint64_t v35 = v20;
      uint64_t v25 = "%{public, signpost.telemetry:string1}@\nBegin: %{public, signpost.telemetry:string2}@ enableTelemetry=YES ";
      v26 = v24;
      os_signpost_type_t v27 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_15:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, v27, v14, "Mail Status Activity", v25, buf, 0x16u);
    }
  }
  else
  {
    v21 = v30;
    v22 = v18;
    if (v12)
    {
      BOOL v28 = +[MailStatusViewController signpostLog];
      v24 = v28;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_DWORD *)buf = 138543618;
        v33 = v15;
        __int16 v34 = 2114;
        uint64_t v35 = v20;
        uint64_t v25 = "%{public, signpost.telemetry:string1}@\nEnd: %{public, signpost.telemetry:string2}@ enableTelemetry=YES ";
        v26 = v24;
        os_signpost_type_t v27 = OS_SIGNPOST_INTERVAL_END;
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v29 = +[MailStatusViewController signpostLog];
      v24 = v29;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_DWORD *)buf = 138543618;
        v33 = v15;
        __int16 v34 = 2114;
        uint64_t v35 = v20;
        uint64_t v25 = "%{public, signpost.telemetry:string1}@\n"
              "Event: %{public, signpost.telemetry:string2}@ enableTelemetry=YES ";
        v26 = v24;
        os_signpost_type_t v27 = OS_SIGNPOST_EVENT;
        goto LABEL_15;
      }
    }
  }
}

+ (id)signpostLog
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000865C;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699790 != -1) {
    dispatch_once(&qword_100699790, block);
  }
  v2 = (void *)qword_100699788;

  return v2;
}

- (NSArray)activityStatusMailboxes
{
  return self->_activityStatusMailboxes;
}

- (MailStatusObserver)statusObserver
{
  return self->_statusObserver;
}

- (void)stopObserving
{
  objc_storeWeak((id *)&self->_delegate, 0);
  id v3 = +[MailStatusViewController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v7 = self;
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%p Set delegate:%@", buf, 0x16u);
  }

  id v4 = [(MailStatusViewController *)self mailboxStatusScheduler];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015A44;
  v5[3] = &unk_1006047A0;
  v5[4] = self;
  [v4 performBlock:v5];
}

- (void)startObservingForVisibleMailboxes:(id)a3 delegate:(id)a4 filterPredicate:(id)a5 label:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  os_signpost_id_t v14 = [(MailStatusViewController *)self mailboxStatusScheduler];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000159DC;
  v15[3] = &unk_1006047A0;
  v15[4] = self;
  [v14 performBlock:v15];

  [(MailStatusViewController *)self startObservingForActivityStatusMailboxes:v10 badgeCountStatusMailboxes:v10 delegate:v11 filterPredicate:v12 label:v13];
}

- (void)startObservingForActivityStatusMailboxes:(id)a3 badgeCountStatusMailboxes:(id)a4 delegate:(id)a5 filterPredicate:(id)a6 label:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_storeWeak((id *)&self->_delegate, v14);
  v17 = +[MailStatusViewController log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v29 = self;
    __int16 v30 = 2112;
    id v31 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%p Set delegate:%@", buf, 0x16u);
  }

  id v18 = [(MailStatusViewController *)self mailboxStatusScheduler];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10004DD08;
  v23[3] = &unk_100608708;
  v23[4] = self;
  id v19 = v12;
  id v24 = v19;
  id v20 = v13;
  id v25 = v20;
  id v21 = v15;
  id v26 = v21;
  id v22 = v16;
  id v27 = v22;
  [v18 performBlock:v23];
}

- (void)setBadgeCountStatusMailboxes:(id)a3
{
}

- (void)setActivityStatusMailboxes:(id)a3
{
}

- (MailStatusViewController)initWithMailboxRepository:(id)a3 outgoingMessageRepository:(id)a4 scene:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)MailStatusViewController;
  id v12 = [(MailStatusViewController *)&v29 init];
  if (v12)
  {
    id v13 = -[MailStatusBarView initWithFrame:]([MailStatusBarView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    statusBarView = v12->_statusBarView;
    v12->_statusBarView = v13;

    [(MailStatusBarView *)v12->_statusBarView setDelegate:v12];
    [(MailStatusBarView *)v12->_statusBarView setTarget:v12 withAction:"_subtitlePressed"];
    [(MailStatusBarView *)v12->_statusBarView setDelegate:v12];
    uint64_t v15 = [(MailStatusBarView *)v12->_statusBarView tintColor];
    statusBarViewTintColor = v12->_statusBarViewTintColor;
    v12->_statusBarViewTintColor = (UIColor *)v15;

    v17 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithCustomView:v12->_statusBarView];
    mailStatusBarButtonItem = v12->_mailStatusBarButtonItem;
    v12->_mailStatusBarButtonItem = v17;

    objc_storeStrong((id *)&v12->_mailboxRepository, a3);
    objc_storeStrong((id *)&v12->_outgoingMessageRepository, a4);
    id v19 = [[MailStatusObserver alloc] initWithMailboxRepository:v12->_mailboxRepository delegate:v12];
    statusObserver = v12->_statusObserver;
    v12->_statusObserver = v19;

    uint64_t v21 = objc_opt_new();
    mailboxStatusInfos = v12->_mailboxStatusInfos;
    v12->_mailboxStatusInfos = (NSMutableDictionary *)v21;

    id v23 = +[NSString stringWithFormat:@"com.apple.mobilemail.%@.scheduler", objc_opt_class()];
    uint64_t v24 = +[EFScheduler serialDispatchQueueSchedulerWithName:v23];
    mailboxStatusScheduler = v12->_mailboxStatusScheduler;
    v12->_mailboxStatusScheduler = (EFScheduler *)v24;

    *(void *)&v12->_statusInfoLock._os_unfair_lock_opaque = 0;
    v12->_hasDelayedMessagesLock._os_unfair_lock_opaque = 0;
    id v26 = objc_alloc_init(MailStatusInfo);
    statusInfo = v12->_statusInfo;
    v12->_statusInfo = v26;

    objc_storeWeak((id *)&v12->_scene, v11);
    v12->_BOOL hasDelayedMessages = 0;
  }

  return v12;
}

- (NSArray)badgeCountStatusMailboxes
{
  return self->_badgeCountStatusMailboxes;
}

- (void)_performStatusUpdateAndSignpostForMailboxObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [(MailStatusViewController *)self mailboxStatusScheduler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002F1F0;
  v7[3] = &unk_100604618;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

- (EFScheduler)mailboxStatusScheduler
{
  return self->_mailboxStatusScheduler;
}

- (BOOL)shouldShowSubtitle
{
  v2 = [(MailStatusViewController *)self delegate];
  unsigned __int8 v3 = [v2 shouldShowSubtitle];

  return v3;
}

- (MailStatusDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MailStatusDelegate *)WeakRetained;
}

- (id)mailboxQualifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v3 = [WeakRetained mailboxQualifier];

  return v3;
}

- (unint64_t)signpostID
{
  unsigned __int8 v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (void)_subtitlePressed
{
  unsigned __int8 v3 = [(MailStatusViewController *)self pressedBlock];

  if (v3)
  {
    os_signpost_id_t v4 = [(MailStatusViewController *)self pressedBlock];
    v4[2]();
  }
}

- (int64_t)currentState
{
  v2 = [(MailStatusViewController *)self statusInfo];
  id v3 = [v2 state];

  return (int64_t)v3;
}

- (void)currentStatusInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MailStatusViewController *)self mailboxStatusScheduler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100127410;
  v7[3] = &unk_1006051E0;
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  [v5 performBlock:v7];
}

- (int64_t)interfaceOrientation
{
  v2 = [(MailStatusViewController *)self scene];
  id v3 = [v2 interfaceOrientation];

  return (int64_t)v3;
}

- (void)tintColorDidChange
{
  id v3 = [(MailStatusViewController *)self statusBarView];
  id v4 = [v3 tintColor];
  [(MailStatusViewController *)self setStatusBarViewTintColor:v4];

  [(MailStatusViewController *)self _performStatusUpdate];
}

- (void)mailStatusBarViewUndoButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained mailStatusViewControllerUndoButtonTapped:self];
}

- (void)hasDelayedMessagesDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  p_hasDelayedMessagesLock = &self->_hasDelayedMessagesLock;
  os_unfair_lock_lock(&self->_hasDelayedMessagesLock);
  if (self->_hasDelayedMessages == v3)
  {
    os_unfair_lock_unlock(p_hasDelayedMessagesLock);
  }
  else
  {
    self->_BOOL hasDelayedMessages = v3;
    os_unfair_lock_unlock(p_hasDelayedMessagesLock);
    [(MailStatusViewController *)self _performStatusUpdate];
  }
}

- (id)accountStatusErrorAttributedStringForAccountWithErrors:(id)a3
{
  id v4 = a3;
  NSAttributedStringKey v23 = NSForegroundColorAttributeName;
  id v5 = +[UIColor systemGrayColor];
  uint64_t v24 = v5;
  id v20 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];

  if ([v4 count] == (id)1)
  {
    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"ACCOUNT_ERROR" value:&stru_100619928 table:@"Main"];
    id v8 = [v4 firstObject];
    id v9 = [v8 name];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);
  }
  else
  {
    id v6 = +[NSBundle mainBundle];
    id v10 = [v6 localizedStringForKey:@"ACCOUNT_ERRORS" value:&stru_100619928 table:@"Main"];
  }

  id v11 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v10 attributes:v20];
  NSAttributedStringKey v21 = NSForegroundColorAttributeName;
  id v12 = [(MailStatusViewController *)self statusBarViewTintColor];
  id v22 = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

  id v14 = objc_alloc((Class)NSAttributedString);
  uint64_t v15 = +[NSBundle mainBundle];
  id v16 = [v15 localizedStringForKey:@"ACCOUNT_ERROR_DETAILS" value:&stru_100619928 table:@"Main"];
  id v17 = [v14 initWithString:v16 attributes:v13];

  id v18 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
  [v11 appendAttributedString:v18];

  [v11 appendAttributedString:v17];

  return v11;
}

- (id)actionBlockForAccountError:(id)a3 error:(id)a4 description:(id)a5 failureReason:(id)a6
{
  id v9 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  if ([v9 count] == (id)1)
  {
    id v10 = [v31 code];
    id v11 = +[MFError errorWithDomain:MFMessageErrorDomain code:v10 localizedDescription:v30];
    [v11 setUserInfoObject:v29 forKey:NSLocalizedFailureReasonErrorKey];
    id v12 = [v9 firstObject];
    id v13 = [v12 objectID];
    id v14 = [v13 representedObjectID];

    uint64_t v15 = +[MailAccount accountWithUniqueId:v14];
  }
  else
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100128044;
    v35[3] = &unk_100608F30;
    id v36 = v31;
    id v16 = [v9 ef_compactMap:v35];
    id v17 = objc_alloc_init((Class)MUILocalizationListFormatter);
    id v18 = [v17 localizedStringFromList:v16];
    id v19 = +[NSBundle mainBundle];
    id v20 = [v19 localizedStringForKey:@"MULTIPLE_ACCOUNT_ERRORS_DESCRIPTION %@" value:&stru_100619928 table:@"Main"];
    NSAttributedStringKey v21 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v18);

    id v22 = +[NSBundle mainBundle];
    NSAttributedStringKey v23 = [v22 localizedStringForKey:@"MULTIPLE_ACCOUNT_ERRORS" value:&stru_100619928 table:@"Main"];
    id v11 = +[MFError errorWithDomain:MFMessageErrorDomain code:1042 localizedDescription:v21 title:v23 userInfo:0];

    uint64_t v15 = 0;
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10012816C;
  v32[3] = &unk_100604618;
  id v33 = v11;
  id v34 = v15;
  id v24 = v15;
  id v25 = v11;
  id v26 = objc_retainBlock(v32);
  id v27 = objc_retainBlock(v26);

  return v27;
}

- (void)setMailStatusBarButtonItem:(id)a3
{
}

- (void)setStatusBarView:(id)a3
{
}

- (UIColor)statusBarViewTintColor
{
  return self->_statusBarViewTintColor;
}

- (void)setStatusBarViewTintColor:(id)a3
{
}

- (EMMailboxRepository)mailboxRepository
{
  return self->_mailboxRepository;
}

- (void)setMailboxRepository:(id)a3
{
}

- (void)setOutgoingMessageRepository:(id)a3
{
}

- (void)setStatusObserver:(id)a3
{
}

- (EFCancelable)progressObserverCancelable
{
  return self->_progressObserverCancelable;
}

- (void)setProgressObserverCancelable:(id)a3
{
}

- (id)pressedBlock
{
  return self->_pressedBlock;
}

- (void)setDelegate:(id)a3
{
}

- (void)setMailboxStatusInfos:(id)a3
{
}

- (MailMainScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (MailMainScene *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_mailboxStatusInfos, 0);
  objc_storeStrong((id *)&self->_badgeCountStatusMailboxes, 0);
  objc_storeStrong((id *)&self->_activityStatusMailboxes, 0);
  objc_storeStrong((id *)&self->_mailboxStatusScheduler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_pressedBlock, 0);
  objc_storeStrong((id *)&self->_progressObserverCancelable, 0);
  objc_storeStrong((id *)&self->_statusObserver, 0);
  objc_storeStrong((id *)&self->_outgoingMessageRepository, 0);
  objc_storeStrong((id *)&self->_mailboxRepository, 0);
  objc_storeStrong((id *)&self->_statusBarViewTintColor, 0);
  objc_storeStrong((id *)&self->_statusBarView, 0);
  objc_storeStrong((id *)&self->_mailStatusBarButtonItem, 0);

  objc_storeStrong((id *)&self->_statusInfo, 0);
}

@end