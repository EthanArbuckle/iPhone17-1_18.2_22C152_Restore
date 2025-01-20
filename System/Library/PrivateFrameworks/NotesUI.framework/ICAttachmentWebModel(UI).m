@interface ICAttachmentWebModel(UI)
+ (id)genericBrickThumbnailWithSize:()UI scale:;
- (id)genericBrickLargeThumbnailCreator;
- (id)genericBrickThumbnailCreator;
- (void)genericListThumbnailCreator;
@end

@implementation ICAttachmentWebModel(UI)

- (void)genericListThumbnailCreator
{
  return &__block_literal_global_52;
}

- (id)genericBrickThumbnailCreator
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__ICAttachmentWebModel_UI__genericBrickThumbnailCreator__block_invoke;
  aBlock[3] = &unk_1E5FDC220;
  aBlock[4] = a1;
  v1 = _Block_copy(aBlock);
  return v1;
}

- (id)genericBrickLargeThumbnailCreator
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__ICAttachmentWebModel_UI__genericBrickLargeThumbnailCreator__block_invoke;
  aBlock[3] = &unk_1E5FDC220;
  aBlock[4] = a1;
  v1 = _Block_copy(aBlock);
  return v1;
}

+ (id)genericBrickThumbnailWithSize:()UI scale:
{
  v4 = [MEMORY[0x1E4FB1618] colorWithRed:0.890196078 green:0.894117647 blue:0.901960784 alpha:1.0];
  v5 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageNamed:withTint:size:", @"attachment_brick_weblink_generic_thumb", v4, a1, a2);

  return v5;
}

@end