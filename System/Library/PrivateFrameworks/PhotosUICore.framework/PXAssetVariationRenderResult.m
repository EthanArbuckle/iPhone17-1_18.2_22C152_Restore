@interface PXAssetVariationRenderResult
- (AVAsset)videoAsset;
- (AVVideoComposition)videoComposition;
- (BOOL)isFullsizeRender;
- (BOOL)success;
- (NSDictionary)analysisResult;
- (NSError)error;
- (NSURL)imageURL;
- (NSURL)videoURL;
- (PICompositionController)compositionController;
- (PXAssetVariationRenderResult)init;
- (PXAssetVariationRenderResult)initWithVariationType:(int64_t)a3 imageURL:(id)a4 videoURL:(id)a5 analysisResult:(id)a6 compositionController:(id)a7 success:(BOOL)a8 error:(id)a9;
- (UIImage)image;
- (id)description;
- (int64_t)variationType;
- (void)setFullsizeRender:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setVideoAsset:(id)a3;
- (void)setVideoComposition:(id)a3;
@end

@implementation PXAssetVariationRenderResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_videoAsset, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_analysisResult, 0);
}

- (void)setFullsizeRender:(BOOL)a3
{
  self->_fullsizeRender = a3;
}

- (BOOL)isFullsizeRender
{
  return self->_fullsizeRender;
}

- (void)setVideoComposition:(id)a3
{
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (void)setVideoAsset:(id)a3
{
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSError)error
{
  return self->_error;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (BOOL)success
{
  return self->_success;
}

- (NSDictionary)analysisResult
{
  return self->_analysisResult;
}

- (int64_t)variationType
{
  return self->_variationType;
}

- (id)description
{
  v17.receiver = self;
  v17.super_class = (Class)PXAssetVariationRenderResult;
  v3 = [(PXAssetVariationRenderResult *)&v17 description];
  v4 = NSString;
  int64_t v5 = [(PXAssetVariationRenderResult *)self variationType];
  if ((unint64_t)(v5 + 1) > 4) {
    v6 = @"Unknown";
  }
  else {
    v6 = off_1E5DB6DB0[v5 + 1];
  }
  v7 = v6;
  v8 = [(PXAssetVariationRenderResult *)self imageURL];
  v9 = [(PXAssetVariationRenderResult *)self videoURL];
  BOOL v10 = [(PXAssetVariationRenderResult *)self success];
  v11 = @"NO";
  if (v10) {
    v11 = @"YES";
  }
  v12 = v11;
  v13 = [(PXAssetVariationRenderResult *)self error];
  v14 = [v4 stringWithFormat:@"variationType:%@ imageURL:%@ videoURL:%@ success:%@ error:%@", v7, v8, v9, v12, v13];

  v15 = [v3 stringByAppendingString:v14];

  return v15;
}

- (PXAssetVariationRenderResult)initWithVariationType:(int64_t)a3 imageURL:(id)a4 videoURL:(id)a5 analysisResult:(id)a6 compositionController:(id)a7 success:(BOOL)a8 error:(id)a9
{
  id v27 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v28.receiver = self;
  v28.super_class = (Class)PXAssetVariationRenderResult;
  v20 = [(PXAssetVariationRenderResult *)&v28 init];
  v21 = v20;
  if (v20)
  {
    v20->_variationType = a3;
    objc_storeStrong((id *)&v20->_imageURL, a4);
    objc_storeStrong((id *)&v21->_videoURL, a5);
    v21->_success = a8;
    uint64_t v22 = [v17 copy];
    analysisResult = v21->_analysisResult;
    v21->_analysisResult = (NSDictionary *)v22;

    objc_storeStrong((id *)&v21->_error, a9);
    uint64_t v24 = [v18 copy];
    compositionController = v21->_compositionController;
    v21->_compositionController = (PICompositionController *)v24;
  }
  return v21;
}

- (PXAssetVariationRenderResult)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetVariationRenderResult.m", 25, @"%s is not available as initializer", "-[PXAssetVariationRenderResult init]");

  abort();
}

@end