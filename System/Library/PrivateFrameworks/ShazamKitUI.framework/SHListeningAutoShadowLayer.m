@interface SHListeningAutoShadowLayer
- (CALayer)autoShadowBackgroundLayer;
- (CAShapeLayer)autoShadowOuterLayer;
- (void)layoutSublayers;
- (void)setAutoShadowBackgroundLayer:(id)a3;
- (void)setAutoShadowOuterLayer:(id)a3;
- (void)setup;
@end

@implementation SHListeningAutoShadowLayer

- (void)setup
{
  +[SHPalette contentsScale];
  -[SHListeningAutoShadowLayer setContentsScale:](self, "setContentsScale:");
  id v3 = objc_alloc_init(MEMORY[0x263F157E8]);
  [(SHListeningAutoShadowLayer *)self setAutoShadowBackgroundLayer:v3];

  +[SHPalette contentsScale];
  double v5 = v4;
  v6 = [(SHListeningAutoShadowLayer *)self autoShadowBackgroundLayer];
  [v6 setContentsScale:v5];

  v7 = [(SHPaletteLayer *)self palette];
  uint64_t v8 = [v7 listeningButtonBackgroundTransparentColor];
  v9 = [(SHListeningAutoShadowLayer *)self autoShadowBackgroundLayer];
  [v9 setBackgroundColor:v8];

  v10 = [(SHListeningAutoShadowLayer *)self autoShadowBackgroundLayer];
  [v10 setMasksToBounds:1];

  id v11 = objc_alloc_init(MEMORY[0x263F15880]);
  [(SHListeningAutoShadowLayer *)self setAutoShadowOuterLayer:v11];

  +[SHPalette contentsScale];
  double v13 = v12;
  v14 = [(SHListeningAutoShadowLayer *)self autoShadowOuterLayer];
  [v14 setContentsScale:v13];

  v15 = [(SHListeningAutoShadowLayer *)self autoShadowOuterLayer];
  [v15 setFillColor:0];

  v16 = [(SHPaletteLayer *)self palette];
  uint64_t v17 = [v16 listeningButtonBackgroundTransparentColor];
  v18 = [(SHListeningAutoShadowLayer *)self autoShadowOuterLayer];
  [v18 setStrokeColor:v17];

  v19 = [(SHPaletteLayer *)self palette];
  uint64_t v20 = [v19 shadowColor];
  v21 = [(SHListeningAutoShadowLayer *)self autoShadowOuterLayer];
  [v21 setShadowColor:v20];

  v22 = [(SHListeningAutoShadowLayer *)self autoShadowOuterLayer];
  [v22 setShadowRadius:3.0];

  v23 = [(SHListeningAutoShadowLayer *)self autoShadowOuterLayer];
  LODWORD(v24) = 0.5;
  [v23 setShadowOpacity:v24];

  v25 = [(SHListeningAutoShadowLayer *)self autoShadowOuterLayer];
  objc_msgSend(v25, "setShadowOffset:", 0.0, 0.0);

  v26 = [(SHListeningAutoShadowLayer *)self autoShadowOuterLayer];
  [v26 setBorderWidth:1.0];

  v27 = [(SHPaletteLayer *)self palette];
  uint64_t v28 = [v27 clearColor];
  v29 = [(SHListeningAutoShadowLayer *)self autoShadowOuterLayer];
  [v29 setBorderColor:v28];

  v30 = [(SHListeningAutoShadowLayer *)self autoShadowOuterLayer];
  [v30 setLineWidth:3.0];

  v31 = [(SHListeningAutoShadowLayer *)self autoShadowBackgroundLayer];
  [(SHListeningAutoShadowLayer *)self addSublayer:v31];

  id v33 = [(SHListeningAutoShadowLayer *)self autoShadowBackgroundLayer];
  v32 = [(SHListeningAutoShadowLayer *)self autoShadowOuterLayer];
  [v33 addSublayer:v32];
}

- (void)layoutSublayers
{
  v38.receiver = self;
  v38.super_class = (Class)SHListeningAutoShadowLayer;
  [(SHListeningAutoShadowLayer *)&v38 layoutSublayers];
  [(SHListeningAutoShadowLayer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(SHListeningAutoShadowLayer *)self autoShadowBackgroundLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  double v12 = [(SHListeningAutoShadowLayer *)self autoShadowBackgroundLayer];
  [v12 frame];
  double v14 = v13 * 0.5;
  v15 = [(SHListeningAutoShadowLayer *)self autoShadowBackgroundLayer];
  [v15 setCornerRadius:v14];

  v16 = [(SHListeningAutoShadowLayer *)self autoShadowBackgroundLayer];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  v25 = [(SHListeningAutoShadowLayer *)self autoShadowOuterLayer];
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  v26 = [(SHPaletteLayer *)self palette];
  uint64_t v27 = [v26 listeningButtonBackgroundTransparentColor];
  uint64_t v28 = [(SHListeningAutoShadowLayer *)self autoShadowBackgroundLayer];
  [v28 setBackgroundColor:v27];

  v29 = [(SHPaletteLayer *)self palette];
  uint64_t v30 = [v29 listeningButtonBackgroundTransparentColor];
  v31 = [(SHListeningAutoShadowLayer *)self autoShadowOuterLayer];
  [v31 setStrokeColor:v30];

  v32 = [(SHPaletteLayer *)self palette];
  uint64_t v33 = [v32 shadowColor];
  v34 = [(SHListeningAutoShadowLayer *)self autoShadowOuterLayer];
  [v34 setShadowColor:v33];

  Mutable = CGPathCreateMutable();
  v36 = [(SHListeningAutoShadowLayer *)self autoShadowBackgroundLayer];
  [v36 bounds];
  CGPathAddEllipseInRect(Mutable, 0, v39);

  v37 = [(SHListeningAutoShadowLayer *)self autoShadowOuterLayer];
  [v37 setPath:Mutable];

  CGPathRelease(Mutable);
}

- (CALayer)autoShadowBackgroundLayer
{
  return self->_autoShadowBackgroundLayer;
}

- (void)setAutoShadowBackgroundLayer:(id)a3
{
}

- (CAShapeLayer)autoShadowOuterLayer
{
  return self->_autoShadowOuterLayer;
}

- (void)setAutoShadowOuterLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoShadowOuterLayer, 0);
  objc_storeStrong((id *)&self->_autoShadowBackgroundLayer, 0);
}

@end