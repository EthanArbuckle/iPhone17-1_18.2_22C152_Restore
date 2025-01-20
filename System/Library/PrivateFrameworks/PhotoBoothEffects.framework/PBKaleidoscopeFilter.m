@interface PBKaleidoscopeFilter
- (BOOL)allowAbsoluteGestures;
- (BOOL)needsWrapMirror;
- (CGPoint)inputPoint;
- (float)inputAmount;
- (float)inputRotation;
- (id)ciFilterName;
- (void)applyParametersToCIFilter:(BOOL)a3 extent:(CGRect)a4;
- (void)setDefaults;
- (void)setInputAmount:(float)a3;
- (void)setInputPoint:(CGPoint)a3;
- (void)setInputRotation:(float)a3;
@end

@implementation PBKaleidoscopeFilter

- (BOOL)allowAbsoluteGestures
{
  return 0;
}

- (void)setDefaults
{
  -[PBKaleidoscopeFilter setInputPoint:](self, "setInputPoint:", 0.5, 0.5);
  LODWORD(v3) = -1095253570;
  [(PBKaleidoscopeFilter *)self setInputRotation:v3];
  LODWORD(v4) = 1060320051;
  [(PBKaleidoscopeFilter *)self setInputAmount:v4];
  self->firstTime = 1;
  [(CIFilter *)self->super._ciFilter setDefaults];
  v5.receiver = self;
  v5.super_class = (Class)PBKaleidoscopeFilter;
  [(PBFilter *)&v5 setDefaults];
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
  double height = a4.size.height;
  double width = a4.size.width;
  [(PBKaleidoscopeFilter *)self inputPoint];
  double v9 = v8;
  [(PBKaleidoscopeFilter *)self inputPoint];
  double v11 = v10;
  if (a3)
  {
    if (self->firstTime
      || (float lastInputRotation = self->lastInputRotation,
          [(PBKaleidoscopeFilter *)self inputRotation],
          lastInputRotation != v13))
    {
      ciFilter = self->super._ciFilter;
      v15 = NSNumber;
      [(PBKaleidoscopeFilter *)self inputRotation];
      -[CIFilter setValue:forKey:](ciFilter, "setValue:forKey:", objc_msgSend(v15, "numberWithFloat:"), @"inputRotation");
      [(PBKaleidoscopeFilter *)self inputRotation];
LABEL_8:
      self->float lastInputRotation = v16;
    }
  }
  else
  {
    double v11 = 1.0 - v10;
    if (self->firstTime
      || (float v17 = self->lastInputRotation, [(PBKaleidoscopeFilter *)self inputRotation],
                                         v17 != (float)-v18))
    {
      v19 = self->super._ciFilter;
      v20 = NSNumber;
      [(PBKaleidoscopeFilter *)self inputRotation];
      *(float *)&double v22 = -v21;
      -[CIFilter setValue:forKey:](v19, "setValue:forKey:", [v20 numberWithFloat:v22], @"inputRotation");
      [(PBKaleidoscopeFilter *)self inputRotation];
      float v16 = -v23;
      goto LABEL_8;
    }
  }
  float v24 = width * v9;
  double v25 = height * v11;
  float v26 = height * v11;
  if (!self->firstTime && self->lastInputX == v24 && self->lastInputY == v26)
  {
    BOOL v27 = 1;
  }
  else
  {
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", [MEMORY[0x263F00680] vectorWithX:v24 Y:v26], @"inputPoint");
    self->lastInputX = v24;
    self->lastInputY = v26;
    BOOL v27 = !self->firstTime;
  }
  float inputAmount = self->_inputAmount;
  if (width >= height) {
    double v29 = height;
  }
  else {
    double v29 = width;
  }
  double v30 = v29 * inputAmount * 1.73205081;
  float v31 = v30 * 0.5;
  if (v27 && self->lastInputSize == v31)
  {
    float v32 = (float)(inputAmount * -0.1) + 0.95;
  }
  else
  {
    *(float *)&double v25 = v30 * 0.5;
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", [NSNumber numberWithFloat:v25], @"inputSize");
    self->lastInputSize = v31;
    float v32 = (float)(self->_inputAmount * -0.1) + 0.95;
    if (self->firstTime)
    {
LABEL_22:
      *(float *)&double v25 = v32;
      -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", [NSNumber numberWithFloat:v25], @"inputDecay");
      self->lastInputDecay = v32;
      goto LABEL_23;
    }
  }
  if (self->lastInputDecay != v32) {
    goto LABEL_22;
  }
LABEL_23:
  self->firstTime = 0;
}

- (id)ciFilterName
{
  return @"CITriangleKaleidoscope";
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

- (float)inputRotation
{
  return self->inputRotation;
}

- (void)setInputRotation:(float)a3
{
  self->inputRotation = a3;
}

@end