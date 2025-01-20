@interface PUCleanupToolMaskView
- (CALayer)edrGainLayer;
- (CIImage)mask;
- (CIImage)selectedMask;
- (NSArray)backgroundMasks;
- (NSArray)foregroundMasks;
- (NSArray)foundIntersectionMasks;
- (NSArray)sampledPoints;
- (NUMediaView)mediaView;
- (PUCleanupMaskTransformerDelegate)maskTransformerDelegate;
- (PUCleanupToolMaskView)initWithMediaView:(id)a3 isHDR:(BOOL)a4;
- (id)_debugColorForIndex:(int64_t)a3;
- (id)_debugColors;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)drawMask:(CGContext *)a3 mask:(id)a4 fillColor:(CGColor *)a5 strokeColor:(CGColor *)a6 lineScale:(double)a7;
- (void)drawSampledPoints:(id)a3 toContext:(CGContext *)a4;
- (void)layoutSubviews;
- (void)setBackgroundMasks:(id)a3;
- (void)setEdrGainLayer:(id)a3;
- (void)setForegroundMasks:(id)a3;
- (void)setFoundIntersectionMasks:(id)a3;
- (void)setMask:(id)a3;
- (void)setMaskTransformerDelegate:(id)a3;
- (void)setNeedsDisplay;
- (void)setSampledPoints:(id)a3;
- (void)setSelectedMask:(id)a3;
- (void)setUpEDRGainLayer;
@end

@implementation PUCleanupToolMaskView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_edrGainLayer, 0);
  objc_destroyWeak((id *)&self->_maskTransformerDelegate);
  objc_storeStrong((id *)&self->_sampledPoints, 0);
  objc_storeStrong((id *)&self->_foundIntersectionMasks, 0);
  objc_storeStrong((id *)&self->_backgroundMasks, 0);
  objc_storeStrong((id *)&self->_foregroundMasks, 0);
  objc_storeStrong((id *)&self->_selectedMask, 0);
  objc_storeStrong((id *)&self->_mask, 0);
}

- (NUMediaView)mediaView
{
  return self->_mediaView;
}

- (void)setEdrGainLayer:(id)a3
{
}

- (CALayer)edrGainLayer
{
  return self->_edrGainLayer;
}

- (void)setMaskTransformerDelegate:(id)a3
{
}

- (PUCleanupMaskTransformerDelegate)maskTransformerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_maskTransformerDelegate);
  return (PUCleanupMaskTransformerDelegate *)WeakRetained;
}

- (void)setSampledPoints:(id)a3
{
}

- (NSArray)sampledPoints
{
  return self->_sampledPoints;
}

- (void)setFoundIntersectionMasks:(id)a3
{
}

- (NSArray)foundIntersectionMasks
{
  return self->_foundIntersectionMasks;
}

- (void)setBackgroundMasks:(id)a3
{
}

- (NSArray)backgroundMasks
{
  return self->_backgroundMasks;
}

- (void)setForegroundMasks:(id)a3
{
}

- (NSArray)foregroundMasks
{
  return self->_foregroundMasks;
}

- (void)setSelectedMask:(id)a3
{
}

- (CIImage)selectedMask
{
  return self->_selectedMask;
}

- (void)setMask:(id)a3
{
}

- (CIImage)mask
{
  return self->_mask;
}

- (id)_debugColorForIndex:(int64_t)a3
{
  v4 = [(PUCleanupToolMaskView *)self _debugColors];
  v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", a3 % (unint64_t)objc_msgSend(v4, "count"));

  return v5;
}

- (id)_debugColors
{
  if (_debugColors_onceToken != -1) {
    dispatch_once(&_debugColors_onceToken, &__block_literal_global_53499);
  }
  v2 = (void *)_debugColors_colors;
  return v2;
}

void __37__PUCleanupToolMaskView__debugColors__block_invoke()
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
  for (uint64_t i = 0; i != 10; ++i)
  {
    v1 = [MEMORY[0x1E4FB1618] colorWithHue:(double)i / 10.0 saturation:0.8 brightness:0.8 alpha:0.6];
    [v4 addObject:v1];
  }
  uint64_t v2 = [v4 copy];
  v3 = (void *)_debugColors_colors;
  _debugColors_colors = v2;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 bounds];
  v67 = a4;
  CGContextClearRect(a4, v89);
  v66 = v6;
  v7 = [v6 sublayers];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v80 objects:v87 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v81 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v80 + 1) + 8 * i) removeFromSuperlayer];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v80 objects:v87 count:16];
    }
    while (v9);
  }
  v65 = v7;
  v12 = [(PUCleanupToolMaskView *)self mediaView];
  [v12 zoomScale];
  double v14 = v13;

  double v15 = fmax(v14, 1.0);
  v16 = [(PUCleanupToolMaskView *)self backgroundMasks];

  v17 = (double *)&unk_1AEFEF000;
  if (v16)
  {
    v18 = [MEMORY[0x1E4FB1618] colorWithRed:0.3 green:1.0 blue:0.3 alpha:1.0];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v19 = [(PUCleanupToolMaskView *)self backgroundMasks];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v76 objects:v86 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = 0;
      uint64_t v23 = *(void *)v77;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v77 != v23) {
            objc_enumerationMutation(v19);
          }
          uint64_t v25 = *(void *)(*((void *)&v76 + 1) + 8 * j);
          id v26 = [(PUCleanupToolMaskView *)self _debugColorForIndex:v22 + j];
          -[PUCleanupToolMaskView drawMask:mask:fillColor:strokeColor:lineScale:](self, "drawMask:mask:fillColor:strokeColor:lineScale:", v67, v25, [v26 CGColor], objc_msgSend(v18, "CGColor"), v15);
        }
        v22 += j;
        uint64_t v21 = [v19 countByEnumeratingWithState:&v76 objects:v86 count:16];
      }
      while (v21);
    }
    else
    {
      uint64_t v22 = 0;
    }

    v17 = (double *)&unk_1AEFEF000;
  }
  else
  {
    uint64_t v22 = 0;
  }
  v27 = [(PUCleanupToolMaskView *)self foregroundMasks];

  if (v27)
  {
    v28 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.3 blue:0.3 alpha:1.0];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v29 = [(PUCleanupToolMaskView *)self foregroundMasks];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v72 objects:v85 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v73;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v73 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v72 + 1) + 8 * k);
          id v35 = [(PUCleanupToolMaskView *)self _debugColorForIndex:v22 + k];
          -[PUCleanupToolMaskView drawMask:mask:fillColor:strokeColor:lineScale:](self, "drawMask:mask:fillColor:strokeColor:lineScale:", v67, v34, [v35 CGColor], objc_msgSend(v28, "CGColor"), v15);
        }
        v22 += k;
        uint64_t v31 = [v29 countByEnumeratingWithState:&v72 objects:v85 count:16];
      }
      while (v31);
    }

    v17 = (double *)&unk_1AEFEF000;
  }
  v36 = [(PUCleanupToolMaskView *)self foundIntersectionMasks];

  if (v36)
  {
    v37 = +[PUPhotoEditProtoSettings sharedInstance];
    int v38 = [v37 retouchShowsIntersectedMasks];

    if (v38)
    {
      v39 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:1.0 blue:0.0 alpha:1.0];
      v40 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.8];
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v41 = [(PUCleanupToolMaskView *)self foundIntersectionMasks];
      uint64_t v42 = [v41 countByEnumeratingWithState:&v68 objects:v84 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v69;
        do
        {
          for (uint64_t m = 0; m != v43; ++m)
          {
            if (*(void *)v69 != v44) {
              objc_enumerationMutation(v41);
            }
            -[PUCleanupToolMaskView drawMask:mask:fillColor:strokeColor:lineScale:](self, "drawMask:mask:fillColor:strokeColor:lineScale:", v67, *(void *)(*((void *)&v68 + 1) + 8 * m), [v40 CGColor], objc_msgSend(objc_retainAutorelease(v39), "CGColor"), v15 + v15);
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v68 objects:v84 count:16];
        }
        while (v43);
      }

      v17 = (double *)&unk_1AEFEF000;
    }
  }
  v46 = [(PUCleanupToolMaskView *)self mask];

  if (v46)
  {
    v47 = [MEMORY[0x1E4FB1618] colorWithRed:v17[63] green:1.0 blue:v17[63] alpha:1.0];
    v48 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
    v49 = [(PUCleanupToolMaskView *)self mask];
    id v50 = v48;
    uint64_t v51 = [v50 CGColor];
    id v52 = v47;
    -[PUCleanupToolMaskView drawMask:mask:fillColor:strokeColor:lineScale:](self, "drawMask:mask:fillColor:strokeColor:lineScale:", v67, v49, v51, [v52 CGColor], v15);
  }
  v53 = [(PUCleanupToolMaskView *)self selectedMask];

  if (v53)
  {
    v54 = [MEMORY[0x1E4FB1618] colorWithRed:v17[63] green:1.0 blue:v17[63] alpha:1.0];
    v55 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.647058824 blue:0.0 alpha:0.5];
    v56 = [(PUCleanupToolMaskView *)self selectedMask];
    id v57 = v55;
    uint64_t v58 = [v57 CGColor];
    id v59 = v54;
    -[PUCleanupToolMaskView drawMask:mask:fillColor:strokeColor:lineScale:](self, "drawMask:mask:fillColor:strokeColor:lineScale:", v67, v56, v58, [v59 CGColor], v15);
  }
  uint64_t v60 = [(PUCleanupToolMaskView *)self sampledPoints];
  if (v60)
  {
    v61 = (void *)v60;
    v62 = +[PUPhotoEditProtoSettings sharedInstance];
    int v63 = [v62 retouchShowsTargetPointBrushPoints];

    if (v63)
    {
      v64 = [(PUCleanupToolMaskView *)self sampledPoints];
      [(PUCleanupToolMaskView *)self drawSampledPoints:v64 toContext:v67];
    }
  }
}

- (void)drawSampledPoints:(id)a3 toContext:(CGContext *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  p_maskTransformerDelegate = &self->_maskTransformerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_maskTransformerDelegate);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)p_maskTransformerDelegate);
    [v9 imageSize];
    double v11 = v10;
    double v13 = v12;

    CGContextSaveGState(a4);
    id v14 = [MEMORY[0x1E4FB1618] orangeColor];
    CGContextSetFillColorWithColor(a4, (CGColorRef)[v14 CGColor]);

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v15 = v6;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v30;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v19), "nu_CGPoint", (void)v29);
          double v21 = v11 * v20;
          double v23 = v13 * v22;
          id v24 = objc_loadWeakRetained((id *)p_maskTransformerDelegate);
          objc_msgSend(v24, "transformedPoint:", v21, v23);
          double v26 = v25;
          double v28 = v27;

          v35.origin.x = v26 + -1.0;
          v35.origin.y = v28 + -1.0;
          v35.size.width = 2.0;
          v35.size.height = 2.0;
          CGContextFillRect(a4, v35);
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v17);
    }

    CGContextRestoreGState(a4);
  }
}

- (void)drawMask:(CGContext *)a3 mask:(id)a4 fillColor:(CGColor *)a5 strokeColor:(CGColor *)a6 lineScale:(double)a7
{
  id v12 = a4;
  [v12 extent];
  if (!CGRectIsEmpty(v67))
  {
    [(PUCleanupToolMaskView *)self bounds];
    if (!CGRectIsEmpty(v68))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_maskTransformerDelegate);

      if (WeakRetained)
      {
        id v14 = objc_loadWeakRetained((id *)&self->_maskTransformerDelegate);
        [v14 imageSize];
        double v16 = v15;
        double v18 = v17;

        double v19 = v16 / v18;
        [v12 extent];
        double v21 = v20;
        [v12 extent];
        double v23 = v19 / (v21 / v22);
        CGContextRef c = a3;
        if (fabs(v23 + -1.0) > 0.00000999999975)
        {
          CGAffineTransformMakeScale(&v66, 1.0, 1.0 / v23);
          uint64_t v24 = objc_msgSend(v12, "imageByApplyingTransform:", &v66, a3);

          id v12 = (id)v24;
        }
        id v25 = objc_loadWeakRetained((id *)&self->_maskTransformerDelegate);
        uint64_t v65 = 0;
        double v26 = [v25 transformedImage:v12 error:&v65];

        id v59 = [v26 imageByApplyingFilter:@"CIColorInvert"];
        uint64_t v27 = [MEMORY[0x1E4F8A380] dilateMask:fmax(4.0 / a7 withRadius:1.0)];
        double v28 = [MEMORY[0x1E4F1E040] multiplyCompositingFilter];
        uint64_t v58 = (void *)v27;
        [v28 setInputImage:v27];
        [v28 setBackgroundImage:v26];
        id v57 = v28;
        v56 = [v28 outputImage];
        long long v29 = [v56 imageByApplyingFilter:@"CIMaskToAlpha"];
        [MEMORY[0x1E4FB1618] colorWithCGColor:a6];
        double v63 = 0.0;
        double v64 = 0.0;
        double v61 = 0.0;
        v54 = double v62 = 0.0;
        [v54 getRed:&v64 green:&v63 blue:&v62 alpha:&v61];
        uint64_t v30 = [MEMORY[0x1E4F1E008] colorWithRed:v64 green:v63 blue:v62 alpha:v61];
        long long v31 = (void *)MEMORY[0x1E4F8A380];
        [v29 extent];
        v53 = (void *)v30;
        uint64_t v32 = objc_msgSend(v31, "imageWithColor:extent:", v30);
        v33 = [MEMORY[0x1E4F1E040] multiplyCompositingFilter];
        [v33 setInputImage:v29];
        id v52 = (void *)v32;
        [v33 setBackgroundImage:v32];
        uint64_t v34 = [v33 outputImage];
        uint64_t v60 = v26;
        CGRect v35 = [v26 imageByApplyingFilter:@"CIColorInvert"];
        uint64_t v36 = [v35 imageByApplyingFilter:@"CIMaskToAlpha"];

        id v50 = [MEMORY[0x1E4FB1618] colorWithCGColor:a5];
        [v50 getRed:&v64 green:&v63 blue:&v62 alpha:&v61];
        v37 = [MEMORY[0x1E4F1E008] colorWithRed:v64 green:v63 blue:v62 alpha:v61];
        int v38 = (void *)MEMORY[0x1E4F8A380];
        v55 = v29;
        [v29 extent];
        v39 = objc_msgSend(v38, "imageWithColor:extent:", v37);
        v40 = [MEMORY[0x1E4F1E040] multiplyCompositingFilter];
        uint64_t v51 = (void *)v36;
        [v40 setInputImage:v36];
        [v40 setBackgroundImage:v39];
        v41 = [v40 outputImage];
        uint64_t v42 = (void *)v34;
        uint64_t v43 = [v41 imageByCompositingOverImage:v34];
        uint64_t v44 = objc_opt_new();
        [v43 extent];
        uint64_t v45 = objc_msgSend(v44, "createCGImage:fromRect:", v43);
        if (v45)
        {
          v46 = (CGImage *)v45;
          [(PUCleanupToolMaskView *)self bounds];
          CGFloat v48 = v47;
          [(PUCleanupToolMaskView *)self bounds];
          v69.origin.x = 0.0;
          v69.origin.y = 0.0;
          v69.size.width = v48;
          CGContextDrawImage(c, v69, v46);
          CGImageRelease(v46);
        }

        id v12 = v60;
      }
    }
  }
}

- (void)setNeedsDisplay
{
  v4.receiver = self;
  v4.super_class = (Class)PUCleanupToolMaskView;
  [(PUCleanupToolMaskView *)&v4 setNeedsDisplay];
  v3 = [(PUCleanupToolMaskView *)self layer];
  [v3 setNeedsDisplay];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PUCleanupToolMaskView;
  [(PUCleanupToolMaskView *)&v13 layoutSubviews];
  v3 = [(PUCleanupToolMaskView *)self edrGainLayer];

  if (v3)
  {
    [(PUCleanupToolMaskView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id v12 = [(PUCleanupToolMaskView *)self edrGainLayer];
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
  }
}

- (void)setUpEDRGainLayer
{
  id v4 = [MEMORY[0x1E4F90130] layer];
  [(PUCleanupToolMaskView *)self setEdrGainLayer:v4];
  v3 = [(PUCleanupToolMaskView *)self layer];
  [v3 addSublayer:v4];
}

- (PUCleanupToolMaskView)initWithMediaView:(id)a3 isHDR:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUCleanupToolMaskView;
  double v8 = -[PUCleanupToolMaskView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaView, a3);
    if (v4) {
      [(PUCleanupToolMaskView *)v9 setUpEDRGainLayer];
    }
    double v10 = [(PUCleanupToolMaskView *)v9 layer];
    [v10 setGeometryFlipped:1];
  }
  return v9;
}

@end