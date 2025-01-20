@interface SBSColor
+ (BOOL)supportsSecureCoding;
- (NSData)data;
- (SBSColor)initWithCoder:(id)a3;
- (SBSColor)initWithData:(id)a3;
- (SBSColor)initWithRed:(float)a3 green:(float)a4 blue:(float)a5;
- (float)blueComponent;
- (float)greenComponent;
- (float)redComponent;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBSColor

- (float)blueComponent
{
  return self->_blueComponent;
}

- (float)greenComponent
{
  return self->_greenComponent;
}

- (float)redComponent
{
  return self->_redComponent;
}

- (SBSColor)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeFloatForKey:@"redComponent"];
  int v6 = v5;
  [v4 decodeFloatForKey:@"greenComponent"];
  int v8 = v7;
  [v4 decodeFloatForKey:@"blueComponent"];
  int v10 = v9;

  v11 = [SBSColor alloc];
  LODWORD(v12) = v6;
  LODWORD(v13) = v8;
  LODWORD(v14) = v10;
  v15 = [(SBSColor *)v11 initWithRed:v12 green:v13 blue:v14];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  float redComponent = self->_redComponent;
  id v8 = a3;
  *(float *)&double v5 = redComponent;
  [v8 encodeFloat:@"redComponent" forKey:v5];
  *(float *)&double v6 = self->_greenComponent;
  [v8 encodeFloat:@"greenComponent" forKey:v6];
  *(float *)&double v7 = self->_blueComponent;
  [v8 encodeFloat:@"blueComponent" forKey:v7];
}

- (SBSColor)initWithRed:(float)a3 green:(float)a4 blue:(float)a5
{
  v15.receiver = self;
  v15.super_class = (Class)SBSColor;
  result = [(SBSColor *)&v15 init];
  if (result)
  {
    __asm { FMOV            V1.2S, #1.0 }
    *(int8x8_t *)&result->_float redComponent = vbic_s8(vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)__PAIR64__(LODWORD(a4), LODWORD(a3)), _D1), (int8x8_t)_D1, (int8x8_t)__PAIR64__(LODWORD(a4), LODWORD(a3))), (int8x8_t)vcltz_f32((float32x2_t)__PAIR64__(LODWORD(a4), LODWORD(a3))));
    float v12 = 1.0;
    if (a5 <= 1.0) {
      float v12 = a5;
    }
    if (a5 < 0.0) {
      float v12 = 0.0;
    }
    result->_blueComponent = v12;
  }
  return result;
}

- (SBSColor)initWithData:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08928];
  id v5 = a3;
  uint64_t v9 = 0;
  double v6 = [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v9];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    double v7 = v6;
  }
  else {
    double v7 = 0;
  }

  return v7;
}

- (NSData)data
{
  return (NSData *)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end