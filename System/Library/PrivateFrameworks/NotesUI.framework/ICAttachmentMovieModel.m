@interface ICAttachmentMovieModel
@end

@implementation ICAttachmentMovieModel

void __73__ICAttachmentMovieModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) attachment];
  uint64_t v3 = [v2 identifier];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if ([*(id *)(a1 + 32) needToGeneratePreviews])
  {
    id v10 = [*(id *)(a1 + 32) attachment];
    v6 = [v10 attachmentModel];
    uint64_t v7 = [v6 asset];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

void __73__ICAttachmentMovieModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_10(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) attachment];
  double v2 = *(double *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 48);
  [*(id *)(a1 + 40) scale];
  id v5 = (id)[v6 updateAttachmentPreviewImageWithImageSrc:v3 maxDimension:0 scale:1 appearanceType:0 scaleWhenDrawing:0 metadata:v2 sendNotification:v4];
}

void __73__ICAttachmentMovieModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2(uint64_t a1)
{
  double v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = [*(id *)(a1 + 32) attachment];
  [v3 setPreviewUpdateDate:v2];

  id v4 = [*(id *)(a1 + 32) attachment];
  [v4 updateChangeCountWithReason:@"Generated previews for movie"];
}

@end