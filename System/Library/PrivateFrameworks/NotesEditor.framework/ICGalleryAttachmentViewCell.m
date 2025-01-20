@interface ICGalleryAttachmentViewCell
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)isPortrait;
- (BOOL)shouldFade;
- (CALayer)fadeImageLayer;
- (CALayer)fadeMaskLayer;
- (CALayer)fadeWhiteLayer;
- (ICAttachment)attachment;
- (ICGalleryAttachmentViewCellDelegate)delegate;
- (UIImageView)imageView;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setAttachment:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFadeImageLayer:(id)a3;
- (void)setFadeMaskLayer:(id)a3;
- (void)setFadeWhiteLayer:(id)a3;
- (void)setImageView:(id)a3;
- (void)setShouldFade:(BOOL)a3;
- (void)updateFadeMask:(BOOL)a3;
- (void)updateImage;
@end

@implementation ICGalleryAttachmentViewCell

- (void)dealloc
{
  [(ICGalleryAttachmentViewCell *)self setAttachment:0];
  v3.receiver = self;
  v3.super_class = (Class)ICGalleryAttachmentViewCell;
  [(ICGalleryAttachmentViewCell *)&v3 dealloc];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)ICGalleryAttachmentViewCell;
  [(ICGalleryAttachmentViewCell *)&v5 prepareForReuse];
  [(ICGalleryAttachmentViewCell *)self setDelegate:0];
  [(ICGalleryAttachmentViewCell *)self setAttachment:0];
  objc_super v3 = [(ICGalleryAttachmentViewCell *)self imageView];
  [v3 setImage:0];

  [(ICGalleryAttachmentViewCell *)self setFadeMaskLayer:0];
  [(ICGalleryAttachmentViewCell *)self setFadeImageLayer:0];
  [(ICGalleryAttachmentViewCell *)self setFadeWhiteLayer:0];
  v4 = [(ICGalleryAttachmentViewCell *)self layer];
  [v4 setMask:0];
}

- (void)setAttachment:(id)a3
{
  v18 = (ICAttachment *)a3;
  objc_super v5 = [(ICGalleryAttachmentViewCell *)self imageView];
  v6 = [v5 layer];
  [v6 setCornerRadius:3.0];

  v7 = [(ICGalleryAttachmentViewCell *)self imageView];
  v8 = [v7 layer];
  [v8 setMasksToBounds:1];

  v9 = [(ICGalleryAttachmentViewCell *)self imageView];
  [v9 setContentMode:0];

  v10 = [MEMORY[0x263F825C8] colorWithWhite:*MEMORY[0x263F5B0A8] alpha:1.0];
  v11 = [(ICGalleryAttachmentViewCell *)self imageView];
  [v11 setBackgroundColor:v10];

  v12 = v18;
  if (self->_attachment != v18)
  {
    [(ICGalleryAttachmentViewCell *)self setShouldFade:0];
    objc_storeStrong((id *)&self->_attachment, a3);
    v12 = v18;
    if (v18)
    {
      [(ICAttachment *)v18 sizeWidth];
      double v14 = v13;
      [(ICAttachment *)v18 sizeHeight];
      if (v15 > 0.0)
      {
        double v16 = v14 / v15;
        BOOL v17 = v16 > *MEMORY[0x263F5B0B0] || v16 < *MEMORY[0x263F5B0B8];
        [(ICGalleryAttachmentViewCell *)self setShouldFade:v17];
      }
      [(ICGalleryAttachmentViewCell *)self updateImage];
      v12 = v18;
    }
  }
}

- (void)updateImage
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_super v3 = [a1 attachment];
  v4 = [v3 identifier];
  int v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_20BE60000, a2, OS_LOG_TYPE_DEBUG, "Using scan document image from cache for: %@", (uint8_t *)&v5, 0xCu);
}

id __42__ICGalleryAttachmentViewCell_updateImage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 size];
  double v5 = v4;
  double v7 = v6;
  [v3 scale];
  double v9 = v5 * (v8 / *(double *)(a1 + 32));
  [v3 scale];
  if (v9 > 0.0)
  {
    double v11 = v7 * (v10 / *(double *)(a1 + 32));
    if (v11 > 0.0)
    {
      float64x2_t v12 = vrndpq_f64(vmulq_f64(*(float64x2_t *)(a1 + 40), (float64x2_t)vdupq_n_s64(0x3FF199999999999AuLL)));
      double v14 = *MEMORY[0x263F001A8];
      uint64_t v13 = *(void *)(MEMORY[0x263F001A8] + 8);
      double v15 = v9 / v11;
      double v16 = v12.f64[1];
      if (v15 <= 1.0)
      {
        double v17 = v12.f64[0];
        double v20 = v12.f64[0] / v15;
      }
      else
      {
        double v17 = vmuld_lane_f64(v15, v12, 1);
        double v18 = v17 - v12.f64[0];
        if (v17 - v12.f64[0] < 0.0) {
          double v18 = 0.0;
        }
        double v19 = v14 - v18;
        if (*(unsigned char *)(a1 + 56)) {
          double v14 = v19;
        }
        double v20 = v12.f64[1];
      }
      v21 = objc_msgSend(MEMORY[0x263F827B0], "defaultFormat", *(_OWORD *)&v12);
      [v21 setScale:*(double *)(a1 + 32)];
      [v21 setOpaque:1];
      [v21 setPreferredRange:2];
      v22 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:format:", v21, v24, v16);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __42__ICGalleryAttachmentViewCell_updateImage__block_invoke_2;
      v25[3] = &unk_2640B8290;
      id v26 = v3;
      double v27 = v14;
      uint64_t v28 = v13;
      double v29 = v17;
      double v30 = v20;
      id v3 = [v22 imageWithActions:v25];
    }
  }

  return v3;
}

uint64_t __42__ICGalleryAttachmentViewCell_updateImage__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __42__ICGalleryAttachmentViewCell_updateImage__block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    double v6 = [WeakRetained attachment];
    double v7 = *(void **)(a1 + 32);

    if (v6 == v7)
    {
      objc_msgSend(v5, "updateFadeMask:", objc_msgSend(v5, "shouldFade"));
      double v8 = (void *)MEMORY[0x263F82E00];
      double v9 = [v5 imageView];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __42__ICGalleryAttachmentViewCell_updateImage__block_invoke_2_20;
      v10[3] = &unk_2640B82D8;
      id v11 = v5;
      id v12 = v3;
      [v8 transitionWithView:v9 duration:5242880 options:v10 animations:0 completion:0.200000003];
    }
  }
}

void __42__ICGalleryAttachmentViewCell_updateImage__block_invoke_2_20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) imageView];
  [v2 setImage:v1];
}

- (BOOL)isPortrait
{
  [(ICGalleryAttachmentViewCell *)self bounds];
  double v4 = v3;
  [(ICGalleryAttachmentViewCell *)self bounds];
  return v4 > v5;
}

- (void)updateFadeMask:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(ICGalleryAttachmentViewCell *)self fadeMaskLayer];

  if (!v5 && v3)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F157E8]);
    [(ICGalleryAttachmentViewCell *)self setFadeMaskLayer:v6];

    double v7 = [MEMORY[0x263F827E8] imageNamed:@"gallery_fade_gradient"];
    id v8 = objc_alloc_init(MEMORY[0x263F157E8]);
    [(ICGalleryAttachmentViewCell *)self setFadeImageLayer:v8];

    uint64_t v9 = objc_msgSend(v7, "ic_CGImage");
    double v10 = [(ICGalleryAttachmentViewCell *)self fadeImageLayer];
    [v10 setContents:v9];

    id v11 = [MEMORY[0x263F157E8] layer];
    [(ICGalleryAttachmentViewCell *)self setFadeWhiteLayer:v11];

    id v12 = [MEMORY[0x263F825C8] whiteColor];
    uint64_t v13 = [v12 CGColor];
    double v14 = [(ICGalleryAttachmentViewCell *)self fadeWhiteLayer];
    [v14 setBackgroundColor:v13];

    double v15 = [(ICGalleryAttachmentViewCell *)self fadeMaskLayer];
    double v16 = [(ICGalleryAttachmentViewCell *)self fadeWhiteLayer];
    [v15 addSublayer:v16];

    double v17 = [(ICGalleryAttachmentViewCell *)self fadeMaskLayer];
    double v18 = [(ICGalleryAttachmentViewCell *)self fadeImageLayer];
    [v17 addSublayer:v18];
  }
  [(ICGalleryAttachmentViewCell *)self bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v27 = [(ICGalleryAttachmentViewCell *)self fadeMaskLayer];
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  if (v3)
  {
    int v28 = objc_msgSend(MEMORY[0x263F81658], "ic_isRTL");
    BOOL v29 = [(ICGalleryAttachmentViewCell *)self isPortrait];
    double v30 = [(ICGalleryAttachmentViewCell *)self fadeMaskLayer];
    [v30 bounds];
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    uint64_t v38 = v37;

    long long v39 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v85.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v85.c = v39;
    *(_OWORD *)&v85.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    if (v29)
    {
      v40 = [(ICGalleryAttachmentViewCell *)self fadeMaskLayer];
      [v40 frame];
      TSDRectGetMaxPoint();

      TSDRectWithPoints();
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;
      TSDRectWithPoints();
      double x = v49;
      double y = v51;
      double width = v53;
      double height = v55;
    }
    else
    {
      uint64_t v57 = v32;
      uint64_t v58 = v34;
      uint64_t v59 = v36;
      uint64_t v60 = v38;
      if (v28)
      {
        CGRectGetMaxY(*(CGRect *)&v57);
        TSDRectWithPoints();
        double x = v87.origin.x;
        double y = v87.origin.y;
        double width = v87.size.width;
        double height = v87.size.height;
        CGRectGetMinX(v87);
        v61 = [(ICGalleryAttachmentViewCell *)self fadeMaskLayer];
        [v61 frame];
        TSDRectGetMaxPoint();
        TSDRectWithPoints();
        double v42 = v62;
        double v44 = v63;
        double v46 = v64;
        double v48 = v65;

        CGFloat v66 = 1.57079633;
      }
      else
      {
        CGRectGetMaxX(*(CGRect *)&v57);
        v67 = [(ICGalleryAttachmentViewCell *)self fadeMaskLayer];
        [v67 frame];
        TSDRectGetMaxPoint();
        TSDRectWithPoints();
        double x = v68;
        double y = v69;
        double width = v70;
        double height = v71;

        v88.origin.double x = x;
        v88.origin.double y = y;
        v88.size.double width = width;
        v88.size.double height = height;
        CGRectGetMinX(v88);
        v72 = [(ICGalleryAttachmentViewCell *)self fadeMaskLayer];
        [v72 frame];
        CGRectGetMaxY(v89);
        TSDRectWithPoints();
        double v42 = v73;
        double v44 = v74;
        double v46 = v75;
        double v48 = v76;

        CGFloat v66 = -1.57079633;
      }
      CGAffineTransformMakeRotation(&v85, v66);
    }
    CGAffineTransform v84 = v85;
    v77 = [(ICGalleryAttachmentViewCell *)self fadeImageLayer];
    CGAffineTransform v83 = v84;
    [v77 setAffineTransform:&v83];

    v78 = [(ICGalleryAttachmentViewCell *)self fadeWhiteLayer];
    objc_msgSend(v78, "setFrame:", v42, v44, v46, v48);

    v79 = [(ICGalleryAttachmentViewCell *)self fadeImageLayer];
    objc_msgSend(v79, "setFrame:", x, y, width, height);

    v80 = [(ICGalleryAttachmentViewCell *)self fadeMaskLayer];
    v81 = [(ICGalleryAttachmentViewCell *)self layer];
    [v81 setMask:v80];
  }
  else
  {
    id v82 = [(ICGalleryAttachmentViewCell *)self layer];
    [v82 setMask:0];
  }
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (ICGalleryAttachmentViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICGalleryAttachmentViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (CALayer)fadeMaskLayer
{
  return self->_fadeMaskLayer;
}

- (void)setFadeMaskLayer:(id)a3
{
}

- (CALayer)fadeImageLayer
{
  return self->_fadeImageLayer;
}

- (void)setFadeImageLayer:(id)a3
{
}

- (CALayer)fadeWhiteLayer
{
  return self->_fadeWhiteLayer;
}

- (void)setFadeWhiteLayer:(id)a3
{
}

- (BOOL)shouldFade
{
  return self->_shouldFade;
}

- (void)setShouldFade:(BOOL)a3
{
  self->_shouldFade = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeWhiteLayer, 0);
  objc_storeStrong((id *)&self->_fadeImageLayer, 0);
  objc_storeStrong((id *)&self->_fadeMaskLayer, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end