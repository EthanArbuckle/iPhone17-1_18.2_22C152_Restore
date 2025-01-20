@interface ICUnsupportedTextAttachmentWithFallbackPDF
- (BOOL)supportsMultipleThumbnailsOnSameLine;
- (id)attachmentAsNSTextAttachment;
@end

@implementation ICUnsupportedTextAttachmentWithFallbackPDF

- (id)attachmentAsNSTextAttachment
{
  v2 = [(ICAbstractTextAttachment *)self attachment];
  v3 = [v2 fallbackPDFData];

  id v4 = objc_alloc(MEMORY[0x1E4FB0870]);
  v5 = [MEMORY[0x1E4F832A0] fallbackPDFUTI];
  v6 = (void *)[v4 initWithData:v3 ofType:v5];

  return v6;
}

- (BOOL)supportsMultipleThumbnailsOnSameLine
{
  return 0;
}

@end