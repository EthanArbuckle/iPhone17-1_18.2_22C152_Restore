@interface ICTextController(Checklist)
+ (uint64_t)checklistAutoAlertShown;
+ (uint64_t)checklistAutoSortEnabled;
+ (uint64_t)needsToShowFirstTimeAutoSortChecklistAlert;
+ (uint64_t)setChecklistAutoSortEnabled:()Checklist;
+ (void)setChecklistAutoAlertShown:()Checklist;
- (BOOL)canMoveListItemInDirection:()Checklist inTextView:forRange:;
- (ICChecklistInfo)analyticsInfoForChecklistAtIndex:()Checklist textView:;
- (ICParagraphInfo)paragraphInfoForCharacterAtIndex:()Checklist includeChildren:textStorage:;
- (ICTrackedParagraphTreeNode)createTreeFromTrackedParagraphs:()Checklist textView:;
- (id)adjacentTrackedParagraphFromTrackedParagraph:()Checklist inDirection:inTextView:;
- (id)expandedChecklistTrackedParagraphsInTextView:()Checklist forIndex:;
- (id)rangeForChecklistItemInRange:()Checklist textStorage:;
- (id)rangesForTodosInRange:()Checklist markedCompleted:textStorage:;
- (id)sortTrackedParagraphsMovingCheckedItemsToBottom:()Checklist;
- (id)trackedParagraphsForTodosInRange:()Checklist textStorage:;
- (id)validAdjacentParagraphInfoFromParagraphInfo:()Checklist inDirection:inTextView:;
- (uint64_t)canMoveCheckedChecklistsToBottomInTextView:()Checklist forRange:;
- (uint64_t)checklistItemExistsMarkedCompleted:()Checklist inTextView:forRanges:;
- (uint64_t)containsAnyTodoItemMarkedCompleted:()Checklist inRange:textStorage:;
- (uint64_t)containsOnlyChecklistItemsInTextView:()Checklist forRange:;
- (uint64_t)expandedRangeForContiguousTodosForRange:()Checklist textView:;
- (uint64_t)moveCheckedChecklistsToBottomInTextView:()Checklist forRange:;
- (uint64_t)moveCheckedChecklistsToBottomInTextView:()Checklist forRange:animated:;
- (uint64_t)moveListItemInDirection:()Checklist inTextView:forRange:;
- (void)applySortFromOriginalParagraphs:()Checklist sortedTrackedParagraphs:forTextView:checklistRange:;
- (void)autoSortChecklistForUnitTestAtIndex:()Checklist textView:;
- (void)autoSortChecklistIfNecessaryForTrackedParagraph:()Checklist textView:analyticsHandler:;
- (void)markAllChecklistItemsCompleted:()Checklist inTextview:forSelectedRanges:;
- (void)removeChecklistItemsMarkedCompleted:()Checklist inTextView:forRanges:;
- (void)sendTextDidChangeNotificationForTextView:()Checklist;
- (void)showFirstTimeAutoSortEnabledAlertIfNecessaryWithTextView:()Checklist completionHandler:analyticsHandler:;
- (void)showFirstTimeAutoSortEnabledAlertWithTextView:()Checklist completionHandler:analyticsHandler:;
@end

@implementation ICTextController(Checklist)

+ (uint64_t)checklistAutoAlertShown
{
  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"AutoSortChecklistAlertShown"];

  return v1;
}

+ (void)setChecklistAutoAlertShown:()Checklist
{
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v4 setBool:a3 forKey:@"AutoSortChecklistAlertShown"];
}

+ (uint64_t)checklistAutoSortEnabled
{
  return [MEMORY[0x263F5AEB0] BOOLForKey:@"ICChecklistAutoSortEnabledDefaultsKey"];
}

+ (uint64_t)setChecklistAutoSortEnabled:()Checklist
{
  return [MEMORY[0x263F5AEB0] setBool:a3 forKey:@"ICChecklistAutoSortEnabledDefaultsKey"];
}

- (void)sendTextDidChangeNotificationForTextView:()Checklist
{
  id v6 = a3;
  v3 = [v6 delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [v6 delegate];
    [v5 textViewDidChange:v6];
  }
}

- (void)markAllChecklistItemsCompleted:()Checklist inTextview:forSelectedRanges:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v20 + 1) + 8 * v13) rangeValue];
        uint64_t v16 = objc_msgSend(a1, "expandedRangeForContiguousTodosForRange:textView:", v14, v15, v8);
        uint64_t v18 = v17;
        v19 = [v8 textStorage];
        objc_msgSend(a1, "setDone:range:inTextStorage:", a3, v16, v18, v19);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
  [a1 sendTextDidChangeNotificationForTextView:v8];
}

- (uint64_t)checklistItemExistsMarkedCompleted:()Checklist inTextView:forRanges:
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 textStorage];
  id v11 = v9;
  uint64_t v12 = [v11 firstObject];
  uint64_t v13 = objc_msgSend(a1, "todoForRange:inTextStorage:", objc_msgSend(v12, "rangeValue"), 0, v10);

  if (v13)
  {
    int v14 = [v13 done];
    if (a3)
    {
      if (v14)
      {
LABEL_4:
        uint64_t v15 = 1;
        goto LABEL_17;
      }
    }
    else if (!v14)
    {
      goto LABEL_4;
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    while (2)
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v20), "rangeValue", (void)v26);
        uint64_t v23 = objc_msgSend(a1, "expandedRangeForContiguousTodosForRange:textView:", v21, v22, v8);
        if (objc_msgSend(a1, "containsAnyTodoItemMarkedCompleted:inRange:textStorage:", a3, v23, v24, v10))
        {
          uint64_t v15 = 1;
          goto LABEL_16;
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0;
LABEL_16:

LABEL_17:
  return v15;
}

- (uint64_t)containsOnlyChecklistItemsInTextView:()Checklist forRange:
{
  id v8 = a3;
  objc_opt_class();
  id v9 = [v8 textStorage];

  uint64_t v10 = ICCheckedDynamicCast();

  uint64_t v11 = objc_msgSend(a1, "containsOnlyStyle:inRange:inTextStorage:", 103, a4, a5, v10);
  return v11;
}

- (void)removeChecklistItemsMarkedCompleted:()Checklist inTextView:forRanges:
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  v50 = v7;
  id v9 = [v7 textStorage];
  uint64_t v10 = ICCheckedDynamicCast();

  id v52 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v51 = objc_alloc_init(MEMORY[0x263F089C8]);
  id v11 = objc_alloc_init(MEMORY[0x263F089C8]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = v8;
  uint64_t v12 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v62 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = [*(id *)(*((void *)&v61 + 1) + 8 * i) rangeValue];
        uint64_t v18 = objc_msgSend(a1, "expandedRangeForContiguousTodosForRange:textView:", v16, v17, v50);
        uint64_t v20 = v19;
        objc_msgSend(v51, "addIndexesInRange:", v18, v19);
        uint64_t v21 = objc_msgSend(a1, "rangesForTodosInRange:markedCompleted:textStorage:", v18, v20, a3, v10);
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v57 objects:v66 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v58;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v58 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = [*(id *)(*((void *)&v57 + 1) + 8 * j) rangeValue];
              objc_msgSend(v11, "addIndexesInRange:", v26, v27);
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v57 objects:v66 count:16];
          }
          while (v23);
        }
        [v52 addObjectsFromArray:v21];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
    }
    while (v13);
  }

  long long v28 = [v52 allObjects];
  long long v29 = [v28 sortedArrayUsingComparator:&__block_literal_global_21];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v30 = v29;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v54;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v54 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = [*(id *)(*((void *)&v53 + 1) + 8 * k) rangeValue];
        objc_msgSend(v10, "deleteCharactersInRange:", v35, v36);
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v32);
  }

  if ([v30 count] && objc_msgSend(v11, "isEqualToIndexSet:", v51))
  {
    v37 = [v30 lastObject];
    uint64_t v38 = [v37 rangeValue];

    v39 = objc_msgSend(a1, "todoForRange:inTextStorage:", v38, 0, v10);
    if (!v39)
    {
      v40 = [v10 string];
      objc_msgSend(v40, "lineRangeForRange:", v38, 0);
      uint64_t v42 = v41;

      if (v42) {
        objc_msgSend(v10, "replaceCharactersInRange:withString:", v38, 0, @"\n");
      }
      objc_msgSend(a1, "setTextStyle:range:inTextStorage:", 103, v38, 0, v10);
    }
    objc_opt_class();
    v43 = [v50 textStorage];
    v44 = ICCheckedDynamicCast();
    uint64_t v45 = objc_msgSend(v44, "safeCharacterRangeForRange:", v38, 0);
    uint64_t v47 = v46;

    objc_msgSend(v50, "setSelectedRange:", v45, v47);
  }
  [a1 sendTextDidChangeNotificationForTextView:v50];
}

- (uint64_t)moveListItemInDirection:()Checklist inTextView:forRange:
{
  id v8 = a4;
  id v9 = [v8 textStorage];
  uint64_t v10 = [a1 paragraphInfoForCharacterAtIndex:a5 includeChildren:1 textStorage:v9];

  uint64_t v11 = [a1 validAdjacentParagraphInfoFromParagraphInfo:v10 inDirection:a3 inTextView:v8];
  uint64_t v12 = (void *)v11;
  uint64_t v13 = 0;
  if (v10 && v11)
  {
    unint64_t v14 = [v10 indent];
    if (v14 < [v12 indent])
    {
      uint64_t v13 = 0;
      goto LABEL_14;
    }
    uint64_t v15 = [v10 rangeIncludingChildren];
    uint64_t v17 = v16;
    uint64_t v18 = [v12 rangeIncludingChildren];
    uint64_t v13 = 0;
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v20 = v18;
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v33 = v19;
        uint64_t v21 = [v8 textStorage];
        uint64_t v22 = objc_msgSend(v21, "attributedSubstringFromRange:", v15, v17);

        uint64_t v23 = [v10 paragraphStyle];
        uint64_t v34 = v20;
        if (([v23 isList] & 1) == 0)
        {
          [v22 string];
          uint64_t v25 = v24 = v22;
          char v32 = objc_msgSend(v25, "ic_isLastCharacterANewline");

          if (v32)
          {
LABEL_11:
            uint64_t v27 = v33 - v17;
            if (!a3) {
              uint64_t v27 = 0;
            }
            uint64_t v28 = v34 + v27;
            long long v29 = [v8 textStorage];
            objc_msgSend(v29, "deleteCharactersInRange:", v15, v17);

            id v30 = [v8 textStorage];
            [v30 insertAttributedString:v24 atIndex:v28];

            objc_msgSend(v8, "setSelectedRange:", v28, 0);
            [a1 sendTextDidChangeNotificationForTextView:v8];

            uint64_t v13 = 1;
            goto LABEL_14;
          }
          uint64_t v23 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:v24];
          uint64_t v26 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"\n"];
          [v23 appendAttributedString:v26];

          uint64_t v22 = (void *)[v23 copy];
        }
        uint64_t v24 = v22;

        goto LABEL_11;
      }
    }
  }
LABEL_14:

  return v13;
}

- (BOOL)canMoveListItemInDirection:()Checklist inTextView:forRange:
{
  id v8 = a4;
  id v9 = [v8 textStorage];
  uint64_t v10 = [a1 paragraphInfoForCharacterAtIndex:a5 includeChildren:1 textStorage:v9];

  if (v10)
  {
    uint64_t v11 = [a1 validAdjacentParagraphInfoFromParagraphInfo:v10 inDirection:a3 inTextView:v8];
    BOOL v12 = v11 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)expandedChecklistTrackedParagraphsInTextView:()Checklist forIndex:
{
  id v6 = a3;
  id v7 = [v6 textStorage];
  unint64_t v8 = [v7 length];

  if (v8 <= a4)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v9 = objc_msgSend(a1, "expandedRangeForContiguousTodosForRange:textView:", a4, 0, v6);
    uint64_t v11 = v10;
    BOOL v12 = [v6 textStorage];
    uint64_t v13 = objc_msgSend(a1, "trackedParagraphsForTodosInRange:textStorage:", v9, v11, v12);
  }
  if (v13) {
    unint64_t v14 = v13;
  }
  else {
    unint64_t v14 = (void *)MEMORY[0x263EFFA68];
  }
  id v15 = v14;

  return v15;
}

- (id)adjacentTrackedParagraphFromTrackedParagraph:()Checklist inDirection:inTextView:
{
  id v8 = a5;
  uint64_t v9 = [a3 characterRange];
  if (a4) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = -1;
  }
  uint64_t v12 = v9 + v11;
  uint64_t v13 = [v8 textStorage];

  unint64_t v14 = objc_msgSend(a1, "todoForRange:inTextStorage:", v12, 0, v13);

  id v15 = [a1 trackedToDoParagraphs];
  uint64_t v16 = [v14 uuid];
  uint64_t v17 = objc_msgSend(v15, "ic_objectForNonNilKey:", v16);

  return v17;
}

- (id)validAdjacentParagraphInfoFromParagraphInfo:()Checklist inDirection:inTextView:
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v8;
  uint64_t v11 = v10;
  do
  {
    while (1)
    {
      uint64_t v12 = [v10 paragraphStyle];
      int v13 = [v12 isList];

      if (!v13) {
        break;
      }
      uint64_t v14 = [v11 characterRange];
      if (a4) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = -1;
      }
      uint64_t v17 = v14 + v16;
      uint64_t v18 = [v9 textStorage];
      uint64_t v19 = [a1 paragraphInfoForCharacterAtIndex:v17 includeChildren:0 textStorage:v18];

      int v20 = [v10 style];
      if (v20 != [v19 style])
      {
        uint64_t v33 = 0;
        goto LABEL_21;
      }
      uint64_t v21 = [v10 indent];
      uint64_t v22 = [v19 indent];
      BOOL v23 = v21 < v22;
      if (v21 == v22)
      {
        uint64_t v34 = [v9 textStorage];
        uint64_t v35 = [a1 paragraphInfoForCharacterAtIndex:v17 includeChildren:1 textStorage:v34];

        id v36 = v35;
        goto LABEL_19;
      }
      uint64_t v11 = v19;
      if (!v23)
      {
        id v36 = v19;
LABEL_19:
        uint64_t v19 = v36;
        uint64_t v33 = v36;
        goto LABEL_21;
      }
    }
    uint64_t v24 = [v11 rangeIncludingChildren];
    if (a4) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = -1;
    }
    uint64_t v27 = v24 + v26;
    uint64_t v28 = [v9 textStorage];
    long long v29 = [a1 paragraphInfoForCharacterAtIndex:v27 includeChildren:0 textStorage:v28];

    LODWORD(v28) = [v29 style];
    uint64_t v11 = v29;
  }
  while (v28 > [v10 style]);
  id v30 = v29;
  uint64_t v19 = v30;
  if (a4 && (int v31 = [v30 style], v31 == objc_msgSend(v10, "style")))
  {
    char v32 = [v9 textStorage];
    uint64_t v33 = [a1 paragraphInfoForCharacterAtIndex:v27 includeChildren:1 textStorage:v32];
  }
  else
  {
    uint64_t v33 = v19;
  }
LABEL_21:

  return v33;
}

- (uint64_t)canMoveCheckedChecklistsToBottomInTextView:()Checklist forRange:
{
  id v8 = a3;
  uint64_t v9 = objc_msgSend(a1, "expandedRangeForContiguousTodosForRange:textView:", a4, a5, v8);
  uint64_t v11 = v10;
  uint64_t v12 = [v8 textStorage];
  int v13 = objc_msgSend(a1, "trackedParagraphsForTodosInRange:textStorage:", v9, v11, v12);

  uint64_t v14 = [a1 createTreeFromTrackedParagraphs:v13 textView:v8];

  [v14 recursivlySortCheckedItemsToBottom];
  uint64_t v15 = [v14 linerizedRepresentation];
  uint64_t v16 = [v13 isEqualToArray:v15] ^ 1;

  return v16;
}

- (uint64_t)moveCheckedChecklistsToBottomInTextView:()Checklist forRange:
{
  return objc_msgSend(a1, "moveCheckedChecklistsToBottomInTextView:forRange:animated:", a3, a4, a5, 0);
}

- (uint64_t)moveCheckedChecklistsToBottomInTextView:()Checklist forRange:animated:
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v10 = a3;
  [v10 icaxClearCaches];
  uint64_t v11 = [v10 TTTextStorage];
  uint64_t v12 = [v10 TTTextStorage];
  uint64_t v13 = objc_msgSend(v12, "ic_range");
  objc_msgSend(a1, "updateTrackedAttributesInTextStorage:range:changeInLength:", v11, v13, v14, 0);

  uint64_t v15 = objc_msgSend(a1, "expandedRangeForContiguousTodosForRange:textView:", a4, a5, v10);
  uint64_t v17 = v16;
  uint64_t v18 = [v10 textStorage];
  uint64_t v19 = objc_msgSend(a1, "trackedParagraphsForTodosInRange:textStorage:", v15, v17, v18);

  int v20 = [a1 createTreeFromTrackedParagraphs:v19 textView:v10];
  [v20 recursivlySortCheckedItemsToBottom];
  uint64_t v21 = [v20 linerizedRepresentation];
  int v22 = [v19 isEqualToArray:v21];
  if (v22) {
    goto LABEL_20;
  }
  BOOL v23 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v54 = [v19 count];
    _os_log_impl(&dword_20BE60000, v23, OS_LOG_TYPE_INFO, "Sorting a checklist with %d items", buf, 8u);
  }

  if (ICInternalSettingsIsTextKit2Enabled())
  {
    uint64_t v35 = [[ICTextElementAnimator alloc] initWithTextView:v10 originTrackedParagraphs:v19 destinationTrackedParagraphs:v21];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__ICTextController_Checklist__moveCheckedChecklistsToBottomInTextView_forRange_animated___block_invoke;
    aBlock[3] = &unk_2640BAEF8;
    aBlock[4] = a1;
    id v48 = v19;
    id v49 = v21;
    id v24 = v10;
    id v50 = v24;
    uint64_t v51 = v15;
    uint64_t v52 = v17;
    uint64_t v25 = _Block_copy(aBlock);
    uint64_t v26 = v25;
    if (a6)
    {
      [v24 clampTextView];
      [v24 setIsDraggingChecklistItem:1];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __89__ICTextController_Checklist__moveCheckedChecklistsToBottomInTextView_forRange_animated___block_invoke_2;
      v44[3] = &unk_2640BB098;
      id v46 = v26;
      id v45 = v24;
      uint64_t v27 = v35;
      [(ICTextElementAnimator *)v35 animateWithCompletion:v44];
    }
    else
    {
      (*((void (**)(void *))v25 + 2))(v25);
      uint64_t v27 = v35;
    }

    goto LABEL_20;
  }
  int v37 = v22;
  if (a6)
  {
    if ((unint64_t)[v19 count] < 0x1F5)
    {
      int v36 = 1;
      goto LABEL_16;
    }
    uint64_t v28 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      int v29 = [v19 count];
      *(_DWORD *)buf = 67109120;
      int v54 = v29;
      _os_log_impl(&dword_20BE60000, v28, OS_LOG_TYPE_INFO, "Disabling animation for checklist sort of %d items", buf, 8u);
    }
  }
  int v36 = 0;
LABEL_16:
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __89__ICTextController_Checklist__moveCheckedChecklistsToBottomInTextView_forRange_animated___block_invoke_76;
  v38[3] = &unk_2640BAEF8;
  v38[4] = a1;
  id v30 = v19;
  id v39 = v30;
  id v40 = v21;
  id v31 = v10;
  id v41 = v31;
  uint64_t v42 = v15;
  uint64_t v43 = v17;
  char v32 = _Block_copy(v38);
  uint64_t v33 = v32;
  if (v36) {
    objc_msgSend(a1, "performAnimatedSortForTrackedParagraphs:expandedRange:textView:sortChecklistsBlock:", v30, v15, v17, v31, v32);
  }
  else {
    (*((void (**)(void *))v32 + 2))(v32);
  }
  int v22 = v37;

LABEL_20:
  return v22 ^ 1u;
}

- (void)applySortFromOriginalParagraphs:()Checklist sortedTrackedParagraphs:forTextView:checklistRange:
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v35 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 TTTextStorage];
  uint64_t v12 = [v11 undoManager];
  [v12 beginUndoGrouping];

  [v11 beginSkippingTimestampUpdates];
  [v11 beginEditing];
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = a6;
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __114__ICTextController_Checklist__applySortFromOriginalParagraphs_sortedTrackedParagraphs_forTextView_checklistRange___block_invoke;
  v46[3] = &unk_2640BB0C0;
  v46[4] = v47;
  uint64_t v13 = objc_msgSend(v9, "ic_map:", v46);
  uint64_t v14 = [v9 differenceFromArray:v35];
  uint64_t v15 = [v14 removals];
  id v16 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v17 = [v14 removals];
  uint64_t v18 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __114__ICTextController_Checklist__applySortFromOriginalParagraphs_sortedTrackedParagraphs_forTextView_checklistRange___block_invoke_2;
  v43[3] = &unk_2640BB0E8;
  id v19 = v11;
  id v44 = v19;
  id v20 = v18;
  id v45 = v20;
  [v15 enumerateObjectsUsingBlock:v43];
  uint64_t v21 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    int v22 = [v15 count];
    int v23 = [v35 count];
    *(_DWORD *)buf = 67109376;
    int v49 = v22;
    __int16 v50 = 1024;
    int v51 = v23;
    _os_log_impl(&dword_20BE60000, v21, OS_LOG_TYPE_INFO, "Beginning checklist reorder with number of changes %d for total item count %d", buf, 0xEu);
  }

  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __114__ICTextController_Checklist__applySortFromOriginalParagraphs_sortedTrackedParagraphs_forTextView_checklistRange___block_invoke_82;
  v40[3] = &unk_2640BB0E8;
  id v24 = v20;
  id v41 = v24;
  id v25 = v19;
  id v42 = v25;
  [v15 enumerateObjectsWithOptions:2 usingBlock:v40];
  uint64_t v26 = [v14 insertions];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __114__ICTextController_Checklist__applySortFromOriginalParagraphs_sortedTrackedParagraphs_forTextView_checklistRange___block_invoke_2_83;
  v36[3] = &unk_2640BB110;
  id v27 = v24;
  id v37 = v27;
  id v28 = v13;
  id v38 = v28;
  id v29 = v25;
  id v39 = v29;
  [v26 enumerateObjectsUsingBlock:v36];
  [v29 endEditing];
  [v29 endSkippingTimestampUpdates];
  id v30 = [v29 undoManager];
  [v30 endUndoGrouping];

  [a1 sendTextDidChangeNotificationForTextView:v10];
  id v31 = [v10 textStorage];
  objc_msgSend(a1, "updateTrackedAttributesInTextStorage:range:changeInLength:", v31, a6, a7, 0);

  _Block_object_dispose(v47, 8);
}

- (ICTrackedParagraphTreeNode)createTreeFromTrackedParagraphs:()Checklist textView:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(ICTrackedParagraphTreeNode);
  [(ICTrackedParagraphTreeNode *)v7 setIndent:-1];
  id v8 = v7;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  id v28 = v8;
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "paragraph", v28);
        uint64_t v15 = [v14 indent];

        if (v15)
        {
          uint64_t v16 = [(ICTrackedParagraphTreeNode *)v8 indent];
          uint64_t v17 = [v13 paragraph];
          uint64_t v18 = [v17 indent];

          if (v18 <= v16 + 1)
          {
            if (v18 > v16 || v16 < 1)
            {
              id v20 = v8;
            }
            else
            {
              id v20 = v8;
              do
              {
                id v25 = v20;
                id v20 = [(ICTrackedParagraphTreeNode *)v20 parent];

                uint64_t v26 = [(ICTrackedParagraphTreeNode *)v20 indent];
              }
              while (v18 <= v26 && v26 > 0);
            }
          }
          else
          {
            do
            {
              id v19 = +[ICTrackedParagraphTreeNode placeholderNodeWithIndentation:](ICTrackedParagraphTreeNode, "placeholderNodeWithIndentation:");
              [(ICTrackedParagraphTreeNode *)v8 addChild:v19];
              id v20 = v19;

              uint64_t v21 = [(ICTrackedParagraphTreeNode *)v20 indent];
              uint64_t v22 = v21 + 1;
              id v8 = v20;
            }
            while (v18 > v22);
          }
          id v8 = +[ICTrackedParagraphTreeNode nodeFromTrackedParagraph:v13 textView:v6];
          [(ICTrackedParagraphTreeNode *)v20 addChild:v8];
        }
        else
        {
          uint64_t v23 = +[ICTrackedParagraphTreeNode nodeFromTrackedParagraph:v13 textView:v6];
          [(ICTrackedParagraphTreeNode *)v28 addChild:v23];
          id v20 = v8;
          id v8 = (ICTrackedParagraphTreeNode *)v23;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v10);
  }

  return v28;
}

- (id)sortTrackedParagraphsMovingCheckedItemsToBottom:()Checklist
{
  id v3 = a3;
  char v4 = (void *)[v3 mutableCopy];
  id v5 = objc_msgSend(v3, "ic_objectsPassingTest:", &__block_literal_global_93);

  [v4 removeObjectsInArray:v5];
  [v4 addObjectsFromArray:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (uint64_t)expandedRangeForContiguousTodosForRange:()Checklist textView:
{
  id v8 = a5;
  objc_opt_class();
  uint64_t v9 = [v8 textStorage];
  uint64_t v10 = ICCheckedDynamicCast();

  if (objc_msgSend(a1, "containsOnlyStyle:inRange:inTextStorage:", 103, a3, a4, v10))
  {
    unint64_t v11 = a3 + a4;
    if ((a3 & 0x8000000000000000) == 0)
    {
      uint64_t v12 = (void *)MEMORY[0x210546100]();
      uint64_t v13 = objc_msgSend(a1, "rangeForChecklistItemInRange:textStorage:", a3, 0, v10);
      if (v13)
      {
        uint64_t v14 = a3;
        do
        {
          [v13 rangeValue];
          if (!v15) {
            break;
          }
          uint64_t v16 = [v13 rangeValue];
          uint64_t v14 = v16;
          if (v16 - 1 >= a3 - 1) {
            --a3;
          }
          else {
            a3 = v16 - 1;
          }

          if (a3 < 0) {
            goto LABEL_14;
          }
          uint64_t v12 = (void *)MEMORY[0x210546100]();
          uint64_t v13 = objc_msgSend(a1, "rangeForChecklistItemInRange:textStorage:", a3, 0, v10);
        }
        while (v13);
      }
      else
      {
        uint64_t v14 = a3;
      }

LABEL_14:
      a3 = v14;
    }
    if (v11 < [v10 length])
    {
      uint64_t v17 = (void *)MEMORY[0x210546100]();
      for (uint64_t i = objc_msgSend(a1, "rangeForChecklistItemInRange:textStorage:", v11, 0, v10);
      {
        [i rangeValue];
        if (!v19) {
          break;
        }
        uint64_t v20 = [i rangeValue];
        if (v20 + v21 <= (uint64_t)(v11 + 1)) {
          ++v11;
        }
        else {
          unint64_t v11 = v20 + v21;
        }

        if (v11 >= [v10 length]) {
          goto LABEL_24;
        }
        uint64_t v17 = (void *)MEMORY[0x210546100]();
        objc_msgSend(a1, "rangeForChecklistItemInRange:textStorage:", v11, 0, v10);
      }
    }
  }
LABEL_24:

  return a3;
}

- (id)rangesForTodosInRange:()Checklist markedCompleted:textStorage:
{
  id v9 = a6;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__18;
  uint64_t v19 = __Block_byref_object_dispose__18;
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v10 = *MEMORY[0x263F5AB28];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__ICTextController_Checklist__rangesForTodosInRange_markedCompleted_textStorage___block_invoke;
  v13[3] = &unk_2640BB158;
  char v14 = a5;
  v13[4] = &v15;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, a3, a4, 0, v13);
  id v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (id)trackedParagraphsForTodosInRange:()Checklist textStorage:
{
  id v8 = a5;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__18;
  uint64_t v17 = __Block_byref_object_dispose__18;
  id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v9 = *MEMORY[0x263F5AB28];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__ICTextController_Checklist__trackedParagraphsForTodosInRange_textStorage___block_invoke;
  v12[3] = &unk_2640B8D60;
  v12[4] = a1;
  v12[5] = &v13;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v9, a3, a4, 0, v12);
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (id)rangeForChecklistItemInRange:()Checklist textStorage:
{
  v2 = objc_msgSend(a1, "todoForRange:inTextStorage:");
  id v3 = [v2 uuid];

  if (v3)
  {
    char v4 = [a1 trackedToDoParagraphs];
    id v5 = [v2 uuid];
    id v6 = [v4 objectForKeyedSubscript:v5];

    if (v6)
    {
      uint64_t v7 = [v6 characterRange];
      id v3 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v7, v8);
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

- (uint64_t)containsAnyTodoItemMarkedCompleted:()Checklist inRange:textStorage:
{
  id v9 = a6;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v10 = *MEMORY[0x263F5AB28];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__ICTextController_Checklist__containsAnyTodoItemMarkedCompleted_inRange_textStorage___block_invoke;
  v13[3] = &unk_2640BB158;
  char v14 = a3;
  v13[4] = &v15;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, a4, a5, 0, v13);
  uint64_t v11 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (ICParagraphInfo)paragraphInfoForCharacterAtIndex:()Checklist includeChildren:textStorage:
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v7 = a5;
  uint64_t v8 = [v7 string];
  long long v60 = v7;
  id v9 = [v7 attribute:*MEMORY[0x263F5AB28] atIndex:a3 effectiveRange:0];
  if (v9)
  {
    uint64_t v10 = objc_alloc_init(ICParagraphInfo);
    [(ICParagraphInfo *)v10 setParagraphStyle:v9];
    if ([v9 isList])
    {
      uint64_t v11 = objc_msgSend(v8, "ic_lineRangeIgnoringLineBreakCharactersForIndex:", a3);
      -[ICParagraphInfo setCharacterRange:](v10, "setCharacterRange:", v11, v12);
      uint64_t v13 = v10;
      uint64_t v14 = [v9 indent];
      if (v13)
      {
        unint64_t v15 = v14;
        uint64_t v16 = v13;
        do
        {
          v65[0] = 0;
          v65[1] = 0;
          uint64_t v17 = [v16 characterRange];
          if (!a4)
          {
            uint64_t v16 = v13;
            goto LABEL_29;
          }
          uint64_t v19 = v17;
          uint64_t v20 = v18;
          if ([v9 isList])
          {
            uint64_t v21 = v20 + v19 + 1;
            uint64_t v22 = [v60 attribute:*MEMORY[0x263F5AB28] atIndex:v21 effectiveRange:v65];
            int v23 = [v22 style];
            if (v23 != [v9 style] || objc_msgSend(v22, "indent") <= v15)
            {

              goto LABEL_29;
            }
            id v24 = objc_alloc_init(ICParagraphInfo);
            [(ICParagraphInfo *)v24 setParagraphStyle:v22];
            uint64_t v25 = objc_msgSend(v8, "ic_lineRangeIgnoringLineBreakCharactersForIndex:", v21);
            -[ICParagraphInfo setCharacterRange:](v24, "setCharacterRange:", v25, v26);
            id v27 = [(ICParagraphInfo *)v13 children];

            if (!v27)
            {
              id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
              [(ICParagraphInfo *)v13 setChildren:v28];
            }
            id v29 = [(ICParagraphInfo *)v13 children];
            [v29 addObject:v24];

            uint64_t v16 = v24;
          }
        }
        while (v16);
      }
      uint64_t v10 = v13;
    }
    else
    {
      long long v30 = [v9 uuid];

      if (v30)
      {
        uint64_t v31 = objc_msgSend(v8, "paragraphRangeForRange:", a3, 0);
        -[ICParagraphInfo setCharacterRange:](v10, "setCharacterRange:", v31, v32);
        if (a4)
        {
          long long v59 = v8;
          objc_opt_class();
          long long v33 = ICDynamicCast();
          uint64_t v16 = [v33 outlineController];

          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v58 = v9;
          uint64_t v34 = [v9 uuid];
          uint64_t v35 = [v16 descendantsForUUID:v34];

          uint64_t v36 = [v35 countByEnumeratingWithState:&v61 objects:v66 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v62;
            do
            {
              for (uint64_t i = 0; i != v37; ++i)
              {
                if (*(void *)v62 != v38) {
                  objc_enumerationMutation(v35);
                }
                uint64_t v40 = [v16 rangeForUUID:*(void *)(*((void *)&v61 + 1) + 8 * i)];
                uint64_t v42 = v41;
                uint64_t v43 = [v60 attribute:*MEMORY[0x263F5AB28] atIndex:v40 effectiveRange:0];
                id v44 = objc_alloc_init(ICParagraphInfo);
                [(ICParagraphInfo *)v44 setParagraphStyle:v43];
                -[ICParagraphInfo setCharacterRange:](v44, "setCharacterRange:", v40, v42);
                id v45 = [(ICParagraphInfo *)v10 children];

                if (!v45)
                {
                  id v46 = objc_alloc_init(MEMORY[0x263EFF980]);
                  [(ICParagraphInfo *)v10 setChildren:v46];
                }
                uint64_t v47 = [(ICParagraphInfo *)v10 children];
                [v47 addObject:v44];
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v61 objects:v66 count:16];
            }
            while (v37);
          }

          id v9 = v58;
          uint64_t v8 = v59;
LABEL_29:
        }
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v48 = [(ICParagraphInfo *)v10 children];
  uint64_t v49 = [v48 count];

  uint64_t v51 = [(ICParagraphInfo *)v10 characterRange];
  if (v49)
  {
    uint64_t v52 = [(ICParagraphInfo *)v10 children];
    long long v53 = [v52 lastObject];
    uint64_t v54 = [v53 characterRange];
    uint64_t v56 = v55;

    uint64_t v50 = v56 - v51 + v54;
  }
  -[ICParagraphInfo setRangeIncludingChildren:](v10, "setRangeIncludingChildren:", v51, v50);

  return v10;
}

- (void)autoSortChecklistIfNecessaryForTrackedParagraph:()Checklist textView:analyticsHandler:
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v9)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __105__ICTextController_Checklist__autoSortChecklistIfNecessaryForTrackedParagraph_textView_analyticsHandler___block_invoke;
    v11[3] = &unk_2640B89A8;
    v11[4] = a1;
    id v12 = v9;
    id v13 = v8;
    [a1 showFirstTimeAutoSortEnabledAlertIfNecessaryWithTextView:v12 completionHandler:v11 analyticsHandler:a5];
  }
}

- (void)autoSortChecklistForUnitTestAtIndex:()Checklist textView:
{
  id v8 = a4;
  uint64_t v6 = objc_msgSend(a1, "expandedRangeForContiguousTodosForRange:textView:", a3, 0, v8);
  objc_msgSend(a1, "moveCheckedChecklistsToBottomInTextView:forRange:animated:", v8, v6, v7, 0);
}

- (void)showFirstTimeAutoSortEnabledAlertIfNecessaryWithTextView:()Checklist completionHandler:analyticsHandler:
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([(id)objc_opt_class() checklistAutoAlertShown] & 1) != 0
    || [(id)objc_opt_class() checklistAutoSortEnabled])
  {
    v8[2](v8);
  }
  else
  {
    [a1 showFirstTimeAutoSortEnabledAlertWithTextView:v10 completionHandler:v8 analyticsHandler:v9];
  }
}

- (void)showFirstTimeAutoSortEnabledAlertWithTextView:()Checklist completionHandler:analyticsHandler:
{
  id v28 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263F086E0];
  id v29 = a3;
  id v10 = [v9 mainBundle];
  uint64_t v31 = [v10 localizedStringForKey:@"Enable Automatic Sorting?" value:&stru_26C10E100 table:0];

  uint64_t v11 = [MEMORY[0x263F086E0] mainBundle];
  long long v30 = [v11 localizedStringForKey:@"Would you like checked items to automatically move to the bottom of your lists? You can change this later in Notes Settings." value:&stru_26C10E100 table:0];

  id v12 = [MEMORY[0x263F82418] alertControllerWithTitle:v31 message:v30 preferredStyle:1];
  id v13 = (void *)MEMORY[0x263F82400];
  uint64_t v14 = [MEMORY[0x263F086E0] mainBundle];
  unint64_t v15 = [v14 localizedStringForKey:@"Not Now" value:&stru_26C10E100 table:0];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __112__ICTextController_Checklist__showFirstTimeAutoSortEnabledAlertWithTextView_completionHandler_analyticsHandler___block_invoke;
  v35[3] = &unk_2640BB180;
  uint64_t v16 = a1;
  v35[4] = a1;
  id v17 = v8;
  id v36 = v17;
  id v18 = v28;
  id v37 = v18;
  uint64_t v19 = [v13 actionWithTitle:v15 style:1 handler:v35];
  [v12 addAction:v19];

  uint64_t v20 = (void *)MEMORY[0x263F82400];
  uint64_t v21 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v22 = [v21 localizedStringForKey:@"Enable Sorting" value:&stru_26C10E100 table:0];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __112__ICTextController_Checklist__showFirstTimeAutoSortEnabledAlertWithTextView_completionHandler_analyticsHandler___block_invoke_2;
  v32[3] = &unk_2640BB180;
  v32[4] = v16;
  id v33 = v17;
  id v34 = v18;
  id v23 = v18;
  id v24 = v17;
  uint64_t v25 = [v20 actionWithTitle:v22 style:0 handler:v32];

  [v12 addAction:v25];
  [v12 setPreferredAction:v25];
  objc_opt_class();
  uint64_t v26 = [v29 editorController];

  id v27 = ICDynamicCast();
  [v27 presentViewController:v12 animated:1 completion:0];
}

+ (uint64_t)needsToShowFirstTimeAutoSortChecklistAlert
{
  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"AutoSortChecklistAlertShown"];

  return v1;
}

- (ICChecklistInfo)analyticsInfoForChecklistAtIndex:()Checklist textView:
{
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(ICChecklistInfo);
  id v8 = [v6 textStorage];
  unint64_t v9 = [v8 length];

  if (v9 > a3)
  {
    id v10 = [v6 TTTextStorage];
    uint64_t v11 = [v6 TTTextStorage];
    uint64_t v12 = objc_msgSend(v11, "ic_range");
    objc_msgSend(a1, "updateTrackedAttributesInTextStorage:range:changeInLength:", v10, v12, v13, 0);

    [v6 visibleBounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      uint64_t v22 = [v6 icTextLayoutManager];
      uint64_t v23 = objc_msgSend(v22, "characterRangeForBoundingRect:", v15, v17, v19, v21);
      uint64_t v25 = v24;

      uint64_t v26 = [v6 icTextLayoutManager];
      id v27 = [v6 icTextLayoutManager];
      id v28 = objc_msgSend(v27, "ic_textRangeForRange:", v23, v25);
      [v26 ensureLayoutForRange:v28];
    }
    else
    {
      uint64_t v26 = [v6 layoutManager];
      id v27 = [v6 textContainer];
      objc_msgSend(v26, "ensureLayoutForBoundingRect:inTextContainer:", v27, v15, v17, v19, v21);
    }

    uint64_t v29 = objc_msgSend(a1, "expandedRangeForContiguousTodosForRange:textView:", a3, 0, v6);
    uint64_t v31 = v30;
    uint64_t v32 = [v6 textStorage];
    id v33 = objc_msgSend(a1, "trackedParagraphsForTodosInRange:textStorage:", v29, v31, v32);

    id v34 = objc_msgSend(v33, "ic_objectsPassingTest:", &__block_literal_global_119);
    -[ICChecklistInfo setNumberOfItems:](v7, "setNumberOfItems:", [v33 count]);
    -[ICChecklistInfo setNumberOfCheckedItems:](v7, "setNumberOfCheckedItems:", [v34 count]);
    [(ICChecklistInfo *)v7 setNumberOfUncheckedItems:[(ICChecklistInfo *)v7 numberOfItems]- [(ICChecklistInfo *)v7 numberOfCheckedItems]];
  }

  return v7;
}

@end