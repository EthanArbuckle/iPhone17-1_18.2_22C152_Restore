@interface ICAbstractTextAttachment
+ (id)textAttachmentWithBaseAttachment:(id)a3;
- (BOOL)allowsTextAttachmentView;
- (BOOL)containsFindableText;
- (BOOL)isEqualToModelComparable:(id)a3;
- (BOOL)isUnsupported;
- (BOOL)supportsMultiplePresentationSizes;
- (BOOL)supportsMultipleThumbnailsOnSameLine;
- (BOOL)usesTextAttachmentView;
- (Class)attachmentViewClassForTextContainer:(id)a3;
- (Class)attachmentViewControllerClass;
- (ICAbstractTextAttachment)initWithData:(id)a3 ofType:(id)a4;
- (ICBaseAttachment)attachment;
- (NSArray)supportedPresentationSizes;
- (NSString)attachmentIdentifier;
- (NSString)attachmentUTI;
- (NSString)viewIdentifier;
- (UIColor)highlightColor;
- (double)foregroundAlpha;
- (id)attachmentInContext:(id)a3;
- (id)inlineAttachmentInContext:(id)a3;
- (id)newlyCreatedViewForManualRendering:(BOOL)a3 textContainer:(id)a4;
- (id)newlyCreatedViewForManualRenderingInTextContainer:(id)a3;
- (id)newlyCreatedViewForTextContainer:(id)a3;
- (void)setAttachment:(id)a3;
- (void)setForegroundAlpha:(double)a3;
- (void)setHighlightColor:(id)a3;
@end

@implementation ICAbstractTextAttachment

- (BOOL)usesTextAttachmentView
{
  return 1;
}

- (NSString)viewIdentifier
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__44;
  v12 = __Block_byref_object_dispose__44;
  id v13 = 0;
  v3 = [(ICAbstractTextAttachment *)self attachment];
  v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__ICAbstractTextAttachment_viewIdentifier__block_invoke;
  v7[3] = &unk_1E5FD91F8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __42__ICAbstractTextAttachment_viewIdentifier__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) attachment];
  uint64_t v2 = [v5 identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (ICBaseAttachment)attachment
{
  return self->_attachment;
}

- (void)setHighlightColor:(id)a3
{
}

- (void)setForegroundAlpha:(double)a3
{
  self->_foregroundAlpha = a3;
}

- (ICAbstractTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ICAbstractTextAttachment;
  result = [(ICAbstractTextAttachment *)&v5 initWithData:a3 ofType:a4];
  if (result) {
    result->_foregroundAlpha = 1.0;
  }
  return result;
}

- (void)setAttachment:(id)a3
{
}

- (BOOL)supportsMultiplePresentationSizes
{
  uint64_t v2 = [(ICAbstractTextAttachment *)self supportedPresentationSizes];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (id)newlyCreatedViewForTextContainer:(id)a3
{
  return [(ICAbstractTextAttachment *)self newlyCreatedViewForManualRendering:0 textContainer:a3];
}

- (id)newlyCreatedViewForManualRendering:(BOOL)a3 textContainer:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(ICAbstractTextAttachment *)self attachmentViewClassForTextContainer:v6];
  if ([(objc_class *)v7 conformsToProtocol:&unk_1F09B44F0])
  {
    id v8 = (id)[[v7 alloc] initWithTextAttachment:self textContainer:v6 forManualRendering:v4];
LABEL_5:
    v9 = v8;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_alloc_init(v7);
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

+ (id)textAttachmentWithBaseAttachment:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = ICDynamicCast();
  if (v4)
  {
    objc_super v5 = [[ICInlineTextAttachment alloc] initWithAttachment:v4];
  }
  else
  {
    objc_opt_class();
    id v6 = ICDynamicCast();
    if (v6) {
      objc_super v5 = (ICInlineTextAttachment *)objc_msgSend(objc_alloc(+[ICTextAttachment textAttachmentClassForAttachment:](ICTextAttachment, "textAttachmentClassForAttachment:", v6)), "initWithAttachment:", v6);
    }
    else {
      objc_super v5 = 0;
    }
  }
  return v5;
}

- (BOOL)isUnsupported
{
  return 1;
}

- (Class)attachmentViewClassForTextContainer:(id)a3
{
  BOOL v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ICAbstractTextAttachment attachmentViewClassForTextContainer:]((uint64_t)self, v4);
  }

  objc_super v5 = objc_opt_class();
  return (Class)v5;
}

- (id)newlyCreatedViewForManualRenderingInTextContainer:(id)a3
{
  return [(ICAbstractTextAttachment *)self newlyCreatedViewForManualRendering:1 textContainer:a3];
}

- (Class)attachmentViewControllerClass
{
  return 0;
}

- (NSArray)supportedPresentationSizes
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)supportsMultipleThumbnailsOnSameLine
{
  return 0;
}

- (BOOL)isEqualToModelComparable:(id)a3
{
  return [MEMORY[0x1E4F834B0] isAttachment:self equalToModelComparable:a3];
}

- (NSString)attachmentIdentifier
{
  return (NSString *)&stru_1F0973378;
}

- (NSString)attachmentUTI
{
  return (NSString *)&stru_1F0973378;
}

- (id)attachmentInContext:(id)a3
{
  return 0;
}

- (id)inlineAttachmentInContext:(id)a3
{
  return 0;
}

- (BOOL)allowsTextAttachmentView
{
  return 1;
}

- (BOOL)containsFindableText
{
  uint64_t v2 = [(ICAbstractTextAttachment *)self attachmentViewControllerClass];
  return [(objc_class *)v2 conformsToProtocol:&unk_1F0A65A58];
}

- (double)foregroundAlpha
{
  return self->_foregroundAlpha;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
}

- (void)attachmentViewClassForTextContainer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "Trying to get a view class for an attachment with an unknown text attachment type: %@", (uint8_t *)&v2, 0xCu);
}

@end