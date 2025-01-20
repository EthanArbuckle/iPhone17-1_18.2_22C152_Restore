@interface ICTextAttachment
+ (BOOL)textAttachmentIsContent:(id)a3;
+ (Class)textAttachmentClassForAttachment:(id)a3;
+ (double)defaultAttachmentThumbnailViewHeight;
+ (id)textAttachmentWithAttachment:(id)a3;
- ($01BB1521EC52D44A8E7628F5261DCEC8)attachmentBoundsMargins;
- (BOOL)isUnsupported;
- (BOOL)requiresSpaceAfterAttachmentForPrinting;
- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7;
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (CGRect)attachmentBoundsIncludingMarginsFromAttachmentBounds:(CGRect)a3;
- (CGSize)attachmentSizeForTextContainer:(id)a3;
- (ICTextAttachment)initWithData:(id)a3 ofType:(id)a4;
- (double)availableWidthForTextContainer:(id)a3;
- (id)attachmentAsNSTextAttachment;
- (id)attachmentFileWrapper;
- (void)attachmentFileWrapper;
@end

@implementation ICTextAttachment

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  double height = a6.size.height;
  double width = a6.size.width;
  double v11 = a6.origin.y;
  double v12 = a6.origin.x;
  id v16 = a3;
  id v17 = a5;
  v44.receiver = self;
  v44.super_class = (Class)ICTextAttachment;
  -[ICBaseTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](&v44, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, v16, a4, v17, v12, v11, width, height, x, y);
  double v19 = v18;
  double v21 = v20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v22 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
      v23 = v22;
      if (v22)
      {
        [v22 descender];
        double v21 = v21 + v24;
      }
    }
  }
  -[ICTextAttachment attachmentSizeForTextContainer:proposedLineFragment:](self, "attachmentSizeForTextContainer:proposedLineFragment:", v17, v12, v11, width, height);
  if (v25 >= 1.0) {
    double v27 = v25;
  }
  else {
    double v27 = 1.0;
  }
  if (v26 >= 1.0) {
    double v28 = v26;
  }
  else {
    double v28 = 1.0;
  }
  if ([(ICAbstractTextAttachment *)self supportsMultipleThumbnailsOnSameLine])
  {
    v29 = [(ICAbstractTextAttachment *)self attachment];
    int v30 = [v29 preferredViewSize];

    if (v30 == 1)
    {
      [(id)objc_opt_class() defaultAttachmentThumbnailViewHeight];
      double v28 = v31;
      double v27 = fmax(v27, 30.0);
    }
  }
  -[ICTextAttachment attachmentBoundsIncludingMarginsFromAttachmentBounds:](self, "attachmentBoundsIncludingMarginsFromAttachmentBounds:", v19, v21, v27, v28);
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  double v40 = v33;
  double v41 = v35;
  double v42 = v37;
  double v43 = v39;
  result.size.double height = v43;
  result.size.double width = v42;
  result.origin.double y = v41;
  result.origin.double x = v40;
  return result;
}

- (CGRect)attachmentBoundsIncludingMarginsFromAttachmentBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(ICTextAttachment *)self attachmentBoundsMargins];
  double v9 = width + v7 + v8;
  double v12 = height + v10 + v11;
  double v13 = x;
  double v14 = y;
  double v15 = v9;
  result.size.double height = v12;
  result.size.double width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)attachmentBoundsMargins
{
  v3 = [(ICAbstractTextAttachment *)self attachment];
  if ([v3 preferredViewSize] == 1)
  {
    BOOL v4 = [(ICAbstractTextAttachment *)self supportsMultipleThumbnailsOnSameLine];

    if (v4) {
      double v5 = 2.0;
    }
    else {
      double v5 = 0.0;
    }
    double v6 = 4.0;
    if (!v4) {
      double v6 = 0.0;
    }
  }
  else
  {

    double v5 = 0.0;
    double v6 = 0.0;
  }
  double v7 = 0.0;
  double v8 = v5;
  result.var3 = v8;
  result.var2 = v5;
  result.var1 = v6;
  result.var0 = v7;
  return result;
}

+ (id)textAttachmentWithAttachment:(id)a3
{
  id v4 = a3;
  double v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "textAttachmentClassForAttachment:", v4)), "initWithAttachment:", v4);

  return v5;
}

- (ICTextAttachment)initWithData:(id)a3 ofType:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ICTextAttachment;
  return [(ICAbstractTextAttachment *)&v5 initWithData:a3 ofType:a4];
}

+ (BOOL)textAttachmentIsContent:(id)a3
{
  id v3 = a3;
  if (!textAttachmentIsContent__UIDictationClass) {
    textAttachmentIsContent__UIDictationClass = (uint64_t)NSClassFromString(&cfstr_Uidictationatt.isa);
  }
  if (!textAttachmentIsContent__UITextPlaceholderAttachment) {
    textAttachmentIsContent__UITextPlaceholderAttachment = (uint64_t)NSClassFromString(&cfstr_Uitextplacehol.isa);
  }
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    objc_super v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    int v4 = [v6 isEqualToString:@"_UIAnimatedTextAttachment"] ^ 1;
  }
  return v4;
}

+ (Class)textAttachmentClassForAttachment:(id)a3
{
  id v3 = a3;
  if ([v3 isAuthenticated])
  {
    int v4 = [v3 media];
    if (v4)
    {
      objc_super v5 = [v3 media];
      int v6 = [v5 isAuthenticated];
    }
    else
    {
      int v6 = 1;
    }
  }
  else
  {
    int v6 = 0;
  }
  if (([v3 needsInitialFetchFromCloud] & 1) != 0
    || (([v3 isPasswordProtected] ^ 1 | v6) & 1) != 0)
  {
    switch([v3 attachmentType])
    {
      case 0u:
      case 2u:
      case 3u:
      case 5u:
      case 7u:
      case 8u:
      case 9u:
      case 0xAu:
      case 0xCu:
        break;
      case 1u:
        if ((([v3 isPasswordProtected] & 1) != 0 || !objc_msgSend(v3, "hasFallbackPDF"))
          && ([v3 isPasswordProtected] & 1) == 0)
        {
          goto LABEL_27;
        }
        break;
      case 4u:
        ICInternalSettingsIsAudioTranscriptionEnabled();
        break;
      case 6u:
        +[ICPaperDocumentTextAttachment isEnabled];
        break;
      case 0xBu:
        +[ICPaperDocumentTextAttachment isEnabled];
        break;
      case 0xDu:
        if (!+[ICSystemPaperTextAttachment isEnabled]) {
          goto LABEL_25;
        }
        break;
      case 0xEu:
      case 0xFu:
        if (!+[ICPaperDocumentTextAttachment isEnabled])
        {
LABEL_25:
          if (![v3 hasFallbackPDF]) {
LABEL_27:
          }
            [v3 hasFallbackImage];
        }
        break;
      default:
        double v8 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          +[ICTextAttachment textAttachmentClassForAttachment:]((uint64_t)v3, v8);
        }

        break;
    }
    id v7 = (id)objc_opt_class();
  }
  else
  {
    objc_opt_class();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v9 = v7;

  return (Class)v9;
}

+ (double)defaultAttachmentThumbnailViewHeight
{
  return 88.0;
}

- (id)attachmentFileWrapper
{
  id v3 = [(ICAbstractTextAttachment *)self attachment];
  int v4 = [v3 media];
  int v5 = [v4 isValid];

  if (!v5) {
    goto LABEL_8;
  }
  int v6 = [(ICAbstractTextAttachment *)self attachment];
  id v7 = [v6 media];
  int v8 = [v7 isPasswordProtected];

  if (v8)
  {
    double v9 = [(ICAbstractTextAttachment *)self attachment];
    double v10 = [v9 media];
    int v11 = [v10 isAuthenticated];

    if (v11)
    {
      double v12 = [(ICAbstractTextAttachment *)self attachment];
      double v13 = [v12 media];
      double v14 = [v13 decryptedData];

      if (v14)
      {
        double v15 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initRegularFileWithContents:v14];
        id v16 = [(ICAbstractTextAttachment *)self attachment];
        id v17 = [v16 media];
        double v18 = [v17 filename];

        if (![v18 length])
        {
          double v19 = (void *)MEMORY[0x1E4F832A0];
          double v20 = [(ICBaseTextAttachment *)self attachmentUTI];
          uint64_t v21 = [v19 filenameFromUTI:v20];

          double v18 = (void *)v21;
        }
        [v15 setPreferredFilename:v18];
      }
      else
      {
        double v15 = 0;
      }

      goto LABEL_15;
    }
LABEL_8:
    double v15 = 0;
    goto LABEL_15;
  }
  id v22 = objc_alloc(MEMORY[0x1E4F28CF0]);
  v23 = [(ICAbstractTextAttachment *)self attachment];
  double v24 = [v23 media];
  double v25 = [v24 mediaURL];
  id v29 = 0;
  double v15 = (void *)[v22 initWithURL:v25 options:0 error:&v29];
  id v26 = v29;

  if (v26)
  {
    double v27 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      [(ICTextAttachment *)(uint64_t)v26 attachmentFileWrapper];
    }
  }
LABEL_15:
  return v15;
}

- (id)attachmentAsNSTextAttachment
{
  v2 = [(ICTextAttachment *)self attachmentFileWrapper];
  if (v2)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB0870]) initWithData:0 ofType:0];
    [v3 setFileWrapper:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)isUnsupported
{
  v2 = [(ICAbstractTextAttachment *)self attachment];
  char v3 = [v2 isUnsupported];

  return v3;
}

- (BOOL)requiresSpaceAfterAttachmentForPrinting
{
  return 0;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  -[ICTextAttachment attachmentSizeForTextContainer:proposedLineFragment:](self, "attachmentSizeForTextContainer:proposedLineFragment:", a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
  if (v7 >= 1.0) {
    double v9 = v7;
  }
  else {
    double v9 = 1.0;
  }
  if (v8 >= 1.0) {
    double v10 = v8;
  }
  else {
    double v10 = 1.0;
  }
  if ([(ICAbstractTextAttachment *)self supportsMultipleThumbnailsOnSameLine])
  {
    int v11 = [(ICAbstractTextAttachment *)self attachment];
    int v12 = [v11 preferredViewSize];

    if (v12 == 1)
    {
      [(id)objc_opt_class() defaultAttachmentThumbnailViewHeight];
      double v10 = v13;
      double v9 = fmax(v9, 30.0);
    }
  }
  -[ICTextAttachment attachmentBoundsIncludingMarginsFromAttachmentBounds:](self, "attachmentBoundsIncludingMarginsFromAttachmentBounds:", 0.0, 0.0, v9, v10);
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGSize)attachmentSizeForTextContainer:(id)a3
{
  int v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[ICTextAttachment attachmentSizeForTextContainer:]((uint64_t)self, v4);
  }

  double v5 = 320.0;
  double v6 = 240.0;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (double)availableWidthForTextContainer:(id)a3
{
  id v3 = a3;
  [v3 size];
  double v5 = v4;
  [v3 lineFragmentPadding];
  double v7 = v6;

  double result = v5 + v7 * -2.0;
  if (result < 1.0) {
    return 1.0;
  }
  return result;
}

+ (void)textAttachmentClassForAttachment:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "Asking for a text attachment class for an unknown UT type: %@", (uint8_t *)&v2, 0xCu);
}

- (void)attachmentFileWrapper
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Error creating attachment file wrapper: %@", (uint8_t *)&v2, 0xCu);
}

- (void)attachmentSizeForTextContainer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Trying to get the size of an attachment with an unknown text attachment type: %@", (uint8_t *)&v2, 0xCu);
}

@end