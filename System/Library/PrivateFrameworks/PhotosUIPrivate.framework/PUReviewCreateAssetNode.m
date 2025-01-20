@interface PUReviewCreateAssetNode
- (PUAdjustmentURLNode)adjustmentURLNode;
- (PUImageDataRenderNode)renderImageDataNode;
- (PUImageInfoNode)renderImageInfoNode;
- (PUReviewAsset)inputAsset;
- (PUReviewAsset)reviewAsset;
- (PUReviewCreateAssetNode)initWithInputAsset:(id)a3 imageInfoNode:(id)a4 renderImageInfoNode:(id)a5 renderImageDataNode:(id)a6 videoURLNode:(id)a7 videoAssetNode:(id)a8 renderVideoURLNode:(id)a9 renderVideoAssetNode:(id)a10 adjustmentURLNode:(id)a11;
- (PUReviewImageURLNode)imageInfoNode;
- (PUReviewVideoURLNode)videoURLNode;
- (PUVideoAssetNode)renderVideoAssetNode;
- (PUVideoAssetNode)videoAssetNode;
- (PUVideoURLExportNode)renderVideoURLNode;
- (void)run;
@end

@implementation PUReviewCreateAssetNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentURLNode, 0);
  objc_storeStrong((id *)&self->_renderVideoAssetNode, 0);
  objc_storeStrong((id *)&self->_renderVideoURLNode, 0);
  objc_storeStrong((id *)&self->_videoAssetNode, 0);
  objc_storeStrong((id *)&self->_videoURLNode, 0);
  objc_storeStrong((id *)&self->_renderImageDataNode, 0);
  objc_storeStrong((id *)&self->_renderImageInfoNode, 0);
  objc_storeStrong((id *)&self->_imageInfoNode, 0);
  objc_storeStrong((id *)&self->_inputAsset, 0);
  objc_storeStrong((id *)&self->_reviewAsset, 0);
}

- (PUAdjustmentURLNode)adjustmentURLNode
{
  return self->_adjustmentURLNode;
}

- (PUVideoAssetNode)renderVideoAssetNode
{
  return self->_renderVideoAssetNode;
}

- (PUVideoURLExportNode)renderVideoURLNode
{
  return self->_renderVideoURLNode;
}

- (PUVideoAssetNode)videoAssetNode
{
  return self->_videoAssetNode;
}

- (PUReviewVideoURLNode)videoURLNode
{
  return self->_videoURLNode;
}

- (PUImageDataRenderNode)renderImageDataNode
{
  return self->_renderImageDataNode;
}

- (PUImageInfoNode)renderImageInfoNode
{
  return self->_renderImageInfoNode;
}

- (PUReviewImageURLNode)imageInfoNode
{
  return self->_imageInfoNode;
}

- (PUReviewAsset)inputAsset
{
  return self->_inputAsset;
}

- (PUReviewAsset)reviewAsset
{
  return self->_reviewAsset;
}

- (void)run
{
  reviewAsset = self->_reviewAsset;
  self->_reviewAsset = 0;

  v4 = [(PUReviewCreateAssetNode *)self inputAsset];
  CFURLRef v5 = [(PUReviewImageURLNode *)self->_imageInfoNode providedFullsizeImageURL];
  v55 = [(PUImageInfoNode *)self->_renderImageInfoNode imageDataURL];
  v6 = [(PUReviewVideoURLNode *)self->_videoURLNode providedVideoURL];
  v7 = [(PUVideoAssetNode *)self->_videoAssetNode videoAsset];
  v58 = [(PUVideoURLExportNode *)self->_renderVideoURLNode videoURL];
  v57 = [(PUVideoAssetNode *)self->_renderVideoAssetNode videoAsset];
  v56 = [(PUAdjustmentURLNode *)self->_adjustmentURLNode adjustmentURL];
  unint64_t v8 = [v4 pixelWidth];
  unint64_t v9 = [v4 pixelHeight];
  BOOL v10 = !self->_renderImageInfoNode
     && !self->_renderImageDataNode
     && !self->_renderVideoURLNode
     && self->_renderVideoAssetNode == 0;
  double v11 = (double)v8;
  double v12 = (double)v9;
  v54 = v7;
  if ([v4 mediaType] == 1)
  {
    if (v10)
    {
      v13 = CGImageSourceCreateWithURL(v5, 0);
      if (!v13)
      {
LABEL_16:
        unint64_t v28 = (unint64_t)v11;
        unint64_t v29 = (unint64_t)v12;
LABEL_20:
        id v34 = v7;
        if (v34) {
          goto LABEL_30;
        }
        v33 = v6;
        if (!v6) {
          goto LABEL_30;
        }
LABEL_29:
        id v34 = [MEMORY[0x1E4F16330] assetWithURL:v33];
        goto LABEL_30;
      }
      v14 = v13;
      CFDictionaryRef v15 = CGImageSourceCopyPropertiesAtIndex(v13, 0, 0);
      v16 = v15;
      if (v15)
      {
        id v64 = 0;
        v65[0] = 0;
        id v63 = 0;
        MEMORY[0x1B3E7A4B0](v15, v65, &v64, &v63);
        id v17 = v65[0];
        id v18 = v64;
        v53 = v6;
        id v19 = v63;
        [v18 unsignedIntegerValue];
        [v19 unsignedIntegerValue];
        [v17 shortValue];

        PLOrientationTransformImageSize();
        double v11 = v20;
        double v12 = v21;

        v6 = v53;
      }
      CFRelease(v14);
LABEL_15:

      v7 = v54;
      goto LABEL_16;
    }
    renderImageDataNode = self->_renderImageDataNode;
    if (!renderImageDataNode) {
      goto LABEL_26;
    }
    [(PUImageDataRenderNode *)renderImageDataNode renderedImageSize];
LABEL_25:
    double v11 = v31;
    double v12 = v32;
LABEL_26:
    unint64_t v28 = (unint64_t)v11;
    unint64_t v29 = (unint64_t)v12;
    goto LABEL_27;
  }
  if ([v4 mediaType] == 2)
  {
    if (v10)
    {
      v22 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v7];
      v16 = [v22 firstObject];

      if (v16)
      {
        [v16 naturalSize];
        double v24 = v23;
        double v26 = v25;
        long long v61 = 0u;
        long long v62 = 0u;
        [v16 preferredTransform];
        double v27 = v26 * 0.0 + 0.0 * v24;
        double v11 = fabs(v27);
        double v12 = v11;
      }
      goto LABEL_15;
    }
    renderVideoURLNode = self->_renderVideoURLNode;
    if (!renderVideoURLNode) {
      goto LABEL_26;
    }
    [(PUVideoURLExportNode *)renderVideoURLNode renderedVideoSize];
    goto LABEL_25;
  }
  unint64_t v28 = (unint64_t)v11;
  unint64_t v29 = (unint64_t)v12;
  if (v10) {
    goto LABEL_20;
  }
LABEL_27:
  id v34 = v57;
  if (!v34)
  {
    v33 = v58;
    if (v58) {
      goto LABEL_29;
    }
  }
LABEL_30:
  long long v60 = 0uLL;
  *(void *)&long long v61 = 0;
  if (v34 && (objc_msgSend(v34, "duration", v33), (BYTE12(v60) & 0x1D) == 1))
  {
    *(_OWORD *)&time.value = v60;
    time.epoch = v61;
    double Seconds = CMTimeGetSeconds(&time);
  }
  else
  {
    objc_msgSend(v4, "duration", v33);
  }
  double v37 = Seconds;
  uint64_t v38 = [v4 playbackStyle];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v51 = v29;
    unint64_t v52 = v28;
    v39 = v6;
    v40 = (void *)[objc_alloc(MEMORY[0x1E4F8CBB8]) initWithURL:v56];
    id v41 = v4;
    v42 = [v41 providedPreviewImage];
    [v41 duration];
    BOOL v44 = v38 != 4 || v37 == v43;
    if (!v44 || v38 == 5)
    {
      v45 = v58;
      CFURLRef v50 = v5;
      if (!v58) {
        v45 = v39;
      }
      v46 = [v45 path];
      PLPreviewImageAndDurationForVideoAtPath();
      id v47 = v42;

      v42 = v47;
      CFURLRef v5 = v50;
    }
    v48 = [[PUReviewAsset alloc] initWithReviewAsset:v41 baseImageURL:v5 renderedImageURL:v55 baseVideoURL:v39 renderedVideoURL:v58 previewImage:v42 pixelWidth:v37 pixelHeight:v52 assetAdjustments:v51 duration:v40];
    v49 = self->_reviewAsset;
    self->_reviewAsset = v48;

    [(PXRunNode *)self completeWithError:0];
    v6 = v39;
  }
}

- (PUReviewCreateAssetNode)initWithInputAsset:(id)a3 imageInfoNode:(id)a4 renderImageInfoNode:(id)a5 renderImageDataNode:(id)a6 videoURLNode:(id)a7 videoAssetNode:(id)a8 renderVideoURLNode:(id)a9 renderVideoAssetNode:(id)a10 adjustmentURLNode:(id)a11
{
  id v38 = a3;
  id v33 = a4;
  id v17 = a4;
  id v34 = a5;
  id v18 = a5;
  id v35 = a6;
  id v19 = a6;
  id v36 = a7;
  id v20 = a7;
  id v37 = a8;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v26 = v25;
  if (v17) {
    [v25 addObject:v17];
  }
  if (v18) {
    [v26 addObject:v18];
  }
  if (v19) {
    [v26 addObject:v19];
  }
  if (v20) {
    [v26 addObject:v20];
  }
  if (v21) {
    [v26 addObject:v21];
  }
  if (v22) {
    [v26 addObject:v22];
  }
  if (v23) {
    [v26 addObject:v23];
  }
  if (v24) {
    [v26 addObject:v24];
  }
  v39.receiver = self;
  v39.super_class = (Class)PUReviewCreateAssetNode;
  double v27 = [(PXRunNode *)&v39 initWithDependencies:v26];
  if (v27)
  {
    if (!v38 || !v17 && !v18 && !v19 && !v20 && !v22 && !v24)
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:a2, v27, @"PUReviewCreateAssetNode.m", 73, @"Invalid parameter not satisfying: %@", @"inputAsset && (imageInfoNode || renderImageInfoNode || renderImageDataNode || videoURLNode || renderVideoURLNode || adjustmentURLNode)" object file lineNumber description];
    }
    objc_storeStrong((id *)&v27->_inputAsset, a3);
    objc_storeStrong((id *)&v27->_imageInfoNode, v33);
    objc_storeStrong((id *)&v27->_renderImageInfoNode, v34);
    objc_storeStrong((id *)&v27->_renderImageDataNode, v35);
    objc_storeStrong((id *)&v27->_videoURLNode, v36);
    objc_storeStrong((id *)&v27->_videoAssetNode, v37);
    objc_storeStrong((id *)&v27->_renderVideoURLNode, a9);
    objc_storeStrong((id *)&v27->_renderVideoAssetNode, a10);
    objc_storeStrong((id *)&v27->_adjustmentURLNode, a11);
    unint64_t v28 = v27;
  }

  return v27;
}

@end