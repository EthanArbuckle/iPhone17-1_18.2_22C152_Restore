@interface _PIParallaxLayerStackDebugImageCollector
- (CIImage)debugColorAnalysisImage;
- (CIImage)debugConfidenceMapImage;
- (CIImage)debugInfillImage;
- (CIImage)debugInputImage;
- (CIImage)debugLayoutImage;
- (CIImage)debugLocalConfidenceImage;
- (CIImage)debugMatteCropImage;
- (CIImage)debugMatteImage;
- (CIImage)debugPreviewImage;
- (NSArray)debugIntermediateLayoutBuffers;
- (NSArray)debugIntermediateLayoutImages;
- (NUImageBuffer)debugColorAnalysisBuffer;
- (NUImageBuffer)debugConfidenceMapBuffer;
- (NUImageBuffer)debugInfillBuffer;
- (NUImageBuffer)debugInputBuffer;
- (NUImageBuffer)debugLayoutBuffer;
- (NUImageBuffer)debugLocalConfidenceBuffer;
- (NUImageBuffer)debugMatteBuffer;
- (NUImageBuffer)debugMatteCropBuffer;
- (NUImageBuffer)debugPreviewBuffer;
- (NUImageBuffer)flattenedBackgroundForDebugPreview;
- (NUImageBuffer)flattenedForegroundForDebugPreview;
- (id)resultLayersWithRenderer:(id)a3;
- (void)prepareImagesForItem:(id)a3 renderer:(id)a4 layout:(id)a5 style:(id)a6 inputImage:(id)a7 matteImage:(id)a8 infillImage:(id)a9 foregroundImage:(id)a10 backgroundImage:(id)a11;
- (void)renderImagesWithRenderer:(id)a3;
- (void)setDebugColorAnalysisBuffer:(id)a3;
- (void)setDebugColorAnalysisImage:(id)a3;
- (void)setDebugConfidenceMapBuffer:(id)a3;
- (void)setDebugConfidenceMapImage:(id)a3;
- (void)setDebugInfillBuffer:(id)a3;
- (void)setDebugInfillImage:(id)a3;
- (void)setDebugInputBuffer:(id)a3;
- (void)setDebugInputImage:(id)a3;
- (void)setDebugIntermediateLayoutBuffers:(id)a3;
- (void)setDebugIntermediateLayoutImages:(id)a3;
- (void)setDebugLayoutBuffer:(id)a3;
- (void)setDebugLayoutImage:(id)a3;
- (void)setDebugLocalConfidenceBuffer:(id)a3;
- (void)setDebugLocalConfidenceImage:(id)a3;
- (void)setDebugMatteBuffer:(id)a3;
- (void)setDebugMatteCropBuffer:(id)a3;
- (void)setDebugMatteCropImage:(id)a3;
- (void)setDebugMatteImage:(id)a3;
- (void)setDebugPreviewBuffer:(id)a3;
- (void)setDebugPreviewImage:(id)a3;
- (void)setFlattenedBackgroundForDebugPreview:(id)a3;
- (void)setFlattenedForegroundForDebugPreview:(id)a3;
@end

@implementation _PIParallaxLayerStackDebugImageCollector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flattenedForegroundForDebugPreview, 0);
  objc_storeStrong((id *)&self->_flattenedBackgroundForDebugPreview, 0);
  objc_storeStrong((id *)&self->_debugColorAnalysisBuffer, 0);
  objc_storeStrong((id *)&self->_debugPreviewBuffer, 0);
  objc_storeStrong((id *)&self->_debugIntermediateLayoutBuffers, 0);
  objc_storeStrong((id *)&self->_debugLayoutBuffer, 0);
  objc_storeStrong((id *)&self->_debugInfillBuffer, 0);
  objc_storeStrong((id *)&self->_debugConfidenceMapBuffer, 0);
  objc_storeStrong((id *)&self->_debugLocalConfidenceBuffer, 0);
  objc_storeStrong((id *)&self->_debugMatteCropBuffer, 0);
  objc_storeStrong((id *)&self->_debugMatteBuffer, 0);
  objc_storeStrong((id *)&self->_debugInputBuffer, 0);
  objc_storeStrong((id *)&self->_debugColorAnalysisImage, 0);
  objc_storeStrong((id *)&self->_debugPreviewImage, 0);
  objc_storeStrong((id *)&self->_debugIntermediateLayoutImages, 0);
  objc_storeStrong((id *)&self->_debugLayoutImage, 0);
  objc_storeStrong((id *)&self->_debugInfillImage, 0);
  objc_storeStrong((id *)&self->_debugConfidenceMapImage, 0);
  objc_storeStrong((id *)&self->_debugLocalConfidenceImage, 0);
  objc_storeStrong((id *)&self->_debugMatteCropImage, 0);
  objc_storeStrong((id *)&self->_debugMatteImage, 0);
  objc_storeStrong((id *)&self->_debugInputImage, 0);
}

- (void)setFlattenedForegroundForDebugPreview:(id)a3
{
}

- (NUImageBuffer)flattenedForegroundForDebugPreview
{
  return self->_flattenedForegroundForDebugPreview;
}

- (void)setFlattenedBackgroundForDebugPreview:(id)a3
{
}

- (NUImageBuffer)flattenedBackgroundForDebugPreview
{
  return self->_flattenedBackgroundForDebugPreview;
}

- (void)setDebugColorAnalysisBuffer:(id)a3
{
}

- (NUImageBuffer)debugColorAnalysisBuffer
{
  return self->_debugColorAnalysisBuffer;
}

- (void)setDebugPreviewBuffer:(id)a3
{
}

- (NUImageBuffer)debugPreviewBuffer
{
  return self->_debugPreviewBuffer;
}

- (void)setDebugIntermediateLayoutBuffers:(id)a3
{
}

- (NSArray)debugIntermediateLayoutBuffers
{
  return self->_debugIntermediateLayoutBuffers;
}

- (void)setDebugLayoutBuffer:(id)a3
{
}

- (NUImageBuffer)debugLayoutBuffer
{
  return self->_debugLayoutBuffer;
}

- (void)setDebugInfillBuffer:(id)a3
{
}

- (NUImageBuffer)debugInfillBuffer
{
  return self->_debugInfillBuffer;
}

- (void)setDebugConfidenceMapBuffer:(id)a3
{
}

- (NUImageBuffer)debugConfidenceMapBuffer
{
  return self->_debugConfidenceMapBuffer;
}

- (void)setDebugLocalConfidenceBuffer:(id)a3
{
}

- (NUImageBuffer)debugLocalConfidenceBuffer
{
  return self->_debugLocalConfidenceBuffer;
}

- (void)setDebugMatteCropBuffer:(id)a3
{
}

- (NUImageBuffer)debugMatteCropBuffer
{
  return self->_debugMatteCropBuffer;
}

- (void)setDebugMatteBuffer:(id)a3
{
}

- (NUImageBuffer)debugMatteBuffer
{
  return self->_debugMatteBuffer;
}

- (void)setDebugInputBuffer:(id)a3
{
}

- (NUImageBuffer)debugInputBuffer
{
  return self->_debugInputBuffer;
}

- (void)setDebugColorAnalysisImage:(id)a3
{
}

- (CIImage)debugColorAnalysisImage
{
  return self->_debugColorAnalysisImage;
}

- (void)setDebugPreviewImage:(id)a3
{
}

- (CIImage)debugPreviewImage
{
  return self->_debugPreviewImage;
}

- (void)setDebugIntermediateLayoutImages:(id)a3
{
}

- (NSArray)debugIntermediateLayoutImages
{
  return self->_debugIntermediateLayoutImages;
}

- (void)setDebugLayoutImage:(id)a3
{
}

- (CIImage)debugLayoutImage
{
  return self->_debugLayoutImage;
}

- (void)setDebugInfillImage:(id)a3
{
}

- (CIImage)debugInfillImage
{
  return self->_debugInfillImage;
}

- (void)setDebugConfidenceMapImage:(id)a3
{
}

- (CIImage)debugConfidenceMapImage
{
  return self->_debugConfidenceMapImage;
}

- (void)setDebugLocalConfidenceImage:(id)a3
{
}

- (CIImage)debugLocalConfidenceImage
{
  return self->_debugLocalConfidenceImage;
}

- (void)setDebugMatteCropImage:(id)a3
{
}

- (CIImage)debugMatteCropImage
{
  return self->_debugMatteCropImage;
}

- (void)setDebugMatteImage:(id)a3
{
}

- (CIImage)debugMatteImage
{
  return self->_debugMatteImage;
}

- (void)setDebugInputImage:(id)a3
{
}

- (CIImage)debugInputImage
{
  return self->_debugInputImage;
}

- (id)resultLayersWithRenderer:(id)a3
{
  id v4 = a3;
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [(_PIParallaxLayerStackDebugImageCollector *)self debugInputBuffer];

  if (v5)
  {
    v6 = [(_PIParallaxLayerStackDebugImageCollector *)self debugInputBuffer];
    v7 = [(_PIParallaxLayerStackDebugImageCollector *)self debugInputImage];
    v8 = [v4 layerForBuffer:v6 image:v7 zPosition:@"debugInput" identifier:-100.0];

    if (v8) {
      [v58 addObject:v8];
    }

    int v9 = -101;
  }
  else
  {
    int v9 = -100;
  }
  v10 = [(_PIParallaxLayerStackDebugImageCollector *)self debugMatteBuffer];

  if (v10)
  {
    v11 = [(_PIParallaxLayerStackDebugImageCollector *)self debugMatteBuffer];
    v12 = [(_PIParallaxLayerStackDebugImageCollector *)self debugMatteImage];
    v13 = [v4 layerForBuffer:v11 image:v12 zPosition:@"debugMatte" identifier:(double)v9];

    if (v13) {
      [v58 addObject:v13];
    }

    --v9;
  }
  v14 = [(_PIParallaxLayerStackDebugImageCollector *)self debugMatteCropBuffer];

  if (v14)
  {
    v15 = [(_PIParallaxLayerStackDebugImageCollector *)self debugMatteCropBuffer];
    v16 = [(_PIParallaxLayerStackDebugImageCollector *)self debugMatteCropImage];
    v17 = [v4 layerForBuffer:v15 image:v16 zPosition:@"debugMatteCrop" identifier:(double)v9];

    if (v17) {
      [v58 addObject:v17];
    }

    --v9;
  }
  v18 = [(_PIParallaxLayerStackDebugImageCollector *)self debugLocalConfidenceBuffer];

  if (v18)
  {
    v19 = [(_PIParallaxLayerStackDebugImageCollector *)self debugLocalConfidenceBuffer];
    v20 = [(_PIParallaxLayerStackDebugImageCollector *)self debugLocalConfidenceImage];
    v21 = [v4 layerForBuffer:v19 image:v20 zPosition:@"debugLocalConfidence" identifier:(double)v9];

    if (v21) {
      [v58 addObject:v21];
    }

    --v9;
  }
  v22 = [(_PIParallaxLayerStackDebugImageCollector *)self debugConfidenceMapBuffer];

  if (v22)
  {
    v23 = [(_PIParallaxLayerStackDebugImageCollector *)self debugConfidenceMapBuffer];
    v24 = [(_PIParallaxLayerStackDebugImageCollector *)self debugConfidenceMapImage];
    v25 = [v4 layerForBuffer:v23 image:v24 zPosition:@"debugConfidenceMap" identifier:(double)v9];

    if (v25) {
      [v58 addObject:v25];
    }

    --v9;
  }
  v26 = [(_PIParallaxLayerStackDebugImageCollector *)self debugInfillBuffer];

  if (v26)
  {
    v27 = [(_PIParallaxLayerStackDebugImageCollector *)self debugInfillBuffer];
    v28 = [(_PIParallaxLayerStackDebugImageCollector *)self debugInfillImage];
    v29 = [v4 layerForBuffer:v27 image:v28 zPosition:@"debugInfill" identifier:(double)v9];

    if (v29) {
      [v58 addObject:v29];
    }

    --v9;
  }
  v30 = [(_PIParallaxLayerStackDebugImageCollector *)self debugLayoutBuffer];

  if (v30)
  {
    v31 = [(_PIParallaxLayerStackDebugImageCollector *)self debugLayoutBuffer];
    v32 = [(_PIParallaxLayerStackDebugImageCollector *)self debugLayoutImage];
    v33 = [v4 layerForBuffer:v31 image:v32 zPosition:@"debugLayout" identifier:(double)v9];

    if (v33) {
      [v58 addObject:v33];
    }

    --v9;
  }
  v34 = [(_PIParallaxLayerStackDebugImageCollector *)self debugPreviewBuffer];

  if (v34)
  {
    v35 = [(_PIParallaxLayerStackDebugImageCollector *)self debugPreviewBuffer];
    v36 = [(_PIParallaxLayerStackDebugImageCollector *)self debugPreviewImage];
    v37 = [v4 layerForBuffer:v35 image:v36 zPosition:@"debugPreview" identifier:(double)v9];

    if (v37) {
      [v58 addObject:v37];
    }

    --v9;
  }
  v38 = [(_PIParallaxLayerStackDebugImageCollector *)self debugColorAnalysisBuffer];

  if (v38)
  {
    v39 = [(_PIParallaxLayerStackDebugImageCollector *)self debugColorAnalysisBuffer];
    v40 = [(_PIParallaxLayerStackDebugImageCollector *)self debugColorAnalysisImage];
    v41 = [v4 layerForBuffer:v39 image:v40 zPosition:@"debugColorAnalysis" identifier:(double)v9];

    if (v41) {
      [v58 addObject:v41];
    }

    --v9;
  }
  v42 = [(_PIParallaxLayerStackDebugImageCollector *)self debugIntermediateLayoutBuffers];
  uint64_t v43 = [v42 count];

  if (v43)
  {
    v44 = [(_PIParallaxLayerStackDebugImageCollector *)self debugIntermediateLayoutBuffers];
    uint64_t v45 = [v44 count];

    if (v45)
    {
      unint64_t v46 = 0;
      double v47 = (double)v9 + -8.0;
      do
      {
        v48 = objc_msgSend(NSString, "stringWithFormat:", @"debugLayoutIntermediate_%d", v46);
        v49 = [(_PIParallaxLayerStackDebugImageCollector *)self debugIntermediateLayoutBuffers];
        v50 = [v49 objectAtIndexedSubscript:v46];
        v51 = [(_PIParallaxLayerStackDebugImageCollector *)self debugIntermediateLayoutImages];
        v52 = [v51 objectAtIndexedSubscript:v46];
        id v53 = v4;
        v54 = [v4 layerForBuffer:v50 image:v52 zPosition:v48 identifier:v47];

        if (v54) {
          [v58 addObject:v54];
        }

        ++v46;
        v55 = [(_PIParallaxLayerStackDebugImageCollector *)self debugIntermediateLayoutBuffers];
        unint64_t v56 = [v55 count];

        id v4 = v53;
      }
      while (v46 < v56);
    }
  }

  return v58;
}

- (void)renderImagesWithRenderer:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_PIParallaxLayerStackDebugImageCollector *)self debugInputImage];

  if (v5)
  {
    v6 = [(_PIParallaxLayerStackDebugImageCollector *)self debugInputImage];
    id v64 = 0;
    v7 = (void *)[v4 newRenderedPixelBufferFromImage:v6 hasAlpha:0 error:&v64];
    id v5 = v64;
    [(_PIParallaxLayerStackDebugImageCollector *)self setDebugInputBuffer:v7];
  }
  v8 = [(_PIParallaxLayerStackDebugImageCollector *)self debugMatteImage];

  if (v8)
  {
    int v9 = [(_PIParallaxLayerStackDebugImageCollector *)self debugMatteImage];
    id v63 = 0;
    v10 = (void *)[v4 newRenderedPixelBufferFromImage:v9 hasAlpha:0 error:&v63];
    id v11 = v63;

    [(_PIParallaxLayerStackDebugImageCollector *)self setDebugMatteBuffer:v10];
    id v5 = v11;
  }
  v12 = [(_PIParallaxLayerStackDebugImageCollector *)self debugMatteCropImage];

  if (v12)
  {
    v13 = [(_PIParallaxLayerStackDebugImageCollector *)self debugMatteCropImage];
    id v62 = 0;
    v14 = (void *)[v4 newRenderedPixelBufferFromImage:v13 hasAlpha:0 error:&v62];
    id v15 = v62;

    [(_PIParallaxLayerStackDebugImageCollector *)self setDebugMatteCropBuffer:v14];
    id v5 = v15;
  }
  v16 = [(_PIParallaxLayerStackDebugImageCollector *)self debugLocalConfidenceImage];

  if (v16)
  {
    v17 = [(_PIParallaxLayerStackDebugImageCollector *)self debugLocalConfidenceImage];
    id v61 = 0;
    v18 = (void *)[v4 newRenderedPixelBufferFromImage:v17 hasAlpha:0 error:&v61];
    id v19 = v61;

    [(_PIParallaxLayerStackDebugImageCollector *)self setDebugLocalConfidenceBuffer:v18];
    id v5 = v19;
  }
  v20 = [(_PIParallaxLayerStackDebugImageCollector *)self debugConfidenceMapImage];

  if (v20)
  {
    v21 = [(_PIParallaxLayerStackDebugImageCollector *)self debugConfidenceMapImage];
    id v60 = 0;
    v22 = (void *)[v4 newRenderedPixelBufferFromImage:v21 hasAlpha:0 error:&v60];
    id v23 = v60;

    [(_PIParallaxLayerStackDebugImageCollector *)self setDebugConfidenceMapBuffer:v22];
    id v5 = v23;
  }
  v24 = [(_PIParallaxLayerStackDebugImageCollector *)self debugInfillImage];

  if (v24)
  {
    v25 = [(_PIParallaxLayerStackDebugImageCollector *)self debugInfillImage];
    id v59 = 0;
    v26 = (void *)[v4 newRenderedPixelBufferFromImage:v25 hasAlpha:0 error:&v59];
    id v27 = v59;

    [(_PIParallaxLayerStackDebugImageCollector *)self setDebugInfillBuffer:v26];
    id v5 = v27;
  }
  v28 = [(_PIParallaxLayerStackDebugImageCollector *)self debugLayoutImage];

  if (v28)
  {
    v29 = [(_PIParallaxLayerStackDebugImageCollector *)self debugLayoutImage];
    id v58 = 0;
    v30 = (void *)[v4 newRenderedPixelBufferFromImage:v29 hasAlpha:0 error:&v58];
    id v31 = v58;

    [(_PIParallaxLayerStackDebugImageCollector *)self setDebugLayoutBuffer:v30];
    id v5 = v31;
  }
  v32 = [(_PIParallaxLayerStackDebugImageCollector *)self debugPreviewImage];

  if (v32)
  {
    v33 = [(_PIParallaxLayerStackDebugImageCollector *)self debugPreviewImage];
    id v57 = 0;
    v34 = (void *)[v4 newRenderedPixelBufferFromImage:v33 hasAlpha:0 error:&v57];
    id v35 = v57;

    [(_PIParallaxLayerStackDebugImageCollector *)self setDebugPreviewBuffer:v34];
    id v5 = v35;
  }
  v36 = [(_PIParallaxLayerStackDebugImageCollector *)self debugColorAnalysisImage];

  if (v36)
  {
    v37 = [(_PIParallaxLayerStackDebugImageCollector *)self debugColorAnalysisImage];
    id v56 = 0;
    v38 = (void *)[v4 newRenderedPixelBufferFromImage:v37 hasAlpha:0 error:&v56];
    id v39 = v56;

    [(_PIParallaxLayerStackDebugImageCollector *)self setDebugColorAnalysisBuffer:v38];
    id v5 = v39;
  }
  v40 = [(_PIParallaxLayerStackDebugImageCollector *)self debugIntermediateLayoutImages];

  if (v40)
  {
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v42 = [(_PIParallaxLayerStackDebugImageCollector *)self debugIntermediateLayoutImages];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v52 objects:v65 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v53;
      do
      {
        uint64_t v46 = 0;
        double v47 = v5;
        do
        {
          if (*(void *)v53 != v45) {
            objc_enumerationMutation(v42);
          }
          uint64_t v48 = *(void *)(*((void *)&v52 + 1) + 8 * v46);
          id v51 = 0;
          v49 = (void *)[v4 newRenderedPixelBufferFromImage:v48 hasAlpha:0 error:&v51];
          id v5 = v51;

          [v41 addObject:v49];
          ++v46;
          double v47 = v5;
        }
        while (v44 != v46);
        uint64_t v44 = [v42 countByEnumeratingWithState:&v52 objects:v65 count:16];
      }
      while (v44);
    }

    v50 = (void *)[v41 copy];
    [(_PIParallaxLayerStackDebugImageCollector *)self setDebugIntermediateLayoutBuffers:v50];
  }
}

- (void)prepareImagesForItem:(id)a3 renderer:(id)a4 layout:(id)a5 style:(id)a6 inputImage:(id)a7 matteImage:(id)a8 infillImage:(id)a9 foregroundImage:(id)a10 backgroundImage:(id)a11
{
  v163[2] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v154 = a5;
  id v150 = a6;
  id v151 = a7;
  id v145 = a8;
  id v149 = a9;
  id v148 = a10;
  v18 = v16;
  id v19 = a11;
  v20 = [v16 regions];
  v21 = [v20 faceRegions];
  [v20 preferredCropRect];
  double v152 = v22;
  double v141 = v24;
  double v143 = v23;
  double v139 = v25;
  [v20 acceptableCropRect];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  [v20 gazeAreaRect];
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  [v16 settlingEffectNormalizedBounds];
  +[PISegmentationHelper debugImageWithInputImage:layout:faceRects:saliencyPreferrectRect:saliencyAcceptableRect:gazeAreaRect:settlingEffectRect:](PISegmentationHelper, "debugImageWithInputImage:layout:faceRects:saliencyPreferrectRect:saliencyAcceptableRect:gazeAreaRect:settlingEffectRect:", v151, v154, v21, v152, v143, v141, v139, v27, v29, v31, v33, v35, v37, v39, v41, v42, v43,
    v44,
  v140 = v45);

  id v160 = 0;
  v142 = v19;
  uint64_t v46 = (void *)[v17 newRenderedPixelBufferFromImage:v19 hasAlpha:0 error:&v160];
  id v47 = v160;
  [(_PIParallaxLayerStackDebugImageCollector *)self setFlattenedBackgroundForDebugPreview:v46];

  uint64_t v48 = (void *)MEMORY[0x1E4F1E050];
  v49 = [(_PIParallaxLayerStackDebugImageCollector *)self flattenedBackgroundForDebugPreview];
  uint64_t v50 = [v48 imageWithNUImageBuffer:v49];

  id v159 = 0;
  v144 = v17;
  id v51 = (void *)[v17 newRenderedPixelBufferFromImage:v148 hasAlpha:1 error:&v159];
  id v137 = v159;

  [(_PIParallaxLayerStackDebugImageCollector *)self setFlattenedForegroundForDebugPreview:v51];
  long long v52 = (void *)MEMORY[0x1E4F1E050];
  long long v53 = v18;
  long long v54 = [(_PIParallaxLayerStackDebugImageCollector *)self flattenedForegroundForDebugPreview];
  uint64_t v55 = objc_msgSend(v52, "imageWithCVPixelBuffer:", objc_msgSend(v54, "CVPixelBuffer"));

  v138 = (void *)v50;
  v136 = (void *)v55;
  v135 = +[PISegmentationHelper debugPreviewRenderWithBackground:v50 foreground:v55 layout:v154 style:v150];
  id v56 = [v18 colorAnalysis];
  [v154 visibleFrame];
  v134 = +[PISegmentationHelper debugImageForColorAnalysis:inputImage:visibleFrame:](PISegmentationHelper, "debugImageForColorAnalysis:inputImage:visibleFrame:", v56, v151);

  id v57 = [v18 segmentationConfidenceMap];

  if (v57)
  {
    id v58 = (void *)MEMORY[0x1E4F1E050];
    id v59 = [v18 segmentationConfidenceMap];
    id v60 = [v58 imageWithNUImageBuffer:v59];

    if ((unint64_t)([v18 classification] - 3) <= 1)
    {
      uint64_t v61 = +[PISegmentationHelper invertImage:v60];

      id v60 = (void *)v61;
    }
  }
  else
  {
    id v60 = 0;
  }
  id v153 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v62 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  id v63 = [v18 originalLayout];
  id v64 = [v63 portraitLayout];
  uint64_t v65 = [v64 debugLayouts];
  v133 = v60;
  if (!v65) {
    goto LABEL_8;
  }
  uint64_t v66 = (void *)v65;
  v130 = v62;
  v67 = [v53 originalLayout];
  v68 = [v67 portraitLayout];
  v69 = [v68 debugLayouts];
  uint64_t v70 = [v69 count];

  if (v70)
  {
    id v63 = [v53 originalLayout];
    id v64 = [v63 portraitLayout];
    v128 = [v64 debugLayouts];
    v71 = [v128 firstObject];
    v163[0] = v71;
    v72 = [v53 originalLayout];
    v73 = [v72 portraitLayout];
    v74 = [v73 debugLayouts];
    v75 = [v74 lastObject];
    v163[1] = v75;
    uint64_t v126 = [MEMORY[0x1E4F1C978] arrayWithObjects:v163 count:2];

    id v62 = (id)v126;
LABEL_8:

    goto LABEL_10;
  }
  id v62 = v130;
LABEL_10:
  v76 = [v53 originalLayout];
  v77 = [v76 landscapeLayout];
  uint64_t v78 = [v77 debugLayouts];
  if (!v78)
  {
LABEL_13:
    unint64_t v90 = 0x1E4F1E000;

    goto LABEL_15;
  }
  v79 = (void *)v78;
  v80 = v62;
  v81 = [v53 originalLayout];
  v82 = [v81 landscapeLayout];
  v83 = [v82 debugLayouts];
  uint64_t v84 = [v83 count];

  if (v84)
  {
    v76 = [v53 originalLayout];
    v77 = [v76 landscapeLayout];
    v131 = [v77 debugLayouts];
    v129 = [v131 firstObject];
    v162[0] = v129;
    v85 = [v53 originalLayout];
    v86 = [v85 landscapeLayout];
    v87 = [v86 debugLayouts];
    v88 = [v87 lastObject];
    v162[1] = v88;
    v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v162 count:2];
    uint64_t v127 = [v80 arrayByAddingObjectsFromArray:v89];

    id v62 = (id)v127;
    goto LABEL_13;
  }
  unint64_t v90 = 0x1E4F1E000uLL;
  id v62 = v80;
LABEL_15:
  v91 = v53;
  id v92 = v145;
  v93 = v92;
  if (!v92)
  {
    v94 = [*(id *)(v90 + 80) blackImage];
    [v151 extent];
    v93 = objc_msgSend(v94, "imageByCroppingToRect:");
  }
  v146 = v92;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id v95 = v62;
  uint64_t v96 = [v95 countByEnumeratingWithState:&v155 objects:v161 count:16];
  if (v96)
  {
    uint64_t v97 = v96;
    uint64_t v98 = *(void *)v156;
    do
    {
      for (uint64_t i = 0; i != v97; ++i)
      {
        if (*(void *)v156 != v98) {
          objc_enumerationMutation(v95);
        }
        uint64_t v100 = *(void *)(*((void *)&v155 + 1) + 8 * i);
        if (v100)
        {
          v101 = [v20 faceRegions];
          [v20 preferredCropRect];
          double v103 = v102;
          double v105 = v104;
          double v107 = v106;
          double v109 = v108;
          [v20 acceptableCropRect];
          double v111 = v110;
          double v113 = v112;
          double v115 = v114;
          double v117 = v116;
          [v91 settlingEffectNormalizedBounds];
          v122 = +[PISegmentationHelper debugImageWithInputImage:finalLayout:intermediateLayout:faceRects:saliencyPreferrectRect:saliencyAcceptableRect:settlingEffectRect:](PISegmentationHelper, "debugImageWithInputImage:finalLayout:intermediateLayout:faceRects:saliencyPreferrectRect:saliencyAcceptableRect:settlingEffectRect:", v93, v154, v100, v101, v103, v105, v107, v109, v111, v113, v115, v117, v118, v119, v120, v121);

          [v153 addObject:v122];
        }
      }
      uint64_t v97 = [v95 countByEnumeratingWithState:&v155 objects:v161 count:16];
    }
    while (v97);
  }

  [v154 visibleFrame];
  [v154 imageSize];
  [v154 imageSize];
  NURectNormalize();
  [v146 extent];
  NURectDenormalize();
  uint64_t v123 = objc_msgSend(v146, "imageByCroppingToRect:");
  [(_PIParallaxLayerStackDebugImageCollector *)self setDebugInputImage:v151];
  [(_PIParallaxLayerStackDebugImageCollector *)self setDebugMatteImage:v146];
  v132 = (void *)v123;
  [(_PIParallaxLayerStackDebugImageCollector *)self setDebugMatteCropImage:v123];
  if (v146)
  {
    v124 = +[PISegmentationHelper localConfidenceImage:v146];
    [(_PIParallaxLayerStackDebugImageCollector *)self setDebugLocalConfidenceImage:v124];
  }
  else
  {
    [(_PIParallaxLayerStackDebugImageCollector *)self setDebugLocalConfidenceImage:0];
  }
  [(_PIParallaxLayerStackDebugImageCollector *)self setDebugConfidenceMapImage:v133];
  [(_PIParallaxLayerStackDebugImageCollector *)self setDebugInfillImage:v149];
  [(_PIParallaxLayerStackDebugImageCollector *)self setDebugLayoutImage:v140];
  [(_PIParallaxLayerStackDebugImageCollector *)self setDebugPreviewImage:v135];
  [(_PIParallaxLayerStackDebugImageCollector *)self setDebugColorAnalysisImage:v134];
  v125 = (void *)[v153 copy];
  [(_PIParallaxLayerStackDebugImageCollector *)self setDebugIntermediateLayoutImages:v125];
}

@end