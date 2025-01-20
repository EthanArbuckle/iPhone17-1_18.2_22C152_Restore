@interface SharedMailboxController
+ (id)allSharedInstances;
+ (id)sharedInstanceForSourceType:(unint64_t)a3;
+ (id)sharedInstanceMapping;
+ (id)sharedSmartMailboxForSourceType:(unint64_t)a3;
- (BOOL)alwaysActiveCountQuery;
- (BOOL)isObserving;
- (BOOL)shouldBeDisplayed;
- (BOOL)wantsDisclosureButton;
- (CGPoint)iconOffset;
- (EFCancelable)unreadCountToken;
- (EFDebouncer)badgeCountDebouncer;
- (EFSuspendableScheduler)scheduler;
- (EMMailboxScope)serverCountMailboxScope;
- (EMSmartMailbox)mailbox;
- (NSPredicate)unscopedCountPredicate;
- (SharedMailboxController)initWithType:(unint64_t)a3;
- (id)applicationShortcutIconImage;
- (id)applicationShortcutIconName;
- (id)criterion;
- (id)icon;
- (id)iconImage;
- (id)iconTintColor;
- (id)lastInitialBadgeCountDefaultKey;
- (id)mailboxTitle;
- (id)navigationTitle;
- (id)selectedIconTintColor;
- (id)startCountQuery;
- (int64_t)badgeCount;
- (unint64_t)sourceType;
- (void)_startCountQueryIfNeededWithToken:(id)a3;
- (void)_startCountQueryWithToken:(id)a3;
- (void)_updateMailboxes;
- (void)dealloc;
- (void)invalidateIcon;
- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5;
- (void)presentFromSelectionTarget:(id)a3 item:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6;
- (void)resume;
- (void)setBadgeCount:(int64_t)a3;
- (void)setBadgeCount:(int64_t)a3 notifyChange:(BOOL)a4;
- (void)setIsObserving:(BOOL)a3;
- (void)setMailbox:(id)a3;
- (void)setSourceType:(unint64_t)a3;
- (void)setUnreadCountToken:(id)a3;
- (void)suspend;
@end

@implementation SharedMailboxController

+ (id)allSharedInstances
{
  v2 = [a1 sharedInstanceMapping];
  v3 = [v2 allValues];

  return v3;
}

- (id)startCountQuery
{
  id v3 = objc_alloc((Class)EFCancelationToken);
  v4 = [(id)objc_opt_class() description];
  id v5 = [v3 initWithLabel:v4];

  if (![(SharedMailboxController *)self alwaysActiveCountQuery])
  {
    scheduler = self->_scheduler;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100057B54;
    v9[3] = &unk_1006065D8;
    v9[4] = self;
    v7 = [(EFSuspendableScheduler *)scheduler performCancelableBlock:v9];
    [v5 addCancelable:v7];
  }

  return v5;
}

- (void)resume
{
  [(EFSuspendableScheduler *)self->_scheduler resume];
  if ([(SharedMailboxController *)self alwaysActiveCountQuery])
  {
    scheduler = self->_scheduler;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100057560;
    v5[3] = &unk_1006065D8;
    v5[4] = self;
    id v4 = [(EFSuspendableScheduler *)scheduler performCancelableBlock:v5];
  }
}

- (BOOL)alwaysActiveCountQuery
{
  return 0;
}

- (void)setBadgeCount:(int64_t)a3 notifyChange:(BOOL)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_badgeCount == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_int64_t badgeCount = a3;
    v8 = +[NSUserDefaults standardUserDefaults];
    int64_t badgeCount = self->_badgeCount;
    v10 = [(SharedMailboxController *)self lastInitialBadgeCountDefaultKey];
    [v8 setInteger:badgeCount forKey:v10];

    os_unfair_lock_unlock(p_lock);
    if (a4)
    {
      uint64_t v14 = SharedNetworkControllerBadgeCountKey;
      v11 = +[NSNumber numberWithInteger:a3];
      v15 = v11;
      v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

      v13 = +[NSNotificationCenter defaultCenter];
      [v13 postNotificationName:SharedMailboxControllerBadgeCountDidChangeNotification object:self userInfo:v12];
    }
  }
}

- (void)setBadgeCount:(int64_t)a3
{
}

+ (id)sharedInstanceForSourceType:(unint64_t)a3
{
  if (a3 && _MSSourceTypeIsValid())
  {
    v6 = [a1 sharedInstanceMapping];
    v7 = +[NSNumber numberWithUnsignedInteger:a3];
    v8 = [v6 objectForKeyedSubscript:v7];

    int IsValid = _MSSourceTypeIsValid();
    if (v8) {
      int v10 = 0;
    }
    else {
      int v10 = IsValid;
    }
    if (v10 == 1)
    {
      v11 = +[NSAssertionHandler currentHandler];
      [v11 handleFailureInMethod:a2 object:a1 file:@"SharedMailboxController.m" lineNumber:146 description:@"Unsupported source type"];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)sharedInstanceMapping
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005369C;
  v4[3] = &unk_10060DF88;
  v4[4] = a2;
  v4[5] = a1;
  if (qword_100699EC8 != -1) {
    dispatch_once(&qword_100699EC8, v4);
  }
  v2 = (void *)qword_100699EC0;

  return v2;
}

- (void)_startCountQueryIfNeededWithToken:(id)a3
{
  id v4 = a3;
  id v5 = [(SharedMailboxController *)self unreadCountToken];
  v6 = v5;
  if (v5) {
    unsigned int v7 = [v5 isCanceled];
  }
  else {
    unsigned int v7 = 1;
  }
  v8 = sub_10004B9AC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = v7;
    __int16 v10 = 2114;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting count query %{BOOL}d token: %{public}@", (uint8_t *)v9, 0x12u);
  }

  if (v7)
  {
    [(SharedMailboxController *)self _updateMailboxes];
    [(SharedMailboxController *)self _startCountQueryWithToken:v4];
  }
}

- (EFCancelable)unreadCountToken
{
  return self->_unreadCountToken;
}

- (void)_updateMailboxes
{
  [(EFSuspendableScheduler *)self->_scheduler assertIsExecuting:1];
  id v3 = +[UIApplication sharedApplication];
  id v4 = [v3 accountsProvider];
  id v5 = [v4 displayedAccounts];

  id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v5 count]];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      __int16 v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) primaryMailboxUid:v14];
        [v6 addObject:v11];

        __int16 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (NSArray *)[v6 copy];
  mailboxes = self->_mailboxes;
  self->_mailboxes = v12;
}

- (void)_startCountQueryWithToken:(id)a3
{
  id v4 = a3;
  [(EFSuspendableScheduler *)self->_scheduler assertIsExecuting:1];
  id v5 = [(SharedMailboxController *)self unreadCountToken];
  [v5 cancel];

  [(SharedMailboxController *)self setUnreadCountToken:0];
  id v6 = [(SharedMailboxController *)self unscopedCountPredicate];
  id v7 = [v6 copy];

  id v8 = [(SharedMailboxController *)self mailbox];
  uint64_t v9 = [v8 mailboxScope];
  __int16 v10 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v9];

  if (v10)
  {
    v29[0] = v7;
    v29[1] = v10;
    v11 = +[NSArray arrayWithObjects:v29 count:2];
    uint64_t v12 = +[NSCompoundPredicate andPredicateWithSubpredicates:v11];

    id v7 = (id)v12;
  }
  if (v7 && [(NSArray *)self->_mailboxes count])
  {
    v13 = +[UIApplication sharedApplication];
    long long v14 = [v13 focusController];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10004B5AC;
    v18[3] = &unk_10060DFD0;
    v18[4] = self;
    id v19 = v7;
    id v20 = v4;
    [v14 getCurrentFocus:v18];
  }
  else
  {
    sub_10004B9AC();
    long long v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (id)objc_opt_class();
      NSUInteger v17 = [(NSArray *)self->_mailboxes count];
      *(_DWORD *)buf = 138544130;
      id v22 = v16;
      __int16 v23 = 2048;
      v24 = v10;
      __int16 v25 = 2048;
      id v26 = v7;
      __int16 v27 = 2048;
      NSUInteger v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ not starting query: scopePredicate: %p, countPredicate: %p, _mailboxes.count %ld", buf, 0x2Au);
    }
  }
}

- (EMSmartMailbox)mailbox
{
  return self->_mailbox;
}

- (void)setUnreadCountToken:(id)a3
{
}

- (EMMailboxScope)serverCountMailboxScope
{
  return 0;
}

- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5
{
  id v7 = [(SharedMailboxController *)self badgeCountDebouncer];
  id v6 = +[NSNumber numberWithInteger:a5];
  [v7 debounceResult:v6];
}

- (EFDebouncer)badgeCountDebouncer
{
  return self->_badgeCountDebouncer;
}

- (SharedMailboxController)initWithType:(unint64_t)a3
{
  v23.receiver = self;
  v23.super_class = (Class)SharedMailboxController;
  id v4 = [(SharedMailboxController *)&v23 init];
  id v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_sourceType = a3;
    uint64_t v6 = [(id)objc_opt_class() sharedSmartMailboxForSourceType:a3];
    mailbox = v5->_mailbox;
    v5->_mailbox = (EMSmartMailbox *)v6;

    id v8 = +[NSString stringWithFormat:@"com.apple.mobilemail.%@", objc_opt_class()];
    uint64_t v9 = +[EFScheduler serialDispatchQueueSchedulerWithName:v8];
    scheduler = v5->_scheduler;
    v5->_scheduler = (EFSuspendableScheduler *)v9;

    [(EFSuspendableScheduler *)v5->_scheduler suspend];
    v11 = +[NSUserDefaults standardUserDefaults];
    uint64_t v12 = [(SharedMailboxController *)v5 lastInitialBadgeCountDefaultKey];
    v5->_int64_t badgeCount = (int64_t)[v11 integerForKey:v12];

    uint64_t v13 = [(SharedMailboxController *)v5 unreadCriterion];
    criterion = v5->_criterion;
    v5->_criterion = (MFMessageCriterion *)v13;

    id v15 = objc_alloc((Class)EFDebouncer);
    id v16 = +[EFScheduler mainThreadScheduler];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002021C;
    v21[3] = &unk_100605780;
    NSUInteger v17 = v5;
    id v22 = v17;
    v18 = (EFDebouncer *)[v15 initWithTimeInterval:v16 scheduler:1 startAfter:v21 block:0.2];
    badgeCountDebouncer = v17->_badgeCountDebouncer;
    v17->_badgeCountDebouncer = v18;
  }
  return v5;
}

- (id)lastInitialBadgeCountDefaultKey
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  id v4 = +[NSString stringWithFormat:@"%@BadgeCount", v3];

  return v4;
}

+ (id)sharedSmartMailboxForSourceType:(unint64_t)a3
{
  if (qword_100699ED8 != -1) {
    dispatch_once(&qword_100699ED8, &stru_10060DFA8);
  }
  id v4 = (void *)qword_100699ED0;
  id v5 = +[NSNumber numberWithUnsignedInteger:a3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (void)dealloc
{
  [(EFCancelable *)self->_unreadCountToken cancel];
  [(EFDebouncer *)self->_badgeCountDebouncer cancel];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SharedMailboxController;
  [(SharedMailboxController *)&v4 dealloc];
}

- (void)suspend
{
}

- (int64_t)badgeCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t badgeCount = self->_badgeCount;
  os_unfair_lock_unlock(p_lock);
  return badgeCount;
}

- (BOOL)shouldBeDisplayed
{
  return 1;
}

- (id)mailboxTitle
{
  return 0;
}

- (id)navigationTitle
{
  return 0;
}

- (CGPoint)iconOffset
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)iconImage
{
  v2 = [(SharedMailboxController *)self iconImageName];
  id v3 = +[UIImage mf_systemImageNamed:v2 forView:7];

  return v3;
}

- (id)iconTintColor
{
  return 0;
}

- (id)selectedIconTintColor
{
  return +[UIColor mailInteractiveColor];
}

- (id)icon
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_icon)
  {
    objc_super v4 = [(SharedMailboxController *)self iconImage];
    icon = self->_icon;
    self->_icon = v4;
  }
  os_unfair_lock_unlock(p_lock);
  uint64_t v6 = self->_icon;

  return v6;
}

- (id)applicationShortcutIconImage
{
  return 0;
}

- (id)applicationShortcutIconName
{
  return [(SharedMailboxController *)self shortcutIconName];
}

- (void)invalidateIcon
{
  icon = self->_icon;
  self->_icon = 0;
}

- (id)criterion
{
}

- (void)presentFromSelectionTarget:(id)a3 item:(id)a4 accessoryTapped:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v9 = a4;
  [v10 selectCombinedInboxWithSourceType:[self sourceType] item:v9 animated:v6];
}

- (NSPredicate)unscopedCountPredicate
{
  return self->_unscopedCountPredicate;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (BOOL)wantsDisclosureButton
{
  return self->_wantsDisclosureButton;
}

- (void)setMailbox:(id)a3
{
}

- (EFSuspendableScheduler)scheduler
{
  return self->_scheduler;
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_badgeCountDebouncer, 0);
  objc_storeStrong((id *)&self->_unreadCountToken, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_unscopedCountPredicate, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end