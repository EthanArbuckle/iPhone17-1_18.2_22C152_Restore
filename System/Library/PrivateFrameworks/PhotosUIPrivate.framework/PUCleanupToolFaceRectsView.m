@interface PUCleanupToolFaceRectsView
- (BOOL)isHDR;
- (BOOL)needsClearing;
- (NUMediaView)mediaView;
- (PUCleanupFaceRectsImageSizeDelegate)faceRectsImageSizeDelegate;
- (PUCleanupToolFaceRectsView)initWithMediaView:(id)a3 isHDR:(BOOL)a4 delegate:(id)a5;
- (void)setFaceRectsImageSizeDelegate:(id)a3;
- (void)setIsHDR:(BOOL)a3;
- (void)setMediaView:(id)a3;
- (void)setNeedsClearing:(BOOL)a3;
- (void)updateDetectedFaces:(id)a3 imageOrientation:(int64_t)a4;
@end

@implementation PUCleanupToolFaceRectsView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_faceRectsImageSizeDelegate);
  objc_destroyWeak((id *)&self->_mediaView);
}

- (void)setFaceRectsImageSizeDelegate:(id)a3
{
}

- (PUCleanupFaceRectsImageSizeDelegate)faceRectsImageSizeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceRectsImageSizeDelegate);
  return (PUCleanupFaceRectsImageSizeDelegate *)WeakRetained;
}

- (void)setIsHDR:(BOOL)a3
{
  self->_isHDR = a3;
}

- (BOOL)isHDR
{
  return self->_isHDR;
}

- (void)setMediaView:(id)a3
{
}

- (NUMediaView)mediaView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  return (NUMediaView *)WeakRetained;
}

- (void)setNeedsClearing:(BOOL)a3
{
  self->_needsClearing = a3;
}

- (BOOL)needsClearing
{
  return self->_needsClearing;
}

- (void)updateDetectedFaces:(id)a3 imageOrientation:(int64_t)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(PUCleanupToolFaceRectsView *)self layer];
  [v6 setSublayers:0];

  if ([v5 count])
  {
    [(PUCleanupToolFaceRectsView *)self setNeedsClearing:1];
    v7 = [(PUCleanupToolFaceRectsView *)self window];
    uint64_t v8 = [v7 screen];

    v68 = (void *)v8;
    [MEMORY[0x1E4F7A798] currentEDRHeadroomForScreen:v8];
    double v10 = v9;
    [MEMORY[0x1E4F7A4A0] thresholdDisplayHeadroom];
    long long v77 = 0u;
    long long v78 = 0u;
    if ([(PUCleanupToolFaceRectsView *)self isHDR] && v10 >= v11) {
      double v12 = 2.0;
    }
    else {
      double v12 = 1.0;
    }
    long long v79 = 0uLL;
    long long v80 = 0uLL;
    id v69 = v5;
    id obj = v5;
    uint64_t v75 = [obj countByEnumeratingWithState:&v77 objects:v83 count:16];
    if (v75)
    {
      uint64_t v76 = 0;
      uint64_t v72 = *MEMORY[0x1E4F3A458];
      uint64_t v73 = *(void *)v78;
      uint64_t v71 = *MEMORY[0x1E4F3A478];
      do
      {
        for (uint64_t i = 0; i != v75; ++i)
        {
          if (*(void *)v78 != v73) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          v15 = [MEMORY[0x1E4F39C88] layer];
          v16 = [(PUCleanupToolFaceRectsView *)self layer];
          [v16 insertSublayer:v15 atIndex:0];

          v81[0] = @"position";
          v17 = [MEMORY[0x1E4F1CA98] null];
          v82[0] = v17;
          v81[1] = @"bounds";
          v18 = [MEMORY[0x1E4F1CA98] null];
          v82[1] = v18;
          v81[2] = @"transform";
          v19 = [MEMORY[0x1E4F1CA98] null];
          v82[2] = v19;
          v81[3] = @"frame";
          v20 = [MEMORY[0x1E4F1CA98] null];
          v82[3] = v20;
          v81[4] = @"opacity";
          v21 = [MEMORY[0x1E4F1CA98] null];
          v82[4] = v21;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:5];
          [v15 setActions:v22];

          [v15 setLineCap:v72];
          [v15 setLineJoin:v71];
          id v23 = [MEMORY[0x1E4FB1618] clearColor];
          objc_msgSend(v15, "setFillColor:", objc_msgSend(v23, "CGColor"));

          id v24 = [MEMORY[0x1E4FB1618] colorWithRed:v12 green:v12 blue:0.0 alpha:1.0];
          objc_msgSend(v15, "setStrokeColor:", objc_msgSend(v24, "CGColor"));
          [v15 setLineWidth:1.5];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_faceRectsImageSizeDelegate);
          [WeakRetained imageSize];

          [v14 boundingBox];
          objc_msgSend(MEMORY[0x1E4F8A2E8], "inflatedFaceRect:imageOrientation:", a4);
          NURectDenormalize();
          double v27 = v26;
          double v29 = v28;
          double v31 = v30;
          double v33 = v32;
          id v34 = objc_loadWeakRetained((id *)&self->_mediaView);
          objc_msgSend(v34, "convertViewRect:fromSpace:", @"/masterSpace", v27, v29, v31, v33);
          double v36 = v35;
          double v38 = v37;
          double v40 = v39;
          double v42 = v41;

          id v43 = objc_loadWeakRetained((id *)&self->_mediaView);
          objc_msgSend(v43, "convertRectFromImage:", v36, v38, v40, v42);
          double v45 = v44;
          double v47 = v46;
          double v49 = v48;
          double v51 = v50;

          id v52 = objc_loadWeakRetained((id *)&self->_mediaView);
          v53 = [v52 superview];
          objc_msgSend(v53, "convertRect:toView:", self, v45, v47, v49, v51);
          double v55 = v54;
          double v57 = v56;
          double v59 = v58;
          double v61 = v60;

          objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v55, v57, v59, v61);
          id v62 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setPath:", objc_msgSend(v62, "CGPath"));
          id v63 = objc_alloc_init(MEMORY[0x1E4F39CE8]);
          v64 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v76 + i);
          [v63 setString:v64];

          id v65 = v24;
          objc_msgSend(v63, "setForegroundColor:", objc_msgSend(v65, "CGColor"));
          [v63 setFontSize:14.0];
          [v63 preferredFrameSize];
          objc_msgSend(v63, "setFrame:", v55 + 2.0, v57 + 1.0, v66, v67);
          [v15 addSublayer:v63];
        }
        v76 += i;
        uint64_t v75 = [obj countByEnumeratingWithState:&v77 objects:v83 count:16];
      }
      while (v75);
    }

    id v5 = v69;
  }
  else
  {
    [(PUCleanupToolFaceRectsView *)self setNeedsClearing:0];
  }
}

- (PUCleanupToolFaceRectsView)initWithMediaView:(id)a3 isHDR:(BOOL)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  double v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PUCleanupToolFaceRectsView.m", 41, @"Invalid parameter not satisfying: %@", @"mediaView != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PUCleanupToolFaceRectsView.m", 42, @"Invalid parameter not satisfying: %@", @"delegate != nil" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)PUCleanupToolFaceRectsView;
  double v12 = -[PUCleanupToolFaceRectsView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_mediaView, v9);
    objc_storeWeak((id *)&v13->_faceRectsImageSizeDelegate, v11);
    v13->_isHDR = a4;
    v14 = [(PUCleanupToolFaceRectsView *)v13 layer];
    [v14 setWantsExtendedDynamicRangeContent:1];

    v15 = [(PUCleanupToolFaceRectsView *)v13 layer];
    [v15 setGeometryFlipped:1];
  }
  return v13;
}

@end