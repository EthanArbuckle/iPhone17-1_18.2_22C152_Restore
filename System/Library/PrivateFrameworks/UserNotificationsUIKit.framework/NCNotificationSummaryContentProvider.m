@interface NCNotificationSummaryContentProvider
+ (id)summaryContentProviderOfType:(unint64_t)a3 notificationRequests:(id)a4;
- (BOOL)_shouldShowContentForNotificationRequest:(id)a3;
- (BOOL)hideSummaryIconViews;
- (BOOL)isDeviceAuthenticated;
- (BOOL)isIconViewLeading;
- (NSArray)notificationRequests;
- (NSArray)summaryIconViews;
- (NSArray)titlesForSectionListsInSummary;
- (NSDate)summaryDate;
- (NSString)summary;
- (NSString)summaryIconSymbolName;
- (NSString)summaryTitle;
- (NSString)summaryTitleFontName;
- (id)_communicationAvatarForNotificationRequest:(id)a3;
- (id)_iconViewForNotificationRequest:(id)a3;
- (id)_summaryIconViewForNotificationRequest:(id)a3;
- (id)_summaryStringForCommunicationNotificationRequest:(id)a3;
- (id)_summaryStringForNotificationRequest:(id)a3;
- (unint64_t)maxNumberOfSummaryItems;
- (void)setDeviceAuthenticated:(BOOL)a3;
- (void)setMaxNumberOfSummaryItems:(unint64_t)a3;
- (void)setNotificationRequests:(id)a3;
- (void)setSummaryDate:(id)a3;
- (void)setSummaryIconSymbolName:(id)a3;
- (void)setSummaryTitle:(id)a3;
- (void)setSummaryTitleFontName:(id)a3;
- (void)setTitlesForSectionListsInSummary:(id)a3;
@end

@implementation NCNotificationSummaryContentProvider

+ (id)summaryContentProviderOfType:(unint64_t)a3 notificationRequests:(id)a4
{
  id v5 = a4;
  if (a3 > 3) {
    id v6 = 0;
  }
  else {
    id v6 = objc_alloc_init(*off_1E6A948D0[a3]);
  }
  [v6 setNotificationRequests:v5];

  return v6;
}

- (void)setNotificationRequests:(id)a3
{
  id v5 = (NSArray *)a3;
  if (self->_notificationRequests != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_notificationRequests, a3);
    summaryTitle = self->_summaryTitle;
    self->_summaryTitle = 0;

    summary = self->_summary;
    self->_summary = 0;

    summaryIconViews = self->_summaryIconViews;
    self->_summaryIconViews = 0;

    summaryDate = self->_summaryDate;
    self->_summaryDate = 0;

    summaryTitleFontName = self->_summaryTitleFontName;
    self->_summaryTitleFontName = 0;

    id v5 = v11;
  }
}

- (void)setTitlesForSectionListsInSummary:(id)a3
{
  id v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_titlesForSectionListsInSummary, "isEqualToArray:"))
  {
    v4 = (NSArray *)[v7 copy];
    titlesForSectionListsInSummary = self->_titlesForSectionListsInSummary;
    self->_titlesForSectionListsInSummary = v4;

    summary = self->_summary;
    self->_summary = 0;
  }
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  if (self->_deviceAuthenticated != a3)
  {
    self->_deviceAuthenticated = a3;
    summary = self->_summary;
    self->_summary = 0;
  }
}

- (NSString)summary
{
  p_summary = &self->_summary;
  if (!self->_summary
    && ([(NSArray *)self->_notificationRequests count]
     || [(NSArray *)self->_titlesForSectionListsInSummary count]))
  {
    unint64_t v4 = [(NCNotificationSummaryContentProvider *)self maxNumberOfSummaryItems];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = (void *)[(NSArray *)self->_titlesForSectionListsInSummary copy];
    id v7 = v6;
    if (v6 && [v6 count]) {
      [v5 addObjectsFromArray:v7];
    }
    notificationRequests = self->_notificationRequests;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __47__NCNotificationSummaryContentProvider_summary__block_invoke;
    v33[3] = &unk_1E6A92BA0;
    v33[4] = self;
    id v9 = v5;
    id v34 = v9;
    [(NSArray *)notificationRequests enumerateObjectsUsingBlock:v33];
    unint64_t v10 = [v9 count];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__13;
    v31 = __Block_byref_object_dispose__13;
    v32 = &stru_1F2F516F8;
    uint64_t v11 = v10 - v4;
    if (v10 <= v4)
    {
      uint64_t v12 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v9];
      v13 = (void *)v28[5];
      v28[5] = v12;
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __47__NCNotificationSummaryContentProvider_summary__block_invoke_6;
      v26[3] = &unk_1E6A94868;
      v26[4] = &v27;
      v26[5] = v10;
      v26[6] = v4;
      [v9 enumerateObjectsUsingBlock:v26];
    }
    if (v11 >= 1)
    {
      v14 = (void *)MEMORY[0x1E4F28EE0];
      v15 = [NSNumber numberWithInteger:v11];
      v16 = [v14 localizedStringFromNumber:v15 numberStyle:0];

      v17 = (void *)v28[5];
      v18 = NSString;
      v19 = NCUserNotificationsUIKitFrameworkBundle();
      v20 = [v19 localizedStringForKey:@"NOTIFICATION_SUMMARY_COUNT" value:&stru_1F2F516F8 table:0];
      v21 = objc_msgSend(v18, "stringWithFormat:", v20, v16);
      uint64_t v22 = [v17 stringByAppendingFormat:@" %@", v21];
      v23 = (void *)v28[5];
      v28[5] = v22;
    }
    objc_storeStrong((id *)p_summary, (id)v28[5]);
    _Block_object_dispose(&v27, 8);
  }
  v24 = *p_summary;

  return v24;
}

void __47__NCNotificationSummaryContentProvider_summary__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) _summaryStringForNotificationRequest:a2];
  if (v3)
  {
    id v5 = v3;
    char v4 = [*(id *)(a1 + 40) containsObject:v3];
    v3 = v5;
    if ((v4 & 1) == 0)
    {
      [*(id *)(a1 + 40) addObject:v5];
      v3 = v5;
    }
  }
}

void __47__NCNotificationSummaryContentProvider_summary__block_invoke_6(void *a1, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v9 = [*(id *)(*(void *)(a1[4] + 8) + 40) stringByAppendingString:a2];
  uint64_t v10 = *(void *)(a1[4] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = a1[5];
  if (v12 - 1 <= a3)
  {
    unint64_t v14 = a3 + 1;
  }
  else
  {
    unint64_t v13 = a1[6];
    unint64_t v14 = a3 + 1;
    if (v13 > a3 && v14 != v13)
    {
      uint64_t v16 = v12 - 2;
      uint64_t v17 = *(void *)(a1[4] + 8);
      v18 = *(void **)(v17 + 40);
      if (v16 == a3)
      {
        [*(id *)(v17 + 40) stringByAppendingString:@" "];
      }
      else
      {
        char v4 = NCUserNotificationsUIKitFrameworkBundle();
        id v5 = [v4 localizedStringForKey:@"NOTIFICATION_SUMMARY_CONNECTOR_COMMA" value:&stru_1F2F516F8 table:0];
        [v18 stringByAppendingString:v5];
      v19 = };
      objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), v19);

      if (v16 != a3)
      {
      }
    }
  }
  if (v14 == a1[6]) {
    *a4 = 1;
  }
}

- (NSArray)summaryIconViews
{
  if (!self->_summaryIconViews
    && [(NSArray *)self->_notificationRequests count]
    && ![(NCNotificationSummaryContentProvider *)self hideSummaryIconViews])
  {
    unint64_t v5 = [(NCNotificationSummaryContentProvider *)self maxNumberOfSummaryItems];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    notificationRequests = self->_notificationRequests;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__NCNotificationSummaryContentProvider_summaryIconViews__block_invoke;
    v13[3] = &unk_1E6A94890;
    uint64_t v9 = (NSArray *)v6;
    unint64_t v14 = v9;
    id v15 = v7;
    uint64_t v16 = self;
    unint64_t v17 = v5;
    id v10 = v7;
    [(NSArray *)notificationRequests enumerateObjectsUsingBlock:v13];
    summaryIconViews = self->_summaryIconViews;
    self->_summaryIconViews = v9;
    uint64_t v12 = v9;
  }
  v3 = self->_summaryIconViews;

  return v3;
}

void __56__NCNotificationSummaryContentProvider_summaryIconViews__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) count] >= *(void *)(a1 + 56))
  {
    *a4 = 1;
    goto LABEL_7;
  }
  id v6 = NSString;
  id v7 = [v16 sectionIdentifier];
  v8 = [v16 threadIdentifier];
  uint64_t v9 = [v6 stringWithFormat:@"%@:%@", v7, v8];

  id v10 = *(void **)(a1 + 40);
  uint64_t v11 = [v16 sectionIdentifier];
  if (([v10 containsObject:v11] & 1) == 0)
  {
    char v12 = [*(id *)(a1 + 40) containsObject:v9];

    if (v12) {
      goto LABEL_6;
    }
    uint64_t v11 = [*(id *)(a1 + 48) _summaryIconViewForNotificationRequest:v16];
    if (v11)
    {
      [*(id *)(a1 + 32) addObject:v11];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      unint64_t v14 = *(void **)(a1 + 40);
      if (isKindOfClass)
      {
        [v14 addObject:v9];
      }
      else
      {
        id v15 = [v16 sectionIdentifier];
        [v14 addObject:v15];
      }
    }
  }

LABEL_6:
LABEL_7:
}

- (BOOL)_shouldShowContentForNotificationRequest:(id)a3
{
  char v4 = [a3 options];
  uint64_t v5 = [v4 contentPreviewSetting];

  if (!v5) {
    return 1;
  }
  if (v5 != 1) {
    return 0;
  }

  return [(NCNotificationSummaryContentProvider *)self isDeviceAuthenticated];
}

- (id)_summaryStringForNotificationRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 content];
  id v6 = [v5 title];

  if ([(NCNotificationSummaryContentProvider *)self _shouldShowContentForNotificationRequest:v4]&& v6)
  {
    id v7 = v6;
  }
  else
  {
    v8 = [v4 content];
    id v7 = [v8 defaultHeader];
  }

  return v7;
}

- (id)_summaryIconViewForNotificationRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NCNotificationSummaryContentProvider *)self _communicationAvatarForNotificationRequest:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(NCNotificationSummaryContentProvider *)self _iconViewForNotificationRequest:v4];
  }
  v8 = v7;

  return v8;
}

- (id)_iconViewForNotificationRequest:(id)a3
{
  v3 = [a3 content];
  id v4 = [v3 icons];

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, 2);
  id v6 = [v4 objectsAtIndexes:v5];

  id v7 = [NCBadgedIconView alloc];
  v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  uint64_t v9 = [v8 traitCollection];
  id v10 = [(NCBadgedIconView *)v7 initWithProminentIcons:v6 subordinateIcons:0 badgeText:0 compatibleWithInitialTraitCollection:v9];

  return v10;
}

- (id)_communicationAvatarForNotificationRequest:(id)a3
{
  id v3 = a3;
  if (+[NCAvatarView isAvatarPossibleWithNotificationRequest:v3])
  {
    id v4 = [[NCAvatarView alloc] initWithNotificationRequest:v3];
    [(NCAvatarView *)v4 setMaterialBacked:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_summaryStringForCommunicationNotificationRequest:(id)a3
{
  id v4 = a3;
  if (-[NCNotificationSummaryContentProvider _shouldShowContentForNotificationRequest:](self, "_shouldShowContentForNotificationRequest:", v4)&& ([v4 content], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "isCommunicationType"), v5, v6))
  {
    id v7 = [v4 content];
    v8 = [v7 communicationContext];

    uint64_t v9 = [v8 preferredSenderSummary];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (unint64_t)maxNumberOfSummaryItems
{
  return 3;
}

- (BOOL)hideSummaryIconViews
{
  return 0;
}

- (NSString)summaryTitle
{
  return self->_summaryTitle;
}

- (void)setSummaryTitle:(id)a3
{
}

- (BOOL)isIconViewLeading
{
  return self->_iconViewLeading;
}

- (NSString)summaryTitleFontName
{
  return self->_summaryTitleFontName;
}

- (void)setSummaryTitleFontName:(id)a3
{
}

- (NSDate)summaryDate
{
  return self->_summaryDate;
}

- (void)setSummaryDate:(id)a3
{
}

- (NSString)summaryIconSymbolName
{
  return self->_summaryIconSymbolName;
}

- (void)setSummaryIconSymbolName:(id)a3
{
}

- (BOOL)isDeviceAuthenticated
{
  return self->_deviceAuthenticated;
}

- (NSArray)titlesForSectionListsInSummary
{
  return self->_titlesForSectionListsInSummary;
}

- (NSArray)notificationRequests
{
  return self->_notificationRequests;
}

- (void)setMaxNumberOfSummaryItems:(unint64_t)a3
{
  self->_maxNumberOfSummaryItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRequests, 0);
  objc_storeStrong((id *)&self->_titlesForSectionListsInSummary, 0);
  objc_storeStrong((id *)&self->_summaryIconSymbolName, 0);
  objc_storeStrong((id *)&self->_summaryDate, 0);
  objc_storeStrong((id *)&self->_summaryTitleFontName, 0);
  objc_storeStrong((id *)&self->_summaryIconViews, 0);
  objc_storeStrong((id *)&self->_summary, 0);

  objc_storeStrong((id *)&self->_summaryTitle, 0);
}

@end