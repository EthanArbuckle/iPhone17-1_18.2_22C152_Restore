@interface PBMirrorFilter
- (BOOL)needsWrapMirror;
- (CGPoint)inputPoint;
- (float)inputOrientation;
- (id)ciFilterName;
- (void)applyParametersToCIFilter:(BOOL)a3 extent:(CGRect)a4;
- (void)setDefaults;
- (void)setInputOrientation:(float)a3;
- (void)setInputPoint:(CGPoint)a3;
@end

@implementation PBMirrorFilter

- (void)setDefaults
{
  -[PBMirrorFilter setInputPoint:](self, "setInputPoint:", 0.5, 0.5);
  LODWORD(v3) = 1070141403;
  [(PBMirrorFilter *)self setInputOrientation:v3];
  self->firstTime = 1;
  [(CIFilter *)self->super._ciFilter setDefaults];
  v4.receiver = self;
  v4.super_class = (Class)PBMirrorFilter;
  [(PBFilter *)&v4 setDefaults];
}

- (void)applyParametersToCIFilter:(BOOL)a3 extent:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  BOOL v6 = a3;
  [(PBMirrorFilter *)self inputPoint];
  double v9 = v8;
  [(PBMirrorFilter *)self inputPoint];
  double v11 = 1.0 - v10;
  if (v6) {
    double v11 = v10;
  }
  float v12 = width * v9;
  float v13 = height * v11;
  if (self->firstTime || self->lastInputX != v12 || self->lastInputY != v13)
  {
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", [MEMORY[0x263F00680] vectorWithX:v12 Y:v13], @"inputPoint");
    self->lastInputX = v12;
    self->lastInputY = v13;
  }
  [(PBMirrorFilter *)self inputOrientation];
  double v15 = v14;
  double v16 = 6.28318531 - v15;
  double v17 = v15 + -3.14159265;
  if (v6) {
    double v17 = v16;
  }
  if (self->firstTime || v17 != self->lastInputAngle)
  {
    float v18 = v17;
    *(float *)&double v17 = v18;
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", [NSNumber numberWithFloat:v17], @"inputAngle");
    self->lastInputAngle = v18;
  }
  self->firstTime = 0;
}

- (id)ciFilterName
{
  return @"CIMirror";
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

- (float)inputOrientation
{
  return self->inputOrientation;
}

- (void)setInputOrientation:(float)a3
{
  self->inputOrientation = a3;
}

@end