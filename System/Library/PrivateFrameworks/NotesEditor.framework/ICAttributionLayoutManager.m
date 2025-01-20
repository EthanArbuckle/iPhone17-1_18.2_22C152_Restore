@interface ICAttributionLayoutManager
+ (OS_dispatch_queue)reloadQueue;
- (ICAttributionLayoutManager)initWithTextView:(id)a3 managedObjectContext:(id)a4 panelWidth:(double)a5 previewPanelWidth:(double)a6;
- (ICBaseTextView)textView;
- (ICTTTextEditFilter)filter;
- (ICTTTextEditGrouper)editGrouper;
- (NSArray)viewConfigurations;
- (NSArray)visibleConfigurations;
- (NSDate)noteLastOpenedDate;
- (NSManagedObjectContext)managedObjectContext;
- (NSNumber)overrideZoomFactor;
- (double)appliedHorizontalAdjustment;
- (double)appliedHorizontalAdjustmentRatio;
- (double)currentTextViewOffset;
- (double)panelWidth;
- (double)preferredHighlightValue;
- (double)previewPanelWidth;
- (double)visiblePanelWidth;
- (id)updatedConfigurationHandler;
- (void)addObservers;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reloadConfigurationsWithCompletion:(id)a3;
- (void)reloadViewConfigurationsSynchronously;
- (void)removeObservers;
- (void)setAppliedHorizontalAdjustment:(double)a3;
- (void)setCurrentTextViewOffset:(double)a3;
- (void)setEditGrouper:(id)a3;
- (void)setFilter:(id)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setOverrideZoomFactor:(id)a3;
- (void)setPanelWidth:(double)a3;
- (void)setPreviewPanelWidth:(double)a3;
- (void)setUpdatedConfigurationHandler:(id)a3;
- (void)setViewConfigurations:(id)a3;
- (void)setVisiblePanelWidth:(double)a3;
- (void)updateViewConfigurationsForTextViewOffset;
@end

@implementation ICAttributionLayoutManager

- (void)setVisiblePanelWidth:(double)a3
{
  if (vabdd_f64(a3, self->_visiblePanelWidth) >= 0.00999999978)
  {
    self->_visiblePanelWidth = a3;
    [(ICAttributionLayoutManager *)self visiblePanelWidth];
    double v6 = v5;
    [(ICAttributionLayoutManager *)self previewPanelWidth];
    double v8 = v6 / v7;
    if (v8 > 1.0) {
      double v8 = 1.0;
    }
    if (v8 < 0.0) {
      double v8 = 0.0;
    }
    self->_preferredHighlightValue = v8;
    v9 = [(ICAttributionLayoutManager *)self textView];
    int v10 = objc_msgSend(v9, "ic_isRTL");
    if (a3 >= 16.0) {
      double v11 = 16.0;
    }
    else {
      double v11 = a3;
    }
    if (v10) {
      double v11 = -v11;
    }
    self->_appliedHorizontalAdjustment = v11;

    self->_appliedHorizontalAdjustmentRatio = self->_appliedHorizontalAdjustment / 16.0;
    [(ICAttributionLayoutManager *)self updateViewConfigurationsForTextViewOffset];
  }
}

- (void)setUpdatedConfigurationHandler:(id)a3
{
}

- (void)setPreviewPanelWidth:(double)a3
{
  self->_previewPanelWidth = a3;
}

- (void)setPanelWidth:(double)a3
{
  self->_panelWidth = a3;
}

- (ICAttributionLayoutManager)initWithTextView:(id)a3 managedObjectContext:(id)a4 panelWidth:(double)a5 previewPanelWidth:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ICAttributionLayoutManager;
  v12 = [(ICAttributionLayoutManager *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_textView, v10);
    objc_storeStrong((id *)&v13->_managedObjectContext, a4);
    v13->_panelWidth = a5;
    v13->_previewPanelWidth = a6;
    viewConfigurations = v13->_viewConfigurations;
    v13->_viewConfigurations = (NSArray *)MEMORY[0x263EFFA68];

    v15 = [v10 editorController];
    v16 = [v15 note];
    uint64_t v17 = [v16 lastOpenedDate];
    noteLastOpenedDate = v13->_noteLastOpenedDate;
    v13->_noteLastOpenedDate = (NSDate *)v17;

    [(ICAttributionLayoutManager *)v13 addObservers];
  }

  return v13;
}

- (void)addObservers
{
  id v3 = [(ICAttributionLayoutManager *)self textView];
  objc_msgSend(v3, "ic_addObserver:forKeyPath:context:", self, @"contentOffset", &compoundliteral_9);
}

- (void)updateViewConfigurationsForTextViewOffset
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9C0] set];
  v4 = [(ICAttributionLayoutManager *)self visibleConfigurations];
  [(ICAttributionLayoutManager *)self currentTextViewOffset];
  double v6 = v5;
  v50 = [v4 firstObject];
  if (v50)
  {
    if ((unint64_t)[v4 count] < 2)
    {
      double v7 = 0;
    }
    else
    {
      double v7 = [v4 objectAtIndexedSubscript:1];
    }
    v47 = v4;
    [v50 adjustedFrame];
    double v9 = v8;
    [v50 associatedTextFrame];
    double v11 = v10;
    double v13 = v12;
    [v50 frame];
    if (v6 >= v14)
    {
      double v15 = v6 + v9;
      if (v15 < v11 + v13)
      {
        if (!v7 || ([v7 frame], v15 < v16))
        {
          [v50 adjustedFrame];
          objc_msgSend(v50, "setAdjustedFrame:");
          [v3 addObject:v50];
        }
      }
    }
    v46 = v7;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = [(ICAttributionLayoutManager *)self viewConfigurations];
    uint64_t v17 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v49 = *(void *)v56;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v56 != v49) {
            objc_enumerationMutation(obj);
          }
          objc_super v20 = *(void **)(*((void *)&v55 + 1) + 8 * v19);
          [(ICAttributionLayoutManager *)self preferredHighlightValue];
          objc_msgSend(v20, "setPreferredHighlightValue:");
          [v20 frame];
          double v22 = v21;
          if ([v20 isEqualToAttributionViewConfiguration:v50]) {
            [v20 adjustedFrame];
          }
          else {
            [v20 frame];
          }
          double v24 = v23;
          [v20 frame];
          double v26 = v25;
          [v20 frame];
          double v28 = v27;
          [(ICAttributionLayoutManager *)self appliedHorizontalAdjustment];
          double v30 = v22 + v29;
          [v20 adjustedFrame];
          if (v30 != v32 || v24 != v31)
          {
            objc_msgSend(v20, "setAdjustedFrame:", v30, v24, v26, v28);
            [(ICAttributionLayoutManager *)self appliedHorizontalAdjustmentRatio];
            objc_msgSend(v20, "setAppliedHorizontalAdjustmentRatio:");
            [v3 addObject:v20];
          }
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          v34 = [v20 highlightConfigurations];
          uint64_t v35 = [v34 countByEnumeratingWithState:&v51 objects:v59 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v52;
            do
            {
              uint64_t v38 = 0;
              do
              {
                if (*(void *)v52 != v37) {
                  objc_enumerationMutation(v34);
                }
                v39 = *(void **)(*((void *)&v51 + 1) + 8 * v38);
                double v40 = 0.0;
                if (([v20 isBlurred] & 1) == 0)
                {
                  [(ICAttributionLayoutManager *)self preferredHighlightValue];
                  double v40 = v41;
                }
                [v39 alpha];
                if (v42 != v40)
                {
                  [v39 setAlpha:v40];
                  [v3 addObject:v20];
                }
                ++v38;
              }
              while (v36 != v38);
              uint64_t v36 = [v34 countByEnumeratingWithState:&v51 objects:v59 count:16];
            }
            while (v36);
          }

          if (([v20 isStatusImageHidden] & 1) == 0) {
            [v3 addObject:v20];
          }
          ++v19;
        }
        while (v19 != v18);
        uint64_t v18 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
      }
      while (v18);
    }

    v4 = v47;
  }
  v43 = [(ICAttributionLayoutManager *)self updatedConfigurationHandler];

  if (v43)
  {
    v44 = [(ICAttributionLayoutManager *)self updatedConfigurationHandler];
    v45 = [v3 allObjects];
    ((void (**)(void, void *))v44)[2](v44, v45);
  }
}

- (id)updatedConfigurationHandler
{
  return self->_updatedConfigurationHandler;
}

- (double)currentTextViewOffset
{
  id v3 = [(ICAttributionLayoutManager *)self textView];
  [v3 contentOffset];
  double v5 = v4;
  double v6 = [(ICAttributionLayoutManager *)self textView];
  double v7 = [v6 editorController];
  objc_msgSend(v7, "ic_safeAreaDistanceFromTop");
  double v9 = v5 + v8 + 0.0;

  return v9;
}

- (ICBaseTextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);

  return (ICBaseTextView *)WeakRetained;
}

- (NSArray)visibleConfigurations
{
  id v3 = [MEMORY[0x263EFF980] array];
  [(ICAttributionLayoutManager *)self currentTextViewOffset];
  uint64_t v5 = v4;
  double v6 = [(ICAttributionLayoutManager *)self viewConfigurations];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__ICAttributionLayoutManager_visibleConfigurations__block_invoke;
  v10[3] = &unk_2640BBC10;
  uint64_t v12 = v5;
  v10[4] = self;
  id v11 = v3;
  id v7 = v3;
  [v6 enumerateObjectsUsingBlock:v10];

  double v8 = (void *)[v7 copy];

  return (NSArray *)v8;
}

- (NSArray)viewConfigurations
{
  return self->_viewConfigurations;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if ([(ICAttributionLayoutManager *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/Common/Author Attributions/Layout/ICAttributionLayoutManager.m"])
  {
    char v13 = [(ICAttributionLayoutManager *)self ic_shouldIgnoreObserveValue:v10 ofObject:v11 forKeyPath:v12];

    if (a6 == &compoundliteral_9 && (v13 & 1) == 0)
    {
      [(ICAttributionLayoutManager *)self updateViewConfigurationsForTextViewOffset];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICAttributionLayoutManager;
    [(ICAttributionLayoutManager *)&v14 observeValueForKeyPath:v12 ofObject:v11 change:v10 context:a6];
  }
}

+ (OS_dispatch_queue)reloadQueue
{
  if (reloadQueue_token != -1) {
    dispatch_once(&reloadQueue_token, &__block_literal_global_31);
  }
  v2 = (void *)reloadQueue_reloadQueue;

  return (OS_dispatch_queue *)v2;
}

void __41__ICAttributionLayoutManager_reloadQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.notes.attribution.layout.manager.reload-queue", attr);
  v2 = (void *)reloadQueue_reloadQueue;
  reloadQueue_reloadQueue = (uint64_t)v1;
}

- (void)dealloc
{
  [(ICAttributionLayoutManager *)self removeObservers];
  v3.receiver = self;
  v3.super_class = (Class)ICAttributionLayoutManager;
  [(ICAttributionLayoutManager *)&v3 dealloc];
}

- (void)reloadViewConfigurationsSynchronously
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  v2 = [(ICAttributionLayoutManager *)self textView];
  objc_super v3 = [v2 editorController];
  uint64_t v4 = [v3 note];
  v69 = [v4 objectID];

  uint64_t v5 = v69;
  if (!v69)
  {
    [(ICAttributionLayoutManager *)self setViewConfigurations:MEMORY[0x263EFFA68]];
    goto LABEL_42;
  }
  uint64_t v107 = 0;
  v108 = &v107;
  uint64_t v109 = 0x3032000000;
  v110 = __Block_byref_object_copy__25;
  v111 = __Block_byref_object_dispose__25;
  id v112 = 0;
  double v6 = [(ICAttributionLayoutManager *)self managedObjectContext];
  v104[0] = MEMORY[0x263EF8330];
  v104[1] = 3221225472;
  v104[2] = __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke;
  v104[3] = &unk_2640BBB78;
  v106 = &v107;
  v104[4] = self;
  id v105 = v69;
  [v6 performBlockAndWait:v104];

  if (!v108[5]) {
    goto LABEL_40;
  }
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x3032000000;
  v101 = __Block_byref_object_copy__25;
  v102 = __Block_byref_object_dispose__25;
  id v103 = 0;
  id v7 = [(ICAttributionLayoutManager *)self managedObjectContext];
  v97[0] = MEMORY[0x263EF8330];
  v97[1] = 3221225472;
  v97[2] = __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke_2;
  v97[3] = &unk_2640BBBA0;
  v97[4] = self;
  v97[5] = &v107;
  v97[6] = &v98;
  [v7 performBlockAndWait:v97];

  double v8 = [ICAttributionViewConfigurationSharedState alloc];
  double v9 = [(ICAttributionLayoutManager *)self textView];
  id v10 = [(ICAttributionViewConfigurationSharedState *)v8 initWithTextView:v9 note:v108[5]];

  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x3032000000;
  v94 = __Block_byref_object_copy__25;
  v95 = __Block_byref_object_dispose__25;
  id v96 = 0;
  uint64_t v84 = MEMORY[0x263EF8330];
  uint64_t v85 = 3221225472;
  v86 = __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke_3;
  v87 = &unk_2640BBBC8;
  v88 = v10;
  v89 = self;
  v90 = &v91;
  performBlockOnMainThreadAndWait();
  [(ICAttributionViewConfigurationSharedState *)v88 synchronouslyLoadDataForEditGroups:v99[5]];
  v73 = v88;
  uint64_t v11 = [MEMORY[0x263EFF980] array];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obj = (id)v99[5];
  uint64_t v12 = [obj countByEnumeratingWithState:&v80 objects:v115 count:16];
  v71 = (void *)v11;
  char v13 = 0;
  if (!v12) {
    goto LABEL_32;
  }
  uint64_t v72 = *(void *)v81;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v81 != v72) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void *)(*((void *)&v80 + 1) + 8 * v14);
      double v16 = [ICAttributionViewConfiguration alloc];
      uint64_t v114 = v15;
      uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v114 count:1];
      uint64_t v18 = [(ICAttributionViewConfiguration *)v16 initWithSharedState:v73 editGroups:v17 parentConfiguration:0];

      uint64_t v19 = objc_msgSend((id)v92[5], "attribute:atIndex:effectiveRange:", *MEMORY[0x263F5AB28], -[ICAttributionViewConfiguration range](v18, "range"), 0);
      objc_super v20 = [v19 uuid];
      if (!v20) {
        goto LABEL_12;
      }
      double v21 = [(id)v92[5] outlineController];
      double v22 = [v19 uuid];
      int v23 = [v21 isUUIDHidden:v22];

      if (v23)
      {
        [(ICAttributionViewConfiguration *)v13 frame];
        -[ICAttributionViewConfiguration setFrame:](v18, "setFrame:");
        char v24 = 1;
        if (!v13) {
          goto LABEL_14;
        }
      }
      else
      {
LABEL_12:
        char v24 = 0;
        if (!v13) {
          goto LABEL_14;
        }
      }
      [(ICAttributionViewConfiguration *)v13 frame];
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      [(ICAttributionViewConfiguration *)v18 frame];
      v119.origin.x = v33;
      v119.origin.y = v34;
      v119.size.width = v35;
      v119.size.height = v36;
      v117.origin.x = v26;
      v117.origin.y = v28;
      v117.size.width = v30;
      v117.size.height = v32;
      CGRect v118 = CGRectIntersection(v117, v119);
      if (CGRectIsNull(v118)) {
        goto LABEL_14;
      }
      [(ICAttributionViewConfiguration *)v13 frame];
      double v39 = v38;
      [(ICAttributionViewConfiguration *)v13 formattedTimestampFrame];
      double v41 = v40;
      [(ICAttributionViewConfiguration *)v13 formattedTimestampFrame];
      double v43 = v42;
      [(ICAttributionViewConfiguration *)v18 frame];
      double v44 = v39 + v41;
      if (v45 > v44)
      {
        [(ICAttributionViewConfiguration *)v18 frame];
        if (v46 < v44 + v43 && ![(ICAttributionViewConfiguration *)v13 isTimestampHidden])
        {
          [(ICAttributionViewConfiguration *)v13 setForcesTimestampHidden:1];
          goto LABEL_14;
        }
      }
      uint64_t v47 = [(ICAttributionViewConfiguration *)v13 range];
      uint64_t v49 = v48;
      if (v47 == [(ICAttributionViewConfiguration *)v18 range] && v49 == v50) {
        char v52 = 1;
      }
      else {
        char v52 = v24;
      }
      [(ICAttributionViewConfiguration *)v13 frame];
      double v54 = v53;
      double v56 = v55;
      [(ICAttributionViewConfiguration *)v18 associatedTextFrame];
      double v58 = v57;
      double v60 = v59;
      [(ICAttributionViewConfiguration *)v18 frame];
      if ((v52 & 1) == 0)
      {
        double v62 = v54 + v56 + v61;
        if (v62 <= v58 + v60)
        {
          [(ICAttributionViewConfiguration *)v18 frame];
          -[ICAttributionViewConfiguration setFrame:](v18, "setFrame:");
LABEL_14:
          [(ICAttributionLayoutManager *)self appliedHorizontalAdjustmentRatio];
          -[ICAttributionViewConfiguration setAppliedHorizontalAdjustmentRatio:](v18, "setAppliedHorizontalAdjustmentRatio:");
          [(ICAttributionLayoutManager *)self preferredHighlightValue];
          -[ICAttributionViewConfiguration setPreferredHighlightValue:](v18, "setPreferredHighlightValue:");
          [v71 addObject:v18];
          uint64_t v37 = v18;

          char v13 = v37;
          goto LABEL_27;
        }
      }
      [(ICAttributionViewConfiguration *)v13 addEditGroup:v15];
LABEL_27:

      ++v14;
    }
    while (v12 != v14);
    uint64_t v63 = [obj countByEnumeratingWithState:&v80 objects:v115 count:16];
    uint64_t v12 = v63;
  }
  while (v63);
LABEL_32:

  [v71 sortUsingComparator:&__block_literal_global_23];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v64 = v71;
  uint64_t v65 = [v64 countByEnumeratingWithState:&v76 objects:v113 count:16];
  if (v65)
  {
    uint64_t v66 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v65; ++i)
      {
        if (*(void *)v77 != v66) {
          objc_enumerationMutation(v64);
        }
        [*(id *)(*((void *)&v76 + 1) + 8 * i) synchronouslyLoadData];
      }
      uint64_t v65 = [v64 countByEnumeratingWithState:&v76 objects:v113 count:16];
    }
    while (v65);
  }

  v68 = (void *)[v64 copy];
  [(ICAttributionLayoutManager *)self setViewConfigurations:v68];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke_5;
  block[3] = &unk_2640B8140;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);

  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v98, 8);

LABEL_40:
  _Block_object_dispose(&v107, 8);

  uint64_t v5 = v69;
LABEL_42:
}

void __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v2 = objc_msgSend(v5, "ic_existingObjectWithID:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) editGrouper];
  if (v2)
  {
    [*(id *)(a1 + 32) setEditGrouper:v2];
  }
  else
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F5AD30]) initWithNote:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [*(id *)(a1 + 32) setEditGrouper:v3];
  }
  uint64_t v4 = [*(id *)(a1 + 32) filter];
  id v5 = v4;
  if (!v4) {
    id v5 = objc_alloc_init(MEMORY[0x263F5AD20]);
  }
  double v6 = [*(id *)(a1 + 32) editGrouper];
  [v6 setFilter:v5];

  if (!v4) {
  id v7 = [*(id *)(a1 + 32) editGrouper];
  }
  double v8 = [v7 filter];
  [v8 setAllowsMissingUsers:0];

  double v9 = [*(id *)(a1 + 32) editGrouper];
  [v9 setIncludesTableEdits:1];

  id v10 = [*(id *)(a1 + 32) editGrouper];
  [v10 setIncludesCheckmarkEdits:1];

  uint64_t v11 = [*(id *)(a1 + 32) editGrouper];
  [v11 setJoinsTextGaps:1];

  uint64_t v12 = [*(id *)(a1 + 32) editGrouper];
  [v12 setJoinsWhitespaceAndNewlineGaps:1];

  id v16 = [*(id *)(a1 + 32) editGrouper];
  uint64_t v13 = [v16 groupedEdits];
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

void __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 40) panelWidth];
  objc_msgSend(*(id *)(a1 + 32), "setPanelWidth:");
  uint64_t v2 = [*(id *)(a1 + 40) textView];
  objc_msgSend(*(id *)(a1 + 32), "setIsRTL:", objc_msgSend(v2, "ic_isRTL"));

  uint64_t v3 = [*(id *)(a1 + 40) noteLastOpenedDate];
  [*(id *)(a1 + 32) setNoteLastOpenedDate:v3];

  [*(id *)(a1 + 32) setTopTextViewInset:7.0];
  objc_opt_class();
  uint64_t v4 = [*(id *)(a1 + 40) textView];
  id v5 = [v4 textLayoutManager];
  double v6 = [v5 textContentManager];
  ICDynamicCast();
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  id v7 = [v11 textStorage];
  uint64_t v8 = ICDynamicCast();
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

uint64_t __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  [a2 frame];
  id v7 = [v4 numberWithDouble:v6];
  uint64_t v8 = NSNumber;
  [v5 frame];
  double v10 = v9;

  id v11 = [v8 numberWithDouble:v10];
  uint64_t v12 = [v7 compare:v11];

  return v12;
}

uint64_t __67__ICAttributionLayoutManager_reloadViewConfigurationsSynchronously__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateViewConfigurationsForTextViewOffset];
}

- (void)reloadConfigurationsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() reloadQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__ICAttributionLayoutManager_reloadConfigurationsWithCompletion___block_invoke;
  v7[3] = &unk_2640BA690;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __65__ICAttributionLayoutManager_reloadConfigurationsWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadViewConfigurationsSynchronously];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) viewConfigurations];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)removeObservers
{
  id v3 = [(ICAttributionLayoutManager *)self textView];
  objc_msgSend(v3, "ic_removeObserver:forKeyPath:context:", self, @"contentOffset", &compoundliteral_9);
}

void __51__ICAttributionLayoutManager_visibleConfigurations__block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  [v17 associatedTextFrame];
  double v4 = v3;
  double v6 = v5;
  double v7 = *(double *)(a1 + 48);
  [v17 frame];
  double v10 = v8 + v9;
  double v11 = *(double *)(a1 + 48);
  uint64_t v12 = [*(id *)(a1 + 32) textView];
  [v12 frame];
  double v14 = v11 + v13;

  double v15 = v4 + v6;
  if (v10 < v14 && v15 > v7) {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v17, v15);
  }
}

- (NSDate)noteLastOpenedDate
{
  return self->_noteLastOpenedDate;
}

- (ICTTTextEditFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (void)setViewConfigurations:(id)a3
{
}

- (double)panelWidth
{
  return self->_panelWidth;
}

- (double)previewPanelWidth
{
  return self->_previewPanelWidth;
}

- (double)visiblePanelWidth
{
  return self->_visiblePanelWidth;
}

- (NSNumber)overrideZoomFactor
{
  return self->_overrideZoomFactor;
}

- (void)setOverrideZoomFactor:(id)a3
{
}

- (double)appliedHorizontalAdjustmentRatio
{
  return self->_appliedHorizontalAdjustmentRatio;
}

- (double)preferredHighlightValue
{
  return self->_preferredHighlightValue;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (ICTTTextEditGrouper)editGrouper
{
  return self->_editGrouper;
}

- (void)setEditGrouper:(id)a3
{
}

- (void)setCurrentTextViewOffset:(double)a3
{
  self->_currentTextViewOffset = a3;
}

- (double)appliedHorizontalAdjustment
{
  return self->_appliedHorizontalAdjustment;
}

- (void)setAppliedHorizontalAdjustment:(double)a3
{
  self->_appliedHorizontalAdjustment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editGrouper, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong(&self->_updatedConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_overrideZoomFactor, 0);
  objc_storeStrong((id *)&self->_viewConfigurations, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_destroyWeak((id *)&self->_textView);

  objc_storeStrong((id *)&self->_noteLastOpenedDate, 0);
}

@end