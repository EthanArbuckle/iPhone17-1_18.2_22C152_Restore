@interface NCNotificationAppSectionList
- (BOOL)_isViewFeaturedAtIndex:(unint64_t)a3;
- (BOOL)_shouldFeatureLeadingViews;
- (BOOL)_shouldHideNotificationGroupList:(id)a3;
- (BOOL)_shouldHideNotificationRequest:(id)a3;
- (BOOL)_shouldShowContentForNotificationRequest:(id)a3;
- (BOOL)_showSummarizedFooterView;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)isAttachmentImageFeaturedForNotificationGroupList:(id)a3;
- (BOOL)isCombinedAppSectionList;
- (BOOL)isExpanded;
- (BOOL)isMerged;
- (BOOL)isRichNotificationContentViewForNotificationGroupList:(id)a3;
- (BOOL)shouldAllowRestackingForNotificationListPresentableGroup:(id)a3;
- (NCNotificationAppSectionList)initWithTitle:(id)a3 sectionType:(unint64_t)a4;
- (NSArray)groupListsForSmartOrdering;
- (NSArray)requiredVisualStyleCategories;
- (NSMutableArray)featuredGroupLists;
- (NSMutableDictionary)richContentProviders;
- (NSString)sectionIdentifier;
- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4;
- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4;
- (id)_attachmentImageViewForSummaryForNotificationRequest:(id)a3;
- (id)_extractFeaturedNotificationRequestsFromGroupLists:(id)a3;
- (id)_localizedDefaultHiddenPreviewsBodyPlaceholder;
- (id)_newAttachmentImageViewForImage:(id)a3;
- (id)_newGroupListForNotificationRequest:(id)a3;
- (id)_nonFeaturedGroupLists;
- (id)_notificationGroupsForInsertion;
- (id)_summarizedAttachmentImageViews;
- (id)_summarizedContentStrings;
- (id)_summarizedStringsForNotificationRequest:(id)a3;
- (id)backgroundGroupNameBaseForAppSectionListSummarizedContentView:(id)a3;
- (id)footerViewForNotificationList:(id)a3;
- (id)headerViewForNotificationList:(id)a3;
- (id)notificationGroupList:(id)a3 requestsContentProviderForNotificationRequest:(id)a4;
- (id)preferredContentSizeCategory;
- (unint64_t)_insertionIndexForGroup:(id)a3;
- (unint64_t)_summarizedCount;
- (unint64_t)notificationListViewNumberOfItems:(id)a3;
- (void)_clearContentProviderForRequest:(id)a3;
- (void)_configureFooterViewIfNecessary;
- (void)_configureHeaderViewIfNecessary;
- (void)_configureSectionListView:(id)a3;
- (void)_mergeFeaturedGroupLists;
- (void)_removeFeaturedGroupListIfNecessary:(id)a3;
- (void)_updateFeaturedGroupListsForFeaturedNotificationRequests:(id)a3;
- (void)_updateSummarizedFooterViewContent;
- (void)appSectionListHeaderView:(id)a3 didRequestPresentingOptionsMenuFromView:(id)a4;
- (void)appSectionListSummarizedContentViewDidRecognizeTapGesture:(id)a3;
- (void)clearAll;
- (void)insertNotificationRequest:(id)a3;
- (void)modifyNotificationRequest:(id)a3;
- (void)notificationListBaseComponentDidRemoveAll:(id)a3;
- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4;
- (void)notificationListPresentableGroup:(id)a3 didReceivedHorizontalTranslation:(double)a4 forCell:(id)a5;
- (void)removeNotificationRequest:(id)a3;
- (void)setCombinedAppSectionList:(BOOL)a3;
- (void)setDeviceAuthenticated:(BOOL)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setFeaturedGroupLists:(id)a3;
- (void)setGroupListsForSmartOrdering:(id)a3;
- (void)setMerged:(BOOL)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setRichContentProviders:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)unmergeNotificationGroupListsIfNecessary;
@end

@implementation NCNotificationAppSectionList

- (NCNotificationAppSectionList)initWithTitle:(id)a3 sectionType:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationAppSectionList;
  v4 = [(NCNotificationStructuredSectionList *)&v12 initWithTitle:a3 sectionType:a4];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    featuredGroupLists = v4->_featuredGroupLists;
    v4->_featuredGroupLists = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    richContentProviders = v4->_richContentProviders;
    v4->_richContentProviders = v7;

    v4->_expanded = 0;
    v9 = [MEMORY[0x1E4FB1438] sharedApplication];
    v10 = [v9 preferredContentSizeCategory];
    [(NCNotificationAppSectionList *)v4 setPreferredContentSizeCategory:v10];
  }
  return v4;
}

- (NSArray)groupListsForSmartOrdering
{
  [(NCNotificationAppSectionList *)self _mergeFeaturedGroupLists];
  [(NCNotificationAppSectionList *)self setMerged:1];
  v3 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- (void)setGroupListsForSmartOrdering:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = [(NCNotificationStructuredSectionList *)self logDescription];
      int v14 = 138543618;
      v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = [v4 count];
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setting group lists for smart ordering with count %lu", (uint8_t *)&v14, 0x16u);
    }
    v8 = [(NCNotificationAppSectionList *)self _extractFeaturedNotificationRequestsFromGroupLists:v4];
    [(NCNotificationAppSectionList *)self _updateFeaturedGroupListsForFeaturedNotificationRequests:v8];
    v9 = objc_msgSend(v4, "bs_filter:", &__block_literal_global_7);
    id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v11 = [(NCNotificationAppSectionList *)self featuredGroupLists];
    objc_super v12 = (void *)[v10 initWithArray:v11];

    [v12 addObjectsFromArray:v9];
    [(NCNotificationStructuredSectionList *)self setNotificationGroups:v12];
    [(NCNotificationAppSectionList *)self setMerged:0];
    v13 = [(NCNotificationStructuredSectionList *)self listView];
    [v13 invalidateData];
  }
}

BOOL __62__NCNotificationAppSectionList_setGroupListsForSmartOrdering___block_invoke(uint64_t a1, void *a2)
{
  return [a2 notificationCount] != 0;
}

- (void)setExpanded:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_expanded != a3)
  {
    BOOL v3 = a3;
    v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = [(NCNotificationStructuredSectionList *)self logDescription];
      int v18 = 138543618;
      v19 = v7;
      __int16 v20 = 1024;
      BOOL v21 = v3;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setting expanded = %{BOOL}d", (uint8_t *)&v18, 0x12u);
    }
    self->_expanded = v3;
    if (v3)
    {
      v8 = [(NCNotificationStructuredSectionList *)self listView];
      [v8 reloadFooterViewAnimated:1];

      uint64_t v9 = [(NSMutableArray *)self->_featuredGroupLists count];
      id v10 = [(NCNotificationAppSectionList *)self _nonFeaturedGroupLists];
      uint64_t v11 = [v10 count];

      if (v11)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          v13 = [(NCNotificationAppSectionList *)self _nonFeaturedGroupLists];
          int v14 = [v13 objectAtIndex:i];
          v15 = [v14 listView];
          [v15 setNeedsLayout];

          __int16 v16 = [(NCNotificationStructuredSectionList *)self listView];
          [v16 insertViewAtIndex:v9 + i animated:1];
        }
      }
    }
    uint64_t v17 = [(NCNotificationStructuredSectionList *)self listView];
    [v17 setNeedsLayout];
  }
}

- (void)unmergeNotificationGroupListsIfNecessary
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(NCNotificationAppSectionList *)self isMerged])
  {
    BOOL v3 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      v5 = [(NCNotificationStructuredSectionList *)self logDescription];
      int v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ unmerging group lists", (uint8_t *)&v7, 0xCu);
    }
    v6 = [(NCNotificationStructuredSectionList *)self allNotificationGroups];
    [(NCNotificationAppSectionList *)self setGroupListsForSmartOrdering:v6];
  }
}

- (void)insertNotificationRequest:(id)a3
{
  id v4 = a3;
  [(NCNotificationAppSectionList *)self _clearContentProviderForRequest:v4];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v5 = [(NCNotificationAppSectionList *)self featuredGroupLists];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__NCNotificationAppSectionList_insertNotificationRequest___block_invoke;
  v8[3] = &unk_1E6A92F20;
  id v6 = v4;
  id v9 = v6;
  id v10 = self;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v8];

  if (!*((unsigned char *)v13 + 24))
  {
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationAppSectionList;
    [(NCNotificationStructuredSectionList *)&v7 insertNotificationRequest:v6];
  }
  [(NCNotificationAppSectionList *)self _updateSummarizedFooterViewContent];

  _Block_object_dispose(&v12, 8);
}

void __58__NCNotificationAppSectionList_insertNotificationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ([v6 containsNotificationRequest:*(void *)(a1 + 32)])
  {
    objc_super v7 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 40);
      id v9 = v7;
      id v10 = [v8 logDescription];
      uint64_t v11 = [*(id *)(a1 + 32) notificationIdentifier];
      uint64_t v12 = objc_msgSend(v11, "un_logDigest");
      v13 = [v6 logDescription];
      int v14 = 138543874;
      char v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting request %{public}@ in existing featured group list %{public}@", (uint8_t *)&v14, 0x20u);
    }
    [v6 insertNotificationRequest:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)modifyNotificationRequest:(id)a3
{
  id v4 = a3;
  [(NCNotificationAppSectionList *)self _clearContentProviderForRequest:v4];
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v5 = [(NCNotificationAppSectionList *)self featuredGroupLists];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__NCNotificationAppSectionList_modifyNotificationRequest___block_invoke;
  v9[3] = &unk_1E6A92F20;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  [v5 enumerateObjectsUsingBlock:v9];

  if (!*((unsigned char *)v14 + 24))
  {
    v8.receiver = self;
    v8.super_class = (Class)NCNotificationAppSectionList;
    [(NCNotificationStructuredSectionList *)&v8 modifyNotificationRequest:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationAppSectionList;
  [(NCNotificationStructuredSectionList *)&v7 modifyNotificationRequest:v6];
  [(NCNotificationAppSectionList *)self _updateSummarizedFooterViewContent];

  _Block_object_dispose(&v13, 8);
}

void __58__NCNotificationAppSectionList_modifyNotificationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ([v6 containsNotificationRequest:*(void *)(a1 + 32)])
  {
    objc_super v7 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = *(void **)(a1 + 40);
      id v9 = v7;
      id v10 = [v8 logDescription];
      uint64_t v11 = [*(id *)(a1 + 32) notificationIdentifier];
      uint64_t v12 = objc_msgSend(v11, "un_logDigest");
      uint64_t v13 = [v6 logDescription];
      int v14 = 138543874;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying request %{public}@ in existing featured group list %{public}@", (uint8_t *)&v14, 0x20u);
    }
    [v6 modifyNotificationRequest:*(void *)(a1 + 32)];
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)removeNotificationRequest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v5 = [(NCNotificationAppSectionList *)self featuredGroupLists];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__NCNotificationAppSectionList_removeNotificationRequest___block_invoke;
  v9[3] = &unk_1E6A91D00;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 enumerateObjectsUsingBlock:v9];

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationAppSectionList;
  [(NCNotificationStructuredSectionList *)&v8 removeNotificationRequest:v6];
  [(NCNotificationAppSectionList *)self _updateSummarizedFooterViewContent];
  [(NCNotificationAppSectionList *)self _clearContentProviderForRequest:v6];
  if (*((unsigned char *)v13 + 24))
  {
    objc_super v7 = [(NCNotificationAppSectionList *)self featuredGroupLists];
    [v7 enumerateObjectsUsingBlock:&__block_literal_global_11];
  }
  _Block_object_dispose(&v12, 8);
}

uint64_t __58__NCNotificationAppSectionList_removeNotificationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 containsNotificationRequest:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

void __58__NCNotificationAppSectionList_removeNotificationRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 leadingNotificationRequest];
  [v2 reloadNotificationRequest:v3];
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationAppSectionList;
  -[NCNotificationStructuredSectionList setDeviceAuthenticated:](&v9, sel_setDeviceAuthenticated_);
  v5 = [(NCNotificationAppSectionList *)self richContentProviders];
  id v6 = [v5 allValues];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__NCNotificationAppSectionList_setDeviceAuthenticated___block_invoke;
  v7[3] = &__block_descriptor_33_e57_v32__0__NCNotificationRequestRichContentProvider_8Q16_B24l;
  BOOL v8 = a3;
  [v6 enumerateObjectsUsingBlock:v7];
}

uint64_t __55__NCNotificationAppSectionList_setDeviceAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDeviceAuthenticated:*(unsigned __int8 *)(a1 + 32)];
}

- (void)clearAll
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationAppSectionList;
  [(NCNotificationStructuredSectionList *)&v4 clearAll];
  id v3 = [(NCNotificationStructuredSectionList *)self delegate];
  [v3 notificationListBaseComponentDidRemoveAll:self];
}

- (unint64_t)notificationListViewNumberOfItems:(id)a3
{
  id v4 = a3;
  if ([(NCNotificationAppSectionList *)self _showSummarizedFooterView])
  {
    id v5 = (id)[(NSMutableArray *)self->_featuredGroupLists count];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NCNotificationAppSectionList;
    id v5 = [(NCNotificationStructuredSectionList *)&v8 notificationListViewNumberOfItems:v4];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (id)headerViewForNotificationList:(id)a3
{
  [(NCNotificationAppSectionList *)self _configureHeaderViewIfNecessary];
  headerView = self->_headerView;

  return headerView;
}

- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  [(NCNotificationAppSectionList *)self _configureHeaderViewIfNecessary];
  BOOL v6 = [(NCNotificationAppSectionList *)self isCombinedAppSectionList];
  double result = 10.0;
  if (!v6)
  {
    -[NCNotificationAppSectionListHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", a4, 0.0);
    return v8;
  }
  return result;
}

- (id)footerViewForNotificationList:(id)a3
{
  if ([(NCNotificationAppSectionList *)self _showSummarizedFooterView])
  {
    [(NCNotificationAppSectionList *)self _configureFooterViewIfNecessary];
  }
  else
  {
    footerView = self->_footerView;
    if (footerView)
    {
      self->_footerView = 0;

      id v5 = [(NCNotificationStructuredSectionList *)self listView];
      [v5 reloadFooterViewAnimated:1];
    }
  }
  BOOL v6 = self->_footerView;

  return v6;
}

- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  [(NCNotificationAppSectionList *)self _configureFooterViewIfNecessary];
  BOOL v6 = [(NCNotificationAppSectionList *)self _showSummarizedFooterView];
  double result = 0.0;
  if (v6)
  {
    -[NCNotificationAppSectionListSummarizedContentView sizeThatFits:](self->_footerView, "sizeThatFits:", a4, 0.0);
    return v8;
  }
  return result;
}

- (BOOL)isRichNotificationContentViewForNotificationGroupList:(id)a3
{
  return 1;
}

- (BOOL)shouldAllowRestackingForNotificationListPresentableGroup:(id)a3
{
  return 0;
}

- (BOOL)isAttachmentImageFeaturedForNotificationGroupList:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationStructuredSectionList *)self allNotificationGroups];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }

  return [(NCNotificationAppSectionList *)self _isViewFeaturedAtIndex:v6];
}

- (void)notificationListBaseComponentDidRemoveAll:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationAppSectionList;
  id v4 = a3;
  [(NCNotificationStructuredSectionList *)&v6 notificationListBaseComponentDidRemoveAll:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  -[NCNotificationAppSectionList _removeFeaturedGroupListIfNecessary:](self, "_removeFeaturedGroupListIfNecessary:", v5, v6.receiver, v6.super_class);
}

- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationAppSectionList;
  id v6 = a3;
  [(NCNotificationStructuredSectionList *)&v8 notificationListComponent:v6 didRemoveNotificationRequest:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  -[NCNotificationAppSectionList _removeFeaturedGroupListIfNecessary:](self, "_removeFeaturedGroupListIfNecessary:", v7, v8.receiver, v8.super_class);
}

- (id)notificationGroupList:(id)a3 requestsContentProviderForNotificationRequest:(id)a4
{
  id v5 = a4;
  id v6 = [(NSMutableDictionary *)self->_richContentProviders objectForKey:v5];
  if (!v6)
  {
    id v6 = [(NCNotificationRequestCoalescingContentProvider *)[NCNotificationRequestRichContentProvider alloc] initWithNotificationRequest:v5];
    [(NCNotificationRequestCoalescingContentProvider *)v6 setDeviceAuthenticated:[(NCNotificationStructuredSectionList *)self deviceAuthenticated]];
    [(NCNotificationRequestRichContentProvider *)v6 setIconVisible:[(NCNotificationAppSectionList *)self isCombinedAppSectionList]];
    [(NSMutableDictionary *)self->_richContentProviders bs_setSafeObject:v6 forKey:v5];
  }

  return v6;
}

- (void)notificationListPresentableGroup:(id)a3 didReceivedHorizontalTranslation:(double)a4 forCell:(id)a5
{
  id v10 = a3;
  if ([(NCNotificationAppSectionList *)self _shouldFeatureLeadingViews])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(NCNotificationAppSectionList *)self featuredGroupLists];
      uint64_t v8 = [v7 indexOfObject:v10];

      if (v8 == 1)
      {
        objc_super v9 = [(NCNotificationStructuredSectionList *)self listView];
        [v9 setFeaturedLeadingViewOcclusionTranslation:a4];
      }
    }
  }
}

- (void)appSectionListHeaderView:(id)a3 didRequestPresentingOptionsMenuFromView:(id)a4
{
  id v5 = a4;
  id v6 = [(NCNotificationStructuredSectionList *)self allNotificationRequests];
  id v7 = [v6 firstObject];

  uint64_t v8 = [(NCNotificationStructuredSectionList *)self delegate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__NCNotificationAppSectionList_appSectionListHeaderView_didRequestPresentingOptionsMenuFromView___block_invoke;
  v10[3] = &unk_1E6A92F68;
  id v11 = v5;
  id v9 = v5;
  [v8 notificationListComponent:self requestsPresentingOptionsMenuForNotificationRequest:v7 presentingViewProvider:v10 optionsForSection:1 completion:0];
}

uint64_t __97__NCNotificationAppSectionList_appSectionListHeaderView_didRequestPresentingOptionsMenuFromView___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0, *(void *)(a1 + 32));
}

- (void)appSectionListSummarizedContentViewDidRecognizeTapGesture:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(NCNotificationStructuredSectionList *)self logDescription];
    int v11 = 138543362;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ is expanding on summarized view tap", (uint8_t *)&v11, 0xCu);
  }
  [(NCNotificationAppSectionList *)self setExpanded:1];
  uint64_t v8 = [(NCNotificationAppSectionList *)self _nonFeaturedGroupLists];
  if ([v8 count] == 1)
  {
    id v9 = [v8 firstObject];
    id v10 = [v9 listView];
    [v10 setGrouped:0];
  }
}

- (id)backgroundGroupNameBaseForAppSectionListSummarizedContentView:(id)a3
{
  id v4 = [(NCNotificationStructuredSectionList *)self delegate];
  id v5 = [v4 backgroundGroupNameBaseForNotificationListBaseComponent:self];

  return v5;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F2F845B0;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6 = (MTVisualStylingProvider *)a3;
  p_strokeVisualStylingProvider = &self->_strokeVisualStylingProvider;
  if (self->_strokeVisualStylingProvider != v6)
  {
    uint64_t v8 = v6;
    objc_storeStrong((id *)&self->_strokeVisualStylingProvider, a3);
    [(NCNotificationListBaseContentView *)self->_headerView setVisualStylingProvider:*p_strokeVisualStylingProvider forCategory:1];
    [(NCNotificationListBaseContentView *)self->_footerView setVisualStylingProvider:*p_strokeVisualStylingProvider forCategory:1];
    id v6 = v8;
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationAppSectionList;
  [(NCNotificationStructuredSectionList *)&v7 adjustForContentSizeCategoryChange];
  id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v4 = [v3 preferredContentSizeCategory];
  [(NCNotificationAppSectionList *)self setPreferredContentSizeCategory:v4];

  [(NCNotificationAppSectionListHeaderView *)self->_headerView adjustForContentSizeCategoryChange];
  [(NCNotificationListBaseContentView *)self->_footerView adjustForContentSizeCategoryChange];
  id v5 = [(NCNotificationStructuredSectionList *)self listView];
  [v5 invalidateData];

  return 1;
}

- (id)_notificationGroupsForInsertion
{
  if ([(NCNotificationAppSectionList *)self isMerged]) {
    [(NCNotificationStructuredSectionList *)self allNotificationGroups];
  }
  else {
  id v3 = [(NCNotificationAppSectionList *)self _nonFeaturedGroupLists];
  }

  return v3;
}

- (unint64_t)_insertionIndexForGroup:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationAppSectionList;
  id v4 = [(NCNotificationStructuredSectionList *)&v8 _insertionIndexForGroup:a3];
  uint64_t v5 = (uint64_t)v4;
  if (![(NCNotificationAppSectionList *)self isMerged])
  {
    id v6 = [(NCNotificationAppSectionList *)self featuredGroupLists];
    uint64_t v5 = [v6 count];
  }
  return (unint64_t)v4 + v5;
}

- (void)_configureSectionListView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationAppSectionList;
  id v3 = a3;
  [(NCNotificationStructuredSectionList *)&v4 _configureSectionListView:v3];
  objc_msgSend(v3, "setHorizontalInsetMargin:", 6.0, v4.receiver, v4.super_class);
  [v3 setNumberOfFeaturedLeadingViews:2];
  [v3 setFooterViewVerticalMargin:12.0];
  [v3 setGroupingAnimationStyle:1];
  [v3 setSupportsBottomViewsRollUnder:0];
}

- (BOOL)_shouldHideNotificationRequest:(id)a3
{
  return 0;
}

- (BOOL)_shouldHideNotificationGroupList:(id)a3
{
  return 0;
}

- (id)_newGroupListForNotificationRequest:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationAppSectionList;
  id v3 = [(NCNotificationStructuredSectionList *)&v7 _newGroupListForNotificationRequest:a3];
  objc_super v4 = [v3 listView];
  [v4 setLeadingContentShouldFillList:1];

  uint64_t v5 = [v3 listView];
  [v5 setSupportsBottomViewsRollUnder:0];

  return v3;
}

- (BOOL)_isViewFeaturedAtIndex:(unint64_t)a3
{
  return a3 <= 1 && [(NCNotificationAppSectionList *)self _shouldFeatureLeadingViews];
}

- (BOOL)_showSummarizedFooterView
{
  if ([(NCNotificationAppSectionList *)self isExpanded]
    || [(NCNotificationAppSectionList *)self isMerged]
    || [(NCNotificationAppSectionList *)self isCombinedAppSectionList])
  {
    return 0;
  }
  uint64_t v5 = [(NCNotificationAppSectionList *)self _nonFeaturedGroupLists];
  unint64_t v6 = [v5 count];
  objc_super v7 = [v5 firstObject];
  unint64_t v8 = [v7 notificationCount];

  BOOL v10 = v6 == 1 && v8 > 1;
  BOOL v3 = v6 > 1 || v10;

  return v3;
}

- (BOOL)_shouldFeatureLeadingViews
{
  BOOL v3 = [(NCNotificationAppSectionList *)self preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v3))
  {

LABEL_12:
    LOBYTE(v13) = 0;
    return v13;
  }
  objc_super v4 = [(NCNotificationAppSectionList *)self featuredGroupLists];
  uint64_t v5 = [v4 count];

  if (v5 != 2) {
    goto LABEL_12;
  }
  uint64_t v6 = 0;
  char v7 = 1;
  do
  {
    unint64_t v8 = [(NCNotificationAppSectionList *)self featuredGroupLists];
    id v9 = [v8 objectAtIndex:v6];

    BOOL v10 = [v9 leadingNotificationRequest];
    int v11 = [v10 content];
    uint64_t v12 = [v11 attachmentImage];

    if (v12) {
      int v13 = [v12 isSymbolImage] ^ 1;
    }
    else {
      LOBYTE(v13) = 0;
    }
    if ([v9 notificationCount] != 1) {
      LOBYTE(v13) = 0;
    }

    char v14 = v7 & v13;
    uint64_t v6 = 1;
    char v7 = 0;
  }
  while ((v14 & 1) != 0);
  return v13;
}

- (void)_clearContentProviderForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_richContentProviders allKeys];
  uint64_t v6 = (void *)[v5 copy];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__NCNotificationAppSectionList__clearContentProviderForRequest___block_invoke;
  v10[3] = &unk_1E6A92790;
  id v7 = v4;
  id v11 = v7;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v10];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [v6 objectAtIndex:v8];
    [(NSMutableDictionary *)self->_richContentProviders removeObjectForKey:v9];
  }
}

uint64_t __64__NCNotificationAppSectionList__clearContentProviderForRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 matchesRequest:*(void *)(a1 + 32)];
}

- (void)_configureHeaderViewIfNecessary
{
  if (!self->_headerView && ![(NCNotificationAppSectionList *)self isCombinedAppSectionList])
  {
    BOOL v3 = objc_alloc_init(NCNotificationAppSectionListHeaderView);
    headerView = self->_headerView;
    self->_headerView = v3;

    [(NCNotificationAppSectionListHeaderView *)self->_headerView setDelegate:self];
    uint64_t v5 = self->_headerView;
    uint64_t v6 = [(NCNotificationStructuredSectionList *)self title];
    [(NCNotificationAppSectionListHeaderView *)v5 setTitle:v6];

    id v7 = self->_headerView;
    uint64_t v8 = [(NCNotificationStructuredSectionList *)self allNotificationRequests];
    id v9 = [v8 firstObject];
    BOOL v10 = [v9 content];
    id v11 = [v10 icons];
    [(NCNotificationAppSectionListHeaderView *)v7 setIcons:v11];

    uint64_t v12 = self->_headerView;
    strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
    [(NCNotificationListBaseContentView *)v12 setVisualStylingProvider:strokeVisualStylingProvider forCategory:1];
  }
}

- (void)_configureFooterViewIfNecessary
{
  if ([(NCNotificationAppSectionList *)self _showSummarizedFooterView]
    && !self->_footerView)
  {
    BOOL v3 = objc_alloc_init(NCNotificationAppSectionListSummarizedContentView);
    footerView = self->_footerView;
    self->_footerView = v3;

    [(NCNotificationAppSectionListSummarizedContentView *)self->_footerView setDelegate:self];
    [(NCNotificationListBaseContentView *)self->_footerView setVisualStylingProvider:self->_strokeVisualStylingProvider forCategory:1];
    [(NCNotificationAppSectionList *)self _updateSummarizedFooterViewContent];
  }
}

- (void)_removeFeaturedGroupListIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v14 = v4;
    uint64_t v6 = [v4 count];
    uint64_t v5 = v14;
    if (!v6)
    {
      id v7 = [(NCNotificationAppSectionList *)self featuredGroupLists];
      int v8 = [v7 containsObject:v14];

      if (v8)
      {
        id v9 = [(NCNotificationAppSectionList *)self featuredGroupLists];
        [v9 removeObject:v14];
      }
      BOOL v10 = [(NCNotificationAppSectionList *)self featuredGroupLists];
      uint64_t v11 = [v10 count];

      uint64_t v5 = v14;
      if (v11)
      {
        uint64_t v12 = [(NCNotificationAppSectionList *)self featuredGroupLists];
        [v12 enumerateObjectsUsingBlock:&__block_literal_global_39];

        int v13 = [(NCNotificationStructuredSectionList *)self listView];
        [v13 setNeedsLayout];

        uint64_t v5 = v14;
      }
    }
  }
}

void __68__NCNotificationAppSectionList__removeFeaturedGroupListIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 leadingNotificationRequest];
  [v2 reloadNotificationRequest:v3];
}

- (id)_extractFeaturedNotificationRequestsFromGroupLists:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  if ([v5 count] == 1)
  {
    id v7 = [v5 objectAtIndex:0];

    int v8 = [v7 allNotificationRequests];
    id v9 = (void *)[v8 copy];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __83__NCNotificationAppSectionList__extractFeaturedNotificationRequestsFromGroupLists___block_invoke;
    v15[3] = &unk_1E6A92EA8;
    id v16 = v6;
    id v17 = v7;
    __int16 v18 = self;
    id v10 = v7;
    [v9 enumerateObjectsUsingBlock:v15];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __83__NCNotificationAppSectionList__extractFeaturedNotificationRequestsFromGroupLists___block_invoke_2;
    v12[3] = &unk_1E6A92C18;
    id v13 = v6;
    id v14 = self;
    [v5 enumerateObjectsUsingBlock:v12];

    id v9 = v13;
  }

  return v6;
}

void __83__NCNotificationAppSectionList__extractFeaturedNotificationRequestsFromGroupLists___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  if (a3 > 1)
  {
    *a4 = 1;
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a2;
    [v5 addObject:v6];
    [*(id *)(a1 + 40) removeNotificationRequest:v6];
    id v7 = [*(id *)(a1 + 48) notificationListCache];
    [v7 clearCacheForNotificationRequest:v6];
  }
}

void __83__NCNotificationAppSectionList__extractFeaturedNotificationRequestsFromGroupLists___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  int v8 = v7;
  if (a3 <= 1 && (uint64_t v12 = v7, v9 = [v7 notificationCount], v8 = v12, v9))
  {
    id v10 = [v12 leadingNotificationRequest];
    [*(id *)(a1 + 32) addObject:v10];
    [v12 removeNotificationRequest:v10];
    uint64_t v11 = [*(id *)(a1 + 40) notificationListCache];
    [v11 clearCacheForNotificationRequest:v10];

    int v8 = v12;
  }
  else
  {
    *a4 = 1;
  }
}

- (void)_updateFeaturedGroupListsForFeaturedNotificationRequests:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__NCNotificationAppSectionList__updateFeaturedGroupListsForFeaturedNotificationRequests___block_invoke;
  v16[3] = &unk_1E6A92BA0;
  v16[4] = self;
  id v7 = v6;
  id v17 = v7;
  [v5 enumerateObjectsUsingBlock:v16];

  int v8 = [(NCNotificationAppSectionList *)self featuredGroupLists];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __89__NCNotificationAppSectionList__updateFeaturedGroupListsForFeaturedNotificationRequests___block_invoke_3;
  id v13 = &unk_1E6A92C18;
  id v14 = v7;
  char v15 = self;
  id v9 = v7;
  [v8 enumerateObjectsUsingBlock:&v10];

  -[NCNotificationAppSectionList setFeaturedGroupLists:](self, "setFeaturedGroupLists:", v9, v10, v11, v12, v13);
}

void __89__NCNotificationAppSectionList__updateFeaturedGroupListsForFeaturedNotificationRequests___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) featuredGroupLists];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__NCNotificationAppSectionList__updateFeaturedGroupListsForFeaturedNotificationRequests___block_invoke_2;
  v10[3] = &unk_1E6A92BF0;
  id v11 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 indexOfObjectPassingTest:v10];

  id v7 = *(void **)(a1 + 32);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v8 = (void *)[v7 _newGroupListForNotificationRequest:v5];
    [v8 insertNotificationRequest:v5];
  }
  else
  {
    id v9 = [v7 featuredGroupLists];
    int v8 = [v9 objectAtIndex:v6];
  }
  [*(id *)(a1 + 40) addObject:v8];
}

BOOL __89__NCNotificationAppSectionList__updateFeaturedGroupListsForFeaturedNotificationRequests___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 leadingNotificationRequest];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __89__NCNotificationAppSectionList__updateFeaturedGroupListsForFeaturedNotificationRequests___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 40) notificationListCache];
    BOOL v4 = [v6 leadingNotificationRequest];
    [v3 clearCacheForNotificationRequest:v4];

    id v5 = [v6 listView];
    [v5 recycleVisibleViews];
  }
}

- (void)_mergeFeaturedGroupLists
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(NCNotificationAppSectionList *)self featuredGroupLists];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      id v7 = [(NCNotificationStructuredSectionList *)self logDescription];
      *(_DWORD *)buf = 138543362;
      id v14 = v7;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ merging featured group lists", buf, 0xCu);
    }
    int v8 = [(NCNotificationAppSectionList *)self featuredGroupLists];
    id v9 = (void *)[v8 copy];

    uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    featuredGroupLists = self->_featuredGroupLists;
    self->_featuredGroupLists = v10;

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__NCNotificationAppSectionList__mergeFeaturedGroupLists__block_invoke;
    v12[3] = &unk_1E6A92950;
    void v12[4] = self;
    [v9 enumerateObjectsUsingBlock:v12];
  }
}

void __56__NCNotificationAppSectionList__mergeFeaturedGroupLists__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _removeNotificationGroupList:v4 animated:0];
  id v5 = [*(id *)(a1 + 32) notificationListCache];
  id v6 = [v4 leadingNotificationRequest];
  [v5 clearCacheForNotificationRequest:v6];

  id v7 = [v4 allNotificationRequests];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__NCNotificationAppSectionList__mergeFeaturedGroupLists__block_invoke_2;
  v8[3] = &unk_1E6A91B18;
  void v8[4] = *(void *)(a1 + 32);
  [v7 enumerateObjectsUsingBlock:v8];
}

uint64_t __56__NCNotificationAppSectionList__mergeFeaturedGroupLists__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) insertNotificationRequest:a2];
}

- (id)_nonFeaturedGroupLists
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [(NCNotificationStructuredSectionList *)self allNotificationGroups];
  id v5 = (void *)[v3 initWithArray:v4];

  id v6 = [(NCNotificationAppSectionList *)self featuredGroupLists];
  [v5 removeObjectsInArray:v6];

  return v5;
}

- (BOOL)_shouldShowContentForNotificationRequest:(id)a3
{
  id v4 = [a3 options];
  uint64_t v5 = [v4 contentPreviewSetting];

  if (!v5) {
    return 1;
  }
  if (v5 != 1) {
    return 0;
  }

  return [(NCNotificationStructuredSectionList *)self deviceAuthenticated];
}

- (void)_updateSummarizedFooterViewContent
{
  footerView = self->_footerView;
  if (footerView)
  {
    [(NCNotificationAppSectionListSummarizedContentView *)footerView setCount:[(NCNotificationAppSectionList *)self _summarizedCount]];
    id v4 = self->_footerView;
    uint64_t v5 = NCUserNotificationsUIKitFrameworkBundle();
    id v6 = [v5 localizedStringForKey:@"NOTIFICATION_SUMMARY_APP_TITLE" value:&stru_1F2F516F8 table:0];
    [(NCNotificationAppSectionListSummarizedContentView *)v4 setTitle:v6];

    id v7 = self->_footerView;
    int v8 = [(NCNotificationAppSectionList *)self _summarizedContentStrings];
    [(NCNotificationAppSectionListSummarizedContentView *)v7 setTitleAndContentStrings:v8];

    id v9 = self->_footerView;
    uint64_t v10 = [(NCNotificationAppSectionList *)self _summarizedAttachmentImageViews];
    [(NCNotificationAppSectionListSummarizedContentView *)v9 setAttachmentImageViews:v10];

    id v11 = [(NCNotificationStructuredSectionList *)self listView];
    [v11 setNeedsLayout];
  }
}

- (unint64_t)_summarizedCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v2 = [(NCNotificationAppSectionList *)self _nonFeaturedGroupLists];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__NCNotificationAppSectionList__summarizedCount__block_invoke;
  v5[3] = &unk_1E6A92CA8;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  unint64_t v3 = v7[3];

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__NCNotificationAppSectionList__summarizedCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 notificationCount];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (id)_summarizedStringsForNotificationRequest:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(NCNotificationAppSectionList *)self _shouldShowContentForNotificationRequest:v4];
  uint64_t v6 = [v4 content];
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 title];
  }
  else
  {
    uint64_t v9 = [v4 content];
    uint64_t v8 = [v9 defaultHeader];
  }
  if (v8)
  {
    uint64_t v10 = NSString;
    id v11 = NCUserNotificationsUIKitFrameworkBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"NOTIFICATION_SUMMARY_APP_SECTION_TITLE_FORMAT" value:&stru_1F2F516F8 table:0];
    objc_msgSend(v10, "stringWithFormat:", v12, v8);
    id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
LABEL_6:
      id v14 = [v7 message];
      uint64_t v15 = (__CFString *)[v14 copy];
      goto LABEL_12;
    }
  }
  else
  {
    id v13 = &stru_1F2F516F8;
    if (v5) {
      goto LABEL_6;
    }
  }
  id v14 = [v4 content];
  id v16 = [v14 hiddenPreviewsBodyPlaceholder];
  id v17 = v16;
  if (v16)
  {
    __int16 v18 = v16;
  }
  else
  {
    __int16 v18 = [(NCNotificationAppSectionList *)self _localizedDefaultHiddenPreviewsBodyPlaceholder];
  }
  uint64_t v15 = v18;

LABEL_12:
  if (v15) {
    v19 = v15;
  }
  else {
    v19 = &stru_1F2F516F8;
  }
  v24[0] = v13;
  v24[1] = v19;
  uint64_t v20 = (void *)MEMORY[0x1E4F1C978];
  BOOL v21 = v19;
  uint64_t v22 = [v20 arrayWithObjects:v24 count:2];

  return v22;
}

- (id)_summarizedContentStrings
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(NCNotificationAppSectionList *)self _nonFeaturedGroupLists];
  if ([v4 count] == 1)
  {
    BOOL v5 = [v4 objectAtIndex:0];
    uint64_t v6 = [v5 allNotificationRequests];
    id v7 = (void *)[v6 copy];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__NCNotificationAppSectionList__summarizedContentStrings__block_invoke;
    v11[3] = &unk_1E6A92BA0;
    v11[4] = self;
    id v12 = v3;
    [v7 enumerateObjectsUsingBlock:v11];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__NCNotificationAppSectionList__summarizedContentStrings__block_invoke_2;
    v9[3] = &unk_1E6A92C18;
    void v9[4] = self;
    id v10 = v3;
    [v4 enumerateObjectsUsingBlock:v9];
  }

  return v3;
}

void __57__NCNotificationAppSectionList__summarizedContentStrings__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  if (a3 > 2)
  {
    *a4 = 1;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) _summarizedStringsForNotificationRequest:a2];
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __57__NCNotificationAppSectionList__summarizedContentStrings__block_invoke_2(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  if (a3 > 2)
  {
    *a4 = 1;
  }
  else
  {
    id v5 = [a2 allNotificationRequests];
    id v7 = [v5 firstObject];

    uint64_t v6 = [*(id *)(a1 + 32) _summarizedStringsForNotificationRequest:v7];
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (id)_localizedDefaultHiddenPreviewsBodyPlaceholder
{
  id v2 = NSString;
  id v3 = NCUserNotificationsUIKitFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"DEFAULT_HIDDEN_PREVIEW_PLACEHOLDER" value:&stru_1F2F516F8 table:0];
  id v5 = objc_msgSend(v2, "localizedStringWithFormat:", v4, 1, 0);

  return v5;
}

- (id)_attachmentImageViewForSummaryForNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_richContentProviders objectForKey:v4];
  if (!v5)
  {
    id v5 = [(NCNotificationRequestCoalescingContentProvider *)[NCNotificationRequestRichContentProvider alloc] initWithNotificationRequest:v4];
    [(NCNotificationRequestCoalescingContentProvider *)v5 setDeviceAuthenticated:[(NCNotificationStructuredSectionList *)self deviceAuthenticated]];
    [(NSMutableDictionary *)self->_richContentProviders bs_setSafeObject:v5 forKey:v4];
  }
  id v6 = [(NCNotificationRequestCoalescingContentProvider *)v5 communicationAvatar];
  if (!v6)
  {
    id v7 = [v4 content];
    uint64_t v8 = [v7 attachmentImage];

    if (v8)
    {
      if ([(NCNotificationRequestRichContentProvider *)v5 hasLoadedRichAttachmentImage])
      {
        uint64_t v9 = [(NCNotificationRequestRichContentProvider *)v5 thumbnail];

        uint64_t v8 = (void *)v9;
      }
      else
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __85__NCNotificationAppSectionList__attachmentImageViewForSummaryForNotificationRequest___block_invoke;
        v11[3] = &unk_1E6A92F90;
        v11[4] = self;
        [(NCNotificationRequestRichContentProvider *)v5 fetchRichAttachmentImageIsFeatured:0 withCompletion:v11];
      }
      id v6 = [(NCNotificationAppSectionList *)self _newAttachmentImageViewForImage:v8];
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

uint64_t __85__NCNotificationAppSectionList__attachmentImageViewForSummaryForNotificationRequest___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  if (a3) {
    return [*(id *)(result + 32) _updateSummarizedFooterViewContent];
  }
  return result;
}

- (id)_newAttachmentImageViewForImage:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4FB1EB0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  [v6 setContentMode:2];
  [v6 _setContinuousCornerRadius:10.0];
  [v6 setClipsToBounds:1];
  [v6 setImage:v4];

  [v5 addSubview:v6];
  [v6 setAutoresizingMask:18];

  return v5;
}

- (id)_summarizedAttachmentImageViews
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(NCNotificationAppSectionList *)self _nonFeaturedGroupLists];
  if ([v4 count] == 1)
  {
    id v5 = [v4 objectAtIndex:0];
    id v6 = [v5 allNotificationRequests];
    id v7 = (void *)[v6 copy];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__NCNotificationAppSectionList__summarizedAttachmentImageViews__block_invoke;
    v12[3] = &unk_1E6A92BA0;
    id v13 = v3;
    id v14 = self;
    [v7 enumerateObjectsUsingBlock:v12];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__NCNotificationAppSectionList__summarizedAttachmentImageViews__block_invoke_2;
    v9[3] = &unk_1E6A92C18;
    id v10 = v3;
    id v11 = self;
    [v4 enumerateObjectsUsingBlock:v9];
    id v5 = v10;
  }

  return v3;
}

void __63__NCNotificationAppSectionList__summarizedAttachmentImageViews__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) count] > 1)
  {
    *a4 = 1;
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) _attachmentImageViewForSummaryForNotificationRequest:v7];
    if (v6) {
      [*(id *)(a1 + 32) addObject:v6];
    }
  }
}

void __63__NCNotificationAppSectionList__summarizedAttachmentImageViews__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) count] > 1)
  {
    *a4 = 1;
  }
  else
  {
    id v6 = [v9 allNotificationRequests];
    id v7 = [v6 firstObject];

    if (v7)
    {
      uint64_t v8 = [*(id *)(a1 + 40) _attachmentImageViewForSummaryForNotificationRequest:v7];
      if (v8) {
        [*(id *)(a1 + 32) addObject:v8];
      }
    }
  }
}

- (id)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isCombinedAppSectionList
{
  return self->_combinedAppSectionList;
}

- (void)setCombinedAppSectionList:(BOOL)a3
{
  self->_combinedAppSectionList = a3;
}

- (NSMutableArray)featuredGroupLists
{
  return self->_featuredGroupLists;
}

- (void)setFeaturedGroupLists:(id)a3
{
}

- (NSMutableDictionary)richContentProviders
{
  return self->_richContentProviders;
}

- (void)setRichContentProviders:(id)a3
{
}

- (BOOL)isMerged
{
  return self->_merged;
}

- (void)setMerged:(BOOL)a3
{
  self->_merged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richContentProviders, 0);
  objc_storeStrong((id *)&self->_featuredGroupLists, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_footerView, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end