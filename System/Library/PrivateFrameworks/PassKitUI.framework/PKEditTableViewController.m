@interface PKEditTableViewController
+ (id)_generatePlaceholderImageForStyle:(int64_t)a3;
+ (void)loadPlaceholdersWithCompletion:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NSDictionary)placeholders;
- (NSString)performanceTestName;
- (PKEditTableViewController)initWithStyle:(int64_t)a3 placeholders:(id)a4 isForWatch:(BOOL)a5;
- (PKEditTableViewControllerCachingDelegate)cachingDelegate;
- (PKGroupsController)existingGroupsController;
- (id)_createImageForPass:(id)a3 imageSize:(CGSize)a4 cacheKey:(id)a5 fullPass:(BOOL)a6 stacked:(BOOL)a7;
- (id)_createPassStackWithPassImage:(id)a3 withHeight:(double)a4;
- (id)mostRecentPassInGroup:(id)a3;
- (id)tableView:(id)a3 cellWithIdentifier:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)performanceTest;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)testIteration;
- (unint64_t)_imagesToKeepOutsideVisibleCells;
- (unint64_t)visibleRowsCount;
- (void)_imageOfSize:(CGSize)a3 forPass:(id)a4 fullPass:(BOOL)a5 stacked:(BOOL)a6 synchronously:(BOOL)a7 preemptive:(BOOL)a8 placeholder:(id)a9 completion:(id)a10;
- (void)_placeholderImageForStyle:(int64_t)a3 completion:(id)a4;
- (void)_setShouldProcessLowPriorityRequests:(BOOL)a3;
- (void)_updateShouldProcessHighPriorityRequestsWithFastScrolling:(BOOL)a3;
- (void)beginPassDeletionTestWithTestName:(id)a3;
- (void)beginPassSelectionTestWithTestName:(id)a3;
- (void)beginScrollingTestWithTestName:(id)a3;
- (void)clearImageCacheForPass:(id)a3;
- (void)currentCacheRequestCompletedWithImage:(id)a3 duration:(double)a4;
- (void)failedTestWithReason:(id)a3;
- (void)findApps;
- (void)imageForPass:(id)a3 stacked:(BOOL)a4 synchronously:(BOOL)a5 placeholder:(id)a6 completion:(id)a7;
- (void)loadContentAndImageSetFromExistingPassForPass:(id)a3;
- (void)moveHighPriorityToLowPriorityWithCacheKey:(id)a3;
- (void)passedTest;
- (void)preemptivelyCacheImagesForPass:(id)a3 stacked:(BOOL)a4;
- (void)processCacheRequest:(id)a3;
- (void)removeRequestsWithCacheKey:(id)a3;
- (void)resumeRequestIfNoScrollingAfterTimeInterval:(double)a3;
- (void)scanCode;
- (void)scrollToFirstRowOrFailTest;
- (void)scrollToLastRowOrFailTest;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)selectFirstRowOrFailTest;
- (void)setCachingDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setExistingGroupsController:(id)a3;
- (void)setPerformanceTest:(int64_t)a3;
- (void)setPerformanceTestName:(id)a3;
- (void)setPlaceholders:(id)a3;
- (void)setTestIteration:(int64_t)a3;
- (void)showNoPassesView:(BOOL)a3;
- (void)startedTestWithName:(id)a3;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4;
- (void)triageCacheRequest:(id)a3;
- (void)updateAverageSnapshotDuration:(double)a3;
- (void)viewDidLoad;
@end

@implementation PKEditTableViewController

- (PKEditTableViewController)initWithStyle:(int64_t)a3 placeholders:(id)a4 isForWatch:(BOOL)a5
{
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PKEditTableViewController;
  v9 = [(PKEditTableViewController *)&v29 initWithStyle:a3];
  v10 = v9;
  if (v9)
  {
    v9->_imagesToKeep = 200;
    v11 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    imageCache = v10->_imageCache;
    v10->_imageCache = v11;

    [(NSCache *)v10->_imageCache setCountLimit:v10->_imagesToKeep];
    if (v8) {
      id v13 = (id)[v8 mutableCopy];
    }
    else {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v14 = v13;
    objc_storeStrong((id *)&v10->_placeholdersPerPassStyle, v13);

    v15 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

    if (IsAccessibilityCategory) {
      v10->_isAccessibilityCategory = 1;
    }
    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.passkitui.edit-table-caching", v17);
    queueCaching = v10->_queueCaching;
    v10->_queueCaching = (OS_dispatch_queue *)v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    lowPriorityRequests = v10->_lowPriorityRequests;
    v10->_lowPriorityRequests = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    highPriorityRequests = v10->_highPriorityRequests;
    v10->_highPriorityRequests = v22;

    v10->_shouldProcessLowPriorityRequests = 1;
    v10->_shouldProcessHighPriorityRequests = 1;
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
    lastSnapshotDurations = v10->_lastSnapshotDurations;
    v10->_lastSnapshotDurations = (NSMutableArray *)v24;

    v10->_isForWatch = a5;
    +[PKEditPassesTableViewCell imageSizeNeeded];
    v10->_imageSizeNeeded.width = v26;
    v10->_imageSizeNeeded.height = v27;
    v10->_needsFullPass = +[PKEditPassesTableViewCell needsFullPassImage];
    v10->_performanceTest = 0;
    v10->_testIteration = 0;
    objc_storeWeak((id *)&v10->_cachingDelegate, 0);
  }
  return v10;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PKEditTableViewController;
  [(PKEditTableViewController *)&v10 viewDidLoad];
  v3 = [(PKEditTableViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  +[PKEditPassesTableViewCell height];
  self->_visibleRows = vcvtpd_u64_f64(v5 / v6);

  v7 = [(PKEditTableViewController *)self tableView];
  tableView = self->_tableView;
  self->_tableView = v7;

  [(UITableView *)self->_tableView setPrefetchDataSource:self];
  v9 = self->_tableView;
  +[PKEditPassesTableViewCell height];
  -[UITableView setEstimatedRowHeight:](v9, "setEstimatedRowHeight:");
  [(UITableView *)self->_tableView setRowHeight:*MEMORY[0x1E4FB2F28]];
  [(UITableView *)self->_tableView setAllowsSelection:1];
  [(UITableView *)self->_tableView setAllowsSelectionDuringEditing:1];
  [(UITableView *)self->_tableView setSeparatorStyle:1];
  [(PKEditTableViewController *)self setEditing:1];
}

+ (void)loadPlaceholdersWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (_MergedGlobals_3_9 != -1) {
      dispatch_once(&_MergedGlobals_3_9, &__block_literal_global_171);
    }
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v6 = qword_1E94F5A50;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PKEditTableViewController_loadPlaceholdersWithCompletion___block_invoke_2;
    block[3] = &unk_1E59D6EA8;
    id v11 = a1;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(v6, block);
  }
}

void __60__PKEditTableViewController_loadPlaceholdersWithCompletion___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.passkitui.edit-table-placeholder", v2);
  v1 = (void *)qword_1E94F5A50;
  qword_1E94F5A50 = (uint64_t)v0;
}

void __60__PKEditTableViewController_loadPlaceholdersWithCompletion___block_invoke_2(uint64_t a1)
{
  for (uint64_t i = 0; i != 12; ++i)
  {
    v3 = [*(id *)(a1 + 48) _generatePlaceholderImageForStyle:i];
    id v4 = *(void **)(a1 + 32);
    id v5 = [NSNumber numberWithInteger:i];
    [v4 setObject:v3 forKey:v5];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
}

+ (id)_generatePlaceholderImageForStyle:(int64_t)a3
{
  +[PKEditPassesTableViewCell imageSizeNeeded];
  double v4 = v3;
  double v6 = v5;
  BOOL v7 = +[PKEditPassesTableViewCell needsFullPassImage];
  if (v7) {
    double v8 = v6;
  }
  else {
    double v8 = 1.79769313e308;
  }
  if (v7) {
    double v6 = 1.79769313e308;
  }
  PKPassFrontFaceContentSize();
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = PKPassFaceShadowInsets();
  double v14 = UIEdgeInsetsForPKEdgeInsets(v13);
  double v17 = v10 + v15 + v16;
  v19.n128_f64[0] = v14 + v18;
  double v20 = v12;
  double v21 = v12 + v19.n128_f64[0];
  long double v22 = fmin(v4 / v10, v8 / v20);
  v23.n128_f64[0] = v22 * v17;
  v24.n128_f64[0] = v22 * v21;
  PKSizeCeilToPixel(v23, v24, v19);
  double v62 = v25;
  double v63 = v26;
  double v61 = fmin(v26, v6);
  CGFloat v27 = [MEMORY[0x1E4FB17E0] preferredFormat];
  v28 = (void *)MEMORY[0x1A6224460]();
  long double v29 = log(v22);
  double v30 = exp(v29 * 0.15 + 0.0);
  v31.n128_f64[0] = v17 * v30;
  v32.n128_f64[0] = v21 * v30;
  PKSizeCeilToPixel(v31, v32, v33);
  double v35 = v34;
  double v37 = v36;
  v38 = PKPassGrayPlaceholderImage();
  id v39 = objc_alloc(MEMORY[0x1E4FB17D8]);
  double v40 = *MEMORY[0x1E4F1DAD8];
  double v41 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v42 = objc_msgSend(v39, "initWithBounds:format:", v27, *MEMORY[0x1E4F1DAD8], v41, v35, v37);
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __PKEditPassesResizedPlaceholderImage_block_invoke;
  v68[3] = &unk_1E59DAA88;
  id v69 = v38;
  double v70 = v30;
  double v71 = v17;
  double v72 = v21;
  id v43 = v38;
  v44 = [v42 imageWithActions:v68];

  v45 = (void *)MEMORY[0x1A6224460]();
  v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithBounds:format:", v27, v40, v41, v62, v61);
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __PKEditPassesResizedPlaceholderImage_block_invoke_2;
  v64[3] = &unk_1E59DAAB0;
  id v47 = v44;
  id v65 = v47;
  double v66 = v62;
  double v67 = v63;
  v48 = [v46 imageWithActions:v64];

  PKFloatRoundToPixel();
  double v50 = v49;
  PKFloatRoundToPixel();
  double v52 = v51;
  PKFloatRoundToPixel();
  double v54 = v53;
  PKFloatRoundToPixel();
  double v56 = v63 - v52 - v55;
  double v57 = fmax(v56 - (v63 - v61), 0.0);
  if (v63 <= v61) {
    double v58 = v56;
  }
  else {
    double v58 = v57;
  }
  v59 = objc_msgSend(v48, "imageWithAlignmentRectInsets:", v52, v50, v58, v62 - v50 - v54);

  return v59;
}

- (void)_placeholderImageForStyle:(int64_t)a3 completion:(id)a4
{
  double v11 = (void (**)(id, void *))a4;
  placeholdersPerPassStyle = self->_placeholdersPerPassStyle;
  BOOL v7 = [NSNumber numberWithInteger:a3];
  double v8 = [(NSMutableDictionary *)placeholdersPerPassStyle objectForKey:v7];

  if (!v8)
  {
    double v8 = [(id)objc_opt_class() _generatePlaceholderImageForStyle:a3];
    double v9 = self->_placeholdersPerPassStyle;
    double v10 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v9 setObject:v8 forKey:v10];
  }
  v11[2](v11, v8);
}

- (NSDictionary)placeholders
{
  v2 = (void *)[(NSMutableDictionary *)self->_placeholdersPerPassStyle copy];

  return (NSDictionary *)v2;
}

- (void)setPlaceholders:(id)a3
{
  double v4 = (NSMutableDictionary *)[a3 mutableCopy];
  placeholdersPerPassStyle = self->_placeholdersPerPassStyle;
  self->_placeholdersPerPassStyle = v4;
}

- (unint64_t)visibleRowsCount
{
  return self->_visibleRows;
}

- (void)loadContentAndImageSetFromExistingPassForPass:(id)a3
{
  id v9 = a3;
  if (([v9 isContentLoaded] & 1) == 0)
  {
    double v4 = [(PKEditTableViewController *)self existingGroupsController];
    double v5 = [v9 uniqueID];
    double v6 = [v4 passWithUniqueID:v5];

    if ([v6 isContentLoaded])
    {
      BOOL v7 = [v6 content];
      [v9 setContent:v7];

      if (([v9 isImageSetLoaded:0] & 1) == 0)
      {
        if ([v6 isImageSetLoaded:0])
        {
          double v8 = [v6 imageSetLoadedIfNeeded:0];
          [v9 setImageSet:v8 forImageSetType:0];
        }
      }
    }
  }
}

- (void)imageForPass:(id)a3 stacked:(BOOL)a4 synchronously:(BOOL)a5 placeholder:(id)a6 completion:(id)a7
{
}

- (void)preemptivelyCacheImagesForPass:(id)a3 stacked:(BOOL)a4
{
}

- (void)showNoPassesView:(BOOL)a3
{
  self->_shouldShowNoPassesView = a3;
  noPassesView = self->_noPassesView;
  if (a3)
  {
    if (noPassesView)
    {
      double v5 = *MEMORY[0x1E4F1DB28];
      double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      double v10 = [PKEditTableNoPassesView alloc];
      double v5 = *MEMORY[0x1E4F1DB28];
      double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double v11 = -[PKEditTableNoPassesView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
      double v12 = self->_noPassesView;
      self->_noPassesView = v11;

      [(PKEditTableNoPassesView *)self->_noPassesView setDelegate:self];
      uint64_t v13 = [(PKEditTableViewController *)self view];
      [v13 addSubview:self->_noPassesView];

      double v14 = [(PKEditTableViewController *)self view];
      [v14 bounds];
      double v16 = v15;
      double v18 = v17;

      -[PKEditTableNoPassesView sizeThatFits:](self->_noPassesView, "sizeThatFits:", v16 + -16.0, v18 + -16.0);
      __n128 v19 = self->_noPassesView;
      PKSizeAlignedInRect();
      -[PKEditTableNoPassesView setFrame:](v19, "setFrame:");
      noPassesView = self->_noPassesView;
    }
    [(PKEditTableNoPassesView *)noPassesView setHidden:0];
    tableView = self->_tableView;
    id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v6, v7, v8);
    [(UITableView *)tableView setTableFooterView:v21];
  }
  else
  {
    if (noPassesView) {
      [(PKEditTableNoPassesView *)noPassesView setHidden:1];
    }
    id v9 = self->_tableView;
    [(UITableView *)v9 setTableFooterView:0];
  }
}

- (id)mostRecentPassInGroup:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = [v3 passes];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    double v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v7)
        {
          double v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) ingestedDate];
          double v12 = [v7 ingestedDate];
          uint64_t v13 = [v11 compare:v12];

          if (v13 != -1) {
            continue;
          }
        }
        id v14 = v10;

        double v7 = v14;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (void)_imageOfSize:(CGSize)a3 forPass:(id)a4 fullPass:(BOOL)a5 stacked:(BOOL)a6 synchronously:(BOOL)a7 preemptive:(BOOL)a8 placeholder:(id)a9 completion:(id)a10
{
  BOOL v29 = a8;
  BOOL v11 = a7;
  BOOL v12 = a6;
  BOOL v13 = a5;
  double height = a3.height;
  double width = a3.width;
  v53[1] = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  id v18 = a9;
  id v19 = a10;
  double v20 = [v17 uniqueID];
  if (v12) {
    uint64_t v21 = @"stack_";
  }
  else {
    uint64_t v21 = @"single_";
  }
  long double v22 = [(__CFString *)v21 stringByAppendingString:v20];
  if (!v11)
  {
    uint64_t v23 = [(NSCache *)self->_imageCache objectForKey:v22];
    __n128 v24 = (void *)v23;
    if (v19 && v23)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __115__PKEditTableViewController__imageOfSize_forPass_fullPass_stacked_synchronously_preemptive_placeholder_completion___block_invoke_2;
      block[3] = &unk_1E59CAD68;
      double v34 = (PKEditPendingCacheRequest *)v19;
      id v33 = v24;
      dispatch_async(MEMORY[0x1E4F14428], block);

      double v25 = v34;
    }
    else
    {
      if (v23)
      {
LABEL_19:

        goto LABEL_20;
      }
      if (v18)
      {
        uint64_t v26 = [v17 style];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __115__PKEditTableViewController__imageOfSize_forPass_fullPass_stacked_synchronously_preemptive_placeholder_completion___block_invoke_3;
        v30[3] = &unk_1E59DAA10;
        id v31 = v18;
        [(PKEditTableViewController *)self _placeholderImageForStyle:v26 completion:v30];
      }
      double v25 = objc_alloc_init(PKEditPendingCacheRequest);
      [(PKEditPendingCacheRequest *)v25 setStacked:v12];
      [(PKEditPendingCacheRequest *)v25 setCacheKey:v22];
      [(PKEditPendingCacheRequest *)v25 setPass:v17];
      if (v19)
      {
        v28 = (void *)[v19 copy];
        v53[0] = v28;
        CGFloat v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
        [(PKEditPendingCacheRequest *)v25 setCompletionHandlers:v27];
      }
      else
      {
        [(PKEditPendingCacheRequest *)v25 setCompletionHandlers:MEMORY[0x1E4F1CBF0]];
      }
      -[PKEditPendingCacheRequest setImageSize:](v25, "setImageSize:", width, height);
      [(PKEditPendingCacheRequest *)v25 setFullPass:v13];
      [(PKEditPendingCacheRequest *)v25 setPriority:!v29];
      [(PKEditTableViewController *)self processCacheRequest:v25];
    }

    goto LABEL_19;
  }
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  double v50 = __Block_byref_object_copy__45;
  double v51 = __Block_byref_object_dispose__45;
  id v52 = 0;
  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  double v37 = __115__PKEditTableViewController__imageOfSize_forPass_fullPass_stacked_synchronously_preemptive_placeholder_completion___block_invoke;
  v38 = &unk_1E59DA9E8;
  v42 = &v47;
  id v39 = self;
  id v40 = v17;
  double v43 = width;
  double v44 = height;
  id v41 = v22;
  BOOL v45 = v13;
  BOOL v46 = v12;
  PKTimeToPerformBlock();
  if (v19) {
    (*((void (**)(id, uint64_t))v19 + 2))(v19, v48[5]);
  }

  _Block_object_dispose(&v47, 8);
LABEL_20:
}

void __115__PKEditTableViewController__imageOfSize_forPass_fullPass_stacked_synchronously_preemptive_placeholder_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_createImageForPass:imageSize:cacheKey:fullPass:stacked:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(double *)(a1 + 64), *(double *)(a1 + 72));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __115__PKEditTableViewController__imageOfSize_forPass_fullPass_stacked_synchronously_preemptive_placeholder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0.0);
}

void __115__PKEditTableViewController__imageOfSize_forPass_fullPass_stacked_synchronously_preemptive_placeholder_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __115__PKEditTableViewController__imageOfSize_forPass_fullPass_stacked_synchronously_preemptive_placeholder_completion___block_invoke_4;
  v6[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __115__PKEditTableViewController__imageOfSize_forPass_fullPass_stacked_synchronously_preemptive_placeholder_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)processCacheRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queueCaching = self->_queueCaching;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PKEditTableViewController_processCacheRequest___block_invoke;
  v7[3] = &unk_1E59CB378;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queueCaching, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __49__PKEditTableViewController_processCacheRequest___block_invoke(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_3;
  }
  [WeakRetained triageCacheRequest:*(void *)(a1 + 32)];
  if (*((void *)v3 + 139) || !v3[1120]) {
    goto LABEL_3;
  }
  id v4 = (id *)(v3 + 1128);
  uint64_t v5 = [*((id *)v3 + 141) lastObject];
  if (v5)
  {
    uint64_t v6 = v5;
LABEL_7:
    [*v4 removeLastObject];
    goto LABEL_8;
  }
  if (v3[1136])
  {
    id v4 = (id *)(v3 + 1144);
    uint64_t v6 = [*((id *)v3 + 143) lastObject];
    if (v6) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
LABEL_8:
  id v7 = (void *)*((void *)v3 + 139);
  *((void *)v3 + 139) = v6;

  if (*((void *)v3 + 139))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__PKEditTableViewController_processCacheRequest___block_invoke_2;
    aBlock[3] = &unk_1E59DAA38;
    aBlock[4] = *(void *)(a1 + 40);
    id v8 = (void (**)(void *, void, void *, uint64_t))_Block_copy(aBlock);
    if (v3[1136])
    {
      uint64_t v9 = 1;
    }
    else
    {
      id v10 = (uint64_t *)&framesToSkipForSlowDevices;
      if (*(double *)(*(void *)(a1 + 40) + 1176) <= 0.034) {
        id v10 = (uint64_t *)&framesToSkipForPerformantDevices;
      }
      uint64_t v9 = *v10;
    }
    BOOL v11 = [*((id *)v3 + 139) pass];
    if ([v11 isContentLoaded] && objc_msgSend(v11, "isImageSetLoaded:", 0))
    {
      v8[2](v8, *((void *)v3 + 139), v11, v9);
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __49__PKEditTableViewController_processCacheRequest___block_invoke_5;
      v12[3] = &unk_1E59CD398;
      id v13 = v11;
      double v15 = v8;
      id v14 = v3;
      uint64_t v16 = v9;
      [v13 loadContentAsyncWithCompletion:v12];
    }
  }
LABEL_3:
}

void __49__PKEditTableViewController_processCacheRequest___block_invoke_2(uint64_t a1, void *a2, void *a3, unint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)((double)a4 * 17.0 * 1000000.0));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__PKEditTableViewController_processCacheRequest___block_invoke_3;
  v12[3] = &unk_1E59CB378;
  objc_copyWeak(&v15, &location);
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_after(v9, MEMORY[0x1E4F14428], v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __49__PKEditTableViewController_processCacheRequest___block_invoke_3(id *a1)
{
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(WeakRetained + 152);
    if (v4
      && (objc_opt_respondsToSelector() & 1) != 0
      && ([a1[4] uniqueID],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v4 passExistsWithUniqueIdentifier:v5],
          v5,
          !v6))
    {
      [v3 currentCacheRequestCompletedWithImage:0 duration:0.0];
    }
    else
    {
      uint64_t v9 = 0;
      id v10 = &v9;
      uint64_t v11 = 0x3032000000;
      BOOL v12 = __Block_byref_object_copy__45;
      id v13 = __Block_byref_object_dispose__45;
      id v14 = 0;
      id v7 = v3;
      id v8 = a1[5];
      PKTimeToPerformBlock();
      objc_msgSend(v7, "currentCacheRequestCompletedWithImage:duration:", v10[5]);

      _Block_object_dispose(&v9, 8);
    }
  }
}

void __49__PKEditTableViewController_processCacheRequest___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) pass];
  [*(id *)(a1 + 40) imageSize];
  double v4 = v3;
  double v6 = v5;
  id v7 = [*(id *)(a1 + 40) cacheKey];
  uint64_t v8 = objc_msgSend(v2, "_createImageForPass:imageSize:cacheKey:fullPass:stacked:", v11, v7, objc_msgSend(*(id *)(a1 + 40), "fullPass"), objc_msgSend(*(id *)(a1 + 40), "stacked"), v4, v6);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __49__PKEditTableViewController_processCacheRequest___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PKEditTableViewController_processCacheRequest___block_invoke_6;
  v5[3] = &unk_1E59DAA60;
  id v8 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v9 = v4;
  [v2 loadImageSetAsync:0 preheat:1 withCompletion:v5];
}

uint64_t __49__PKEditTableViewController_processCacheRequest___block_invoke_6(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], *(void *)(a1[4] + 1112), a1[5], a1[7]);
}

- (void)currentCacheRequestCompletedWithImage:(id)a3 duration:(double)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  queueCaching = self->_queueCaching;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PKEditTableViewController_currentCacheRequestCompletedWithImage_duration___block_invoke;
  v9[3] = &unk_1E59CFBA8;
  objc_copyWeak(v11, &location);
  id v10 = v6;
  v11[1] = *(id *)&a4;
  id v8 = v6;
  dispatch_async(queueCaching, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __76__PKEditTableViewController_currentCacheRequestCompletedWithImage_duration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [*((id *)WeakRetained + 139) completionHandlers];
    double v5 = (void *)[v4 copy];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PKEditTableViewController_currentCacheRequestCompletedWithImage_duration___block_invoke_2;
    block[3] = &unk_1E59CC648;
    id v9 = v5;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 48);
    id v6 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
    if (*(void *)(a1 + 32)) {
      [v3 updateAverageSnapshotDuration:*(double *)(a1 + 48)];
    }
    id v7 = (void *)v3[139];
    v3[139] = 0;

    [v3 processCacheRequest:0];
  }
}

void __76__PKEditTableViewController_currentCacheRequestCompletedWithImage_duration___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * v6);
        if (v7) {
          (*(void (**)(uint64_t, void, double))(v7 + 16))(v7, *(void *)(a1 + 40), *(double *)(a1 + 48));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)triageCacheRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v19 = v4;
    uint64_t v5 = [(NSMutableArray *)self->_lowPriorityRequests indexOfObject:v4];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = [(NSMutableArray *)self->_highPriorityRequests indexOfObject:v19];
      uint64_t v7 = [v19 priority];
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v7 == 1)
        {
          highPriorityRequests = self->_highPriorityRequests;
        }
        else
        {
          id v4 = v19;
          if (v7) {
            goto LABEL_15;
          }
          highPriorityRequests = self->_lowPriorityRequests;
        }
        [(NSMutableArray *)highPriorityRequests addObject:v19];
        goto LABEL_14;
      }
      id v4 = v19;
      if (v7 != 1) {
        goto LABEL_15;
      }
      long long v11 = [(NSMutableArray *)self->_highPriorityRequests objectAtIndex:v6];
      [(NSMutableArray *)self->_highPriorityRequests removeObjectAtIndex:v6];
      uint64_t v16 = [v19 completionHandlers];
      id v17 = [v11 completionHandlers];
      id v18 = [v16 arrayByAddingObjectsFromArray:v17];
      [v19 setCompletionHandlers:v18];

      id v15 = self->_highPriorityRequests;
    }
    else
    {
      uint64_t v9 = v5;
      uint64_t v10 = [v19 priority];
      id v4 = v19;
      if (v10 != 1) {
        goto LABEL_15;
      }
      long long v11 = [(NSMutableArray *)self->_lowPriorityRequests objectAtIndex:v9];
      [(NSMutableArray *)self->_lowPriorityRequests removeObjectAtIndex:v9];
      BOOL v12 = [v19 completionHandlers];
      uint64_t v13 = [v11 completionHandlers];
      id v14 = [v12 arrayByAddingObjectsFromArray:v13];
      [v19 setCompletionHandlers:v14];

      id v15 = self->_highPriorityRequests;
    }
    [(NSMutableArray *)v15 addObject:v19];

LABEL_14:
    id v4 = v19;
  }
LABEL_15:
}

- (void)moveHighPriorityToLowPriorityWithCacheKey:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queueCaching = self->_queueCaching;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKEditTableViewController_moveHighPriorityToLowPriorityWithCacheKey___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queueCaching, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __71__PKEditTableViewController_moveHighPriorityToLowPriorityWithCacheKey___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    id v4 = objc_alloc_init(PKEditPendingCacheRequest);
    [(PKEditPendingCacheRequest *)v4 setCacheKey:*(void *)(a1 + 32)];
    uint64_t v5 = [v7[141] indexOfObject:v4];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = [v7[141] objectAtIndex:v5];
      [v7[141] removeObject:v6];
      [v6 setPriority:0];
      [v7[143] addObject:v6];
    }
    uint64_t v3 = v7;
  }
}

- (void)removeRequestsWithCacheKey:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queueCaching = self->_queueCaching;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKEditTableViewController_removeRequestsWithCacheKey___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queueCaching, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__PKEditTableViewController_removeRequestsWithCacheKey___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(PKEditPendingCacheRequest);
    [(PKEditPendingCacheRequest *)v2 setCacheKey:*(void *)(a1 + 32)];
    [WeakRetained[141] removeObject:v2];
    [WeakRetained[143] removeObject:v2];
  }
}

- (void)updateAverageSnapshotDuration:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)[(NSMutableArray *)self->_lastSnapshotDurations count] >= 0xA) {
    [(NSMutableArray *)self->_lastSnapshotDurations removeObjectAtIndex:0];
  }
  lastSnapshotDurations = self->_lastSnapshotDurations;
  id v6 = [NSNumber numberWithDouble:a3];
  [(NSMutableArray *)lastSnapshotDurations addObject:v6];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_lastSnapshotDurations;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "floatValue", (void)v14);
        double v11 = v11 + v13;
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
  }

  self->_snapshotDurationAverage = v11
                                 / (double)(unint64_t)[(NSMutableArray *)self->_lastSnapshotDurations count];
}

- (id)_createImageForPass:(id)a3 imageSize:(CGSize)a4 cacheKey:(id)a5 fullPass:(BOOL)a6 stacked:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a5;
  long long v15 = v14;
  long long v16 = 0;
  if (v13)
  {
    if (v14)
    {
      long long v16 = [(NSCache *)self->_imageCache objectForKey:v14];
      if (!v16)
      {
        long long v17 = [PKPassView alloc];
        if (v8)
        {
          id v18 = [(PKPassView *)v17 initWithPass:v13 content:4 suppressedContent:375];
          [(PKPassView *)v18 setUserInteractionEnabled:0];
          long long v16 = -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v18, "snapshotOfFrontFaceWithRequestedSize:", width, height);
        }
        else
        {
          id v18 = [(PKPassView *)v17 initWithPass:v13 content:4 suppressedContent:4087];
          long long v16 = -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v18, "snapshotOfFrontFaceWithRequestedSize:", width, 3.40282347e38);
          [v16 size];
          if (v19 > height)
          {
            id v20 = v16;
            [v20 alignmentRectInsets];
            double v22 = v21;
            double v24 = v23;
            double v26 = v25;
            double v28 = v27;
            [v20 size];
            double v30 = v29;
            double v32 = v31;
            [v20 scale];
            CGFloat v34 = v30 * v33;
            double v35 = v32 * v33;
            CGFloat v36 = fmin(v32 * v33, height * v33);
            double v37 = fmax(v26 - (v35 - v36), 0.0);
            id v38 = v20;
            id v39 = (CGImage *)[v38 CGImage];
            v49.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
            v49.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
            v49.size.double width = v34;
            v49.size.double height = v36;
            id v40 = CGImageCreateWithImageInRect(v39, v49);
            id v41 = (void *)MEMORY[0x1E4FB1818];
            [v38 scale];
            double v43 = v42;
            uint64_t v44 = [v38 imageOrientation];

            BOOL v45 = [v41 imageWithCGImage:v40 scale:v44 orientation:v43];
            CGImageRelease(v40);
            long long v16 = objc_msgSend(v45, "imageWithAlignmentRectInsets:", fmin(v22, v36), v24, v37, v28);
          }
        }

        if (v7)
        {
          uint64_t v46 = [(PKEditTableViewController *)self _createPassStackWithPassImage:v16 withHeight:height];

          long long v16 = (void *)v46;
        }
        [(NSCache *)self->_imageCache setObject:v16 forKey:v15];
      }
    }
  }

  return v16;
}

- (id)_createPassStackWithPassImage:(id)a3 withHeight:(double)a4
{
  id v5 = a3;
  [v5 alignmentRectInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v5 size];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  double v18 = fmin(v16, a4);
  double v19 = fmin(v7, v18);
  double v20 = fmax(v11 - (v16 - v18) + -4.0, 0.0);
  double v21 = PKUIScreenScale();
  v26.double width = v15;
  v26.double height = v17;
  UIGraphicsBeginImageContextWithOptions(v26, 0, v21);
  objc_msgSend(v5, "drawAtPoint:", 0.0, 0.0);
  objc_msgSend(v5, "drawAtPoint:", 0.0, 2.0);
  objc_msgSend(v5, "drawAtPoint:", 0.0, 4.0);

  double v22 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  double v23 = objc_msgSend(v22, "imageWithAlignmentRectInsets:", v19, v9, v20, v13);

  return v23;
}

- (void)clearImageCacheForPass:(id)a3
{
  if (a3)
  {
    id v6 = [a3 uniqueID];
    id v4 = [v6 stringByAppendingString:@"single_"];
    [(NSCache *)self->_imageCache removeObjectForKey:v4];
    [(PKEditTableViewController *)self removeRequestsWithCacheKey:v4];
    id v5 = [v6 stringByAppendingString:@"stack_"];
    [(NSCache *)self->_imageCache removeObjectForKey:v5];
    [(PKEditTableViewController *)self removeRequestsWithCacheKey:v5];
  }
}

- (unint64_t)_imagesToKeepOutsideVisibleCells
{
  return self->_imagesToKeep;
}

- (void)_setShouldProcessLowPriorityRequests:(BOOL)a3
{
  objc_initWeak(&location, self);
  queueCaching = self->_queueCaching;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PKEditTableViewController__setShouldProcessLowPriorityRequests___block_invoke;
  block[3] = &unk_1E59CB0B0;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_async(queueCaching, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __66__PKEditTableViewController__setShouldProcessLowPriorityRequests___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 != WeakRetained[1136])
    {
      WeakRetained[1136] = v4;
      if (v4)
      {
        WeakRetained[1120] = 1;
        [WeakRetained processCacheRequest:0];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __66__PKEditTableViewController__setShouldProcessLowPriorityRequests___block_invoke_2;
        block[3] = &unk_1E59CA7D0;
        id v6 = v3;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
  }
}

void __66__PKEditTableViewController__setShouldProcessLowPriorityRequests___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1216));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    double v10 = WeakRetained;
    char v4 = objc_opt_respondsToSelector();
    uint64_t v3 = v10;
    if (v4)
    {
      id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "indexPathsForVisibleRows", v10);
      id v6 = [v5 lastObject];

      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      for (unint64_t i = [v6 row] + 1;
            i < [v6 row] + 2 * *(void *)(*(void *)(a1 + 32) + 1152) + 1;
            ++i)
      {
        double v9 = [MEMORY[0x1E4F28D58] indexPathForRow:i inSection:0];
        [v7 addObject:v9];
      }
      [v10 prefetchItemsAtIndexPaths:v7];

      uint64_t v3 = v10;
    }
  }
}

- (void)_updateShouldProcessHighPriorityRequestsWithFastScrolling:(BOOL)a3
{
  objc_initWeak(&location, self);
  queueCaching = self->_queueCaching;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKEditTableViewController__updateShouldProcessHighPriorityRequestsWithFastScrolling___block_invoke;
  block[3] = &unk_1E59CB0B0;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_async(queueCaching, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __87__PKEditTableViewController__updateShouldProcessHighPriorityRequestsWithFastScrolling___block_invoke(uint64_t a1)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      double v3 = WeakRetained[147];
      int v4 = v3 <= 0.034;
      if (*((unsigned __int8 *)WeakRetained + 1120) == v4) {
        goto LABEL_9;
      }
      *((unsigned char *)WeakRetained + 1120) = v4;
      if (v3 > 0.034) {
        goto LABEL_9;
      }
    }
    else
    {
      if (*((unsigned char *)WeakRetained + 1120)) {
        goto LABEL_9;
      }
      *((unsigned char *)WeakRetained + 1120) = 1;
    }
    id v5 = WeakRetained;
    [WeakRetained processCacheRequest:0];
    id WeakRetained = v5;
  }
LABEL_9:
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKEditTableViewController;
  -[PKEditTableViewController setEditing:animated:](&v13, sel_setEditing_animated_);
  id v7 = [(PKEditTableViewController *)self navigationItem];
  BOOL v8 = [v7 leftBarButtonItem];
  if (v5) {
    double v9 = @"PASS_EDITING_CANCEL";
  }
  else {
    double v9 = @"PASS_EDITING_EDIT";
  }
  if (v5) {
    double v10 = @"PASS_EDITING_TITLE_EDITING";
  }
  else {
    double v10 = @"PASS_EDITING_TITLE";
  }
  double v11 = PKLocalizedString(&v9->isa);
  [v8 setTitle:v11];

  double v12 = PKLocalizedString(&v10->isa);
  [(PKEditTableViewController *)self setTitle:v12];

  [(UITableView *)self->_tableView setEditing:v5 animated:v4];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:v6];
  if (!v7)
  {
    if ([v6 isEqualToString:@"cellActionEditIdentifier"])
    {
      id v7 = (PKEditPassesTableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:v6];
      BOOL v8 = [(PKEditPassesTableViewCell *)v7 textLabel];
      double v9 = [MEMORY[0x1E4FB1618] systemBlueColor];
      [v8 setTextColor:v9];
    }
    else
    {
      id v7 = [[PKEditPassesTableViewCell alloc] initWithReuseIdentifier:v6 showImage:!self->_isAccessibilityCategory];
      [(PKEditPassesTableViewCell *)v7 setAccessoryType:1];
      [(PKEditPassesTableViewCell *)v7 setEditingAccessoryType:1];
    }
  }

  return v7;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachingDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained prefetchItemsAtIndexPaths:v6];
  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v22 = a3;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachingDelegate);
  if (!WeakRetained || (objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_14;
  }
  unint64_t v9 = [(PKEditTableViewController *)self _imagesToKeepOutsideVisibleCells];
  uint64_t v10 = [v7 row];
  uint64_t v11 = [v7 section];
  if (!self->_scrollingUp)
  {
    if ([v7 row] >= v9)
    {
      objc_super v13 = (void *)MEMORY[0x1E4F28D58];
      unint64_t v14 = v10 - v9;
      goto LABEL_10;
    }
    if (!self->_scrollingUp) {
      goto LABEL_11;
    }
  }
  unint64_t v12 = v10 + v9;
  if (v12 < [(PKEditTableViewController *)self tableView:v22 numberOfRowsInSection:v11])
  {
    objc_super v13 = (void *)MEMORY[0x1E4F28D58];
    unint64_t v14 = v12;
LABEL_10:
    CGFloat v15 = [v13 indexPathForRow:v14 inSection:v11];
    double v16 = [WeakRetained passAtIndexPath:v15];
    [(PKEditTableViewController *)self clearImageCacheForPass:v16];
  }
LABEL_11:
  CGFloat v17 = [WeakRetained passAtIndexPath:v7];
  double v18 = v17;
  if (v17)
  {
    double v19 = [v17 uniqueID];
    double v20 = [@"stack_" stringByAppendingString:v19];
    [(PKEditTableViewController *)self moveHighPriorityToLowPriorityWithCacheKey:v20];

    double v21 = [@"single_" stringByAppendingString:v19];
    [(PKEditTableViewController *)self moveHighPriorityToLowPriorityWithCacheKey:v21];
  }
LABEL_14:
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  [(PKEditTableViewController *)self _setShouldProcessLowPriorityRequests:0];
  BOOL v5 = [v4 panGestureRecognizer];
  [v5 translationInView:v4];
  double v7 = v6;

  self->_dragging = 1;
  if (v7 == 0.0) {
    [(PKEditTableViewController *)self resumeRequestIfNoScrollingAfterTimeInterval:0.2];
  }
  self->_scrollingUp = v7 > 0.0;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  self->_dragging = 0;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (self->_lastYOffsetTime == 0.0)
  {
    self->_lastYOffsetTime = (double)mach_absolute_time();
    [v12 contentOffset];
    self->_lastYOffset = v5;
  }
  else
  {
    [v4 contentOffset];
    double v7 = v6;
    double v8 = (double)mach_absolute_time();
    PKSecondsFromMachTimeInterval();
    double v10 = fabs((v7 - self->_lastYOffset) / v9);
    BOOL v11 = v10 > 150.0;
    if (self->_scrollingFast != v11)
    {
      self->_scrollingFast = v11;
      [(PKEditTableViewController *)self _updateShouldProcessHighPriorityRequestsWithFastScrolling:v10 > 150.0];
    }
    self->_lastYOffset = v7;
    self->_lastYOffsetTime = v8;
    if (self->_dragging) {
      [(PKEditTableViewController *)self resumeRequestIfNoScrollingAfterTimeInterval:0.2];
    }
  }
}

- (void)resumeRequestIfNoScrollingAfterTimeInterval:(double)a3
{
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__PKEditTableViewController_resumeRequestIfNoScrollingAfterTimeInterval___block_invoke;
  v6[3] = &unk_1E59CB460;
  void v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_after(v5, MEMORY[0x1E4F14428], v6);
}

uint64_t __73__PKEditTableViewController_resumeRequestIfNoScrollingAfterTimeInterval___block_invoke(uint64_t a1)
{
  mach_absolute_time();
  uint64_t result = PKSecondsFromMachTimeInterval();
  if (v3 >= *(double *)(a1 + 40) * 0.5)
  {
    id v4 = *(void **)(a1 + 32);
    return [v4 _setShouldProcessLowPriorityRequests:1];
  }
  return result;
}

- (void)findApps
{
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85C58], 0);
  id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v2 = [MEMORY[0x1E4F1CB10] URLWithString:*MEMORY[0x1E4F874E8]];
  [v3 openURL:v2 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (void)scanCode
{
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85C50], 0);
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v2 = [MEMORY[0x1E4F1CB10] URLWithString:*MEMORY[0x1E4F875D0]];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  if (self->_performanceTest == 2)
  {
    id v6 = v4;
    if (self->_scrollingUp)
    {
      int64_t testIteration = self->_testIteration;
      if (testIteration > 9)
      {
        [(PKEditTableViewController *)self passedTest];
      }
      else
      {
        self->_int64_t testIteration = testIteration + 1;
        [(PKEditTableViewController *)self scrollToLastRowOrFailTest];
      }
    }
    else
    {
      [(PKEditTableViewController *)self scrollToFirstRowOrFailTest];
    }
    id v4 = v6;
  }
}

- (void)setPerformanceTest:(int64_t)a3
{
  self->_performanceTest = a3;
}

- (void)setPerformanceTestName:(id)a3
{
}

- (void)startedTestWithName:(id)a3
{
  objc_storeStrong((id *)&self->_performanceTestName, a3);
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v5 startedTest:v4];
}

- (void)passedTest
{
  id v3 = [(PKEditTableViewController *)self navigationController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__PKEditTableViewController_passedTest__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

void __39__PKEditTableViewController_passedTest__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 finishedTest:*(void *)(*(void *)(a1 + 32) + 1240)];
}

- (void)failedTestWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(PKEditTableViewController *)self navigationController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PKEditTableViewController_failedTestWithReason___block_invoke;
  v7[3] = &unk_1E59CA870;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 dismissViewControllerAnimated:1 completion:v7];
}

void __50__PKEditTableViewController_failedTestWithReason___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 failedTest:*(void *)(*(void *)(a1 + 32) + 1240) withFailure:*(void *)(a1 + 40)];
}

- (void)selectFirstRowOrFailTest
{
  if ([(UITableView *)self->_tableView numberOfRowsInSection:0] < 1)
  {
    [(PKEditTableViewController *)self failedTestWithReason:@"No passes available..."];
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    [(PKEditTableViewController *)self tableView:self->_tableView didSelectRowAtIndexPath:v3];
  }
}

- (void)scrollToFirstRowOrFailTest
{
  if ([(UITableView *)self->_tableView numberOfRowsInSection:0] < 1)
  {
    [(PKEditTableViewController *)self failedTestWithReason:@"No passes available..."];
  }
  else
  {
    self->_scrollingUp = 1;
    tableView = self->_tableView;
    id v4 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    [(UITableView *)tableView scrollToRowAtIndexPath:v4 atScrollPosition:1 animated:1];
  }
}

- (void)scrollToLastRowOrFailTest
{
  uint64_t v3 = [(UITableView *)self->_tableView numberOfRowsInSection:0];
  if (v3 < 1)
  {
    [(PKEditTableViewController *)self failedTestWithReason:@"No passes available..."];
  }
  else
  {
    self->_scrollingUp = 0;
    tableView = self->_tableView;
    id v5 = [MEMORY[0x1E4F28D58] indexPathForRow:v3 - 1 inSection:0];
    [(UITableView *)tableView scrollToRowAtIndexPath:v5 atScrollPosition:3 animated:1];
  }
}

- (void)beginScrollingTestWithTestName:(id)a3
{
  self->_performanceTest = 2;
  [(PKEditTableViewController *)self startedTestWithName:a3];

  [(PKEditTableViewController *)self scrollToLastRowOrFailTest];
}

- (void)beginPassSelectionTestWithTestName:(id)a3
{
  self->_performanceTest = 1;
  [(PKEditTableViewController *)self startedTestWithName:a3];

  [(PKEditTableViewController *)self selectFirstRowOrFailTest];
}

- (void)beginPassDeletionTestWithTestName:(id)a3
{
  self->_performanceTest = 3;
  [(PKEditTableViewController *)self startedTestWithName:a3];

  [(PKEditTableViewController *)self selectFirstRowOrFailTest];
}

- (PKEditTableViewControllerCachingDelegate)cachingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachingDelegate);

  return (PKEditTableViewControllerCachingDelegate *)WeakRetained;
}

- (void)setCachingDelegate:(id)a3
{
}

- (PKGroupsController)existingGroupsController
{
  return self->_existingGroupsController;
}

- (void)setExistingGroupsController:(id)a3
{
}

- (int64_t)performanceTest
{
  return self->_performanceTest;
}

- (NSString)performanceTestName
{
  return self->_performanceTestName;
}

- (int64_t)testIteration
{
  return self->_testIteration;
}

- (void)setTestIteration:(int64_t)a3
{
  self->_int64_t testIteration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceTestName, 0);
  objc_storeStrong((id *)&self->_existingGroupsController, 0);
  objc_destroyWeak((id *)&self->_cachingDelegate);
  objc_storeStrong((id *)&self->_lastSnapshotDurations, 0);
  objc_storeStrong((id *)&self->_placeholdersPerPassStyle, 0);
  objc_storeStrong((id *)&self->_lowPriorityRequests, 0);
  objc_storeStrong((id *)&self->_highPriorityRequests, 0);
  objc_storeStrong((id *)&self->_currentCacheRequest, 0);
  objc_storeStrong((id *)&self->_queuePlaceholder, 0);
  objc_storeStrong((id *)&self->_queueCaching, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_noPassesView, 0);
}

@end