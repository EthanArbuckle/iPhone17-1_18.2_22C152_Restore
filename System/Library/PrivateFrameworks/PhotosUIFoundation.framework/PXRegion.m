@interface PXRegion
- (CGPath)createPathInRect:(CGRect)a3;
- (double)opacityAtPoint:(CGPoint)a3;
- (double)valueAtPoint:(CGPoint)a3;
- (id)denormalizedWithBasisRect:(CGRect)a3;
- (id)normalizedWithBasisRect:(CGRect)a3;
- (id)transformedWithAffineTransform:(CGAffineTransform *)a3;
@end

@implementation PXRegion

- (CGPath)createPathInRect:(CGRect)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXRegion.m", 38, @"Method %s is a responsibility of subclass %@", "-[PXRegion createPathInRect:]", v7 object file lineNumber description];

  abort();
}

- (double)valueAtPoint:(CGPoint)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3.x, a3.y);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXRegion.m", 34, @"Method %s is a responsibility of subclass %@", "-[PXRegion valueAtPoint:]", v7 object file lineNumber description];

  abort();
}

- (double)opacityAtPoint:(CGPoint)a3
{
  -[PXRegion valueAtPoint:](self, "valueAtPoint:", a3.x, a3.y);
  return fmax(fmin(v3, 1.0), 0.0);
}

- (id)transformedWithAffineTransform:(CGAffineTransform *)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXRegion.m", 26, @"Method %s is a responsibility of subclass %@", "-[PXRegion transformedWithAffineTransform:]", v7 object file lineNumber description];

  abort();
}

- (id)denormalizedWithBasisRect:(CGRect)a3
{
  double v3 = -[PXRegion transformedWithAffineTransform:](self, "transformedWithAffineTransform:", v5, PXAffineTransformMakeFromRects((uint64_t)v5, 0.0, 0.0, 1.0, 1.0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));

  return v3;
}

- (id)normalizedWithBasisRect:(CGRect)a3
{
  double v3 = -[PXRegion transformedWithAffineTransform:](self, "transformedWithAffineTransform:", v5, PXAffineTransformMakeFromRects((uint64_t)v5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, 0.0, 1.0, 1.0));

  return v3;
}

@end