@interface ICAttachmentDrawingModel
@end

@implementation ICAttachmentDrawingModel

void __75__ICAttachmentDrawingModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) attachment];
  v3 = [v2 drawingModel];
  id v8 = [v3 drawing];

  [v8 unrotatedBoundsInCommandSpace];
  if (CGRectIsNull(v10))
  {
    [v8 bounds];
    objc_msgSend(v8, "setUnrotatedBoundsInCommandSpace:");
  }
  [v8 setOrientation:0];
  v4 = [v8 serializeWithPathData:1];
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F38DF8]) initWithLegacyData:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [v8 fullBounds];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "set_canvasBounds:");
}

void __70__ICAttachmentDrawingModel_UI__saveDrawing_withImage_forImageDrawing___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v2 = *MEMORY[0x1E4F83000];
  v3 = [*(id *)(a1 + 32) attachment];
  v4 = [v3 objectID];
  [v5 postNotificationName:v2 object:v4];
}

@end