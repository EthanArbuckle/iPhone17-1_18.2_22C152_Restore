@interface PBStretchFilter
- (BOOL)needsWrapMirror;
- (CGPoint)inputPoint;
- (id)ciFilterName;
- (void)applyParametersToCIFilter:(BOOL)a3 extent:(CGRect)a4;
- (void)setDefaults;
- (void)setInputPoint:(CGPoint)a3;
@end

@implementation PBStretchFilter

- (void)setDefaults
{
  -[PBStretchFilter setInputPoint:](self, "setInputPoint:", 0.5, 0.5);
  [(CIFilter *)self->super._ciFilter setDefaults];
  self->firstTime = 1;
  v3.receiver = self;
  v3.super_class = (Class)PBStretchFilter;
  [(PBFilter *)&v3 setDefaults];
}

- (void)applyParametersToCIFilter:(BOOL)a3 extent:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  BOOL v6 = a3;
  [(PBStretchFilter *)self inputPoint];
  double v9 = v8;
  [(PBStretchFilter *)self inputPoint];
  double v11 = 1.0 - v10;
  if (v6) {
    double v11 = v10;
  }
  float v12 = width * v9;
  float v13 = height * v11;
  if (self->firstTime || self->lastInputX != v12 || self->lastInputY != v13)
  {
    uint64_t v14 = [MEMORY[0x263F00680] vectorWithX:v12 Y:v13];
    uint64_t v15 = [MEMORY[0x263F00680] vectorWithX:width Y:height];
    [(CIFilter *)self->super._ciFilter setValue:v14 forKey:@"inputPoint"];
    [(CIFilter *)self->super._ciFilter setValue:v15 forKey:@"inputSize"];
    self->lastInputX = v12;
    self->lastInputY = v13;
  }
  self->firstTime = 0;
}

- (id)ciFilterName
{
  return @"CIStretch";
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