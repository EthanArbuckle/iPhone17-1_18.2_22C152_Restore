@interface ICAttachmentPaperDocumentModel(PreviewGeneration)
- (BOOL)tooLargeForPreviewGeneration;
@end

@implementation ICAttachmentPaperDocumentModel(PreviewGeneration)

- (BOOL)tooLargeForPreviewGeneration
{
  v2 = [a1 attachment];
  int v3 = [v2 attachmentType];

  if (v3 == 15)
  {
    unint64_t v4 = [a1 paperPageCount];
    v5 = [MEMORY[0x1E4F83310] sharedConfiguration];
    unint64_t v6 = [v5 maxSubAttachmentsPerAttachment];

    if (v4 > v6) {
      return 1;
    }
  }
  v8 = [a1 paperBundleURL];
  uint64_t v9 = objc_msgSend(v8, "ic_fileOrDirectorySize");

  return v9 > 209715200;
}

@end