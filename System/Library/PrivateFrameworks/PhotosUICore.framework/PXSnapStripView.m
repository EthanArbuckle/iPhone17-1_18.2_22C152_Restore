@interface PXSnapStripView
- (NSArray)indicatorInfos;
- (PXSnapStripView)initWithFrame:(CGRect)a3;
- (id)cubeGlyph;
- (void)_updateSnapStripImage;
- (void)_updateStripView:(BOOL)a3;
- (void)layoutSubviews;
- (void)setIndicatorInfos:(id)a3;
- (void)setIndicatorInfos:(id)a3 animated:(BOOL)a4;
@end

@implementation PXSnapStripView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorInfos, 0);
  objc_storeStrong((id *)&self->_stripImageView, 0);
}

- (NSArray)indicatorInfos
{
  return self->_indicatorInfos;
}

- (id)cubeGlyph
{
  if (cubeGlyph_onceToken != -1) {
    dispatch_once(&cubeGlyph_onceToken, &__block_literal_global_120312);
  }
  v2 = (void *)cubeGlyph_glyph;
  return v2;
}

void __28__PXSnapStripView_cubeGlyph__block_invoke()
{
  v0 = [MEMORY[0x1E4FB1830] configurationWithPointSize:10.0];
  v1 = (void *)MEMORY[0x1E4FB1830];
  v2 = [MEMORY[0x1E4FB1618] labelColor];
  v3 = [v1 configurationWithHierarchicalColor:v2];

  id v8 = [v0 configurationByApplyingConfiguration:v3];

  uint64_t v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"f.cursive.circle.fill" withConfiguration:v8];
  v5 = (void *)cubeGlyph_glyph;
  cubeGlyph_glyph = v4;

  uint64_t v6 = [(id)cubeGlyph_glyph imageWithRenderingMode:2];
  v7 = (void *)cubeGlyph_glyph;
  cubeGlyph_glyph = v6;
}

- (void)_updateSnapStripImage
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  [(PXSnapStripView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 scale];
  double v9 = v8;

  int v10 = vcvtpd_s64_f64(v4 * v9);
  int v11 = vcvtpd_s64_f64(v6 * v9);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v13 = CGBitmapContextCreate(0, v10, v11, 8uLL, 0, DeviceRGB, 2u);
  CGColorSpaceRelease(DeviceRGB);
  if (v13)
  {
    v48.size.width = (double)v10;
    v48.origin.x = 0.0;
    v48.origin.y = 0.0;
    v48.size.height = (double)v11;
    CGContextClearRect(v13, v48);
    CGContextTranslateCTM(v13, 0.0, (double)v11);
    CGContextScaleCTM(v13, v9, -v9);
    CGContextGetCTM(&v44, v13);
    CGContextSetBaseCTM();
    v14 = [(PXSnapStripView *)self indicatorInfos];
    [(PXSnapStripView *)self bounds];
    double Height = CGRectGetHeight(v49);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      double v19 = Height + -6.0;
      uint64_t v20 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(v16);
          }
          v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          objc_msgSend(v22, "offset", (void)v40);
          double v24 = v23;
          v25 = [v22 color];
          v26 = [(PXSnapStripView *)self traitCollection];
          v27 = [v25 resolvedColorWithTraitCollection:v26];

          id v28 = v27;
          v29 = (CGColor *)[v28 CGColor];
          uint64_t v30 = [v22 style];
          if (v30)
          {
            if (v30 == 2)
            {
              v31 = [(PXSnapStripView *)self cubeGlyph];
              [v31 size];
              double v33 = v32;
              double v35 = v34;
              double v36 = v24 + v32 * -0.5;
              UIGraphicsPushContext(v13);
              v37 = [v31 imageWithTintColor:v28];

              objc_msgSend(v37, "drawInRect:", v36, 0.0, v33, v35);
              UIGraphicsPopContext();
            }
            else if (v30 == 1)
            {
              CGContextSetStrokeColorWithColor(v13, v29);
              v50.size.width = 2.0;
              v50.size.height = 6.0;
              v50.origin.x = v24 + -1.0;
              v50.origin.y = v19;
              CGContextStrokeEllipseInRect(v13, v50);
            }
          }
          else
          {
            CGContextSetFillColorWithColor(v13, v29);
            v51.size.width = 6.0;
            v51.size.height = 6.0;
            v51.origin.x = v24 + -3.0;
            v51.origin.y = v19;
            CGContextFillEllipseInRect(v13, v51);
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v18);
    }

    Image = CGBitmapContextCreateImage(v13);
    CGContextRelease(v13);
    v39 = [MEMORY[0x1E4FB1818] imageWithCGImage:Image scale:0 orientation:v9];
    CGImageRelease(Image);
    [(UIImageView *)self->_stripImageView setImage:v39];
  }
  else
  {
    v16 = PLUIGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "PXSnapStripView _updateSnapStripImage: could not allocate context", buf, 2u);
    }
  }
}

- (void)_updateStripView:(BOOL)a3
{
  if (self->_stripImageView)
  {
    [(PXSnapStripView *)self _updateSnapStripImage];
  }
  else
  {
    BOOL v4 = a3;
    id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(PXSnapStripView *)self bounds];
    double v6 = (UIImageView *)objc_msgSend(v5, "initWithFrame:");
    stripImageView = self->_stripImageView;
    self->_stripImageView = v6;

    [(UIImageView *)self->_stripImageView setAlpha:0.0];
    [(UIImageView *)self->_stripImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PXSnapStripView *)self addSubview:self->_stripImageView];
    double v8 = [(UIImageView *)self->_stripImageView leftAnchor];
    double v9 = [(PXSnapStripView *)self leftAnchor];
    int v10 = [v8 constraintEqualToAnchor:v9];
    [v10 setActive:1];

    int v11 = [(UIImageView *)self->_stripImageView topAnchor];
    v12 = [(PXSnapStripView *)self topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    v14 = [(UIImageView *)self->_stripImageView rightAnchor];
    v15 = [(PXSnapStripView *)self rightAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    uint64_t v17 = [(UIImageView *)self->_stripImageView bottomAnchor];
    uint64_t v18 = [(PXSnapStripView *)self bottomAnchor];
    double v19 = [v17 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    [(PXSnapStripView *)self _updateSnapStripImage];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__PXSnapStripView__updateStripView___block_invoke;
    aBlock[3] = &unk_1E5DD32A8;
    aBlock[4] = self;
    id v25 = 0;
    uint64_t v20 = (void (**)(void))_Block_copy(aBlock);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __36__PXSnapStripView__updateStripView___block_invoke_2;
    v22[3] = &unk_1E5DD2188;
    id v23 = 0;
    v21 = (void (**)(void *, uint64_t))_Block_copy(v22);
    if (v4)
    {
      [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v20 completion:v21];
    }
    else
    {
      v20[2](v20);
      v21[2](v21, 1);
    }
  }
}

uint64_t __36__PXSnapStripView__updateStripView___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:1.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

uint64_t __36__PXSnapStripView__updateStripView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)setIndicatorInfos:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (NSArray *)a3;
  v7 = v6;
  if (self->_indicatorInfos != v6)
  {
    int v11 = v6;
    BOOL v8 = -[NSArray isEqualToArray:](v6, "isEqualToArray:");
    v7 = v11;
    if (!v8)
    {
      double v9 = (NSArray *)[(NSArray *)v11 copy];
      indicatorInfos = self->_indicatorInfos;
      self->_indicatorInfos = v9;

      [(PXSnapStripView *)self _updateStripView:v4];
      v7 = v11;
    }
  }
}

- (void)setIndicatorInfos:(id)a3
{
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXSnapStripView;
  [(PXSnapStripView *)&v3 layoutSubviews];
  [(PXSnapStripView *)self _updateSnapStripImage];
}

- (PXSnapStripView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXSnapStripView;
  objc_super v3 = -[PXSnapStripView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v4 = v3;
  if (v3)
  {
    indicatorInfos = v3->_indicatorInfos;
    v3->_indicatorInfos = (NSArray *)MEMORY[0x1E4F1CBF0];

    [(PXSnapStripView *)v4 setOpaque:0];
  }
  return v4;
}

@end