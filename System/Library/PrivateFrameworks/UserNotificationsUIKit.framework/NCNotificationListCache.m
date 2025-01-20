@interface NCNotificationListCache
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)invalidateCachedHeightIfNecessaryForNotificationRequest:(id)a3 updatedHeight:(double)a4 isContentRevealed:(BOOL)a5;
- (BOOL)recycleNotificationListCell:(id)a3;
- (NCNotificationCellHeightDictionary)cellHeightCache;
- (NCNotificationListCache)init;
- (NCNotificationListCacheDelegate)delegate;
- (NSMutableDictionary)notificationListCellsForRequests;
- (NSMutableSet)notificationListCellCache;
- (NSMutableSet)notificationListCoalescingControlsCache;
- (NSMutableSet)notificationListCoalescingHeaderCache;
- (double)heightForNotificationRequest:(id)a3 withFrameWidth:(double)a4 isContentRevealed:(BOOL)a5 shouldCalculateHeight:(BOOL)a6;
- (id)_cachedHeaderCellWithTitle:(id)a3;
- (id)_cachedNotificationListCellForRequest:(id)a3 viewControllerDelegate:(id)a4 shouldConfigure:(BOOL)a5;
- (id)_cachedRequestMatchingRequest:(id)a3;
- (id)_newCellForNotificationRequest:(id)a3 viewControllerDelegate:(id)a4;
- (id)coalescingControlsCellWithWidth:(double)a3;
- (id)coalescingHeaderCellWithTitle:(id)a3 clearAllText:(id)a4 width:(double)a5;
- (id)contentConfigurationForListCell:(id)a3 isContentRevealed:(BOOL)a4;
- (id)listCellForNotificationRequest:(id)a3 viewControllerDelegate:(id)a4 createNewIfNecessary:(BOOL)a5 shouldConfigure:(BOOL)a6;
- (unint64_t)activeNotificationCellCount;
- (unint64_t)currentCacheSizeCount;
- (void)_clearAllHeightCaches;
- (void)clearCacheForNotificationRequest:(id)a3;
- (void)clearCachedHeightsForNotificationRequest:(id)a3;
- (void)recycleNotificationListCoalescingControlsCell:(id)a3;
- (void)recycleNotificationListCoalescingHeaderCell:(id)a3;
- (void)removeNotificationRequest:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setCellHeightCache:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotificationListCellCache:(id)a3;
- (void)setNotificationListCellsForRequests:(id)a3;
- (void)setNotificationListCoalescingControlsCache:(id)a3;
- (void)setNotificationListCoalescingHeaderCache:(id)a3;
- (void)updateNotificationRequest:(id)a3;
@end

@implementation NCNotificationListCache

- (NCNotificationListCache)init
{
  v14.receiver = self;
  v14.super_class = (Class)NCNotificationListCache;
  v2 = [(NCNotificationListCache *)&v14 init];
  if (v2)
  {
    v3 = objc_alloc_init(NCNotificationCellHeightDictionary);
    cellHeightCache = v2->_cellHeightCache;
    v2->_cellHeightCache = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    notificationListCellCache = v2->_notificationListCellCache;
    v2->_notificationListCellCache = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    notificationListCoalescingHeaderCache = v2->_notificationListCoalescingHeaderCache;
    v2->_notificationListCoalescingHeaderCache = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    notificationListCoalescingControlsCache = v2->_notificationListCoalescingControlsCache;
    v2->_notificationListCoalescingControlsCache = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    notificationListCellsForRequests = v2->_notificationListCellsForRequests;
    v2->_notificationListCellsForRequests = v11;
  }
  return v2;
}

- (void)clearCacheForNotificationRequest:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(NCNotificationListCache *)self clearCachedHeightsForNotificationRequest:v4];
    id v5 = [(NCNotificationListCache *)self notificationListCellsForRequests];
    [v5 removeObjectForKey:v4];
  }
}

- (void)clearCachedHeightsForNotificationRequest:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(NCNotificationListCache *)self cellHeightCache];
    [v5 removeAllHeightsForRequest:v4];
  }
}

- (void)removeNotificationRequest:(id)a3
{
  id v4 = [(NCNotificationListCache *)self _cachedRequestMatchingRequest:a3];
  if (v4)
  {
    v8 = v4;
    [(NCNotificationListCache *)self clearCacheForNotificationRequest:v4];
    id v5 = [(NCNotificationListCache *)self notificationListCellsForRequests];
    v6 = [v5 objectForKey:v8];

    v7 = [(NCNotificationListCache *)self notificationListCellsForRequests];
    [v7 removeObjectForKey:v8];

    [(NCNotificationListCache *)self recycleNotificationListCell:v6];
    id v4 = v8;
  }
}

- (void)updateNotificationRequest:(id)a3
{
  id v9 = a3;
  id v4 = -[NCNotificationListCache _cachedRequestMatchingRequest:](self, "_cachedRequestMatchingRequest:");
  if (v4)
  {
    id v5 = [(NCNotificationListCache *)self notificationListCellsForRequests];
    v6 = [v5 objectForKey:v4];

    [(NCNotificationListCache *)self clearCachedHeightsForNotificationRequest:v4];
    v7 = [(NCNotificationListCache *)self notificationListCellsForRequests];
    [v7 removeObjectForKey:v4];

    v8 = [(NCNotificationListCache *)self notificationListCellsForRequests];
    [v8 setObject:v6 forKey:v9];
  }
}

- (id)contentConfigurationForListCell:(id)a3 isContentRevealed:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [v5 notificationViewController];
  v7 = objc_opt_new();
  [v7 setRevealed:v4];
  objc_msgSend(v7, "setHighlighted:", objc_msgSend(v6, "isHighlighted"));
  uint64_t v8 = [v5 hideDate];

  [v7 setDateHidden:v8];
  [v7 setSummarizationType:0];
  if ([v6 hasContentSummary])
  {
    if ([v6 hasThreadSummary]) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
    [v7 setSummarizationType:v9];
  }

  return v7;
}

- (double)heightForNotificationRequest:(id)a3 withFrameWidth:(double)a4 isContentRevealed:(BOOL)a5 shouldCalculateHeight:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = [(NCNotificationListCache *)self listCellForNotificationRequest:v10 viewControllerDelegate:0 createNewIfNecessary:0 shouldConfigure:0];
  v12 = [v11 notificationViewController];
  if (([v12 hasContentProvider] & 1) == 0) {
    [v12 _setupStaticContentProvider];
  }
  v13 = [(NCNotificationListCache *)self contentConfigurationForListCell:v11 isContentRevealed:v7];
  objc_super v14 = [(NCNotificationListCache *)self cellHeightCache];
  v15 = [v14 heightForRequest:v10 withContentConfiguration:v13];

  if (!v15)
  {
    v15 = &unk_1F2F846F8;
    if (v11)
    {
      if (v6)
      {
        if (v12)
        {
          v19 = [v12 notificationRequest];
          int v20 = [v19 matchesRequest:v10];

          v15 = &unk_1F2F846F8;
          if (a4 > 0.0)
          {
            if (v20)
            {
              [v12 setHasUpdatedContent];
              [v12 updateContent];
              objc_msgSend(v11, "sizeThatFits:", a4, 1.79769313e308);
              double v22 = v21;
              v23 = (void *)*MEMORY[0x1E4FB3778];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEBUG))
              {
                v25 = v23;
                v26 = [v10 notificationIdentifier];
                v27 = objc_msgSend(v26, "un_logDigest");
                int v28 = 134218754;
                double v29 = v22;
                __int16 v30 = 2114;
                v31 = v27;
                __int16 v32 = 2048;
                double v33 = a4;
                __int16 v34 = 2112;
                v35 = v13;
                _os_log_debug_impl(&dword_1D7C04000, v25, OS_LOG_TYPE_DEBUG, "Notification list setting cached height=%.2f for request %{public}@ with width=%.2f [cellContentConfiguration=%@]", (uint8_t *)&v28, 0x2Au);
              }
              v15 = [NSNumber numberWithDouble:v22];
              v24 = [(NCNotificationListCache *)self cellHeightCache];
              [v24 setHeight:v10 forRequest:v13 withContentConfiguration:v22];
            }
          }
        }
      }
    }
  }
  [v15 floatValue];
  float v17 = v16;

  return v17;
}

- (BOOL)invalidateCachedHeightIfNecessaryForNotificationRequest:(id)a3 updatedHeight:(double)a4 isContentRevealed:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(NCNotificationListCache *)self listCellForNotificationRequest:v8 viewControllerDelegate:0 createNewIfNecessary:0 shouldConfigure:0];
  id v10 = [(NCNotificationListCache *)self contentConfigurationForListCell:v9 isContentRevealed:v5];
  v11 = [(NCNotificationListCache *)self cellHeightCache];
  v12 = [v11 heightForRequest:v8 withContentConfiguration:v10];

  if (v12 && ([v12 floatValue], (BSFloatApproximatelyEqualToFloat() & 1) == 0))
  {
    objc_super v14 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEBUG))
    {
      int v20 = v14;
      double v21 = [v8 notificationIdentifier];
      double v22 = objc_msgSend(v21, "un_logDigest");
      [v12 floatValue];
      int v24 = 138544130;
      v25 = v22;
      __int16 v26 = 2048;
      double v27 = v23;
      __int16 v28 = 2048;
      double v29 = a4;
      __int16 v30 = 2112;
      v31 = v10;
      _os_log_debug_impl(&dword_1D7C04000, v20, OS_LOG_TYPE_DEBUG, "Notification list invalidating cached height for request %{public}@ [cachedHeight=%.2f, updatedHeight=%.2f, cellContentConfiguration=%@]", (uint8_t *)&v24, 0x2Au);
    }
    v15 = [v9 notificationViewController];
    int v16 = [v15 hasContentProvider];

    float v17 = [(NCNotificationListCache *)self cellHeightCache];
    v18 = v17;
    if (v16) {
      [v17 removeHeightForContentConfiguration:v10 forRequest:v8];
    }
    else {
      [v17 removeAllHeightsForRequest:v8];
    }

    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)listCellForNotificationRequest:(id)a3 viewControllerDelegate:(id)a4 createNewIfNecessary:(BOOL)a5 shouldConfigure:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = [(NCNotificationListCache *)self notificationListCellsForRequests];
  id v13 = [v12 objectForKey:v10];

  if (!v13 && v7)
  {
    id v13 = [(NCNotificationListCache *)self _cachedNotificationListCellForRequest:v10 viewControllerDelegate:v11 shouldConfigure:v6];
    if (!v13) {
      id v13 = [(NCNotificationListCache *)self _newCellForNotificationRequest:v10 viewControllerDelegate:v11];
    }
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v17[0] = *MEMORY[0x1E4F1DAB8];
    v17[1] = v14;
    v17[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v13 setTransform:v17];
    [v13 setAlpha:1.0];
    v15 = [(NCNotificationListCache *)self notificationListCellsForRequests];
    [v15 setObject:v13 forKey:v10];
  }

  return v13;
}

- (BOOL)recycleNotificationListCell:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  float v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__12;
  __int16 v26 = __Block_byref_object_dispose__12;
  id v27 = 0;
  BOOL v5 = [(NCNotificationListCache *)self notificationListCellsForRequests];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __55__NCNotificationListCache_recycleNotificationListCell___block_invoke;
  v19 = &unk_1E6A94748;
  id v6 = v4;
  id v20 = v6;
  double v21 = &v22;
  [v5 enumerateKeysAndObjectsUsingBlock:&v16];

  if (v23[5])
  {
    BOOL v7 = [(NCNotificationListCache *)self notificationListCellsForRequests];
    [v7 removeObjectForKey:v23[5]];
  }
  id v8 = [(NCNotificationListCache *)self notificationListCellCache];
  unint64_t v9 = [v8 count];
  if (v6) {
    BOOL v10 = v9 >= 0x14;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = !v10;

  if (v11)
  {
    [v6 hideActionButtonsAnimated:0 fastAnimation:0 completion:0];
    v12 = [v6 notificationViewController];
    [v12 setNotificationContentViewHidden:0];

    id v13 = [v6 notificationViewController];
    [v13 _setNotificationRequest:0];

    long long v14 = [(NCNotificationListCache *)self notificationListCellCache];
    [v14 addObject:v6];
  }
  _Block_object_dispose(&v22, 8);

  return v11;
}

void __55__NCNotificationListCache_recycleNotificationListCell___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

- (id)coalescingHeaderCellWithTitle:(id)a3 clearAllText:(id)a4 width:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = [(NCNotificationListCache *)self _cachedHeaderCellWithTitle:v9];
  if (!v10)
  {
    BOOL v11 = [NCNotificationListCoalescingHeaderCell alloc];
    BOOL v10 = -[NCNotificationListCoalescingHeaderCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  +[NCNotificationListCoalescingHeaderCell coalescingHeaderCellHeightForWidth:v9 title:a5];
  -[NCNotificationListCoalescingHeaderCell setFrame:](v10, "setFrame:", 0.0, 0.0, a5, v12);
  [(NCNotificationListCoalescingHeaderCell *)v10 setTitle:v9];

  [(NCNotificationListCoalescingHeaderCell *)v10 setClearAllText:v8];
  [(NCNotificationListCoalescingHeaderCell *)v10 resetClearButtonStateAnimated:0];
  [(NCNotificationListCoalescingHeaderCell *)v10 setAdjustsFontForContentSizeCategory:1];
  [(NCNotificationListCoalescingHeaderCell *)v10 setNeedsLayout];

  return v10;
}

- (void)recycleNotificationListCoalescingHeaderCell:(id)a3
{
  id v7 = a3;
  id v4 = [(NCNotificationListCache *)self notificationListCoalescingHeaderCache];
  unint64_t v5 = [v4 count];

  if (v5 <= 0x13)
  {
    id v6 = [(NCNotificationListCache *)self notificationListCoalescingHeaderCache];
    [v6 addObject:v7];
  }
}

- (id)coalescingControlsCellWithWidth:(double)a3
{
  unint64_t v5 = [(NCNotificationListCache *)self notificationListCoalescingControlsCache];
  id v6 = [v5 anyObject];

  if (v6)
  {
    id v7 = [(NCNotificationListCache *)self notificationListCoalescingControlsCache];
    [v7 removeObject:v6];
  }
  else
  {
    id v8 = [NCNotificationListCoalescingControlsCell alloc];
    id v6 = -[NCNotificationListCoalescingControlsCell initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  +[NCNotificationListCoalescingControlsCell coalescingControlsCellHeightShowingCoalescingControls:1];
  -[NCNotificationListCoalescingControlsCell setFrame:](v6, "setFrame:", 0.0, 0.0, a3, v9);
  [(NCNotificationListCoalescingControlsCell *)v6 setAdjustsFontForContentSizeCategory:1];

  return v6;
}

- (void)recycleNotificationListCoalescingControlsCell:(id)a3
{
  id v7 = a3;
  id v4 = [(NCNotificationListCache *)self notificationListCoalescingControlsCache];
  unint64_t v5 = [v4 count];

  if (v5 <= 0x13)
  {
    id v6 = [(NCNotificationListCache *)self notificationListCoalescingControlsCache];
    [v6 addObject:v7];
  }
}

- (unint64_t)currentCacheSizeCount
{
  return [(NSMutableSet *)self->_notificationListCellCache count];
}

- (unint64_t)activeNotificationCellCount
{
  return [(NSMutableDictionary *)self->_notificationListCellsForRequests count];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  [(NCNotificationListCache *)self _clearAllHeightCaches];
  v3 = [(NCNotificationListCache *)self notificationListCellsForRequests];
  id v4 = [v3 allValues];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_35];

  unint64_t v5 = [(NCNotificationListCache *)self notificationListCellCache];
  [v5 enumerateObjectsUsingBlock:&__block_literal_global_86];

  id v6 = [(NCNotificationListCache *)self notificationListCoalescingHeaderCache];
  [v6 enumerateObjectsUsingBlock:&__block_literal_global_89];

  id v7 = [(NCNotificationListCache *)self notificationListCoalescingControlsCache];
  [v7 enumerateObjectsUsingBlock:&__block_literal_global_92];

  return 1;
}

void __61__NCNotificationListCache_adjustForContentSizeCategoryChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 notificationViewController];
  [v2 adjustForContentSizeCategoryChange];
}

void __61__NCNotificationListCache_adjustForContentSizeCategoryChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 notificationViewController];
  [v2 adjustForContentSizeCategoryChange];
}

uint64_t __61__NCNotificationListCache_adjustForContentSizeCategoryChange__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 adjustForContentSizeCategoryChange];
}

uint64_t __61__NCNotificationListCache_adjustForContentSizeCategoryChange__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 adjustForContentSizeCategoryChange];
}

- (id)_newCellForNotificationRequest:(id)a3 viewControllerDelegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (objc_class *)objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [WeakRetained notificationListCacheNotificationViewControllerClass:self];
    if (v10) {
      id v8 = (objc_class *)v10;
    }
  }
  BOOL v11 = (void *)[[v8 alloc] initWithNotificationRequest:v7];

  [v11 setDelegate:v6];
  double v12 = [NCNotificationListCell alloc];
  id v13 = -[NCNotificationListCell initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(NCNotificationListCell *)v13 setContentViewController:v11];
  [v11 setAssociatedView:v13];

  return v13;
}

- (id)_cachedHeaderCellWithTitle:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NCNotificationListCache *)self notificationListCoalescingHeaderCache];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [(NCNotificationListCache *)self notificationListCoalescingHeaderCache];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__NCNotificationListCache__cachedHeaderCellWithTitle___block_invoke;
    v14[3] = &unk_1E6A947F0;
    id v15 = v4;
    id v8 = [v7 objectsPassingTest:v14];
    double v9 = [v8 anyObject];

    if (!v9)
    {
      uint64_t v10 = [(NCNotificationListCache *)self notificationListCoalescingHeaderCache];
      double v9 = [v10 anyObject];

      BOOL v11 = [(NCNotificationListCache *)self notificationListCoalescingHeaderCache];
      [v11 removeObject:v9];
    }
    double v12 = [(NCNotificationListCache *)self notificationListCoalescingHeaderCache];
    [v12 removeObject:v9];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

uint64_t __54__NCNotificationListCache__cachedHeaderCellWithTitle___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 title];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_cachedNotificationListCellForRequest:(id)a3 viewControllerDelegate:(id)a4 shouldConfigure:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(NCNotificationListCache *)self notificationListCellCache];
  id v11 = (id)[v10 count];

  if (v11)
  {
    double v12 = [(NCNotificationListCache *)self notificationListCellCache];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __104__NCNotificationListCache__cachedNotificationListCellForRequest_viewControllerDelegate_shouldConfigure___block_invoke;
    v33[3] = &unk_1E6A94818;
    id v13 = v8;
    id v34 = v13;
    long long v14 = [v12 objectsPassingTest:v33];
    id v11 = [v14 anyObject];

    if (v11)
    {
      id v15 = [(NCNotificationListCache *)self notificationListCellCache];
      [v15 removeObject:v11];

      uint64_t v16 = [v11 notificationViewController];
      uint64_t v17 = v16;
      if (v5)
      {
        id v18 = [v16 delegate];

        if (v18 == v9) {
          [v17 invalidateContentProviders];
        }
        else {
          [v17 setDelegate:v9];
        }
      }
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v17 = [(NCNotificationListCache *)self notificationListCellCache];
      id v11 = (id)[v17 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v11)
      {
        id v27 = v13;
        BOOL v28 = v5;
        uint64_t v19 = *(void *)v30;
LABEL_8:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v17);
          }
          double v21 = *(void **)(*((void *)&v29 + 1) + 8 * v20);
          uint64_t v22 = objc_msgSend(v21, "notificationViewController", v27);
          int v23 = [v22 hasCommittedToPresentingCustomContentProvidingViewController];

          if (!v23) {
            break;
          }
          if (v11 == (id)++v20)
          {
            id v11 = (id)[v17 countByEnumeratingWithState:&v29 objects:v35 count:16];
            if (v11) {
              goto LABEL_8;
            }
            goto LABEL_20;
          }
        }
        id v11 = v21;

        if (!v11) {
          goto LABEL_21;
        }
        uint64_t v24 = [(NCNotificationListCache *)self notificationListCellCache];
        [v24 removeObject:v11];

        v25 = [v11 notificationViewController];
        uint64_t v17 = v25;
        if (v28)
        {
          [v25 setDelegate:v9];
          [v17 setNotificationContentViewHidden:0];
          [v17 setNotificationRequest:v27];
        }
        else
        {
          [v25 setNotificationContentViewHidden:1];
        }
      }
    }
LABEL_20:

LABEL_21:
  }

  return v11;
}

BOOL __104__NCNotificationListCache__cachedNotificationListCellForRequest_viewControllerDelegate_shouldConfigure___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 notificationViewController];
  uint64_t v4 = [v3 notificationRequest];
  BOOL v5 = v4 == *(void **)(a1 + 32);

  return v5;
}

- (void)_clearAllHeightCaches
{
  id v3 = [(NCNotificationListCache *)self cellHeightCache];
  id v2 = [v3 cellHeightDictionary];
  [v2 removeAllObjects];
}

- (id)_cachedRequestMatchingRequest:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__12;
  uint64_t v17 = __Block_byref_object_dispose__12;
  id v18 = 0;
  BOOL v5 = [(NCNotificationListCache *)self notificationListCellsForRequests];
  uint64_t v6 = [v5 allKeys];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__NCNotificationListCache__cachedRequestMatchingRequest___block_invoke;
  v10[3] = &unk_1E6A94840;
  id v7 = v4;
  id v11 = v7;
  double v12 = &v13;
  [v6 enumerateObjectsUsingBlock:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __57__NCNotificationListCache__cachedRequestMatchingRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 matchesRequest:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
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

- (NCNotificationListCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationListCacheDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NCNotificationCellHeightDictionary)cellHeightCache
{
  return self->_cellHeightCache;
}

- (void)setCellHeightCache:(id)a3
{
}

- (NSMutableSet)notificationListCellCache
{
  return self->_notificationListCellCache;
}

- (void)setNotificationListCellCache:(id)a3
{
}

- (NSMutableSet)notificationListCoalescingHeaderCache
{
  return self->_notificationListCoalescingHeaderCache;
}

- (void)setNotificationListCoalescingHeaderCache:(id)a3
{
}

- (NSMutableSet)notificationListCoalescingControlsCache
{
  return self->_notificationListCoalescingControlsCache;
}

- (void)setNotificationListCoalescingControlsCache:(id)a3
{
}

- (NSMutableDictionary)notificationListCellsForRequests
{
  return self->_notificationListCellsForRequests;
}

- (void)setNotificationListCellsForRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationListCellsForRequests, 0);
  objc_storeStrong((id *)&self->_notificationListCoalescingControlsCache, 0);
  objc_storeStrong((id *)&self->_notificationListCoalescingHeaderCache, 0);
  objc_storeStrong((id *)&self->_notificationListCellCache, 0);
  objc_storeStrong((id *)&self->_cellHeightCache, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end