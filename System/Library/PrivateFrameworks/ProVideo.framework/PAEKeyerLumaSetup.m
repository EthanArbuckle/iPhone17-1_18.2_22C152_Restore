@interface PAEKeyerLumaSetup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqualTo:(id)a3;
- (PAEKeyerLumaSetup)init;
- (PAEKeyerLumaSetup)initWithCoder:(id)a3;
- (float)lumA;
- (float)lumB;
- (float)lumC;
- (float)lumD;
- (id)interpolateBetween:(id)a3 withWeight:(float)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setLumA:(float)a3;
- (void)setLumANumber:(id)a3;
- (void)setLumB:(float)a3;
- (void)setLumBNumber:(id)a3;
- (void)setLumC:(float)a3;
- (void)setLumCNumber:(id)a3;
- (void)setLumD:(float)a3;
- (void)setLumDNumber:(id)a3;
@end

@implementation PAEKeyerLumaSetup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setLumANumber:(id)a3
{
  id v5 = a3;

  self->_lumA = (NSNumber *)a3;
}

- (void)setLumBNumber:(id)a3
{
  id v5 = a3;

  self->_lumB = (NSNumber *)a3;
}

- (void)setLumCNumber:(id)a3
{
  id v5 = a3;

  self->_lumC = (NSNumber *)a3;
}

- (void)setLumDNumber:(id)a3
{
  id v5 = a3;

  self->_lumD = (NSNumber *)a3;
}

- (PAEKeyerLumaSetup)init
{
  v12.receiver = self;
  v12.super_class = (Class)PAEKeyerLumaSetup;
  v2 = [(PAEKeyerLumaSetup *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc(NSNumber);
    LODWORD(v4) = -1.0;
    v2->_lumA = (NSNumber *)[v3 initWithFloat:v4];
    id v5 = objc_alloc(NSNumber);
    LODWORD(v6) = -0.5;
    v2->_lumB = (NSNumber *)[v5 initWithFloat:v6];
    id v7 = objc_alloc(NSNumber);
    LODWORD(v8) = 0.5;
    v2->_lumC = (NSNumber *)[v7 initWithFloat:v8];
    id v9 = objc_alloc(NSNumber);
    LODWORD(v10) = 1.0;
    v2->_lumD = (NSNumber *)[v9 initWithFloat:v10];
  }
  return v2;
}

- (PAEKeyerLumaSetup)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PAEKeyerLumaSetup;
  double v4 = [(PAEKeyerLumaSetup *)&v6 init];
  if (v4)
  {
    -[PAEKeyerLumaSetup setLumANumber:](v4, "setLumANumber:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"LumA"]);
    -[PAEKeyerLumaSetup setLumBNumber:](v4, "setLumBNumber:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"LumB"]);
    -[PAEKeyerLumaSetup setLumCNumber:](v4, "setLumCNumber:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"LumC"]);
    -[PAEKeyerLumaSetup setLumDNumber:](v4, "setLumDNumber:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"LumD"]);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PAEKeyerLumaSetup;
  [(PAEKeyerLumaSetup *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_lumA forKey:@"LumA"];
  [a3 encodeObject:self->_lumB forKey:@"LumB"];
  [a3 encodeObject:self->_lumC forKey:@"LumC"];
  lumD = self->_lumD;

  [a3 encodeObject:lumD forKey:@"LumD"];
}

- (float)lumA
{
  [(NSNumber *)self->_lumA floatValue];
  return result;
}

- (float)lumB
{
  [(NSNumber *)self->_lumB floatValue];
  return result;
}

- (float)lumC
{
  [(NSNumber *)self->_lumC floatValue];
  return result;
}

- (float)lumD
{
  [(NSNumber *)self->_lumD floatValue];
  return result;
}

- (void)setLumA:(float)a3
{
  *(float *)&double v5 = a3;
  self->_lumA = (NSNumber *)(id)[NSNumber numberWithFloat:v5];
}

- (void)setLumB:(float)a3
{
  *(float *)&double v5 = a3;
  self->_lumB = (NSNumber *)(id)[NSNumber numberWithFloat:v5];
}

- (void)setLumC:(float)a3
{
  *(float *)&double v5 = a3;
  self->_lumC = (NSNumber *)(id)[NSNumber numberWithFloat:v5];
}

- (void)setLumD:(float)a3
{
  *(float *)&double v5 = a3;
  self->_lumD = (NSNumber *)(id)[NSNumber numberWithFloat:v5];
}

- (id)interpolateBetween:(id)a3 withWeight:(float)a4
{
  id v7 = objc_alloc_init(PAEKeyerLumaSetup);
  [(PAEKeyerLumaSetup *)self lumA];
  float v9 = v8;
  [(PAEKeyerLumaSetup *)self lumB];
  float v11 = v10;
  [(PAEKeyerLumaSetup *)self lumC];
  float v27 = v12;
  [(PAEKeyerLumaSetup *)self lumD];
  float v28 = v13;
  [a3 lumA];
  float v15 = v14;
  [a3 lumB];
  float v17 = v16;
  [a3 lumC];
  float v19 = v18;
  [a3 lumD];
  float v21 = v20;
  *(float *)&double v22 = (float)((float)(1.0 - a4) * v9) + (float)(v15 * a4);
  [(PAEKeyerLumaSetup *)v7 setLumA:v22];
  *(float *)&double v23 = (float)((float)(1.0 - a4) * v11) + (float)(v17 * a4);
  [(PAEKeyerLumaSetup *)v7 setLumB:v23];
  *(float *)&double v24 = (float)((float)(1.0 - a4) * v27) + (float)(v19 * a4);
  [(PAEKeyerLumaSetup *)v7 setLumC:v24];
  *(float *)&double v25 = (float)((float)(1.0 - a4) * v28) + (float)(v21 * a4);
  [(PAEKeyerLumaSetup *)v7 setLumD:v25];
  return v7;
}

- (BOOL)isEqualTo:(id)a3
{
  [(PAEKeyerLumaSetup *)self lumA];
  float v6 = v5;
  [a3 lumA];
  if (v6 != v7) {
    return 0;
  }
  [(PAEKeyerLumaSetup *)self lumB];
  float v9 = v8;
  [a3 lumB];
  if (v9 != v10) {
    return 0;
  }
  [(PAEKeyerLumaSetup *)self lumC];
  float v12 = v11;
  [a3 lumC];
  if (v12 == v13 && (-[PAEKeyerLumaSetup lumD](self, "lumD"), float v15 = v14, [a3 lumD], v15 == v16)) {
    return 1;
  }
  else {
    return 0;
  }
}

@end