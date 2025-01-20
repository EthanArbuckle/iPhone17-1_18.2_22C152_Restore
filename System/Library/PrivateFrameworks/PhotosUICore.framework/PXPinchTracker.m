@interface PXPinchTracker
- (BOOL)_needsUpdate;
- (BOOL)shouldResize;
- (CGAffineTransform)transform;
- (CGPoint)center;
- (CGPoint)pinchLocation1;
- (CGPoint)pinchLocation2;
- (CGSize)size;
- (PXDisplayVelocity)velocity;
- (PXPinchTracker)init;
- (PXPinchTracker)initWithCenter:(CGPoint)a3 size:(CGSize)a4 transform:(CGAffineTransform *)a5;
- (double)rotationHysteris;
- (double)scale;
- (double)scaleHysteresis;
- (double)time;
- (int64_t)scaleDirection;
- (void)_invalidateGeometry;
- (void)_invalidateInitialValues;
- (void)_setCenter:(CGPoint)a3;
- (void)_setNeedsUpdate;
- (void)_setScale:(double)a3;
- (void)_setScaleDirection:(int64_t)a3;
- (void)_setSize:(CGSize)a3;
- (void)_setTransform:(CGAffineTransform *)a3;
- (void)_setVelocity:(PXDisplayVelocity)a3;
- (void)_transformPinchLocation1:(CGPoint)a3 location2:(CGPoint)a4 intoCenter:(CGPoint *)a5 distance:(double *)a6 angle:(double *)a7;
- (void)_updateGeometryIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateInitialValuesIfNeeded;
- (void)didPerformChanges;
- (void)performChanges:(id)a3;
- (void)setPinchLocation1:(CGPoint)a3;
- (void)setPinchLocation2:(CGPoint)a3;
- (void)setTime:(double)a3;
@end

@implementation PXPinchTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaleDirectionFilter, 0);
  objc_storeStrong((id *)&self->_rotationalVelocityFilter, 0);
  objc_storeStrong((id *)&self->_scaleVelocityFilter, 0);
  objc_storeStrong((id *)&self->_verticalVelocityFilter, 0);
  objc_storeStrong((id *)&self->_horizontalVelocityFilter, 0);
  objc_storeStrong((id *)&self->_pinchRotationFilter, 0);
}

- (BOOL)shouldResize
{
  return self->_shouldResize;
}

- (double)scaleHysteresis
{
  return self->_scaleHysteresis;
}

- (double)rotationHysteris
{
  return self->_rotationHysteris;
}

- (int64_t)scaleDirection
{
  return self->_scaleDirection;
}

- (double)scale
{
  return self->_scale;
}

- (PXDisplayVelocity)velocity
{
  double x = self->_velocity.x;
  double y = self->_velocity.y;
  double scale = self->_velocity.scale;
  double rotation = self->_velocity.rotation;
  result.double rotation = rotation;
  result.double scale = scale;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[10].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[9].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[10].d;
  return self;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (double)time
{
  return self->_time;
}

- (CGPoint)pinchLocation2
{
  double x = self->_pinchLocation2.x;
  double y = self->_pinchLocation2.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)pinchLocation1
{
  double x = self->_pinchLocation1.x;
  double y = self->_pinchLocation1.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_updateGeometryIfNeeded
{
  if (self->_needsUpdateFlags.geometry)
  {
    self->_needsUpdateFlags.geometrdouble y = 0;
    [(PXPinchTracker *)self pinchLocation1];
    [(PXPinchTracker *)self pinchLocation2];
    if (self->_didSetInitialValues) {
      PXPointIsNull();
    }
  }
}

uint64_t __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInput:*(double *)(a1 + 32)];
}

void __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  id v4 = a2;
  [v4 setInput:v3];
  [v4 setTime:*(double *)(a1 + 48)];
}

void __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 40);
  id v4 = a2;
  [v4 setInput:v3];
  [v4 setTime:*(double *)(a1 + 48)];
}

void __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke_4(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  id v4 = a2;
  [v4 setInput:v3];
  [v4 setTime:*(double *)(a1 + 40)];
}

void __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke_5(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  id v4 = a2;
  [v4 setInput:v3];
  [v4 setTime:*(double *)(a1 + 40)];
}

uint64_t __41__PXPinchTracker__updateGeometryIfNeeded__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 setInput:*(double *)(a1 + 32)];
}

- (void)_invalidateGeometry
{
  self->_needsUpdateFlags.geometrdouble y = 1;
  [(PXPinchTracker *)self _setNeedsUpdate];
}

- (void)_updateInitialValuesIfNeeded
{
  if (self->_needsUpdateFlags.initialValues)
  {
    self->_needsUpdateFlags.initialValues = 0;
    if (!self->_didSetInitialValues)
    {
      [(PXPinchTracker *)self pinchLocation1];
      [(PXPinchTracker *)self pinchLocation2];
      PXPointIsNull();
    }
  }
}

- (void)_invalidateInitialValues
{
  self->_needsUpdateFlags.initialValues = 1;
  [(PXPinchTracker *)self _setNeedsUpdate];
}

- (void)_updateIfNeeded
{
  if ([(PXPinchTracker *)self _needsUpdate])
  {
    [(PXPinchTracker *)self _updateInitialValuesIfNeeded];
    [(PXPinchTracker *)self _updateGeometryIfNeeded];
    if ([(PXPinchTracker *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2 object:self file:@"PXPinchTracker.m" lineNumber:211 description:@"update still needed after update pass"];
    }
  }
}

- (void)_setNeedsUpdate
{
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.initialValues || self->_needsUpdateFlags.geometry;
}

- (void)setPinchLocation2:(CGPoint)a3
{
  if (a3.x != self->_pinchLocation2.x || a3.y != self->_pinchLocation2.y)
  {
    self->_pinchLocation2 = a3;
    PXPointIsNull();
  }
}

- (void)setPinchLocation1:(CGPoint)a3
{
  if (a3.x != self->_pinchLocation1.x || a3.y != self->_pinchLocation1.y)
  {
    self->_pinchLocation1 = a3;
    PXPointIsNull();
  }
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXPinchTracker;
  [(PXPinchTracker *)&v3 didPerformChanges];
  [(PXPinchTracker *)self _updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXPinchTracker;
  [(PXPinchTracker *)&v3 performChanges:a3];
}

- (void)_transformPinchLocation1:(CGPoint)a3 location2:(CGPoint)a4 intoCenter:(CGPoint *)a5 distance:(double *)a6 angle:(double *)a7
{
}

- (void)_setScaleDirection:(int64_t)a3
{
  if (self->_scaleDirection != a3)
  {
    self->_scaleDirection = a3;
    [(PXPinchTracker *)self signalChange:32];
  }
}

- (void)_setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_double scale = a3;
    [(PXPinchTracker *)self signalChange:16];
  }
}

- (void)_setVelocity:(PXDisplayVelocity)a3
{
  if (a3.x != self->_velocity.x
    || a3.y != self->_velocity.y
    || a3.scale != self->_velocity.scale
    || a3.rotation != self->_velocity.rotation)
  {
    self->_velocitdouble y = a3;
    [(PXPinchTracker *)self signalChange:8];
  }
}

- (void)_setTransform:(CGAffineTransform *)a3
{
  p_transform = &self->_transform;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a3->tx;
  long long v7 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tdouble x = *(_OWORD *)&self->_transform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_transform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_transform->tdouble x = v9;
    *(_OWORD *)&p_transform->a = v8;
    [(PXPinchTracker *)self signalChange:4];
  }
}

- (void)_setSize:(CGSize)a3
{
  if (a3.width != self->_size.width || a3.height != self->_size.height)
  {
    self->_size = a3;
    [(PXPinchTracker *)self signalChange:2];
  }
}

- (void)_setCenter:(CGPoint)a3
{
  if (a3.x != self->_center.x || a3.y != self->_center.y)
  {
    self->_center = a3;
    [(PXPinchTracker *)self signalChange:1];
  }
}

- (PXPinchTracker)initWithCenter:(CGPoint)a3 size:(CGSize)a4 transform:(CGAffineTransform *)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v24.receiver = self;
  v24.super_class = (Class)PXPinchTracker;
  CGAffineTransform v10 = [(PXPinchTracker *)&v24 init];
  v11 = v10;
  if (v10)
  {
    *((CGFloat *)v10 + 51) = x;
    *((CGFloat *)v10 + 52) = y;
    *((CGFloat *)v10 + 53) = width;
    *((CGFloat *)v10 + 54) = height;
    long long v12 = *(_OWORD *)&a5->a;
    long long v13 = *(_OWORD *)&a5->tx;
    *(_OWORD *)(v10 + 488) = *(_OWORD *)&a5->c;
    *(_OWORD *)(v10 + 504) = v13;
    *(_OWORD *)(v10 + 472) = v12;
    long long v14 = *(_OWORD *)off_1E5DAB000;
    *(_OWORD *)(v10 + 376) = *(_OWORD *)off_1E5DAB000;
    *(_OWORD *)(v10 + 392) = v14;
    uint64_t v15 = +[PXVelocityNumberFilter gestureVelocityFilter];
    v16 = (void *)v11[36];
    v11[36] = v15;

    uint64_t v17 = +[PXVelocityNumberFilter gestureVelocityFilter];
    v18 = (void *)v11[37];
    v11[37] = v17;

    uint64_t v19 = +[PXVelocityNumberFilter gestureVelocityFilter];
    v20 = (void *)v11[38];
    v11[38] = v19;

    uint64_t v21 = +[PXVelocityNumberFilter gestureVelocityFilter];
    v22 = (void *)v11[39];
    v11[39] = v21;

    PXDegreesToRadians();
  }
  return 0;
}

- (PXPinchTracker)init
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return -[PXPinchTracker initWithCenter:size:transform:](self, "initWithCenter:size:transform:", v8, v2, v3, v4, v5);
}

@end