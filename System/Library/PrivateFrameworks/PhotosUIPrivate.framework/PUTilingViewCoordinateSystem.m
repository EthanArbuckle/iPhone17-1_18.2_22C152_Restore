@interface PUTilingViewCoordinateSystem
- (CGPoint)coordinateSystemOrigin;
- (PUTilingCoordinateSystem)parentCoordinateSystem;
- (PUTilingView)tilingView;
- (PUTilingViewCoordinateSystem)init;
- (PUTilingViewCoordinateSystem)initWithTilingView:(id)a3;
@end

@implementation PUTilingViewCoordinateSystem

- (void).cxx_destruct
{
}

- (PUTilingView)tilingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tilingView);
  return (PUTilingView *)WeakRetained;
}

- (CGPoint)coordinateSystemOrigin
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUTilingViewCoordinateSystem.m" lineNumber:34 description:@"must be implemented by concrete subclass"];

  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v6;
  result.x = v5;
  return result;
}

- (PUTilingCoordinateSystem)parentCoordinateSystem
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUTilingViewCoordinateSystem.m" lineNumber:29 description:@"must be implemented by concrete subclass"];

  return 0;
}

- (PUTilingViewCoordinateSystem)initWithTilingView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUTilingViewCoordinateSystem;
  double v5 = [(PUTilingViewCoordinateSystem *)&v8 init];
  double v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_tilingView, v4);
  }

  return v6;
}

- (PUTilingViewCoordinateSystem)init
{
  return [(PUTilingViewCoordinateSystem *)self initWithTilingView:0];
}

@end