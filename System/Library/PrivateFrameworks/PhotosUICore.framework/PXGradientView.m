@interface PXGradientView
+ (Class)layerClass;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (NSArray)colors;
- (NSArray)locations;
- (void)_updateGradientLayerColors;
- (void)setColors:(id)a3;
- (void)setEndPoint:(CGPoint)a3;
- (void)setLocations:(id)a3;
- (void)setStartPoint:(CGPoint)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXGradientView

- (void).cxx_destruct
{
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXGradientView;
  id v4 = a3;
  [(PXGradientView *)&v8 traitCollectionDidChange:v4];
  v5 = [(PXGradientView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(PXGradientView *)self _updateGradientLayerColors];
  }
}

- (void)setEndPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(PXGradientView *)self gradientLayer];
  objc_msgSend(v5, "setEndPoint:", x, y);
}

- (CGPoint)endPoint
{
  v2 = [(PXGradientView *)self gradientLayer];
  [v2 endPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(PXGradientView *)self gradientLayer];
  objc_msgSend(v5, "setStartPoint:", x, y);
}

- (CGPoint)startPoint
{
  v2 = [(PXGradientView *)self gradientLayer];
  [v2 startPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)setLocations:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGradientView *)self gradientLayer];
  [v5 setLocations:v4];
}

- (NSArray)locations
{
  v2 = [(PXGradientView *)self gradientLayer];
  double v3 = [v2 locations];

  return (NSArray *)v3;
}

- (void)_updateGradientLayerColors
{
  double v3 = [(PXGradientView *)self colors];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PXGradientView__updateGradientLayerColors__block_invoke;
  v7[3] = &unk_1E5DCB648;
  id v8 = v4;
  id v5 = v4;
  [v3 enumerateObjectsUsingBlock:v7];
  double v6 = [(PXGradientView *)self gradientLayer];
  [v6 setColors:v5];
}

uint64_t __44__PXGradientView__updateGradientLayerColors__block_invoke(uint64_t a1, id a2)
{
  uint64_t v3 = [a2 CGColor];
  id v4 = *(void **)(a1 + 32);
  return [v4 addObject:v3];
}

- (void)setColors:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  colors = self->_colors;
  self->_colors = v4;

  [(PXGradientView *)self _updateGradientLayerColors];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end