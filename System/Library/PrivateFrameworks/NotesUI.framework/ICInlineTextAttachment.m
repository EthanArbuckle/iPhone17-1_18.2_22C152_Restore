@interface ICInlineTextAttachment
+ (Class)textAttachmentClassForAttachment:(id)a3;
+ (ICInlineTextAttachment)textAttachmentWithAttachment:(id)a3;
+ (NSCache)imageCache;
- (BOOL)isUnsupported;
- (Class)attachmentViewClassForTextContainer:(id)a3;
- (ICInlineTextAttachment)initWithAttachment:(id)a3;
- (id)altText;
- (id)attachmentAttributesForAttributedString;
- (id)attachmentIdentifier;
- (id)attachmentInContext:(id)a3;
- (id)attachmentUTI;
- (id)displayText;
- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6;
- (id)inlineAttachmentInContext:(id)a3;
- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 styleAttributes:(id)a5 textContainer:(id)a6;
- (void)fixAttachmentForAttributedString:(id)a3 range:(_NSRange)a4 forPlainText:(BOOL)a5 forStandardizedText:(BOOL)a6;
@end

@implementation ICInlineTextAttachment

+ (NSCache)imageCache
{
  if (imageCache_onceToken_1 != -1) {
    dispatch_once(&imageCache_onceToken_1, &__block_literal_global_46);
  }
  v2 = (void *)imageCache_imageCache_1;
  return (NSCache *)v2;
}

uint64_t __36__ICInlineTextAttachment_imageCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  imageCache_imageCache_1 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

- (ICInlineTextAttachment)initWithAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 typeUTI];
  v6 = (void *)v5;
  v7 = (void *)*MEMORY[0x1E4F83180];
  if (v5) {
    v7 = (void *)v5;
  }
  id v8 = v7;

  v9 = [MEMORY[0x1E4F1C9B8] data];
  v12.receiver = self;
  v12.super_class = (Class)ICInlineTextAttachment;
  v10 = [(ICAbstractTextAttachment *)&v12 initWithData:v9 ofType:v8];

  if (v10) {
    [(ICAbstractTextAttachment *)v10 setAttachment:v4];
  }

  return v10;
}

- (BOOL)isUnsupported
{
  v2 = [(ICAbstractTextAttachment *)self attachment];
  char v3 = [v2 isUnsupported];

  return v3;
}

- (id)attachmentInContext:(id)a3
{
  return 0;
}

- (id)inlineAttachmentInContext:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__43;
  v16 = __Block_byref_object_dispose__43;
  id v17 = [(ICAbstractTextAttachment *)self attachment];
  uint64_t v5 = (void *)v13[5];
  if (v5)
  {
    id v6 = [v5 managedObjectContext];

    if (v6 != v4)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __52__ICInlineTextAttachment_inlineAttachmentInContext___block_invoke;
      v9[3] = &unk_1E5FD91F8;
      v11 = &v12;
      id v10 = v4;
      [v10 performBlockAndWait:v9];
    }
  }
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__ICInlineTextAttachment_inlineAttachmentInContext___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F833A0];
  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectID];
  uint64_t v3 = objc_msgSend(v2, "ic_existingObjectWithID:context:", v6, *(void *)(a1 + 32));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)attachmentAttributesForAttributedString
{
  return (id)[MEMORY[0x1E4F1C9E8] dictionary];
}

- (void)fixAttachmentForAttributedString:(id)a3 range:(_NSRange)a4 forPlainText:(BOOL)a5 forStandardizedText:(BOOL)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  v18.NSUInteger location = objc_msgSend(v9, "ic_range");
  v18.NSUInteger length = v10;
  v17.NSUInteger location = location;
  v17.NSUInteger length = length;
  NSRange v11 = NSIntersectionRange(v17, v18);
  if (v11.length)
  {
    uint64_t v12 = [(ICInlineTextAttachment *)self attachmentAttributesForAttributedString];
    objc_msgSend(v9, "addAttributes:range:", v12, v11.location, v11.length);
    uint64_t v13 = *MEMORY[0x1E4FB06B8];
    uint64_t v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4FB06B8]];

    if (!v14) {
      objc_msgSend(v9, "removeAttribute:range:", v13, v11.location, v11.length);
    }
    v15 = [(ICInlineTextAttachment *)self displayText];
    objc_msgSend(v9, "replaceCharactersInRange:withString:", v11.location, v11.length, v15);
  }
  else
  {
    v16 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ICInlineTextAttachment fixAttachmentForAttributedString:range:forPlainText:forStandardizedText:](self, v16);
    }
  }
}

+ (ICInlineTextAttachment)textAttachmentWithAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "textAttachmentClassForAttachment:", v4)), "initWithAttachment:", v4);

  return (ICInlineTextAttachment *)v5;
}

+ (Class)textAttachmentClassForAttachment:(id)a3
{
  if ([a3 attachmentType] > 5) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = objc_opt_class();
  }
  return (Class)v3;
}

- (Class)attachmentViewClassForTextContainer:(id)a3
{
  return (Class)objc_opt_class();
}

- (id)attachmentIdentifier
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  NSRange v11 = __Block_byref_object_copy__43;
  uint64_t v12 = __Block_byref_object_dispose__43;
  id v13 = 0;
  uint64_t v3 = [(ICAbstractTextAttachment *)self attachment];
  id v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__ICInlineTextAttachment_attachmentIdentifier__block_invoke;
  v7[3] = &unk_1E5FD91F8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __46__ICInlineTextAttachment_attachmentIdentifier__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) attachment];
  uint64_t v2 = [v5 identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)attachmentUTI
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  NSRange v11 = __Block_byref_object_copy__43;
  uint64_t v12 = __Block_byref_object_dispose__43;
  id v13 = 0;
  uint64_t v3 = [(ICAbstractTextAttachment *)self attachment];
  id v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__ICInlineTextAttachment_attachmentUTI__block_invoke;
  v7[3] = &unk_1E5FD91F8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __39__ICInlineTextAttachment_attachmentUTI__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) attachment];
  uint64_t v2 = [v5 typeUTI];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)altText
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  NSRange v11 = __Block_byref_object_copy__43;
  uint64_t v12 = __Block_byref_object_dispose__43;
  id v13 = 0;
  uint64_t v3 = [(ICAbstractTextAttachment *)self attachment];
  id v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__ICInlineTextAttachment_altText__block_invoke;
  v7[3] = &unk_1E5FD91F8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __33__ICInlineTextAttachment_altText__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) attachment];
  uint64_t v2 = [v5 altText];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)displayText
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  NSRange v11 = __Block_byref_object_copy__43;
  uint64_t v12 = __Block_byref_object_dispose__43;
  id v13 = 0;
  uint64_t v3 = [(ICAbstractTextAttachment *)self attachment];
  id v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__ICInlineTextAttachment_displayText__block_invoke;
  v7[3] = &unk_1E5FD91F8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __37__ICInlineTextAttachment_displayText__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) attachment];
  uint64_t v2 = [v5 displayText];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  uint64_t v10 = [(id)objc_opt_class() imageCache];
  NSRange v11 = [(ICInlineTextAttachment *)self attachmentIdentifier];
  uint64_t v12 = [v10 objectForKey:v11];

  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    objc_opt_class();
    uint64_t v14 = [(ICAbstractTextAttachment *)self newlyCreatedViewForTextContainer:v9];
    v15 = ICDynamicCast();

    if (v15)
    {
      v16 = [v9 textView];
      NSRange v17 = [v16 tintColor];
      [v15 setTintColor:v17];

      [v15 updateStyleWithAttributes:v8];
      [v15 intrinsicContentSize];
      double v19 = v18;
      [v15 intrinsicContentSize];
      objc_msgSend(v15, "setFrame:", 0.0, 0.0, v19, v20);
      v21 = objc_msgSend(v15, "ic_imageRenderedFromViewHierarchyAfterScreenUpdates:", 1);
      v22 = [(id)objc_opt_class() imageCache];
      v23 = [(ICInlineTextAttachment *)self attachmentIdentifier];
      [v22 setObject:v21 forKey:v23];

      id v13 = v21;
    }
    else
    {
      id v13 = 0;
    }
  }
  return v13;
}

- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 styleAttributes:(id)a5 textContainer:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = [ICPrintableTextAttachment alloc];
  id v13 = [MEMORY[0x1E4F1C9B8] data];
  uint64_t v14 = [(ICInlineTextAttachment *)self attachmentUTI];
  v15 = [(ICPrintableTextAttachment *)v12 initWithData:v13 ofType:v14];

  v16 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v15];
  objc_opt_class();
  NSRange v17 = [(ICAbstractTextAttachment *)self newlyCreatedViewForTextContainer:v10];

  double v18 = ICDynamicCast();

  double v19 = objc_msgSend(MEMORY[0x1E4FB1618], "ic_tintColorWithTraitCollection:", v11);

  [v18 setTintColor:v19];
  if (v18)
  {
    [v18 updateStyleWithAttributes:v9];
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      [v18 intrinsicContentSize];
      double v21 = v20;
      [v18 intrinsicContentSize];
      objc_msgSend(v18, "setFrame:", 0.0, 0.0, v21, v22);
    }
    v23 = [v18 imageForPrinting];
    [(ICPrintableTextAttachment *)v15 setImage:v23];

    [v18 baselineOffsetFromBottom];
    -[ICPrintableTextAttachment setFrameOffset:](v15, "setFrameOffset:", 0.0, -v24);
  }

  return v16;
}

- (void)fixAttachmentForAttributedString:(void *)a1 range:(NSObject *)a2 forPlainText:forStandardizedText:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 attachment];
  id v4 = [v3 shortLoggingDescription];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Not fixing inline attachment for string because range is invalid {attachment: %@}", (uint8_t *)&v5, 0xCu);
}

@end