@interface _UITextStorageDraggableGeometry
- (BOOL)_isActualLink:(id)a3;
- (NSTextStorage)textStorage;
- (UITextDragSupporting)view;
- (_UITextStorageDraggableGeometry)initWithView:(id)a3 textStorage:(id)a4;
- (id)_draggableTextInRange:(id)a3;
- (id)_previewProviderForTextInRange:(id)a3;
- (id)_targetedPreviewProviderForImage:(id)a3 inRange:(id)a4;
- (id)_targetedPreviewProviderForTextInRange:(id)a3;
- (id)_targetedPreviewProviderForTextInRange:(id)a3 dismissing:(BOOL)a4 overrideLifting:(id)a5;
- (id)attributedStringsForTextRanges:(id)a3;
- (id)draggableObjectsForTextRange:(id)a3;
- (id)performSameViewDropOperation:(id)a3;
- (id)previewForDroppingTextInRange:(id)a3 toPosition:(id)a4 inContainerView:(id)a5;
- (id)targetedPreviewProviderForTextInRange:(id)a3 dismissing:(BOOL)a4;
- (id)textRangeForAttachmentInTextRange:(id)a3 atPoint:(CGPoint)a4;
- (id)textRangesForAttachmentsInTextRange:(id)a3;
- (int64_t)geometryOptions;
- (void)_renderTextInRange:(id)a3 image:(id *)a4 boundingRectangles:(id *)a5 forLifting:(BOOL)a6;
- (void)setGeometryOptions:(int64_t)a3;
@end

@implementation _UITextStorageDraggableGeometry

- (void)setGeometryOptions:(int64_t)a3
{
  self->_geometryOptions = a3;
}

- (_UITextStorageDraggableGeometry)initWithView:(id)a3 textStorage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UITextStorageDraggableGeometry;
  v8 = [(_UITextStorageDraggableGeometry *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_view, v6);
    objc_storeWeak((id *)&v9->_textStorage, v7);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textStorage);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_previousBackgroundColor, 0);
}

- (id)textRangesForAttachmentsInTextRange:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v7 = [WeakRetained _nsrangeForTextRange:v4];
  uint64_t v9 = v8;

  id v10 = objc_loadWeakRetained((id *)&self->_view);
  int v11 = [v10 allowsDraggingAttachments];

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_textStorage);
    uint64_t v13 = *(void *)off_1E52D1F50;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __71___UITextStorageDraggableGeometry_textRangesForAttachmentsInTextRange___block_invoke;
    v25[3] = &unk_1E5309C50;
    v25[4] = self;
    id v26 = v5;
    objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v13, v7, v9, 0, v25);
  }
  id v14 = objc_loadWeakRetained((id *)&self->_textStorage);
  uint64_t v15 = *(void *)off_1E52D2110;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __71___UITextStorageDraggableGeometry_textRangesForAttachmentsInTextRange___block_invoke_2;
  v22 = &unk_1E5309C78;
  v23 = self;
  id v24 = v5;
  id v16 = v5;
  objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v15, v7, v9, 0, &v19);

  v17 = objc_msgSend(v16, "copy", v19, v20, v21, v22, v23);
  return v17;
}

- (id)textRangeForAttachmentInTextRange:(id)a3 atPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v7 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__202;
  v27 = __Block_byref_object_dispose__202;
  id v28 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v9 = [WeakRetained _nsrangeForTextRange:v7];
  uint64_t v11 = v10;

  id v12 = objc_loadWeakRetained((id *)&self->_view);
  LODWORD(WeakRetained) = [v12 allowsDraggingAttachments];

  if (WeakRetained)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_textStorage);
    uint64_t v14 = *(void *)off_1E52D1F50;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77___UITextStorageDraggableGeometry_textRangeForAttachmentInTextRange_atPoint___block_invoke;
    v22[3] = &unk_1E5309CA0;
    *(CGFloat *)&v22[6] = x;
    *(CGFloat *)&v22[7] = y;
    v22[4] = self;
    v22[5] = &v23;
    objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v14, v9, v11, 0, v22);

    uint64_t v15 = (void *)v24[5];
    if (v15)
    {
      if (([v15 isEmpty] & 1) == 0) {
        goto LABEL_7;
      }
    }
  }
  id v16 = objc_loadWeakRetained((id *)&self->_textStorage);
  uint64_t v17 = *(void *)off_1E52D2110;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __77___UITextStorageDraggableGeometry_textRangeForAttachmentInTextRange_atPoint___block_invoke_2;
  v21[3] = &unk_1E5309CC8;
  *(CGFloat *)&v21[6] = x;
  *(CGFloat *)&v21[7] = y;
  v21[4] = self;
  v21[5] = &v23;
  objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v17, v9, v11, 0, v21);

  v18 = (void *)v24[5];
  if (!v18) {
    goto LABEL_6;
  }
  if (([v18 isEmpty] & 1) == 0) {
LABEL_7:
  }
    id v19 = (id)v24[5];
  else {
LABEL_6:
  }
    id v19 = 0;
  _Block_object_dispose(&v23, 8);

  return v19;
}

- (id)draggableObjectsForTextRange:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  char v7 = objc_opt_respondsToSelector();

  id v8 = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v9 = v8;
  if (v7)
  {
    uint64_t v10 = [v8 _rangeOfCustomDraggableObjectsInRange:v4];

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_view);
      id v12 = [v11 _customDraggableObjectsForRange:v10];
      [v5 addObjectsFromArray:v12];

      id v13 = objc_loadWeakRetained((id *)&self->_view);
      uint64_t v14 = [v10 end];
      uint64_t v15 = [v4 end];
      id v16 = [v13 textRangeFromPosition:v14 toPosition:v15];

      id v17 = objc_loadWeakRetained((id *)&self->_view);
      v18 = [v16 start];
      id v19 = [v16 end];
      uint64_t v20 = [v17 comparePosition:v18 toPosition:v19];

      if (v20 == -1) {
        id v21 = v16;
      }
      else {
        id v21 = 0;
      }
    }
    else
    {
      id v21 = v4;
    }
    v45 = [(_UITextStorageDraggableGeometry *)self _draggableTextInRange:v21];
    [v5 addObjectsFromArray:v45];

    id v44 = v5;
  }
  else
  {
    uint64_t v22 = [v8 _nsrangeForTextRange:v4];
    uint64_t v24 = v23;

    uint64_t v25 = objc_opt_new();
    id v26 = objc_loadWeakRetained((id *)&self->_view);
    int v27 = [v26 allowsDraggingAttachments];

    if (v27)
    {
      id v28 = objc_loadWeakRetained((id *)&self->_textStorage);
      uint64_t v29 = *(void *)off_1E52D1F50;
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke;
      v59[3] = &unk_1E5309D18;
      v59[4] = self;
      id v60 = v5;
      id v61 = v25;
      objc_msgSend(v28, "enumerateAttribute:inRange:options:usingBlock:", v29, v22, v24, 0, v59);
    }
    id v30 = objc_loadWeakRetained((id *)&self->_textStorage);
    uint64_t v31 = *(void *)off_1E52D2110;
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_3;
    v56[3] = &unk_1E5309DB0;
    v56[4] = self;
    id v32 = v25;
    id v57 = v32;
    id v33 = v5;
    id v58 = v33;
    objc_msgSend(v30, "enumerateAttribute:inRange:options:usingBlock:", v31, v22, v24, 0, v56);

    if ([v32 count])
    {
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_7;
      v55[3] = &unk_1E5309DD8;
      v55[4] = self;
      [v32 sortUsingComparator:v55];
      id v34 = objc_loadWeakRetained((id *)&self->_textStorage);
      v35 = objc_msgSend(v34, "attributedSubstringFromRange:", v22, v24);
      v36 = (void *)[v35 mutableCopy];

      uint64_t v47 = MEMORY[0x1E4F143A8];
      uint64_t v48 = 3221225472;
      v49 = __64___UITextStorageDraggableGeometry_draggableObjectsForTextRange___block_invoke_8;
      v50 = &unk_1E5309E00;
      v51 = self;
      id v37 = v36;
      id v52 = v37;
      uint64_t v53 = v22;
      uint64_t v54 = v24;
      [v32 enumerateObjectsWithOptions:2 usingBlock:&v47];
      v38 = objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet", v47, v48, v49, v50, v51);
      v39 = [v38 invertedSet];

      if ([v37 length])
      {
        v40 = [v37 string];
        [v40 rangeOfCharacterFromSet:v39];
        uint64_t v42 = v41;

        if (v42) {
          [v33 removeAllObjects];
        }
      }
    }
    if ([v33 count])
    {
      uint64_t v43 = [v33 copy];
    }
    else
    {
      uint64_t v43 = [(_UITextStorageDraggableGeometry *)self _draggableTextInRange:v4];
    }
    id v44 = (id)v43;
  }
  return v44;
}

- (id)previewForDroppingTextInRange:(id)a3 toPosition:(id)a4 inContainerView:(id)a5
{
  id v7 = a5;
  id v8 = [(_UITextStorageDraggableGeometry *)self _targetedPreviewProviderForTextInRange:a3];
  uint64_t v9 = ((void (**)(void, id, void))v8)[2](v8, v7, 0);

  return v9;
}

- (id)attributedStringsForTextRanges:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textStorage);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66___UITextStorageDraggableGeometry_attributedStringsForTextRanges___block_invoke;
  v11[3] = &unk_1E5309E28;
  id v12 = v4;
  id v13 = self;
  id v14 = v5;
  id v7 = v5;
  id v8 = v4;
  [WeakRetained coordinateReading:v11];

  uint64_t v9 = (void *)[v7 copy];
  return v9;
}

- (id)performSameViewDropOperation:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__202;
  id v17 = __Block_byref_object_dispose__202;
  id v18 = [v4 targetRange];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textStorage);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64___UITextStorageDraggableGeometry_performSameViewDropOperation___block_invoke;
  v10[3] = &unk_1E5309E78;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v12 = &v13;
  [WeakRetained coordinateEditing:v10];

  if (v14[5])
  {
    id v7 = -[_UITextStorageDraggableGeometry _targetedPreviewProviderForTextInRange:](self, "_targetedPreviewProviderForTextInRange:");
    id v8 = +[UITextDraggableGeometrySameViewDropOperationResult resultWithRange:v14[5] targetedPreviewProvider:v7];
  }
  else
  {
    id v8 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)_draggableTextInRange:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  NSUInteger v6 = [WeakRetained _nsrangeForTextRange:v4];
  NSUInteger v8 = v7;

  id v9 = objc_loadWeakRetained((id *)&self->_textStorage);
  uint64_t v10 = objc_msgSend(v9, "attributedSubstringFromRange:", v6, v8);

  if ([v10 length])
  {
    id v11 = objc_loadWeakRetained((id *)&self->_view);
    int v12 = [v11 allowsEditingTextAttributes];

    id v13 = objc_alloc(MEMORY[0x1E4F28D78]);
    id v14 = v13;
    if (v12)
    {
      uint64_t v15 = (void *)[v13 initWithObject:v10];
    }
    else
    {
      id v17 = [v10 string];
      uint64_t v15 = (void *)[v14 initWithObject:v17];
    }
    id v18 = +[UITextDraggableObject draggableObjectWithItemProvider:v15 fromRange:v4];

    id v19 = objc_loadWeakRetained((id *)&self->_view);
    char v20 = objc_opt_respondsToSelector();

    NSUInteger v21 = v6;
    NSUInteger v22 = v8;
    if (v20)
    {
      id v23 = objc_loadWeakRetained((id *)&self->_view);
      NSUInteger v21 = [v23 _visibleRangeWithLayout:0];
      NSUInteger v22 = v24;
    }
    v33.location = v6;
    v33.length = v8;
    v34.location = v21;
    v34.length = v22;
    NSRange v25 = NSIntersectionRange(v33, v34);
    if (v25.location == v6 && v25.length == v8)
    {
      id v26 = [(_UITextStorageDraggableGeometry *)self _targetedPreviewProviderForTextInRange:v4];
      [v18 setTargetedPreviewProvider:v26];
    }
    else
    {
      id v27 = objc_loadWeakRetained((id *)&self->_view);
      id v26 = objc_msgSend(v27, "_textRangeFromNSRange:", v25.location, v25.length);

      id v28 = [(_UITextStorageDraggableGeometry *)self _targetedPreviewProviderForTextInRange:v26];
      [v18 setTargetedPreviewProvider:v28];

      uint64_t v29 = [(_UITextStorageDraggableGeometry *)self _previewProviderForTextInRange:v4];
      [v18 setPreviewProvider:v29];
    }
    v31[0] = v18;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

- (id)_targetedPreviewProviderForImage:(id)a3 inRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76___UITextStorageDraggableGeometry__targetedPreviewProviderForImage_inRange___block_invoke;
  aBlock[3] = &unk_1E5309EA0;
  id v15 = v6;
  id v16 = WeakRetained;
  id v17 = v7;
  id v9 = v7;
  id v10 = WeakRetained;
  id v11 = v6;
  int v12 = _Block_copy(aBlock);

  return v12;
}

- (id)targetedPreviewProviderForTextInRange:(id)a3 dismissing:(BOOL)a4
{
  return [(_UITextStorageDraggableGeometry *)self _targetedPreviewProviderForTextInRange:a3 dismissing:a4 overrideLifting:0];
}

- (id)_targetedPreviewProviderForTextInRange:(id)a3
{
  return [(_UITextStorageDraggableGeometry *)self _targetedPreviewProviderForTextInRange:a3 dismissing:0 overrideLifting:0];
}

- (id)_targetedPreviewProviderForTextInRange:(id)a3 dismissing:(BOOL)a4 overrideLifting:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __101___UITextStorageDraggableGeometry__targetedPreviewProviderForTextInRange_dismissing_overrideLifting___block_invoke;
  v14[3] = &unk_1E5309EC8;
  id v15 = v8;
  id v16 = v9;
  v14[4] = self;
  BOOL v17 = a4;
  id v10 = v8;
  id v11 = v9;
  int v12 = _Block_copy(v14);

  return v12;
}

- (id)_previewProviderForTextInRange:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66___UITextStorageDraggableGeometry__previewProviderForTextInRange___block_invoke;
  v8[3] = &unk_1E5309D68;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = _Block_copy(v8);

  return v6;
}

- (BOOL)_isActualLink:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v3 scheme];
      int v4 = [v5 hasPrefix:@"x-apple-data-detectors"] ^ 1;

      goto LABEL_7;
    }
LABEL_6:
    LOBYTE(v4) = 0;
    goto LABEL_7;
  }
  int v4 = [v3 hasPrefix:@"x-apple-data-detectors"] ^ 1;
LABEL_7:

  return v4;
}

- (void)_renderTextInRange:(id)a3 image:(id *)a4 boundingRectangles:(id *)a5 forLifting:(BOOL)a6
{
  BOOL v6 = a6;
  v77[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v14 = objc_loadWeakRetained((id *)&self->_view);
    id v15 = [v14 _previewRendererForRange:v10 unifyRects:v6];

    if (v15)
    {
      char v16 = [(_UITextStorageDraggableGeometry *)self geometryOptions];
      BOOL v17 = 0;
      if ((v16 & 1) != 0 && v6)
      {
        v76[0] = *(void *)off_1E52D2048;
        id v18 = +[UIColor labelColor];
        v77[0] = v18;
        v76[1] = *(void *)off_1E52D1F58;
        id v19 = +[UIColor clearColor];
        v77[1] = v19;
        BOOL v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:2];

        [v15 addRenderingAttributes:v17];
      }
      *a4 = [v15 image];
      if (v17)
      {
        char v20 = [v17 allKeys];
        [v15 removeRenderingAttributes:v20];
      }
      NSUInteger v21 = objc_opt_new();
      [v15 firstLineRect];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      id v30 = objc_loadWeakRetained((id *)p_view);
      [v30 contentScaleFactor];
      double v32 = UIRectIntegralWithScale(v23, v25, v27, v29, v31);
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;

      v78.origin.CGFloat x = v32;
      v78.origin.CGFloat y = v34;
      v78.size.width = v36;
      v78.size.height = v38;
      if (!CGRectIsEmpty(v78))
      {
        v39 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v32, v34, v36, v38);
        [v21 addObject:v39];
      }
      [v15 bodyRect];
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;
      id v48 = objc_loadWeakRetained((id *)p_view);
      [v48 contentScaleFactor];
      double v50 = UIRectIntegralWithScale(v41, v43, v45, v47, v49);
      double v52 = v51;
      double v54 = v53;
      double v56 = v55;

      [v15 bodyRect];
      if (!CGRectIsEmpty(v79))
      {
        id v57 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v50, v52, v54, v56);
        [v21 addObject:v57];
      }
      [v15 lastLineRect];
      double v59 = v58;
      double v61 = v60;
      double v63 = v62;
      double v65 = v64;
      id v66 = objc_loadWeakRetained((id *)p_view);
      [v66 contentScaleFactor];
      double v68 = UIRectIntegralWithScale(v59, v61, v63, v65, v67);
      double v70 = v69;
      double v72 = v71;
      double v74 = v73;

      [v15 lastLineRect];
      if (!CGRectIsEmpty(v80))
      {
        v75 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v68, v70, v72, v74);
        [v21 addObject:v75];
      }
      *a5 = (id)[v21 copy];
    }
  }
}

- (int64_t)geometryOptions
{
  return self->_geometryOptions;
}

- (UITextDragSupporting)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UITextDragSupporting *)WeakRetained;
}

- (NSTextStorage)textStorage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textStorage);
  return (NSTextStorage *)WeakRetained;
}

@end