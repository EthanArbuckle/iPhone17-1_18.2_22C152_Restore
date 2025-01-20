@interface ICBrickTextAttachment
- (double)viewCornerRadius;
- (id)supportedPresentationSizes;
@end

@implementation ICBrickTextAttachment

- (id)supportedPresentationSizes
{
  v2 = [(ICAbstractTextAttachment *)self attachment];
  unsigned int v3 = [v2 attachmentType];

  if (v3 > 6 || ((1 << v3) & 0x54) == 0)
  {
    if (supportedPresentationSizes_onceToken_0 != -1) {
      dispatch_once(&supportedPresentationSizes_onceToken_0, &__block_literal_global_8);
    }
    id v5 = (id)supportedPresentationSizes_supportedSizes_0;
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

void __51__ICBrickTextAttachment_supportedPresentationSizes__block_invoke()
{
  v0 = (void *)supportedPresentationSizes_supportedSizes_0;
  supportedPresentationSizes_supportedSizes_0 = (uint64_t)&unk_1F09A3ED8;
}

- (double)viewCornerRadius
{
  return 16.0;
}

@end