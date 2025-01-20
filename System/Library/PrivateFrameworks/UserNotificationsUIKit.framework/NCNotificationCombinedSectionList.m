@interface NCNotificationCombinedSectionList
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)containsNotificationRequest:(id)a3;
- (BOOL)containsSectionList:(id)a3;
- (BOOL)hasVisibleContentToReveal;
- (NCNotificationCombinedSectionList)initWithTitle:(id)a3 sectionType:(unint64_t)a4;
- (NSMutableArray)chronologicalSectionLists;
- (NSMutableArray)sectionLists;
- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5;
- (id)_allSectionLists;
- (id)allNotificationRequests;
- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4;
- (id)orderedNotificationListComponents;
- (id)sectionListAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)notificationCount;
- (void)_invalidateSectionListViewForChronologicalSectionsIfNecessary;
- (void)_performOperationOnAllSectionLists:(id)a3;
- (void)adjustForLegibilitySettingsChange:(id)a3;
- (void)clearAll;
- (void)collapseGroupForNotificationRequest:(id)a3 withCompletion:(id)a4;
- (void)expandGroupForNotificationRequest:(id)a3 withCompletion:(id)a4;
- (void)insertNotificationSectionList:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5;
- (void)insertNotificationSectionListChronologically:(id)a3 animated:(BOOL)a4;
- (void)mergeNotificationGroups:(id)a3 reorderGroupNotifications:(BOOL)a4;
- (void)notificationListBaseComponentDidRemoveAll:(id)a3;
- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4;
- (void)notificationsLoadedForSectionIdentifier:(id)a3;
- (void)reloadNotificationRequest:(id)a3;
- (void)removeNotificationSectionList:(id)a3 animated:(BOOL)a4;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setChronologicalSectionLists:(id)a3;
- (void)setDeviceAuthenticated:(BOOL)a3;
- (void)setSectionLists:(id)a3;
- (void)sortNotificationGroupListsIfNecessary;
- (void)toggleFilteringForSectionIdentifier:(id)a3 shouldFilter:(BOOL)a4;
- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4;
@end

@implementation NCNotificationCombinedSectionList

- (NCNotificationCombinedSectionList)initWithTitle:(id)a3 sectionType:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationCombinedSectionList;
  v4 = [(NCNotificationStructuredSectionList *)&v8 initWithTitle:a3 sectionType:a4];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sectionLists = v4->_sectionLists;
    v4->_sectionLists = v5;
  }
  return v4;
}

- (void)insertNotificationSectionList:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = a3;
  objc_super v8 = [(NCNotificationCombinedSectionList *)self sectionLists];
  unint64_t v9 = [v8 count];

  if (v9 >= a4)
  {
    unint64_t v10 = [(NCNotificationCombinedSectionList *)self count];
    v11 = [(NCNotificationCombinedSectionList *)self sectionLists];
    [v11 insertObject:v16 atIndex:a4];

    [(NCNotificationStructuredSectionList *)self _insertViewToListAtIndex:a4 animated:v5];
    v12 = [v16 listView];
    [v12 setRevealPercentage:1.0];

    v13 = [v16 listView];
    [v13 setRevealed:1];

    unint64_t v14 = [(NCNotificationCombinedSectionList *)self count];
    if (!v10)
    {
      if (v14)
      {
        v15 = [(NCNotificationStructuredSectionList *)self listView];
        [v15 reloadHeaderView];
      }
    }
  }
}

- (void)insertNotificationSectionListChronologically:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  if (!-[NCNotificationCombinedSectionList containsSectionList:](self, "containsSectionList:"))
  {
    unint64_t v6 = [(NCNotificationCombinedSectionList *)self count];
    chronologicalSectionLists = self->_chronologicalSectionLists;
    if (!chronologicalSectionLists)
    {
      objc_super v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v9 = self->_chronologicalSectionLists;
      self->_chronologicalSectionLists = v8;

      chronologicalSectionLists = self->_chronologicalSectionLists;
    }
    [(NSMutableArray *)chronologicalSectionLists addObject:v12];
    [(NCNotificationStructuredSectionList *)self _insertViewToListAtIndex:[(NCNotificationStructuredSectionList *)self _indexOfOrderedNotificationListComponent:v12] animated:v4];
    unint64_t v10 = [(NCNotificationCombinedSectionList *)self count];
    if (!v6 && v10)
    {
      v11 = [(NCNotificationStructuredSectionList *)self listView];
      [v11 reloadHeaderView];
    }
  }
}

- (void)removeNotificationSectionList:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v18 = a3;
  unint64_t v6 = [(NCNotificationCombinedSectionList *)self count];
  v7 = [(NCNotificationCombinedSectionList *)self sectionLists];
  int v8 = [v7 containsObject:v18];

  if (v8)
  {
    unint64_t v9 = [(NCNotificationCombinedSectionList *)self sectionLists];
    uint64_t v10 = [v9 indexOfObject:v18];

    v11 = [(NCNotificationCombinedSectionList *)self sectionLists];
    [v11 removeObject:v18];

    -[NCNotificationStructuredSectionList _removeViewFromListAtIndex:animated:isHorizontallyDisplaced:](self, "_removeViewFromListAtIndex:animated:isHorizontallyDisplaced:", v10, v4, [v18 isHorizontallyDisplaced]);
  }
  else
  {
    id v12 = [(NCNotificationCombinedSectionList *)self chronologicalSectionLists];
    int v13 = [v12 containsObject:v18];

    if (v13)
    {
      unint64_t v14 = [(NCNotificationStructuredSectionList *)self _indexOfOrderedNotificationListComponent:v18];
      v15 = [(NCNotificationCombinedSectionList *)self chronologicalSectionLists];
      [v15 removeObject:v18];

      -[NCNotificationStructuredSectionList _removeViewFromListAtIndex:animated:isHorizontallyDisplaced:](self, "_removeViewFromListAtIndex:animated:isHorizontallyDisplaced:", v14, v4, [v18 isHorizontallyDisplaced]);
      if (![(NSMutableArray *)self->_chronologicalSectionLists count])
      {
        chronologicalSectionLists = self->_chronologicalSectionLists;
        self->_chronologicalSectionLists = 0;
      }
    }
  }
  if (v6 && ![(NCNotificationCombinedSectionList *)self count])
  {
    v17 = [(NCNotificationStructuredSectionList *)self listView];
    [v17 reloadHeaderView];
  }
}

- (id)sectionListAtIndex:(unint64_t)a3
{
  BOOL v4 = [(NCNotificationCombinedSectionList *)self orderedNotificationListComponents];
  if ([v4 count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    BOOL v5 = [v4 objectAtIndex:a3];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }

  return v6;
}

- (BOOL)containsSectionList:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NCNotificationCombinedSectionList *)self sectionLists];
  if ([v5 containsObject:v4])
  {
    char v6 = 1;
  }
  else
  {
    v7 = [(NCNotificationCombinedSectionList *)self chronologicalSectionLists];
    char v6 = [v7 containsObject:v4];
  }
  return v6;
}

- (void)clearAll
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationCombinedSectionList;
  [(NCNotificationStructuredSectionList *)&v3 clearAll];
  [(NCNotificationCombinedSectionList *)self _performOperationOnAllSectionLists:&__block_literal_global_34];
}

uint64_t __45__NCNotificationCombinedSectionList_clearAll__block_invoke(uint64_t a1, void *a2)
{
  return [a2 clearAll];
}

- (BOOL)hasVisibleContentToReveal
{
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  unsigned __int8 v11 = 0;
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationCombinedSectionList;
  unsigned __int8 v11 = [(NCNotificationStructuredSectionList *)&v7 hasVisibleContentToReveal];
  if (*((unsigned char *)v9 + 24))
  {
    BOOL v3 = 1;
  }
  else
  {
    id v4 = [(NCNotificationCombinedSectionList *)self _allSectionLists];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__NCNotificationCombinedSectionList_hasVisibleContentToReveal__block_invoke;
    v6[3] = &unk_1E6A92768;
    v6[4] = &v8;
    [v4 enumerateObjectsUsingBlock:v6];

    BOOL v3 = *((unsigned char *)v9 + 24) != 0;
  }
  _Block_object_dispose(&v8, 8);
  return v3;
}

uint64_t __62__NCNotificationCombinedSectionList_hasVisibleContentToReveal__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 hasVisibleContentToReveal];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)mergeNotificationGroups:(id)a3 reorderGroupNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationCombinedSectionList;
  id v6 = a3;
  [(NCNotificationStructuredSectionList *)&v8 mergeNotificationGroups:v6 reorderGroupNotifications:v4];
  uint64_t v7 = objc_msgSend(v6, "count", v8.receiver, v8.super_class);

  if (v7)
  {
    if (v4) {
      [(NCNotificationCombinedSectionList *)self _invalidateSectionListViewForChronologicalSectionsIfNecessary];
    }
  }
}

- (void)sortNotificationGroupListsIfNecessary
{
  BOOL v3 = [(NCNotificationStructuredSectionList *)self groupListsToSort];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = [(NCNotificationStructuredSectionList *)self groupListsToSort];
    [v5 enumerateObjectsUsingBlock:&__block_literal_global_11_0];

    v6.receiver = self;
    v6.super_class = (Class)NCNotificationCombinedSectionList;
    [(NCNotificationStructuredSectionList *)&v6 sortNotificationGroupListsIfNecessary];
    [(NCNotificationCombinedSectionList *)self _invalidateSectionListViewForChronologicalSectionsIfNecessary];
  }
}

uint64_t __74__NCNotificationCombinedSectionList_sortNotificationGroupListsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateComparisonDate];
}

- (unint64_t)count
{
  BOOL v3 = [(NCNotificationCombinedSectionList *)self sectionLists];
  uint64_t v4 = [v3 count];
  BOOL v5 = [(NCNotificationCombinedSectionList *)self chronologicalSectionLists];
  uint64_t v6 = [v5 count] + v4;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationCombinedSectionList;
  uint64_t v7 = (char *)[(NCNotificationStructuredSectionList *)&v9 count] + v6;

  return (unint64_t)v7;
}

- (unint64_t)notificationCount
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)NCNotificationCombinedSectionList;
  BOOL v3 = [(NCNotificationStructuredSectionList *)&v14 notificationCount];
  uint64_t v4 = [(NCNotificationCombinedSectionList *)self _allSectionLists];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 += [*(id *)(*((void *)&v10 + 1) + 8 * v8++) notificationCount];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }

  return (unint64_t)v3;
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationCombinedSectionList;
  -[NCNotificationStructuredSectionList setDeviceAuthenticated:](&v7, sel_setDeviceAuthenticated_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__NCNotificationCombinedSectionList_setDeviceAuthenticated___block_invoke;
  v5[3] = &__block_descriptor_33_e45_v16__0__NCNotificationStructuredSectionList_8l;
  BOOL v6 = a3;
  [(NCNotificationCombinedSectionList *)self _performOperationOnAllSectionLists:v5];
}

uint64_t __60__NCNotificationCombinedSectionList_setDeviceAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDeviceAuthenticated:*(unsigned __int8 *)(a1 + 32)];
}

- (void)reloadNotificationRequest:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationCombinedSectionList;
  [(NCNotificationStructuredSectionList *)&v8 reloadNotificationRequest:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__NCNotificationCombinedSectionList_reloadNotificationRequest___block_invoke;
  v6[3] = &unk_1E6A945A0;
  id v7 = v4;
  id v5 = v4;
  [(NCNotificationCombinedSectionList *)self _performOperationOnAllSectionLists:v6];
}

uint64_t __63__NCNotificationCombinedSectionList_reloadNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadNotificationRequest:*(void *)(a1 + 32)];
}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NCNotificationCombinedSectionList;
  [(NCNotificationStructuredSectionList *)&v13 updateNotificationSectionSettings:v6 previousSectionSettings:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__NCNotificationCombinedSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke;
  v10[3] = &unk_1E6A945C8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NCNotificationCombinedSectionList *)self _performOperationOnAllSectionLists:v10];
}

uint64_t __95__NCNotificationCombinedSectionList_updateNotificationSectionSettings_previousSectionSettings___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateNotificationSectionSettings:*(void *)(a1 + 32) previousSectionSettings:*(void *)(a1 + 40)];
}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationCombinedSectionList;
  [(NCNotificationStructuredSectionList *)&v8 notificationsLoadedForSectionIdentifier:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__NCNotificationCombinedSectionList_notificationsLoadedForSectionIdentifier___block_invoke;
  v6[3] = &unk_1E6A945A0;
  id v7 = v4;
  id v5 = v4;
  [(NCNotificationCombinedSectionList *)self _performOperationOnAllSectionLists:v6];
}

uint64_t __77__NCNotificationCombinedSectionList_notificationsLoadedForSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 notificationsLoadedForSectionIdentifier:*(void *)(a1 + 32)];
}

- (void)toggleFilteringForSectionIdentifier:(id)a3 shouldFilter:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationCombinedSectionList;
  [(NCNotificationStructuredSectionList *)&v11 toggleFilteringForSectionIdentifier:v6 shouldFilter:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__NCNotificationCombinedSectionList_toggleFilteringForSectionIdentifier_shouldFilter___block_invoke;
  v8[3] = &unk_1E6A945F0;
  id v9 = v6;
  BOOL v10 = v4;
  id v7 = v6;
  [(NCNotificationCombinedSectionList *)self _performOperationOnAllSectionLists:v8];
}

uint64_t __86__NCNotificationCombinedSectionList_toggleFilteringForSectionIdentifier_shouldFilter___block_invoke(uint64_t a1, void *a2)
{
  return [a2 toggleFilteringForSectionIdentifier:*(void *)(a1 + 32) shouldFilter:*(unsigned __int8 *)(a1 + 40)];
}

- (id)allNotificationRequests
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NCNotificationCombinedSectionList;
  BOOL v3 = [(NCNotificationStructuredSectionList *)&v16 allNotificationRequests];
  BOOL v4 = [(NCNotificationCombinedSectionList *)self _allSectionLists];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      id v9 = v3;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) allNotificationRequests];
        BOOL v3 = [v9 arrayByAddingObjectsFromArray:v10];

        ++v8;
        id v9 = v3;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)expandGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NCNotificationCombinedSectionList;
  [(NCNotificationStructuredSectionList *)&v13 expandGroupForNotificationRequest:v6 withCompletion:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__NCNotificationCombinedSectionList_expandGroupForNotificationRequest_withCompletion___block_invoke;
  v10[3] = &unk_1E6A94618;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NCNotificationCombinedSectionList *)self _performOperationOnAllSectionLists:v10];
}

uint64_t __86__NCNotificationCombinedSectionList_expandGroupForNotificationRequest_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 expandGroupForNotificationRequest:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
}

- (void)collapseGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NCNotificationCombinedSectionList;
  [(NCNotificationStructuredSectionList *)&v13 collapseGroupForNotificationRequest:v6 withCompletion:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__NCNotificationCombinedSectionList_collapseGroupForNotificationRequest_withCompletion___block_invoke;
  v10[3] = &unk_1E6A94618;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NCNotificationCombinedSectionList *)self _performOperationOnAllSectionLists:v10];
}

uint64_t __88__NCNotificationCombinedSectionList_collapseGroupForNotificationRequest_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 collapseGroupForNotificationRequest:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
}

- (BOOL)containsNotificationRequest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x2020000000;
  unsigned __int8 v15 = 0;
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationCombinedSectionList;
  unsigned __int8 v15 = [(NCNotificationStructuredSectionList *)&v11 containsNotificationRequest:v4];
  if (*((unsigned char *)v13 + 24))
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(NCNotificationCombinedSectionList *)self _allSectionLists];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__NCNotificationCombinedSectionList_containsNotificationRequest___block_invoke;
    v8[3] = &unk_1E6A92850;
    id v9 = v4;
    BOOL v10 = &v12;
    [v6 enumerateObjectsUsingBlock:v8];

    BOOL v5 = *((unsigned char *)v13 + 24) != 0;
  }
  _Block_object_dispose(&v12, 8);

  return v5;
}

uint64_t __65__NCNotificationCombinedSectionList_containsNotificationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 containsNotificationRequest:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(NCNotificationCombinedSectionList *)self orderedNotificationListComponents];
  if ([v7 count] <= a4)
  {
    BOOL v10 = 0;
  }
  else
  {
    id v8 = [v7 objectAtIndex:a4];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v9 = [v8 listView];
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)NCNotificationCombinedSectionList;
      uint64_t v9 = [(NCNotificationStructuredSectionList *)&v12 notificationListView:v6 viewForItemAtIndex:a4];
    }
    BOOL v10 = (void *)v9;
  }

  return v10;
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5
{
  id v8 = a3;
  uint64_t v9 = [(NCNotificationCombinedSectionList *)self orderedNotificationListComponents];
  double v10 = 0.0;
  if ([v9 count] > a4)
  {
    objc_super v11 = [v9 objectAtIndex:a4];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_super v12 = [v11 listView];
      objc_msgSend(v12, "sizeThatFits:", a5, 0.0);
      double v10 = v13;
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)NCNotificationCombinedSectionList;
      [(NCNotificationStructuredSectionList *)&v16 notificationListView:v8 heightForItemAtIndex:a4 withWidth:a5];
      double v10 = v14;
    }
  }
  return v10;
}

- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationCombinedSectionList;
  [(NCNotificationStructuredSectionList *)&v6 notificationListComponent:a3 didRemoveNotificationRequest:a4];
  if (![(NCNotificationCombinedSectionList *)self count])
  {
    BOOL v5 = [(NCNotificationStructuredSectionList *)self listView];
    [v5 reloadHeaderView];
  }
}

- (void)notificationListBaseComponentDidRemoveAll:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationCombinedSectionList;
  [(NCNotificationStructuredSectionList *)&v5 notificationListBaseComponentDidRemoveAll:a3];
  if (![(NCNotificationCombinedSectionList *)self count])
  {
    id v4 = [(NCNotificationStructuredSectionList *)self listView];
    [v4 reloadHeaderView];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationCombinedSectionList;
  [(NCNotificationStructuredSectionList *)&v4 adjustForContentSizeCategoryChange];
  [(NCNotificationCombinedSectionList *)self _performOperationOnAllSectionLists:&__block_literal_global_47];
  return 1;
}

uint64_t __71__NCNotificationCombinedSectionList_adjustForContentSizeCategoryChange__block_invoke(uint64_t a1, void *a2)
{
  return [a2 adjustForContentSizeCategoryChange];
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationCombinedSectionList;
  [(NCNotificationStructuredSectionList *)&v8 adjustForLegibilitySettingsChange:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__NCNotificationCombinedSectionList_adjustForLegibilitySettingsChange___block_invoke;
  v6[3] = &unk_1E6A945A0;
  id v7 = v4;
  id v5 = v4;
  [(NCNotificationCombinedSectionList *)self _performOperationOnAllSectionLists:v6];
}

uint64_t __71__NCNotificationCombinedSectionList_adjustForLegibilitySettingsChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 adjustForLegibilitySettingsChange:*(void *)(a1 + 32)];
}

- (id)orderedNotificationListComponents
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [(NCNotificationStructuredSectionList *)self notificationGroups];
  id v5 = (void *)[v3 initWithArray:v4];

  objc_super v6 = [(NCNotificationCombinedSectionList *)self chronologicalSectionLists];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__NCNotificationCombinedSectionList_orderedNotificationListComponents__block_invoke;
  v12[3] = &unk_1E6A91C70;
  id v13 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v12];

  id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [(NCNotificationCombinedSectionList *)self sectionLists];
  double v10 = (void *)[v8 initWithArray:v9];

  [v10 addObjectsFromArray:v7];

  return v10;
}

void __70__NCNotificationCombinedSectionList_orderedNotificationListComponents__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__NCNotificationCombinedSectionList_orderedNotificationListComponents__block_invoke_2;
  v8[3] = &unk_1E6A94640;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 indexOfObjectPassingTest:v8];
  id v7 = *(void **)(a1 + 32);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    [v7 addObject:v5];
  }
  else {
    objc_msgSend(v7, "insertObject:atIndex:", v5);
  }
}

BOOL __70__NCNotificationCombinedSectionList_orderedNotificationListComponents__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 comparisonDate];
  id v4 = [*(id *)(a1 + 32) comparisonDate];
  BOOL v5 = [v3 compare:v4] == -1;

  return v5;
}

- (void)_performOperationOnAllSectionLists:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    BOOL v5 = [(NCNotificationCombinedSectionList *)self _allSectionLists];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (id)_allSectionLists
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [(NCNotificationCombinedSectionList *)self sectionLists];
  BOOL v5 = (void *)[v3 initWithArray:v4];

  uint64_t v6 = [(NCNotificationCombinedSectionList *)self chronologicalSectionLists];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [(NCNotificationCombinedSectionList *)self chronologicalSectionLists];
    [v5 addObjectsFromArray:v8];
  }

  return v5;
}

- (void)_invalidateSectionListViewForChronologicalSectionsIfNecessary
{
  id v3 = [(NCNotificationCombinedSectionList *)self chronologicalSectionLists];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(NCNotificationStructuredSectionList *)self listView];
    [v5 invalidateData];
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NSMutableArray)sectionLists
{
  return self->_sectionLists;
}

- (void)setSectionLists:(id)a3
{
}

- (NSMutableArray)chronologicalSectionLists
{
  return self->_chronologicalSectionLists;
}

- (void)setChronologicalSectionLists:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chronologicalSectionLists, 0);

  objc_storeStrong((id *)&self->_sectionLists, 0);
}

@end