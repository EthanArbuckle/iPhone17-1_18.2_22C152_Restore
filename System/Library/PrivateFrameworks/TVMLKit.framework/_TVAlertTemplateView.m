@interface _TVAlertTemplateView
- (NSArray)viewsAbove;
- (NSArray)viewsBelow;
- (UICollectionView)collectionView;
- (UIEdgeInsets)padding;
- (void)layoutSubviews;
- (void)setBgImage:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setViewsAbove:(id)a3;
- (void)setViewsBelow:(id)a3;
@end

@implementation _TVAlertTemplateView

- (void)setBgImage:(id)a3
{
  v4 = (UIImage *)a3;
  if (self->_bgImage != v4)
  {
    bgImageView = self->_bgImageView;
    if (v4)
    {
      if (bgImageView)
      {
LABEL_8:
        [(UIImageView *)bgImageView setImage:v4];
        goto LABEL_9;
      }
    }
    else if (bgImageView)
    {
      [(UIImageView *)bgImageView removeFromSuperview];
      v6 = self->_bgImageView;
      self->_bgImageView = 0;

      goto LABEL_9;
    }
    id v7 = objc_alloc(MEMORY[0x263F1C6D0]);
    [(_TVAlertTemplateView *)self bounds];
    v8 = (UIImageView *)objc_msgSend(v7, "initWithFrame:");
    [(_TVAlertTemplateView *)self addSubview:v8];
    [(_TVAlertTemplateView *)self sendSubviewToBack:v8];
    v9 = self->_bgImageView;
    self->_bgImageView = v8;

    bgImageView = self->_bgImageView;
    goto LABEL_8;
  }
LABEL_9:
  bgImage = self->_bgImage;
  self->_bgImage = v4;
}

- (void)setViewsAbove:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(NSArray *)self->_viewsAbove makeObjectsPerformSelector:sel_removeFromSuperview];
  objc_storeStrong((id *)&self->_viewsAbove, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_viewsAbove;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[_TVAlertTemplateView addSubview:](self, "addSubview:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)setViewsBelow:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(NSArray *)self->_viewsBelow makeObjectsPerformSelector:sel_removeFromSuperview];
  objc_storeStrong((id *)&self->_viewsBelow, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_viewsBelow;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[_TVAlertTemplateView addSubview:](self, "addSubview:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)setCollectionView:(id)a3
{
  id v5 = (UICollectionView *)a3;
  collectionView = self->_collectionView;
  uint64_t v7 = v5;
  if (collectionView != v5)
  {
    [(UICollectionView *)collectionView removeFromSuperview];
    objc_storeStrong((id *)&self->_collectionView, a3);
    if (self->_collectionView) {
      -[_TVAlertTemplateView addSubview:](self, "addSubview:");
    }
  }
}

- (void)layoutSubviews
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  [(_TVAlertTemplateView *)self bounds];
  double top = self->_padding.top;
  double bottom = self->_padding.bottom;
  CGFloat v57 = v4;
  CGFloat v59 = v6;
  CGFloat v60 = v5;
  CGFloat v58 = v7;
  -[UIImageView setFrame:](self->_bgImageView, "setFrame:");
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v8 = self->_viewsAbove;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v73;
    double v11 = 0.0;
    double v12 = 0.0;
    do
    {
      uint64_t v13 = 0;
      double v14 = v11;
      do
      {
        if (*(void *)v73 != v10) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v72 + 1) + 8 * v13);
        objc_msgSend(v15, "tv_margin");
        double v17 = v16;
        double v11 = v18;
        objc_msgSend(v15, "tv_maxWidth");
        objc_msgSend(v15, "tv_sizeThatFits:");
        double v20 = fmax(v17, v14);
        if (v12 == 0.0) {
          double v20 = 0.0;
        }
        double v12 = v19 + v12 + v20;
        ++v13;
        double v14 = v11;
      }
      while (v9 != v13);
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v72 objects:v77 count:16];
    }
    while (v9);
  }
  else
  {
    double v12 = 0.0;
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v21 = self->_viewsBelow;
  uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v69;
    double v24 = 0.0;
    double v25 = 0.0;
    do
    {
      uint64_t v26 = 0;
      double v27 = v24;
      do
      {
        if (*(void *)v69 != v23) {
          objc_enumerationMutation(v21);
        }
        v28 = *(void **)(*((void *)&v68 + 1) + 8 * v26);
        objc_msgSend(v28, "tv_margin");
        double v24 = v29;
        double v31 = v30;
        objc_msgSend(v28, "tv_maxWidth");
        objc_msgSend(v28, "tv_sizeThatFits:");
        double v33 = fmax(v31, v27);
        if (v25 == 0.0) {
          double v33 = 0.0;
        }
        double v25 = v32 + v25 + v33;
        ++v26;
        double v27 = v24;
      }
      while (v22 != v26);
      uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v68 objects:v76 count:16];
    }
    while (v22);
  }
  else
  {
    double v25 = 0.0;
  }

  v34 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  [v34 itemSize];
  uint64_t v54 = v35;
  double v37 = v36;

  uint64_t v38 = [(UICollectionView *)self->_collectionView numberOfItemsInSection:0];
  v39 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  [v39 minimumLineSpacing];
  double v41 = v40;
  NSInteger v42 = [(UICollectionView *)self->_collectionView numberOfItemsInSection:0];

  if (v12 == 0.0) {
    double v43 = 0.0;
  }
  else {
    double v43 = 50.0;
  }
  uint64_t v64 = 0;
  v65 = (double *)&v64;
  if (v25 == 0.0) {
    double v44 = 0.0;
  }
  else {
    double v44 = 50.0;
  }
  uint64_t v66 = 0x2020000000;
  uint64_t v67 = 0;
  v79.origin.y = v59;
  v79.origin.x = v60;
  v79.size.height = v57;
  v79.size.width = v58;
  double Height = CGRectGetHeight(v79);
  double v46 = v37 * (double)v38 + v41 * (double)(v42 - 1);
  double v47 = bottom;
  if (v25 == 0.0) {
    double v47 = 0.0;
  }
  if (v47 + v25 + v44 + top + v12 + v43 + v46 <= Height)
  {
    -[UICollectionView _setGradientMaskInsets:](self->_collectionView, "_setGradientMaskInsets:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
    [(UICollectionView *)self->_collectionView setClipsToBounds:0];
    -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v43, 90.0, v44, 90.0);
    [(_TVAlertTemplateView *)self bounds];
    double v51 = v44 + v43 + v46;
    float v52 = (CGRectGetHeight(v81) - (v25 + v12 + v51)) * 0.5;
    v65[3] = floorf(v52);
  }
  else
  {
    v65[3] = top;
    [(UICollectionView *)self->_collectionView setClipsToBounds:1];
    if (v25 == 0.0) {
      double v48 = 90.0;
    }
    else {
      double v48 = 50.0;
    }
    -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 50.0, 90.0, v48, 90.0, v54);
    -[UICollectionView _setGradientMaskInsets:](self->_collectionView, "_setGradientMaskInsets:", 90.0, 0.0, 90.0, 0.0);
    v80.origin.y = v59;
    v80.origin.x = v60;
    v80.size.height = v57;
    v80.size.width = v58;
    double v49 = CGRectGetHeight(v80) - top - v12;
    double v50 = bottom + v25;
    if (v25 == 0.0) {
      double v50 = 0.0;
    }
    double v51 = v49 - v50;
  }
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = __Block_byref_object_copy__1;
  v62[4] = __Block_byref_object_dispose__1;
  id v63 = 0;
  id v53 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(NSArray *)self->_viewsAbove count]) {
    [v53 addObjectsFromArray:self->_viewsAbove];
  }
  objc_msgSend(v53, "addObject:", self->_collectionView, v54);
  if ([(NSArray *)self->_viewsBelow count]) {
    [v53 addObjectsFromArray:self->_viewsBelow];
  }
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __38___TVAlertTemplateView_layoutSubviews__block_invoke;
  v61[3] = &unk_264BA7228;
  v61[5] = v62;
  v61[6] = &v64;
  v61[4] = self;
  v61[7] = v55;
  *(double *)&v61[8] = v37;
  *(double *)&v61[9] = v51;
  *(CGFloat *)&v61[10] = v60;
  *(CGFloat *)&v61[11] = v59;
  *(CGFloat *)&v61[12] = v58;
  *(CGFloat *)&v61[13] = v57;
  [v53 enumerateObjectsUsingBlock:v61];

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(&v64, 8);
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (NSArray)viewsAbove
{
  return self->_viewsAbove;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (NSArray)viewsBelow
{
  return self->_viewsBelow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsBelow, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_viewsAbove, 0);
  objc_storeStrong((id *)&self->_bgImageView, 0);
  objc_storeStrong((id *)&self->_bgImage, 0);
}

@end