@interface ICAttachmentMovieModel(UI)
- (uint64_t)genericBrickThumbnailCreator;
- (uint64_t)genericListThumbnailCreator;
- (void)drawPreviewInRect:()UI;
@end

@implementation ICAttachmentMovieModel(UI)

- (uint64_t)genericListThumbnailCreator
{
  return 0;
}

- (uint64_t)genericBrickThumbnailCreator
{
  return 0;
}

- (void)drawPreviewInRect:()UI
{
  v9 = [a1 attachment];
  v10 = [v9 image];
  objc_msgSend(v10, "drawInRect:", a2, a3, a4, a5);

  id v20 = [MEMORY[0x1E4FB1818] imageNamed:@"attachment_video_play"];
  v22.origin.x = a2;
  v22.origin.y = a3;
  v22.size.width = a4;
  v22.size.height = a5;
  double MidX = CGRectGetMidX(v22);
  [v20 size];
  double v13 = MidX - v12 * 0.5;
  v23.origin.x = a2;
  v23.origin.y = a3;
  v23.size.width = a4;
  v23.size.height = a5;
  double MidY = CGRectGetMidY(v23);
  [v20 size];
  double v16 = MidY - v15 * 0.5;
  [v20 size];
  double v18 = v17;
  [v20 size];
  objc_msgSend(v20, "drawInRect:", v13, v16, v18, v19);
}

@end