@interface PXPeopleSuggestionView
- (BOOL)needsSpotlightUpdate;
- (BOOL)validSpotlight;
- (CAShapeLayer)spotlightLayer;
- (CGRect)_scaledFaceRect;
- (CGRect)faceRect;
- (NSDateFormatter)dateFormatter;
- (PXPeopleSuggestionView)init;
- (PXPeopleSuggestionView)initWithFrame:(CGRect)a3;
- (PXPerson)suggestion;
- (PXPersonImageRequest)imageRequest;
- (UIImageView)imageView;
- (UILabel)dateLabel;
- (UIView)dimView;
- (UIView)suggestionView;
- (double)_faceScale;
- (void)_updateDateFieldWithSuggestion:(id)a3;
- (void)_updateSpotlightAnimated:(BOOL)a3;
- (void)_updateSuggestionImageWithAnimatedSpotlight:(BOOL)a3 withCompletion:(id)a4;
- (void)commonInit;
- (void)layoutSubviews;
- (void)setDateFormatter:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setDimView:(id)a3;
- (void)setFaceRect:(CGRect)a3;
- (void)setImageRequest:(id)a3;
- (void)setImageView:(id)a3;
- (void)setNeedsSpotlightUpdate:(BOOL)a3;
- (void)setSpotlightLayer:(id)a3;
- (void)setSuggestion:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (void)setSuggestionView:(id)a3;
- (void)setValidSpotlight:(BOOL)a3;
- (void)viewScaleDidChange;
@end

@implementation PXPeopleSuggestionView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_imageRequest, 0);
  objc_storeStrong((id *)&self->_spotlightLayer, 0);
  objc_storeStrong((id *)&self->_dimView, 0);
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

- (void)setDateLabel:(id)a3
{
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateFormatter:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setImageRequest:(id)a3
{
}

- (PXPersonImageRequest)imageRequest
{
  return self->_imageRequest;
}

- (void)setValidSpotlight:(BOOL)a3
{
  self->_validSpotlight = a3;
}

- (BOOL)validSpotlight
{
  return self->_validSpotlight;
}

- (void)setNeedsSpotlightUpdate:(BOOL)a3
{
  self->_needsSpotlightUpdate = a3;
}

- (BOOL)needsSpotlightUpdate
{
  return self->_needsSpotlightUpdate;
}

- (void)setSpotlightLayer:(id)a3
{
}

- (CAShapeLayer)spotlightLayer
{
  return self->_spotlightLayer;
}

- (void)setDimView:(id)a3
{
}

- (UIView)dimView
{
  return self->_dimView;
}

- (void)setSuggestionView:(id)a3
{
}

- (UIView)suggestionView
{
  return self->_suggestionView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setFaceRect:(CGRect)a3
{
  self->_faceRect = a3;
}

- (CGRect)faceRect
{
  double x = self->_faceRect.origin.x;
  double y = self->_faceRect.origin.y;
  double width = self->_faceRect.size.width;
  double height = self->_faceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PXPerson)suggestion
{
  return self->_suggestion;
}

- (double)_faceScale
{
  v3 = [(PXPeopleSuggestionView *)self imageView];
  v4 = [v3 image];
  [v4 size];
  double v6 = v5;

  v7 = [(PXPeopleSuggestionView *)self imageView];
  [v7 bounds];
  double v9 = v8;

  return v9 / v6;
}

- (CGRect)_scaledFaceRect
{
  [(PXPeopleSuggestionView *)self _faceScale];
  double v4 = v3;
  [(PXPeopleSuggestionView *)self faceRect];
  double v6 = v4 * v5;
  double v8 = v4 * v7;
  double v10 = v4 * v9;
  double v12 = v4 * v11;
  result.size.double height = v12;
  result.size.double width = v10;
  result.origin.double y = v8;
  result.origin.double x = v6;
  return result;
}

- (void)_updateDateFieldWithSuggestion:(id)a3
{
  id v10 = a3;
  double v4 = +[PXPeopleUISettings sharedInstance];
  int v5 = [v4 displayReviewMorePhotosDate];

  if (v10 && v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v6 = objc_msgSend(v10, "px_keyPhotoDate");
    double v7 = [(PXPeopleSuggestionView *)self dateFormatter];
    double v8 = [v7 stringFromDate:v6];

    double v9 = [(PXPeopleSuggestionView *)self dateLabel];
    [v9 setText:v8];
  }
  else
  {
    double v6 = [(PXPeopleSuggestionView *)self dateLabel];
    [v6 setText:&stru_1F00B0030];
  }
}

- (void)_updateSpotlightAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(PXPeopleSuggestionView *)self faceRect];
  v58.origin.double x = v5;
  v58.origin.double y = v6;
  v58.size.double width = v7;
  v58.size.double height = v8;
  if (!CGRectEqualToRect(*MEMORY[0x1E4F1DB28], v58))
  {
    double v9 = [(PXPeopleSuggestionView *)self spotlightLayer];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [(PXPeopleSuggestionView *)self _scaledFaceRect];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    double v50 = v13;
    double v51 = v11;
    double v48 = v17;
    double v49 = v15;
    if (![(PXPeopleSuggestionView *)self validSpotlight])
    {
      v26 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v11, v13, v15, v17);
      v27 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v11 - v15 * 0.5, v13 - v17 * 0.5, v15 + v15, v17 + v17);
      [v26 appendPath:v27];

      id v28 = v26;
      objc_msgSend(v9, "setPath:", objc_msgSend(v28, "CGPath"));
      v29 = [(PXPeopleSuggestionView *)self dimView];
      [v29 setAlpha:1.0];
    }
    v55.origin.double x = v19;
    v55.origin.double y = v21;
    v55.size.double width = v23;
    v55.size.double height = v25;
    double Width = CGRectGetWidth(v55);
    v56.origin.double x = v19;
    v56.origin.double y = v21;
    v56.size.double width = v23;
    v56.size.double height = v25;
    double Height = CGRectGetHeight(v56);
    if (Width >= Height) {
      double v32 = Width;
    }
    else {
      double v32 = Height;
    }
    CGFloat v33 = v19;
    CGFloat v34 = v21;
    double v35 = v32;
    CGRect v57 = CGRectIntegral(*(CGRect *)(&v32 - 2));
    double x = v57.origin.x;
    double y = v57.origin.y;
    double v38 = v57.size.width;
    double v39 = v57.size.height;
    v40 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v51, v50, v49, v48);
    v41 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", x, y, v38, v39);
    [v40 appendPath:v41];

    id v42 = v40;
    uint64_t v43 = [v42 CGPath];
    [MEMORY[0x1E4F39CF8] begin];
    v44 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"path"];
    objc_msgSend(v44, "setFromValue:", objc_msgSend(v9, "path"));
    [v44 setToValue:v43];
    double v45 = 0.33;
    if (!v3) {
      double v45 = 0.0;
    }
    objc_msgSend(v44, "setDuration:", v45, *(void *)&v48, *(void *)&v49, *(void *)&v50, *(void *)&v51);
    v46 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    [v44 setTimingFunction:v46];

    [v44 setRemovedOnCompletion:0];
    [v9 addAnimation:v44 forKey:@"path"];
    [v9 setPath:v43];
    objc_initWeak(&location, self);
    v47 = (void *)MEMORY[0x1E4F39CF8];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __51__PXPeopleSuggestionView__updateSpotlightAnimated___block_invoke;
    v52[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v53, &location);
    [v47 setCompletionBlock:v52];
    [MEMORY[0x1E4F39CF8] commit];
    objc_destroyWeak(&v53);
    objc_destroyWeak(&location);
  }
}

void __51__PXPeopleSuggestionView__updateSpotlightAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setValidSpotlight:1];
}

- (void)_updateSuggestionImageWithAnimatedSpotlight:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  CGFloat v7 = [(PXPeopleSuggestionView *)self superview];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;

  if (v9 < v11) {
    double v11 = v9;
  }
  [(PXSmartScaleView *)self displayScale];
  double v13 = v12;
  double v14 = [(PXPeopleSuggestionView *)self imageView];
  objc_initWeak(&location, self);
  double v15 = [(PXPeopleSuggestionView *)self suggestion];
  objc_opt_class();
  double v16 = v13 * v11;
  if (objc_opt_isKindOfClass())
  {
    double v17 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v15, v16, v16, v13);
  }
  else
  {
    id v18 = v15;
    CGFloat v19 = [PXPeopleFaceCropFetchOptions alloc];
    double v20 = [v18 person];
    CGFloat v21 = [v18 keyFace];
    double v17 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:](v19, "initWithPerson:face:targetSize:displayScale:", v20, v21, v16, v16, v13);
  }
  [(PXPeopleFaceCropFetchOptions *)v17 setWantsSmallFaceRect:1];
  [(PXPeopleFaceCropFetchOptions *)v17 setCropFactor:1];
  [(PXPeopleFaceCropFetchOptions *)v17 setCornerStyle:0];
  [(PXPeopleFaceCropFetchOptions *)v17 setShouldCacheResult:0];
  double v22 = [(PXPeopleSuggestionView *)self imageRequest];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __85__PXPeopleSuggestionView__updateSuggestionImageWithAnimatedSpotlight_withCompletion___block_invoke;
  v25[3] = &unk_1E5DCB578;
  id v23 = v6;
  id v28 = v23;
  objc_copyWeak(&v29, &location);
  id v24 = v14;
  id v26 = v24;
  v27 = self;
  BOOL v30 = a3;
  [v22 requestFaceCropWithOptions:v17 timeout:v25 resultHandler:1.0];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __85__PXPeopleSuggestionView__updateSuggestionImageWithAnimatedSpotlight_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_copyWeak(&v10, (id *)(a1 + 56));
    *(id *)(a1 + 32);
    v5;
    id v7 = v6;
    double v8 = *(void **)(a1 + 48);
    char v11 = *(unsigned char *)(a1 + 64);
    v8;
    px_dispatch_on_main_queue();
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
}

void __85__PXPeopleSuggestionView__updateSuggestionImageWithAnimatedSpotlight_withCompletion___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));

  if (WeakRetained)
  {
    id v31 = objc_loadWeakRetained(v2);
    [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
    double v4 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"PXPeopleContentsRectKey"];
    [v4 CGRectValue];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = [*(id *)(a1 + 32) layer];
    objc_msgSend(v13, "setContentsRect:", v6, v8, v10, v12);

    double v14 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"PXPeopleSmallFaceRectKey"];
    [v14 CGRectValue];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    id v23 = *(void **)(a1 + 32);
    id v24 = [v31 imageView];
    if (v23 == v24
      && (v33.origin.double x = v16,
          v33.origin.double y = v18,
          v33.size.double width = v20,
          v33.size.double height = v22,
          !CGRectEqualToRect(v33, *MEMORY[0x1E4F1DB28])))
    {
      [*(id *)(a1 + 56) faceRect];
      v35.origin.double x = v26;
      v35.origin.double y = v27;
      v35.size.double width = v28;
      v35.size.double height = v29;
      v34.origin.double x = v16;
      v34.origin.double y = v18;
      v34.size.double width = v20;
      v34.size.double height = v22;
      BOOL v30 = CGRectEqualToRect(v34, v35);

      if (!v30)
      {
        objc_msgSend(v31, "setFaceRect:", v16, v18, v20, v22);
        if (*(unsigned char *)(a1 + 80)) {
          [v31 _updateSpotlightAnimated:1];
        }
      }
    }
    else
    {
    }
    uint64_t v25 = *(void *)(a1 + 64);
    if (v25) {
      (*(void (**)(uint64_t, uint64_t))(v25 + 16))(v25, 1);
    }
  }
}

- (void)setSuggestion:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  LODWORD(v6) = a4;
  double v9 = (PXPerson *)a3;
  double v10 = (void (**)(id, uint64_t))a5;
  if (self->_suggestion == v9)
  {
    if (v6)
    {
      [(PXPeopleSuggestionView *)self faceRect];
      v46.origin.double x = v26;
      v46.origin.double y = v27;
      v46.size.double width = v28;
      v46.size.double height = v29;
      if (CGRectEqualToRect(*MEMORY[0x1E4F1DB28], v46))
      {
        [(PXPeopleSuggestionView *)self setNeedsSpotlightUpdate:1];
        if (!v10) {
          goto LABEL_14;
        }
      }
      else
      {
        [(PXPeopleSuggestionView *)self _updateSpotlightAnimated:1];
        if (!v10) {
          goto LABEL_14;
        }
      }
      v10[2](v10, 1);
    }
  }
  else
  {
    double v11 = [(PXPeopleSuggestionView *)self imageRequest];
    [v11 cancel];

    objc_storeStrong((id *)&self->_suggestion, a3);
    double v12 = [(PXPeopleSuggestionView *)self imageView];
    id v13 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    [v12 frame];
    objc_msgSend(v13, "setFrame:");
    [v13 setContentMode:1];
    [v13 setClipsToBounds:1];
    [v13 setAccessibilityIgnoresInvertColors:1];
    [v13 setAlpha:0.0];
    double v14 = [(PXPeopleSuggestionView *)self suggestionView];
    double v15 = [(PXPeopleSuggestionView *)self imageView];
    [v14 insertSubview:v13 aboveSubview:v15];

    [(PXPeopleSuggestionView *)self setImageView:v13];
    double v16 = [(PXPeopleSuggestionView *)self superview];
    [v16 frame];
    double v18 = v17;
    double v20 = v19;

    if (v18 < v20) {
      double v20 = v18;
    }
    [(PXSmartScaleView *)self displayScale];
    double v22 = v21;
    id v23 = [[PXPersonImageRequest alloc] initWithPerson:v9];
    [(PXPeopleSuggestionView *)self setImageRequest:v23];
    if (PFOSVariantHasInternalUI()) {
      [(PXPeopleSuggestionView *)self _updateDateFieldWithSuggestion:v9];
    }
    double v24 = v22 * v20;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v25 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v9, v24, v24, v22);
    }
    else
    {
      BOOL v30 = v9;
      id v31 = [PXPeopleFaceCropFetchOptions alloc];
      double v32 = [(PXPerson *)v30 person];
      [(PXPerson *)v30 keyFace];
      double v39 = v9;
      CGRect v33 = v23;
      CGRect v34 = v12;
      CGRect v35 = v10;
      double v6 = v36 = (char)v6;

      uint64_t v25 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:](v31, "initWithPerson:face:targetSize:displayScale:", v32, v6, v24, v24, v22);
      LOBYTE(v6) = v36;
      double v10 = v35;
      double v12 = v34;
      id v23 = v33;
      double v9 = v39;
    }
    -[PXPeopleFaceCropFetchOptions setWantsSmallFaceRect:](v25, "setWantsSmallFaceRect:", 1, v39);
    [(PXPeopleFaceCropFetchOptions *)v25 setCropFactor:1];
    [(PXPeopleFaceCropFetchOptions *)v25 setCornerStyle:0];
    [(PXPeopleFaceCropFetchOptions *)v25 setShouldCacheResult:0];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __64__PXPeopleSuggestionView_setSuggestion_animated_withCompletion___block_invoke;
    v40[3] = &unk_1E5DCB528;
    id v41 = v13;
    id v42 = v12;
    uint64_t v43 = self;
    v44 = v10;
    char v45 = (char)v6;
    id v37 = v12;
    id v38 = v13;
    [(PXPersonImageRequest *)v23 requestFaceCropWithOptions:v25 timeout:v40 resultHandler:1.0];
  }
LABEL_14:
}

void __64__PXPeopleSuggestionView_setSuggestion_animated_withCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    a1[4];
    v5;
    v6;
    a1[5];
    a1[7];
    px_dispatch_on_main_queue();
  }
  double v7 = (void (**)(id, void))a1[7];
  if (v7) {
    v7[2](v7, 0);
  }
}

void __64__PXPeopleSuggestionView_setSuggestion_animated_withCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"PXPeopleContentsRectKey"];
  [v2 CGRectValue];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v11, "setContentsRect:", v4, v6, v8, v10);

  double v12 = (void *)MEMORY[0x1E4FB1EB0];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __64__PXPeopleSuggestionView_setSuggestion_animated_withCompletion___block_invoke_3;
  v35[3] = &unk_1E5DD36F8;
  id v36 = *(id *)(a1 + 32);
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  double v32 = __64__PXPeopleSuggestionView_setSuggestion_animated_withCompletion___block_invoke_4;
  CGRect v33 = &unk_1E5DD2188;
  id v34 = *(id *)(a1 + 56);
  [v12 animateWithDuration:0 delay:v35 options:&v30 animations:0.33 completion:0.0];
  id v13 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", @"PXPeopleSmallFaceRectKey", v30, v31, v32, v33);
  [v13 CGRectValue];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v22 = *(void **)(a1 + 32);
  id v23 = [*(id *)(a1 + 64) imageView];
  if (v22 == v23
    && (v37.origin.double x = v15,
        v37.origin.double y = v17,
        v37.size.double width = v19,
        v37.size.double height = v21,
        !CGRectEqualToRect(v37, *MEMORY[0x1E4F1DB28])))
  {
    [*(id *)(a1 + 64) faceRect];
    v39.origin.double x = v25;
    v39.origin.double y = v26;
    v39.size.double width = v27;
    v39.size.double height = v28;
    v38.origin.double x = v15;
    v38.origin.double y = v17;
    v38.size.double width = v19;
    v38.size.double height = v21;
    BOOL v29 = CGRectEqualToRect(v38, v39);

    if (!v29)
    {
      objc_msgSend(*(id *)(a1 + 64), "setFaceRect:", v15, v17, v19, v21);
      [*(id *)(a1 + 64) _updateSpotlightAnimated:*(unsigned __int8 *)(a1 + 80)];
    }
  }
  else
  {
  }
  uint64_t v24 = *(void *)(a1 + 72);
  if (v24) {
    (*(void (**)(uint64_t, uint64_t))(v24 + 16))(v24, 1);
  }
}

uint64_t __64__PXPeopleSuggestionView_setSuggestion_animated_withCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __64__PXPeopleSuggestionView_setSuggestion_animated_withCompletion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)viewScaleDidChange
{
  if ([(PXPeopleSuggestionView *)self validSpotlight])
  {
    [(PXPeopleSuggestionView *)self _updateSuggestionImageWithAnimatedSpotlight:1 withCompletion:0];
  }
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)PXPeopleSuggestionView;
  [(PXPeopleSuggestionView *)&v28 layoutSubviews];
  [(PXPeopleSuggestionView *)self bounds];
  CGFloat x = v29.origin.x;
  CGFloat y = v29.origin.y;
  CGFloat width = v29.size.width;
  CGFloat height = v29.size.height;
  double v7 = CGRectGetWidth(v29);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v30);
  if (v7 >= v8) {
    double v9 = v7;
  }
  else {
    double v9 = v8;
  }
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v32);
  float v12 = MidX - v9 * 0.5;
  double v13 = floorf(v12);
  *(float *)&CGFloat MidY = MidY - v9 * 0.5;
  double v14 = floorf(*(float *)&MidY);
  *(float *)&CGFloat MidY = v9;
  double v15 = floorf(*(float *)&MidY);
  double v16 = [(PXPeopleSuggestionView *)self suggestionView];
  objc_msgSend(v16, "setFrame:", v13, v14, v15, v15);
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  CGFloat v25 = [(PXPeopleSuggestionView *)self imageView];
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  CGFloat v26 = [(PXPeopleSuggestionView *)self dimView];
  objc_msgSend(v26, "setFrame:", v18, v20, v22, v24);

  CGFloat v27 = [(PXPeopleSuggestionView *)self spotlightLayer];
  objc_msgSend(v27, "setFrame:", v18, v20, v22, v24);

  if (PFOSVariantHasInternalUI())
  {
    v33.origin.CGFloat x = v18;
    v33.origin.CGFloat y = v20;
    v33.size.CGFloat width = v22;
    v33.size.CGFloat height = v24;
    -[UILabel setFrame:](self->_dateLabel, "setFrame:", CGRectGetMaxX(v33) + -120.0, 0.0, 120.0, 16.0);
  }
  if ([(PXPeopleSuggestionView *)self validSpotlight]) {
    [(PXPeopleSuggestionView *)self _updateSpotlightAnimated:0];
  }
}

- (PXPeopleSuggestionView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXPeopleSuggestionView;
  double v3 = -[PXPeopleSuggestionView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(PXPeopleSuggestionView *)v3 commonInit];
  }
  return v4;
}

- (PXPeopleSuggestionView)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXPeopleSuggestionView;
  v2 = [(PXPeopleSuggestionView *)&v5 init];
  double v3 = v2;
  if (v2) {
    [(PXPeopleSuggestionView *)v2 commonInit];
  }
  return v3;
}

- (void)commonInit
{
  double v3 = (UIView *)objc_opt_new();
  suggestionView = self->_suggestionView;
  self->_suggestionView = v3;

  [(PXPeopleSuggestionView *)self addSubview:self->_suggestionView];
  objc_super v5 = (UIImageView *)objc_opt_new();
  imageView = self->_imageView;
  self->_imageView = v5;

  [(UIImageView *)self->_imageView setContentMode:1];
  [(UIImageView *)self->_imageView setClipsToBounds:1];
  [(UIImageView *)self->_imageView setAccessibilityIgnoresInvertColors:1];
  [(UIView *)self->_suggestionView addSubview:self->_imageView];
  id v17 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  double v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
  [v17 setBackgroundColor:v7];

  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v17 setAlpha:0.0];
  [v17 setAccessibilityIgnoresInvertColors:1];
  [(PXPeopleSuggestionView *)self setDimView:v17];
  [(UIView *)self->_suggestionView addSubview:v17];
  double v8 = [MEMORY[0x1E4F39C88] layer];
  [v8 setFillRule:*MEMORY[0x1E4F39FB8]];
  id v9 = [MEMORY[0x1E4FB1618] blackColor];
  objc_msgSend(v8, "setFillColor:", objc_msgSend(v9, "CGColor"));

  double v10 = [v17 layer];
  [v10 setMask:v8];

  [(PXPeopleSuggestionView *)self setSpotlightLayer:v8];
  self->_validSpotlight = 0;
  if (PFOSVariantHasInternalUI())
  {
    double v11 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v11;

    [(NSDateFormatter *)self->_dateFormatter setDateFormat:@"MM/dd/yyyy"];
    double v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSDateFormatter *)self->_dateFormatter setLocale:v13];

    double v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    dateLabel = self->_dateLabel;
    self->_dateLabel = v14;

    double v16 = [MEMORY[0x1E4FB1618] redColor];
    [(UILabel *)self->_dateLabel setTextColor:v16];

    [(PXPeopleSuggestionView *)self addSubview:self->_dateLabel];
  }
  [(PXPeopleSuggestionView *)self setClipsToBounds:1];
}

@end