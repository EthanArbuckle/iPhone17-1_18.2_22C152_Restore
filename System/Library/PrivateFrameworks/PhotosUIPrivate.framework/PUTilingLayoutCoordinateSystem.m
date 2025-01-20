@interface PUTilingLayoutCoordinateSystem
- (BOOL)isEqual:(id)a3;
- (CGPoint)coordinateSystemOrigin;
- (PUTilingCoordinateSystem)parentCoordinateSystem;
- (void)setCoordinateSystemOrigin:(CGPoint)a3;
- (void)setParentCoordinateSystem:(id)a3;
@end

@implementation PUTilingLayoutCoordinateSystem

- (void).cxx_destruct
{
}

- (void)setCoordinateSystemOrigin:(CGPoint)a3
{
  self->_coordinateSystemOrigin = a3;
}

- (CGPoint)coordinateSystemOrigin
{
  double x = self->_coordinateSystemOrigin.x;
  double y = self->_coordinateSystemOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setParentCoordinateSystem:(id)a3
{
}

- (PUTilingCoordinateSystem)parentCoordinateSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentCoordinateSystem);
  return (PUTilingCoordinateSystem *)WeakRetained;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PUTilingLayoutCoordinateSystem *)a3;
  if (v4 == self)
  {
    BOOL v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PUTilingLayoutCoordinateSystem *)self parentCoordinateSystem];
      v7 = [(PUTilingLayoutCoordinateSystem *)v5 parentCoordinateSystem];
      char v8 = [v6 isEqual:v7];

      [(PUTilingLayoutCoordinateSystem *)self coordinateSystemOrigin];
      double v10 = v9;
      double v12 = v11;
      [(PUTilingLayoutCoordinateSystem *)v5 coordinateSystemOrigin];
      double v14 = v13;
      double v16 = v15;

      if (v10 == v14) {
        BOOL v17 = v8;
      }
      else {
        BOOL v17 = 0;
      }
      BOOL v18 = v12 == v16 && v17;
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

@end