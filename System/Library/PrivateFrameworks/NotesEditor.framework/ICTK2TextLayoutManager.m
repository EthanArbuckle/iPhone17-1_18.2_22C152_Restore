@interface ICTK2TextLayoutManager
- (Class)viewProviderClassForTextAttachment:(id)a3;
- (ICAttachmentViewDelegate)attachmentViewDelegate;
- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder;
- (ICTK2TextController)textController;
- (ICTK2TextLayoutManager)init;
- (NSDictionary)trackedToDoParagraphs;
- (NSMutableDictionary)tableAttachmentViewControllers;
- (NSMutableDictionary)viewProviderCache;
- (NSTextContentStorage)textContentStorage;
- (_NSRange)characterRangeForBoundingRect:(CGRect)a3;
- (_NSRange)rangeForAttachment:(id)a3 withTextAttachment:(id *)a4;
- (id)existingAttachmentViewForIdentifier:(id)a3;
- (id)existingAttachmentViewProviderForIdentifier:(id)a3;
- (id)newViewProviderForTextAttachment:(id)a3 parentView:(id)a4 location:(id)a5;
- (id)paragraphStyleForCharacterIndex:(unint64_t)a3;
- (id)renderingAttributesForLink:(id)a3 atLocation:(id)a4;
- (id)tableViewControllerForAttachment:(id)a3 createIfNeeded:(BOOL)a4;
- (id)todoButtonAtCharacterIndex:(unint64_t)a3;
- (id)todoButtonForTrackedParagraph:(id)a3;
- (id)todoButtonsForCharacterRange:(_NSRange)a3;
- (id)trackedTodoParagraphAtIndex:(unint64_t)a3;
- (id)trackedTodoParagraphForTrackingUUID:(id)a3;
- (id)viewProviderForTextAttachment:(id)a3 parentView:(id)a4 location:(id)a5;
- (id)viewProviderForTextAttachment:(id)a3 parentView:(id)a4 location:(id)a5 ignoreCache:(BOOL)a6;
- (int64_t)characterIndexForPoint:(CGPoint)a3;
- (unint64_t)lineCountForCharacterRange:(_NSRange)a3;
- (void)attachmentPreferredSizeDidChange:(id)a3;
- (void)attachmentWillBeDeleted:(id)a3;
- (void)clearCachedViewProvidersMatchingPredicate:(id)a3;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)enumerateAttachmentViewsInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)enumerateInlineAttachmentViewsInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)invalidateLayoutForRange:(id)a3;
- (void)invalidateLayoutForRanges:(id)a3;
- (void)noteEditorControllerSelectionDidChange:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reloadInlineAttachments;
- (void)setAttachmentViewDelegate:(id)a3;
- (void)setHighlightPatternRegexFinder:(id)a3;
- (void)setNeedsLayout;
- (void)setTableAttachmentViewControllers:(id)a3;
- (void)setTextContainer:(id)a3;
- (void)setTextContentManager:(id)a3;
- (void)setViewProviderCache:(id)a3;
- (void)textController:(id)a3 addedTrackedAttribute:(id)a4;
- (void)textController:(id)a3 updatedTrackedAttribute:(id)a4;
- (void)updateExistingTodoViewProviderForTrackedParagraph:(id)a3;
- (void)updateParentForTableAttachmentViewController:(id)a3;
- (void)zoomFactorOrInsetsDidChange;
@end

@implementation ICTK2TextLayoutManager

- (id)viewProviderForTextAttachment:(id)a3 parentView:(id)a4 location:(id)a5
{
  return [(ICTK2TextLayoutManager *)self viewProviderForTextAttachment:a3 parentView:a4 location:a5 ignoreCache:0];
}

void __55__ICTK2TextLayoutManager_todoButtonsForCharacterRange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "trackedTodoParagraphAtIndex:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  v3 = [*(id *)(a1 + 32) todoButtonForTrackedParagraph:v4];
  objc_msgSend(v2, "ic_addNonNilObject:", v3);
}

- (id)trackedTodoParagraphAtIndex:(unint64_t)a3
{
  id v4 = [(ICTK2TextLayoutManager *)self paragraphStyleForCharacterIndex:a3];
  v5 = [v4 todoTrackingUUID];
  v6 = [(ICTK2TextLayoutManager *)self trackedTodoParagraphForTrackingUUID:v5];

  return v6;
}

- (id)trackedTodoParagraphForTrackingUUID:(id)a3
{
  id v4 = a3;
  v5 = [(ICTK2TextLayoutManager *)self trackedToDoParagraphs];
  v6 = objc_msgSend(v5, "ic_objectForNonNilKey:", v4);

  return v6;
}

- (NSDictionary)trackedToDoParagraphs
{
  v2 = [(ICTK2TextLayoutManager *)self textController];
  v3 = [v2 trackedToDoParagraphs];

  return (NSDictionary *)v3;
}

- (id)todoButtonForTrackedParagraph:(id)a3
{
  id v4 = [a3 paragraph];
  v5 = [v4 todoTrackingUUID];
  v6 = [v5 UUIDString];

  objc_opt_class();
  v7 = [(ICTK2TextLayoutManager *)self existingAttachmentViewForIdentifier:v6];
  v8 = ICDynamicCast();

  return v8;
}

- (id)existingAttachmentViewForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(ICTK2TextLayoutManager *)self existingAttachmentViewProviderForIdentifier:v4];
    v6 = [v5 view];

    if (!v6)
    {
      v7 = [(ICTK2TextLayoutManager *)self tableAttachmentViewControllers];
      v8 = [v7 objectForKeyedSubscript:v4];
      v6 = [v8 view];
    }
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_20BE60000, v9, OS_LOG_TYPE_INFO, "Requesting existing attachment view for nil identifier", v11, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (ICTK2TextController)textController
{
  objc_opt_class();
  v3 = [(ICTK2TextLayoutManager *)self textContentStorage];
  id v4 = [v3 textStorage];
  v5 = ICDynamicCast();

  objc_opt_class();
  v6 = [v5 styler];
  v7 = ICDynamicCast();

  return (ICTK2TextController *)v7;
}

- (NSMutableDictionary)tableAttachmentViewControllers
{
  return self->_tableAttachmentViewControllers;
}

- (id)renderingAttributesForLink:(id)a3 atLocation:(id)a4
{
  v5 = (void *)MEMORY[0x263F5B288];
  id v6 = a4;
  v7 = [v5 defaultLinkTextAttributes];
  v8 = (void *)[v7 mutableCopy];

  v9 = [(ICTK2TextLayoutManager *)self textContentStorage];
  v10 = [v9 textStorage];

  v11 = [(ICTK2TextLayoutManager *)self documentRange];
  v12 = [v11 location];
  uint64_t v13 = [(ICTK2TextLayoutManager *)self offsetFromLocation:v12 toLocation:v6];

  v14 = [MEMORY[0x263F394E8] sharedController];
  v15 = [v14 preferredTextAttributesForLinkAtCharacterIndex:v13 ofStorage:v10];

  uint64_t v16 = [v15 mutableCopy];
  v17 = (void *)v16;
  if (v16) {
    v18 = (void *)v16;
  }
  else {
    v18 = v8;
  }
  id v19 = v18;

  v20 = [v10 attribute:*MEMORY[0x263F5AD78] atIndex:v13 effectiveRange:0];
  [v20 floatValue];
  double v22 = v21;

  objc_opt_class();
  uint64_t v23 = *MEMORY[0x263F81500];
  v24 = [v19 objectForKeyedSubscript:*MEMORY[0x263F81500]];
  v25 = ICDynamicCast();

  double v26 = fabs(v22);
  if (v26 >= 0.00999999978)
  {
    v27 = [MEMORY[0x263F825C8] preferredDefaultFontColor];
    v28 = objc_msgSend(v25, "ic_colorBlendedWithColor:fraction:", v27, v26);

    double v29 = v22 * 0.6 + 1.0;
    if (v29 < 0.0) {
      double v29 = 0.0;
    }
    v25 = objc_msgSend(v28, "colorWithAlphaComponent:", fmin(v29, 1.0));
  }
  objc_opt_class();
  v30 = [(ICTK2TextLayoutManager *)self textContainer];
  v31 = ICDynamicCast();

  v32 = [v31 tk2TextView];
  v33 = [v32 traitCollection];

  if (v33)
  {
    uint64_t v34 = [v25 resolvedColorWithTraitCollection:v33];

    v25 = (void *)v34;
  }
  objc_msgSend(v19, "ic_setNonNilObject:forKey:", v25, v23);
  if (v22 <= -0.1) {
    v35 = &unk_26C139090;
  }
  else {
    v35 = &unk_26C139078;
  }
  uint64_t v36 = *MEMORY[0x263F815F8];
  objc_msgSend(v19, "ic_setNonNilObject:forKey:", v35, *MEMORY[0x263F815F8]);
  v37 = [v10 attribute:*MEMORY[0x263F814A0] atIndex:v13 effectiveRange:0];
  if (v37) {
    [v19 removeObjectForKey:v36];
  }
  v38 = (void *)[v19 copy];

  return v38;
}

- (id)paragraphStyleForCharacterIndex:(unint64_t)a3
{
  id v4 = [(ICTK2TextLayoutManager *)self textContentStorage];
  v5 = [v4 textStorage];
  id v6 = [v5 attribute:*MEMORY[0x263F5AB28] atIndex:a3 effectiveRange:0];

  return v6;
}

- (NSTextContentStorage)textContentStorage
{
  objc_opt_class();
  v3 = [(ICTK2TextLayoutManager *)self textContentManager];
  id v4 = ICDynamicCast();

  return (NSTextContentStorage *)v4;
}

- (id)viewProviderForTextAttachment:(id)a3 parentView:(id)a4 location:(id)a5 ignoreCache:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v13 = [v10 viewIdentifier];
      if (!v13)
      {
        v31 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v39 = 0;
          _os_log_impl(&dword_20BE60000, v31, OS_LOG_TYPE_INFO, "Requesting view provider for nil identifier", v39, 2u);
        }
        v14 = 0;
LABEL_26:

        goto LABEL_27;
      }
      if (!a6 && (ICInternalSettingsIsViewProviderCacheDisabled() & 1) == 0)
      {
        v15 = [(ICTK2TextLayoutManager *)self viewProviderCache];
        v14 = [v15 objectForKeyedSubscript:v13];

        if (v14)
        {
          id v16 = [v14 textAttachment];

          if (v16 == v10)
          {
            if (objc_opt_respondsToSelector()) {
              [v14 setUpdatedLocationForRecycledViewProvider:v12];
            }
            goto LABEL_21;
          }
          v17 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            -[ICTK2TextLayoutManager viewProviderForTextAttachment:parentView:location:ignoreCache:]();
          }
        }
      }
      v18 = [(ICTK2TextLayoutManager *)self viewProviderClassForTextAttachment:v10];
      id v19 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[ICTK2TextLayoutManager viewProviderForTextAttachment:parentView:location:ignoreCache:](v18, (uint64_t)v13, v19);
      }

      id v38 = v12;
      v14 = (void *)[[v18 alloc] initWithTextAttachment:v10 parentView:v11 textLayoutManager:self location:v12];
      v20 = [(ICTK2TextLayoutManager *)self highlightPatternRegexFinder];
      objc_opt_class();
      float v21 = ICDynamicCast();
      [v21 setHighlightPatternRegexFinder:v20];

      objc_opt_class();
      double v22 = [(ICTK2TextLayoutManager *)self textContainer];
      uint64_t v23 = ICDynamicCast();

      v24 = [v23 tk2TextView];

      if (v24)
      {
        objc_opt_class();
        [v10 attachment];
        v25 = id v37 = v11;
        double v26 = ICDynamicCast();
        v27 = [v26 documentMergeController];
        v28 = [v23 tk2TextView];
        [v27 addTextView:v28];

        id v11 = v37;
      }
      if (!a6)
      {
        double v29 = [(ICTK2TextLayoutManager *)self viewProviderCache];
        [v29 setObject:v14 forKeyedSubscript:v13];
      }
      id v12 = v38;
LABEL_21:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_27;
      }
      objc_opt_class();
      v30 = [v14 view];
      v31 = ICDynamicCast();

      v32 = [v10 todo];
      -[NSObject setDone:](v31, "setDone:", [v32 done]);
      v33 = [(ICTK2TextLayoutManager *)self trackedToDoParagraphs];
      uint64_t v34 = [v32 uuid];
      v35 = objc_msgSend(v33, "ic_objectForNonNilKey:", v34);
      [v31 setTrackedParagraph:v35];

      goto LABEL_26;
    }
  }
  uint64_t v13 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20BE60000, v13, OS_LOG_TYPE_INFO, "Requesting view provider for nil text attachment", buf, 2u);
  }
  v14 = 0;
LABEL_27:

  return v14;
}

- (id)existingAttachmentViewProviderForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(ICTK2TextLayoutManager *)self viewProviderCache];
    id v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20BE60000, v7, OS_LOG_TYPE_INFO, "Requesting existing attachment view provider for nil identifier", v9, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

- (NSMutableDictionary)viewProviderCache
{
  return self->_viewProviderCache;
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (void)viewProviderForTextAttachment:(NSObject *)a3 parentView:location:ignoreCache:.cold.1(objc_class *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_2();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_20BE60000, a3, OS_LOG_TYPE_DEBUG, "Creating new view provider of type %@ for attachment %@", v6, 0x16u);
}

- (Class)viewProviderClassForTextAttachment:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_2;
  }
  v5 = (void *)MEMORY[0x263F81678];
  id v6 = [v3 fileType];
  __int16 v7 = (void *)[v5 textAttachmentViewProviderClassForFileType:v6];

  if (!v7)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
LABEL_2:
    objc_opt_class();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  id v4 = v7;
LABEL_5:
  uint64_t v8 = v4;

  return (Class)v8;
}

- (ICAttachmentViewDelegate)attachmentViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentViewDelegate);

  return (ICAttachmentViewDelegate *)WeakRetained;
}

- (void)setTextContainer:(id)a3
{
  id v4 = a3;
  v5 = ICKeyPathFromSelectors();
  id v6 = [(ICTK2TextLayoutManager *)self textContainer];

  if (v6)
  {
    __int16 v7 = [(ICTK2TextLayoutManager *)self textContainer];
    objc_msgSend(v7, "ic_removeObserver:forKeyPath:context:", self, v5, &compoundliteral_1);
  }
  v9.receiver = self;
  v9.super_class = (Class)ICTK2TextLayoutManager;
  [(ICTK2TextLayoutManager *)&v9 setTextContainer:v4];
  uint64_t v8 = [(ICTK2TextLayoutManager *)self textContainer];
  objc_msgSend(v8, "ic_addObserver:forKeyPath:context:", self, v5, &compoundliteral_1);
}

- (ICTK2TextLayoutManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)ICTK2TextLayoutManager;
  v2 = [(ICTK2TextLayoutManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    tableAttachmentViewControllers = v2->_tableAttachmentViewControllers;
    v2->_tableAttachmentViewControllers = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    viewProviderCache = v2->_viewProviderCache;
    v2->_viewProviderCache = (NSMutableDictionary *)v5;

    __int16 v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel_attachmentPreferredSizeDidChange_ name:*MEMORY[0x263F5A938] object:0];
    [v7 addObserver:v2 selector:sel_attachmentWillBeDeleted_ name:*MEMORY[0x263F5A9C0] object:0];
    [v7 addObserver:v2 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x263F83428] object:0];
    [v7 addObserver:v2 selector:sel_noteEditorControllerSelectionDidChange_ name:@"ICNoteEditorViewControllerSelectionDidChangeNotification" object:0];
  }
  return v2;
}

void __53__ICTK2TextLayoutManager_zoomFactorOrInsetsDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [*(id *)(a1 + 32) tableViewControllerForAttachment:v4 createIfNeeded:0];
    [v3 zoomFactorOrInsetsDidChange];
  }
}

- (void)zoomFactorOrInsetsDidChange
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ICTK2TextLayoutManager *)self textContentStorage];
  id v4 = [v3 textStorage];

  uint64_t v5 = *MEMORY[0x263F814A0];
  uint64_t v6 = objc_msgSend(v4, "ic_range");
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __53__ICTK2TextLayoutManager_zoomFactorOrInsetsDidChange__block_invoke;
  v26[3] = &unk_2640B98D0;
  v26[4] = self;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, v6, v7, 0, v26);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = [(ICTK2TextLayoutManager *)self textContentStorage];
  objc_super v9 = [v8 textStorage];
  uint64_t v10 = objc_msgSend(v9, "ic_range");
  id v12 = -[ICTK2TextLayoutManager todoButtonsForCharacterRange:](self, "todoButtonsForCharacterRange:", v10, v11);

  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v22 + 1) + 8 * v16) trackedParagraph];
        v18 = [v17 paragraph];
        id v19 = [v18 todoTrackingUUID];
        v20 = [v19 UUIDString];

        float v21 = [(ICTK2TextLayoutManager *)self viewProviderCache];
        objc_msgSend(v21, "ic_removeObjectForNonNilKey:", v20);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v14);
  }
}

- (id)todoButtonsForCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [(ICTK2TextLayoutManager *)self textContentStorage];
  uint64_t v8 = [v7 textStorage];
  uint64_t v9 = *MEMORY[0x263F5AB28];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __55__ICTK2TextLayoutManager_todoButtonsForCharacterRange___block_invoke;
  uint64_t v16 = &unk_2640B8EA0;
  v17 = self;
  id v18 = v6;
  id v10 = v6;
  objc_msgSend(v8, "ic_enumerateUnclampedAttribute:inRange:options:usingBlock:", v9, location, length, 0, &v13);

  uint64_t v11 = objc_msgSend(v10, "copy", v13, v14, v15, v16, v17);

  return v11;
}

- (void)setAttachmentViewDelegate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_storeWeak((id *)&self->_attachmentViewDelegate, v4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(ICTK2TextLayoutManager *)self viewProviderCache];
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        id v12 = [v11 view];
        uint64_t v13 = ICDynamicCast();

        [v13 setDelegate:v4];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)setTextContentManager:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(ICTK2TextLayoutManager *)self tableAttachmentViewControllers];
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v11 willMoveToParentViewController:0];
        [v11 removeFromParentViewController];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [(ICTK2TextLayoutManager *)self tableAttachmentViewControllers];
  [v12 removeAllObjects];

  [(ICTK2TextLayoutManager *)self clearCachedViewProvidersMatchingPredicate:0];
  v13.receiver = self;
  v13.super_class = (Class)ICTK2TextLayoutManager;
  [(ICTK2TextLayoutManager *)&v13 setTextContentManager:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(ICTK2TextLayoutManager *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/Common/TextAttachmentUI/ICTK2TextLayoutManager.m"])
  {
    char v13 = [(ICTK2TextLayoutManager *)self ic_shouldIgnoreObserveValue:v12 ofObject:v11 forKeyPath:v10];
    if (a6 == &compoundliteral_1 && (v13 & 1) == 0)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v14 = [(ICTK2TextLayoutManager *)self tableAttachmentViewControllers];
      long long v15 = [v14 allValues];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v21;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v21 != v18) {
              objc_enumerationMutation(v15);
            }
            [(ICTK2TextLayoutManager *)self updateParentForTableAttachmentViewController:*(void *)(*((void *)&v20 + 1) + 8 * v19++)];
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v17);
      }
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)ICTK2TextLayoutManager;
    [(ICTK2TextLayoutManager *)&v24 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)clearCachedViewProvidersMatchingPredicate:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = (uint64_t (**)(id, void *))a3;
  if (v4)
  {
    uint64_t v18 = [MEMORY[0x263EFF9C0] set];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = [(ICTK2TextLayoutManager *)self viewProviderCache];
    uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          id v10 = [(ICTK2TextLayoutManager *)self viewProviderCache];
          id v11 = [v10 objectForKeyedSubscript:v9];
          int v12 = v4[2](v4, v11);

          if (v12) {
            [v18 addObject:v9];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }

    char v13 = os_log_create("com.apple.notes", "UI");
    long long v14 = v18;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[ICTK2TextLayoutManager clearCachedViewProvidersMatchingPredicate:]();
    }

    long long v15 = [(ICTK2TextLayoutManager *)self viewProviderCache];
    uint64_t v16 = [v18 allObjects];
    [v15 removeObjectsForKeys:v16];
  }
  else
  {
    uint64_t v17 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[ICTK2TextLayoutManager clearCachedViewProvidersMatchingPredicate:](v17);
    }

    long long v14 = [(ICTK2TextLayoutManager *)self viewProviderCache];
    [v14 removeAllObjects];
  }
}

- (void)clearCachedViewProvidersMatchingPredicate:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20BE60000, log, OS_LOG_TYPE_DEBUG, "Clearing all cached view providers", v1, 2u);
}

- (void)invalidateLayoutForRange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    if (([v4 isEmpty] & 1) == 0)
    {
      uint64_t v5 = [MEMORY[0x263EFFA08] setWithObject:v6];
      [(ICTK2TextLayoutManager *)self invalidateLayoutForRanges:v5];
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)invalidateLayoutForRanges:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICTK2TextLayoutManager invalidateLayoutForRanges:](v4, v5);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v12.receiver = self;
        v12.super_class = (Class)ICTK2TextLayoutManager;
        [(ICTK2TextLayoutManager *)&v12 invalidateLayoutForRange:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if ([v6 count]) {
    [(ICTK2TextLayoutManager *)self setNeedsLayout];
  }
}

- (void)setNeedsLayout
{
  objc_opt_class();
  uint64_t v3 = [(ICTK2TextLayoutManager *)self textContainer];
  ICDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [v5 tk2TextView];
  [v4 setNeedsLayout];
}

- (void)invalidateLayoutForRanges:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  [a1 count];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_20BE60000, a2, OS_LOG_TYPE_DEBUG, "Invalidating text layout for %lu ranges", v3, 0xCu);
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICTK2TextLayoutManager;
  [(ICTK2TextLayoutManager *)&v4 dealloc];
}

- (id)newViewProviderForTextAttachment:(id)a3 parentView:(id)a4 location:(id)a5
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tableViewControllerForAttachment:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20BE60000, v8, OS_LOG_TYPE_INFO, "Requesting table view controller for nil text attachment", buf, 2u);
    }
    goto LABEL_12;
  }
  uint64_t v8 = [v6 viewIdentifier];
  if (!v8)
  {
    long long v15 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_20BE60000, v15, OS_LOG_TYPE_INFO, "Requesting table view controller for nil identifier", v17, 2u);
    }

LABEL_12:
    id v10 = 0;
    goto LABEL_15;
  }
  uint64_t v9 = [(ICTK2TextLayoutManager *)self tableAttachmentViewControllers];
  id v10 = [v9 objectForKeyedSubscript:v8];

  if (!v10 && v4)
  {
    uint64_t v11 = [(ICTK2TextLayoutManager *)self textContentStorage];
    objc_super v12 = [v11 attributedString];
    int v13 = objc_msgSend(v12, "ic_containsTextAttachment:", v7);

    if (v13)
    {
      id v10 = [(ICTableAttachmentViewController *)[ICiOSTableAttachmentViewController alloc] initWithTextAttachment:v7 forManualRendering:0 textLayoutManager:self];
      long long v14 = [(ICTK2TextLayoutManager *)self tableAttachmentViewControllers];
      [v14 setObject:v10 forKeyedSubscript:v8];
    }
    else
    {
      id v10 = 0;
    }
  }
  [(ICTK2TextLayoutManager *)self updateParentForTableAttachmentViewController:v10];
LABEL_15:

  return v10;
}

- (_NSRange)rangeForAttachment:(id)a3 withTextAttachment:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(ICTK2TextLayoutManager *)self textContentStorage];
  uint64_t v8 = [v7 textStorage];
  uint64_t v9 = objc_msgSend(v8, "ic_rangeForAttachment:withTextAttachment:", v6, a4);
  NSUInteger v11 = v10;

  NSUInteger v12 = v9;
  NSUInteger v13 = v11;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (void)enumerateAttachmentViewsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  uint64_t v8 = [(ICTK2TextLayoutManager *)self textContentStorage];
  uint64_t v9 = [v8 textStorage];
  uint64_t v10 = *MEMORY[0x263F814A0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__ICTK2TextLayoutManager_enumerateAttachmentViewsInRange_usingBlock___block_invoke;
  v12[3] = &unk_2640B9050;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, location, length, 0, v12);
}

uint64_t __69__ICTK2TextLayoutManager_enumerateAttachmentViewsInRange_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v16 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v16;
    objc_opt_class();
    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = [v9 viewIdentifier];
    NSUInteger v12 = [v10 existingAttachmentViewForIdentifier:v11];
    id v13 = ICDynamicCast();

    if (v13)
    {
      uint64_t v14 = *(void *)(a1 + 40);
      if (v14) {
        (*(void (**)(uint64_t, void *, id, uint64_t, uint64_t, uint64_t))(v14 + 16))(v14, v13, v9, a3, a4, a5);
      }
    }
  }

  return MEMORY[0x270F9A758]();
}

- (void)enumerateInlineAttachmentViewsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  uint64_t v8 = [(ICTK2TextLayoutManager *)self textContentStorage];
  id v9 = [v8 textStorage];
  uint64_t v10 = *MEMORY[0x263F814A0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__ICTK2TextLayoutManager_enumerateInlineAttachmentViewsInRange_usingBlock___block_invoke;
  v12[3] = &unk_2640B9050;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, location, length, 0, v12);
}

uint64_t __75__ICTK2TextLayoutManager_enumerateInlineAttachmentViewsInRange_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v16 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v16;
    objc_opt_class();
    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = [v9 viewIdentifier];
    NSUInteger v12 = [v10 existingAttachmentViewForIdentifier:v11];
    id v13 = ICDynamicCast();

    if (v13)
    {
      uint64_t v14 = *(void *)(a1 + 40);
      if (v14) {
        (*(void (**)(uint64_t, void *, id, uint64_t, uint64_t, uint64_t))(v14 + 16))(v14, v13, v9, a3, a4, a5);
      }
    }
  }

  return MEMORY[0x270F9A758]();
}

- (id)todoButtonAtCharacterIndex:(unint64_t)a3
{
  uint64_t v3 = -[ICTK2TextLayoutManager todoButtonsForCharacterRange:](self, "todoButtonsForCharacterRange:", a3, 0);
  BOOL v4 = [v3 firstObject];

  return v4;
}

- (unint64_t)lineCountForCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [(ICTK2TextLayoutManager *)self documentRange];
  id v7 = [v6 location];
  uint64_t v8 = [(ICTK2TextLayoutManager *)self locationFromLocation:v7 withOffset:location];

  id v9 = [(ICTK2TextLayoutManager *)self locationFromLocation:v8 withOffset:length];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F816E0]) initWithLocation:v8 endLocation:v9];
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0xBFF0000000000000;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__ICTK2TextLayoutManager_lineCountForCharacterRange___block_invoke;
  v14[3] = &unk_2640B9880;
  id v11 = v10;
  id v15 = v11;
  id v16 = v18;
  uint64_t v17 = &v19;
  [(ICTK2TextLayoutManager *)self enumerateTextSegmentsInRange:v11 type:0 options:0 usingBlock:v14];
  unint64_t v12 = v20[3];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);

  return v12;
}

uint64_t __53__ICTK2TextLayoutManager_lineCountForCharacterRange___block_invoke(void *a1, void *a2, double a3, double a4)
{
  uint64_t result = [a2 intersectsWithTextRange:a1[4]];
  if (result)
  {
    uint64_t v7 = *(void *)(a1[5] + 8);
    if (*(double *)(v7 + 24) != a4)
    {
      ++*(void *)(*(void *)(a1[6] + 8) + 24);
      uint64_t v7 = *(void *)(a1[5] + 8);
    }
    *(double *)(v7 + 24) = a4;
  }
  return result;
}

- (_NSRange)characterRangeForBoundingRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__5;
  uint64_t v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__5;
  long long v20 = __Block_byref_object_dispose__5;
  id v21 = 0;
  uint64_t v8 = [(ICTK2TextLayoutManager *)self documentRange];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__ICTK2TextLayoutManager_characterRangeForBoundingRect___block_invoke;
  v15[3] = &unk_2640B98A8;
  *(CGFloat *)&v15[6] = x;
  *(CGFloat *)&v15[7] = y;
  *(CGFloat *)&v15[8] = width;
  *(CGFloat *)&v15[9] = height;
  v15[4] = &v22;
  v15[5] = &v16;
  [(ICTK2TextLayoutManager *)self enumerateTextSegmentsInRange:v8 type:0 options:0 usingBlock:v15];

  if (v23[5] && v17[5])
  {
    id v9 = [(ICTK2TextLayoutManager *)self documentRange];
    uint64_t v10 = [v9 location];
    uint64_t v11 = [(ICTK2TextLayoutManager *)self offsetFromLocation:v10 toLocation:v23[5]];

    uint64_t v12 = [(ICTK2TextLayoutManager *)self offsetFromLocation:v23[5] toLocation:v17[5]];
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  NSUInteger v13 = v11;
  NSUInteger v14 = v12;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

BOOL __56__ICTK2TextLayoutManager_characterRangeForBoundingRect___block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  id v8 = a2;
  id v9 = a3;
  double v10 = *(double *)(a1 + 56);
  double v11 = v10 + *(double *)(a1 + 72);
  if (a5 >= v10 && a5 <= v11)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      uint64_t v13 = [v8 location];
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    uint64_t v16 = [v8 endLocation];
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
  return a5 <= v11;
}

- (int64_t)characterIndexForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_opt_class();
  id v6 = [(ICTK2TextLayoutManager *)self textContainer];
  uint64_t v7 = ICDynamicCast();
  id v8 = [v7 tk2TextView];

  [v8 textContainerInset];
  double v10 = x - v9;
  [v8 textContainerInset];
  double v12 = y - v11;
  uint64_t v13 = -[ICTK2TextLayoutManager textLayoutFragmentForPosition:](self, "textLayoutFragmentForPosition:", v10, v12);
  [v13 layoutFragmentFrame];
  double v15 = v10 - v14;
  double v17 = v12 - v16;
  uint64_t v18 = [v13 textLineFragmentForVerticalOffset:0 requiresExactMatch:v17];
  [v18 typographicBounds];
  uint64_t v21 = objc_msgSend(v18, "characterIndexForPoint:", v15 - v19, v17 - v20);
  uint64_t v22 = [v13 rangeInElement];
  int64_t v23 = [(ICTK2TextLayoutManager *)self ic_rangeForTextRange:v22] + v21;

  return v23;
}

- (void)reloadInlineAttachments
{
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  BOOL v4 = [(ICTK2TextLayoutManager *)self textContentStorage];
  id v5 = [v4 textStorage];
  uint64_t v6 = objc_msgSend(v5, "ic_range");
  uint64_t v8 = v7;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  double v12 = __49__ICTK2TextLayoutManager_reloadInlineAttachments__block_invoke;
  uint64_t v13 = &unk_2640B98F8;
  double v14 = self;
  id v15 = v3;
  id v9 = v3;
  -[ICTK2TextLayoutManager enumerateInlineAttachmentViewsInRange:usingBlock:](self, "enumerateInlineAttachmentViewsInRange:usingBlock:", v6, v8, &v10);

  -[ICTK2TextLayoutManager invalidateLayoutForRanges:](self, "invalidateLayoutForRanges:", v9, v10, v11, v12, v13, v14);
}

void __49__ICTK2TextLayoutManager_reloadInlineAttachments__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend(*(id *)(a1 + 32), "ic_textRangeForRange:", a4, a5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "ic_addNonNilObject:", v6);
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, a3);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = [(ICTK2TextLayoutManager *)self viewProviderCache];
  uint64_t v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_opt_class();
        double v12 = ICDynamicCast();
        [v12 setHighlightPatternRegexFinder:v5];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(ICTK2TextLayoutManager *)self textContentStorage];
  double v14 = [v13 textStorage];
  uint64_t v15 = objc_msgSend(v14, "ic_range");
  uint64_t v17 = v16;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __57__ICTK2TextLayoutManager_setHighlightPatternRegexFinder___block_invoke;
  v27[3] = &unk_2640B90A0;
  id v18 = v5;
  id v28 = v18;
  -[ICTK2TextLayoutManager enumerateAttachmentViewsInRange:usingBlock:](self, "enumerateAttachmentViewsInRange:usingBlock:", v15, v17, v27);

  double v19 = [(ICTK2TextLayoutManager *)self textContentStorage];
  double v20 = [v19 textStorage];
  uint64_t v21 = objc_msgSend(v20, "ic_range");
  uint64_t v23 = v22;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __57__ICTK2TextLayoutManager_setHighlightPatternRegexFinder___block_invoke_2;
  v25[3] = &unk_2640B9920;
  id v26 = v18;
  id v24 = v18;
  -[ICTK2TextLayoutManager enumerateInlineAttachmentViewsInRange:usingBlock:](self, "enumerateInlineAttachmentViewsInRange:usingBlock:", v21, v23, v25);
}

uint64_t __57__ICTK2TextLayoutManager_setHighlightPatternRegexFinder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHighlightPatternRegexFinder:*(void *)(a1 + 32)];
}

uint64_t __57__ICTK2TextLayoutManager_setHighlightPatternRegexFinder___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setHighlightPatternRegexFinder:*(void *)(a1 + 32)];
}

- (void)textController:(id)a3 addedTrackedAttribute:(id)a4
{
}

- (void)textController:(id)a3 updatedTrackedAttribute:(id)a4
{
}

- (void)attachmentPreferredSizeDidChange:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];
  id v6 = ICDynamicCast();

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    if (objc_msgSend(v6, "ic_isModernNoteType"))
    {
      id v22 = v4;
      uint64_t v8 = [MEMORY[0x263F5ACA0] sharedContext];
      uint64_t v9 = [v8 workerManagedObjectContext];

      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __59__ICTK2TextLayoutManager_attachmentPreferredSizeDidChange___block_invoke;
      v35[3] = &unk_2640B89A8;
      id v36 = v9;
      id v37 = v6;
      id v38 = v7;
      id v10 = v9;
      [v10 performBlockAndWait:v35];
    }
    else
    {
      if (!objc_msgSend(v6, "ic_isAttachmentType"))
      {
        uint64_t v21 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20BE60000, v21, OS_LOG_TYPE_INFO, "Ignoring preferred size change notification for unknown type", buf, 2u);
        }
        goto LABEL_9;
      }
      id v22 = v4;
      [v7 addObject:v6];
    }
    uint64_t v11 = [MEMORY[0x263EFF9C0] set];
    double v12 = [MEMORY[0x263EFF9C0] set];
    uint64_t v13 = [(ICTK2TextLayoutManager *)self textContentStorage];
    double v14 = [v13 textStorage];

    *(void *)buf = 0;
    long long v32 = buf;
    uint64_t v33 = 0x2020000000;
    uint64_t v34 = 0;
    uint64_t v15 = objc_msgSend(v14, "ic_range");
    uint64_t v17 = v16;
    uint64_t v18 = *MEMORY[0x263F814A0];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __59__ICTK2TextLayoutManager_attachmentPreferredSizeDidChange___block_invoke_63;
    v25[3] = &unk_2640B9948;
    id v26 = v7;
    id v19 = v11;
    id v27 = v19;
    id v20 = v12;
    id v28 = v20;
    long long v29 = self;
    long long v30 = buf;
    objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v18, v15, v17, 0, v25);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __59__ICTK2TextLayoutManager_attachmentPreferredSizeDidChange___block_invoke_2;
    v23[3] = &unk_2640B9970;
    uint64_t v21 = v19;
    id v24 = v21;
    [(ICTK2TextLayoutManager *)self clearCachedViewProvidersMatchingPredicate:v23];
    [(ICTK2TextLayoutManager *)self invalidateLayoutForRanges:v20];

    _Block_object_dispose(buf, 8);
    id v4 = v22;
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v7 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20BE60000, v7, OS_LOG_TYPE_INFO, "Ignoring preferred size change notification with nil object ID", buf, 2u);
  }
LABEL_10:
}

void __59__ICTK2TextLayoutManager_attachmentPreferredSizeDidChange___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(*(id *)(a1 + 32), "ic_existingObjectWithID:", *(void *)(a1 + 40));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = objc_msgSend(v2, "attachments", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(a1 + 48);
        uint64_t v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) objectID];
        [v8 addObject:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

void __59__ICTK2TextLayoutManager_attachmentPreferredSizeDidChange___block_invoke_63(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  id v9 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  long long v10 = [v15 attachment];
  long long v11 = [v10 objectID];

  if (v11 && [*(id *)(a1 + 32) containsObject:v11])
  {
    if ([v15 supportsMultiplePresentationSizes])
    {
      [*(id *)(a1 + 40) addObject:v15];
      long long v12 = *(void **)(a1 + 48);
      long long v13 = objc_msgSend(*(id *)(a1 + 56), "ic_textRangeForRange:", a3, a4);
      objc_msgSend(v12, "ic_addNonNilObject:", v13);
    }
    uint64_t v14 = ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    *a5 = v14 == [*(id *)(a1 + 32) count];
  }
}

uint64_t __59__ICTK2TextLayoutManager_attachmentPreferredSizeDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 textAttachment];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)attachmentWillBeDeleted:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = [v3 object];

  uint64_t v5 = ICDynamicCast();
  uint64_t v6 = [v5 identifier];

  if (v6)
  {
    id v8 = v6;
    performBlockOnMainThread();
  }
  else
  {
    uint64_t v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20BE60000, v7, OS_LOG_TYPE_INFO, "Ignoring attachment deleted notification with nil identifier", buf, 2u);
    }
  }
}

void __50__ICTK2TextLayoutManager_attachmentWillBeDeleted___block_invoke(uint64_t a1)
{
  id v3 = (void *)(a1 + 40);
  v2 = *(void **)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __50__ICTK2TextLayoutManager_attachmentWillBeDeleted___block_invoke_2;
  v15[3] = &unk_2640B9970;
  id v16 = v2;
  [v4 clearCachedViewProvidersMatchingPredicate:v15];
  uint64_t v5 = [(id)*(v3 - 1) tableAttachmentViewControllers];
  uint64_t v6 = [v5 objectForKeyedSubscript:*v3];

  if (v6)
  {
    uint64_t v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __50__ICTK2TextLayoutManager_attachmentWillBeDeleted___block_invoke_cold_1((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);
    }

    uint64_t v14 = [*(id *)(a1 + 32) tableAttachmentViewControllers];
    [v14 removeObjectForKey:*(void *)(a1 + 40)];

    [v6 willMoveToParentViewController:0];
    [v6 removeFromParentViewController];
  }
}

uint64_t __50__ICTK2TextLayoutManager_attachmentWillBeDeleted___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = [v3 textAttachment];

  uint64_t v5 = ICDynamicCast();

  uint64_t v6 = [v5 viewIdentifier];
  uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  return v7;
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  uint64_t v4 = [(ICTK2TextLayoutManager *)self textContentStorage];
  uint64_t v5 = [v4 textStorage];

  uint64_t v6 = *MEMORY[0x263F814A0];
  uint64_t v7 = objc_msgSend(v5, "ic_range");
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__ICTK2TextLayoutManager_contentSizeCategoryDidChange___block_invoke;
  v9[3] = &unk_2640B98D0;
  v9[4] = self;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v6, v7, v8, 0, v9);
}

void __55__ICTK2TextLayoutManager_contentSizeCategoryDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v4 = *(void **)(a1 + 32);
    if (isKindOfClass)
    {
      uint64_t v5 = [v4 tableViewControllerForAttachment:v7 createIfNeeded:0];
    }
    else
    {
      uint64_t v6 = [v7 viewIdentifier];
      uint64_t v5 = [v4 existingAttachmentViewForIdentifier:v6];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_6:

        goto LABEL_7;
      }
    }
    [v5 contentSizeCategoryDidChange];
    goto LABEL_6;
  }
LABEL_7:
}

- (void)noteEditorControllerSelectionDidChange:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  objc_opt_class();
  uint64_t v4 = [(ICTK2TextLayoutManager *)self textContainer];
  uint64_t v5 = ICDynamicCast();

  uint64_t v6 = [v5 tk2TextView];
  uint64_t v7 = [v6 selectedRange];
  uint64_t v9 = v8;

  uint64_t v10 = [(ICTK2TextLayoutManager *)self textController];
  uint64_t v11 = [(ICTK2TextLayoutManager *)self textContentStorage];
  uint64_t v12 = [v11 textStorage];
  uint64_t v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v7, v9);
  v16[0] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  id v15 = [v5 tk2TextView];
  [v10 updateAttachmentsSelectionStateInTextStorage:v12 forSelectedRanges:v14 textView:v15];
}

- (void)updateExistingTodoViewProviderForTrackedParagraph:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 paragraph];
  uint64_t v5 = [v4 todo];

  uint64_t v6 = [(ICTK2TextLayoutManager *)self viewProviderCache];
  uint64_t v7 = [v5 uuid];
  uint64_t v8 = [v7 UUIDString];
  uint64_t v9 = [v6 objectForKeyedSubscript:v8];

  if (v9)
  {
    uint64_t v10 = [v9 textAttachment];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_opt_class();
      uint64_t v12 = [v9 view];
      uint64_t v13 = ICDynamicCast();

      objc_msgSend(v13, "setDone:", objc_msgSend(v5, "done"));
      [v13 setTrackedParagraph:v14];
    }
  }
}

- (void)updateParentForTableAttachmentViewController:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  uint64_t v4 = [(ICTK2TextLayoutManager *)self textContainer];
  uint64_t v5 = ICDynamicCast();

  uint64_t v6 = [v5 tk2TextView];
  uint64_t v7 = [v6 editorController];

  if (v9)
  {
    if (v7)
    {
      uint64_t v8 = [v9 parentViewController];

      if (v8 != v7)
      {
        [v7 addChildViewController:v9];
        [v9 didMoveToParentViewController:v7];
      }
    }
  }
}

- (void)setTableAttachmentViewControllers:(id)a3
{
}

- (void)setViewProviderCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewProviderCache, 0);
  objc_storeStrong((id *)&self->_tableAttachmentViewControllers, 0);
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);

  objc_destroyWeak((id *)&self->_attachmentViewDelegate);
}

void __50__ICTK2TextLayoutManager_attachmentWillBeDeleted___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)viewProviderForTextAttachment:parentView:location:ignoreCache:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_20BE60000, v0, v1, "Attachment for identifier %@ has changed. Assigning new view provider.", v2, v3, v4, v5, v6);
}

- (void)clearCachedViewProvidersMatchingPredicate:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_20BE60000, v0, v1, "Clearing cached view providers with identifiers: %@", v2, v3, v4, v5, v6);
}

@end