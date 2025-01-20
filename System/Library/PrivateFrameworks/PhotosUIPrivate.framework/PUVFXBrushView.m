@interface PUVFXBrushView
- (PUVFXBrushView)initWithFrame:(CGRect)a3;
- (PUVFXBrushViewDelegate)delegate;
- (id)brushOverlay;
- (void)_didMoveToSuperview;
- (void)_layoutSubviews;
- (void)didMoveToSuperview;
- (void)endEmission;
- (void)layoutSubviews;
- (void)setBrushPosition:(CGPoint)a3;
- (void)setBrushRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setMask:(CGImage *)a3;
- (void)startEmissionAtPoint:(CGPoint)a3;
@end

@implementation PUVFXBrushView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_brushOverlay, 0);
  objc_storeStrong((id *)&self->_brushMaskLayer, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PUVFXBrushViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUVFXBrushViewDelegate *)WeakRetained;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUVFXBrushView;
  [(PUVFXBrushView *)&v3 layoutSubviews];
  [(PUVFXBrushView *)self _layoutSubviews];
}

- (void)_layoutSubviews
{
  brushMaskLayer = self->_brushMaskLayer;
  [(PUVFXBrushView *)self bounds];
  -[CALayer setFrame:](brushMaskLayer, "setFrame:");
}

- (void)setMask:(CGImage *)a3
{
  v19[4] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    brushMaskLayer = self->_brushMaskLayer;
    if (!brushMaskLayer)
    {
      v6 = (CALayer *)objc_opt_new();
      v7 = self->_brushMaskLayer;
      self->_brushMaskLayer = v6;

      v8 = self->_brushMaskLayer;
      v18[0] = @"position";
      v9 = [MEMORY[0x1E4F1CA98] null];
      v19[0] = v9;
      v18[1] = @"bounds";
      v10 = [MEMORY[0x1E4F1CA98] null];
      v19[1] = v10;
      v18[2] = @"transform";
      v11 = [MEMORY[0x1E4F1CA98] null];
      v19[2] = v11;
      v18[3] = @"frame";
      v12 = [MEMORY[0x1E4F1CA98] null];
      v19[3] = v12;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
      [(CALayer *)v8 setActions:v13];

      v14 = [(PUVFXBrushView *)self layer];
      [v14 setMask:self->_brushMaskLayer];

      brushMaskLayer = self->_brushMaskLayer;
    }
    [(CALayer *)brushMaskLayer setContents:a3];
    v15 = self->_brushMaskLayer;
    [(PUVFXBrushView *)self bounds];
    -[CALayer setFrame:](v15, "setFrame:");
  }
  else
  {
    v16 = [(PUVFXBrushView *)self layer];
    [v16 setMask:0];

    [(CALayer *)self->_brushMaskLayer setContents:0];
    v17 = self->_brushMaskLayer;
    self->_brushMaskLayer = 0;
  }
}

- (void)setBrushRadius:(double)a3
{
}

- (void)setBrushPosition:(CGPoint)a3
{
}

- (void)endEmission
{
  [(PUBrushEffectOverlay *)self->_brushOverlay endEmission];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didEndBrushing];
}

- (void)startEmissionAtPoint:(CGPoint)a3
{
  -[PUBrushEffectOverlay setBrushPosition:](self->_brushOverlay, "setBrushPosition:", a3.x, a3.y);
  [(PUBrushEffectOverlay *)self->_brushOverlay startEmission];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didStartBrushing];

  id v6 = [(PUVFXBrushView *)self layer];
  LODWORD(v5) = 1.0;
  [v6 setOpacity:v5];
}

- (id)brushOverlay
{
  return self->_brushOverlay;
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)PUVFXBrushView;
  [(PUVFXBrushView *)&v3 didMoveToSuperview];
  [(PUVFXBrushView *)self _didMoveToSuperview];
}

- (void)_didMoveToSuperview
{
  objc_super v3 = [(PUVFXBrushView *)self superview];

  if (v3)
  {
    v4 = [[PUBrushEffectOverlay alloc] initWithTimeScale:1.0];
    brushOverlay = self->_brushOverlay;
    self->_brushOverlay = v4;

    [(PUBrushEffectOverlay *)self->_brushOverlay setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = self->_brushOverlay;
    [(PUVFXBrushView *)self addSubview:v6];
  }
}

- (PUVFXBrushView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUVFXBrushView;
  objc_super v3 = -[PUVFXBrushView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    double v5 = [(PUVFXBrushView *)v3 layer];
    [v5 setOpacity:0.0];

    id v6 = v4;
  }

  return v4;
}

@end