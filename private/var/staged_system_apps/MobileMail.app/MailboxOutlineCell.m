@interface MailboxOutlineCell
+ (double)defaultRowHeight;
+ (id)log;
- (BOOL)_isCellEnabledForMailboxes;
- (BOOL)canMoveItem;
- (BOOL)currentUnreadCountQueryIncludesRead;
- (BOOL)flattenHierarchy;
- (BOOL)forceZeroSeparatorInset;
- (BOOL)hideBadgeCountForEditing;
- (BOOL)isCellEnabled;
- (BOOL)isDisabledForEditing;
- (BOOL)isExpandable;
- (BOOL)shouldExcludeBusinessMessages;
- (BOOL)shouldShowBadgeCountIfNecessary;
- (BOOL)showFocusIcon;
- (BOOL)showsDetailDisclosureButton;
- (BOOL)showsSelectionCheckmarkForEditing;
- (BOOL)useDisabledAppearance;
- (BOOL)useTintColor;
- (CGPoint)destinationPointForAnimation;
- (EFCancelable)unreadCountToken;
- (EFDebouncer)countDebouncer;
- (EMSmartMailbox)smartMailbox;
- (MailboxOutlineCell)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)separatorFlushLeadingConstraint;
- (NSString)subtitle;
- (NSString)title;
- (UIButton)detailsDisclosureButton;
- (UICellAccessoryCustomView)businessesAccessoryView;
- (UICellAccessoryCustomView)focusAccessoryView;
- (UIColor)iconTintColor;
- (UIColor)multiselectCheckmarkColor;
- (UIColor)selectedIconTintColor;
- (UIImage)icon;
- (double)_verticalPaddingForExpandableTitle;
- (id)_countQueryLabelForMailboxes:(id)a3;
- (id)_createMailboxesFromUids:(id)a3;
- (id)_scriptingInfo;
- (id)configurationState;
- (id)createIconBlock;
- (id)detailsDisclosureButtonIfShown;
- (int64_t)badgeCount;
- (int64_t)disclosureType;
- (void)_invalidateIcon;
- (void)_resetDebouncer;
- (void)_setMailboxes:(id)a3 observeCount:(BOOL)a4 unreadCountIncludesRead:(BOOL)a5;
- (void)_setUnreadCountMailboxes:(id)a3 unreadCountIncludesRead:(BOOL)a4;
- (void)_updateIndentationLevel;
- (void)_updateMailboxName;
- (void)_updateShouldExcludeBusinessMessages;
- (void)addTargetForDetailDisclosure:(id)a3 action:(SEL)a4;
- (void)bucketBarConfigurationController:(id)a3 isHidden:(BOOL)a4 forMailboxes:(id)a5;
- (void)bucketBarConfigurationControllerRequiresReload:(id)a3;
- (void)dealloc;
- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5;
- (void)prepareForReuse;
- (void)setBadgeCount:(int64_t)a3;
- (void)setBusinessesAccessoryView:(id)a3;
- (void)setCanMoveItem:(BOOL)a3;
- (void)setCellEnabled:(BOOL)a3;
- (void)setCreateIconBlock:(id)a3;
- (void)setCurrentUnreadCountQueryIncludesRead:(BOOL)a3;
- (void)setDetailsDisclosureButton:(id)a3;
- (void)setDisabledForEditing:(BOOL)a3;
- (void)setDisclosureType:(int64_t)a3;
- (void)setEditing:(BOOL)a3;
- (void)setExpandable:(BOOL)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setFlattenHierarchy:(BOOL)a3;
- (void)setFocusAccessoryView:(id)a3;
- (void)setForceZeroSeparatorInset:(BOOL)a3;
- (void)setHideBadgeCountForEditing:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIconTintColor:(id)a3;
- (void)setLegacyMailboxes:(id)a3;
- (void)setLegacyMailboxes:(id)a3 showUnreadCount:(BOOL)a4;
- (void)setLegacyMailboxes:(id)a3 showUnreadCount:(BOOL)a4 unreadCountIncludesRead:(BOOL)a5;
- (void)setMailboxes:(id)a3 observeCount:(BOOL)a4;
- (void)setMultiselectCheckmarkColor:(id)a3;
- (void)setSelectedIconTintColor:(id)a3;
- (void)setSeparatorFlushLeadingConstraint:(id)a3;
- (void)setShouldExcludeBusinessMessages:(BOOL)a3;
- (void)setShouldShowBadgeCountIfNecessary:(BOOL)a3;
- (void)setShowFocusIcon:(BOOL)a3;
- (void)setShowsDetailDisclosureButton:(BOOL)a3;
- (void)setShowsSelectionCheckmarkForEditing:(BOOL)a3;
- (void)setSmartMailbox:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUnreadCountToken:(id)a3;
- (void)setUseDisabledAppearance:(BOOL)a3;
- (void)setUseTintColor:(BOOL)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAccessories;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation MailboxOutlineCell

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EEB18;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_1006995C8 != -1) {
    dispatch_once(&qword_1006995C8, block);
  }
  v2 = (void *)qword_1006995C0;

  return v2;
}

+ (double)defaultRowHeight
{
  return 44.0;
}

- (MailboxOutlineCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MailboxOutlineCell;
  v3 = -[MailboxOutlineCell initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MailboxOutlineCell *)v3 _resetDebouncer];
    v4->_cellEnabled = 1;
    [(MailboxOutlineCell *)v4 setBadgeCount:0];
    [(MailboxOutlineCell *)v4 setShowFocusIcon:0];
    v5 = +[UIApplication sharedApplication];
    v6 = [v5 bucketBarConfigurationController];
    [v6 addConfigurationObserver:v4];
  }
  return v4;
}

- (void)dealloc
{
  [(EFCancelable *)self->_unreadCountToken cancel];
  [(EFDebouncer *)self->_countDebouncer cancel];
  v3 = +[UIApplication sharedApplication];
  v4 = [v3 bucketBarConfigurationController];
  [v4 removeConfigurationObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)MailboxOutlineCell;
  [(MailboxOutlineCell *)&v5 dealloc];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)MailboxOutlineCell;
  [(MailboxOutlineCell *)&v4 prepareForReuse];
  [(MailboxOutlineCell *)self setForceZeroSeparatorInset:0];
  [(MailboxOutlineCell *)self setExpandable:0];
  [(MailboxOutlineCell *)self setExpanded:0];
  [(MailboxOutlineCell *)self setFlattenHierarchy:0];
  [(MailboxOutlineCell *)self setShowsDetailDisclosureButton:0];
  [(MailboxOutlineCell *)self setCanMoveItem:0];
  [(MailboxOutlineCell *)self setShowsSelectionCheckmarkForEditing:0];
  [(MailboxOutlineCell *)self setHideBadgeCountForEditing:0];
  [(MailboxOutlineCell *)self setShowFocusIcon:0];
  [(MailboxOutlineCell *)self setAccessories:&__NSArray0__struct];
  [(MailboxOutlineCell *)self setSubtitle:0];
  [(MailboxOutlineCell *)self setIcon:0];
  [(MailboxOutlineCell *)self setIconTintColor:0];
  [(MailboxOutlineCell *)self setSelectedIconTintColor:0];
  [(MailboxOutlineCell *)self setCellEnabled:1];
  [(MailboxOutlineCell *)self setDisabledForEditing:0];
  [(MailboxOutlineCell *)self setMailboxes:0 observeCount:0];
  v3 = [(MailboxOutlineCell *)self detailsDisclosureButton];
  [v3 removeTarget:0 action:0 forControlEvents:64];
}

- (void)_resetDebouncer
{
  countDebouncer = self->_countDebouncer;
  if (countDebouncer)
  {
    [(EFDebouncer *)countDebouncer cancel];
    objc_super v5 = self->_countDebouncer;
    self->_countDebouncer = 0;
  }
  if ([(MailboxOutlineCell *)self shouldShowBadgeCountIfNecessary])
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v6 = objc_alloc((Class)EFDebouncer);
    v7 = +[EFScheduler mainThreadScheduler];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000EF030;
    v10[3] = &unk_100607AE0;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a2;
    objc_super v8 = (EFDebouncer *)[v6 initWithTimeInterval:v7 scheduler:1 startAfter:v10 block:0.2];
    v9 = self->_countDebouncer;
    self->_countDebouncer = v8;

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

- (void)_updateShouldExcludeBusinessMessages
{
  if (EMBlackPearlIsFeatureEnabled())
  {
    v3 = [(MailboxOutlineCell *)self smartMailbox];
    if ([v3 smartMailboxType] == (id)8 && (objc_msgSend(v3, "isInboxMailbox") & 1) != 0) {
      uint64_t mailboxes = 1;
    }
    else {
      uint64_t mailboxes = (uint64_t)[(NSArray *)self->_mailboxes ef_any:&stru_100607B00];
    }
    objc_super v5 = +[UIApplication sharedApplication];
    id v6 = [v5 bucketBarConfigurationController];

    if (mailboxes)
    {
      BOOL v7 = v3 != 0;
      if (v3)
      {
        v9 = v3;
        uint64_t mailboxes = +[NSArray arrayWithObjects:&v9 count:1];
      }
      else
      {
        uint64_t mailboxes = (uint64_t)self->_mailboxes;
      }
      uint64_t v8 = [v6 isBucketBarHiddenForMailboxes:mailboxes] ^ 1;
    }
    else
    {
      BOOL v7 = 0;
      uint64_t v8 = 0;
    }
    [(MailboxOutlineCell *)self setShouldExcludeBusinessMessages:v8];
    if (v7) {
  }
    }
}

- (void)setMailboxes:(id)a3 observeCount:(BOOL)a4
{
  BOOL v4 = a4;
  legacyMailboxes = self->_legacyMailboxes;
  self->_legacyMailboxes = 0;
  id v7 = a3;

  [(MailboxOutlineCell *)self _setMailboxes:v7 observeCount:v4 unreadCountIncludesRead:0];
}

- (void)_setMailboxes:(id)a3 observeCount:(BOOL)a4 unreadCountIncludesRead:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v11 = a3;
  uint64_t v8 = (NSArray *)[v11 copy];
  uint64_t mailboxes = self->_mailboxes;
  self->_uint64_t mailboxes = v8;

  [(MailboxOutlineCell *)self _updateShouldExcludeBusinessMessages];
  [(MailboxOutlineCell *)self setShouldShowBadgeCountIfNecessary:[(NSArray *)self->_mailboxes count] != 0];
  if (v6)
  {
    if ([(NSArray *)self->_mailboxes count]) {
      id v10 = v11;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  [(MailboxOutlineCell *)self _setUnreadCountMailboxes:v10 unreadCountIncludesRead:v5];
}

- (void)setLegacyMailboxes:(id)a3
{
}

- (void)setLegacyMailboxes:(id)a3 showUnreadCount:(BOOL)a4
{
}

- (void)setLegacyMailboxes:(id)a3 showUnreadCount:(BOOL)a4 unreadCountIncludesRead:(BOOL)a5
{
  BOOL v30 = a5;
  BOOL v5 = a4;
  id v9 = a3;
  p_legacyMailboxes = &self->_legacyMailboxes;
  unsigned int v11 = [v9 isEqualToSet:self->_legacyMailboxes];
  if ((v11 & 1) == 0)
  {
    v12 = +[NSNotificationCenter defaultCenter];
    uint64_t v13 = MFMailboxUidWasRenamedNotification;
    [v12 removeObserver:self name:MFMailboxUidWasRenamedNotification object:0];

    v14 = [(MailboxOutlineCell *)self unreadCountToken];
    [v14 cancel];

    [(MailboxOutlineCell *)self setUnreadCountToken:0];
    objc_storeStrong((id *)&self->_legacyMailboxes, a3);
    if ((id)[(NSSet *)*p_legacyMailboxes count] == (id)1)
    {
      v15 = [(NSSet *)*p_legacyMailboxes anyObject];
      v16 = sub_100216B30();
      v17 = [v15 iconFromBundle:v16];
      [(MailboxOutlineCell *)self setIcon:v17];

      v18 = +[NSNotificationCenter defaultCenter];
      [v18 addObserver:self selector:"_updateMailboxName" name:v13 object:v15];
    }
  }
  v19 = +[MailboxOutlineCell log];
  int v20 = v11 ^ 1;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = objc_opt_class();
    v22 = NSStringFromSelector(a2);
    unsigned int v23 = [(MailboxOutlineCell *)self shouldShowBadgeCountIfNecessary];
    BOOL v24 = *p_legacyMailboxes != 0;
    *(_DWORD *)buf = 138544898;
    uint64_t v32 = v21;
    __int16 v33 = 2048;
    v34 = self;
    __int16 v35 = 2114;
    v36 = v22;
    __int16 v37 = 1024;
    unsigned int v38 = v23;
    __int16 v39 = 1024;
    BOOL v40 = v5;
    __int16 v41 = 1024;
    int v42 = v20;
    __int16 v43 = 1024;
    BOOL v44 = v24;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<%{public}@ : %p> %{public}@ - shouldShowBadgeCountIfNecessary:(%{BOOL}d, %{BOOL}d) mailboxesChanged:%{BOOL}d has _legacyMailboxes:%{BOOL}d", buf, 0x38u);
  }
  if ([(MailboxOutlineCell *)self shouldShowBadgeCountIfNecessary] ^ v5 | v20)
  {
    [(MailboxOutlineCell *)self setBadgeCount:0];
    [(MailboxOutlineCell *)self setShouldShowBadgeCountIfNecessary:v5];
    if ([(MailboxOutlineCell *)self shouldShowBadgeCountIfNecessary]
      && *p_legacyMailboxes)
    {
      v25 = [v9 allObjects];
      v26 = [(MailboxOutlineCell *)self _createMailboxesFromUids:v25];

      if (![v26 count])
      {
        v27 = +[MailboxOutlineCell log];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          v28 = +[UIApplication sharedApplication];
          v29 = [v28 mailboxProvider];
          sub_10045A254(v29, buf, v27, v28);
        }
      }
      [(MailboxOutlineCell *)self _setMailboxes:v26 observeCount:1 unreadCountIncludesRead:v30];
    }
    else
    {
      [(MailboxOutlineCell *)self _resetDebouncer];
    }
  }
  [(MailboxOutlineCell *)self _updateMailboxName];
}

- (id)_createMailboxesFromUids:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[UIApplication sharedApplication];
  BOOL v5 = [v4 mailboxProvider];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000EF958;
  v9[3] = &unk_100607B28;
  id v10 = v5;
  id v6 = v5;
  id v7 = [v3 ef_compactMap:v9];

  return v7;
}

- (void)_setUnreadCountMailboxes:(id)a3 unreadCountIncludesRead:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v8 = [(MailboxOutlineCell *)self unreadCountToken];
  [v8 cancel];

  [(MailboxOutlineCell *)self setUnreadCountToken:0];
  [(MailboxOutlineCell *)self _resetDebouncer];
  if (v7 && [v7 count])
  {
    id v9 = +[EMMessageListItemPredicates predicateForMessagesInMailboxes:self->_mailboxes];
    v26 = +[NSMutableArray arrayWithObject:v9];

    unsigned int v10 = [(MailboxOutlineCell *)self shouldExcludeBusinessMessages];
    if (v10)
    {
      unsigned int v11 = +[EMMessageListItemPredicates predicateForPrimaryMessages];
      [v26 addObject:v11];
    }
    if (!v4)
    {
      v12 = +[EMMessageListItemPredicates predicateForUnreadMessages];
      [v26 addObject:v12];
    }
    BOOL v24 = +[NSCompoundPredicate ef_andCompoundPredicateWithSubpredicates:v26];
    v25 = [(MailboxOutlineCell *)self _countQueryLabelForMailboxes:v7];
    id v13 = [objc_alloc((Class)EMQuery) initWithTargetClass:objc_opt_class() predicate:v24 sortDescriptors:&__NSArray0__struct queryOptions:0 label:v25];
    if (v10)
    {
      v14 = [v7 ef_filter:&stru_100607B48];
      v15 = [v14 ef_mapSelector:@"objectID"];
    }
    else
    {
      v15 = [v7 ef_mapSelector:@"objectID"];
    }
    if ([v15 count])
    {
      v16 = +[EMMailboxScope mailboxScopeForMailboxObjectIDs:v15 forExclusion:0];
    }
    else
    {
      v16 = 0;
    }
    v17 = +[MailboxOutlineCell log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_opt_class();
      v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138544642;
      uint64_t v28 = v18;
      __int16 v29 = 2048;
      BOOL v30 = self;
      __int16 v31 = 2114;
      uint64_t v32 = v19;
      __int16 v33 = 2114;
      id v34 = v13;
      __int16 v35 = 2114;
      v36 = v25;
      __int16 v37 = 1024;
      unsigned int v38 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<%{public}@ : %p> %{public}@ - start counting query with query:%{public}@ label:%{public}@ shouldExcludeBusinessMessages:%{BOOL}d", buf, 0x3Au);
    }
    [(MailboxOutlineCell *)self setCurrentUnreadCountQueryIncludesRead:v4];
    int v20 = +[UIApplication sharedApplication];
    uint64_t v21 = [v20 daemonInterface];
    v22 = [v21 messageRepository];
    unsigned int v23 = [v22 startCountingQuery:v13 includingServerCountsForMailboxScope:v16 withObserver:self];
    [(MailboxOutlineCell *)self setUnreadCountToken:v23];
  }
}

- (id)_countQueryLabelForMailboxes:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 firstObject];
  BOOL v5 = [v4 name];
  if (([v4 descriptionUsesRealName] & 1) == 0)
  {
    id v6 = +[EFPrivacy fullyOrPartiallyRedactedStringForString:v5];

    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Generic mailbox %@", v6];
    BOOL v5 = v7;
  }
  if ((unint64_t)[v3 count] < 2)
  {
    uint64_t v8 = &stru_100619928;
  }
  else
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" mailboxes:%lu", [v3 count]);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  id v9 = objc_alloc((Class)NSString);
  unsigned int v10 = [v4 accountIdentifier];
  id v11 = [v9 initWithFormat:@"%@ (accountID: %@)%@", v5, v10, v8];

  return v11;
}

- (void)setBadgeCount:(int64_t)a3
{
  if (self->_badgeCount != a3)
  {
    self->_badgeCount = a3;
    id v6 = +[MailboxOutlineCell log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138544130;
      uint64_t v13 = v7;
      __int16 v14 = 2048;
      v15 = self;
      __int16 v16 = 2114;
      v17 = v8;
      __int16 v18 = 2048;
      int64_t v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@ : %p> %{public}@ - count:%li", buf, 0x2Au);
    }
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v10 = [v9 localizedStringForKey:@"UNREAD_COUNT_FORMAT%1$lu" value:&stru_100619928 table:@"Main"];
    id v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, a3);
    [(MailboxOutlineCell *)self setAccessibilityValue:v11];

    [(MailboxOutlineCell *)self updateAccessories];
  }
}

- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5
{
  BOOL v5 = +[EFScheduler mainThreadScheduler];
  [v5 performBlock:&v6];
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MailboxOutlineCell;
  -[MailboxOutlineCell setEditing:](&v8, "setEditing:");
  int v5 = _os_feature_enabled_impl();
  if (!v3)
  {
    if (!v5)
    {
      [(MailboxOutlineCell *)self setUserInteractionEnabled:[(MailboxOutlineCell *)self isCellEnabled]];
      return;
    }
    [(MailboxOutlineCell *)self setUserInteractionEnabled:1];
    uint64_t v7 = [(MailboxOutlineCell *)self isCellEnabled] ^ 1;
    goto LABEL_12;
  }
  if (self->_disabledForEditing) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = self->_cellEnabled || [(MailboxOutlineCell *)self _isCellEnabledForMailboxes];
  }
  [(MailboxOutlineCell *)self setUserInteractionEnabled:v6];
  if (v5)
  {
    uint64_t v7 = v6 ^ 1;
LABEL_12:
    [(MailboxOutlineCell *)self setUseDisabledAppearance:v7];
  }
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    [(MailboxOutlineCell *)self setAccessibilityLabel:v5];
  }
}

- (void)setFlattenHierarchy:(BOOL)a3
{
  if (self->_flattenHierarchy != a3)
  {
    self->_flattenHierarchy = a3;
    if (a3) {
      [(MailboxOutlineCell *)self setIndentationLevel:0];
    }
  }
}

- (BOOL)_isCellEnabledForMailboxes
{
  BOOL v3 = [(NSSet *)self->_legacyMailboxes anyObject];
  if (v3)
  {
    BOOL v4 = [(NSSet *)self->_legacyMailboxes anyObject];
    unsigned __int8 v5 = [v4 isStore];
  }
  else
  {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (BOOL)isCellEnabled
{
  if (self->_cellEnabled) {
    return [(MailboxOutlineCell *)self _isCellEnabledForMailboxes];
  }
  else {
    return 0;
  }
}

- (void)setCellEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_cellEnabled = a3;
  if (_os_feature_enabled_impl())
  {
    [(MailboxOutlineCell *)self setUseDisabledAppearance:v3 ^ 1];
  }
  else
  {
    [(MailboxOutlineCell *)self setUserInteractionEnabled:v3];
  }
}

- (void)setExpanded:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MailboxOutlineCell;
  [(MailboxOutlineCell *)&v6 setExpanded:a3];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F0778;
  v5[3] = &unk_1006047A0;
  v5[4] = self;
  BOOL v4 = +[EFScheduler mainThreadScheduler];
  [v4 performBlock:v5];
}

- (void)setUseDisabledAppearance:(BOOL)a3
{
  BOOL useDisabledAppearance = self->_useDisabledAppearance;
  self->_BOOL useDisabledAppearance = a3;
  if (useDisabledAppearance != a3) {
    [(MailboxOutlineCell *)self setNeedsUpdateConfiguration];
  }
}

- (NSLayoutConstraint)separatorFlushLeadingConstraint
{
  separatorFlushLeadingConstraint = self->_separatorFlushLeadingConstraint;
  if (!separatorFlushLeadingConstraint)
  {
    BOOL v4 = [(MailboxOutlineCell *)self separatorLayoutGuide];
    unsigned __int8 v5 = [v4 leadingAnchor];
    objc_super v6 = [(MailboxOutlineCell *)self leadingAnchor];
    uint64_t v7 = [v5 constraintEqualToAnchor:v6];
    objc_super v8 = self->_separatorFlushLeadingConstraint;
    self->_separatorFlushLeadingConstraint = v7;

    separatorFlushLeadingConstraint = self->_separatorFlushLeadingConstraint;
  }

  return separatorFlushLeadingConstraint;
}

- (void)setForceZeroSeparatorInset:(BOOL)a3
{
  if (self->_forceZeroSeparatorInset != a3)
  {
    BOOL v3 = a3;
    self->_forceZeroSeparatorInset = a3;
    id v4 = [(MailboxOutlineCell *)self separatorFlushLeadingConstraint];
    [v4 setActive:v3];
  }
}

- (UIImage)icon
{
  if (self->_icon)
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v4 = [(MailboxOutlineCell *)self createIconBlock];
    BOOL v3 = (void *)v4;
    if (v4)
    {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
      unsigned __int8 v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
      icon = self->_icon;
      self->_icon = v5;
    }
  }
  uint64_t v7 = self->_icon;

  return v7;
}

- (void)_invalidateIcon
{
  icon = self->_icon;
  self->_icon = 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MailboxOutlineCell;
  [(MailboxOutlineCell *)&v5 traitCollectionDidChange:v4];
  [(MailboxOutlineCell *)self _invalidateIcon];
}

- (void)setShowsDetailDisclosureButton:(BOOL)a3
{
  if (self->_showsDetailDisclosureButton != a3)
  {
    self->_showsDetailDisclosureButton = a3;
    if (a3 && !self->_detailsDisclosureButton)
    {
      id v4 = +[UIButton buttonWithType:4];
      detailsDisclosureButton = self->_detailsDisclosureButton;
      self->_detailsDisclosureButton = v4;

      [(UIButton *)self->_detailsDisclosureButton frame];
      double Height = CGRectGetHeight(v12);
      [(UIButton *)self->_detailsDisclosureButton frame];
      double Width = CGRectGetWidth(v13);
      if (Height >= Width) {
        double Width = Height;
      }
      double v8 = Width * 0.5;
      id v9 = [(UIButton *)self->_detailsDisclosureButton layer];
      [v9 setCornerRadius:v8];

      unsigned int v10 = self->_detailsDisclosureButton;
      [(UIButton *)v10 setPointerInteractionEnabled:1];
    }
  }
}

- (id)detailsDisclosureButtonIfShown
{
  if ([(MailboxOutlineCell *)self showsDetailDisclosureButton]) {
    detailsDisclosureButton = self->_detailsDisclosureButton;
  }
  else {
    detailsDisclosureButton = 0;
  }

  return detailsDisclosureButton;
}

- (id)configurationState
{
  v5.receiver = self;
  v5.super_class = (Class)MailboxOutlineCell;
  BOOL v3 = [(MailboxOutlineCell *)&v5 configurationState];
  if (_os_feature_enabled_impl()) {
    [v3 setDisabled:[self useDisabledAppearance]];
  }

  return v3;
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v35 = a3;
  id v4 = [(MailboxOutlineCell *)self traitCollection];
  unsigned int v5 = [v4 mf_useSplitViewStyling];

  if ((id)[(MailboxOutlineCell *)self disclosureType] == (id)1)
  {
    unsigned int v6 = [(MailboxOutlineCell *)self expanded];
    uint64_t v7 = MSAccessibilityIdentifierMailboxListAccountCell;
    CFStringRef v8 = @".isCollapsed";
    if (v6) {
      CFStringRef v8 = @".isExpanded";
    }
  }
  else
  {
    unsigned int v9 = [(MailboxOutlineCell *)self expanded];
    uint64_t v7 = MSAccessibilityIdentifierMailboxListCell;
    CFStringRef v8 = @".isCollapsed";
    if (v9) {
      CFStringRef v8 = @".isExpanded";
    }
  }
  unsigned int v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);
  [(MailboxOutlineCell *)self setAccessibilityIdentifier:v10];

  if ([(MailboxOutlineCell *)self isExpandable])
  {
    if (v5) {
      +[UIListContentConfiguration sidebarHeaderConfiguration];
    }
    else {
    CGRect v12 = +[UIListContentConfiguration prominentInsetGroupedHeaderConfiguration];
    }
    __int16 v14 = [(MailboxOutlineCell *)self title];
    [v12 setText:v14];

    CGRect v13 = +[UIBackgroundConfiguration listSidebarHeaderConfiguration];
    sub_1000F0B68((uint64_t)self, v12);
    goto LABEL_36;
  }
  if (v5)
  {
    uint64_t v11 = +[UIListContentConfiguration accompaniedSidebarSubtitleCellConfiguration];
    +[UIBackgroundConfiguration listAccompaniedSidebarCellConfiguration];
    CGRect v13 = v12 = (void *)v11;
  }
  else
  {
    CGRect v12 = +[UIListContentConfiguration subtitleCellConfiguration];
    CGRect v13 = +[UIBackgroundConfiguration listGroupedCellConfiguration];
    if ([v35 isEditing])
    {
      v15 = +[UIColor tableCellGroupedBackgroundColor];
      [v13 setBackgroundColor:v15];
    }
    __int16 v16 = +[UIColor secondaryLabelColor];
    v17 = [v12 secondaryTextProperties];
    [v17 setColor:v16];
  }
  sub_1000F0B68((uint64_t)self, v12);
  __int16 v18 = [(MailboxOutlineCell *)self title];
  [v12 setText:v18];

  if ([(MailboxOutlineCell *)self useTintColor])
  {
    int64_t v19 = [(MailboxOutlineCell *)self tintColor];
    int v20 = [v12 textProperties];
    [v20 setColor:v19];
  }
  uint64_t v21 = [(MailboxOutlineCell *)self subtitle];
  [v12 setSecondaryText:v21];

  unsigned int v22 = [v35 isSelected];
  unsigned int v23 = [(MailboxOutlineCell *)self icon];
  [v12 setImage:v23];

  BOOL v24 = [(MailboxOutlineCell *)self selectedIconTintColor];
  if (v24) {
    unsigned int v25 = v22;
  }
  else {
    unsigned int v25 = 0;
  }

  if (v25 == 1)
  {
    v26 = [(MailboxOutlineCell *)self selectedIconTintColor];
    v27 = [v12 imageProperties];
    [v27 setTintColor:v26];
  }
  else
  {
    uint64_t v28 = [(MailboxOutlineCell *)self iconTintColor];
    if (v28) {
      char v29 = v22;
    }
    else {
      char v29 = 1;
    }

    if (v29) {
      goto LABEL_30;
    }
    v26 = [(MailboxOutlineCell *)self iconTintColor];
    v27 = [v12 imageProperties];
    [v27 setTintColor:v26];
  }

LABEL_30:
  unsigned int v30 = [v35 isFocused];
  if ([(MailboxOutlineCell *)self showsDetailDisclosureButton])
  {
    if ((v22 & v30) == 1) {
      +[UIColor systemWhiteColor];
    }
    else {
    __int16 v31 = +[UIColor systemBlueColor];
    }
    uint64_t v32 = [(MailboxOutlineCell *)self detailsDisclosureButton];
    [v32 setTintColor:v31];
  }
  __int16 v33 = [v12 imageProperties];
  [v33 reservedLayoutSize];

  id v34 = [v12 imageProperties];
  [v34 setReservedLayoutSize:_UIContentViewDefaultSymbolImageReservedLayoutSize, _UIContentViewDefaultSymbolImageReservedLayoutSize];

LABEL_36:
  [(MailboxOutlineCell *)self setContentConfiguration:v12];
  [(MailboxOutlineCell *)self setBackgroundConfiguration:v13];
  [(MailboxOutlineCell *)self updateAccessories];
  [(MailboxOutlineCell *)self _updateIndentationLevel];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MailboxOutlineCell;
  [(MailboxOutlineCell *)&v3 tintColorDidChange];
  if ([(MailboxOutlineCell *)self useTintColor]) {
    [(MailboxOutlineCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)updateAccessories
{
  id v18 = +[NSMutableArray array];
  if ([(MailboxOutlineCell *)self showsSelectionCheckmarkForEditing])
  {
    id v3 = objc_alloc_init((Class)UICellAccessoryMultiselect);
    id v4 = [(MailboxOutlineCell *)self multiselectCheckmarkColor];
    [v3 setTintColor:v4];

    [v3 setDisplayedState:1];
    [v18 addObject:v3];
  }
  if ([(MailboxOutlineCell *)self showsDetailDisclosureButton])
  {
    id v5 = objc_alloc((Class)UICellAccessoryCustomView);
    unsigned int v6 = [(MailboxOutlineCell *)self detailsDisclosureButton];
    id v7 = [v5 initWithCustomView:v6 placement:1];

    [v7 setDisplayedState:2];
    [v18 addObject:v7];
  }
  if ([(MailboxOutlineCell *)self showFocusIcon])
  {
    id v8 = [(MailboxOutlineCell *)self focusAccessoryView];
    [v18 addObject:v8];
LABEL_7:

    goto LABEL_13;
  }
  if ([(MailboxOutlineCell *)self shouldShowBadgeCountIfNecessary]
    && [(MailboxOutlineCell *)self badgeCount] >= 1
    && (![(MailboxOutlineCell *)self isExpandable]
     || [(MailboxOutlineCell *)self isExpandable]
     && ([(MailboxOutlineCell *)self expanded] & 1) == 0))
  {
    unsigned int v14 = [(MailboxOutlineCell *)self hideBadgeCountForEditing];
    id v15 = objc_alloc((Class)UICellAccessoryLabel);
    __int16 v16 = +[NSNumberFormatter ef_formatUnsignedInteger:[(MailboxOutlineCell *)self badgeCount] withGrouping:0];
    id v8 = [v15 initWithText:v16];

    if (v14) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 0;
    }
    [v8 setDisplayedState:v17];
    [v18 addObject:v8];
    goto LABEL_7;
  }
LABEL_13:
  unsigned int v9 = [(MailboxOutlineCell *)self traitCollection];
  unsigned __int8 v10 = [v9 mf_useSplitViewStyling];

  if ((v10 & 1) == 0 && ![(MailboxOutlineCell *)self disclosureType])
  {
    id v11 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
    [v11 setDisplayedState:2];
    [v18 addObject:v11];
    goto LABEL_20;
  }
  if ((id)[(MailboxOutlineCell *)self disclosureType] == (id)1)
  {
    id v11 = objc_alloc_init((Class)UICellAccessoryOutlineDisclosure);
    [v11 setStyle:1];
    [v11 setDisplayedState:0];
    [v18 addObject:v11];
LABEL_20:

    goto LABEL_21;
  }
  if ((id)[(MailboxOutlineCell *)self disclosureType] == (id)2)
  {
    id v11 = objc_alloc_init((Class)UICellAccessoryOutlineDisclosure);
    [v11 setStyle:2];
    [v11 setDisplayedState:0];
    [v18 addObject:v11];
    goto LABEL_20;
  }
LABEL_21:
  if ([(MailboxOutlineCell *)self canMoveItem]
    && ([(MailboxOutlineCell *)self expanded] & 1) == 0)
  {
    id v12 = objc_alloc_init((Class)UICellAccessoryReorder);
    CGRect v13 = +[UIColor tertiaryLabelColor];
    [v12 setTintColor:v13];

    [v12 setDisplayedState:1];
    [v18 addObject:v12];
  }
  [(MailboxOutlineCell *)self setAccessories:v18];
}

- (UICellAccessoryCustomView)focusAccessoryView
{
  focusAccessoryView = self->_focusAccessoryView;
  if (!focusAccessoryView)
  {
    id v4 = objc_alloc((Class)UIImageView);
    id v5 = +[UIImage systemImageNamed:MFImageGlyphFocusCircle];
    id v6 = [v4 initWithImage:v5];

    id v7 = +[UIColor systemGrayColor];
    [v6 setTintColor:v7];

    [v6 setContentMode:4];
    id v8 = (UICellAccessoryCustomView *)[objc_alloc((Class)UICellAccessoryCustomView) initWithCustomView:v6 placement:1];
    unsigned int v9 = self->_focusAccessoryView;
    self->_focusAccessoryView = v8;

    [(UICellAccessoryCustomView *)self->_focusAccessoryView setDisplayedState:2];
    focusAccessoryView = self->_focusAccessoryView;
  }

  return focusAccessoryView;
}

- (UICellAccessoryCustomView)businessesAccessoryView
{
  businessesAccessoryView = self->_businessesAccessoryView;
  if (!businessesAccessoryView)
  {
    id v4 = objc_alloc((Class)UIImageView);
    id v5 = +[UIImage systemImageNamed:MFImageGlyphStatusIndicatorUnread];
    id v6 = [v4 initWithImage:v5];

    id v7 = +[UIColor systemBlueColor];
    [v6 setTintColor:v7];

    [v6 setContentMode:4];
    id v8 = (UICellAccessoryCustomView *)[objc_alloc((Class)UICellAccessoryCustomView) initWithCustomView:v6 placement:1];
    unsigned int v9 = self->_businessesAccessoryView;
    self->_businessesAccessoryView = v8;

    businessesAccessoryView = self->_businessesAccessoryView;
  }

  return businessesAccessoryView;
}

- (CGPoint)destinationPointForAnimation
{
  id v3 = [(MailboxOutlineCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  id v12 = [v3 textLabel];
  [v12 frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  uint64_t v21 = [(MailboxOutlineCell *)self traitCollection];
  id v22 = [v21 horizontalSizeClass];

  v34.origin.x = v5;
  v34.origin.y = v7;
  v34.size.width = v9;
  v34.size.height = v11;
  double MidY = CGRectGetMidY(v34);
  v35.origin.x = v14;
  v35.origin.y = v16;
  v35.size.width = v18;
  v35.size.height = v20;
  double MidX = CGRectGetMidX(v35);
  double v25 = 3.0;
  if (v22 == (id)1) {
    double v25 = 2.0;
  }
  double v26 = v9 / v25;
  if (v26 >= MidX) {
    double MidX = v26;
  }
  -[MailboxOutlineCell convertPoint:fromView:](self, "convertPoint:fromView:", v3, MidX, MidY);
  double v28 = v27;
  double v30 = v29;

  double v31 = v28;
  double v32 = v30;
  result.y = v32;
  result.x = v31;
  return result;
}

- (double)_verticalPaddingForExpandableTitle
{
  v2 = +[MFFontMetricCache sharedFontMetricCache];
  [v2 cachedFloat:&stru_100607B88 forKey:@"MailboxOutlineCell.verticalPaddingForExpandableTitle"];
  double v4 = v3;

  return v4;
}

- (void)addTargetForDetailDisclosure:(id)a3 action:(SEL)a4
{
  id v7 = a3;
  double v6 = [(MailboxOutlineCell *)self detailsDisclosureButton];
  [v6 addTarget:v7 action:a4 forControlEvents:64];
}

- (void)_updateMailboxName
{
  if ((id)[(NSSet *)self->_legacyMailboxes count] == (id)1)
  {
    id v5 = [(NSSet *)self->_legacyMailboxes anyObject];
    double v3 = +[MailChangeManager sharedChangeManager];
    double v4 = [v3 displayNameUsingSpecialNamesForMailbox:v5];

    [(MailboxOutlineCell *)self setTitle:v4];
    [(MailboxOutlineCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)_updateIndentationLevel
{
  if ((id)[(NSSet *)self->_legacyMailboxes count] == (id)1)
  {
    id v6 = [(NSSet *)self->_legacyMailboxes anyObject];
    if ([(MailboxOutlineCell *)self flattenHierarchy])
    {
      uint64_t v3 = 0;
    }
    else
    {
      double v4 = +[MailChangeManager sharedChangeManager];
      int v5 = [v4 levelForMailbox:v6];

      uint64_t v3 = v5 & ~(v5 >> 31);
    }
    [(MailboxOutlineCell *)self setIndentationLevel:v3];
  }
}

- (id)_scriptingInfo
{
  v8.receiver = self;
  v8.super_class = (Class)MailboxOutlineCell;
  uint64_t v3 = [(MailboxOutlineCell *)&v8 _scriptingInfo];
  if ((id)[(NSSet *)self->_legacyMailboxes count] == (id)1)
  {
    double v4 = +[MailChangeManager sharedChangeManager];
    int v5 = [(NSSet *)self->_legacyMailboxes anyObject];
    id v6 = [v4 displayNameUsingSpecialNamesForMailbox:v5];

    [v3 setValue:v6 forKey:@"ID"];
  }

  return v3;
}

- (void)bucketBarConfigurationController:(id)a3 isHidden:(BOOL)a4 forMailboxes:(id)a5
{
  objc_super v8 = self;
  id v5 = a5;
  id v9 = v5;
  id v6 = +[EFScheduler mainThreadScheduler];
  [v6 performBlock:&v7];
}

- (void)bucketBarConfigurationControllerRequiresReload:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F21E8;
  v4[3] = &unk_1006047A0;
  v4[4] = self;
  uint64_t v3 = +[EFScheduler mainThreadScheduler];
  [v3 performBlock:v4];
}

- (BOOL)isExpandable
{
  return self->_expandable;
}

- (void)setExpandable:(BOOL)a3
{
  self->_expandable = a3;
}

- (int64_t)badgeCount
{
  return self->_badgeCount;
}

- (BOOL)hideBadgeCountForEditing
{
  return self->_hideBadgeCountForEditing;
}

- (void)setHideBadgeCountForEditing:(BOOL)a3
{
  self->_hideBadgeCountForEditing = a3;
}

- (BOOL)showsDetailDisclosureButton
{
  return self->_showsDetailDisclosureButton;
}

- (BOOL)canMoveItem
{
  return self->_canMoveItem;
}

- (void)setCanMoveItem:(BOOL)a3
{
  self->_canMoveItem = a3;
}

- (BOOL)showsSelectionCheckmarkForEditing
{
  return self->_showsSelectionCheckmarkForEditing;
}

- (void)setShowsSelectionCheckmarkForEditing:(BOOL)a3
{
  self->_showsSelectionCheckmarkForEditing = a3;
}

- (int64_t)disclosureType
{
  return self->_disclosureType;
}

- (void)setDisclosureType:(int64_t)a3
{
  self->_disclosureType = a3;
}

- (BOOL)flattenHierarchy
{
  return self->_flattenHierarchy;
}

- (BOOL)isDisabledForEditing
{
  return self->_disabledForEditing;
}

- (void)setDisabledForEditing:(BOOL)a3
{
  self->_disabledForEditing = a3;
}

- (BOOL)forceZeroSeparatorInset
{
  return self->_forceZeroSeparatorInset;
}

- (BOOL)useTintColor
{
  return self->_useTintColor;
}

- (void)setUseTintColor:(BOOL)a3
{
  self->_useTintColor = a3;
}

- (BOOL)shouldShowBadgeCountIfNecessary
{
  return self->_shouldShowBadgeCountIfNecessary;
}

- (void)setShouldShowBadgeCountIfNecessary:(BOOL)a3
{
  self->_shouldShowBadgeCountIfNecessary = a3;
}

- (BOOL)showFocusIcon
{
  return self->_showFocusIcon;
}

- (void)setShowFocusIcon:(BOOL)a3
{
  self->_showFocusIcon = a3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (void)setIcon:(id)a3
{
}

- (id)createIconBlock
{
  return self->_createIconBlock;
}

- (void)setCreateIconBlock:(id)a3
{
}

- (UIColor)iconTintColor
{
  return self->_iconTintColor;
}

- (void)setIconTintColor:(id)a3
{
}

- (UIColor)selectedIconTintColor
{
  return self->_selectedIconTintColor;
}

- (void)setSelectedIconTintColor:(id)a3
{
}

- (UIColor)multiselectCheckmarkColor
{
  return self->_multiselectCheckmarkColor;
}

- (void)setMultiselectCheckmarkColor:(id)a3
{
}

- (EMSmartMailbox)smartMailbox
{
  return self->_smartMailbox;
}

- (void)setSmartMailbox:(id)a3
{
}

- (UIButton)detailsDisclosureButton
{
  return self->_detailsDisclosureButton;
}

- (void)setDetailsDisclosureButton:(id)a3
{
}

- (BOOL)currentUnreadCountQueryIncludesRead
{
  return self->_currentUnreadCountQueryIncludesRead;
}

- (void)setCurrentUnreadCountQueryIncludesRead:(BOOL)a3
{
  self->_currentUnreadCountQueryIncludesRead = a3;
}

- (EFCancelable)unreadCountToken
{
  return self->_unreadCountToken;
}

- (void)setUnreadCountToken:(id)a3
{
}

- (EFDebouncer)countDebouncer
{
  return (EFDebouncer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSeparatorFlushLeadingConstraint:(id)a3
{
}

- (BOOL)useDisabledAppearance
{
  return self->_useDisabledAppearance;
}

- (void)setFocusAccessoryView:(id)a3
{
}

- (BOOL)shouldExcludeBusinessMessages
{
  return self->_shouldExcludeBusinessMessages;
}

- (void)setShouldExcludeBusinessMessages:(BOOL)a3
{
  self->_shouldExcludeBusinessMessages = a3;
}

- (void)setBusinessesAccessoryView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessesAccessoryView, 0);
  objc_storeStrong((id *)&self->_focusAccessoryView, 0);
  objc_storeStrong((id *)&self->_separatorFlushLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_countDebouncer, 0);
  objc_storeStrong((id *)&self->_unreadCountToken, 0);
  objc_storeStrong((id *)&self->_detailsDisclosureButton, 0);
  objc_storeStrong((id *)&self->_smartMailbox, 0);
  objc_storeStrong((id *)&self->_multiselectCheckmarkColor, 0);
  objc_storeStrong((id *)&self->_selectedIconTintColor, 0);
  objc_storeStrong((id *)&self->_iconTintColor, 0);
  objc_storeStrong(&self->_createIconBlock, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);

  objc_storeStrong((id *)&self->_legacyMailboxes, 0);
}

@end