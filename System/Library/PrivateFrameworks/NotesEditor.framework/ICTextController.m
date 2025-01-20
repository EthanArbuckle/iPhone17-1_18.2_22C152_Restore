@interface ICTextController
@end

@implementation ICTextController

void __129__ICTextController_ICChecklistSortAnimation__performAnimatedSortForTrackedParagraphs_expandedRange_textView_sortChecklistsBlock___block_invoke(double *a1, void *a2)
{
  v3 = (void *)*((void *)a1 + 4);
  uint64_t v4 = *((void *)a1 + 5);
  uint64_t v5 = *((void *)a1 + 7);
  uint64_t v6 = *((void *)a1 + 8);
  double v7 = a1[9];
  double v8 = a1[10];
  double v9 = a1[11];
  double v10 = a1[12];
  id v11 = a2;
  objc_msgSend(v3, "imageInfoForTrackedParagraph:textView:characterRangeToRender:visibleRectToRender:", v11, v4, v5, v6, v7, v8, v9, v10);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)*((void *)a1 + 6);
  v13 = [v11 paragraph];

  v14 = [v13 todo];
  v15 = [v14 uuid];
  v16 = [v15 UUIDString];
  objc_msgSend(v12, "ic_addKey:forNonNilObject:", v16, v17);
}

void __129__ICTextController_ICChecklistSortAnimation__performAnimatedSortForTrackedParagraphs_expandedRange_textView_sortChecklistsBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 paragraph];
  uint64_t v5 = [v4 todo];
  uint64_t v6 = [v5 uuid];
  id v13 = [v6 UUIDString];

  double v7 = [*(id *)(a1 + 32) trackedToDoParagraphs];
  double v8 = [v3 paragraph];

  double v9 = [v8 todo];
  double v10 = [v9 uuid];
  id v11 = [v7 objectForKeyedSubscript:v10];

  v12 = objc_msgSend(*(id *)(a1 + 32), "imageInfoForTrackedParagraph:textView:characterRangeToRender:visibleRectToRender:", v11, *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 48), "ic_addKey:forNonNilObject:", v13, v12);
}

uint64_t __129__ICTextController_ICChecklistSortAnimation__performAnimatedSortForTrackedParagraphs_expandedRange_textView_sortChecklistsBlock___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFinalFramesForSortedInfos:textView:textContainerOrigin:todoUUIDsToImageViews:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __129__ICTextController_ICChecklistSortAnimation__performAnimatedSortForTrackedParagraphs_expandedRange_textView_sortChecklistsBlock___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) clearAllTodoSupplementalViews];
  [*(id *)(a1 + 32) cleanupStaleTodoButtons];
  [*(id *)(a1 + 32) updateVisibleSupplementalViews];
  [*(id *)(a1 + 40) removeFromSuperview];
  v2 = [*(id *)(a1 + 48) allValues];
  [v2 makeObjectsPerformSelector:sel_removeFromSuperview];

  id v3 = *(void **)(a1 + 56);

  return [v3 unclampTextView];
}

void __147__ICTextController_ICChecklistSortAnimation__addImageViewsBeforeSortIfNecessaryForTrackedInfos_textView_textContainerOrigin_todoUUIDsToImageViews___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (([v5 estimated] & 1) == 0)
  {
    id v6 = objc_alloc(MEMORY[0x263F82828]);
    [v5 rect];
    double v7 = objc_msgSend(v6, "initWithFrame:");
    double v8 = [v5 image];
    [v7 setImage:v8];

    [v5 rect];
    TSDAddPoints();
    objc_msgSend(v7, "setFrameOrigin:");
    [*(id *)(a1 + 32) addSubview:v7];
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v9];
  }
}

void __160__ICTextController_ICChecklistSortAnimation__addImageViewsAfterSortIfNecessaryForTrackedInfos_existingInfos_textView_textContainerOrigin_todoUUIDsToImageViews___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v21 = a3;
  if (([v21 estimated] & 1) == 0)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v21 uuid];
    id v6 = [v4 objectForKeyedSubscript:v5];

    if (!v6)
    {
      double v7 = *(void **)(a1 + 40);
      double v8 = [v21 uuid];
      id v9 = [v7 objectForKeyedSubscript:v8];

      if (v9)
      {
        [v21 rect];
        double v11 = v10;
        double v13 = v12;
        TSDAddPoints();
        double v15 = v14;
        [v9 rect];
        id v17 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v15, *(double *)(a1 + 64) + v16, v11, v13);
        v18 = [v21 image];
        [v17 setImage:v18];

        [*(id *)(a1 + 48) addSubview:v17];
        v19 = *(void **)(a1 + 32);
        v20 = [v21 uuid];
        [v19 setObject:v17 forKeyedSubscript:v20];
      }
    }
  }
}

void __126__ICTextController_ICChecklistSortAnimation__setFinalFramesForSortedInfos_textView_textContainerOrigin_todoUUIDsToImageViews___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v17];
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    double v7 = [*(id *)(a1 + 32) trackedToDoParagraphs];
    double v8 = [v7 objectForKeyedSubscript:v6];
  }
  else
  {
    double v7 = [*(id *)(a1 + 40) icLayoutManager];
    id v9 = [v7 trackedToDoParagraphs];
    double v8 = [v9 objectForKeyedSubscript:v6];
  }
  if (v8)
  {
    double v10 = objc_msgSend(*(id *)(a1 + 48), "ic_objectForNonNilKey:", v17);
    double v11 = v10;
    if (v10)
    {
      [v10 frame];
      double v13 = v12;
      [v5 rect];
      double v15 = *(double *)(a1 + 64) + v14;
      double v16 = objc_msgSend(v11, "ic_animator");
      objc_msgSend(v16, "setFrameOrigin:", v13, v15);

      objc_msgSend(v11, "setFrameOrigin:", v13, v15);
    }
  }
}

void __127__ICTextController_ICChecklistSortAnimation__imageInfoForTrackedParagraph_textView_characterRangeToRender_visibleRectToRender___block_invoke(uint64_t a1)
{
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) icLayoutManager];
    [v2 setShouldManuallyRenderSeparateSubviews:1];

    id v3 = [*(id *)(a1 + 32) icLayoutManager];
    [v3 setIsDraggingChecklistItem:1];

    uint64_t v4 = [*(id *)(a1 + 32) icLayoutManager];
    uint64_t v5 = [*(id *)(a1 + 40) characterRange];
    objc_msgSend(v4, "updateSubviewsForCharacterRange:", v5, v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "ic_rectForRange:", *(void *)(a1 + 64), *(void *)(a1 + 72));
  double v7 = *(void **)(*(void *)(a1 + 48) + 8);
  v7[4] = v8;
  v7[5] = v9;
  v7[6] = v10;
  v7[7] = v11;
  uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "ic_imageForRange:", *(void *)(a1 + 64), *(void *)(a1 + 72));
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  double v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    double v15 = [*(id *)(a1 + 32) icLayoutManager];
    [v15 setShouldManuallyRenderSeparateSubviews:0];

    id v16 = [*(id *)(a1 + 32) icLayoutManager];
    [v16 setIsDraggingChecklistItem:0];
  }
}

uint64_t __88__ICTextController_Checklist__removeChecklistItemsMarkedCompleted_inTextView_forRanges___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 rangeValue];
  unint64_t v6 = [v4 rangeValue];

  if (v5 > v6) {
    return -1;
  }
  else {
    return 1;
  }
}

uint64_t __89__ICTextController_Checklist__moveCheckedChecklistsToBottomInTextView_forRange_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applySortFromOriginalParagraphs:sortedTrackedParagraphs:forTextView:checklistRange:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72));
}

uint64_t __89__ICTextController_Checklist__moveCheckedChecklistsToBottomInTextView_forRange_animated___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) unclampTextView];
  v2 = *(void **)(a1 + 32);

  return [v2 setIsDraggingChecklistItem:0];
}

uint64_t __89__ICTextController_Checklist__moveCheckedChecklistsToBottomInTextView_forRange_animated___block_invoke_76(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applySortFromOriginalParagraphs:sortedTrackedParagraphs:forTextView:checklistRange:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72));
}

uint64_t __114__ICTextController_Checklist__applySortFromOriginalParagraphs_sortedTrackedParagraphs_forTextView_checklistRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  [a2 characterRange];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4 + v3;
  unint64_t v5 = (void *)MEMORY[0x263F08D40];

  return objc_msgSend(v5, "valueWithRange:", v3, v4);
}

void __114__ICTextController_Checklist__applySortFromOriginalParagraphs_sortedTrackedParagraphs_forTextView_checklistRange___block_invoke_2(uint64_t a1, void *a2)
{
  id v15 = [a2 object];
  uint64_t v3 = objc_alloc_init(ICParagraphInfoSortInfo);
  [(ICParagraphInfoSortInfo *)v3 setTrackedParagraph:v15];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v15 characterRange];
  double v7 = objc_msgSend(v4, "attributedSubstringFromRange:", v5, v6);
  [(ICParagraphInfoSortInfo *)v3 setAttributedString:v7];

  uint64_t v8 = [v15 characterRange];
  -[ICParagraphInfoSortInfo setCharacterRange:](v3, "setCharacterRange:", v8, v9);
  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v11 = [v15 paragraph];
  uint64_t v12 = [v11 todo];
  uint64_t v13 = [v12 uuid];
  double v14 = [v13 UUIDString];
  [v10 setObject:v3 forKeyedSubscript:v14];
}

void __114__ICTextController_Checklist__applySortFromOriginalParagraphs_sortedTrackedParagraphs_forTextView_checklistRange___block_invoke_82(uint64_t a1, void *a2)
{
  id v15 = [a2 object];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v15 paragraph];
  uint64_t v5 = [v4 todo];
  uint64_t v6 = [v5 uuid];
  double v7 = [v6 UUIDString];
  uint64_t v8 = [v3 objectForKeyedSubscript:v7];

  uint64_t v9 = [*(id *)(a1 + 40) string];
  uint64_t v10 = [v8 characterRange];
  uint64_t v12 = objc_msgSend(v9, "ic_safeCharacterRangeForRange:", v10, v11);
  uint64_t v14 = v13;

  objc_msgSend(*(id *)(a1 + 40), "deleteCharactersInRange:", v12, v14);
}

void __114__ICTextController_Checklist__applySortFromOriginalParagraphs_sortedTrackedParagraphs_forTextView_checklistRange___block_invoke_2_83(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v16 = [v3 object];
  uint64_t v4 = [v16 paragraph];
  uint64_t v5 = [v4 todo];
  uint64_t v6 = [v5 uuid];
  double v7 = [v6 UUIDString];

  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v10 = [v3 index];

  uint64_t v11 = [v9 objectAtIndexedSubscript:v10];
  unint64_t v12 = [v11 rangeValue];

  if (!v8) {
    objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((sortInfo) != nil)", "-[ICTextController(Checklist) applySortFromOriginalParagraphs:sortedTrackedParagraphs:forTextView:checklistRange:]_block_invoke_2", 1, 0, @"Expected non-nil value for '%s'", "sortInfo");
  }
  unint64_t v13 = [*(id *)(a1 + 48) length];
  uint64_t v14 = *(void **)(a1 + 48);
  if (v12 <= v13)
  {
    id v15 = [v8 attributedString];
    objc_msgSend(v14, "replaceCharactersInRange:withAttributedString:", v12, 0, v15);
  }
  else
  {
    id v15 = [v8 attributedString];
    [v14 appendAttributedString:v15];
  }
}

uint64_t __79__ICTextController_Checklist__sortTrackedParagraphsMovingCheckedItemsToBottom___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 paragraph];
  id v3 = [v2 todo];
  uint64_t v4 = [v3 done];

  return v4;
}

void __81__ICTextController_Checklist__rangesForTodosInRange_markedCompleted_textStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v12 = a2;
  double v7 = [v12 todo];

  if (v7)
  {
    uint64_t v8 = [v12 todo];
    int v9 = [v8 done];

    if (v9)
    {
      if (!*(unsigned char *)(a1 + 40)) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    if (!*(unsigned char *)(a1 + 40))
    {
LABEL_4:
      uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      uint64_t v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", a3, a4);
      [v10 addObject:v11];
    }
  }
LABEL_5:
}

void __76__ICTextController_Checklist__trackedParagraphsForTodosInRange_textStorage___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 todo];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) trackedToDoParagraphs];
    uint64_t v5 = [v8 todo];
    uint64_t v6 = [v5 uuid];
    double v7 = [v4 objectForKeyedSubscript:v6];

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "ic_addNonNilObject:", v7);
  }
}

void __86__ICTextController_Checklist__containsAnyTodoItemMarkedCompleted_inRange_textStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v11 = a2;
  double v7 = [v11 todo];
  if (v7)
  {
    id v8 = [v11 todo];
    if ([v8 done] && *(unsigned char *)(a1 + 40))
    {

LABEL_8:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a5 = 1;
      goto LABEL_9;
    }
    int v9 = [v11 todo];
    if ([v9 done])
    {

      goto LABEL_9;
    }
    int v10 = *(unsigned __int8 *)(a1 + 40);

    if (!v10) {
      goto LABEL_8;
    }
  }
LABEL_9:
}

void __105__ICTextController_Checklist__autoSortChecklistIfNecessaryForTrackedParagraph_textView_analyticsHandler___block_invoke(uint64_t a1)
{
  if ([(id)objc_opt_class() checklistAutoSortEnabled])
  {
    id v2 = *(id *)(a1 + 40);
    id v3 = *(id *)(a1 + 48);
    dispatchMainAfterDelay();
  }
}

uint64_t __105__ICTextController_Checklist__autoSortChecklistIfNecessaryForTrackedParagraph_textView_analyticsHandler___block_invoke_2(uint64_t a1)
{
  BOOL v2 = !UIAccessibilityIsVoiceOverRunning();
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 48) characterRange];

  return objc_msgSend(v3, "moveCheckedChecklistsToBottomInTextView:forRange:animated:", v4, v6, v5, v2);
}

uint64_t __112__ICTextController_Checklist__showFirstTimeAutoSortEnabledAlertWithTextView_completionHandler_analyticsHandler___block_invoke(uint64_t a1)
{
  [(id)objc_opt_class() setChecklistAutoAlertShown:1];
  [(id)objc_opt_class() setChecklistAutoSortEnabled:0];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

uint64_t __112__ICTextController_Checklist__showFirstTimeAutoSortEnabledAlertWithTextView_completionHandler_analyticsHandler___block_invoke_2(uint64_t a1)
{
  [(id)objc_opt_class() setChecklistAutoAlertShown:1];
  [(id)objc_opt_class() setChecklistAutoSortEnabled:1];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

uint64_t __73__ICTextController_Checklist__analyticsInfoForChecklistAtIndex_textView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 paragraph];
  id v3 = [v2 todo];
  uint64_t v4 = [v3 done];

  return v4;
}

@end