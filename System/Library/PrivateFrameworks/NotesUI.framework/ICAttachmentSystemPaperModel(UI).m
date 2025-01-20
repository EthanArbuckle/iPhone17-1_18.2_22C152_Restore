@interface ICAttachmentSystemPaperModel(UI)
- (ICAttachmentSystemPaperActivityItemSource)activityItem;
- (id)activityItems;
- (id)imageForActivityItem;
- (void)drawPreviewInRect:()UI;
@end

@implementation ICAttachmentSystemPaperModel(UI)

- (id)imageForActivityItem
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__25;
  v12 = __Block_byref_object_dispose__25;
  id v13 = 0;
  v2 = [a1 attachment];
  v3 = [v2 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__ICAttachmentSystemPaperModel_UI__imageForActivityItem__block_invoke;
  v7[3] = &unk_1E5FD91F8;
  v7[4] = a1;
  v7[5] = &v8;
  [v3 performBlockAndWait:v7];

  if (v9[5])
  {
    v4 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithData:");
    v5 = +[ICAttachmentPreviewImageLoader orientedImage:v4 withBackground:1];
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (ICAttachmentSystemPaperActivityItemSource)activityItem
{
  v2 = [ICAttachmentSystemPaperActivityItemSource alloc];
  v3 = [a1 attachment];
  v4 = [(ICAttachmentActivityItemSource *)v2 initWithAttachment:v3];

  return v4;
}

- (id)activityItems
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 activityItem];
  v3 = (void *)v2;
  if (v2)
  {
    v10[0] = v2;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v5 = [ICAttachmentActivityItemSource alloc];
  v6 = [a1 attachment];
  v7 = [(ICAttachmentActivityItemSource *)v5 initWithAttachment:v6];
  uint64_t v8 = [v4 arrayByAddingObject:v7];

  return v8;
}

- (void)drawPreviewInRect:()UI
{
  uint64_t v10 = [MEMORY[0x1E4F83298] currentInfo];
  v11 = [a1 attachment];
  v12 = +[ICSystemPaperImageGenerator imageGeneratorWithPaperAttachment:v11];

  [v12 setSixChannelBlendingEnabled:0];
  CurrentContext = UIGraphicsGetCurrentContext();
  ClipBoundingBoCGFloat x = CGContextGetClipBoundingBox(CurrentContext);
  v38.origin.CGFloat x = a2;
  v38.origin.CGFloat y = a3;
  v38.size.CGFloat width = a4;
  v38.size.CGFloat height = a5;
  CGRect v39 = CGRectIntersection(v38, ClipBoundingBox);
  CGFloat x = v39.origin.x;
  CGFloat y = v39.origin.y;
  CGFloat width = v39.size.width;
  CGFloat height = v39.size.height;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __54__ICAttachmentSystemPaperModel_UI__drawPreviewInRect___block_invoke;
  v23[3] = &unk_1E5FDAE10;
  CGFloat v26 = a2;
  CGFloat v27 = a3;
  CGFloat v28 = a4;
  CGFloat v29 = a5;
  v23[4] = a1;
  v25 = &v34;
  id v18 = v12;
  id v24 = v18;
  CGFloat v30 = x;
  CGFloat v31 = y;
  CGFloat v32 = width;
  CGFloat v33 = height;
  [v10 performAsDefaultAppearance:v23];
  if (!*((unsigned char *)v35 + 24))
  {
    v19 = [a1 attachment];
    v20 = [v19 fallbackImageData];

    if (v20)
    {
      v21 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithData:", v20);
      v22 = +[ICAttachmentPreviewImageLoader orientedImage:v21 withBackground:0];

      objc_msgSend(v22, "drawInRect:", a2, a3, a4, a5);
    }
  }
  _Block_object_dispose(&v34, 8);
}

@end