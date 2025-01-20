@interface NCNotificationRequestContentProvider
+ (id)defaultPrimaryTextForRequest:(id)a3;
+ (id)primaryTextForRequest:(id)a3 isThreadSummary:(BOOL)a4 summarizedNotificationsAllHaveMatchingPrimaryText:(BOOL)a5;
- (BOOL)isDateAllDay;
- (BOOL)isHidingContent;
- (BOOL)isHighlighted;
- (BOOL)isNumberOfLinesInfinite;
- (BOOL)isPrimarySubtitleTextDisplayingRecipientsSummary;
- (BOOL)isPrimarySubtitleTextDisplayingRequestTitle;
- (BOOL)isThreadSummary;
- (BOOL)showsTextInputOnAppearance;
- (BOOL)summarizedNotificationsAllHaveMatchingIcons;
- (BOOL)summarizedNotificationsAllHaveMatchingPrimaryText;
- (MTVisualStylingProvider)importantTextVisualStylingProvider;
- (NCBadgedIconView)badgedIconView;
- (NCNotificationAction)inlineAction;
- (NCNotificationRequest)notificationRequest;
- (NCNotificationRequestContentProvider)init;
- (NCNotificationRequestContentProvider)initWithNotificationRequest:(id)a3;
- (NCNotificationStaticContentProvidingDelegate)delegate;
- (NSArray)currentActions;
- (NSArray)icons;
- (NSArray)interfaceActions;
- (NSArray)menuActions;
- (NSArray)overriddenActions;
- (NSAttributedString)contentSummaryText;
- (NSAttributedString)secondaryText;
- (NSDate)date;
- (NSString)footerText;
- (NSString)importantText;
- (NSString)primarySubtitleText;
- (NSString)primaryText;
- (NSString)title;
- (NSTimeZone)timeZone;
- (UIImage)thumbnail;
- (UIView)communicationAvatar;
- (id)_actionForNotificationAction:(id)a3;
- (id)_applicationImages;
- (id)_criticalAlertIconAttributedStringWithImageConfiguration:(id)a3;
- (id)_iconImageForNotificationAction:(id)a3;
- (id)_intelligentManagementIconAttributedStringWithImageConfiguration:(id)a3;
- (id)_newAvatarView;
- (id)_newBadgedIconView;
- (id)badgeText;
- (id)cancelAction;
- (id)clearAction;
- (id)closeAction;
- (id)copyWithContentHidingEnforcement:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultAction;
- (id)importantAttributedTextWithImageConfiguration:(id)a3 importantAdornmentEligibleOptions:(unint64_t)a4;
- (id)nilAction;
- (id)summaryText;
- (int64_t)contentHidingEnforcement;
- (unint64_t)coalesceCount;
- (unint64_t)stackedNotificationsCount;
- (void)_invalidateCachedData;
- (void)setDelegate:(id)a3;
- (void)setIsThreadSummary:(BOOL)a3;
- (void)setNotificationRequest:(id)a3;
- (void)setOverriddenActions:(id)a3;
- (void)setPrimarySubtitleTextDisplayingRecipientsSummary:(BOOL)a3;
- (void)setPrimarySubtitleTextDisplayingRequestTitle:(BOOL)a3;
- (void)setStackedNotificationsCount:(unint64_t)a3;
- (void)setSummarizedNotificationsAllHaveMatchingIcons:(BOOL)a3;
- (void)setSummarizedNotificationsAllHaveMatchingPrimaryText:(BOOL)a3;
@end

@implementation NCNotificationRequestContentProvider

- (NCNotificationRequestContentProvider)initWithNotificationRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationRequestContentProvider;
  v6 = [(NCNotificationRequestContentProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_notificationRequest, a3);
  }

  return v7;
}

- (NCNotificationRequestContentProvider)init
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithNotificationRequest:self->_notificationRequest];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_storeWeak((id *)(v4 + 16), WeakRetained);

  *(void *)(v4 + 48) = self->_contentHidingEnforcement;
  objc_storeStrong((id *)(v4 + 24), self->_overriddenActions);
  uint64_t v6 = [(UIView *)self->_communicationAvatar copy];
  v7 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v6;

  uint64_t v8 = [(NCBadgedIconView *)self->_badgedIconView copy];
  objc_super v9 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v8;

  return (id)v4;
}

- (void)setNotificationRequest:(id)a3
{
  id v5 = (NCNotificationRequest *)a3;
  if (self->_notificationRequest != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_notificationRequest, a3);
    [(NCNotificationRequestContentProvider *)self _invalidateCachedData];
    id v5 = v6;
  }
}

- (BOOL)isPrimarySubtitleTextDisplayingRequestTitle
{
  v3 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  uint64_t v4 = [v3 content];
  id v5 = [v4 customHeader];
  if (v5)
  {
    uint64_t v6 = [(NCNotificationRequestContentProvider *)self notificationRequest];
    v7 = [v6 content];
    uint64_t v8 = [v7 title];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isPrimarySubtitleTextDisplayingRecipientsSummary
{
  if ([(NCNotificationRequestContentProvider *)self isPrimarySubtitleTextDisplayingRequestTitle])
  {
    return 0;
  }
  uint64_t v4 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  id v5 = [v4 content];
  uint64_t v6 = [v5 communicationContext];
  BOOL v3 = v6 != 0;

  return v3;
}

- (NCBadgedIconView)badgedIconView
{
  badgedIconView = self->_badgedIconView;
  if (badgedIconView)
  {
    uint64_t v4 = [(NCNotificationRequestContentProvider *)self badgeText];
    id v5 = [(NCBadgedIconView *)badgedIconView copyWithBadgeText:v4];
    uint64_t v6 = self->_badgedIconView;
    self->_badgedIconView = v5;
  }
  else
  {
    v7 = [(NCNotificationRequestContentProvider *)self _newBadgedIconView];
    uint64_t v4 = self->_badgedIconView;
    self->_badgedIconView = v7;
  }

  uint64_t v8 = self->_badgedIconView;

  return v8;
}

- (NSArray)icons
{
  v2 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  BOOL v3 = [v2 content];
  uint64_t v4 = [v3 icons];

  return (NSArray *)v4;
}

- (NSString)title
{
  BOOL v3 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  uint64_t v4 = [v3 content];
  id v5 = [v4 customHeader];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [(NCNotificationRequestContentProvider *)self notificationRequest];
    BOOL v9 = [v8 content];
    id v7 = [v9 defaultHeader];
  }
  if (v7)
  {
    v10 = [v7 localizedUppercaseString];
  }
  else
  {
    v11 = [(NCNotificationRequestContentProvider *)self notificationRequest];
    v12 = [v11 content];
    v13 = [v12 title];
    v10 = [v13 localizedUppercaseString];
  }

  return (NSString *)v10;
}

- (NSDate)date
{
  v2 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  BOOL v3 = [v2 content];
  uint64_t v4 = [v3 date];

  return (NSDate *)v4;
}

- (BOOL)isDateAllDay
{
  v2 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  BOOL v3 = [v2 content];
  char v4 = [v3 isDateAllDay];

  return v4;
}

- (NSTimeZone)timeZone
{
  v2 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  BOOL v3 = [v2 content];
  char v4 = [v3 timeZone];

  return (NSTimeZone *)v4;
}

- (NSString)primaryText
{
  BOOL v3 = objc_opt_class();
  char v4 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  id v5 = objc_msgSend(v3, "primaryTextForRequest:isThreadSummary:summarizedNotificationsAllHaveMatchingPrimaryText:", v4, -[NCNotificationRequestContentProvider isThreadSummary](self, "isThreadSummary"), -[NCNotificationRequestContentProvider summarizedNotificationsAllHaveMatchingPrimaryText](self, "summarizedNotificationsAllHaveMatchingPrimaryText"));

  return (NSString *)v5;
}

+ (id)defaultPrimaryTextForRequest:(id)a3
{
  return (id)[a1 primaryTextForRequest:a3 isThreadSummary:0 summarizedNotificationsAllHaveMatchingPrimaryText:0];
}

+ (id)primaryTextForRequest:(id)a3 isThreadSummary:(BOOL)a4 summarizedNotificationsAllHaveMatchingPrimaryText:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 content];
  BOOL v9 = [v8 customHeader];

  v10 = [v7 content];
  v11 = [v10 communicationContext];

  if (v9)
  {
    id v12 = v9;
  }
  else
  {
    if (!v11)
    {
      if (!v6 || v5)
      {
        v18 = [v7 content];
        v13 = [v18 title];
      }
      else
      {
        v13 = 0;
      }
      goto LABEL_9;
    }
    if (v6 && ([v11 isGroup] & 1) != 0)
    {
      id v12 = [v11 preferredRecipientsSummary];
    }
    else
    {
      id v12 = [v11 preferredSenderSummary];
    }
  }
  v13 = v12;
LABEL_9:
  if (![v13 length])
  {
    v14 = [v7 content];
    uint64_t v15 = [v14 defaultHeader];

    v13 = (void *)v15;
  }
  id v16 = v13;

  return v16;
}

- (NSString)primarySubtitleText
{
  BOOL v3 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  char v4 = [v3 content];
  BOOL v5 = [v4 communicationContext];

  if ([(NCNotificationRequestContentProvider *)self isPrimarySubtitleTextDisplayingRecipientsSummary])
  {
    BOOL v6 = [v5 preferredRecipientsSummary];
  }
  else
  {
    BOOL v7 = [(NCNotificationRequestContentProvider *)self isPrimarySubtitleTextDisplayingRequestTitle];
    uint64_t v8 = [(NCNotificationRequestContentProvider *)self notificationRequest];
    BOOL v9 = [v8 content];
    v10 = v9;
    if (v7) {
      [v9 title];
    }
    else {
    BOOL v6 = [v9 subtitle];
    }
  }

  return (NSString *)v6;
}

- (NSAttributedString)secondaryText
{
  BOOL v3 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  int v4 = [v3 isCollapsedNotification];

  BOOL v5 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  BOOL v6 = [v5 content];
  BOOL v7 = v6;
  if (v4)
  {
    uint64_t v8 = [v6 customHeader];
    BOOL v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v12 = [(NCNotificationRequestContentProvider *)self notificationRequest];
      v13 = [v12 content];
      id v10 = [v13 defaultHeader];
    }
    v14 = NSString;
    uint64_t v15 = NCUserNotificationsUIKitFrameworkBundle();
    id v16 = [v15 localizedStringForKey:@"COLLAPSED_NOTIFICATION_MESSAGE" value:&stru_1F2F516F8 table:0];
    v17 = [(NCNotificationRequestContentProvider *)self notificationRequest];
    BOOL v7 = objc_msgSend(v14, "stringWithFormat:", v16, objc_msgSend(v17, "collapsedNotificationsCount"), v10);

    v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7];
    BOOL v5 = v10;
  }
  else
  {
    v11 = [v6 attributedMessage];
  }

  return (NSAttributedString *)v11;
}

- (NSAttributedString)contentSummaryText
{
  BOOL v3 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  int v4 = [v3 options];
  if ([v4 canShowSummary])
  {
    BOOL v5 = [(NCNotificationRequestContentProvider *)self notificationRequest];
    BOOL v6 = [v5 content];
    BOOL v7 = [v6 summary];
  }
  else
  {
    BOOL v7 = 0;
  }

  return (NSAttributedString *)v7;
}

- (NSString)importantText
{
  v2 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  if ([v2 interruptionLevel] == 2)
  {
    BOOL v3 = NCUserNotificationsUIKitFrameworkBundle();
    int v4 = [v3 localizedStringForKey:@"TIME_SENSITIVE_TEXT" value:&stru_1F2F516F8 table:0];
    BOOL v5 = [v4 localizedUppercaseString];
  }
  else
  {
    BOOL v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)isHighlighted
{
  v2 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  if ([v2 isHighlight]) {
    char v3 = _NCIsNotificationHighlightsAllowed();
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)setIsThreadSummary:(BOOL)a3
{
  if (self->_isThreadSummary != a3)
  {
    self->_isThreadSummary = a3;
    badgedIconView = self->_badgedIconView;
    self->_badgedIconView = 0;
  }
}

- (id)importantAttributedTextWithImageConfiguration:(id)a3 importantAdornmentEligibleOptions:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  BOOL v7 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  uint64_t v8 = [v7 interruptionLevel];

  BOOL v9 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  id v10 = [v9 alertOptions];
  uint64_t v11 = [v10 intelligentBehavior];

  if ((v4 & 1) != 0 && v8 == 3)
  {
    id v12 = [(NCNotificationRequestContentProvider *)self _criticalAlertIconAttributedStringWithImageConfiguration:v6];
    v13 = (void *)[v12 mutableCopy];

    id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v15 = NSString;
    id v16 = NCUserNotificationsUIKitFrameworkBundle();
    v17 = v16;
    v18 = @"CRITICAL_TEXT";
LABEL_7:
    v20 = [v16 localizedStringForKey:v18 value:&stru_1F2F516F8 table:0];
    v21 = [v20 localizedUppercaseString];
    v22 = [v15 stringWithFormat:@" %@", v21];
    v23 = (void *)[v14 initWithString:v22];
    [v13 appendAttributedString:v23];

    goto LABEL_8;
  }
  v13 = 0;
  if ((v4 & 2) != 0 && v11 == 2)
  {
    v19 = [(NCNotificationRequestContentProvider *)self _intelligentManagementIconAttributedStringWithImageConfiguration:v6];
    v13 = (void *)[v19 mutableCopy];

    id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v15 = NSString;
    id v16 = NCUserNotificationsUIKitFrameworkBundle();
    v17 = v16;
    v18 = @"INTELLIGENCE_MAYBE_IMPORTANT";
    goto LABEL_7;
  }
LABEL_8:

  return v13;
}

- (MTVisualStylingProvider)importantTextVisualStylingProvider
{
  v2 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  uint64_t v3 = [v2 interruptionLevel];

  if (v3 == 3)
  {
    char v4 = (void *)MEMORY[0x1E4F743E8];
    BOOL v5 = NCUserNotificationsUIKitFrameworkBundle();
    id v6 = [v4 _visualStylingProviderForStyleSetNamed:@"notificationCritical" inBundle:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (MTVisualStylingProvider *)v6;
}

- (id)summaryText
{
  return 0;
}

- (NSString)footerText
{
  v2 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  uint64_t v3 = [v2 content];
  char v4 = [v3 footer];

  return (NSString *)v4;
}

- (BOOL)isNumberOfLinesInfinite
{
  v2 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  uint64_t v3 = [v2 options];
  char v4 = [v3 isNumberOfLinesInfinite];

  return v4;
}

- (UIImage)thumbnail
{
  v2 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  uint64_t v3 = [v2 content];
  char v4 = [v3 attachmentImage];

  return (UIImage *)v4;
}

- (UIView)communicationAvatar
{
  communicationAvatar = self->_communicationAvatar;
  if (communicationAvatar)
  {
    char v4 = (UIView *)[(UIView *)communicationAvatar copy];
    BOOL v5 = self->_communicationAvatar;
    self->_communicationAvatar = v4;
  }
  else
  {
    BOOL v5 = [(NCNotificationRequestContentProvider *)self notificationRequest];
    if (+[NCAvatarView isAvatarPossibleWithNotificationRequest:v5])
    {
      id v6 = [(NCNotificationRequestContentProvider *)self _newAvatarView];
    }
    else
    {
      id v6 = 0;
    }
    BOOL v7 = self->_communicationAvatar;
    self->_communicationAvatar = v6;
  }
  uint64_t v8 = self->_communicationAvatar;

  return v8;
}

- (NSArray)interfaceActions
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v17 = objc_opt_new();
  objc_initWeak(&location, self);
  uint64_t v3 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  if ([v3 showsTextInputOnAppearance])
  {
    char v4 = [(NCNotificationRequestContentProvider *)self overriddenActions];
    BOOL v5 = v4 == 0;

    if (v5) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  [(NCNotificationRequestContentProvider *)self currentActions];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = [v10 title];
        if (v11)
        {
          if ([v10 isDestructiveAction]) {
            uint64_t v12 = 2;
          }
          else {
            uint64_t v12 = 0;
          }
          v13 = (void *)MEMORY[0x1E4FB1858];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __56__NCNotificationRequestContentProvider_interfaceActions__block_invoke;
          v18[3] = &unk_1E6A93EF0;
          objc_copyWeak(&v19, &location);
          v18[4] = v10;
          id v14 = [v13 actionWithTitle:v11 type:v12 handler:v18];
          [v17 addObject:v14];

          objc_destroyWeak(&v19);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

LABEL_18:
  uint64_t v15 = (void *)[v17 copy];
  objc_destroyWeak(&location);

  return (NSArray *)v15;
}

void __56__NCNotificationRequestContentProvider_interfaceActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  [v2 contentProvider:WeakRetained performAction:*(void *)(a1 + 32) animated:1];
}

- (NSArray)menuActions
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  val = self;
  uint64_t v3 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  if ([v3 showsTextInputOnAppearance])
  {
    char v4 = [(NCNotificationRequestContentProvider *)self overriddenActions];

    if (!v4) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  BOOL v5 = [(NCNotificationRequestContentProvider *)val currentActions];
  objc_initWeak(&location, val);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v10 = [v9 title];
        if (v10)
        {
          uint64_t v11 = [(NCNotificationRequestContentProvider *)val notificationRequest];
          uint64_t v12 = [v11 notificationIdentifier];
          v13 = objc_msgSend(v12, "un_logDigest");
          id v14 = [v13 stringByAppendingPathExtension:v10];

          uint64_t v15 = (void *)MEMORY[0x1E4FB13F0];
          id v16 = [(NCNotificationRequestContentProvider *)val _iconImageForNotificationAction:v9];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __51__NCNotificationRequestContentProvider_menuActions__block_invoke;
          v23[3] = &unk_1E6A93D50;
          objc_copyWeak(&v24, &location);
          v23[4] = v9;
          v17 = [v15 actionWithTitle:v10 image:v16 identifier:v14 handler:v23];

          if ([v9 isDestructiveAction]) {
            uint64_t v18 = 10;
          }
          else {
            uint64_t v18 = 8;
          }
          [v17 setAttributes:v18];
          [v21 addObject:v17];

          objc_destroyWeak(&v24);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  objc_destroyWeak(&location);
LABEL_18:

  return (NSArray *)v21;
}

void __51__NCNotificationRequestContentProvider_menuActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  [v2 contentProvider:WeakRetained performAction:*(void *)(a1 + 32) animated:1];
}

- (id)_actionForNotificationAction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__NCNotificationRequestContentProvider__actionForNotificationAction___block_invoke;
  aBlock[3] = &unk_1E6A93870;
  objc_copyWeak(&v11, &location);
  id v5 = v4;
  id v10 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = (void *)[v6 copy];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __69__NCNotificationRequestContentProvider__actionForNotificationAction___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained delegate];
  [v4 contentProvider:WeakRetained performAction:*(void *)(a1 + 32) animated:a2];
}

- (id)defaultAction
{
  uint64_t v3 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  id v4 = [v3 defaultAction];

  if (v4)
  {
    id v5 = [(NCNotificationRequestContentProvider *)self _actionForNotificationAction:v4];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = _Block_copy(v5);

  return v6;
}

- (id)cancelAction
{
  uint64_t v3 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  id v4 = [v3 cancelAction];
  id v5 = [(NCNotificationRequestContentProvider *)self _actionForNotificationAction:v4];

  return v5;
}

- (id)clearAction
{
  uint64_t v3 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  id v4 = [v3 clearAction];
  id v5 = [(NCNotificationRequestContentProvider *)self _actionForNotificationAction:v4];

  return v5;
}

- (id)closeAction
{
  uint64_t v3 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  id v4 = [v3 closeAction];
  id v5 = [(NCNotificationRequestContentProvider *)self _actionForNotificationAction:v4];

  return v5;
}

- (id)nilAction
{
  return [(NCNotificationRequestContentProvider *)self _actionForNotificationAction:0];
}

- (BOOL)showsTextInputOnAppearance
{
  v2 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  char v3 = [v2 showsTextInputOnAppearance];

  return v3;
}

- (NCNotificationAction)inlineAction
{
  v2 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  char v3 = [v2 inlineAction];

  return (NCNotificationAction *)v3;
}

- (NSArray)currentActions
{
  char v3 = [(NCNotificationRequestContentProvider *)self overriddenActions];
  if (v3)
  {
    id v4 = [(NCNotificationRequestContentProvider *)self overriddenActions];
  }
  else
  {
    id v5 = [(NCNotificationRequestContentProvider *)self notificationRequest];
    id v4 = [v5 defaultEnvironmentActions];
  }
  uint64_t v6 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  uint64_t v7 = [v6 inlineAction];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
    [v8 addObjectsFromArray:v4];
  }
  else
  {
    id v8 = v4;
  }

  return (NSArray *)v8;
}

- (unint64_t)coalesceCount
{
  return 1;
}

- (BOOL)isHidingContent
{
  return 0;
}

- (id)copyWithContentHidingEnforcement:(int64_t)a3
{
  id result = (id)[(NCNotificationRequestContentProvider *)self copy];
  *((void *)result + 6) = a3;
  return result;
}

- (id)_applicationImages
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v2 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  char v3 = [v2 parentSectionIdentifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 sectionIdentifier];
  }
  uint64_t v6 = v5;

  uint64_t v7 = NCIconImageForApplicationIdentifierWithFormat(v6, 0, 1);
  uint64_t v8 = NCIconImageForApplicationIdentifierWithFormat(v6, 0, 2);
  BOOL v9 = 0;
  if (v7 | v8)
  {
    id v10 = (void *)v7;
    if (!v7)
    {
      id v10 = [MEMORY[0x1E4F1CA98] null];
    }
    v13[0] = v10;
    id v11 = (void *)v8;
    if (!v8)
    {
      id v11 = [MEMORY[0x1E4F1CA98] null];
    }
    v13[1] = v11;
    BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    if (v8)
    {
      if (v7) {
        goto LABEL_11;
      }
    }
    else
    {

      if (v7) {
        goto LABEL_11;
      }
    }
  }
LABEL_11:

  return v9;
}

- (id)_iconImageForNotificationAction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 iconImageName];
  if (![v5 length])
  {
    uint64_t v8 = 0;
    goto LABEL_18;
  }
  uint64_t v6 = [v4 iconImageBundlePath];
  if (![v6 length])
  {
    BOOL v9 = [(NCNotificationRequestContentProvider *)self notificationRequest];
    id v10 = [v9 sectionIdentifier];
    int v11 = objc_msgSend(v10, "un_isFirstPartyIdentifier");

    if (v11) {
      [MEMORY[0x1E4FB1818] _systemImageNamed:v5];
    }
    else {
    uint64_t v8 = [MEMORY[0x1E4FB1818] systemImageNamed:v5];
    }
    goto LABEL_17;
  }
  uint64_t v7 = [MEMORY[0x1E4F28B50] bundleWithPath:v6];
  if (v7) {
    goto LABEL_4;
  }
  uint64_t v12 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  v13 = [v12 topLevelSectionIdentifier];

  if (!v13) {
    goto LABEL_16;
  }
  id v14 = (void *)MEMORY[0x1E4F223C8];
  uint64_t v15 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  id v16 = [v15 topLevelSectionIdentifier];
  v17 = objc_msgSend(v14, "unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:", v16);

  if (!v17)
  {
    long long v20 = (void *)*MEMORY[0x1E4FB3768];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3768], OS_LOG_TYPE_ERROR)) {
      -[NCNotificationRequestContentProvider _iconImageForNotificationAction:](v20, self);
    }
    goto LABEL_16;
  }
  uint64_t v18 = (void *)MEMORY[0x1E4F28B50];
  id v19 = [v17 URL];
  uint64_t v7 = [v18 bundleWithURL:v19];

  if (!v7)
  {
LABEL_16:
    uint64_t v8 = 0;
    goto LABEL_17;
  }
LABEL_4:
  uint64_t v8 = [MEMORY[0x1E4FB1818] imageNamed:v5 inBundle:v7 withConfiguration:0];

LABEL_17:
LABEL_18:

  return v8;
}

- (id)_newBadgedIconView
{
  v28[2] = *MEMORY[0x1E4F143B8];
  char v3 = [(NCNotificationRequestContentProvider *)self icons];
  id v4 = [(NCNotificationRequestContentProvider *)self communicationAvatar];
  if (![(NCNotificationRequestContentProvider *)self isThreadSummary]) {
    goto LABEL_5;
  }
  id v5 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  uint64_t v6 = [v5 content];
  if ([v6 isCommunicationType])
  {

LABEL_5:
    unint64_t v8 = [v3 count];
    goto LABEL_6;
  }
  BOOL v7 = [(NCNotificationRequestContentProvider *)self summarizedNotificationsAllHaveMatchingIcons];

  if (v7) {
    goto LABEL_5;
  }
  int v11 = [(NCNotificationRequestContentProvider *)self _applicationImages];
  unint64_t v8 = [v3 count];
  if (v11) {
    goto LABEL_19;
  }
LABEL_6:
  unint64_t v9 = v8;
  if (!v4)
  {
    if (v8 < 2)
    {
      if (v8 != 1)
      {
        id v16 = 0;
        int v11 = 0;
        goto LABEL_20;
      }
      uint64_t v18 = [v3 objectAtIndexedSubscript:0];
      v26[0] = v18;
      id v19 = [MEMORY[0x1E4F1CA98] null];
      v26[1] = v19;
      int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    }
    else
    {
      id v14 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, 2);
      int v11 = [v3 objectsAtIndexes:v14];

      if (v9 >= 4)
      {
        uint64_t v12 = (void *)MEMORY[0x1E4F28D60];
        uint64_t v13 = 2;
        goto LABEL_12;
      }
    }
LABEL_19:
    id v16 = 0;
    goto LABEL_20;
  }
  v28[0] = v4;
  id v10 = [MEMORY[0x1E4F1CA98] null];
  v28[1] = v10;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];

  if (v9 < 2)
  {
    if (v9 == 1)
    {
      uint64_t v15 = [v3 objectAtIndexedSubscript:0];
      v27[0] = v15;
      v17 = [MEMORY[0x1E4F1CA98] null];
      v27[1] = v17;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

      goto LABEL_15;
    }
    goto LABEL_19;
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F28D60];
  uint64_t v13 = 0;
LABEL_12:
  uint64_t v15 = objc_msgSend(v12, "indexSetWithIndexesInRange:", v13, 2);
  id v16 = [v3 objectsAtIndexes:v15];
LABEL_15:

LABEL_20:
  long long v20 = [NCBadgedIconView alloc];
  id v21 = [(NCNotificationRequestContentProvider *)self badgeText];
  long long v22 = [MEMORY[0x1E4FB1BA8] mainScreen];
  long long v23 = [v22 traitCollection];
  id v24 = [(NCBadgedIconView *)v20 initWithProminentIcons:v11 subordinateIcons:v16 badgeText:v21 compatibleWithInitialTraitCollection:v23];

  return v24;
}

- (id)badgeText
{
  unint64_t v2 = [(NCNotificationRequestContentProvider *)self stackedNotificationsCount];
  if (v2 < 2)
  {
    uint64_t v6 = 0;
  }
  else
  {
    unint64_t v3 = v2;
    id v4 = objc_msgSend(MEMORY[0x1E4F28EE0], "sbf_cachedDecimalNumberFormatter");
    id v5 = [NSNumber numberWithUnsignedInteger:v3];
    uint64_t v6 = [v4 stringFromNumber:v5];
  }

  return v6;
}

- (void)_invalidateCachedData
{
  communicationAvatar = self->_communicationAvatar;
  self->_communicationAvatar = 0;

  badgedIconView = self->_badgedIconView;
  self->_badgedIconView = 0;
}

- (NCNotificationStaticContentProvidingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationStaticContentProvidingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)overriddenActions
{
  return self->_overriddenActions;
}

- (void)setOverriddenActions:(id)a3
{
}

- (int64_t)contentHidingEnforcement
{
  return self->_contentHidingEnforcement;
}

- (NCNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (void)setPrimarySubtitleTextDisplayingRecipientsSummary:(BOOL)a3
{
  self->_primarySubtitleTextDisplayingRecipientsSummary = a3;
}

- (void)setPrimarySubtitleTextDisplayingRequestTitle:(BOOL)a3
{
  self->_primarySubtitleTextDisplayingRequestTitle = a3;
}

- (unint64_t)stackedNotificationsCount
{
  return self->_stackedNotificationsCount;
}

- (void)setStackedNotificationsCount:(unint64_t)a3
{
  self->_stackedNotificationsCount = a3;
}

- (BOOL)isThreadSummary
{
  return self->_isThreadSummary;
}

- (BOOL)summarizedNotificationsAllHaveMatchingPrimaryText
{
  return self->_summarizedNotificationsAllHaveMatchingPrimaryText;
}

- (void)setSummarizedNotificationsAllHaveMatchingPrimaryText:(BOOL)a3
{
  self->_summarizedNotificationsAllHaveMatchingPrimaryText = a3;
}

- (BOOL)summarizedNotificationsAllHaveMatchingIcons
{
  return self->_summarizedNotificationsAllHaveMatchingIcons;
}

- (void)setSummarizedNotificationsAllHaveMatchingIcons:(BOOL)a3
{
  self->_summarizedNotificationsAllHaveMatchingIcons = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRequest, 0);
  objc_storeStrong((id *)&self->_communicationAvatar, 0);
  objc_storeStrong((id *)&self->_badgedIconView, 0);
  objc_storeStrong((id *)&self->_overriddenActions, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id)_newAvatarView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v4 = [WeakRetained contentProviderTraitCollection:self];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [NCAvatarView alloc];
  uint64_t v6 = [(NCNotificationRequestContentProvider *)self notificationRequest];
  BOOL v7 = [(NCAvatarView *)v5 initWithNotificationRequest:v6 compatibleWithInitialTraitCollection:v4];

  return v7;
}

- (id)_criticalAlertIconAttributedStringWithImageConfiguration:(id)a3
{
  unint64_t v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.triangle.fill" withConfiguration:a3];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB0870]) initWithData:0 ofType:0];
  [v4 setImage:v3];
  id v5 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v4];

  return v5;
}

- (id)_intelligentManagementIconAttributedStringWithImageConfiguration:(id)a3
{
  unint64_t v3 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"_gm" withConfiguration:a3];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB0870]) initWithData:0 ofType:0];
  [v4 setImage:v3];
  id v5 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v4];

  return v5;
}

- (void)_iconImageForNotificationAction:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a1;
  id v4 = [a2 notificationRequest];
  id v5 = [v4 topLevelSectionIdentifier];
  int v6 = 138412290;
  BOOL v7 = v5;
  _os_log_error_impl(&dword_1D7C04000, v3, OS_LOG_TYPE_ERROR, "Failed to load bundle for '%@'.", (uint8_t *)&v6, 0xCu);
}

@end