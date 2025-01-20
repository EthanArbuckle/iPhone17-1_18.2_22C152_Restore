@interface MailboxTableCell
+ (double)defaultRowHeight;
+ (double)twoLineTopBottomPadding;
+ (id)log;
+ (id)subtitleFont;
+ (id)titleFont;
+ (void)invalidateCachedLayoutInformation;
- (BOOL)_shouldUnreadCountBeVisible;
- (BOOL)forceZeroSeparatorInset;
- (BOOL)hideUnreadCountForEditing;
- (BOOL)isCellEnabled;
- (BOOL)isExpandable;
- (BOOL)isExpanded;
- (BOOL)shouldShowUnreadCount;
- (CGPoint)destinationPointForAnimation;
- (CGSize)sizeThatFits:(CGSize)a3;
- (EFCancelable)unreadCountToken;
- (EFDebouncer)countDebouncer;
- (MailboxTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)titleColor;
- (UIFont)preferredSubtitleFont;
- (UIImageView)expansionAccessoryImageView;
- (UIImageView)expansionEditingAccessoryImageView;
- (id)_countQueryLabelForMailbox:(id)a3;
- (id)_createMailboxesFromUids:(id)a3;
- (id)_expansionAccessoryImageView;
- (id)_multiselectBackgroundColor;
- (id)_scriptingInfo;
- (id)userInfo;
- (int64_t)extraIndentLevel;
- (unsigned)flattenHierarchy;
- (void)_doCleanupExpansionAccessoryViews;
- (void)_doRefreshExpansionAccessoryImageView;
- (void)_preferredContentSizeCategoryDidChange:(id)a3;
- (void)_removeUnreadCount;
- (void)_resetDebouncer;
- (void)_setMailboxes:(id)a3 observeCount:(BOOL)a4 unreadCountIncludesRead:(BOOL)a5;
- (void)_setUnreadCount:(unint64_t)a3;
- (void)_setUnreadCountMailboxes:(id)a3 unreadCountIncludesRead:(BOOL)a4;
- (void)_updateContentSizeSettings;
- (void)_updateMailboxName;
- (void)_updateUnreadCountLabelVisibilityAnimated:(BOOL)a3;
- (void)_updateViewConfigurationsWithState:(unint64_t)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5;
- (void)prepareForReuse;
- (void)setCellEnabled:(BOOL)a3;
- (void)setDetailsDisclosureButton:(id)a3;
- (void)setDisabledForEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setExpandable:(BOOL)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpansionAccessoryImageView:(id)a3;
- (void)setExpansionEditingAccessoryImageView:(id)a3;
- (void)setExtraIndentLevel:(int64_t)a3;
- (void)setFlattenHierarchy:(unsigned int)a3;
- (void)setForceZeroSeparatorInset:(BOOL)a3;
- (void)setHideUnreadCountForEditing:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setIcon:(id)a3;
- (void)setIcon:(id)a3 withOffset:(CGPoint)a4;
- (void)setIconOffset:(CGPoint)a3;
- (void)setLegacyMailboxes:(id)a3;
- (void)setLegacyMailboxes:(id)a3 showUnreadCount:(BOOL)a4;
- (void)setLegacyMailboxes:(id)a3 showUnreadCount:(BOOL)a4 unreadCountIncludesRead:(BOOL)a5;
- (void)setMailboxes:(id)a3 observeCount:(BOOL)a4;
- (void)setPreferredSubtitleFont:(id)a3;
- (void)setShouldShowUnreadCount:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setUnreadCountToken:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation MailboxTableCell

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FE630;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_1006995E8 != -1) {
    dispatch_once(&qword_1006995E8, block);
  }
  v2 = (void *)qword_1006995E0;

  return v2;
}

+ (void)invalidateCachedLayoutInformation
{
  v3 = (void *)qword_1006995F0;
  qword_1006995F0 = 0;

  v4 = (void *)qword_1006995F8;
  qword_1006995F8 = 0;

  qword_100699600 = 0;
  qword_100699608 = 0;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"_MailboxTableCellLayoutValuesDidChange" object:a1];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:a1 name:UIContentSizeCategoryDidChangeNotification object:0];
}

+ (double)defaultRowHeight
{
  double result = *(double *)&qword_100699600;
  if (*(double *)&qword_100699600 == 0.0)
  {
    [a1 twoLineTopBottomPadding:* (double *) & qword_100699600];
    *(double *)&qword_100699600 = v4 + v4;
    id v5 = [a1 titleFont];
    [v5 capHeight];
    *(double *)&qword_100699600 = v6 + *(double *)&qword_100699600;

    v7 = [a1 subtitleFont];
    [v7 capHeight];
    *(double *)&qword_100699600 = v8 + *(double *)&qword_100699600;

    v9 = [a1 subtitleFont];
    [v9 _bodyLeading];
    UIRoundToViewScale();
    *(double *)&qword_100699600 = v10 + *(double *)&qword_100699600;

    UIRoundToViewScale();
    qword_100699600 = v11;
    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:a1 selector:"_contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

    return *(double *)&qword_100699600;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
  {
    [*(id *)((char *)&self->_iconOffset.y + 1) sizeThatFits:width height];
    double v9 = v8;
    double v10 = sub_100216C08(*(unsigned int *)((char *)&self->_detailsDisclosureButton + 1));
    v15.receiver = self;
    v15.super_class = (Class)MailboxTableCell;
    -[MailboxTableCell sizeThatFits:](&v15, "sizeThatFits:", width - (v9 + v10), height);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MailboxTableCell;
    -[MailboxTableCell sizeThatFits:](&v14, "sizeThatFits:", width, height);
    double width = v12;
  }
  double v13 = width;
  result.double height = v11;
  result.double width = v13;
  return result;
}

+ (double)twoLineTopBottomPadding
{
  uint64_t v2 = qword_100699608;
  if (*(double *)&qword_100699608 == 0.0)
  {
    v3 = [a1 subtitleFont];
    [v3 _bodyLeading];
    UIRoundToViewScale();
    uint64_t v2 = v4;

    qword_100699608 = v2;
  }
  return *(double *)&v2;
}

+ (id)titleFont
{
  uint64_t v2 = (void *)qword_1006995F0;
  if (!qword_1006995F0)
  {
    if (+[UIScreen mui_isLargeFormatPad]) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = 2;
    }
    uint64_t v4 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody addingSymbolicTraits:0x8000 options:v3];
    uint64_t v5 = +[UIFont fontWithDescriptor:v4 size:0.0];
    double v6 = (void *)qword_1006995F0;
    qword_1006995F0 = v5;

    uint64_t v2 = (void *)qword_1006995F0;
  }

  return v2;
}

+ (id)subtitleFont
{
  uint64_t v2 = (void *)qword_1006995F8;
  if (!qword_1006995F8)
  {
    if (+[UIScreen mui_isLargeFormatPad]) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = 2;
    }
    uint64_t v4 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody addingSymbolicTraits:0x8000 options:v3];
    uint64_t v5 = +[UIFont fontWithDescriptor:v4 size:0.0];
    double v6 = (void *)qword_1006995F8;
    qword_1006995F8 = v5;

    uint64_t v2 = (void *)qword_1006995F8;
  }

  return v2;
}

- (MailboxTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MailboxTableCell;
  v7 = [(MailboxTableCell *)&v18 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    double v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v7 selector:"_invalidateLayout" name:@"_MailboxTableCellLayoutValuesDidChange" object:objc_opt_class()];

    double v9 = [(MailboxTableCell *)v7 textLabel];
    double v10 = [(id)objc_opt_class() titleFont];
    [v9 setFont:v10];

    double v11 = [(MailboxTableCell *)v7 detailTextLabel];
    uint64_t v12 = [(id)objc_opt_class() subtitleFont];
    [v11 setFont:v12];

    double v13 = [(MailboxTableCell *)v7 imageView];
    [v13 setContentMode:4];

    objc_super v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v7 selector:"_preferredContentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    [(MailboxTableCell *)v7 _updateContentSizeSettings];
    objc_super v15 = [(MailboxTableCell *)v7 traitCollection];
    LOBYTE(v12) = [v15 mf_useSplitViewStyling];

    if ((v12 & 1) == 0)
    {
      id v16 = objc_alloc_init((Class)UIView);
      [(MailboxTableCell *)v7 setSelectedBackgroundView:v16];
    }
    [(MailboxTableCell *)v7 _resetDebouncer];
  }

  return v7;
}

- (void)_resetDebouncer
{
  if (pthread_main_np() != 1)
  {
    double v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MailboxTableCell.m" lineNumber:182 description:@"Current thread must be main"];
  }
  uint64_t v4 = *(EFCancelable **)((char *)&self->_unreadCountToken + 1);
  if (v4)
  {
    [v4 cancel];
    uint64_t v5 = *(EFCancelable **)((char *)&self->_unreadCountToken + 1);
    *(EFCancelable **)((char *)&self->_unreadCountToken + 1) = 0;
  }
  if ([(MailboxTableCell *)self shouldShowUnreadCount])
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v6 = objc_alloc((Class)EFDebouncer);
    v7 = +[EFScheduler mainThreadScheduler];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000FEF64;
    v11[3] = &unk_100607AE0;
    objc_copyWeak(v12, &location);
    v12[1] = (id)a2;
    double v8 = (EFCancelable *)[v6 initWithTimeInterval:v7 scheduler:1 startAfter:v11 block:0.2];
    double v9 = *(EFCancelable **)((char *)&self->_unreadCountToken + 1);
    *(EFCancelable **)((char *)&self->_unreadCountToken + 1) = v8;

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

- (void)_preferredContentSizeCategoryDidChange:(id)a3
{
  [(MailboxTableCell *)self _updateContentSizeSettings];
  if ([*(id *)(&self->super._shouldDisableWhileEditing + 1) count] == (id)1)
  {
    uint64_t v4 = [*(id *)(&self->super._shouldDisableWhileEditing + 1) anyObject];
    uint64_t v5 = [UIApp preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

    if (IsAccessibilityCategory)
    {
      v7 = 0;
    }
    else
    {
      sub_100216B30();
      uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = [v4 iconFromBundle:v5];
    }
    [(MailboxTableCell *)self setIcon:v7];
    if (!IsAccessibilityCategory)
    {
    }
  }
  double v8 = +[MailboxTableCell titleFont];
  [*(id *)((char *)&self->_iconOffset.y + 1) setFont:v8];

  [(MailboxTableCell *)self setNeedsLayout];
}

- (void)_updateContentSizeSettings
{
  v7 = [UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  if (IsAccessibilityCategory) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  id v8 = [(MailboxTableCell *)self textLabel];
  [v8 setNumberOfLines:v4];

  double v9 = [UIApp preferredContentSizeCategory];
  BOOL v5 = UIContentSizeCategoryIsAccessibilityCategory(v9);

  if (v5) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  id v10 = [(MailboxTableCell *)self detailTextLabel];
  [v10 setNumberOfLines:v6];
}

- (void)dealloc
{
  [*(id *)((char *)&self->_expansionEditingAccessoryImageView + 1) cancel];
  [*(id *)((char *)&self->_unreadCountToken + 1) cancel];
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MailboxTableCell;
  [(MailboxTableCell *)&v4 dealloc];
}

- (void)setMailboxes:(id)a3 observeCount:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = *(void **)(&self->super._shouldDisableWhileEditing + 1);
  *(void *)(&self->super._shouldDisableWhileEditing + 1) = 0;
  id v7 = a3;

  [(MailboxTableCell *)self _setMailboxes:v7 observeCount:v4 unreadCountIncludesRead:0];
}

- (void)_setMailboxes:(id)a3 observeCount:(BOOL)a4 unreadCountIncludesRead:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = (NSSet *)[v11 copy];
  double v9 = *(NSSet **)((char *)&self->_legacyMailboxes + 1);
  *(NSSet **)((char *)&self->_legacyMailboxes + 1) = v8;

  [(MailboxTableCell *)self setShouldShowUnreadCount:1];
  if (v6)
  {
    if ([*(id *)((char *)&self->_legacyMailboxes + 1) count]) {
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
  [(MailboxTableCell *)self _setUnreadCountMailboxes:v10 unreadCountIncludesRead:v5];
}

- (void)_setUnreadCountMailboxes:(id)a3 unreadCountIncludesRead:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(MailboxTableCell *)self unreadCountToken];
  [v7 cancel];

  [(MailboxTableCell *)self setUnreadCountToken:0];
  if (v6 && [v6 count])
  {
    v20 = +[EMMessageListItemPredicates predicateForMessagesInMailboxes:*(NSSet **)((char *)&self->_legacyMailboxes + 1)];
    if (v4)
    {
      id v8 = v20;
    }
    else
    {
      double v9 = +[EMMessageListItemPredicates predicateForUnreadMessages];
      v22[0] = v20;
      v22[1] = v9;
      id v10 = +[NSArray arrayWithObjects:v22 count:2];
      id v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];
    }
    id v11 = [v6 firstObject];
    uint64_t v12 = [(MailboxTableCell *)self _countQueryLabelForMailbox:v11];

    id v13 = [objc_alloc((Class)EMQuery) initWithTargetClass:objc_opt_class() predicate:v8 sortDescriptors:&__NSArray0__struct queryOptions:0 label:v12];
    objc_super v14 = [v6 ef_mapSelector:@"objectID"];
    objc_super v15 = +[EMMailboxScope mailboxScopeForMailboxObjectIDs:v14 forExclusion:0];

    id v16 = +[UIApplication sharedApplication];
    v17 = [v16 daemonInterface];
    objc_super v18 = [v17 messageRepository];
    v19 = [v18 startCountingQuery:v13 includingServerCountsForMailboxScope:v15 withObserver:self];
    [(MailboxTableCell *)self setUnreadCountToken:v19];
  }
  [(MailboxTableCell *)self _resetDebouncer];
}

- (id)_countQueryLabelForMailbox:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 name];
  if (([v3 descriptionUsesRealName] & 1) == 0)
  {
    BOOL v5 = +[EFPrivacy fullyOrPartiallyRedactedStringForString:v4];

    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"Generic mailbox %@", v5];
    BOOL v4 = v6;
  }
  id v7 = objc_alloc((Class)NSString);
  id v8 = [v3 accountIdentifier];
  id v9 = [v7 initWithFormat:@"%@ (accountID: %@)", v4, v8];

  return v9;
}

- (void)setLegacyMailboxes:(id)a3
{
}

- (void)setLegacyMailboxes:(id)a3 showUnreadCount:(BOOL)a4
{
}

- (void)setLegacyMailboxes:(id)a3 showUnreadCount:(BOOL)a4 unreadCountIncludesRead:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = (id *)(&self->super._shouldDisableWhileEditing + 1);
  if (([v9 isEqualToSet:*(void *)(&self->super._shouldDisableWhileEditing + 1)] & 1) == 0)
  {
    id v11 = +[NSNotificationCenter defaultCenter];
    uint64_t v12 = MFMailboxUidWasRenamedNotification;
    [v11 removeObserver:self name:MFMailboxUidWasRenamedNotification object:0];

    id v13 = [(MailboxTableCell *)self unreadCountToken];
    [v13 cancel];

    [(MailboxTableCell *)self setUnreadCountToken:0];
    objc_storeStrong((id *)(&self->super._shouldDisableWhileEditing + 1), a3);
    [(MailboxTableCell *)self setShouldShowUnreadCount:v6];
    if ([*v10 count] == (id)1)
    {
      objc_super v14 = [*v10 anyObject];
      objc_super v15 = sub_100216B30();
      id v16 = [v14 iconFromBundle:v15];
      [(MailboxTableCell *)self setIcon:v16];

      v17 = +[MailChangeManager sharedChangeManager];
      *(_DWORD *)((char *)&self->_detailsDisclosureButton + 1) = [v17 levelForMailbox:v14];

      objc_super v18 = +[NSNotificationCenter defaultCenter];
      [v18 addObserver:self selector:"_updateMailboxName" name:v12 object:v14];
    }
    [(MailboxTableCell *)self _removeUnreadCount];
    if ([(MailboxTableCell *)self shouldShowUnreadCount] && *v10)
    {
      v19 = [v9 allObjects];
      v20 = [(MailboxTableCell *)self _createMailboxesFromUids:v19];

      if (![v20 count])
      {
        id v21 = +[MailboxTableCell log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          v22 = +[UIApplication sharedApplication];
          v23 = [v22 mailboxProvider];
          sub_10045A254(v23, v24, v21, v22);
        }
      }
      [(MailboxTableCell *)self _setMailboxes:v20 observeCount:1 unreadCountIncludesRead:v5];
    }
    else
    {
      [(MailboxTableCell *)self _resetDebouncer];
    }
  }
  [(MailboxTableCell *)self _updateMailboxName];
  [(MailboxTableCell *)self setNeedsLayout];
}

- (id)_createMailboxesFromUids:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[UIApplication sharedApplication];
  BOOL v5 = [v4 mailboxProvider];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000FFD2C;
  v9[3] = &unk_100607B28;
  id v10 = v5;
  id v6 = v5;
  id v7 = [v3 ef_compactMap:v9];

  return v7;
}

- (BOOL)_shouldUnreadCountBeVisible
{
  if ([(MailboxTableCell *)self isEditing]) {
    unsigned int v3 = ![(MailboxTableCell *)self hideUnreadCountForEditing];
  }
  else {
    unsigned int v3 = 1;
  }
  if ([(MailboxTableCell *)self isExpandable]) {
    v3 &= ~[(MailboxTableCell *)self isExpanded];
  }
  return v3;
}

- (void)_updateUnreadCountLabelVisibilityAnimated:(BOOL)a3
{
  if (*(void *)((char *)&self->_iconOffset.y + 1))
  {
    BOOL v3 = a3;
    unsigned int v5 = [(MailboxTableCell *)self _shouldUnreadCountBeVisible];
    id v6 = *(void **)((char *)&self->_iconOffset.y + 1);
    if (v5)
    {
      id v7 = [v6 superview];

      if (!v7)
      {
        [*(id *)((char *)&self->_iconOffset.y + 1) setAlpha:0.0];
        id v8 = [(MailboxTableCell *)self contentView];
        [v8 addSubview:*(void *)((char *)&self->_iconOffset.y + 1)];
      }
      [*(id *)((char *)&self->_iconOffset.y + 1) alpha];
      if (v9 != 1.0)
      {
        id v10 = v16;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        id v11 = sub_1000FFF78;
        goto LABEL_9;
      }
    }
    else
    {
      [v6 alpha];
      if (v12 != 0.0)
      {
        id v10 = v15;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        id v11 = sub_1000FFF90;
LABEL_9:
        v10[2] = v11;
        v10[3] = &unk_1006047A0;
        v10[4] = self;
        id v13 = objc_retainBlock(v10);
        objc_super v14 = v13;
        if (v13)
        {
          if (v3)
          {
            +[UIView inheritedAnimationDuration];
            +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, 0);
          }
          else
          {
            ((void (*)(void *))v13[2])(v13);
          }
        }
        goto LABEL_14;
      }
    }
    objc_super v14 = 0;
LABEL_14:
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MailboxTableCell;
  -[MailboxTableCell setEditing:animated:](&v17, "setEditing:animated:");
  id v7 = [(MailboxTableCell *)self traitCollection];
  unsigned __int8 v8 = [v7 mf_useSplitViewStyling];

  if ((v8 & 1) == 0)
  {
    if (v5)
    {
      if ((BYTE5(self->_detailsDisclosureButton) & 2) != 0) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = 3;
      }
      [(MailboxTableCell *)self setSelectionStyle:v9];
      id v10 = +[UIColor clearColor];
      id v11 = [(MailboxTableCell *)self selectedBackgroundView];
      [v11 setBackgroundColor:v10];
    }
    else
    {
      [(MailboxTableCell *)self setSelectionStyle:3];
      id v10 = [(MailboxTableCell *)self traitCollection];
      id v11 = +[UIColor mailCellSelectionStateColorForInterfaceLevel:](UIColor, "mailCellSelectionStateColorForInterfaceLevel:", [v10 userInterfaceLevel]);
      double v12 = [(MailboxTableCell *)self selectedBackgroundView];
      [v12 setBackgroundColor:v11];
    }
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001001A0;
  v14[3] = &unk_100608298;
  BOOL v15 = v5;
  BOOL v16 = v4;
  v14[4] = self;
  id v13 = objc_retainBlock(v14);
  [(MailboxTableCell *)self _updateUnreadCountLabelVisibilityAnimated:v4];
  ((void (*)(void *, void))v13[2])(v13, *(UILabel **)((char *)&self->_unreadCountLabel + 1));
}

- (void)setDisabledForEditing:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  BYTE5(self->_detailsDisclosureButton) = BYTE5(self->_detailsDisclosureButton) & 0xFD | v3;
}

- (BOOL)isCellEnabled
{
  if ([(MailboxTableCell *)self isEditing]) {
    return (BYTE5(self->_detailsDisclosureButton) & 2) == 0;
  }
  if (BYTE5(self->_detailsDisclosureButton)) {
    return 0;
  }
  BOOL v4 = [*(id *)(&self->super._shouldDisableWhileEditing + 1) anyObject];
  if (v4)
  {
    BOOL v5 = [*(id *)(&self->super._shouldDisableWhileEditing + 1) anyObject];
    unsigned __int8 v3 = [v5 isStore];
  }
  else
  {
    unsigned __int8 v3 = 1;
  }

  return v3;
}

- (void)setIcon:(id)a3
{
}

- (void)setIcon:(id)a3 withOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a3;
  id v7 = [(MailboxTableCell *)self imageView];
  unsigned __int8 v8 = [UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

  if (IsAccessibilityCategory) {
    id v10 = 0;
  }
  else {
    id v10 = v11;
  }
  [v7 setImage:v10];

  -[MailboxTableCell setIconOffset:](self, "setIconOffset:", x, y);
}

- (void)setIconOffset:(CGPoint)a3
{
  *(NSArray **)((char *)&self->_mailboxes + 1) = *(NSArray **)&a3.x;
  *(CGFloat *)((char *)&self->_iconOffset.x + 1) = a3.y;
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(MailboxTableCell *)self textLabel];
  [v4 setText:v7];

  BOOL v5 = [(MailboxTableCell *)self textLabel];
  id v6 = +[MailboxTableCell titleFont];
  [v5 setFont:v6];

  [(MailboxTableCell *)self setSubtitle:0];
}

- (void)setSubtitle:(id)a3
{
  id v12 = a3;
  BOOL v4 = [(MailboxTableCell *)self preferredSubtitleFont];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[MailboxTableCell subtitleFont];
  }
  id v7 = v6;

  unsigned __int8 v8 = [(MailboxTableCell *)self detailTextLabel];
  [v8 setText:v12];

  uint64_t v9 = [(MailboxTableCell *)self detailTextLabel];
  id v10 = +[UIColor secondaryLabelColor];
  [v9 setTextColor:v10];

  id v11 = [(MailboxTableCell *)self detailTextLabel];
  [v11 setFont:v7];

  [(MailboxTableCell *)self setNeedsLayout];
}

- (void)setDetailsDisclosureButton:(id)a3
{
  id v5 = a3;
  id v6 = (UILabel **)((char *)&self->_unreadCountLabel + 1);
  id v7 = *(UILabel **)((char *)&self->_unreadCountLabel + 1);
  id v10 = v5;
  if (v7 != v5)
  {
    if (v7)
    {
      [v7 removeFromSuperview];
      unsigned __int8 v8 = (void *)*v6;
      *id v6 = 0;
    }
    if (v10)
    {
      objc_storeStrong((id *)((char *)&self->_unreadCountLabel + 1), a3);
      uint64_t v9 = [(MailboxTableCell *)self contentView];
      [v9 addSubview:*v6];
    }
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MailboxTableCell;
  -[MailboxTableCell setUserInteractionEnabled:](&v5, "setUserInteractionEnabled:");
  [(MailboxTableCell *)self setCellEnabled:v3];
}

- (void)setCellEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BYTE5(self->_detailsDisclosureButton) = BYTE5(self->_detailsDisclosureButton) & 0xFE | !a3;
  objc_super v5 = [(MailboxTableCell *)self traitCollection];
  unsigned __int8 v6 = [v5 mf_useSplitViewStyling];

  if ((v6 & 1) == 0)
  {
    if (v3) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 0;
    }
    [(MailboxTableCell *)self setSelectionStyle:v7];
  }
  if (v3) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }

  [(MailboxTableCell *)self setTintAdjustmentMode:v8];
}

- (void)setPreferredSubtitleFont:(id)a3
{
  id v6 = a3;
  if ((objc_msgSend(*(id *)((char *)&self->_extraIndentLevel + 1), "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)((char *)&self->_extraIndentLevel + 1), a3);
    objc_super v5 = [(MailboxTableCell *)self detailTextLabel];
    [v5 setFont:v6];
  }
}

- (void)_removeUnreadCount
{
  BOOL v3 = *(void **)((char *)&self->_iconOffset.y + 1);
  if (v3)
  {
    [v3 removeFromSuperview];
    BOOL v4 = *(void **)((char *)&self->_iconOffset.y + 1);
    *(CGFloat *)((char *)&self->_iconOffset.y + 1) = 0.0;
  }
}

- (void)_setUnreadCount:(unint64_t)a3
{
  if (a3)
  {
    if (!*(void *)((char *)&self->_iconOffset.y + 1))
    {
      id v5 = objc_alloc_init((Class)UILabel);
      id v6 = *(void **)((char *)&self->_iconOffset.y + 1);
      *(void *)((char *)&self->_iconOffset.y + 1) = v5;

      uint64_t v7 = +[UIColor clearColor];
      [*(id *)((char *)&self->_iconOffset.y + 1) setBackgroundColor:v7];

      uint64_t v8 = +[UIColor secondaryLabelColor];
      [*(id *)((char *)&self->_iconOffset.y + 1) setTextColor:v8];

      uint64_t v9 = +[MailboxTableCell titleFont];
      [*(id *)((char *)&self->_iconOffset.y + 1) setFont:v9];

      [*(id *)((char *)&self->_iconOffset.y + 1) setTextAlignment:2];
      [(MailboxTableCell *)self _updateUnreadCountLabelVisibilityAnimated:0];
    }
    id v10 = +[NSNumberFormatter ef_formatUnsignedInteger:a3 withGrouping:0];
    [*(id *)((char *)&self->_iconOffset.y + 1) setText:v10];

    [(MailboxTableCell *)self setNeedsLayout];
  }
  else
  {
    [(MailboxTableCell *)self _removeUnreadCount];
  }
}

- (void)_updateMailboxName
{
  if ([*(id *)(&self->super._shouldDisableWhileEditing + 1) count] == (id)1)
  {
    BOOL v3 = +[MailChangeManager sharedChangeManager];
    BOOL v4 = [*(id *)(&self->super._shouldDisableWhileEditing + 1) anyObject];
    id v5 = [v3 displayNameUsingSpecialNamesForMailbox:v4];

    [(MailboxTableCell *)self setTitle:v5];
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MailboxTableCell;
  [(MailboxTableCell *)&v11 setHighlighted:a3 animated:a4];
  id v6 = [(MailboxTableCell *)self traitCollection];
  unsigned __int8 v7 = [v6 mf_useSplitViewStyling];

  if ((v7 & 1) == 0 && ([(MailboxTableCell *)self isEditing] & 1) == 0)
  {
    if (v4)
    {
      uint64_t v8 = +[UIColor _tertiaryFillColor];
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v9 = [(MailboxTableCell *)self traitCollection];
      uint64_t v8 = +[UIColor mailCellSelectionStateColorForInterfaceLevel:](UIColor, "mailCellSelectionStateColorForInterfaceLevel:", [v9 userInterfaceLevel]);
    }
    id v10 = [(MailboxTableCell *)self selectedBackgroundView];
    [v10 setBackgroundColor:v8];

    if (!v4) {
  }
    }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MailboxTableCell;
  [(MFTableViewCell *)&v3 prepareForReuse];
  [(MailboxTableCell *)self setExpandable:0];
  [(MailboxTableCell *)self setExpanded:0];
  [(MailboxTableCell *)self setForceZeroSeparatorInset:0];
  [(MailboxTableCell *)self setExtraIndentLevel:0];
  [(MailboxTableCell *)self setFlattenHierarchy:0];
  [(MailboxTableCell *)self _doCleanupExpansionAccessoryViews];
  [(MailboxTableCell *)self setCellEnabled:1];
  [(MailboxTableCell *)self setDisabledForEditing:0];
  [(MailboxTableCell *)self setTitleColor:0];
  [(MailboxTableCell *)self setDetailsDisclosureButton:0];
  [(MailboxTableCell *)self setSubtitle:0];
}

- (id)_multiselectBackgroundColor
{
  return +[UIColor clearColor];
}

- (void)_updateViewConfigurationsWithState:(unint64_t)a3
{
  id v6 = [(MailboxTableCell *)self traitCollection];
  unsigned __int8 v5 = [v6 mf_useSplitViewStyling];

  if (v5)
  {
    if ([(MailboxTableCell *)self isExpandable]) {
      +[_UIBackgroundViewConfiguration defaultOutlineParentCellConfigurationForState:a3];
    }
    else {
    id v7 = +[_UIBackgroundViewConfiguration defaultOutlineCellConfigurationForState:a3];
    }
    [v7 setEdgesAddingLayoutMarginsToBackgroundInsets:10];
    [v7 setBackgroundInsets:0.0, -8.0, 0.0, -8.0];
    [(MailboxTableCell *)self _setBackgroundViewConfiguration:v7];
  }
}

- (id)_expansionAccessoryImageView
{
  uint64_t v2 = +[UIImage systemImageNamed:MFImageGlyphFavoriteExpandMailbox];
  objc_super v3 = +[UIImage mf_symbolConfigurationForView:9];
  [v2 size];
  id v6 = [objc_alloc((Class)UIImageView) initWithFrame:0.0, 0.0, v4 + -6.0, v5];
  [v6 setImage:v2];
  [v6 setPreferredSymbolConfiguration:v3];
  [v6 setContentMode:4];
  id v7 = +[UIColor tertiaryLabelColor];
  [v6 setTintColor:v7];

  return v6;
}

- (UIImageView)expansionAccessoryImageView
{
  objc_super v3 = *(UIFont **)((char *)&self->_preferredSubtitleFont + 1);
  if (!v3)
  {
    double v4 = [(MailboxTableCell *)self _expansionAccessoryImageView];
    double v5 = *(UIFont **)((char *)&self->_preferredSubtitleFont + 1);
    *(UIFont **)((char *)&self->_preferredSubtitleFont + 1) = v4;

    objc_super v3 = *(UIFont **)((char *)&self->_preferredSubtitleFont + 1);
  }

  return (UIImageView *)v3;
}

- (UIImageView)expansionEditingAccessoryImageView
{
  objc_super v3 = *(UIImageView **)((char *)&self->_expansionAccessoryImageView + 1);
  if (!v3)
  {
    double v4 = [(MailboxTableCell *)self _expansionAccessoryImageView];
    double v5 = *(UIImageView **)((char *)&self->_expansionAccessoryImageView + 1);
    *(UIImageView **)((char *)&self->_expansionAccessoryImageView + 1) = v4;

    objc_super v3 = *(UIImageView **)((char *)&self->_expansionAccessoryImageView + 1);
  }

  return (UIImageView *)v3;
}

- (void)_doCleanupExpansionAccessoryViews
{
  if (*(UIFont **)((char *)&self->_preferredSubtitleFont + 1))
  {
    [(MailboxTableCell *)self setAccessoryView:0];
    [(MailboxTableCell *)self setExpansionAccessoryImageView:0];
  }
  if (*(UIImageView **)((char *)&self->_expansionAccessoryImageView + 1))
  {
    [(MailboxTableCell *)self setEditingAccessoryView:0];
    [(MailboxTableCell *)self setExpansionEditingAccessoryImageView:0];
  }
}

- (void)_doRefreshExpansionAccessoryImageView
{
  if ([(MailboxTableCell *)self isExpandable])
  {
    objc_super v3 = [(MailboxTableCell *)self accessoryView];
    double v4 = [(MailboxTableCell *)self expansionAccessoryImageView];

    if (v3 != v4)
    {
      double v5 = [(MailboxTableCell *)self expansionAccessoryImageView];
      [(MailboxTableCell *)self setAccessoryView:v5];
    }
    id v6 = [(MailboxTableCell *)self editingAccessoryView];
    id v7 = [(MailboxTableCell *)self expansionEditingAccessoryImageView];

    if (v6 != v7)
    {
      uint64_t v8 = [(MailboxTableCell *)self expansionEditingAccessoryImageView];
      [(MailboxTableCell *)self setEditingAccessoryView:v8];
    }
    unsigned int v9 = [(MailboxTableCell *)self _shouldReverseLayoutDirection];
    double v10 = -1.57079633;
    *(void *)&long long v11 = -1;
    *((void *)&v11 + 1) = -1;
    *(_OWORD *)&v19.c = v11;
    *(_OWORD *)&v19.tdouble x = v11;
    if (v9) {
      double v10 = 1.57079633;
    }
    *(_OWORD *)&v19.a = v11;
    CGAffineTransformMakeRotation(&v19, v10);
    if ([(MailboxTableCell *)self isExpanded])
    {
      long long v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&v19.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v19.c = v12;
      *(_OWORD *)&v19.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    }
    CGAffineTransform v18 = v19;
    id v13 = [(MailboxTableCell *)self accessoryView];
    CGAffineTransform v17 = v18;
    [v13 setTransform:&v17];

    CGAffineTransform v16 = v19;
    objc_super v14 = [(MailboxTableCell *)self editingAccessoryView];
    CGAffineTransform v15 = v16;
    [v14 setTransform:&v15];
  }
  else
  {
    [(MailboxTableCell *)self _doCleanupExpansionAccessoryViews];
  }
}

- (void)setExpanded:(BOOL)a3
{
  if (LOBYTE(self->_level) != a3)
  {
    LOBYTE(self->_level) = a3;
    [(MailboxTableCell *)self _doRefreshExpansionAccessoryImageView];
    [(MailboxTableCell *)self _updateUnreadCountLabelVisibilityAnimated:0];
  }
}

- (void)setExpandable:(BOOL)a3
{
  if (HIBYTE(self->_detailsDisclosureButton) != a3)
  {
    HIBYTE(self->_detailsDisclosureButton) = a3;
    [(MailboxTableCell *)self _doRefreshExpansionAccessoryImageView];
    [(MailboxTableCell *)self _updateUnreadCountLabelVisibilityAnimated:0];
    uint64_t detailsDisclosureButton_high = HIBYTE(self->_detailsDisclosureButton);
    [(MailboxTableCell *)self setForceZeroSeparatorInset:detailsDisclosureButton_high];
  }
}

- (void)setForceZeroSeparatorInset:(BOOL)a3
{
  if (BYTE1(self->_level) != a3)
  {
    BYTE1(self->_level) = a3;
    [(MailboxTableCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  objc_super v3 = [(MailboxTableCell *)self imageView];
  double v4 = [v3 image];

  if (*(void *)((char *)&self->_iconOffset.y + 1)) {
    unsigned int v5 = [(MailboxTableCell *)self _shouldUnreadCountBeVisible];
  }
  else {
    unsigned int v5 = 0;
  }
  if ((([(MailboxTableCell *)self isEditing] & 1) != 0
     || ![(MailboxTableCell *)self accessoryType])
    && [(MailboxTableCell *)self isEditing])
  {
    [(MailboxTableCell *)self editingAccessoryType];
  }
  id v6 = [(MailboxTableCell *)self effectiveUserInterfaceLayoutDirection];
  if ([(MailboxTableCell *)self flattenHierarchy]) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = *(_DWORD *)((char *)&self->_detailsDisclosureButton + 1) + *(_DWORD *)((char *)&self->_titleColor + 1);
  }
  uint64_t v8 = v7;
  double v9 = sub_100216C08(v7);
  v180.receiver = self;
  v180.super_class = (Class)MailboxTableCell;
  [(MailboxTableCell *)&v180 layoutSubviews];
  double v10 = 0.0;
  if (![(MailboxTableCell *)self forceZeroSeparatorInset])
  {
    if (v4)
    {
      long long v11 = [UIApp preferredContentSizeCategory];
      BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v11);

      if (v8) {
        BOOL v13 = 0;
      }
      else {
        BOOL v13 = IsAccessibilityCategory;
      }
      if (v13) {
        goto LABEL_23;
      }
    }
    else if (!v8)
    {
      goto LABEL_23;
    }
    if (v6)
    {
      [(MailboxTableCell *)self bounds];
      double Width = CGRectGetWidth(v181);
      CGAffineTransform v15 = [(MailboxTableCell *)self contentView];
      [v15 frame];
      double v16 = Width - CGRectGetMaxX(v182);
    }
    else
    {
      CGAffineTransform v15 = [(MailboxTableCell *)self contentView];
      [v15 frame];
    }
    double v10 = v9 + v16;
  }
LABEL_23:
  -[MailboxTableCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v10, 0.0, 0.0);
  CGAffineTransform v17 = [(MailboxTableCell *)self contentView];
  [v17 bounds];
  CGFloat v176 = v19;
  CGFloat rect = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v24 = [(MailboxTableCell *)self contentView];
  [v24 frame];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  if ([(MailboxTableCell *)self isExpandable])
  {
    v33 = [UIApp preferredContentSizeCategory];
    BOOL v34 = UIContentSizeCategoryIsAccessibilityCategory(v33);

    double v35 = 12.5;
    if (v6) {
      int v36 = v34;
    }
    else {
      int v36 = 1;
    }
    if (v36) {
      double v35 = 0.0;
    }
    double v37 = v26 - v35;
    if (v34) {
      double v38 = v30;
    }
    else {
      double v38 = v30 + 12.5;
    }
    v39 = [(MailboxTableCell *)self contentView];
    [v39 setFrame:v37, v28, v38, v32];

    v40 = [(MailboxTableCell *)self accessoryView];
    [v40 frame];
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;

    if (v6) {
      double v47 = 8.0;
    }
    else {
      double v47 = v38;
    }
    v48 = [(MailboxTableCell *)self accessoryView];
    [v48 setFrame:v47, v42, v44, v46];
  }
  if (v4)
  {
    v49 = [UIApp preferredContentSizeCategory];
    BOOL v50 = UIContentSizeCategoryIsAccessibilityCategory(v49);

    if (!v50)
    {
      v56 = [(MailboxTableCell *)self imageView];
      [v56 frame];
      CGFloat v58 = v57;
      double v60 = v59;
      double v62 = v61;
      double v64 = v63;

      sub_100216CA0(v8);
      v183.origin.double x = v58;
      v183.origin.CGFloat y = v60;
      v183.size.double width = v62;
      v183.size.CGFloat height = v64;
      CGRectGetWidth(v183);
      UIRoundToViewScale();
      double v66 = v65 + *(double *)((char *)&self->_mailboxes + 1);
      if (v6)
      {
        v184.origin.CGFloat y = v176;
        v184.origin.double x = rect;
        v184.size.double width = v21;
        v184.size.CGFloat height = v23;
        double v67 = CGRectGetWidth(v184);
        v185.origin.double x = v66;
        v185.origin.CGFloat y = v60;
        v185.size.double width = v62;
        v185.size.CGFloat height = v64;
        double v66 = v67 - CGRectGetMaxX(v185);
      }
      v68 = [(MailboxTableCell *)self imageView];
      [v68 setFrame:v66, v60, v62, v64];

LABEL_47:
      int v55 = 0;
      goto LABEL_48;
    }
  }
  v51 = [UIApp preferredContentSizeCategory];
  BOOL v52 = UIContentSizeCategoryIsAccessibilityCategory(v51);

  if (!v52)
  {
    double v9 = v9 - sub_100216C08(v8);
    if (v9 < 8.0)
    {
      int v55 = 1;
      double v9 = 8.0;
      goto LABEL_48;
    }
    goto LABEL_47;
  }
  v53 = [UIApp preferredContentSizeCategory];
  BOOL v54 = UIContentSizeCategoryIsAccessibilityCategory(v53);

  if (v4) {
    int v55 = 0;
  }
  else {
    int v55 = v54;
  }
LABEL_48:
  v69 = [(MailboxTableCell *)self contentView];
  [v69 bounds];
  CGRectGetMaxX(v186);

  [(MailboxTableCell *)self isExpandable];
  if (v6)
  {
    v187.origin.CGFloat y = v176;
    v187.origin.double x = rect;
    v187.size.double width = v21;
    v187.size.CGFloat height = v23;
    CGRectGetMinX(v187);
  }
  v70 = *(void **)((char *)&self->_iconOffset.y + 1);
  if (v70)
  {
    [v70 sizeToFit];
    [*(id *)((char *)&self->_iconOffset.y + 1) frame];
    CGFloat v75 = v72;
    CGFloat v76 = v73;
    CGFloat height = v74;
    if (!v6) {
      CGRectGetWidth(*(CGRect *)&v71);
    }
    UIRoundToViewScale();
    double x = v188.origin.x;
    v188.origin.CGFloat y = v75;
    v188.size.double width = v76;
    v188.size.CGFloat height = height;
    CGRectGetHeight(v188);
    UIRoundToViewScale();
    CGFloat y = v79;
    double v177 = x;
    [*(id *)((char *)&self->_iconOffset.y + 1) setFrame:x];
  }
  else
  {
    CGFloat v76 = CGRectZero.size.width;
    CGFloat y = CGRectZero.origin.y;
    double v177 = CGRectZero.origin.x;
    CGFloat height = CGRectZero.size.height;
  }
  v80 = *(UILabel **)((char *)&self->_unreadCountLabel + 1);
  if (v80)
  {
    double v81 = v9;
    [v80 frame];
    CGFloat v86 = v83;
    double v87 = v84;
    double v88 = v85;
    if (v6)
    {
      [*(id *)((char *)&self->_iconOffset.y + 1) frame];
      CGRectGetMaxX(v189);
    }
    else
    {
      CGRectGetWidth(*(CGRect *)&v82);
      v89 = *(void **)((char *)&self->_iconOffset.y + 1);
      if (v89)
      {
        [v89 frame];
        CGRectGetWidth(v190);
      }
    }
    UIRoundToViewScale();
    double v90 = v191.origin.x;
    v191.origin.CGFloat y = v86;
    v191.size.double width = v87;
    v191.size.CGFloat height = v88;
    CGRectGetHeight(v191);
    UIRoundToViewScale();
    [*(id *)((char *)&self->_unreadCountLabel + 1) setFrame:v90, v91, v87, v88];
    double v9 = v81;
  }
  v92 = [(MailboxTableCell *)self traitCollection];
  id v93 = [v92 _splitViewControllerContext];

  unsigned __int8 v94 = [(MailboxTableCell *)self _viewConfigurationState];
  double recta = height;
  if ([(MailboxTableCell *)self isExpandable])
  {
    v95 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline addingSymbolicTraits:0x8000 options:0];
    v96 = [(MailboxTableCell *)self textLabel];
    v97 = +[UIFont fontWithDescriptor:v95 size:0.0];
    [v96 setFont:v97];

    v98 = [(MailboxTableCell *)self textLabel];
    v99 = +[UIColor mailAccountCellTitleColor];
    [v98 setTextColor:v99];

    v100 = [(MailboxTableCell *)self textLabel];
    v101 = +[UIColor clearColor];
    [v100 setBackgroundColor:v101];

    double v9 = 8.0;
  }
  else if ([(MailboxTableCell *)self isCellEnabled])
  {
    uint64_t v102 = *(uint64_t *)((char *)&self->_userInfo + 1);
    if (v102)
    {
      v95 = [(MailboxTableCell *)self textLabel];
      [v95 setTextColor:v102];
      goto LABEL_69;
    }
    v167 = [(MailboxTableCell *)self traitCollection];
    int v168 = [v167 mf_useSplitViewStyling] & ((v94 & 4) != 0);

    if (v168 != 1 || v93 == (id)2)
    {
      v95 = +[UIColor labelColor];
      v100 = [(MailboxTableCell *)self textLabel];
      [v100 setTextColor:v95];
    }
    else
    {
      v169 = +[UIColor systemWhiteColor];
      v170 = [(MailboxTableCell *)self textLabel];
      [v170 setTextColor:v169];

      v95 = +[UIColor systemWhiteColor];
      v100 = [(MailboxTableCell *)self imageView];
      [v100 setTintColor:v95];
    }
  }
  else
  {
    v95 = [(MailboxTableCell *)self textLabel];
    v100 = +[UIColor secondaryLabelColor];
    [v95 setTextColor:v100];
  }

LABEL_69:
  v103 = [(MailboxTableCell *)self textLabel];
  [v103 frame];
  CGFloat v105 = v104;
  CGFloat v107 = v106;

  CGFloat v171 = v76;
  if (!v6)
  {
    if (v5)
    {
      v194.origin.CGFloat y = y;
      v194.origin.double x = v177;
      v194.size.double width = v76;
      v194.size.CGFloat height = height;
      double v110 = CGRectGetMinX(v194) - v9 + -5.0;
      if (v55) {
        goto LABEL_76;
      }
    }
    else
    {
      v114 = [(MailboxTableCell *)self contentView];
      [v114 bounds];
      double v110 = CGRectGetMaxX(v197) - v9 + -5.0;

      if (v55) {
        goto LABEL_76;
      }
    }
LABEL_78:
    double v173 = v105;
    double v174 = v107;
    double v111 = v9;
    double v112 = v9;
    double v113 = v110;
    goto LABEL_79;
  }
  double v108 = 5.0;
  if (v5)
  {
    v192.origin.CGFloat y = y;
    v192.origin.double x = v177;
    v192.size.double width = v76;
    v192.size.CGFloat height = height;
    double v108 = CGRectGetMaxX(v192) + 5.0;
  }
  v109 = [(MailboxTableCell *)self contentView];
  [v109 bounds];
  double v110 = CGRectGetMaxX(v193) - v108 - v9;

  double v9 = v108;
  if (!v55) {
    goto LABEL_78;
  }
LABEL_76:
  double v111 = v9;
  v195.origin.double x = v9;
  v195.origin.CGFloat y = v105;
  v195.size.double width = v110;
  v195.size.CGFloat height = v107;
  CGRect v196 = CGRectInset(v195, 12.0, 0.0);
  double v112 = v196.origin.x;
  double v173 = v196.origin.y;
  double v174 = v196.size.height;
  double v113 = v196.size.width;
LABEL_79:
  v115 = [(MailboxTableCell *)self detailTextLabel];
  [v115 frame];
  double v117 = v116;
  double v119 = v118;
  double v121 = v120;
  double v123 = v122;

  if ([(MailboxTableCell *)self style] == (id)3
    || ([UIApp preferredContentSizeCategory],
        v124 = (NSString *)objc_claimAutoreleasedReturnValue(),
        BOOL v125 = UIContentSizeCategoryIsAccessibilityCategory(v124),
        v124,
        v125))
  {
    double v121 = v110;
  }
  else
  {
    double v111 = v117;
  }
  v126 = [UIApp preferredContentSizeCategory];
  BOOL v127 = UIContentSizeCategoryIsAccessibilityCategory(v126);

  v128 = [(MailboxTableCell *)self textLabel];
  v129 = v128;
  if (v127)
  {
    v130 = +[MailboxTableCell titleFont];
    [v130 lineHeight];
    [v129 sizeThatFits:v110, v131 + v131];
    double v133 = v132;

    CGFloat v134 = v133 + 0.0;
    v198.origin.CGFloat y = 0.0;
    v198.origin.double x = v112;
    v198.size.double width = v113;
    v198.size.CGFloat height = v133;
    v205.origin.double x = v111;
    v205.origin.CGFloat y = v133 + 0.0;
    v205.size.double width = v121;
    v205.size.CGFloat height = v123;
    CGRect v199 = CGRectUnion(v198, v205);
    double v135 = v199.size.height;
    [(MailboxTableCell *)self bounds];
    CGFloat v137 = ceil((v136 - v135) * 0.5);
    v200.origin.CGFloat y = 0.0;
    v200.origin.double x = v112;
    v200.size.double width = v113;
    v200.size.CGFloat height = v133;
    CGRect v201 = CGRectOffset(v200, 0.0, v137);
    double v138 = v201.origin.x;
    v201.origin.double x = v111;
    double v139 = v201.origin.y;
    double v140 = v201.size.width;
    double v141 = v201.size.height;
    v201.origin.CGFloat y = v134;
    v201.size.double width = v121;
    v201.size.CGFloat height = v123;
    CGRect v202 = CGRectOffset(v201, 0.0, v137);
    double v142 = v202.origin.x;
    double v143 = v202.origin.y;
    double v144 = v202.size.width;
    double v145 = v202.size.height;
    v146 = [(MailboxTableCell *)self textLabel];
    [v146 setFrame:v138, v139, v140, v141];

    v147 = [(MailboxTableCell *)self detailTextLabel];
    [v147 setFrame:v142, v143, v144, v145];

    v148 = [(MailboxTableCell *)self textLabel];
    [v148 _firstLineBaselineFrameOriginY];
    double v150 = v149;
    v151 = +[MailboxTableCell titleFont];
    [v151 capHeight];
    double v153 = v150 + v152 * -0.5;

    if (*(void *)((char *)&self->_iconOffset.y + 1))
    {
      v203.origin.CGFloat y = y;
      v203.origin.double x = v177;
      v203.size.double width = v172;
      v203.size.CGFloat height = recta;
      CGRectGetHeight(v203);
      UIRoundToViewScale();
      [*(id *)((char *)&self->_iconOffset.y + 1) setFrame:v177, v153 - v154, v172, recta];
    }
    v155 = [(MailboxTableCell *)self accessoryView];
    v156 = v155;
    if (v155)
    {
      [v155 frame];
      double v157 = v204.origin.x;
      double v158 = v204.size.width;
      double v159 = v204.size.height;
      CGRectGetHeight(v204);
      UIRoundToViewScale();
      [v156 setFrame:v157 v153 - v160 v158 v159];
    }
  }
  else
  {
    [v128 setFrame:v112, v173, v113, v174];

    v156 = [(MailboxTableCell *)self detailTextLabel];
    [v156 setFrame:v111, v119, v121, v123];
  }

  v161 = [(MailboxTableCell *)self traitCollection];
  if (objc_msgSend(v161, "mf_useSplitViewStyling")) {
    goto LABEL_90;
  }
  unsigned __int8 v162 = [(MailboxTableCell *)self isEditing];

  if ((v162 & 1) == 0)
  {
    unsigned int v163 = [(MailboxTableCell *)self isHighlighted];
    char v164 = v163;
    if (v163)
    {
      v165 = +[UIColor _tertiaryFillColor];
      v161 = v165;
    }
    else
    {
      v161 = [(MailboxTableCell *)self traitCollection];
      v165 = +[UIColor mailCellSelectionStateColorForInterfaceLevel:](UIColor, "mailCellSelectionStateColorForInterfaceLevel:", [v161 userInterfaceLevel]);
    }
    v166 = [(MailboxTableCell *)self selectedBackgroundView];
    [v166 setBackgroundColor:v165];

    if ((v164 & 1) == 0) {
LABEL_90:
    }
  }
}

- (CGPoint)destinationPointForAnimation
{
  [(MailboxTableCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  long long v11 = [(MailboxTableCell *)self textLabel];
  [v11 frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  double v20 = [(MailboxTableCell *)self traitCollection];
  id v21 = [v20 horizontalSizeClass];

  v28.origin.double x = v4;
  v28.origin.CGFloat y = v6;
  v28.size.double width = v8;
  v28.size.CGFloat height = v10;
  CGFloat MidY = CGRectGetMidY(v28);
  v29.origin.double x = v13;
  v29.origin.CGFloat y = v15;
  v29.size.double width = v17;
  v29.size.CGFloat height = v19;
  double MidX = CGRectGetMidX(v29);
  double v24 = 3.0;
  if (v21 == (id)1) {
    double v24 = 2.0;
  }
  double v25 = v8 / v24;
  if (v25 >= MidX) {
    double MidX = v25;
  }
  double v26 = MidY;
  result.CGFloat y = v26;
  result.double x = MidX;
  return result;
}

- (id)_scriptingInfo
{
  v8.receiver = self;
  v8.super_class = (Class)MailboxTableCell;
  double v3 = [(MailboxTableCell *)&v8 _scriptingInfo];
  if ([*(id *)(&self->super._shouldDisableWhileEditing + 1) count] == (id)1)
  {
    CGFloat v4 = +[MailChangeManager sharedChangeManager];
    double v5 = [*(id *)(&self->super._shouldDisableWhileEditing + 1) anyObject];
    CGFloat v6 = [v4 displayNameUsingSpecialNamesForMailbox:v5];

    [v3 setValue:v6 forKey:@"ID"];
  }

  return v3;
}

- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5
{
  double v5 = +[EFScheduler mainThreadScheduler];
  [v5 performBlock:&v6];
}

- (unsigned)flattenHierarchy
{
  return *(_DWORD *)&self->_hideUnreadCountForEditing;
}

- (void)setFlattenHierarchy:(unsigned int)a3
{
  *(_DWORD *)&self->_hideUnreadCountForEditing = a3;
}

- (id)userInfo
{
  return *(id *)&self->_shouldShowUnreadCount;
}

- (void)setUserInfo:(id)a3
{
}

- (UIColor)titleColor
{
  return *(UIColor **)((char *)&self->_userInfo + 1);
}

- (void)setTitleColor:(id)a3
{
}

- (BOOL)hideUnreadCountForEditing
{
  return BYTE6(self->_detailsDisclosureButton);
}

- (void)setHideUnreadCountForEditing:(BOOL)a3
{
  BYTE6(self->_detailsDisclosureButton) = a3;
}

- (BOOL)isExpandable
{
  return HIBYTE(self->_detailsDisclosureButton);
}

- (BOOL)isExpanded
{
  return self->_level;
}

- (int64_t)extraIndentLevel
{
  return *(int64_t *)((char *)&self->_titleColor + 1);
}

- (void)setExtraIndentLevel:(int64_t)a3
{
  *(UIColor **)((char *)&self->_titleColor + 1) = (UIColor *)a3;
}

- (BOOL)forceZeroSeparatorInset
{
  return BYTE1(self->_level);
}

- (UIFont)preferredSubtitleFont
{
  return *(UIFont **)((char *)&self->_extraIndentLevel + 1);
}

- (void)setExpansionAccessoryImageView:(id)a3
{
}

- (void)setExpansionEditingAccessoryImageView:(id)a3
{
}

- (EFCancelable)unreadCountToken
{
  return *(EFCancelable **)((char *)&self->_expansionEditingAccessoryImageView + 1);
}

- (void)setUnreadCountToken:(id)a3
{
}

- (EFDebouncer)countDebouncer
{
  return *(EFCancelable **)((char *)&self->_unreadCountToken + 1);
}

- (BOOL)shouldShowUnreadCount
{
  return BYTE2(self->_level);
}

- (void)setShouldShowUnreadCount:(BOOL)a3
{
  BYTE2(self->_level) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_unreadCountToken + 1), 0);
  objc_storeStrong((id *)((char *)&self->_expansionEditingAccessoryImageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_expansionAccessoryImageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_preferredSubtitleFont + 1), 0);
  objc_storeStrong((id *)((char *)&self->_extraIndentLevel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_userInfo + 1), 0);
  objc_storeStrong((id *)&self->_shouldShowUnreadCount, 0);
  objc_storeStrong((id *)((char *)&self->_unreadCountLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_iconOffset.y + 1), 0);
  objc_storeStrong((id *)((char *)&self->_legacyMailboxes + 1), 0);

  objc_storeStrong((id *)(&self->super._shouldDisableWhileEditing + 1), 0);
}

@end