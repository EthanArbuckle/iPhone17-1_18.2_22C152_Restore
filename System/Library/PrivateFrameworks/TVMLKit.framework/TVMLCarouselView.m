@interface TVMLCarouselView
- (void)layoutSubviews;
@end

@implementation TVMLCarouselView

- (void)layoutSubviews
{
  [(TVMLCarouselView *)self bounds];
  double v4 = v3;
  double v53 = v5;
  v6 = [(TVMLCarouselView *)self headerView];
  [(UIView *)self tv_padding];
  double v50 = v7;
  double v9 = v8;
  [(UIView *)self tv_padding];
  double v11 = v10;
  double v13 = v12;
  objc_msgSend(v6, "tv_margin");
  double v51 = v17;
  double v52 = v16;
  double v18 = v14;
  double v19 = v15;
  if (v4 - (v14 + v15) - (v11 + v13) >= 2.22044605e-16) {
    double v20 = v4 - (v14 + v15) - (v11 + v13);
  }
  else {
    double v20 = v4;
  }
  uint64_t v21 = [(TVMLCarouselView *)self effectiveUserInterfaceLayoutDirection];
  objc_msgSend(v6, "tv_sizeThatFits:", v20, 0.0);
  double v23 = v22;
  CGFloat v25 = v24;
  double v26 = v4 - (v9 + v19 + v22);
  if (v21 == 1) {
    double v27 = v26;
  }
  else {
    double v27 = v11 + v18;
  }
  if (v22 < v20)
  {
    uint64_t v28 = objc_msgSend(v6, "tv_alignment");
    double v29 = floor((v4 - v23) * 0.5);
    if (v28 != 2) {
      double v29 = v27;
    }
    if (v28 == 3) {
      double v27 = v26;
    }
    else {
      double v27 = v29;
    }
  }
  v55.origin.double y = v50 + v52;
  v55.origin.double x = v27;
  v55.size.double width = v23;
  v55.size.double height = v25;
  CGRect v56 = CGRectIntegral(v55);
  double x = v56.origin.x;
  double y = v56.origin.y;
  double width = v56.size.width;
  double height = v56.size.height;
  v34 = [v6 layer];
  [v34 anchorPoint];
  double v36 = v35;
  double v38 = v37;

  objc_msgSend(v6, "setBounds:", 0.0, 0.0, width, height);
  objc_msgSend(v6, "setCenter:", round(x + width * v36), round(y + height * v38));
  double v39 = v51 + v52 + height;
  [(TVMLCarouselView *)self showcaseFactor];
  double v41 = ceil(v39 * v40);
  [(TVMLCarouselView *)self showcaseFactor];
  double v43 = floor(v39 * (1.0 - v42));
  v44 = [(TVMLCarouselView *)self _collectionView];
  objc_msgSend(v44, "setFrame:", 0.0, v41, v4, v53);

  double v45 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v46 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v47 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  double v48 = v43 + *MEMORY[0x263F1D1C0];
  v49 = [(TVMLCarouselView *)self _collectionView];
  objc_msgSend(v49, "setContentInset:", v48, v45, v46, v47);

  v54.receiver = self;
  v54.super_class = (Class)TVMLCarouselView;
  [(TVMLCarouselView *)&v54 layoutSubviews];
}

@end