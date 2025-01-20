@interface PXPersonTiledImageCombinerItem
- (PXPersonTiledImageCombinerItem)initWithPerson:(id)a3;
- (void)px_requestImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 resultHandler:(id)a6;
@end

@implementation PXPersonTiledImageCombinerItem

- (void).cxx_destruct
{
}

- (void)px_requestImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 resultHandler:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v11 = a6;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXPerson+PXFaceTileImageCombinerItem.m", 39, @"Invalid parameter not satisfying: %@", @"!CGSizeEqualToSize(targetSize, CGSizeZero)" object file lineNumber description];
  }
  if (a4 <= 0.0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXPerson+PXFaceTileImageCombinerItem.m", 40, @"Invalid parameter not satisfying: %@", @"displayScale > 0" object file lineNumber description];

    if (v11) {
      goto LABEL_8;
    }
LABEL_10:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXPerson+PXFaceTileImageCombinerItem.m", 41, @"Invalid parameter not satisfying: %@", @"resultHandler" object file lineNumber description];

    goto LABEL_8;
  }
  if (!v11) {
    goto LABEL_10;
  }
LABEL_8:
  person = self->_person;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __97__PXPersonTiledImageCombinerItem_px_requestImageWithTargetSize_displayScale_isRTL_resultHandler___block_invoke;
  v18[3] = &unk_1E5DD24E8;
  id v19 = v11;
  id v14 = v11;
  -[PXPerson requestFaceCropImageWithTargetSize:displayScale:cropFactor:style:cacheResult:synchronous:resultHandler:](person, "requestFaceCropImageWithTargetSize:displayScale:cropFactor:style:cacheResult:synchronous:resultHandler:", 0, 0, 1, 1, v18, width, height, a4);
}

void __97__PXPersonTiledImageCombinerItem_px_requestImageWithTargetSize_displayScale_isRTL_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 objectForKeyedSubscript:@"PXPeopleErrorKey"];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, v6);
}

- (PXPersonTiledImageCombinerItem)initWithPerson:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXPerson+PXFaceTileImageCombinerItem.m", 27, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXPersonTiledImageCombinerItem;
  v7 = [(PXPersonTiledImageCombinerItem *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_person, a3);
  }

  return v8;
}

@end