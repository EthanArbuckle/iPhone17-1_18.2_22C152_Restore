@interface PUTileReattachmentContext
- (BOOL)isTransitioningOverOneUp;
- (BOOL)isZoomingIn;
- (NSMapTable)_tileControllerVelocities;
- (PUDisplayVelocity)velocityForTileController:(id)a3;
- (void)setTransitioningOverOneUp:(BOOL)a3;
- (void)setVelocity:(PUDisplayVelocity)a3 forTileController:(id)a4;
- (void)setZoomingIn:(BOOL)a3;
@end

@implementation PUTileReattachmentContext

- (void).cxx_destruct
{
}

- (NSMapTable)_tileControllerVelocities
{
  return self->__tileControllerVelocities;
}

- (void)setTransitioningOverOneUp:(BOOL)a3
{
  self->_isTransitioningOverOneUp = a3;
}

- (BOOL)isTransitioningOverOneUp
{
  return self->_isTransitioningOverOneUp;
}

- (void)setZoomingIn:(BOOL)a3
{
  self->_isZoomingIn = a3;
}

- (BOOL)isZoomingIn
{
  return self->_isZoomingIn;
}

- (void)setVelocity:(PUDisplayVelocity)a3 forTileController:(id)a4
{
  double rotation = a3.rotation;
  double scale = a3.scale;
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v11 = [(PUTileReattachmentContext *)self _tileControllerVelocities];
  if (!v11)
  {
    id v11 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    objc_storeStrong((id *)&self->__tileControllerVelocities, v11);
  }
  v10 = objc_msgSend(MEMORY[0x1E4F29238], "pu_valueWithDisplayVelocity:", x, y, scale, rotation);
  [v11 setObject:v10 forKey:v9];
}

- (PUDisplayVelocity)velocityForTileController:(id)a3
{
  id v4 = a3;
  v5 = [(PUTileReattachmentContext *)self _tileControllerVelocities];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    objc_msgSend(v6, "pu_displayVelocityValue");
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v14 = 0.0;
    double v12 = 0.0;
    double v10 = 0.0;
    double v8 = 0.0;
  }

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.double rotation = v18;
  result.double scale = v17;
  result.double y = v16;
  result.double x = v15;
  return result;
}

@end