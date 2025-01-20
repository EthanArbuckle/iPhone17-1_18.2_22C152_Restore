@interface NTKComplicationPlaceholderView
- (CLKMonochromeFilterProvider)filterProvider;
- (double)_circleDiameter;
- (id)_createCircularLayer;
- (id)_createCircularLayersWithDiameter:(double)a3;
- (id)_createDownloadMaskLayer;
- (id)_createDownloadProgressMaskWithDiameter:(double)a3 progress:(double)a4 contained:(BOOL)a5;
- (id)_createRectangularLayer;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (void)_updateLayers;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)setFilterProvider:(id)a3;
@end

@implementation NTKComplicationPlaceholderView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKComplicationPlaceholderView;
  v6 = [(NTKComplicationPlaceholderView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  v6 = [v5 metadata];
  v7 = [v6 objectForKeyedSubscript:@"NTKComplicationPlaceholderAppIdentifierKey"];

  v8 = [v5 metadata];

  objc_super v9 = [v8 objectForKeyedSubscript:@"NTKComplicationPlaceholderComplicationVariantKey"];

  complicationAppIdentifier = self->_complicationAppIdentifier;
  self->_complicationAppIdentifier = v7;
  v11 = v7;

  complicationVariant = self->_complicationVariant;
  self->_complicationVariant = v9;

  [(NTKComplicationPlaceholderView *)self _updateLayers];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)NTKComplicationPlaceholderView;
  [(NTKComplicationPlaceholderView *)&v10 layoutSubviews];
  [(CALayer *)self->_strokesLayer bounds];
  double v4 = v3;
  double v6 = v5;
  [(NTKComplicationPlaceholderView *)self bounds];
  if (v4 != v8 || v6 != v7) {
    [(NTKComplicationPlaceholderView *)self _updateLayers];
  }
}

- (void)_updateLayers
{
  [(CALayer *)self->_strokesLayer removeFromSuperlayer];
  double v3 = [MEMORY[0x1E4F39BE8] layer];
  [(NTKComplicationPlaceholderView *)self bounds];
  -[CALayer setFrame:](v3, "setFrame:");
  id v4 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.65];
  -[CALayer setBackgroundColor:](v3, "setBackgroundColor:", [v4 CGColor]);

  double v5 = [(NTKComplicationVariant *)self->_complicationVariant metrics];
  [v5 cornerRadius];
  -[CALayer setCornerRadius:](v3, "setCornerRadius:");

  double v6 = [(NTKComplicationVariant *)self->_complicationVariant metrics];
  int v7 = [v6 opaque];

  if (v7)
  {
    double v8 = [MEMORY[0x1E4FB1618] whiteColor];
    [(NTKComplicationPlaceholderView *)self setBackgroundColor:v8];
  }
  if ([(NTKComplicationVariant *)self->_complicationVariant family] == 11) {
    [(NTKComplicationPlaceholderView *)self _createRectangularLayer];
  }
  else {
  objc_super v9 = [(NTKComplicationPlaceholderView *)self _createCircularLayer];
  }
  [(CALayer *)v3 addSublayer:v9];

  strokesLayer = self->_strokesLayer;
  self->_strokesLayer = v3;
  v11 = v3;

  v12 = [(NTKComplicationVariant *)self->_complicationVariant metrics];
  [v12 cornerRadius];
  double v14 = v13;
  v15 = [(NTKComplicationPlaceholderView *)self layer];
  [v15 setCornerRadius:v14];

  id v16 = [(NTKComplicationPlaceholderView *)self layer];
  [v16 addSublayer:self->_strokesLayer];
}

- (id)_createCircularLayer
{
  double v3 = [(NTKComplicationVariant *)self->_complicationVariant metrics];
  [v3 size];
  double v5 = [(NTKComplicationPlaceholderView *)self _createCircularLayersWithDiameter:v4];

  return v5;
}

- (id)_createRectangularLayer
{
  double v3 = [(NTKComplicationVariant *)self->_complicationVariant metrics];
  [v3 cornerRadius];
  double v5 = v4;

  double v6 = [(NTKComplicationVariant *)self->_complicationVariant metrics];
  [v6 size];
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.width = v8;
  v31.size.double height = v10;
  CGRect v32 = CGRectInset(v31, 0.5, 0.5);
  v11 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height, v5 + -0.5);
  CLKRoundForDevice();
  CGFloat v13 = v12;
  v33.origin.x = 0.0;
  v33.origin.y = 0.0;
  v33.size.width = v8;
  v33.size.double height = v10;
  CGRect v34 = CGRectInset(v33, v13, v13);
  double height = v34.size.height;
  v15 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v34.origin.x, v34.origin.y, v34.size.width);
  Mutable = CGPathCreateMutable();
  id v17 = v11;
  CGPathAddPath(Mutable, 0, (CGPathRef)[v17 CGPath]);
  id v18 = v15;
  CGPathAddPath(Mutable, 0, (CGPathRef)[v18 CGPath]);
  v35.origin.x = 0.0;
  v35.origin.y = 0.0;
  v35.size.width = v8;
  v35.size.double height = v10;
  CGFloat MidY = CGRectGetMidY(v35);
  CGPathMoveToPoint(Mutable, 0, 0.0, MidY);
  v36.origin.x = 0.0;
  v36.origin.y = 0.0;
  v36.size.width = v8;
  v36.size.double height = v10;
  CGFloat MaxX = CGRectGetMaxX(v36);
  v37.origin.x = 0.0;
  v37.origin.y = 0.0;
  v37.size.width = v8;
  v37.size.double height = v10;
  CGFloat v21 = CGRectGetMidY(v37);
  CGPathAddLineToPoint(Mutable, 0, MaxX, v21);
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v38.size.width = v8;
  v38.size.double height = v10;
  CGFloat MidX = CGRectGetMidX(v38);
  CGPathMoveToPoint(Mutable, 0, MidX, 0.0);
  v39.origin.x = 0.0;
  v39.origin.y = 0.0;
  v39.size.width = v8;
  v39.size.double height = v10;
  CGFloat v23 = CGRectGetMidX(v39);
  v40.origin.x = 0.0;
  v40.origin.y = 0.0;
  v40.size.width = v8;
  v40.size.double height = v10;
  CGFloat MaxY = CGRectGetMaxY(v40);
  CGPathAddLineToPoint(Mutable, 0, v23, MaxY);
  v25 = [MEMORY[0x1E4F39C88] layer];
  [v25 setPath:Mutable];
  id v26 = [MEMORY[0x1E4FB1618] colorWithWhite:0.407843137 alpha:1.0];
  objc_msgSend(v25, "setStrokeColor:", objc_msgSend(v26, "CGColor"));

  [v25 setLineWidth:1.0];
  [v25 setFillColor:0];
  CGPathRelease(Mutable);
  v27 = [(NTKComplicationPlaceholderView *)self _createCircularLayersWithDiameter:height];
  v41.origin.x = 0.0;
  v41.origin.y = 0.0;
  v41.size.width = v8;
  v41.size.double height = v10;
  CGFloat v28 = CGRectGetMidX(v41) - height * 0.5;
  v42.origin.x = 0.0;
  v42.origin.y = 0.0;
  v42.size.width = v8;
  v42.size.double height = v10;
  objc_msgSend(v27, "setFrame:", v28, CGRectGetMidY(v42) - height * 0.5, height, height);
  [v25 addSublayer:v27];

  return v25;
}

- (id)_createCircularLayersWithDiameter:(double)a3
{
  CGFloat v4 = a3 * 0.5;
  double v5 = a3 * 1.41421356 * 0.5;
  Mutable = CGPathCreateMutable();
  double v7 = v5 * 0.5;
  CGPathMoveToPoint(Mutable, 0, v4 - v7, v4 - v7);
  CGPathAddLineToPoint(Mutable, 0, v4 + v7, v4 - v7);
  CGPathAddLineToPoint(Mutable, 0, v4 + v7, v4 + v7);
  CGPathAddLineToPoint(Mutable, 0, v4 - v7, v4 + v7);
  CGPathCloseSubpath(Mutable);
  CGPathMoveToPoint(Mutable, 0, v4 - v7, v4 - v7);
  CGPathAddLineToPoint(Mutable, 0, v4 + v7, v4 + v7);
  CGPathMoveToPoint(Mutable, 0, v4 + v7, v4 - v7);
  CGPathAddLineToPoint(Mutable, 0, v4 - v7, v4 + v7);
  CGFloat v8 = CGPathCreateMutable();
  CGPathAddArc(v8, 0, v4, v4, v4, 0.0, 6.28318531, 1);
  CGPathMoveToPoint(v8, 0, 0.0, v4);
  CGPathAddLineToPoint(v8, 0, a3, v4);
  CGPathMoveToPoint(v8, 0, v4, 0.0);
  CGPathAddLineToPoint(v8, 0, v4, a3);
  double v9 = CGPathCreateMutable();
  CGPathAddArc(v9, 0, v4, v4, v4 * 0.3, 0.0, 6.28318531, 1);
  CGPathAddArc(v9, 0, v4, v4, v5 * 0.5, 0.0, 6.28318531, 1);
  CGFloat v10 = [MEMORY[0x1E4F39C88] layer];
  [v10 setPath:Mutable];
  id v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.447058824 alpha:1.0];
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v11, "CGColor"));

  [v10 setLineWidth:1.0];
  [v10 setFillColor:0];
  double v12 = [MEMORY[0x1E4F39C88] layer];
  [v12 setPath:v8];
  id v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.407843137 alpha:1.0];
  objc_msgSend(v12, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

  [v12 setLineWidth:1.0];
  [v12 setFillColor:0];
  double v14 = [MEMORY[0x1E4F39C88] layer];
  [v14 setPath:v9];
  id v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.298039216 alpha:1.0];
  objc_msgSend(v14, "setStrokeColor:", objc_msgSend(v15, "CGColor"));

  [v14 setLineWidth:1.0];
  [v14 setFillColor:0];
  CGPathRelease(Mutable);
  CGPathRelease(v8);
  CGPathRelease(v9);
  id v16 = [MEMORY[0x1E4F39BE8] layer];
  [v16 addSublayer:v10];
  [v16 addSublayer:v12];
  [v16 addSublayer:v14];

  return v16;
}

- (id)_createDownloadMaskLayer
{
  BOOL v3 = [(NTKComplicationVariant *)self->_complicationVariant family] == 11;
  [(NTKComplicationPlaceholderView *)self _circleDiameter];
  return -[NTKComplicationPlaceholderView _createDownloadProgressMaskWithDiameter:progress:contained:](self, "_createDownloadProgressMaskWithDiameter:progress:contained:", v3);
}

- (double)_circleDiameter
{
  BOOL v3 = [(NTKComplicationVariant *)self->_complicationVariant metrics];
  [v3 size];
  double v5 = v4;

  if ([(NTKComplicationVariant *)self->_complicationVariant family] != 11) {
    return v5;
  }
  CLKRoundForDevice();
  return v5 + v6 * -2.0;
}

- (id)_createDownloadProgressMaskWithDiameter:(double)a3 progress:(double)a4 contained:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat v8 = [(NTKComplicationVariant *)self->_complicationVariant metrics];
  [v8 size];
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  Mutable = CGPathCreateMutable();
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = v10;
  v21.size.double height = v12;
  CGFloat MidX = CGRectGetMidX(v21);
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = v10;
  v22.size.double height = v12;
  CGFloat MidY = CGRectGetMidY(v22);
  if (v5)
  {
    CGPathAddArc(Mutable, 0, MidX, MidY, a3 * 0.5, 0.0, 6.28318531, 1);
    CGPathCloseSubpath(Mutable);
  }
  CGPathMoveToPoint(Mutable, 0, MidX, MidY);
  CGPathAddArc(Mutable, 0, MidX, MidY, a3 * 1.41421356 * 0.5 * 0.5, -1.57079633, a4 * 6.28318531 + -1.57079633, 1);
  CGPathCloseSubpath(Mutable);
  id v16 = [MEMORY[0x1E4F39C88] layer];
  [v16 setPath:Mutable];
  id v17 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:1.0];
  objc_msgSend(v16, "setFillColor:", objc_msgSend(v17, "CGColor"));

  [v16 setLineWidth:1.0];
  [v16 setFillRule:*MEMORY[0x1E4F39FB8]];
  id v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.4];
  objc_msgSend(v16, "setBackgroundColor:", objc_msgSend(v18, "CGColor"));

  return v16;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->filterProvider);
  objc_storeStrong((id *)&self->_strokesLayer, 0);
  objc_storeStrong((id *)&self->_complicationVariant, 0);
  objc_storeStrong((id *)&self->_complicationAppIdentifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end