@interface PBLightTunnelFilter
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

@implementation PBLightTunnelFilter

- (void)setDefaults
{
  -[PBLightTunnelFilter setInputPoint:](self, "setInputPoint:", 0.5, 0.5);
  LODWORD(v3) = 0.5;
  [(PBLightTunnelFilter *)self setInputAmount:v3];
  [(PBLightTunnelFilter *)self setInputRotation:0.0];
  self->firstTime = 1;
  [(CIFilter *)self->super._ciFilter setDefaults];
  v4.receiver = self;
  v4.super_class = (Class)PBLightTunnelFilter;
  [(PBFilter *)&v4 setDefaults];
}

- (float)inputAmount
{
  return self->_inputAmount;
}

- (void)setInputAmount:(float)a3
{
  float v3 = fmin(fmax(a3, 0.2), 1.0);
  self->_inputAmount = v3;
}

- (void)applyParametersToCIFilter:(BOOL)a3 extent:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  [(PBLightTunnelFilter *)self inputPoint];
  double v9 = v8;
  [(PBLightTunnelFilter *)self inputPoint];
  double v11 = v10;
  if (a3)
  {
    if (self->firstTime
      || (float lastInputRotation = self->lastInputRotation,
          [(PBLightTunnelFilter *)self inputRotation],
          lastInputRotation != v13))
    {
      ciFilter = self->super._ciFilter;
      v15 = NSNumber;
      [(PBLightTunnelFilter *)self inputRotation];
      -[CIFilter setValue:forKey:](ciFilter, "setValue:forKey:", objc_msgSend(v15, "numberWithFloat:"), @"inputRotation");
      [(PBLightTunnelFilter *)self inputRotation];
LABEL_8:
      self->float lastInputRotation = v16;
    }
  }
  else
  {
    double v11 = 1.0 - v10;
    if (self->firstTime
      || (float v17 = self->lastInputRotation, [(PBLightTunnelFilter *)self inputRotation], v17 != (float)-v18))
    {
      v19 = self->super._ciFilter;
      v20 = NSNumber;
      [(PBLightTunnelFilter *)self inputRotation];
      *(float *)&double v22 = -v21;
      -[CIFilter setValue:forKey:](v19, "setValue:forKey:", [v20 numberWithFloat:v22], @"inputRotation");
      [(PBLightTunnelFilter *)self inputRotation];
      float v16 = -v23;
      goto LABEL_8;
    }
  }
  float v24 = width * v9;
  float v25 = height * v11;
  if (self->firstTime || self->lastInputX != v24 || self->lastInputY != v25)
  {
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", [MEMORY[0x263F00680] vectorWithX:v24 Y:v25], @"inputCenter");
    self->lastInputX = v24;
    self->lastInputY = v25;
  }
  [(PBLightTunnelFilter *)self inputAmount];
  double v27 = fmin(width, height) * 0.5 * v26;
  float v28 = v27;
  if (self->firstTime || self->lastInputRadius != v28)
  {
    *(float *)&double v27 = v27;
    -[CIFilter setValue:forKey:](self->super._ciFilter, "setValue:forKey:", [NSNumber numberWithFloat:v27], @"inputRadius");
    self->lastInputRadius = v28;
  }
  self->firstTime = 0;
}

- (id)ciFilterName
{
  return @"CILightTunnel";
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