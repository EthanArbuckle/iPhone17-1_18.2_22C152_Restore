@interface ICInlineDrawingTextAttachment
- (BOOL)canDragWithoutSelecting;
- (BOOL)isHandlingDrawingDidChange;
- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7;
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (ICDrawingHashtagsAndMentionsController)hashtagsAndMentionsController;
- (ICInlineDrawingChangeCoalescer)changeCoalescer;
- (NSHashTable)inlineDrawingViews;
- (UIView)cachedControlViewForPlaceView;
- (UIView)cachedDrawingViewForPlaceView;
- (id)_image;
- (id)attachmentAsNSTextAttachment;
- (id)attachmentViews;
- (id)contents;
- (id)inlineViews;
- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 textContainer:(id)a5;
- (id)viewProviderForParentView:(id)a3 characterIndex:(unint64_t)a4 layoutManager:(id)a5;
- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5;
- (void)configureHashtagAndMentionsForView:(id)a3;
- (void)detachView;
- (void)detachView:(id)a3 fromParentView:(id)a4;
- (void)drawingDataDidChange:(id)a3 view:(id)a4;
- (void)placeView:(id)a3 withFrame:(CGRect)a4 inParentView:(id)a5 characterIndex:(unint64_t)a6 layoutManager:(id)a7;
- (void)resetZoom;
- (void)saveIfNeeded;
- (void)setCachedControlViewForPlaceView:(id)a3;
- (void)setCachedDrawingViewForPlaceView:(id)a3;
- (void)setChangeCoalescer:(id)a3;
- (void)setHashtagsAndMentionsController:(id)a3;
- (void)setInlineDrawingViews:(id)a3;
- (void)setIsHandlingDrawingDidChange:(BOOL)a3;
@end

@implementation ICInlineDrawingTextAttachment

- (BOOL)canDragWithoutSelecting
{
  return 0;
}

- (void)saveIfNeeded
{
}

- (void)detachView
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(ICInlineDrawingTextAttachment *)self inlineDrawingViews];
  v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v10 = [v9 superview];
        [(ICInlineDrawingTextAttachment *)self detachView:v9 fromParentView:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)inlineViews
{
  v2 = [(ICInlineDrawingTextAttachment *)self inlineDrawingViews];
  v3 = [v2 allObjects];

  return v3;
}

- (id)attachmentViews
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(ICInlineDrawingTextAttachment *)self inlineDrawingViews];
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(ICInlineDrawingTextAttachment *)self inlineDrawingViews];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_opt_class();
        long long v12 = ICCheckedDynamicCast();
        if (v12) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  long long v13 = (void *)[v5 copy];
  return v13;
}

- (ICInlineDrawingChangeCoalescer)changeCoalescer
{
  if (!self->_changeCoalescer)
  {
    v3 = [(ICAbstractTextAttachment *)self attachment];

    if (v3)
    {
      v4 = [ICInlineDrawingChangeCoalescer alloc];
      uint64_t v5 = [(ICAbstractTextAttachment *)self attachment];
      uint64_t v6 = [(ICInlineDrawingChangeCoalescer *)v4 initWithAttachment:v5];
      changeCoalescer = self->_changeCoalescer;
      self->_changeCoalescer = v6;
    }
  }
  uint64_t v8 = self->_changeCoalescer;
  return v8;
}

- (ICDrawingHashtagsAndMentionsController)hashtagsAndMentionsController
{
  if (!self->_hashtagsAndMentionsController)
  {
    v3 = [(ICAbstractTextAttachment *)self attachment];

    if (v3)
    {
      v4 = [ICDrawingHashtagsAndMentionsController alloc];
      uint64_t v5 = [(ICAbstractTextAttachment *)self attachment];
      uint64_t v6 = [(ICDrawingHashtagsAndMentionsController *)v4 initWithAttachment:v5];
      hashtagsAndMentionsController = self->_hashtagsAndMentionsController;
      self->_hashtagsAndMentionsController = v6;
    }
  }
  uint64_t v8 = self->_hashtagsAndMentionsController;
  return v8;
}

- (NSHashTable)inlineDrawingViews
{
  inlineDrawingViews = self->_inlineDrawingViews;
  if (!inlineDrawingViews)
  {
    v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v5 = self->_inlineDrawingViews;
    self->_inlineDrawingViews = v4;

    inlineDrawingViews = self->_inlineDrawingViews;
  }
  return inlineDrawingViews;
}

- (id)contents
{
  v2 = [(ICAbstractTextAttachment *)self attachment];
  v3 = [v2 mergeableData];

  return v3;
}

- (id)attachmentAsNSTextAttachment
{
  v2 = [(ICAbstractTextAttachment *)self attachment];
  v3 = [v2 fallbackImageData];

  id v4 = objc_alloc(MEMORY[0x1E4FB0870]);
  uint64_t v5 = [MEMORY[0x1E4F832A0] fallbackImageUTI];
  uint64_t v6 = (void *)[v4 initWithData:v3 ofType:v5];

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithData:", v3);
  [v6 setImage:v7];

  return v6;
}

- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 textContainer:(id)a5
{
  id v32 = a4;
  id v30 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__ICInlineDrawingTextAttachment_printableTextContentForAppearanceType_traitCollection_textContainer___block_invoke;
  aBlock[3] = &unk_1E5FD8DF0;
  aBlock[4] = self;
  uint64_t v8 = (void (**)(void))_Block_copy(aBlock);
  if ([(ICInlineDrawingChangeCoalescer *)self->_changeCoalescer hasChanges]) {
    v8[2](v8);
  }
  uint64_t v9 = [(ICAbstractTextAttachment *)self attachment];
  uint64_t v10 = [v9 fallbackImageData];

  if (!v10)
  {
    v8[2](v8);
    long long v11 = [(ICAbstractTextAttachment *)self attachment];
    uint64_t v10 = [v11 fallbackImageData];

    if (!v10)
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9B8] data];
    }
  }
  long long v12 = [ICPrintableTextAttachment alloc];
  long long v13 = [MEMORY[0x1E4F832A0] fallbackImageUTI];
  long long v14 = [(ICPrintableTextAttachment *)v12 initWithData:v10 ofType:v13];

  long long v15 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v14];
  uint64_t v16 = [v10 length];
  long long v17 = (long long *)MEMORY[0x1E4F1DAB8];
  if (v16)
  {
    long long v18 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithData:", v10);
    long long v19 = v17[1];
    long long v39 = *v17;
    long long v40 = v19;
    long long v41 = v17[2];
    long long v36 = v39;
    long long v37 = v19;
    long long v38 = v41;
    uint64_t v20 = +[ICAttachmentPreviewImageLoader orientedImage:v18 withTransform:&v39 background:1 backgroundTransform:&v36];

    [(ICPrintableTextAttachment *)v14 setImage:v20];
  }
  *(void *)&long long v39 = 0;
  *((void *)&v39 + 1) = &v39;
  *(void *)&long long v40 = 0x3032000000;
  *((void *)&v40 + 1) = __Block_byref_object_copy__54;
  *(void *)&long long v41 = __Block_byref_object_dispose__54;
  *((void *)&v41 + 1) = 0;
  v21 = [(ICAbstractTextAttachment *)self attachment];
  v22 = [v21 managedObjectContext];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __101__ICInlineDrawingTextAttachment_printableTextContentForAppearanceType_traitCollection_textContainer___block_invoke_19;
  v35[3] = &unk_1E5FD91F8;
  v35[4] = self;
  v35[5] = &v39;
  [v22 performBlockAndWait:v35];

  v23 = [MEMORY[0x1E4F83298] appearanceInfoWithType:a3];
  v24 = (void *)MEMORY[0x1E4F832C0];
  v25 = [(ICAbstractTextAttachment *)self attachment];
  v26 = [v24 generateImageForAttachment:v25 fromDrawing:*(void *)(*((void *)&v39 + 1) + 40) fullResolution:1 appearanceInfo:v23];

  if (v26)
  {
    long long v27 = v17[1];
    v33[0] = *v17;
    v33[1] = v27;
    long long v34 = v17[2];
    long long v36 = v33[0];
    long long v37 = v27;
    long long v38 = v34;
    v28 = +[ICAttachmentPreviewImageLoader orientedImage:v26 withTransform:&v36 background:0 backgroundTransform:v33];

    [(ICPrintableTextAttachment *)v14 setImage:v28];
  }

  _Block_object_dispose(&v39, 8);
  return v15;
}

void __101__ICInlineDrawingTextAttachment_printableTextContentForAppearanceType_traitCollection_textContainer___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 152) updateNowIfNecessary];
  v2 = [*(id *)(a1 + 32) attachment];
  v3 = [v2 attachmentModel];
  [v3 generatePreviewsInOperation:0];

  id v5 = [*(id *)(a1 + 32) attachment];
  id v4 = [v5 managedObjectContext];
  objc_msgSend(v4, "ic_save");
}

void __101__ICInlineDrawingTextAttachment_printableTextContentForAppearanceType_traitCollection_textContainer___block_invoke_19(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) attachment];
  v2 = [v6 inlineDrawingModel];
  uint64_t v3 = [v2 newDrawingFromMergeableData];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v30.receiver = self;
    v30.super_class = (Class)ICInlineDrawingTextAttachment;
    long long v11 = [(ICInlineDrawingTextAttachment *)&v30 viewProviderForParentView:v8 location:v9 textContainer:v10];
    long long v12 = [(ICInlineDrawingTextAttachment *)self inlineDrawingViews];
    long long v13 = [v11 view];
    char v14 = [v12 containsObject:v13];

    if ((v14 & 1) == 0)
    {
      long long v15 = [(ICInlineDrawingTextAttachment *)self inlineDrawingViews];
      uint64_t v16 = [v11 view];
      [v15 addObject:v16];

      objc_initWeak(&location, self);
      long long v17 = [v11 view];
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      v26 = __82__ICInlineDrawingTextAttachment_viewProviderForParentView_location_textContainer___block_invoke;
      long long v27 = &unk_1E5FD97A8;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v17, "ic_addDidMoveToWindowHandler:", &v24);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    long long v18 = objc_msgSend(v8, "window", v24, v25, v26, v27);

    if (v18)
    {
      long long v19 = [v8 window];
      uint64_t v20 = +[ICInkPaletteController sharedToolPickerForWindow:v19];

      uint64_t v21 = [v20 isVisible];
      v22 = [v11 view];
      [v20 setVisible:v21 forFirstResponder:v22];
    }
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

void __82__ICInlineDrawingTextAttachment_viewProviderForParentView_location_textContainer___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained configureHashtagAndMentionsForView:v3];
}

- (void)configureHashtagAndMentionsForView:(id)a3
{
  id v14 = a3;
  objc_opt_class();
  uint64_t v4 = ICDynamicCast();
  id v5 = [(ICAbstractTextAttachment *)self attachment];
  objc_msgSend(v4, "setWantsMentionDetection:", objc_msgSend(v5, "isSharedViaICloud"));

  id v6 = [(ICAbstractTextAttachment *)self attachment];
  uint64_t v7 = [v6 note];
  objc_msgSend(v4, "setWantsHashtagDetection:", objc_msgSend(v7, "isPasswordProtected") ^ 1);

  id v8 = [v14 window];
  if (v8)
  {
    id v9 = [(ICInlineDrawingTextAttachment *)self hashtagsAndMentionsController];
    [v4 setHashtagAndMentionsDelegate:v9];
  }
  else
  {
    [v4 setHashtagAndMentionsDelegate:0];
  }

  id v10 = [v14 window];

  long long v11 = [(ICInlineDrawingTextAttachment *)self inlineDrawingViews];
  long long v12 = v11;
  if (v10)
  {
    char v13 = [v11 containsObject:v14];

    if ((v13 & 1) == 0) {
      [(ICInlineCanvasTextAttachment *)self updatePaletteVisibility];
    }
    long long v12 = [(ICInlineDrawingTextAttachment *)self inlineDrawingViews];
    [v12 addObject:v14];
  }
  else
  {
    [v11 removeObject:v14];
  }
}

- (id)viewProviderForParentView:(id)a3 characterIndex:(unint64_t)a4 layoutManager:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([MEMORY[0x1E4F29060] isMainThread]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v17.receiver = self;
    v17.super_class = (Class)ICInlineDrawingTextAttachment;
    id v10 = [(ICInlineDrawingTextAttachment *)&v17 viewProviderForParentView:v8 characterIndex:a4 layoutManager:v9];
    long long v12 = [v8 window];

    if (v12)
    {
      char v13 = [v8 window];
      id v14 = +[ICInkPaletteController sharedToolPickerForWindow:v13];

      uint64_t v15 = [v14 isVisible];
      uint64_t v16 = [v10 view];
      [v14 setVisible:v15 forFirstResponder:v16];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)placeView:(id)a3 withFrame:(CGRect)a4 inParentView:(id)a5 characterIndex:(unint64_t)a6 layoutManager:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a3;
  id v16 = a7;
  id v17 = a5;
  [(ICInlineDrawingTextAttachment *)self setCachedDrawingViewForPlaceView:v15];
  [(ICInlineDrawingTextAttachment *)self setCachedControlViewForPlaceView:v17];
  long long v18 = [(ICInlineDrawingTextAttachment *)self inlineDrawingViews];
  char v19 = [v18 containsObject:v15];

  uint64_t v20 = [(ICInlineDrawingTextAttachment *)self inlineDrawingViews];
  [v20 addObject:v15];

  v28.receiver = self;
  v28.super_class = (Class)ICInlineDrawingTextAttachment;
  -[ICInlineDrawingTextAttachment placeView:withFrame:inParentView:characterIndex:layoutManager:](&v28, sel_placeView_withFrame_inParentView_characterIndex_layoutManager_, v15, v17, a6, v16, x, y, width, height);

  if ((v19 & 1) == 0) {
    [(ICInlineCanvasTextAttachment *)self updatePaletteVisibility];
  }
  objc_opt_class();
  uint64_t v21 = ICDynamicCast();
  if (v21)
  {
    [(ICAbstractTextAttachment *)self foregroundAlpha];
    objc_msgSend(v21, "ic_setAlpha:");
    v22 = [v21 hashtagAndMentionsDelegate];
    v23 = [(ICInlineDrawingTextAttachment *)self hashtagsAndMentionsController];

    if (v22 != v23)
    {
      uint64_t v24 = [(ICAbstractTextAttachment *)self attachment];
      objc_msgSend(v21, "setWantsMentionDetection:", objc_msgSend(v24, "isSharedViaICloud"));

      uint64_t v25 = [(ICAbstractTextAttachment *)self attachment];
      v26 = [v25 note];
      objc_msgSend(v21, "setWantsHashtagDetection:", objc_msgSend(v26, "isPasswordProtected") ^ 1);

      long long v27 = [(ICInlineDrawingTextAttachment *)self hashtagsAndMentionsController];
      [v21 setHashtagAndMentionsDelegate:v27];
    }
  }
  [(ICInlineDrawingTextAttachment *)self setCachedDrawingViewForPlaceView:0];
  [(ICInlineDrawingTextAttachment *)self setCachedControlViewForPlaceView:0];
}

- (void)detachView:(id)a3 fromParentView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICInlineDrawingTextAttachment;
  [(ICBaseTextAttachment *)&v14 detachView:v6 fromParentView:v7];
  id v8 = [(ICInlineDrawingTextAttachment *)self cachedDrawingViewForPlaceView];
  if (v8 == v6)
  {
    id v9 = [(ICInlineDrawingTextAttachment *)self cachedControlViewForPlaceView];

    if (v9 == v7) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  objc_opt_class();
  id v10 = ICDynamicCast();
  long long v11 = v10;
  if (v10) {
    [v10 setHashtagAndMentionsDelegate:0];
  }

LABEL_7:
  long long v12 = [(ICInlineDrawingTextAttachment *)self inlineDrawingViews];
  [v12 removeObject:v6];

  [(ICInlineDrawingChangeCoalescer *)self->_changeCoalescer updateNowIfNecessary];
  changeCoalescer = self->_changeCoalescer;
  self->_changeCoalescer = 0;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  double height = a6.size.height;
  double width = a6.size.width;
  double v11 = a6.origin.y;
  double v12 = a6.origin.x;
  id v16 = a5;
  v37.receiver = self;
  v37.super_class = (Class)ICInlineDrawingTextAttachment;
  -[ICBaseTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](&v37, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, a3, a4, v16, v12, v11, width, height, x, y);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  uint64_t v25 = [v16 textLayoutManager];
  if (v25)
  {
  }
  else
  {
    v26 = [v16 layoutManager];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_super v28 = [(ICAbstractTextAttachment *)self attachment];
      [v28 bounds];
      double v30 = v29;
      double v32 = v31;

      double v24 = width / (v30 / v32);
      double v18 = 0.0;
      double v20 = 0.0;
      double v22 = width;
    }
  }

  double v33 = v18;
  double v34 = v20;
  double v35 = v22;
  double v36 = v24;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  v34.receiver = self;
  v34.super_class = (Class)ICInlineDrawingTextAttachment;
  id v14 = a3;
  -[ICBaseTextAttachment attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:](&v34, sel_attachmentBoundsForTextContainer_proposedLineFragment_glyphPosition_characterIndex_, v14, a6, v12, v11, width, height, x, y);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v23 = objc_msgSend(v14, "layoutManager", v34.receiver, v34.super_class);

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v25 = [(ICAbstractTextAttachment *)self attachment];
    [v25 bounds];
    double v27 = v26;
    double v29 = v28;

    double v22 = width / (v27 / v29);
    double v16 = 0.0;
    double v18 = 0.0;
    double v20 = width;
  }
  double v30 = v16;
  double v31 = v18;
  double v32 = v20;
  double v33 = v22;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (id)_image
{
  return 0;
}

- (void)resetZoom
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(ICInlineDrawingTextAttachment *)self inlineDrawingViews];
  id v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * v7) conformsToProtocol:&unk_1F0A65B78])
        {
          id v8 = ICProtocolCast();
          [v8 resetZoom];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)drawingDataDidChange:(id)a3 view:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v35 = a4;
  uint64_t v7 = [(ICInlineDrawingTextAttachment *)self fileType];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F38E78]];

  if (v6 && v8)
  {
    long long v9 = [(ICInlineDrawingTextAttachment *)self changeCoalescer];
    [v9 drawingDataDidChange:v6];

    long long v10 = [(ICInlineDrawingTextAttachment *)self inlineDrawingViews];
    if ((unint64_t)[v10 count] < 2)
    {
    }
    else
    {
      BOOL v11 = [(ICInlineDrawingTextAttachment *)self isHandlingDrawingDidChange];

      if (!v11)
      {
        [(ICInlineDrawingTextAttachment *)self setIsHandlingDrawingDidChange:1];
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v12 = [(ICInlineDrawingTextAttachment *)self inlineDrawingViews];
        char v13 = (void *)[v12 copy];

        uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          double v33 = self;
          id v34 = v6;
          char v16 = 0;
          uint64_t v17 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v45 != v17) {
                objc_enumerationMutation(v13);
              }
              double v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              long long v40 = 0u;
              long long v41 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              double v20 = [v19 gestureRecognizers];
              uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v49 count:16];
              if (v21)
              {
                uint64_t v22 = v21;
                uint64_t v23 = *(void *)v41;
                do
                {
                  for (uint64_t j = 0; j != v22; ++j)
                  {
                    if (*(void *)v41 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    uint64_t v25 = *(void **)(*((void *)&v40 + 1) + 8 * j);
                    if ([v25 state] == 2 || objc_msgSend(v25, "state") == 3) {
                      char v16 = 1;
                    }
                  }
                  uint64_t v22 = [v20 countByEnumeratingWithState:&v40 objects:v49 count:16];
                }
                while (v22);
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v44 objects:v50 count:16];
          }
          while (v15);

          self = v33;
          id v6 = v34;
          if (v16) {
            goto LABEL_38;
          }
        }
        else
        {
        }
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        double v26 = [(ICInlineDrawingTextAttachment *)self inlineDrawingViews];
        double v27 = (void *)[v26 copy];

        uint64_t v28 = [v27 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v37;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v37 != v30) {
                objc_enumerationMutation(v27);
              }
              id v32 = *(id *)(*((void *)&v36 + 1) + 8 * k);
              if (v32 != v35
                && [*(id *)(*((void *)&v36 + 1) + 8 * k) conformsToProtocol:&unk_1F0A65B78]&& (objc_opt_respondsToSelector() & 1) != 0)
              {
                [v32 drawingDataDidChange:v6];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v36 objects:v48 count:16];
          }
          while (v29);
        }

LABEL_38:
        [(ICInlineDrawingTextAttachment *)self setIsHandlingDrawingDidChange:0];
      }
    }
  }
}

- (void)setChangeCoalescer:(id)a3
{
}

- (void)setInlineDrawingViews:(id)a3
{
}

- (BOOL)isHandlingDrawingDidChange
{
  return self->_isHandlingDrawingDidChange;
}

- (void)setIsHandlingDrawingDidChange:(BOOL)a3
{
  self->_isHandlingDrawingDidChange = a3;
}

- (void)setHashtagsAndMentionsController:(id)a3
{
}

- (UIView)cachedDrawingViewForPlaceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachedDrawingViewForPlaceView);
  return (UIView *)WeakRetained;
}

- (void)setCachedDrawingViewForPlaceView:(id)a3
{
}

- (UIView)cachedControlViewForPlaceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachedControlViewForPlaceView);
  return (UIView *)WeakRetained;
}

- (void)setCachedControlViewForPlaceView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cachedControlViewForPlaceView);
  objc_destroyWeak((id *)&self->_cachedDrawingViewForPlaceView);
  objc_storeStrong((id *)&self->_hashtagsAndMentionsController, 0);
  objc_storeStrong((id *)&self->_inlineDrawingViews, 0);
  objc_storeStrong((id *)&self->_changeCoalescer, 0);
}

@end