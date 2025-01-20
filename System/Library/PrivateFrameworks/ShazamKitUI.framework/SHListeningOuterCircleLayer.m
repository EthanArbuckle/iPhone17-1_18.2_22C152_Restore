@interface SHListeningOuterCircleLayer
- (CALayer)circleContainerLayer;
- (CALayer)circleLayer;
- (void)layoutSublayers;
- (void)setCircleContainerLayer:(id)a3;
- (void)setCircleLayer:(id)a3;
- (void)setup;
@end

@implementation SHListeningOuterCircleLayer

- (void)setup
{
  +[SHPalette contentsScale];
  -[SHListeningOuterCircleLayer setContentsScale:](self, "setContentsScale:");
  id v3 = objc_alloc_init(MEMORY[0x263F157E8]);
  [(SHListeningOuterCircleLayer *)self setCircleContainerLayer:v3];

  +[SHPalette contentsScale];
  double v5 = v4;
  v6 = [(SHListeningOuterCircleLayer *)self circleContainerLayer];
  [v6 setContentsScale:v5];

  id v7 = objc_alloc_init(MEMORY[0x263F157E8]);
  [(SHListeningOuterCircleLayer *)self setCircleLayer:v7];

  +[SHPalette contentsScale];
  double v9 = v8;
  v10 = [(SHListeningOuterCircleLayer *)self circleLayer];
  [v10 setContentsScale:v9];

  v11 = [(SHListeningOuterCircleLayer *)self circleLayer];
  [v11 setBorderWidth:4.0];

  v12 = [(SHPaletteLayer *)self palette];
  uint64_t v13 = [v12 listeningCircleColor];
  v14 = [(SHListeningOuterCircleLayer *)self circleLayer];
  [v14 setBorderColor:v13];

  v15 = [(SHListeningOuterCircleLayer *)self circleContainerLayer];
  [(SHListeningOuterCircleLayer *)self addSublayer:v15];

  id v17 = [(SHListeningOuterCircleLayer *)self circleContainerLayer];
  v16 = [(SHListeningOuterCircleLayer *)self circleLayer];
  [v17 addSublayer:v16];
}

- (void)layoutSublayers
{
  v29.receiver = self;
  v29.super_class = (Class)SHListeningOuterCircleLayer;
  [(SHListeningOuterCircleLayer *)&v29 layoutSublayers];
  [(SHListeningOuterCircleLayer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SHListeningOuterCircleLayer *)self circleContainerLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(SHListeningOuterCircleLayer *)self circleContainerLayer];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(SHListeningOuterCircleLayer *)self circleLayer];
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  v22 = [(SHListeningOuterCircleLayer *)self circleLayer];
  [v22 frame];
  double v24 = v23 * 0.5;
  v25 = [(SHListeningOuterCircleLayer *)self circleLayer];
  [v25 setCornerRadius:v24];

  v26 = [(SHPaletteLayer *)self palette];
  uint64_t v27 = [v26 listeningCircleColor];
  v28 = [(SHListeningOuterCircleLayer *)self circleLayer];
  [v28 setBorderColor:v27];
}

- (CALayer)circleContainerLayer
{
  return self->_circleContainerLayer;
}

- (void)setCircleContainerLayer:(id)a3
{
}

- (CALayer)circleLayer
{
  return self->_circleLayer;
}

- (void)setCircleLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_circleContainerLayer, 0);
}

@end