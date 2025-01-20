@interface ICBaseTextAttachment
- (BOOL)canDragWithoutSelecting;
- (BOOL)isUnsupported;
- (BOOL)supportsUserConfigurablePresentationSizeForTextContainer:(id)a3;
- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7;
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (ICBaseTextAttachment)initWithAttachment:(id)a3;
- (double)viewCornerRadius;
- (id)attachmentAttributesForAttributedString;
- (id)attachmentIdentifier;
- (id)attachmentInContext:(id)a3;
- (id)attachmentUTI;
- (id)image;
- (id)inlineAttachmentInContext:(id)a3;
- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 textContainer:(id)a5;
- (signed)effectiveAttachmentViewSizeForTextContainer:(id)a3;
- (void)detachView:(id)a3 fromParentView:(id)a4;
- (void)fixAttachmentForAttributedString:(id)a3 range:(_NSRange)a4 forPlainText:(BOOL)a5 forStandardizedText:(BOOL)a6;
@end

@implementation ICBaseTextAttachment

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  v21.receiver = self;
  v21.super_class = (Class)ICBaseTextAttachment;
  -[ICBaseTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](&v21, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, a3, a4, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7.x, a7.y);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = v7;
  if ((v12 == 0.0 || v7 == 0.0) && PKIsInlineDrawingOrPaperAttachment())
  {
    if (v13 == 0.0)
    {
      v15 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[ICBaseTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:]();
      }

      double v13 = 1.0;
    }
    if (v14 == 0.0)
    {
      v16 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[ICBaseTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:]();
      }

      double v14 = 1.0;
    }
  }
  double v17 = v9;
  double v18 = v11;
  double v19 = v13;
  double v20 = v14;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)attachmentInContext:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__50;
  v16 = __Block_byref_object_dispose__50;
  id v17 = [(ICAbstractTextAttachment *)self attachment];
  v5 = (void *)v13[5];
  if (v5)
  {
    id v6 = [v5 managedObjectContext];

    if (v6 != v4)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __44__ICBaseTextAttachment_attachmentInContext___block_invoke;
      v9[3] = &unk_1E5FD91F8;
      double v11 = &v12;
      id v10 = v4;
      [v10 performBlockAndWait:v9];
    }
  }
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __44__ICBaseTextAttachment_attachmentIdentifier__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) attachment];
  uint64_t v2 = [v5 identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)attachmentIdentifier
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x3032000000;
  double v11 = __Block_byref_object_copy__50;
  uint64_t v12 = __Block_byref_object_dispose__50;
  id v13 = 0;
  uint64_t v3 = [(ICAbstractTextAttachment *)self attachment];
  id v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ICBaseTextAttachment_attachmentIdentifier__block_invoke;
  v7[3] = &unk_1E5FD91F8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (ICBaseTextAttachment)initWithAttachment:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F832A0];
  id v6 = [v4 typeUTI];
  LODWORD(v5) = [v5 typeUTIIsInlineDrawing:v6];

  if (v5)
  {
    id v7 = (id *)MEMORY[0x1E4F38E78];
LABEL_6:
    double v11 = (__CFString *)*v7;
    goto LABEL_9;
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F832A0];
  double v9 = [v4 typeUTI];
  if ([v8 typeUTIIsSystemPaper:v9])
  {
    BOOL v10 = +[ICSystemPaperTextAttachment isEnabled];

    if (v10)
    {
      id v7 = (id *)MEMORY[0x1E4F38E80];
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v11 = @"com.apple.notes.textattachment";
LABEL_9:
  uint64_t v12 = [MEMORY[0x1E4F1C9B8] data];
  id v13 = [(ICAbstractTextAttachment *)self initWithData:v12 ofType:v11];

  if (v13) {
    [(ICAbstractTextAttachment *)v13 setAttachment:v4];
  }

  return v13;
}

- (id)image
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v3 = [MEMORY[0x1E4F1E050] emptyImage];
  id v4 = [v2 imageWithCIImage:v3];

  return v4;
}

- (BOOL)isUnsupported
{
  return 0;
}

- (BOOL)canDragWithoutSelecting
{
  return 1;
}

- (double)viewCornerRadius
{
  return 0.0;
}

- (void)fixAttachmentForAttributedString:(id)a3 range:(_NSRange)a4 forPlainText:(BOOL)a5 forStandardizedText:(BOOL)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v21 = a3;
  double v9 = [(ICBaseTextAttachment *)self attachmentAttributesForAttributedString];
  objc_msgSend(v21, "addAttributes:range:", v9, location, length);
  uint64_t v10 = *MEMORY[0x1E4FB06B8];
  double v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB06B8]];

  if (!v11) {
    objc_msgSend(v21, "removeAttribute:range:", v10, location, length);
  }
  uint64_t v12 = [(ICAbstractTextAttachment *)self attachment];
  id v13 = [v12 URL];

  if (v13)
  {
    uint64_t v14 = [(ICAbstractTextAttachment *)self attachment];
    v15 = [v14 title];
    if ([v15 length])
    {
      v16 = [(ICAbstractTextAttachment *)self attachment];
      id v17 = [v16 title];
    }
    else
    {
      id v17 = [v13 absoluteString];
    }

    objc_msgSend(v21, "replaceCharactersInRange:withString:", location, length, v17);
  }
  else
  {
    double v18 = [(ICBaseTextAttachment *)self attachmentAsNSTextAttachment];
    double v19 = [v18 fileWrapper];
    int v20 = [v19 isDirectory];

    if (v20) {
      objc_msgSend(v21, "replaceCharactersInRange:withString:", location, length, &stru_1F0973378);
    }
  }
}

- (id)attachmentAttributesForAttributedString
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(ICBaseTextAttachment *)self attachmentAsNSTextAttachment];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4FB06B8]];
  }
  id v5 = [(ICAbstractTextAttachment *)self attachment];
  id v6 = [v5 URL];

  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4FB0720]];
  }
  id v7 = (void *)[v3 copy];

  return v7;
}

- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 textContainer:(id)a5
{
  return 0;
}

- (signed)effectiveAttachmentViewSizeForTextContainer:(id)a3
{
  uint64_t v3 = [(ICAbstractTextAttachment *)self attachment];
  signed __int16 v4 = [v3 preferredViewSize];

  return v4;
}

- (BOOL)supportsUserConfigurablePresentationSizeForTextContainer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICBaseTextAttachment;
  if ([(ICAbstractTextAttachment *)&v9 supportsUserConfigurablePresentationSizeForTextContainer:v4])
  {
    int v5 = [(ICBaseTextAttachment *)self effectiveAttachmentViewSizeForTextContainer:v4];
    id v6 = [(ICAbstractTextAttachment *)self attachment];
    BOOL v7 = v5 == [v6 preferredViewSize];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)attachmentUTI
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3032000000;
  double v11 = __Block_byref_object_copy__50;
  uint64_t v12 = __Block_byref_object_dispose__50;
  id v13 = 0;
  uint64_t v3 = [(ICAbstractTextAttachment *)self attachment];
  id v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__ICBaseTextAttachment_attachmentUTI__block_invoke;
  v7[3] = &unk_1E5FD91F8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __37__ICBaseTextAttachment_attachmentUTI__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) attachment];
  uint64_t v2 = [v5 typeUTI];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __44__ICBaseTextAttachment_attachmentInContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F832A0];
  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectID];
  uint64_t v3 = objc_msgSend(v2, "ic_existingObjectWithID:context:", v6, *(void *)(a1 + 32));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)inlineAttachmentInContext:(id)a3
{
  return 0;
}

- (void)detachView:(id)a3 fromParentView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isFirstResponder])
  {
    uint64_t v8 = [v6 nextResponder];
    if (v8)
    {
      while (1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector()) {
          break;
        }
        uint64_t v9 = [v8 nextResponder];

        uint64_t v8 = (void *)v9;
        if (!v9) {
          goto LABEL_6;
        }
      }
      objc_opt_class();
      uint64_t v10 = ICDynamicCast();
    }
    else
    {
LABEL_6:
      uint64_t v10 = 0;
    }
    uint64_t v11 = [v10 shouldAvoidBecomingFirstResponder];
    [v10 setShouldAvoidBecomingFirstResponder:1];
    [v6 resignFirstResponder];
    [v10 setShouldAvoidBecomingFirstResponder:v11];
    id v12 = [v6 superview];

    if (v12 == v7) {
      [v6 removeFromSuperview];
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ICBaseTextAttachment;
    [(ICBaseTextAttachment *)&v13 detachView:v6 fromParentView:v7];
  }
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  v20.receiver = self;
  v20.super_class = (Class)ICBaseTextAttachment;
  -[ICBaseTextAttachment attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:](&v20, sel_attachmentBoundsForTextContainer_proposedLineFragment_glyphPosition_characterIndex_, a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = v6;
  if ((v11 == 0.0 || v6 == 0.0) && PKIsInlineDrawingOrPaperAttachment())
  {
    if (v12 == 0.0)
    {
      uint64_t v14 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[ICBaseTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:]();
      }

      double v12 = 1.0;
    }
    if (v13 == 0.0)
    {
      v15 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[ICBaseTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:]();
      }

      double v13 = 1.0;
    }
  }
  double v16 = v8;
  double v17 = v10;
  double v18 = v12;
  double v19 = v13;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Fixing zero-height inline drawing", v2, v3, v4, v5, v6);
}

- (void)attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Fixing zero-width inline drawing", v2, v3, v4, v5, v6);
}

@end