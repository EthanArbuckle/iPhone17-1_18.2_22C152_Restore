@interface PBSqueezeFilter
- (BOOL)needsWrapMirror;
- (CGPoint)inputPoint;
- (float)inputAmount;
- (id)ciFilterName;
- (void)applyParametersToCIFilter:(BOOL)a3 extent:(CGRect)a4;
- (void)setDefaults;
- (void)setInputAmount:(float)a3;
- (void)setInputPoint:(CGPoint)a3;
@end

@implementation PBSqueezeFilter

- (void)setDefaults
{
  -[PBSqueezeFilter setInputPoint:](self, "setInputPoint:", 0.5, 0.5);
  LODWORD(v3) = 0.5;
  [(PBSqueezeFilter *)self setInputAmount:v3];
  self->firstTime = 1;
  [(CIFilter *)self->super._ciFilter setDefaults];
  v4.receiver = self;
  v4.super_class = (Class)PBSqueezeFilter;
  [(PBFilter *)&v4 setDefaults];
}

- (float)inputAmount
{
  return self->_inputAmount;
}

- (void)setInputAmount:(float)a3
{
  float v3 = fmin(fmax(a3, 0.1), 1.0);
  self->_inputAmount = v3;
}

- (void)applyParametersToCIFilter:(BOOL)a3 extent:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  BOOL v6 = a3;
  [(PBSqueezeFilter *)self inputPoint];
  double v9 = v8;
  [(PBSqueezeFilter *)self inputPoint];
  double v11 = 1.0 - v10;
  if (v6) {
    double v11 = v10;
  }
  float v12 = width * v9;
  float v13 = height * v11;
  if (!self->firstTime && self->lastInputX == v12 && self->lastInputY == v13)
  {
    BOOL v14 = 1;
  }
  else
  {
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", [MEMORY[0x263F00680] vectorWithX:v12 Y:v13], @"inputCenter");
    self->lastInputX = v12;
    self->lastInputY = v13;
    BOOL v14 = !self->firstTime;
  }
  float v15 = hypot(width, height);
  float inputAmount = self->_inputAmount;
  float v17 = (float)(inputAmount * v15) * 0.215;
  double v18 = inputAmount * 1.413;
  float v19 = v18;
  if ((!v14 || self->lastInputRadius != v17)
    && (*(float *)&double v18 = v17,
        -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", [NSNumber numberWithFloat:v18], @"inputRadius"), self->lastInputRadius = v17, self->firstTime)|| self->lastInputScale != v19)
  {
    *(float *)&double v18 = v19;
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", [NSNumber numberWithFloat:v18], @"inputScale");
    self->lastInputScale = v19;
  }
  self->firstTime = 0;
}

- (id)ciFilterName
{
  return @"CIPinchDistortion";
}

- (BOOL)needsWrapMirror
{
  return 1;
}

- (CGPoint)inputPoint
{
  objc_copyStruct(v4, &self->inputPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setInputPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->inputPoint, &v3, 16, 1, 0);
}

@end