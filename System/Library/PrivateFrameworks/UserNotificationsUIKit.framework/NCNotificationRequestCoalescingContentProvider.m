@interface NCNotificationRequestCoalescingContentProvider
- (BOOL)_isThreadContainsCriticalNotificationRequest;
- (BOOL)_isThreadContainsMaybeImportantNotificationRequest;
- (BOOL)_shouldShowNotificationBody;
- (BOOL)_shouldShowSummary;
- (BOOL)containsMatchingCoalescedNotificationRequest:(id)a3;
- (BOOL)isDeviceAuthenticated;
- (BOOL)isHidingContent;
- (BOOL)isSummarizationEnabled;
- (BOOL)showSummaryFooterText;
- (BOOL)showSummaryTextAsContent;
- (NCNotificationRequestCoalescingContentProvider)init;
- (NCNotificationRequestCoalescingContentProvider)initWithNotificationRequest:(id)a3;
- (NCNotificationSummaryBuilder)overridenSummaryBuilder;
- (NSAttributedString)threadContentSummaryText;
- (NSMutableArray)coalescedNotificationRequests;
- (NSString)collapsedSectionSummaryString;
- (id)_activeSummaryBuilder;
- (id)_localizedStringWithPlaceholderFormat:(id)a3 count:(unint64_t)a4;
- (id)_placeholderSecondaryText;
- (id)badgedIconView;
- (id)communicationAvatar;
- (id)contentSummaryText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)date;
- (id)footerText;
- (id)icons;
- (id)importantAttributedTextWithImageConfiguration:(id)a3 importantAdornmentEligibleOptions:(unint64_t)a4;
- (id)importantText;
- (id)inlineAction;
- (id)notificationRequest;
- (id)primarySubtitleText;
- (id)primaryText;
- (id)secondaryText;
- (id)thumbnail;
- (unint64_t)_indexOfMatchingNotificationRequest:(id)a3;
- (unint64_t)_notificationCount;
- (unint64_t)coalesceCount;
- (void)_updateSummaryText;
- (void)coalesceNotificationRequest:(id)a3;
- (void)removeCoalescedNotificationRequest:(id)a3;
- (void)setCoalescedNotificationRequests:(id)a3;
- (void)setCollapsedSectionSummaryString:(id)a3;
- (void)setDeviceAuthenticated:(BOOL)a3;
- (void)setOverridenSummaryBuilder:(id)a3;
- (void)setShowSummaryFooterText:(BOOL)a3;
- (void)setShowSummaryTextAsContent:(BOOL)a3;
- (void)setSummarizationEnabled:(BOOL)a3;
- (void)setThreadContentSummaryText:(id)a3;
- (void)updateCoalescedNotificationRequest:(id)a3;
@end

@implementation NCNotificationRequestCoalescingContentProvider

- (NCNotificationRequestCoalescingContentProvider)initWithNotificationRequest:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
  v5 = [(NCNotificationRequestContentProvider *)&v11 initWithNotificationRequest:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    coalescedNotificationRequests = v5->_coalescedNotificationRequests;
    v5->_coalescedNotificationRequests = (NSMutableArray *)v6;

    if (v4) {
      [(NSMutableArray *)v5->_coalescedNotificationRequests addObject:v4];
    }
    uint64_t v8 = objc_opt_new();
    summaryBuilder = v5->_summaryBuilder;
    v5->_summaryBuilder = (NCNotificationSummaryBuilder *)v8;

    [(NCNotificationRequestCoalescingContentProvider *)v5 _updateSummaryText];
  }

  return v5;
}

- (NCNotificationRequestCoalescingContentProvider)init
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
  id v4 = [(NCNotificationRequestContentProvider *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSMutableArray *)self->_coalescedNotificationRequests copy];
  uint64_t v6 = (void *)*((void *)v4 + 12);
  *((void *)v4 + 12) = v5;

  *((unsigned char *)v4 + 88) = self->_deviceAuthenticated;
  objc_storeStrong((id *)v4 + 13, self->_overridenSummaryBuilder);
  *((unsigned char *)v4 + 91) = self->_summarizationEnabled;
  return v4;
}

- (unint64_t)coalesceCount
{
  v2 = [(NCNotificationRequestCoalescingContentProvider *)self coalescedNotificationRequests];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)coalesceNotificationRequest:(id)a3
{
  id v5 = a3;
  unint64_t v4 = -[NCNotificationRequestCoalescingContentProvider _indexOfMatchingNotificationRequest:](self, "_indexOfMatchingNotificationRequest:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->_coalescedNotificationRequests removeObjectAtIndex:v4];
  }
  [(NSMutableArray *)self->_coalescedNotificationRequests _insertOrderedNotificationRequest:v5];
  [(NCNotificationRequestCoalescingContentProvider *)self _updateSummaryText];
}

- (void)removeCoalescedNotificationRequest:(id)a3
{
  unint64_t v4 = [(NCNotificationRequestCoalescingContentProvider *)self _indexOfMatchingNotificationRequest:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_coalescedNotificationRequests removeObjectAtIndex:v4];
    [(NCNotificationRequestCoalescingContentProvider *)self _updateSummaryText];
  }
}

- (void)updateCoalescedNotificationRequest:(id)a3
{
  id v5 = a3;
  unint64_t v4 = -[NCNotificationRequestCoalescingContentProvider _indexOfMatchingNotificationRequest:](self, "_indexOfMatchingNotificationRequest:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_coalescedNotificationRequests removeObjectAtIndex:v4];
    [(NSMutableArray *)self->_coalescedNotificationRequests _insertOrderedNotificationRequest:v5];
    [(NCNotificationRequestCoalescingContentProvider *)self _updateSummaryText];
  }
}

- (id)notificationRequest
{
  return (id)[(NSMutableArray *)self->_coalescedNotificationRequests firstObject];
}

- (BOOL)containsMatchingCoalescedNotificationRequest:(id)a3
{
  return [(NCNotificationRequestCoalescingContentProvider *)self _indexOfMatchingNotificationRequest:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)primaryText
{
  unint64_t v3 = [(NCNotificationRequestCoalescingContentProvider *)self collapsedSectionSummaryString];

  if (v3)
  {
    uint64_t v4 = [(NCNotificationRequestCoalescingContentProvider *)self collapsedSectionSummaryString];
  }
  else
  {
    if ([(NCNotificationRequestCoalescingContentProvider *)self isHidingContent])
    {
      id v5 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
      uint64_t v6 = [v5 options];
      int v7 = [v6 suppressesTitleWhenLocked];

      if (v7)
      {
        objc_super v8 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
        v9 = [v8 content];
        v10 = [v9 defaultHeader];

        goto LABEL_8;
      }
    }
    v15.receiver = self;
    v15.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    uint64_t v4 = [(NCNotificationRequestContentProvider *)&v15 primaryText];
  }
  v10 = (void *)v4;
LABEL_8:
  if ([(NCNotificationRequestCoalescingContentProvider *)self showSummaryTextAsContent])
  {
    objc_super v11 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
    v12 = [v11 content];
    uint64_t v13 = [v12 defaultHeader];

    v10 = (void *)v13;
  }

  return v10;
}

- (id)primarySubtitleText
{
  if ([(NCNotificationRequestContentProvider *)self isPrimarySubtitleTextDisplayingRequestTitle]|| [(NCNotificationRequestContentProvider *)self isPrimarySubtitleTextDisplayingRecipientsSummary])
  {
    if ([(NCNotificationRequestCoalescingContentProvider *)self isHidingContent])
    {
      unint64_t v3 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
      uint64_t v4 = [v3 options];
      int v5 = [v4 suppressesTitleWhenLocked] ^ 1;
    }
    else
    {
      int v5 = 1;
    }
  }
  else
  {
    int v5 = 0;
  }
  uint64_t v6 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
  int v7 = [v6 options];
  if ([v7 suppressesSubtitleWhenLocked])
  {
    int v8 = ![(NCNotificationRequestCoalescingContentProvider *)self isHidingContent];

    if (((v8 | v5) & 1) == 0)
    {
      v9 = 0;
      goto LABEL_12;
    }
  }
  else
  {
  }
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
  v9 = [(NCNotificationRequestContentProvider *)&v12 primarySubtitleText];
LABEL_12:
  v10 = [(NCNotificationRequestCoalescingContentProvider *)self collapsedSectionSummaryString];
  if (v10)
  {
  }
  else if (![(NCNotificationRequestCoalescingContentProvider *)self showSummaryTextAsContent])
  {
    goto LABEL_16;
  }

  v9 = 0;
LABEL_16:

  return v9;
}

- (id)secondaryText
{
  if ([(NCNotificationRequestCoalescingContentProvider *)self _shouldShowNotificationBody])
  {
    v14.receiver = self;
    v14.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    uint64_t v3 = [(NCNotificationRequestContentProvider *)&v14 secondaryText];
  }
  else
  {
    uint64_t v3 = [(NCNotificationRequestCoalescingContentProvider *)self _placeholderSecondaryText];
  }
  uint64_t v4 = (void *)v3;
  int v5 = [(NCNotificationRequestCoalescingContentProvider *)self collapsedSectionSummaryString];

  if (v5) {
    goto LABEL_5;
  }
  if ([(NCNotificationRequestCoalescingContentProvider *)self showSummaryTextAsContent])
  {
    unint64_t v8 = [(NCNotificationRequestCoalescingContentProvider *)self _notificationCount];
    if (v8)
    {
      unint64_t v9 = v8;
      v10 = NSString;
      objc_super v11 = NCUserNotificationsUIKitFrameworkBundle();
      objc_super v12 = [v11 localizedStringForKey:@"NOTIFICATION_LIST_STACK_APP_CONTENT_SUMMARY" value:&stru_1F2F516F8 table:0];
      uint64_t v13 = objc_msgSend(v10, "stringWithFormat:", v12, v9);

      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13];
      uint64_t v4 = (void *)v13;
      goto LABEL_6;
    }
  }
  else if ([(NCNotificationRequestCoalescingContentProvider *)self _shouldShowNotificationBody]&& [(NCNotificationRequestContentProvider *)self isThreadSummary])
  {
LABEL_5:
    uint64_t v6 = 0;
LABEL_6:

    uint64_t v4 = (void *)v6;
  }

  return v4;
}

- (id)contentSummaryText
{
  if (![(NCNotificationRequestCoalescingContentProvider *)self _shouldShowNotificationBody]|| ![(NCNotificationRequestCoalescingContentProvider *)self _shouldShowSummary])
  {
    goto LABEL_5;
  }
  uint64_t v3 = [(NCNotificationRequestCoalescingContentProvider *)self collapsedSectionSummaryString];
  if (v3)
  {

LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  if ([(NCNotificationRequestContentProvider *)self stackedNotificationsCount] >= 2
    && ![(NCNotificationRequestContentProvider *)self isThreadSummary])
  {
    uint64_t v6 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
    int v7 = [v6 content];
    char v8 = [v7 isCommunicationType];

    if (v8) {
      goto LABEL_5;
    }
  }
  if ([(NCNotificationRequestContentProvider *)self isThreadSummary])
  {
    uint64_t v4 = [(NCNotificationRequestCoalescingContentProvider *)self threadContentSummaryText];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    uint64_t v4 = [(NCNotificationRequestContentProvider *)&v9 contentSummaryText];
  }
LABEL_6:

  return v4;
}

- (id)importantText
{
  if ([(NCNotificationRequestCoalescingContentProvider *)self isHidingContent])
  {
    uint64_t v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    uint64_t v3 = [(NCNotificationRequestContentProvider *)&v5 importantText];
  }

  return v3;
}

- (id)importantAttributedTextWithImageConfiguration:(id)a3 importantAdornmentEligibleOptions:(unint64_t)a4
{
  id v6 = a3;
  if (![(NCNotificationRequestContentProvider *)self isThreadSummary])
  {
    v23.receiver = self;
    v23.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    v10 = [(NCNotificationRequestContentProvider *)&v23 importantAttributedTextWithImageConfiguration:v6 importantAdornmentEligibleOptions:a4];
    goto LABEL_12;
  }
  BOOL v7 = [(NCNotificationRequestCoalescingContentProvider *)self _isThreadContainsCriticalNotificationRequest];
  BOOL v8 = [(NCNotificationRequestCoalescingContentProvider *)self _isThreadContainsMaybeImportantNotificationRequest];
  if ((a4 & 1) != 0 && v7)
  {
    objc_super v9 = [(NCNotificationRequestContentProvider *)self _criticalAlertIconAttributedStringWithImageConfiguration:v6];
    v10 = (void *)[v9 mutableCopy];

    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    objc_super v12 = NSString;
    uint64_t v13 = NCUserNotificationsUIKitFrameworkBundle();
    objc_super v14 = v13;
    objc_super v15 = @"CRITICAL_TEXT";
LABEL_10:
    v18 = [v13 localizedStringForKey:v15 value:&stru_1F2F516F8 table:0];
    v19 = [v18 localizedUppercaseString];
    v20 = [v12 stringWithFormat:@" %@", v19];
    v21 = (void *)[v11 initWithString:v20];
    [v10 appendAttributedString:v21];

    goto LABEL_12;
  }
  char v16 = !v8;
  if ((a4 & 2) == 0) {
    char v16 = 1;
  }
  if ((v16 & 1) == 0)
  {
    v17 = [(NCNotificationRequestContentProvider *)self _intelligentManagementIconAttributedStringWithImageConfiguration:v6];
    v10 = (void *)[v17 mutableCopy];

    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    objc_super v12 = NSString;
    uint64_t v13 = NCUserNotificationsUIKitFrameworkBundle();
    objc_super v14 = v13;
    objc_super v15 = @"INTELLIGENCE_MAYBE_IMPORTANT";
    goto LABEL_10;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)_isThreadContainsCriticalNotificationRequest
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(NCNotificationRequestCoalescingContentProvider *)self _activeSummaryBuilder];
  uint64_t v3 = [v2 notificationRequests];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) interruptionLevel] == 3)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)_isThreadContainsMaybeImportantNotificationRequest
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(NCNotificationRequestCoalescingContentProvider *)self _activeSummaryBuilder];
  uint64_t v3 = [v2 notificationRequests];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) alertOptions];
        uint64_t v8 = [v7 intelligentBehavior];

        if (v8 == 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)date
{
  uint64_t v3 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
  uint64_t v4 = [v3 bulletin];
  uint64_t v5 = [v4 context];

  if ([(NCNotificationRequestContentProvider *)self isThreadSummary]
    && ([v5 objectForKey:@"contentDate"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    BOOL v7 = [v5 objectForKey:@"recordDate"];
  }
  else
  {
    uint64_t v8 = [(NCNotificationRequestCoalescingContentProvider *)self collapsedSectionSummaryString];
    if (v8)
    {
      BOOL v7 = 0;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
      BOOL v7 = [(NCNotificationRequestContentProvider *)&v10 date];
    }
  }

  return v7;
}

- (id)icons
{
  uint64_t v3 = [(NCNotificationRequestCoalescingContentProvider *)self collapsedSectionSummaryString];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C978] array];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    uint64_t v4 = [(NCNotificationRequestContentProvider *)&v7 icons];
  }
  uint64_t v5 = (void *)v4;

  return v5;
}

- (id)communicationAvatar
{
  uint64_t v3 = [(NCNotificationRequestCoalescingContentProvider *)self collapsedSectionSummaryString];
  if (v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    uint64_t v4 = [(NCNotificationRequestContentProvider *)&v6 communicationAvatar];
  }

  return v4;
}

- (id)footerText
{
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
  uint64_t v3 = [(NCNotificationRequestContentProvider *)&v15 footerText];
  uint64_t v4 = v3;
  if (!v3 || [v3 isEqualToString:&stru_1F2F516F8])
  {
    if ([(NCNotificationRequestCoalescingContentProvider *)self showSummaryFooterText])
    {
      if ([(NCNotificationRequestCoalescingContentProvider *)self _shouldShowNotificationBody])
      {
        unint64_t v5 = [(NCNotificationRequestCoalescingContentProvider *)self _notificationCount];
        unint64_t v6 = v5 - 1;
        if (v5 != 1 && ![(NCNotificationRequestContentProvider *)self isThreadSummary])
        {
          objc_super v7 = (void *)MEMORY[0x1E4F28EE0];
          uint64_t v8 = [NSNumber numberWithUnsignedInteger:v6];
          long long v9 = [v7 localizedStringFromNumber:v8 numberStyle:0];

          objc_super v10 = NSString;
          long long v11 = NCUserNotificationsUIKitFrameworkBundle();
          long long v12 = [v11 localizedStringForKey:@"NOTIFICATION_LIST_STACK_APP_FOOTER_SUMMARY" value:&stru_1F2F516F8 table:0];
          uint64_t v13 = objc_msgSend(v10, "stringWithFormat:", v12, v9);

          uint64_t v4 = (void *)v13;
        }
      }
    }
  }

  return v4;
}

- (id)inlineAction
{
  if ([(NCNotificationRequestCoalescingContentProvider *)self _shouldShowNotificationBody])
  {
    v5.receiver = self;
    v5.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    uint64_t v3 = [(NCNotificationRequestContentProvider *)&v5 inlineAction];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_shouldShowNotificationBody
{
  int64_t v5 = [(NCNotificationRequestContentProvider *)self contentHidingEnforcement];
  char v6 = v5 == -1;
  if (!v5)
  {
    BOOL v7 = [(NCNotificationRequestCoalescingContentProvider *)self isHidingContent];
    if (v7)
    {
      v2 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
      uint64_t v3 = [v2 options];
      if ([v3 suppressesBodyWhenLocked])
      {
        char v6 = 1;
LABEL_6:

        return v6 ^ 1;
      }
    }
    uint64_t v8 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
    long long v9 = [v8 options];
    char v6 = [v9 coalescesWhenLocked];

    if (v7) {
      goto LABEL_6;
    }
  }
  return v6 ^ 1;
}

- (BOOL)_shouldShowSummary
{
  BOOL v3 = [(NCNotificationRequestCoalescingContentProvider *)self isSummarizationEnabled];
  if (v3)
  {
    uint64_t v4 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
    int64_t v5 = [v4 options];
    char v6 = [v5 canShowSummary];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (id)_placeholderSecondaryText
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  uint64_t v4 = [(NCNotificationRequestCoalescingContentProvider *)self overridenSummaryBuilder];
  if (v4)
  {
    int64_t v5 = [(NCNotificationRequestCoalescingContentProvider *)self overridenSummaryBuilder];
    char v6 = [v5 notificationRequests];
  }
  else
  {
    char v6 = self->_coalescedNotificationRequests;
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  BOOL v7 = v6;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = [*(id *)(*((void *)&v51 + 1) + 8 * i) content];
        uint64_t v13 = [v12 hiddenPreviewsBodyPlaceholder];

        if (![v13 length])
        {
          objc_super v14 = NCUserNotificationsUIKitFrameworkBundle();
          uint64_t v15 = [v14 localizedStringForKey:@"DEFAULT_HIDDEN_PREVIEW_PLACEHOLDER" value:&stru_1F2F516F8 table:0];

          uint64_t v13 = (void *)v15;
        }
        char v16 = [v3 objectForKey:v13];
        v17 = v16;
        v18 = NSNumber;
        if (v16) {
          uint64_t v19 = [v16 integerValue] + 1;
        }
        else {
          uint64_t v19 = 1;
        }
        v20 = [v18 numberWithInteger:v19];
        [v3 setObject:v20 forKey:v13];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v9);
  }

  v21 = [v3 allKeys];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __75__NCNotificationRequestCoalescingContentProvider__placeholderSecondaryText__block_invoke;
  v48[3] = &unk_1E6A94118;
  id v22 = v3;
  id v49 = v22;
  v50 = self;
  objc_super v23 = objc_msgSend(v21, "bs_map:", v48);

  v24 = [v23 sortedArrayUsingComparator:&__block_literal_global_61];

  unint64_t v25 = [v24 count];
  if (v25 == 2)
  {
    v28 = NSString;
    v29 = NCUserNotificationsUIKitFrameworkBundle();
    v30 = [v29 localizedStringForKey:@"COALESCED_NOTIFICATION_END_FORMAT" value:&stru_1F2F516F8 table:0];
    v31 = [v24 objectAtIndexedSubscript:0];
    v32 = [v24 objectAtIndexedSubscript:1];
    v27 = objc_msgSend(v28, "stringWithFormat:", v30, v31, v32);
  }
  else
  {
    unint64_t v26 = v25;
    if (v25 == 1)
    {
      v27 = [v24 objectAtIndexedSubscript:0];
    }
    else if (v25 < 3)
    {
      v27 = 0;
    }
    else
    {
      unint64_t v46 = v25 - 1;
      id v47 = v22;
      v33 = [v24 objectAtIndexedSubscript:0];
      for (uint64_t j = 2; j != v26; ++j)
      {
        v35 = v33;
        v36 = NSString;
        v37 = NCUserNotificationsUIKitFrameworkBundle();
        v38 = [v37 localizedStringForKey:@"COALESCED_NOTIFICATION_MIDDLE_FORMAT" value:&stru_1F2F516F8 table:0];
        v39 = [v24 objectAtIndexedSubscript:j - 1];
        v33 = objc_msgSend(v36, "stringWithFormat:", v38, v35, v39);
      }
      v40 = NSString;
      v41 = NCUserNotificationsUIKitFrameworkBundle();
      v42 = [v41 localizedStringForKey:@"COALESCED_NOTIFICATION_END_FORMAT" value:&stru_1F2F516F8 table:0];
      v43 = [v24 objectAtIndexedSubscript:v46];
      v27 = objc_msgSend(v40, "stringWithFormat:", v42, v33, v43);

      id v22 = v47;
    }
  }
  v44 = objc_msgSend(MEMORY[0x1E4F28B18], "nc_safeAttributedStringWithString:", v27);

  return v44;
}

id __75__NCNotificationRequestCoalescingContentProvider__placeholderSecondaryText__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int64_t v5 = [v3 objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 unsignedIntegerValue];

  BOOL v7 = [*(id *)(a1 + 40) _localizedStringWithPlaceholderFormat:v4 count:v6];

  return v7;
}

uint64_t __75__NCNotificationRequestCoalescingContentProvider__placeholderSecondaryText__block_invoke_2(uint64_t a1, void *a2)
{
  return -objc_msgSend(a2, "compare:");
}

- (id)thumbnail
{
  if ([(NCNotificationRequestCoalescingContentProvider *)self isHidingContent])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v4 = [(NCNotificationRequestCoalescingContentProvider *)self collapsedSectionSummaryString];
    if (v4 || [(NCNotificationRequestContentProvider *)self isThreadSummary])
    {
      BOOL v3 = 0;
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
      BOOL v3 = [(NCNotificationRequestContentProvider *)&v6 thumbnail];
    }
  }

  return v3;
}

- (id)badgedIconView
{
  BOOL v3 = [(NCNotificationRequestCoalescingContentProvider *)self collapsedSectionSummaryString];
  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    id v4 = [(NCNotificationRequestContentProvider *)&v6 badgedIconView];
  }

  return v4;
}

- (BOOL)isHidingContent
{
  int64_t v3 = [(NCNotificationRequestContentProvider *)self contentHidingEnforcement];
  BOOL result = v3 == -1;
  if (!v3)
  {
    int64_t v5 = [(NCNotificationRequestCoalescingContentProvider *)self notificationRequest];
    objc_super v6 = [v5 options];
    uint64_t v7 = [v6 contentPreviewSetting];

    if (v7)
    {
      if (v7 == 1) {
        return ![(NCNotificationRequestCoalescingContentProvider *)self isDeviceAuthenticated];
      }
      else {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (unint64_t)_indexOfMatchingNotificationRequest:(id)a3
{
  id v4 = a3;
  coalescedNotificationRequests = self->_coalescedNotificationRequests;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__NCNotificationRequestCoalescingContentProvider__indexOfMatchingNotificationRequest___block_invoke;
  v9[3] = &unk_1E6A92790;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [(NSMutableArray *)coalescedNotificationRequests indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __86__NCNotificationRequestCoalescingContentProvider__indexOfMatchingNotificationRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matchesRequest:a2];
}

- (void)_updateSummaryText
{
}

- (id)_activeSummaryBuilder
{
  overridenSummaryBuilder = self->_overridenSummaryBuilder;
  if (!overridenSummaryBuilder) {
    overridenSummaryBuilder = self->_summaryBuilder;
  }
  return overridenSummaryBuilder;
}

- (unint64_t)_notificationCount
{
  v2 = [(NCNotificationRequestCoalescingContentProvider *)self _activeSummaryBuilder];
  int64_t v3 = [v2 notificationRequests];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)_localizedStringWithPlaceholderFormat:(id)a3 count:(unint64_t)a4
{
  id v14 = 0;
  id v6 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", a3, @"%u", &v14, a4);
  id v7 = v14;
  if (v7)
  {
    uint64_t v8 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
      -[NCNotificationRequestCoalescingContentProvider _localizedStringWithPlaceholderFormat:count:](v8, self);
    }
    uint64_t v9 = NSString;
    id v10 = NCUserNotificationsUIKitFrameworkBundle();
    long long v11 = [v10 localizedStringForKey:@"DEFAULT_HIDDEN_PREVIEW_PLACEHOLDER" value:&stru_1F2F516F8 table:0];
    uint64_t v12 = objc_msgSend(v9, "localizedStringWithFormat:", v11, a4, 0);

    id v6 = (void *)v12;
  }

  return v6;
}

- (NSMutableArray)coalescedNotificationRequests
{
  return self->_coalescedNotificationRequests;
}

- (void)setCoalescedNotificationRequests:(id)a3
{
}

- (BOOL)isDeviceAuthenticated
{
  return self->_deviceAuthenticated;
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  self->_deviceAuthenticated = a3;
}

- (NCNotificationSummaryBuilder)overridenSummaryBuilder
{
  return self->_overridenSummaryBuilder;
}

- (void)setOverridenSummaryBuilder:(id)a3
{
}

- (NSString)collapsedSectionSummaryString
{
  return self->_collapsedSectionSummaryString;
}

- (void)setCollapsedSectionSummaryString:(id)a3
{
}

- (BOOL)showSummaryFooterText
{
  return self->_showSummaryFooterText;
}

- (void)setShowSummaryFooterText:(BOOL)a3
{
  self->_showSummaryFooterText = a3;
}

- (BOOL)showSummaryTextAsContent
{
  return self->_showSummaryTextAsContent;
}

- (void)setShowSummaryTextAsContent:(BOOL)a3
{
  self->_showSummaryTextAsContent = a3;
}

- (NSAttributedString)threadContentSummaryText
{
  return self->_threadContentSummaryText;
}

- (void)setThreadContentSummaryText:(id)a3
{
}

- (BOOL)isSummarizationEnabled
{
  return self->_summarizationEnabled;
}

- (void)setSummarizationEnabled:(BOOL)a3
{
  self->_summarizationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadContentSummaryText, 0);
  objc_storeStrong((id *)&self->_collapsedSectionSummaryString, 0);
  objc_storeStrong((id *)&self->_overridenSummaryBuilder, 0);
  objc_storeStrong((id *)&self->_coalescedNotificationRequests, 0);
  objc_storeStrong((id *)&self->_summaryBuilder, 0);

  objc_storeStrong((id *)&self->_decimalFormatter, 0);
}

- (void)_localizedStringWithPlaceholderFormat:(void *)a1 count:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int64_t v3 = a1;
  unint64_t v4 = [a2 notificationRequest];
  int64_t v5 = [v4 notificationIdentifier];
  id v6 = objc_msgSend(v5, "un_logDigest");
  id v7 = [a2 notificationRequest];
  uint64_t v8 = [v7 categoryIdentifier];
  int v9 = 138543618;
  id v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = v8;
  _os_log_error_impl(&dword_1D7C04000, v3, OS_LOG_TYPE_ERROR, "Error formatting hidden preview placeholder. Notification: %{public}@, Category: %{public}@.", (uint8_t *)&v9, 0x16u);
}

@end