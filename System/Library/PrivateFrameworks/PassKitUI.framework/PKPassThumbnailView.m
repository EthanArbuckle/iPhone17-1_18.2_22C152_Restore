@interface PKPassThumbnailView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPassThumbnailView)init;
- (PKPassThumbnailView)initWithCoder:(id)a3;
- (PKPassThumbnailView)initWithFrame:(CGRect)a3;
- (id)initWithPass:(uint64_t)a3 suppressedContent:(void *)a4 rendererState:(int)a5 options:;
- (uint64_t)_layoutWithBounds:(uint64_t)a3@<X8> commit:(double)a4@<D0>;
- (uint64_t)setModallyPresented:(uint64_t)result;
- (void)_updatePassViewWithRendererState:(uint64_t)a1;
- (void)_updateRasterizationScale;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setBrighten:(uint64_t)a1;
- (void)setPass:(uint64_t)a1;
- (void)setShadowVisibility:(uint64_t)a1;
@end

@implementation PKPassThumbnailView

- (PKPassThumbnailView)init
{
  return 0;
}

- (PKPassThumbnailView)initWithCoder:(id)a3
{
  return 0;
}

- (PKPassThumbnailView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (id)initWithPass:(uint64_t)a3 suppressedContent:(void *)a4 rendererState:(int)a5 options:
{
  id v10 = a2;
  id v11 = a4;
  if (a1 && v10)
  {
    v23.receiver = a1;
    v23.super_class = (Class)PKPassThumbnailView;
    v12 = (id *)objc_msgSendSuper2(&v23, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v13 = (uint64_t)v12;
    if (v12)
    {
      objc_storeStrong(v12 + 58, a2);
      *(_DWORD *)(v13 + 408) = a5;
      *(void *)(v13 + 472) = a3;
      *(unsigned char *)(v13 + 457) = 1;
      *(void *)(v13 + 488) = 0x3FF0000000000000;
      *(unsigned char *)(v13 + 458) = 0;
      id v14 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      v15 = *(void **)(v13 + 416);
      *(void *)(v13 + 416) = v14;

      [(id)v13 addSubview:*(void *)(v13 + 416)];
      id v16 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      v17 = *(void **)(v13 + 424);
      *(void *)(v13 + 424) = v16;

      [*(id *)(v13 + 416) addSubview:*(void *)(v13 + 424)];
      v18 = [*(id *)(v13 + 424) layer];
      id v19 = [MEMORY[0x1E4FB1618] blackColor];
      objc_msgSend(v18, "setShadowColor:", objc_msgSend(v19, "CGColor"));

      double v20 = *(double *)(v13 + 488) * 0.25;
      *(float *)&double v20 = v20;
      [v18 setShadowOpacity:v20];
      objc_msgSend(v18, "setShadowOffset:", 0.0, 12.0);
      [v18 setShadowRadius:18.0];
      -[PKPassThumbnailView _updateRasterizationScale]((id *)v13);
      -[PKPassThumbnailView _updatePassViewWithRendererState:](v13, v11);
    }
    a1 = (id)v13;
    id v21 = a1;
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (void)_updateRasterizationScale
{
  if (a1)
  {
    v2 = [a1 window];
    v3 = [v2 windowScene];
    id v8 = [v3 screen];

    if (v8) {
      [v8 scale];
    }
    else {
      double v4 = PKUIScreenScale();
    }
    double v5 = v4;
    v6 = [a1[53] layer];
    [v6 rasterizationScale];
    if (v7 != v5) {
      [v6 setRasterizationScale:v5];
    }
  }
}

- (void)_updatePassViewWithRendererState:(uint64_t)a1
{
  id v17 = a2;
  if (a1)
  {
    v3 = *(void **)(a1 + 432);
    if (v3)
    {
      [v3 removeFromSuperview];
      double v4 = *(void **)(a1 + 432);
      *(void *)(a1 + 432) = 0;
    }
    int v5 = *(_DWORD *)(a1 + 408);
    v6 = [PKPassView alloc];
    int v7 = v5 & 3;
    uint64_t v8 = *(void *)(a1 + 464);
    if (v7) {
      uint64_t v9 = 5;
    }
    else {
      uint64_t v9 = 4;
    }
    uint64_t v10 = *(void *)(a1 + 472);
    uint64_t v11 = v10 | 0x5F7;
    if ((*(unsigned char *)(a1 + 408) & 3) != 0)
    {
      if ((v10 & 0x200) == 0)
      {
LABEL_12:
        uint64_t v12 = [(PKPassView *)v6 initWithPass:v8 content:v9 suppressedContent:v11 rendererState:v17];
        uint64_t v13 = *(void **)(a1 + 432);
        *(void *)(a1 + 432) = v12;

        [*(id *)(a1 + 432) setUserInteractionEnabled:0];
        [*(id *)(a1 + 432) setModallyPresented:*(unsigned __int8 *)(a1 + 458)];
        [*(id *)(a1 + 432) setPaused:v7 == 0];
        [*(id *)(a1 + 432) sizeToFit];
        id v14 = [*(id *)(a1 + 432) layer];
        [v14 setMinificationFilter:*MEMORY[0x1E4F3A340]];
        v15 = *(void **)(a1 + 424);
        uint64_t v16 = *(void *)(a1 + 432);
        if (*(void *)(a1 + 440)) {
          objc_msgSend(v15, "insertSubview:belowSubview:", v16);
        }
        else {
          [v15 addSubview:v16];
        }
        [(id)a1 setNeedsLayout];

        goto LABEL_16;
      }
      __break(1u);
    }
    if (PKIsLowEndDevice()) {
      uint64_t v11 = v10 | 0x7F7;
    }
    goto LABEL_12;
  }
LABEL_16:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassThumbnailView;
  [(PKPassThumbnailView *)&v3 didMoveToWindow];
  -[PKPassThumbnailView _updateRasterizationScale]((id *)&self->super.super.super.isa);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPassThumbnailView _layoutWithBounds:commit:]((uint64_t)self, 0, (uint64_t)v5, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  double v3 = *(double *)v5;
  double v4 = *(double *)&v5[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (uint64_t)_layoutWithBounds:(uint64_t)a3@<X8> commit:(double)a4@<D0>
{
  if (result)
  {
    uint64_t v12 = result;
    [*(id *)(result + 432) sizeOfFront];
    double v14 = v13;
    double v16 = v15;
    uint64_t v17 = [*(id *)(v12 + 464) style];
    double v21 = v16;
    if (v17 != 6)
    {
      double v21 = v14 * 0.704081633;
      if (v17 == 7)
      {
        double v60 = a5;
        double v62 = a6;
        [*(id *)(v12 + 464) thumbnailRect];
        CGFloat x = v67.origin.x;
        CGFloat y = v67.origin.y;
        CGFloat width = v67.size.width;
        CGFloat height = v67.size.height;
        if (!CGRectIsEmpty(v67))
        {
          v68.origin.CGFloat x = x;
          v68.origin.CGFloat y = y;
          v68.size.CGFloat width = width;
          v68.size.CGFloat height = height;
          double v21 = fmax(CGRectGetMaxY(v68) + 1.0, v21);
        }
        a5 = v60;
        a6 = v62;
      }
    }
    double v26 = fmin(a6 / v14, a7 / v21);
    v18.n128_f64[0] = v14 * v26;
    v19.n128_f64[0] = v16 * v26;
    CGSize result = PKSizeRoundToPixel(v18, v19, v20);
    double v28 = v27;
    double v30 = v29;
    double v31 = v29;
    if (v16 != v21) {
      CGSize result = PKFloatRoundToPixel();
    }
    if (v30 <= a7) {
      double v32 = v30;
    }
    else {
      double v32 = a7;
    }
    if (v31 < a7 && *(unsigned char *)(v12 + 457) == 0) {
      double v34 = v32;
    }
    else {
      double v34 = v31;
    }
    BOOL v35 = v30 != v34;
    if (a2)
    {
      int v36 = v26 < 1.0;
      if (*(unsigned __int8 *)(v12 + 412) != v36)
      {
        *(unsigned char *)(v12 + 412) = v36;
        v37 = [*(id *)(v12 + 424) layer];
        [v37 setShouldRasterize:*(unsigned __int8 *)(v12 + 412)];
      }
      objc_msgSend(*(id *)(v12 + 416), "setFrame:", a4 + -44.0, a5 + -44.0, a6 + 44.0 + 44.0, a7 + 44.0);
      [*(id *)(v12 + 416) setClipsToBounds:v35];
      [*(id *)(v12 + 448) setAlpha:(double)v35];
      PKSizeAlignedInRect();
      CGFloat v39 = v38;
      CGFloat v41 = v40;
      CGFloat v43 = v42;
      CGFloat v45 = v44;
      v46 = *(void **)(v12 + 448);
      double v61 = v34;
      double v63 = v28;
      if (v46)
      {
        objc_msgSend(v46, "pkui_alignmentRect");
        PKSizeAlignedInRect();
        objc_msgSend(*(id *)(v12 + 448), "pkui_setAlignmentRect:", v47 + 44.0, v48 + 44.0);
      }
      v69.origin.CGFloat x = v39;
      v69.origin.CGFloat y = v41;
      v69.size.CGFloat width = v43;
      v69.size.CGFloat height = v45;
      CGRect v70 = CGRectOffset(v69, 44.0, 44.0);
      double v65 = v70.size.width;
      double v49 = v70.size.height;
      objc_msgSend(*(id *)(v12 + 424), "setFrame:", v70.origin.x, v70.origin.y);
      v50 = [*(id *)(v12 + 432) layer];
      [v50 anchorPoint];
      double v52 = v51;
      double v54 = v53;

      double v56 = *MEMORY[0x1E4F1DAD8];
      double v55 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v57 = *MEMORY[0x1E4F1DAD8] + v52 * v63;
      v58 = *(void **)(v12 + 432);
      CATransform3DMakeScale(&v66, v26, v26, 1.0);
      [v58 setTransform3D:&v66];
      objc_msgSend(*(id *)(v12 + 432), "setCenter:", v57, v55 + v54 * v30);
      double v59 = v55;
      double v28 = v63;
      CGSize result = objc_msgSend(*(id *)(v12 + 440), "setFrame:", v56, v59, v65, v49);
      double v34 = v61;
    }
    *(double *)a3 = v28;
    *(double *)(a3 + 8) = v34;
    *(unsigned char *)(a3 + 16) = v35;
  }
  else
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
  }
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PKPassThumbnailView;
  [(PKPassThumbnailView *)&v8 layoutSubviews];
  [(PKPassThumbnailView *)self bounds];
  -[PKPassThumbnailView _layoutWithBounds:commit:]((uint64_t)self, 1, (uint64_t)v7, v3, v4, v5, v6);
}

- (void)setPass:(uint64_t)a1
{
  id v4 = a2;
  if (a1 && *(id *)(a1 + 464) != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(a1 + 464), a2);
    -[PKPassThumbnailView _updatePassViewWithRendererState:](a1, 0);
    id v4 = v5;
  }
}

- (void)setBrighten:(uint64_t)a1
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a1 && *(unsigned __int8 *)(a1 + 456) != a2)
  {
    *(unsigned char *)(a1 + 456) = a2;
    if (*(unsigned char *)(a1 + 456))
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      id v4 = *(void **)(a1 + 440);
      *(void *)(a1 + 440) = v3;

      id v5 = *(void **)(a1 + 440);
      double v6 = [MEMORY[0x1E4FB1618] colorWithDisplayP3Red:0.921569 green:0.2 blue:0.145098 alpha:1.0];
      [v5 setBackgroundColor:v6];

      int v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A350]];
      v12[2] = xmmword_1A0444488;
      v12[3] = unk_1A0444498;
      v12[4] = xmmword_1A04444A8;
      v12[0] = xmmword_1A0444468;
      v12[1] = unk_1A0444478;
      objc_super v8 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v12];
      [v7 setValue:v8 forKey:@"inputColorMatrix"];

      uint64_t v9 = [*(id *)(a1 + 440) layer];
      v13[0] = v7;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      [v9 setFilters:v10];

      [*(id *)(a1 + 424) addSubview:*(void *)(a1 + 440)];
      [(id)a1 setNeedsLayout];
    }
    else
    {
      [*(id *)(a1 + 440) removeFromSuperview];
      uint64_t v11 = *(void **)(a1 + 440);
      *(void *)(a1 + 440) = 0;
    }
  }
}

- (void)setShadowVisibility:(uint64_t)a1
{
  if (a1)
  {
    double v3 = fmax(fmin(a2, 1.0), 0.0);
    if (*(double *)(a1 + 488) != v3)
    {
      *(double *)(a1 + 488) = v3;
      id v5 = [*(id *)(a1 + 424) layer];
      double v4 = *(double *)(a1 + 488) * 0.25;
      *(float *)&double v4 = v4;
      [v5 setShadowOpacity:v4];
    }
  }
}

- (uint64_t)setModallyPresented:(uint64_t)result
{
  if (result && *(unsigned __int8 *)(result + 458) != a2)
  {
    *(unsigned char *)(result + 458) = a2;
    if (*(void *)(result + 432)) {
      return [*(id *)(result + 432) setModallyPresented:*(unsigned __int8 *)(result + 458)];
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundPocketOverlayImage, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_pocketOverlay, 0);
  objc_storeStrong((id *)&self->_effectOverlayView, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_passContainerView, 0);

  objc_storeStrong((id *)&self->_maskView, 0);
}

@end