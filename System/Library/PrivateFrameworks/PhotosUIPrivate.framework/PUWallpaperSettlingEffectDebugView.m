@interface PUWallpaperSettlingEffectDebugView
- (PISegmentationItem)segmentationItem;
- (PUWallpaperSettlingEffectDebugView)initWithSegmentationItem:(id)a3;
- (UIButton)button;
- (UILabel)label;
- (id)generateText;
- (id)onFileRadar;
- (void)fileRadarButtonTapped;
- (void)layoutSubviews;
- (void)setButton:(id)a3;
- (void)setLabel:(id)a3;
- (void)setOnFileRadar:(id)a3;
- (void)setSegmentationItem:(id)a3;
@end

@implementation PUWallpaperSettlingEffectDebugView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
  objc_storeStrong(&self->_onFileRadar, 0);
}

- (void)setButton:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)setLabel:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setSegmentationItem:(id)a3
{
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (void)setOnFileRadar:(id)a3
{
}

- (id)onFileRadar
{
  return self->_onFileRadar;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)PUWallpaperSettlingEffectDebugView;
  [(PUWallpaperSettlingEffectDebugView *)&v20 layoutSubviews];
  [(PUWallpaperSettlingEffectDebugView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = [(PUWallpaperSettlingEffectDebugView *)self label];
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  CGFloat v12 = CGRectGetWidth(v21) + -40.0;
  objc_msgSend(v11, "sizeThatFits:", v12, 0.0);
  objc_msgSend(v11, "setFrame:", 20.0, 20.0, v12, v13);
  v14 = [(PUWallpaperSettlingEffectDebugView *)self button];
  [v14 sizeToFit];
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  double Width = CGRectGetWidth(v22);
  [v14 frame];
  double v16 = (Width - CGRectGetWidth(v23)) * 0.5;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  double Height = CGRectGetHeight(v24);
  [v14 frame];
  double v18 = Height - CGRectGetHeight(v25) + -10.0;
  [v14 frame];
  double v19 = CGRectGetWidth(v26);
  [v14 frame];
  objc_msgSend(v14, "setFrame:", v16, v18, v19, CGRectGetHeight(v27));
}

- (void)fileRadarButtonTapped
{
  double v3 = [(PUWallpaperSettlingEffectDebugView *)self onFileRadar];

  if (v3)
  {
    CGFloat v4 = [(PUWallpaperSettlingEffectDebugView *)self onFileRadar];
    v4[2]();
  }
}

- (id)generateText
{
  v46[3] = *MEMORY[0x1E4F143B8];
  v2 = [(PUWallpaperSettlingEffectDebugView *)self segmentationItem];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v4 setAlignment:1];
  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  v45[0] = *MEMORY[0x1E4FB0700];
  CGFloat v6 = [MEMORY[0x1E4FB1618] lightGrayColor];
  uint64_t v7 = *MEMORY[0x1E4FB0738];
  v46[0] = v6;
  v46[1] = v4;
  v31 = v4;
  uint64_t v33 = *MEMORY[0x1E4FB06F8];
  uint64_t v8 = *MEMORY[0x1E4FB06F8];
  uint64_t v34 = v7;
  v45[1] = v7;
  v45[2] = v8;
  double v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0 weight:*MEMORY[0x1E4FB09C8]];
  v46[2] = v9;
  CGFloat v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
  uint64_t v11 = [v5 initWithString:@"TAP TO DISMISS\n\n" attributes:v10];

  id v35 = v3;
  v30 = (void *)v11;
  [v3 appendAttributedString:v11];
  id v12 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v12 setLineBreakMode:0];
  if ([v2 settlingEffectFailedAnyGating])
  {
    v43[0] = v33;
    double v13 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0 weight:*MEMORY[0x1E4FB09B8]];
    v43[1] = v34;
    v44[0] = v13;
    v44[1] = v12;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];

    LODWORD(v13) = [v2 isSettlingEffectAvailable];
    id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (v13) {
      double v16 = @"In production, this asset would have failed settling effect generation. Please File a Radar if you think this is a good settling effect result.\n\n";
    }
    else {
      double v16 = @"This asset failed settling effect generation. Please File a Radar if you think the settling effect should be available.\n\n";
    }
    v17 = (void *)[v15 initWithString:v16 attributes:v14];
    [v3 appendAttributedString:v17];
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [v2 settlingEffectGatingDiagnostics];
  uint64_t v18 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v37;
    double v21 = *MEMORY[0x1E4FB09D8];
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        id v24 = objc_alloc(MEMORY[0x1E4F28E48]);
        CGRect v25 = [NSString stringWithFormat:@"%@\n", v23];
        v40[0] = v33;
        CGRect v26 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0 weight:v21];
        v40[1] = v34;
        v41[0] = v26;
        v41[1] = v12;
        CGRect v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
        v28 = (void *)[v24 initWithString:v25 attributes:v27];

        [v35 appendAttributedString:v28];
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v19);
  }

  return v35;
}

- (PUWallpaperSettlingEffectDebugView)initWithSegmentationItem:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PUWallpaperSettlingEffectDebugView;
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  CGFloat v10 = -[PUWallpaperSettlingEffectDebugView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_segmentationItem, a3);
    id v12 = [MEMORY[0x1E4FB1618] whiteColor];
    [(PUWallpaperSettlingEffectDebugView *)v11 setBackgroundColor:v12];

    [(PUWallpaperSettlingEffectDebugView *)v11 setAlpha:0.9];
    double v13 = [(PUWallpaperSettlingEffectDebugView *)v11 layer];
    [v13 setCornerRadius:15.0];

    v14 = [(PUWallpaperSettlingEffectDebugView *)v11 layer];
    [v14 setMasksToBounds:1];

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
    label = v11->_label;
    v11->_label = (UILabel *)v15;

    v17 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
    [(UILabel *)v11->_label setFont:v17];

    uint64_t v18 = [MEMORY[0x1E4FB1618] blackColor];
    [(UILabel *)v11->_label setTextColor:v18];

    [(UILabel *)v11->_label setNumberOfLines:0];
    uint64_t v19 = [(PUWallpaperSettlingEffectDebugView *)v11 generateText];
    [(UILabel *)v11->_label setAttributedText:v19];

    [(PUWallpaperSettlingEffectDebugView *)v11 addSubview:v11->_label];
    uint64_t v20 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    button = v11->_button;
    v11->_button = (UIButton *)v20;

    [(UIButton *)v11->_button setTitle:@"File Radar" forState:0];
    [(UIButton *)v11->_button addTarget:v11 action:sel_fileRadarButtonTapped forControlEvents:64];
    CGRect v22 = [(UIButton *)v11->_button titleLabel];
    uint64_t v23 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0];
    [v22 setFont:v23];

    [(PUWallpaperSettlingEffectDebugView *)v11 addSubview:v11->_button];
    id v24 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v11 action:sel_viewTapped];
    [(PUWallpaperSettlingEffectDebugView *)v11 addGestureRecognizer:v24];
  }
  return v11;
}

@end