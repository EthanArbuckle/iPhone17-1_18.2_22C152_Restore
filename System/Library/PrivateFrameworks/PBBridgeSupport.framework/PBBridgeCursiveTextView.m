@interface PBBridgeCursiveTextView
- (CGRect)boundingBoxOfTextPath;
- (PBBridgeCursiveTextView)initWithFrame:(CGRect)a3;
- (float)duration;
- (float)textPathLineHeight;
- (float)textPathScalePerc;
- (void)configure;
- (void)layoutSubviews;
- (void)loadText:(id)a3 pointSize:(double)a4 options:(id)a5;
- (void)setTime:(double)a3;
@end

@implementation PBBridgeCursiveTextView

- (PBBridgeCursiveTextView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PBBridgeCursiveTextView;
  v3 = -[PBBridgeCursiveTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PBBridgeCursiveTextView *)v3 configure];
  }
  return v4;
}

- (void)configure
{
  v3 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
  textLayer = self->_textLayer;
  self->_textLayer = v3;

  [(PBBridgeCursiveTextView *)self frame];
  -[CAShapeLayer setFrame:](self->_textLayer, "setFrame:");
  id v5 = [MEMORY[0x263F1C550] whiteColor];
  -[CAShapeLayer setFillColor:](self->_textLayer, "setFillColor:", [v5 CGColor]);

  id v6 = [(PBBridgeCursiveTextView *)self layer];
  [v6 addSublayer:self->_textLayer];
}

- (void)layoutSubviews
{
  [(PBBridgeCursiveTextView *)self frame];
  textLayer = self->_textLayer;
  -[CAShapeLayer setFrame:](textLayer, "setFrame:");
}

- (void)loadText:(id)a3 pointSize:(double)a4 options:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = [[PBBridgeCursiveTextPath alloc] initWithURL:v8 options:v9];
  textPath = self->_textPath;
  self->_textPath = v10;

  v12 = self->_textPath;
  v13 = pbb_setup_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = a4;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v9;
      _os_log_impl(&dword_21C445000, v13, OS_LOG_TYPE_DEFAULT, "Loading text from url: %@ at pointSize: %f with options: %@", buf, 0x20u);
    }

    v15 = self->_textPath;
    [(CAShapeLayer *)self->_textLayer bounds];
    if (v15)
    {
      -[PBBridgeCursiveTextPath transformForRect:pointSize:flipped:](v15, "transformForRect:pointSize:flipped:", 1);
    }
    else
    {
      long long v22 = 0u;
      memset(buf, 0, sizeof(buf));
    }
    long long v16 = *(_OWORD *)&buf[16];
    *(_OWORD *)&self->_textTransform.a = *(_OWORD *)buf;
    *(_OWORD *)&self->_textTransform.c = v16;
    *(_OWORD *)&self->_textTransform.tx = v22;
    v17 = [(PBBridgeCursiveTextView *)self layer];
    [v17 opacity];
    float v19 = v18;

    if (v19 < 1.0)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __54__PBBridgeCursiveTextView_loadText_pointSize_options___block_invoke;
      v20[3] = &unk_2644011C8;
      v20[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:v20 animations:1.0];
    }
  }
  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C445000, v13, OS_LOG_TYPE_DEFAULT, "No text path", buf, 2u);
    }
  }
}

void __54__PBBridgeCursiveTextView_loadText_pointSize_options___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  LODWORD(v1) = 1.0;
  [v2 setOpacity:v1];
}

- (float)duration
{
  textPath = self->_textPath;
  if (!textPath) {
    return 0.0;
  }
  [(PBBridgeCursiveTextPath *)textPath animationDuration];
  return result;
}

- (void)setTime:(double)a3
{
  *(float *)&a3 = a3;
  v4 = [(PBBridgeCursiveTextPath *)self->_textPath pathForTime:a3];
  id v5 = (const CGPath *)MEMORY[0x21D4A6CE0](v4, &self->_textTransform);
  [(CAShapeLayer *)self->_textLayer setPath:v5];
  CGPathRelease(v5);
  CGPathRelease(v4);
}

- (float)textPathLineHeight
{
  [(PBBridgeCursiveTextPath *)self->_textPath lineHeight];
  return result;
}

- (CGRect)boundingBoxOfTextPath
{
  [(PBBridgeCursiveTextPath *)self->_textPath boundingBoxOfPath];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (float)textPathScalePerc
{
  [(PBBridgeCursiveTextPath *)self->_textPath scale];
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textPath, 0);
  objc_storeStrong((id *)&self->_textLayer, 0);
}

@end