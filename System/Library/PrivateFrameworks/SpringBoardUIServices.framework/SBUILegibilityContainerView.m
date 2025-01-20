@interface SBUILegibilityContainerView
+ (id)legibilityImageDisposalQueue;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)_updateFilters;
- (BOOL)_usesColorFilters;
- (BOOL)_usesSecondaryColor;
- (BOOL)updateOptions:(int64_t)a3;
- (SBUILegibilityEngine)legibilityEngine;
- (SBUILegibilitySettings)legibilitySettings;
- (UIImage)image;
- (UIImage)processedImage;
- (UIImage)strengthenedImage;
- (double)strength;
- (id)_contentColor;
- (id)_drawView;
- (id)buildDrawView;
- (int64_t)options;
- (void)_applyStrength;
- (void)_resetImages;
- (void)_setDrawImage:(id)a3;
- (void)applySettingsForLegibilityStyle:(int64_t)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 strengthenedImage:(id)a4 strength:(double)a5;
- (void)setLegibilityEngine:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setStrength:(double)a3;
- (void)sizeToFit;
@end

@implementation SBUILegibilityContainerView

BOOL __45__SBUILegibilityContainerView__updateFilters__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 name];
  if ([v4 isEqualToString:*MEMORY[0x1E4F3A2A8]])
  {
    v5 = *(CGColor **)(a1 + 32);
    v6 = [v3 valueForKey:@"inputColor"];
    BOOL v7 = CGColorEqualToColor(v5, v6);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)setImage:(id)a3
{
  id v7 = a3;
  if ((-[UIImage isEqual:](self->_image, "isEqual:") & 1) == 0)
  {
    [(SBUILegibilityContainerView *)self _resetImages];
    objc_storeStrong((id *)&self->_image, a3);
    processedImage = self->_processedImage;
    self->_processedImage = 0;

    strengthenedImage = self->_strengthenedImage;
    self->_strengthenedImage = 0;

    self->_strength = 0.0;
    self->_dirty = 1;
    [(SBUILegibilityContainerView *)self _applyStrength];
    [(SBUILegibilityContainerView *)self _updateFilters];
  }
}

- (void)_applyStrength
{
  if (!self->_dirty || !self->_image) {
    return;
  }
  id v3 = [(SBUILegibilityContainerView *)self legibilityEngine];
  double strength = self->_strength;
  id v10 = v3;
  if (!v3 && strength == 0.0)
  {
    image = self->_image;
LABEL_9:
    [(SBUILegibilityContainerView *)self _setDrawImage:image];
    v9 = v10;
    goto LABEL_10;
  }
  image = self->_image;
  if (strength <= 0.0) {
    goto LABEL_9;
  }
  objc_msgSend(v3, "applyStrength:toImage:settings:", image, self->_legibilitySettings);
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
  strengthenedImage = self->_strengthenedImage;
  self->_strengthenedImage = v6;
  v8 = v6;

  [(SBUILegibilityContainerView *)self _setDrawImage:v8];
  v9 = v10;
  self->_dirty = 0;
LABEL_10:
}

- (SBUILegibilityEngine)legibilityEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_legibilityEngine);
  return (SBUILegibilityEngine *)WeakRetained;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"filters.colorMatrix.inputColorMatrix"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBUILegibilityContainerView;
    BOOL v5 = [(SBUILegibilityContainerView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (UIImage)image
{
  return self->_image;
}

- (SBUILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((SBUILegibilitySettingsAreEqual(v5, self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    self->_dirty = 1;
    [(SBUILegibilityContainerView *)self _updateFilters];
    [(SBUILegibilityContainerView *)self _applyStrength];
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SBUILegibilityContainerView;
  [(SBUILegibilityContainerView *)&v12 layoutSubviews];
  [(SBUILegibilityContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SBUILegibilityContainerView *)self _drawView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (BOOL)_updateFilters
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (self->_legibilitySettings)
  {
    v2 = self;
    id v3 = [(SBUILegibilityContainerView *)self _contentColor];
    uint64_t v4 = [v3 CGColor];
    double v5 = [(SBUILegibilityContainerView *)v2 layer];
    LODWORD(v2) = [(SBUILegibilityContainerView *)v2 _usesColorFilters];
    double v6 = [v5 filters];
    double v7 = v6;
    if (v2)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __45__SBUILegibilityContainerView__updateFilters__block_invoke;
      v13[3] = &__block_descriptor_40_e18_B16__0__CAFilter_8l;
      v13[4] = v4;
      double v8 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v13);

      LOBYTE(v9) = v8 == 0;
      if (!v8)
      {
        uint64_t v10 = *MEMORY[0x1E4F3A2A8];
        double v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
        [v8 setName:v10];
        [v8 setValue:v4 forKey:@"inputColor"];
        v14[0] = v8;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
        [v5 setFilters:v11];
      }
    }
    else
    {
      BOOL v9 = [v6 count] != 0;

      [v5 setFilters:0];
    }
    [v5 setAllowsGroupBlending:0];
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (void)_setDrawImage:(id)a3
{
  BOOL v9 = (UIImage *)a3;
  if (![(SBUILegibilityContainerView *)self _usesColorFilters]
    && [(SBUILegibilityContainerView *)self _usesSecondaryColor])
  {
    uint64_t v4 = [(SBUILegibilityContainerView *)self _contentColor];
    double v5 = [(UIImage *)v9 imageWithTintColor:v4];
    processedImage = self->_processedImage;
    self->_processedImage = v5;

    double v7 = v5;
    BOOL v9 = v7;
  }
  double v8 = [(SBUILegibilityContainerView *)self _drawView];
  [v8 setImage:v9];
  [(SBUILegibilityContainerView *)self bounds];
  objc_msgSend(v8, "setFrame:");
}

- (BOOL)_usesColorFilters
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (id)_drawView
{
  drawView = self->_drawView;
  if (!drawView)
  {
    uint64_t v4 = [(SBUILegibilityContainerView *)self buildDrawView];
    double v5 = self->_drawView;
    self->_drawView = v4;

    [(SBUILegibilityContainerView *)self addSubview:self->_drawView];
    drawView = self->_drawView;
  }
  double v6 = drawView;
  return v6;
}

- (void)setLegibilityEngine:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_legibilityEngine);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_legibilityEngine, obj);
    self->_dirty = 1;
    [(SBUILegibilityContainerView *)self _applyStrength];
    double v5 = obj;
  }
}

- (void)setImage:(id)a3 strengthenedImage:(id)a4 strength:(double)a5
{
  id v11 = a3;
  id v9 = a4;
  if (![(UIImage *)self->_image isEqual:v11]
    || ![(UIImage *)self->_strengthenedImage isEqual:v9]
    || self->_strength != a5)
  {
    [(SBUILegibilityContainerView *)self _resetImages];
    objc_storeStrong((id *)&self->_image, a3);
    processedImage = self->_processedImage;
    self->_processedImage = 0;

    objc_storeStrong((id *)&self->_strengthenedImage, a4);
    self->_double strength = a5;
    [(SBUILegibilityContainerView *)self _setDrawImage:v9];
    [(SBUILegibilityContainerView *)self _updateFilters];
    self->_dirty = 0;
  }
}

- (void)_resetImages
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = self->_image;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = self->_strengthenedImage;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  objc_super v12 = __Block_byref_object_dispose_;
  v13 = self->_processedImage;
  image = self->_image;
  self->_image = 0;

  strengthenedImage = self->_strengthenedImage;
  self->_strengthenedImage = 0;

  processedImage = self->_processedImage;
  self->_processedImage = 0;

  if (v21[5] || v15[5] || v9[5])
  {
    double v6 = [(id)objc_opt_class() legibilityImageDisposalQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__SBUILegibilityContainerView__resetImages__block_invoke;
    block[3] = &unk_1E5CCCE80;
    block[4] = &v20;
    block[5] = &v14;
    block[6] = &v8;
    dispatch_async(v6, block);
  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
}

+ (id)legibilityImageDisposalQueue
{
  if (legibilityImageDisposalQueue_onceToken != -1) {
    dispatch_once(&legibilityImageDisposalQueue_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)legibilityImageDisposalQueue_disposalQueue;
  return v2;
}

- (id)_contentColor
{
  BOOL v3 = [(SBUILegibilityContainerView *)self _usesSecondaryColor];
  legibilitySettings = self->_legibilitySettings;
  if (v3) {
    [(SBUILegibilitySettings *)legibilitySettings secondaryColor];
  }
  else {
  double v5 = [(SBUILegibilitySettings *)legibilitySettings primaryColor];
  }
  return v5;
}

- (BOOL)_usesSecondaryColor
{
  return self->_options & 1;
}

- (BOOL)updateOptions:(int64_t)a3
{
  int64_t options = self->_options;
  if (options != a3)
  {
    self->_int64_t options = a3;
    [(SBUILegibilityContainerView *)self _updateFilters];
    self->_dirty = 1;
    [(SBUILegibilityContainerView *)self _applyStrength];
  }
  return options != a3;
}

- (double)strength
{
  return self->_strength;
}

void __43__SBUILegibilityContainerView__resetImages__block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 8);
  BOOL v3 = *(void **)(v2 + 40);
  uint64_t v4 = *(void **)(*(void *)(a1[5] + 8) + 40);
  double v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
  *(void *)(v2 + 40) = 0;
  id v12 = v5;
  id v6 = v4;
  id v7 = v3;

  uint64_t v8 = *(void *)(a1[5] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;

  uint64_t v10 = *(void *)(a1[6] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

void __59__SBUILegibilityContainerView_legibilityImageDisposalQueue__block_invoke()
{
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = BSDispatchQueueCreateWithQualityOfService();
  v1 = (void *)legibilityImageDisposalQueue_disposalQueue;
  legibilityImageDisposalQueue_disposalQueue = v0;
}

- (void)dealloc
{
  [(SBUILegibilityContainerView *)self _resetImages];
  v3.receiver = self;
  v3.super_class = (Class)SBUILegibilityContainerView;
  [(SBUILegibilityContainerView *)&v3 dealloc];
}

- (void)applySettingsForLegibilityStyle:(int64_t)a3
{
  id v4 = +[SBUILegibilitySettings sharedInstanceForStyle:a3];
  [(SBUILegibilityContainerView *)self setLegibilitySettings:v4];
}

- (void)setStrength:(double)a3
{
  if (self->_strength != a3)
  {
    self->_double strength = a3;
    self->_dirty = 1;
    [(SBUILegibilityContainerView *)self _applyStrength];
  }
}

- (id)buildDrawView
{
  id v2 = objc_opt_new();
  [v2 setContentMode:0];
  return v2;
}

- (void)sizeToFit
{
  [(SBUILegibilityContainerView *)self frame];
  double v4 = v3;
  double v6 = v5;
  [(UIImage *)self->_image size];
  -[SBUILegibilityContainerView setFrame:](self, "setFrame:", v4, v6, v7, v8);
  id v9 = [(SBUILegibilityContainerView *)self _drawView];
  [(SBUILegibilityContainerView *)self bounds];
  objc_msgSend(v9, "setFrame:");
}

- (UIImage)strengthenedImage
{
  return self->_strengthenedImage;
}

- (UIImage)processedImage
{
  return self->_processedImage;
}

- (int64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_legibilityEngine);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_drawView, 0);
  objc_storeStrong((id *)&self->_processedImage, 0);
  objc_storeStrong((id *)&self->_strengthenedImage, 0);
}

@end