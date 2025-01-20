@interface ICSharedScrollClampingController
- (BOOL)isClamped;
- (BOOL)notificationObjectMatchesTextViewNote:(id)a3;
- (ICSharedScrollClampingController)initWithTextView:(id)a3 listensToMergeNotifications:(BOOL)a4;
- (ICSharedScrollClampingController)initWithTextView:(id)a3 listensToMergeNotifications:(BOOL)a4 clampingTurnOffDelay:(double)a5;
- (ICTextView)textView;
- (double)scrollClampingTopOffsetFactor;
- (double)scrollClampingTopOffsetLineFragmentHeight;
- (double)scrollClampingTurnOffDelay;
- (id)clampedYValue;
- (int64_t)scrollClampingStack;
- (int64_t)scrollClampingTopTextIndex;
- (int64_t)userInitiatedSaveCount;
- (void)clamp;
- (void)contextDidSaveUserInitiatedChange:(id)a3;
- (void)contextWillSaveUserInitiatedChange:(id)a3;
- (void)dealloc;
- (void)mergeRelatedOperationsDidEnd:(id)a3;
- (void)mergeRelatedOperationsWillBegin:(id)a3;
- (void)setScrollClampingStack:(int64_t)a3;
- (void)setScrollClampingTopOffsetFactor:(double)a3;
- (void)setScrollClampingTopOffsetLineFragmentHeight:(double)a3;
- (void)setScrollClampingTopTextIndex:(int64_t)a3;
- (void)setUserInitiatedSaveCount:(int64_t)a3;
- (void)textStorageWillEndEditingNotification:(id)a3;
- (void)topTextIndex:(unint64_t *)a3 topTextOffset:(double *)a4 topTextFragmentHeight:(double *)a5;
- (void)unclamp;
- (void)unclampWithMergeUpdates:(BOOL)a3;
@end

@implementation ICSharedScrollClampingController

- (id)clampedYValue
{
  if ([(ICSharedScrollClampingController *)self scrollClampingTopTextIndex] < 0) {
    goto LABEL_8;
  }
  unint64_t v3 = [(ICSharedScrollClampingController *)self scrollClampingTopTextIndex];
  v4 = [(ICSharedScrollClampingController *)self textView];
  v5 = [v4 textStorage];
  unint64_t v6 = [v5 length];

  if (v3 >= v6) {
    goto LABEL_8;
  }
  int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  v8 = [(ICSharedScrollClampingController *)self textView];
  v9 = v8;
  if (IsTextKit2Enabled)
  {
    v10 = [v8 textLayoutManager];

    v11 = [v10 documentRange];
    v12 = [v11 location];
    v13 = objc_msgSend(v10, "locationFromLocation:withOffset:", v12, -[ICSharedScrollClampingController scrollClampingTopTextIndex](self, "scrollClampingTopTextIndex"));

    v14 = [v10 textLayoutFragmentForLocation:v13];
    [v14 layoutFragmentFrame];
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    v19 = [v8 layoutManager];
    uint64_t v20 = objc_msgSend(v19, "glyphIndexForCharacterAtIndex:", -[ICSharedScrollClampingController scrollClampingTopTextIndex](self, "scrollClampingTopTextIndex"));

    v10 = [(ICSharedScrollClampingController *)self textView];
    v13 = [v10 layoutManager];
    [v13 lineFragmentRectForGlyphAtIndex:v20 effectiveRange:0];
    double v16 = v21;
    double v18 = v22;
  }

  [(ICSharedScrollClampingController *)self scrollClampingTopOffsetLineFragmentHeight];
  if (v18 != v23)
  {
LABEL_8:
    v25 = 0;
  }
  else
  {
    [(ICSharedScrollClampingController *)self scrollClampingTopOffsetFactor];
    v25 = [NSNumber numberWithDouble:v16 + v24 * v18];
  }

  return v25;
}

- (BOOL)isClamped
{
  if ([(ICSharedScrollClampingController *)self scrollClampingTopTextIndex] < 0) {
    return 0;
  }
  unint64_t v3 = [(ICSharedScrollClampingController *)self scrollClampingTopTextIndex];
  v4 = [(ICSharedScrollClampingController *)self textView];
  v5 = [v4 textStorage];
  BOOL v6 = v3 < [v5 length];

  return v6;
}

- (int64_t)scrollClampingTopTextIndex
{
  return self->_scrollClampingTopTextIndex;
}

- (ICSharedScrollClampingController)initWithTextView:(id)a3 listensToMergeNotifications:(BOOL)a4 clampingTurnOffDelay:(double)a5
{
  result = [(ICSharedScrollClampingController *)self initWithTextView:a3 listensToMergeNotifications:a4];
  if (a5 > 0.0 && result != 0) {
    result->_scrollClampingTurnOffDelay = a5;
  }
  return result;
}

- (ICSharedScrollClampingController)initWithTextView:(id)a3 listensToMergeNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICSharedScrollClampingController;
  v7 = [(ICSharedScrollClampingController *)&v15 init];
  v8 = v7;
  if (v7)
  {
    [(ICSharedScrollClampingController *)v7 setScrollClampingTopTextIndex:-1];
    [(ICSharedScrollClampingController *)v8 setScrollClampingTopOffsetFactor:0.0];
    [(ICSharedScrollClampingController *)v8 setScrollClampingTopOffsetLineFragmentHeight:0.0];
    [(ICSharedScrollClampingController *)v8 setScrollClampingStack:0];
    objc_storeWeak((id *)&v8->_textView, v6);
    if (v4)
    {
      v9 = [MEMORY[0x263F08A00] defaultCenter];
      [v9 addObserver:v8 selector:sel_mergeRelatedOperationsWillBegin_ name:*MEMORY[0x263F5AA88] object:0];

      v10 = [MEMORY[0x263F08A00] defaultCenter];
      [v10 addObserver:v8 selector:sel_mergeRelatedOperationsDidEnd_ name:*MEMORY[0x263F5AA80] object:0];

      v11 = [MEMORY[0x263F08A00] defaultCenter];
      [v11 addObserver:v8 selector:sel_contextWillSaveUserInitiatedChange_ name:*MEMORY[0x263F5AA58] object:0];

      v12 = [MEMORY[0x263F08A00] defaultCenter];
      [v12 addObserver:v8 selector:sel_contextDidSaveUserInitiatedChange_ name:*MEMORY[0x263F5AA50] object:0];
    }
    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v8 selector:sel_textStorageWillEndEditingNotification_ name:*MEMORY[0x263F5B1F0] object:0];
  }
  return v8;
}

- (void)setScrollClampingTopTextIndex:(int64_t)a3
{
  self->_scrollClampingTopTextIndex = a3;
}

- (void)setScrollClampingTopOffsetLineFragmentHeight:(double)a3
{
  self->_scrollClampingTopOffsetLineFragmentHeight = a3;
}

- (void)setScrollClampingTopOffsetFactor:(double)a3
{
  self->_scrollClampingTopOffsetFactor = a3;
}

- (void)setScrollClampingStack:(int64_t)a3
{
  self->_scrollClampingStack = a3 & ~(a3 >> 63);
}

- (void)textStorageWillEndEditingNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  performBlockOnMainThread();
}

void __74__ICSharedScrollClampingController_textStorageWillEndEditingNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) object];
  id v3 = [*(id *)(a1 + 40) textView];
  id v4 = [v3 textStorage];

  if (v2 != v4 || [*(id *)(a1 + 40) scrollClampingTopTextIndex] < 1) {
    return;
  }
  id v18 = [*(id *)(a1 + 32) userInfo];
  v5 = [v18 objectForKeyedSubscript:*MEMORY[0x263F5B598]];
  unint64_t v6 = [v5 rangeValue];

  v7 = [v18 objectForKeyedSubscript:*MEMORY[0x263F5B588]];
  uint64_t v8 = [v7 integerValue];

  v9 = [v18 objectForKeyedSubscript:*MEMORY[0x263F5B590]];
  char v10 = [v9 unsignedIntegerValue];

  if ((v10 & 2) != 0 && v6 < [*(id *)(a1 + 40) scrollClampingTopTextIndex])
  {
    objc_msgSend(*(id *)(a1 + 40), "setScrollClampingTopTextIndex:", objc_msgSend(*(id *)(a1 + 40), "scrollClampingTopTextIndex") + v8);
    if (v8 < 1)
    {
      if (v8 < 0 && [*(id *)(a1 + 40) scrollClampingTopTextIndex] < -v8)
      {
        objc_super v15 = (void *)MEMORY[0x263F5AE60];
        double v16 = "self.scrollClampingTopTextIndex >= ({ __typeof__(changeInLength) __a378 = (changeInLength); (__a378 < 0) ?"
              " - __a378 : __a378; })";
        double v17 = @"scroll-clamping text index reduced to negative";
        goto LABEL_9;
      }
    }
    else
    {
      unint64_t v11 = [*(id *)(a1 + 40) scrollClampingTopTextIndex];
      v12 = [*(id *)(a1 + 40) textView];
      v13 = [v12 textStorage];
      unint64_t v14 = [v13 length];

      if (v11 > v14)
      {
        objc_super v15 = (void *)MEMORY[0x263F5AE60];
        double v16 = "self.scrollClampingTopTextIndex <= self.textView.textStorage.length";
        double v17 = @"scroll-clamping text index out of bounds";
LABEL_9:
        [v15 handleFailedAssertWithCondition:v16 functionName:"-[ICSharedScrollClampingController textStorageWillEndEditingNotification:]_block_invoke" simulateCrash:1 showAlert:0 format:v17];
      }
    }
  }
}

- (ICTextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);

  return (ICTextView *)WeakRetained;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICSharedScrollClampingController;
  [(ICSharedScrollClampingController *)&v4 dealloc];
}

- (void)topTextIndex:(unint64_t *)a3 topTextOffset:(double *)a4 topTextFragmentHeight:(double *)a5
{
  v9 = [(ICSharedScrollClampingController *)self textView];
  [v9 visibleTextRect];
  CGFloat v11 = v10;
  double v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v53.origin.x = v11;
  v53.origin.y = v13;
  v53.size.width = v15;
  v53.size.height = v17;
  double MinX = CGRectGetMinX(v53);
  v54.origin.x = v11;
  v54.origin.y = v13;
  v54.size.width = v15;
  v54.size.height = v17;
  double MinY = CGRectGetMinY(v54);
  v55.origin.x = v11;
  v55.origin.y = v13;
  v55.size.width = v15;
  v55.size.height = v17;
  double MaxX = CGRectGetMaxX(v55);
  v56.origin.x = v11;
  v56.origin.y = v13;
  v56.size.width = v15;
  v56.size.height = v17;
  double v21 = CGRectGetMinY(v56);
  double v22 = [(ICSharedScrollClampingController *)self textView];
  objc_msgSend(v22, "closestPositionToPoint:", MinX, MinY);
  id v51 = (id)objc_claimAutoreleasedReturnValue();

  double v23 = [(ICSharedScrollClampingController *)self textView];
  double v24 = objc_msgSend(v23, "closestPositionToPoint:", MaxX, v21);

  v25 = [(ICSharedScrollClampingController *)self textView];
  v26 = [(ICSharedScrollClampingController *)self textView];
  v27 = [v26 beginningOfDocument];
  unint64_t v28 = [v25 offsetFromPosition:v27 toPosition:v51];

  v29 = [(ICSharedScrollClampingController *)self textView];
  v30 = [(ICSharedScrollClampingController *)self textView];
  v31 = [v30 beginningOfDocument];
  unint64_t v32 = [v29 offsetFromPosition:v31 toPosition:v24];

  v33 = [(ICSharedScrollClampingController *)self textView];
  v34 = [v33 textStorage];
  unint64_t v35 = [v34 length];

  if (v28 < v35 && v32 < v35)
  {
    if (v28 >= v32) {
      unint64_t v36 = v32;
    }
    else {
      unint64_t v36 = v28;
    }
    *a3 = v36;
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      unint64_t v37 = *a3;
    }
    else
    {
      v38 = [(ICSharedScrollClampingController *)self textView];
      v39 = [v38 layoutManager];
      unint64_t v37 = [v39 glyphIndexForCharacterAtIndex:*a3];
    }
    char IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    v41 = [(ICSharedScrollClampingController *)self textView];
    v42 = v41;
    if (IsTextKit2Enabled)
    {
      objc_msgSend(v41, "ic_rectForRange:", v37, 0);
      double v44 = v43;
      double v46 = v45;
    }
    else
    {
      v47 = [v41 layoutManager];
      [v47 lineFragmentRectForGlyphAtIndex:v37 effectiveRange:0];
      double v44 = v48;
      double v46 = v49;
    }
    double v50 = 1.0;
    if (v46 >= 1.0) {
      double v50 = v46;
    }
    *a4 = (v13 - v44) / v50;
    *a5 = v46;
  }
}

- (void)mergeRelatedOperationsWillBegin:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 object];

  ICDynamicCast();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  unint64_t v6 = [(ICSharedScrollClampingController *)self textView];
  v7 = [v6 editorController];
  id v8 = [v7 note];

  if (v10 == v8)
  {
    int64_t userInitiatedSaveCount = self->_userInitiatedSaveCount;
    if (userInitiatedSaveCount <= 0)
    {
      if (userInitiatedSaveCount) {
        [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"_userInitiatedSaveCount == 0" functionName:"-[ICSharedScrollClampingController mergeRelatedOperationsWillBegin:]" simulateCrash:1 showAlert:0 format:@"userInitiatedSaveCount should not be negative"];
      }
      [(ICSharedScrollClampingController *)self clamp];
    }
  }
}

- (void)mergeRelatedOperationsDidEnd:(id)a3
{
  id v13 = a3;
  objc_opt_class();
  id v4 = [v13 object];
  v5 = ICDynamicCast();

  unint64_t v6 = [(ICSharedScrollClampingController *)self textView];
  v7 = [v6 editorController];
  id v8 = [v7 note];

  if (v5 == v8)
  {
    objc_opt_class();
    v9 = [v13 userInfo];
    id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F5AA08]];
    CGFloat v11 = ICDynamicCast();

    if (v11) {
      BOOL v12 = [v11 unsignedIntegerValue] == 2;
    }
    else {
      BOOL v12 = 1;
    }
    [(ICSharedScrollClampingController *)self unclampWithMergeUpdates:v12];
  }
}

- (void)contextWillSaveUserInitiatedChange:(id)a3
{
  if ([(ICSharedScrollClampingController *)self notificationObjectMatchesTextViewNote:a3])
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __71__ICSharedScrollClampingController_contextWillSaveUserInitiatedChange___block_invoke;
    v4[3] = &unk_2640B7F90;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x263EF83A0], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __71__ICSharedScrollClampingController_contextWillSaveUserInitiatedChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setUserInitiatedSaveCount:", objc_msgSend(WeakRetained, "userInitiatedSaveCount") + 1);
}

- (void)contextDidSaveUserInitiatedChange:(id)a3
{
  if ([(ICSharedScrollClampingController *)self notificationObjectMatchesTextViewNote:a3])
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __70__ICSharedScrollClampingController_contextDidSaveUserInitiatedChange___block_invoke;
    v4[3] = &unk_2640B7F90;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x263EF83A0], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __70__ICSharedScrollClampingController_contextDidSaveUserInitiatedChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setUserInitiatedSaveCount:", objc_msgSend(WeakRetained, "userInitiatedSaveCount") - 1);
}

- (BOOL)notificationObjectMatchesTextViewNote:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];

  unint64_t v6 = ICCheckedDynamicCast();

  v7 = [(ICSharedScrollClampingController *)self textView];
  id v8 = [v7 editorController];
  v9 = [v8 note];
  id v10 = [v9 objectID];

  LOBYTE(v7) = [v6 isEqual:v10];
  return (char)v7;
}

- (void)clamp
{
  if (![(ICSharedScrollClampingController *)self scrollClampingStack])
  {
    double v4 = 0.0;
    uint64_t v5 = 0;
    double v3 = 0.0;
    [(ICSharedScrollClampingController *)self topTextIndex:&v5 topTextOffset:&v4 topTextFragmentHeight:&v3];
    [(ICSharedScrollClampingController *)self setScrollClampingTopTextIndex:v5];
    [(ICSharedScrollClampingController *)self setScrollClampingTopOffsetFactor:v4];
    [(ICSharedScrollClampingController *)self setScrollClampingTopOffsetLineFragmentHeight:v3];
  }
  [(ICSharedScrollClampingController *)self setScrollClampingStack:[(ICSharedScrollClampingController *)self scrollClampingStack] + 1];
}

- (void)unclamp
{
}

- (void)unclampWithMergeUpdates:(BOOL)a3
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__ICSharedScrollClampingController_unclampWithMergeUpdates___block_invoke;
  aBlock[3] = &unk_2640B8140;
  aBlock[4] = self;
  uint64_t v5 = (void (**)(void))_Block_copy(aBlock);
  [(ICSharedScrollClampingController *)self scrollClampingTurnOffDelay];
  if (v6 > 0.0 && a3)
  {
    [(ICSharedScrollClampingController *)self scrollClampingTurnOffDelay];
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    dispatch_after(v8, MEMORY[0x263EF83A0], v5);
  }
  else
  {
    v5[2](v5);
  }
}

void __60__ICSharedScrollClampingController_unclampWithMergeUpdates___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "setScrollClampingStack:", objc_msgSend(*(id *)(a1 + 32), "scrollClampingStack") - 1);
  if (![*(id *)(a1 + 32) scrollClampingStack])
  {
    [*(id *)(a1 + 32) setScrollClampingTopTextIndex:-1];
    [*(id *)(a1 + 32) setScrollClampingTopOffsetFactor:0.0];
  }
  objc_sync_exit(obj);
}

- (double)scrollClampingTopOffsetFactor
{
  return self->_scrollClampingTopOffsetFactor;
}

- (int64_t)scrollClampingStack
{
  return self->_scrollClampingStack;
}

- (double)scrollClampingTurnOffDelay
{
  return self->_scrollClampingTurnOffDelay;
}

- (double)scrollClampingTopOffsetLineFragmentHeight
{
  return self->_scrollClampingTopOffsetLineFragmentHeight;
}

- (int64_t)userInitiatedSaveCount
{
  return self->_userInitiatedSaveCount;
}

- (void)setUserInitiatedSaveCount:(int64_t)a3
{
  self->_int64_t userInitiatedSaveCount = a3;
}

- (void).cxx_destruct
{
}

@end