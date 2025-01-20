@interface ICAttachmentMovieModel
+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3;
- (BOOL)hasPreviews;
- (BOOL)hasThumbnailImage;
- (BOOL)shouldUsePlaceholderBoundsIfNecessary;
- (CGSize)intrinsicContentSize;
- (double)placeholderHeight;
- (double)placeholderWidth;
- (id)asset;
- (id)placeholderImageSystemName;
- (void)addLocation;
- (void)updateAttachmentSize;
- (void)updateFileBasedAttributes;
@end

@implementation ICAttachmentMovieModel

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  v4 = NSString;
  v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"NOTE_LIST_VIDEOS_%lu" value:@"NOTE_LIST_VIDEOS_%lu" table:0 allowSiri:1];
  v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);

  return v6;
}

- (BOOL)hasPreviews
{
  return 1;
}

- (BOOL)hasThumbnailImage
{
  v9.receiver = self;
  v9.super_class = (Class)ICAttachmentMovieModel;
  if (![(ICAttachmentModel *)&v9 hasThumbnailImage]) {
    return 0;
  }
  v3 = [(ICAttachmentModel *)self attachment];
  [v3 sizeWidth];
  if (v4 <= 0.0)
  {
    BOOL v7 = 0;
  }
  else
  {
    v5 = [(ICAttachmentModel *)self attachment];
    [v5 sizeHeight];
    BOOL v7 = v6 > 0.0;
  }
  return v7;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v10 = 0;
  v11 = (double *)&v10;
  uint64_t v12 = 0x3010000000;
  v13 = &unk_1C3E4C23B;
  long long v14 = *MEMORY[0x1E4F1DB30];
  v3 = [(ICAttachmentModel *)self attachment];
  double v4 = [v3 managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__ICAttachmentMovieModel_intrinsicContentSize__block_invoke;
  v9[3] = &unk_1E64A4528;
  v9[4] = self;
  v9[5] = &v10;
  [v4 performBlockAndWait:v9];

  double v5 = v11[4];
  double v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  double v7 = v5;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

void __46__ICAttachmentMovieModel_intrinsicContentSize__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) attachment];
  [v7 sizeWidth];
  uint64_t v3 = v2;
  double v4 = [*(id *)(a1 + 32) attachment];
  [v4 sizeHeight];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v6;
}

- (void)updateAttachmentSize
{
  uint64_t v3 = [(ICAttachmentModel *)self attachment];
  double v4 = [v3 media];
  int v5 = [v4 isValid];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F166C8];
    id v7 = [(ICAttachmentModel *)self attachment];
    double v8 = [v7 media];
    objc_super v9 = [v8 mediaURL];
    uint64_t v10 = objc_msgSend(v6, "ic_safeURLAssetWithURL:", v9);

    uint64_t v11 = *MEMORY[0x1E4F15C18];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__ICAttachmentMovieModel_updateAttachmentSize__block_invoke;
    v14[3] = &unk_1E64A73C8;
    v14[4] = self;
    id v15 = v10;
    id v12 = v10;
    [v12 loadTracksWithMediaType:v11 completionHandler:v14];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ICAttachmentMovieModel;
    [(ICAttachmentModel *)&v13 updateAttachmentSize];
  }
}

void __46__ICAttachmentMovieModel_updateAttachmentSize__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstObject];
  if (v3)
  {
    double v4 = [*(id *)(a1 + 32) attachment];
    int v5 = [v4 managedObjectContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__ICAttachmentMovieModel_updateAttachmentSize__block_invoke_2;
    v9[3] = &unk_1E64A4500;
    id v6 = v3;
    uint64_t v7 = *(void *)(a1 + 32);
    double v8 = *(void **)(a1 + 40);
    id v10 = v6;
    uint64_t v11 = v7;
    id v12 = v8;
    [v5 performBlock:v9];
  }
}

void __46__ICAttachmentMovieModel_updateAttachmentSize__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) naturalSize];
  double v3 = v2;
  double v5 = v4;
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    [v6 preferredTransform];
    double v7 = *((double *)&v34 + 1);
    double v8 = *(double *)&v34;
    double v9 = *((double *)&v35 + 1);
    double v10 = *(double *)&v35;
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v34 = 0u;
    double v9 = 0.0;
    double v7 = 0.0;
    double v10 = 0.0;
    double v8 = 0.0;
  }
  double v11 = v5 * v9 + v7 * v3;
  double v12 = round(fabs(v5 * v10 + v8 * v3));
  double v13 = round(fabs(v11));
  long long v14 = [*(id *)(a1 + 40) attachment];
  [v14 sizeWidth];
  double v16 = v15;

  BOOL v17 = v16 != v12;
  if (v16 != v12)
  {
    v18 = [*(id *)(a1 + 40) attachment];
    [v18 setSizeWidth:v12];
  }
  v19 = [*(id *)(a1 + 40) attachment];
  [v19 sizeHeight];
  double v21 = v20;

  if (v21 != v13)
  {
    v22 = [*(id *)(a1 + 40) attachment];
    [v22 setSizeHeight:v13];

    BOOL v17 = 1;
  }
  v23 = *(void **)(a1 + 48);
  if (v23) {
    [v23 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);
  v25 = [*(id *)(a1 + 40) attachment];
  [v25 duration];
  double v27 = v26;

  if (v27 == Seconds)
  {
    if (!v17) {
      return;
    }
  }
  else
  {
    v28 = [*(id *)(a1 + 40) attachment];
    [v28 setDuration:Seconds];
  }
  v29 = [*(id *)(a1 + 40) attachment];
  [v29 updateChangeCountWithReason:@"Updated attachment size"];

  v30 = [*(id *)(a1 + 40) attachment];
  v31 = [v30 managedObjectContext];
  objc_msgSend(v31, "ic_save");

  v32 = [*(id *)(a1 + 40) attachment];
  objc_msgSend(v32, "ic_postNotificationOnMainThreadWithName:", @"ICAttachmentDidChangeSizeNotification");
}

- (id)asset
{
  double v3 = [(ICAttachmentModel *)self attachment];
  double v4 = [v3 media];
  int v5 = [v4 isValid];

  if (v5
    && ([(ICAttachmentModel *)self attachment],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 typeUTI],
        double v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = +[ICAttachment typeUTIIsPlayableMovie:v7],
        v7,
        v6,
        v8))
  {
    double v9 = (void *)MEMORY[0x1E4F166C8];
    double v10 = [(ICAttachmentModel *)self attachment];
    double v11 = [v10 media];
    double v12 = [v11 mediaURL];
    double v13 = objc_msgSend(v9, "ic_safeURLAssetWithURL:", v12);
  }
  else
  {
    double v13 = 0;
  }
  return v13;
}

- (BOOL)shouldUsePlaceholderBoundsIfNecessary
{
  return 1;
}

- (id)placeholderImageSystemName
{
  return @"photo.tv";
}

- (double)placeholderWidth
{
  return 540.0;
}

- (double)placeholderHeight
{
  return 460.0;
}

- (void)updateFileBasedAttributes
{
  v3.receiver = self;
  v3.super_class = (Class)ICAttachmentMovieModel;
  [(ICAttachmentModel *)&v3 updateFileBasedAttributes];
  [(ICAttachmentMovieModel *)self updateAttachmentSize];
}

- (void)addLocation
{
  objc_super v3 = [(ICAttachmentModel *)self attachment];
  double v4 = [v3 media];
  int v5 = [v4 isValid];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F166C8];
    double v7 = [(ICAttachmentModel *)self attachment];
    BOOL v8 = [v7 media];
    double v9 = [v8 mediaURL];
    double v10 = objc_msgSend(v6, "ic_safeURLAssetWithURL:", v9);

    double v11 = (void *)MEMORY[0x1E4F16558];
    double v12 = [v10 commonMetadata];
    double v13 = [v11 metadataItemsFromArray:v12 withKey:*MEMORY[0x1E4F15EA0] keySpace:*MEMORY[0x1E4F15DF8]];
    long long v14 = [v13 firstObject];

    if (v14)
    {
      double v15 = [v14 stringValue];
      double v16 = [MEMORY[0x1E4F28FE8] scannerWithString:v15];
      double v19 = 0.0;
      double v20 = 0.0;
      if ([v16 scanDouble:&v20])
      {
        if ([v16 scanDouble:&v19])
        {
          BOOL v17 = [(ICAttachmentModel *)self attachment];
          id v18 = (id)[v17 addLocationWithLatitude:v20 longitude:v19];
        }
      }
    }
  }
}

@end