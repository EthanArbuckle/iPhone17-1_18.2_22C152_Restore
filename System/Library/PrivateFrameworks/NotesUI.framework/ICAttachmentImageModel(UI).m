@interface ICAttachmentImageModel(UI)
- (id)activityItems;
- (uint64_t)genericBrickThumbnailCreator;
- (uint64_t)genericListThumbnailCreator;
- (void)drawPreviewInRect:()UI;
@end

@implementation ICAttachmentImageModel(UI)

- (uint64_t)genericListThumbnailCreator
{
  return 0;
}

- (uint64_t)genericBrickThumbnailCreator
{
  return 0;
}

- (id)activityItems
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [ICAttachmentImageActivityItemSource alloc];
  v3 = [a1 attachment];
  v4 = [(ICAttachmentActivityItemSource *)v2 initWithAttachment:v3];
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (void)drawPreviewInRect:()UI
{
  id v10 = [a1 attachment];
  v9 = [v10 image];
  objc_msgSend(v9, "drawInRect:", a2, a3, a4, a5);
}

@end