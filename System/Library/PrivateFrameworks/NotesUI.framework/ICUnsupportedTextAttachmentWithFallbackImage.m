@interface ICUnsupportedTextAttachmentWithFallbackImage
- (BOOL)supportsMultipleThumbnailsOnSameLine;
- (id)attachmentAsNSTextAttachment;
- (id)fileType;
@end

@implementation ICUnsupportedTextAttachmentWithFallbackImage

- (id)attachmentAsNSTextAttachment
{
  v2 = [(ICAbstractTextAttachment *)self attachment];
  v3 = [v2 fallbackImageData];

  id v4 = objc_alloc(MEMORY[0x1E4FB0870]);
  v5 = [MEMORY[0x1E4F832A0] fallbackImageUTI];
  v6 = (void *)[v4 initWithData:v3 ofType:v5];

  return v6;
}

- (BOOL)supportsMultipleThumbnailsOnSameLine
{
  return 0;
}

- (id)fileType
{
  v3 = (void *)MEMORY[0x1E4F832A0];
  id v4 = [(ICBaseTextAttachment *)self attachmentUTI];
  if ([v3 typeUTIIsInlineDrawing:v4])
  {

LABEL_4:
    v7 = 0;
    goto LABEL_6;
  }
  v5 = (void *)MEMORY[0x1E4F832A0];
  v6 = [(ICBaseTextAttachment *)self attachmentUTI];
  LOBYTE(v5) = [v5 typeUTIIsSystemPaper:v6];

  if (v5) {
    goto LABEL_4;
  }
  v9.receiver = self;
  v9.super_class = (Class)ICUnsupportedTextAttachmentWithFallbackImage;
  v7 = [(ICUnsupportedTextAttachmentWithFallbackImage *)&v9 fileType];
LABEL_6:
  return v7;
}

@end