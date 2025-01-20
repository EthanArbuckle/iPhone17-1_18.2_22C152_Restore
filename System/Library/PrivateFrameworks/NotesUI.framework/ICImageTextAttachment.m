@interface ICImageTextAttachment
- (BOOL)requiresSpaceAfterAttachmentForPrinting;
- (BOOL)supportsMultipleThumbnailsOnSameLine;
- (id)supportedPresentationSizes;
@end

@implementation ICImageTextAttachment

- (BOOL)supportsMultipleThumbnailsOnSameLine
{
  return 1;
}

- (id)supportedPresentationSizes
{
  if (supportedPresentationSizes_onceToken_2 != -1) {
    dispatch_once(&supportedPresentationSizes_onceToken_2, &__block_literal_global_23);
  }
  v2 = (void *)supportedPresentationSizes_supportedSizes_2;
  return v2;
}

void __51__ICImageTextAttachment_supportedPresentationSizes__block_invoke()
{
  v0 = (void *)supportedPresentationSizes_supportedSizes_2;
  supportedPresentationSizes_supportedSizes_2 = (uint64_t)&unk_1F09A3F68;
}

- (BOOL)requiresSpaceAfterAttachmentForPrinting
{
  return 1;
}

@end