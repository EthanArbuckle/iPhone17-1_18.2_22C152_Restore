@interface UIPrintQualityView
- (UILabel)bestLabel;
- (UILabel)draftLabel;
- (UILabel)normalLabel;
- (UIPrintInfo)printInfo;
- (UIPrintQualityView)initWithFrame:(CGRect)a3 printInfo:(id)a4;
- (UIPrintSegmentedSlider)qualitySlider;
- (void)changeQuality:(id)a3;
- (void)dealloc;
- (void)loadViews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBestLabel:(id)a3;
- (void)setDraftLabel:(id)a3;
- (void)setNormalLabel:(id)a3;
- (void)setPrintInfo:(id)a3;
- (void)setQualitySlider:(id)a3;
- (void)updateFromPrintInfo;
@end

@implementation UIPrintQualityView

- (UIPrintQualityView)initWithFrame:(CGRect)a3 printInfo:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIPrintQualityView;
  v10 = -[UIPrintQualityView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(UIPrintQualityView *)v10 setPrintInfo:v9];
    [(UIPrintQualityView *)v11 loadViews];
    v12 = [(UIPrintQualityView *)v11 printInfo];
    [v12 addObserver:v11 forKeyPath:0x1F3C9DFD8 options:0 context:0];
  }
  return v11;
}

- (void)dealloc
{
  v3 = [(UIPrintQualityView *)self printInfo];
  [v3 removeObserver:self forKeyPath:0x1F3C9DFD8];

  v4.receiver = self;
  v4.super_class = (Class)UIPrintQualityView;
  [(UIPrintQualityView *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__UIPrintQualityView_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6DA1408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __69__UIPrintQualityView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFromPrintInfo];
}

- (void)loadViews
{
  v73[7] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(UIPrintSegmentedSlider);
  [(UIPrintQualityView *)self setQualitySlider:v3];

  objc_super v4 = [(UIPrintQualityView *)self qualitySlider];
  LODWORD(v5) = 3.0;
  [v4 setMinimumValue:v5];

  v6 = [(UIPrintQualityView *)self qualitySlider];
  LODWORD(v7) = 5.0;
  [v6 setMaximumValue:v7];

  v8 = [(UIPrintQualityView *)self qualitySlider];
  [v8 setSegmented:1];

  id v9 = [(UIPrintQualityView *)self qualitySlider];
  [v9 setSnapsToSegment:1];

  v10 = [(UIPrintQualityView *)self printInfo];
  float v11 = (float)[v10 quality];
  v12 = [(UIPrintQualityView *)self qualitySlider];
  *(float *)&double v13 = v11;
  [v12 setValue:v13];

  objc_super v14 = [(UIPrintQualityView *)self qualitySlider];
  [v14 addTarget:self action:sel_changeQuality_ forControlEvents:4096];

  v15 = [(UIPrintQualityView *)self qualitySlider];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(UIPrintQualityView *)self qualitySlider];
  [(UIPrintQualityView *)self addSubview:v16];

  id v17 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(UIPrintQualityView *)self setDraftLabel:v17];

  v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"Draft" value:@"Draft" table:@"Localizable"];
  v20 = [(UIPrintQualityView *)self draftLabel];
  [v20 setText:v19];

  v21 = [(UIPrintQualityView *)self draftLabel];
  [v21 sizeToFit];

  v22 = [(UIPrintQualityView *)self draftLabel];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  v23 = [(UIPrintQualityView *)self draftLabel];
  [(UIPrintQualityView *)self addSubview:v23];

  id v24 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(UIPrintQualityView *)self setNormalLabel:v24];

  v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v26 = [v25 localizedStringForKey:@"Normal" value:@"Normal" table:@"Localizable"];
  v27 = [(UIPrintQualityView *)self normalLabel];
  [v27 setText:v26];

  v28 = [(UIPrintQualityView *)self normalLabel];
  [v28 sizeToFit];

  v29 = [(UIPrintQualityView *)self normalLabel];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  v30 = [(UIPrintQualityView *)self normalLabel];
  [(UIPrintQualityView *)self addSubview:v30];

  id v31 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(UIPrintQualityView *)self setBestLabel:v31];

  v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v33 = [v32 localizedStringForKey:@"Best" value:@"Best" table:@"Localizable"];
  v34 = [(UIPrintQualityView *)self bestLabel];
  [v34 setText:v33];

  v35 = [(UIPrintQualityView *)self bestLabel];
  [v35 sizeToFit];

  v36 = [(UIPrintQualityView *)self bestLabel];
  [v36 setTranslatesAutoresizingMaskIntoConstraints:0];

  v37 = [(UIPrintQualityView *)self bestLabel];
  [(UIPrintQualityView *)self addSubview:v37];

  v38 = (void *)MEMORY[0x1E4F28DC8];
  v63 = (void *)MEMORY[0x1E4F28DC8];
  v70 = [(UIPrintQualityView *)self qualitySlider];
  v69 = [v38 constraintWithItem:v70 attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:20.0];
  v73[0] = v69;
  v39 = (void *)MEMORY[0x1E4F28DC8];
  v68 = [(UIPrintQualityView *)self qualitySlider];
  v67 = [v39 constraintWithItem:self attribute:6 relatedBy:0 toItem:v68 attribute:6 multiplier:1.0 constant:20.0];
  v73[1] = v67;
  v40 = (void *)MEMORY[0x1E4F28DC8];
  v66 = [(UIPrintQualityView *)self draftLabel];
  v65 = [(UIPrintQualityView *)self qualitySlider];
  v64 = [v40 constraintWithItem:v66 attribute:5 relatedBy:0 toItem:v65 attribute:5 multiplier:1.0 constant:0.0];
  v73[2] = v64;
  v41 = (void *)MEMORY[0x1E4F28DC8];
  v62 = [(UIPrintQualityView *)self normalLabel];
  v61 = [(UIPrintQualityView *)self qualitySlider];
  v60 = [v41 constraintWithItem:v62 attribute:9 relatedBy:0 toItem:v61 attribute:9 multiplier:1.0 constant:0.0];
  v73[3] = v60;
  v42 = (void *)MEMORY[0x1E4F28DC8];
  v59 = [(UIPrintQualityView *)self normalLabel];
  v43 = [(UIPrintQualityView *)self draftLabel];
  v44 = [v42 constraintWithItem:v59 attribute:12 relatedBy:0 toItem:v43 attribute:12 multiplier:1.0 constant:0.0];
  v73[4] = v44;
  v45 = (void *)MEMORY[0x1E4F28DC8];
  v46 = [(UIPrintQualityView *)self bestLabel];
  v47 = [(UIPrintQualityView *)self qualitySlider];
  v48 = [v45 constraintWithItem:v46 attribute:6 relatedBy:0 toItem:v47 attribute:6 multiplier:1.0 constant:0.0];
  v73[5] = v48;
  v49 = (void *)MEMORY[0x1E4F28DC8];
  v50 = [(UIPrintQualityView *)self bestLabel];
  v51 = [(UIPrintQualityView *)self draftLabel];
  v52 = [v49 constraintWithItem:v50 attribute:12 relatedBy:0 toItem:v51 attribute:12 multiplier:1.0 constant:0.0];
  v73[6] = v52;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:7];
  [v63 activateConstraints:v53];

  v54 = (void *)MEMORY[0x1E4F28DC8];
  v71[0] = @"qualitySlider";
  v55 = [(UIPrintQualityView *)self qualitySlider];
  v71[1] = @"draftLabel";
  v72[0] = v55;
  v56 = [(UIPrintQualityView *)self draftLabel];
  v72[1] = v56;
  v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];
  v58 = [v54 constraintsWithVisualFormat:@"V:|-[qualitySlider]-[draftLabel]-|" options:0 metrics:0 views:v57];
  [(UIPrintQualityView *)self addConstraints:v58];
}

- (void)changeQuality:(id)a3
{
  [a3 value];
  uint64_t v5 = (uint64_t)v4;
  id v6 = [(UIPrintQualityView *)self printInfo];
  [v6 setQuality:v5];
}

- (void)updateFromPrintInfo
{
  id v6 = [(UIPrintQualityView *)self printInfo];
  float v3 = (float)[v6 quality];
  float v4 = [(UIPrintQualityView *)self qualitySlider];
  *(float *)&double v5 = v3;
  [v4 setValue:v5];
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
}

- (UIPrintSegmentedSlider)qualitySlider
{
  return self->_qualitySlider;
}

- (void)setQualitySlider:(id)a3
{
}

- (UILabel)draftLabel
{
  return self->_draftLabel;
}

- (void)setDraftLabel:(id)a3
{
}

- (UILabel)normalLabel
{
  return self->_normalLabel;
}

- (void)setNormalLabel:(id)a3
{
}

- (UILabel)bestLabel
{
  return self->_bestLabel;
}

- (void)setBestLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestLabel, 0);
  objc_storeStrong((id *)&self->_normalLabel, 0);
  objc_storeStrong((id *)&self->_draftLabel, 0);
  objc_storeStrong((id *)&self->_qualitySlider, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
}

@end