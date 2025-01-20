@interface ICPreviewLayoutManager
- (BOOL)isInsideSystemPaper;
- (ICPreviewLayoutManager)initWithNote:(id)a3 maxCharacterCount:(unint64_t)a4 textContainer:(id)a5 textController:(id)a6;
- (NSTextStorage)strongTextStorage;
- (id)linkAttributesForLink:(id)a3 forCharacterAtIndex:(unint64_t)a4;
- (id)todoImageForParagraphStyle:(id)a3;
- (unint64_t)maxCharacterCount;
- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4;
- (void)drawTodoItemForListRange:(_NSRange)a3 paragraphStyle:(id)a4 atOrigin:(CGPoint)a5;
- (void)drawTodosForCharacterRange:(_NSRange)a3 atOrigin:(CGPoint)a4;
- (void)setInsideSystemPaper:(BOOL)a3;
- (void)setMaxCharacterCount:(unint64_t)a3;
- (void)setStrongTextStorage:(id)a3;
@end

@implementation ICPreviewLayoutManager

- (ICPreviewLayoutManager)initWithNote:(id)a3 maxCharacterCount:(unint64_t)a4 textContainer:(id)a5 textController:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v51.receiver = self;
  v51.super_class = (Class)ICPreviewLayoutManager;
  v13 = [(ICPreviewLayoutManager *)&v51 init];
  v14 = v13;
  if (v13)
  {
    v13->_maxCharacterCount = a4;
    [(ICPreviewLayoutManager *)v13 setAllowsNonContiguousLayout:1];
    v15 = [v10 textStorage];
    id v16 = [v15 attributedString];

    v17 = [v10 textStorage];
    v18 = [v17 styler];

    if (!v18)
    {
      v19 = objc_opt_new();

      v20 = [v10 textStorage];
      [v19 refreshTextStylingForTextStorage:v20 withTextController:v19];

      id v12 = v19;
    }
    if ([v10 calculatePreviewBehavior] != 1)
    {
      v21 = [v10 calculateDocumentController];
      [v21 updateAffectingChangeCounts:0];
      if ([v21 hasExpressions])
      {
        uint64_t v45 = 0;
        v46 = &v45;
        uint64_t v47 = 0x3032000000;
        v48 = __Block_byref_object_copy__70;
        v49 = __Block_byref_object_dispose__70;
        id v50 = 0;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __86__ICPreviewLayoutManager_initWithNote_maxCharacterCount_textContainer_textController___block_invoke;
        aBlock[3] = &unk_1E5FDDE08;
        v44 = &v45;
        id v22 = v16;
        id v43 = v22;
        v23 = (void (**)(void))_Block_copy(aBlock);
        v24 = v23[2]();
        uint64_t v25 = objc_msgSend((id)v46[5], "ic_range");
        objc_msgSend(v21, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v24, v25, v26, 0, 1);

        id v16 = (id)v46[5];
        _Block_object_dispose(&v45, 8);
      }
    }
    unint64_t v27 = [v16 length];
    if (v27 >= a4) {
      unint64_t v28 = a4;
    }
    else {
      unint64_t v28 = v27;
    }
    v29 = objc_msgSend(v16, "attributedSubstringFromRange:", 0, v28);

    v30 = [v10 managedObjectContext];
    v31 = objc_msgSend(v29, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:formatter:", v30, 0);

    v32 = [ICTTTextStorage alloc];
    v33 = [MEMORY[0x1E4F29128] UUID];
    v34 = [(ICTTTextStorage *)v32 initWithData:0 replicaID:v33];

    [(ICTTTextStorage *)v34 setWantsUndoCommands:0];
    -[ICTTTextStorage replaceCharactersInRange:withAttributedString:](v34, "replaceCharactersInRange:withAttributedString:", 0, 0, v31);
    [v12 styleDataDetectorTypesForPreviewInTextStorage:v34];
    uint64_t v35 = *MEMORY[0x1E4FB06B8];
    uint64_t v36 = [(ICTTTextStorage *)v34 length];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __86__ICPreviewLayoutManager_initWithNote_maxCharacterCount_textContainer_textController___block_invoke_2;
    v39[3] = &unk_1E5FDA998;
    id v40 = v10;
    v41 = v34;
    v37 = v34;
    -[ICTTTextStorage enumerateAttribute:inRange:options:usingBlock:](v37, "enumerateAttribute:inRange:options:usingBlock:", v35, 0, v36, 0, v39);
    [(ICTTTextStorage *)v37 setStyler:v12];
    objc_msgSend(v12, "styleText:inExactRange:fixModelAttributes:", v37, 0, -[ICTTTextStorage length](v37, "length"), 0);
    [(ICPreviewLayoutManager *)v14 setTextStorage:v37];
    [(ICPreviewLayoutManager *)v14 setStrongTextStorage:v37];
    [(ICPreviewLayoutManager *)v14 addTextContainer:v11];
  }
  return v14;
}

id __86__ICPreviewLayoutManager_initWithNote_maxCharacterCount_textContainer_textController___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    id v4 = v3;
    v5 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = v4;
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = objc_msgSend(v6, "ic_range");
    v5 = objc_msgSend(v6, "attributedSubstringFromRange:", v7, v8);
    uint64_t v9 = [v5 mutableCopy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  id v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return v12;
}

void __86__ICPreviewLayoutManager_initWithNote_maxCharacterCount_textContainer_textController___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v12 = a2;
  if ([v12 conformsToProtocol:&unk_1F09A5DB0])
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = v12;
    uint64_t v9 = [v7 managedObjectContext];
    uint64_t v10 = [v8 attachmentInContext:v9];

    id v11 = +[ICTextAttachment textAttachmentWithAttachment:v10];
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4FB06B8], v11, a3, a4);
  }
}

- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  uint64_t v7 = -[ICPreviewLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", a3.location, a3.length, 0);
  uint64_t v9 = v8;
  uint64_t v10 = [(ICPreviewLayoutManager *)self textStorage];
  uint64_t v11 = *MEMORY[0x1E4FB06B8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__ICPreviewLayoutManager_drawGlyphsForGlyphRange_atPoint___block_invoke;
  v12[3] = &unk_1E5FDDE30;
  *(CGFloat *)&v12[6] = x;
  *(CGFloat *)&v12[7] = y;
  v12[4] = self;
  v12[5] = v13;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v11, v7, v9, 0, v12);

  _Block_object_dispose(v13, 8);
}

void __58__ICPreviewLayoutManager_drawGlyphsForGlyphRange_atPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  objc_opt_class();
  uint64_t v8 = ICDynamicCast();

  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
  uint64_t v11 = v10;
  id v12 = [v8 attachment];

  if (v12)
  {
    v13 = [*(id *)(a1 + 32) textContainerForGlyphAtIndex:v9 effectiveRange:0];
    objc_msgSend(*(id *)(a1 + 32), "boundingRectForGlyphRange:inTextContainer:", v9, v11, v13);
    CGRect v32 = CGRectOffset(v31, *(CGFloat *)(a1 + 48), *(double *)(a1 + 56) + *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    double x = v32.origin.x;
    double y = v32.origin.y;
    double width = v32.size.width;
    double height = v32.size.height;
    v18 = [v8 attachment];
    int v19 = [v18 usesLinkPresentation];

    if (v19)
    {
      v20 = [ICLinkSnapshotGenerator alloc];
      v21 = [v8 attachment];
      id v22 = [(ICLinkSnapshotGenerator *)v20 initWithAttachment:v21];

      -[ICLinkSnapshotGenerator setInsideSystemPaper:](v22, "setInsideSystemPaper:", [*(id *)(a1 + 32) isInsideSystemPaper]);
      v23 = [(ICLinkSnapshotGenerator *)v22 snapshot];
      [v23 size];
      double v25 = v24;
      [v23 size];
      double v27 = v26;
      objc_msgSend(v23, "drawInRect:", x, y, v25, v26);
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v27
                                                                  - height
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 24);
    }
    else
    {
      id v22 = [v8 attachment];
      v23 = [(ICLinkSnapshotGenerator *)v22 attachmentModel];
      objc_msgSend(v23, "drawPreviewInRect:", x, y, width, height);
    }
  }
  else
  {
    double v28 = *(double *)(a1 + 48);
    double v29 = *(double *)(a1 + 56) + *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    v30.receiver = *(id *)(a1 + 32);
    v30.super_class = (Class)ICPreviewLayoutManager;
    objc_msgSendSuper2(&v30, sel_drawGlyphsForGlyphRange_atPoint_, v9, v11, v28, v29);
    objc_msgSend(*(id *)(a1 + 32), "drawListStylesForCharacterRange:atPoint:", a3, a4, v28, v29);
    objc_msgSend(*(id *)(a1 + 32), "drawTodosForCharacterRange:atOrigin:", a3, a4, v28, v29);
  }
}

- (void)drawTodosForCharacterRange:(_NSRange)a3 atOrigin:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v9 = [(ICPreviewLayoutManager *)self textStorage];
  uint64_t v10 = *MEMORY[0x1E4F83220];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__ICPreviewLayoutManager_drawTodosForCharacterRange_atOrigin___block_invoke;
  v11[3] = &unk_1E5FD9AB0;
  v11[4] = self;
  *(CGFloat *)&v11[5] = x;
  *(CGFloat *)&v11[6] = y;
  objc_msgSend(v9, "ic_enumerateUnclampedAttribute:inRange:options:usingBlock:", v10, location, length, 0, v11);
}

void __62__ICPreviewLayoutManager_drawTodosForCharacterRange_atOrigin___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v7 isList]
      && [v7 style] == 103)
    {
      objc_msgSend(*(id *)(a1 + 32), "drawTodoItemForListRange:paragraphStyle:atOrigin:", a3, a4, v7, *(double *)(a1 + 40), *(double *)(a1 + 48));
    }
  }
}

- (id)todoImageForParagraphStyle:(id)a3
{
  v3 = [a3 todo];
  int v4 = [v3 done];

  v5 = @"circle";
  if (v4) {
    v5 = @"checkmark.circle.fill";
  }
  v6 = v5;
  id v7 = [MEMORY[0x1E4FB1618] ICGrayTodoButtonColor];
  uint64_t v8 = [MEMORY[0x1E4FB1618] ICControlAccentColor];
  uint64_t v9 = (void *)v8;
  if (v4) {
    uint64_t v10 = (void *)v8;
  }
  else {
    uint64_t v10 = v7;
  }
  id v11 = v10;
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    uint64_t v12 = ICAccessibilitySystemDarkenedColor(v11);

    id v11 = (id)v12;
  }
  v13 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_largeSystemImageNamed:", v6);
  v14 = objc_msgSend(v13, "ic_imageWithTint:", v11);

  return v14;
}

- (void)drawTodoItemForListRange:(_NSRange)a3 paragraphStyle:(id)a4 atOrigin:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v38 = a4;
  uint64_t v10 = -[ICPreviewLayoutManager todoImageForParagraphStyle:](self, "todoImageForParagraphStyle:");
  -[ICPreviewLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", -[ICPreviewLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0), 0);
  CGRect v41 = CGRectOffset(v40, x, y);
  CGFloat v11 = v41.origin.x;
  CGFloat v12 = v41.origin.y;
  CGFloat width = v41.size.width;
  CGFloat height = v41.size.height;
  v15 = [(ICBaseLayoutManager *)self textContainer];
  [v15 lineFragmentPadding];
  CGFloat v17 = v16;
  v42.origin.CGFloat x = v11;
  v42.origin.CGFloat y = v12;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  CGRect v43 = CGRectInset(v42, v17, 0.0);
  CGFloat v18 = v43.origin.x;
  CGFloat v19 = v43.origin.y;
  CGFloat v20 = v43.size.width;
  CGFloat v21 = v43.size.height;

  v44.origin.CGFloat x = v18;
  v44.origin.CGFloat y = v19;
  v44.size.CGFloat width = v20;
  v44.size.CGFloat height = v21;
  if (!CGRectIsNull(v44) && v10)
  {
    uint64_t v22 = [v38 layoutWritingDirection];
    CGFloat v23 = v18;
    CGFloat v24 = v19;
    CGFloat v25 = v20;
    CGFloat v26 = v21;
    if (v22)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v23);
      double v28 = 8.0;
    }
    else
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v23);
      [v10 size];
      double MaxX = MinX - v30;
      double v28 = -8.0;
    }
    double v31 = MaxX + v28;
    v45.origin.CGFloat x = v18;
    v45.origin.CGFloat y = v19;
    v45.size.CGFloat width = v20;
    v45.size.CGFloat height = v21;
    double MidY = CGRectGetMidY(v45);
    [v10 size];
    double v34 = round(MidY + v33 * -0.5);
    [v10 size];
    double v36 = v35;
    [v10 size];
    objc_msgSend(v10, "drawInRect:", v31, v34, v36, v37);
  }
}

- (id)linkAttributesForLink:(id)a3 forCharacterAtIndex:(unint64_t)a4
{
  return +[ICBaseLayoutManager defaultLinkTextAttributes];
}

- (BOOL)isInsideSystemPaper
{
  return self->_insideSystemPaper;
}

- (void)setInsideSystemPaper:(BOOL)a3
{
  self->_insideSystemPaper = a3;
}

- (unint64_t)maxCharacterCount
{
  return self->_maxCharacterCount;
}

- (void)setMaxCharacterCount:(unint64_t)a3
{
  self->_maxCharacterCount = a3;
}

- (NSTextStorage)strongTextStorage
{
  return self->_strongTextStorage;
}

- (void)setStrongTextStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end