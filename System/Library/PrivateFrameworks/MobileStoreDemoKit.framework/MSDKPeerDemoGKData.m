@interface MSDKPeerDemoGKData
+ (BOOL)supportsSecureCoding;
- (BOOL)dataValid;
- (MSDKPeerDemoGKData)init;
- (MSDKPeerDemoGKData)initWithCoder:(id)a3;
- (float)offsetFromToleranceX;
- (float)offsetFromToleranceY;
- (float)offsetFromToleranceZ;
- (float)reliefBoxSpaceMM;
- (float)reliefTotalBoxSpaceMM;
- (id)description;
- (void)addOffsetFromTolerance:(MSDKPeerDemoGKData *)self;
- (void)encodeWithCoder:(id)a3;
- (void)markAsValid;
- (void)setDataValid:(BOOL)a3;
- (void)setOffsetFromToleranceX:(float)a3;
- (void)setOffsetFromToleranceY:(float)a3;
- (void)setOffsetFromToleranceZ:(float)a3;
- (void)setReliefBoxSpaceMM:(float)a3;
- (void)setReliefTotalBoxSpaceMM:(float)a3;
@end

@implementation MSDKPeerDemoGKData

- (MSDKPeerDemoGKData)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDKPeerDemoGKData;
  v2 = [(MSDKPeerDemoGKData *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MSDKPeerDemoGKData *)v2 setDataValid:0];
    [(MSDKPeerDemoGKData *)v3 setReliefBoxSpaceMM:0.0];
    [(MSDKPeerDemoGKData *)v3 setReliefTotalBoxSpaceMM:0.0];
    [(MSDKPeerDemoGKData *)v3 setOffsetFromToleranceX:0.0];
    [(MSDKPeerDemoGKData *)v3 setOffsetFromToleranceY:0.0];
    [(MSDKPeerDemoGKData *)v3 setOffsetFromToleranceZ:0.0];
  }
  return v3;
}

- (void)markAsValid
{
}

- (void)addOffsetFromTolerance:(MSDKPeerDemoGKData *)self
{
  long long v5 = v2;
  -[MSDKPeerDemoGKData setOffsetFromToleranceX:](self, "setOffsetFromToleranceX:");
  HIDWORD(v4) = DWORD1(v5);
  LODWORD(v4) = DWORD1(v5);
  [(MSDKPeerDemoGKData *)self setOffsetFromToleranceY:v4];
  [(MSDKPeerDemoGKData *)self setOffsetFromToleranceZ:COERCE_DOUBLE(__PAIR64__(DWORD1(v5), DWORD2(v5)))];
}

- (id)description
{
  v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  BOOL v6 = [(MSDKPeerDemoGKData *)self dataValid];
  [(MSDKPeerDemoGKData *)self reliefBoxSpaceMM];
  double v8 = v7;
  [(MSDKPeerDemoGKData *)self reliefTotalBoxSpaceMM];
  double v10 = v9;
  [(MSDKPeerDemoGKData *)self offsetFromToleranceX];
  double v12 = v11;
  [(MSDKPeerDemoGKData *)self offsetFromToleranceY];
  double v14 = v13;
  [(MSDKPeerDemoGKData *)self offsetFromToleranceZ];
  v16 = [v3 stringWithFormat:@"<%@[%p]: DataValid=%d reliefBoxSpaceMM=%f totalReliefBoxSpaceMM=%f offsetFromTolerance=(%f,%f,%f)>", v5, self, v6, *(void *)&v8, *(void *)&v10, *(void *)&v12, *(void *)&v14, v15];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoGKData)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSDKPeerDemoGKData;
  long long v5 = [(MSDKPeerDemoGKData *)&v13 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataValid"];
    -[MSDKPeerDemoGKData setDataValid:](v5, "setDataValid:", [v6 BOOLValue]);

    float v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reliefBoxSpaceMM"];
    [v7 floatValue];
    -[MSDKPeerDemoGKData setReliefBoxSpaceMM:](v5, "setReliefBoxSpaceMM:");

    double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reliefTotalBoxSpaceMM"];
    [v8 floatValue];
    -[MSDKPeerDemoGKData setReliefTotalBoxSpaceMM:](v5, "setReliefTotalBoxSpaceMM:");

    float v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offsetFromToleranceX"];
    [v9 floatValue];
    -[MSDKPeerDemoGKData setOffsetFromToleranceX:](v5, "setOffsetFromToleranceX:");

    double v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offsetFromToleranceY"];
    [v10 floatValue];
    -[MSDKPeerDemoGKData setOffsetFromToleranceY:](v5, "setOffsetFromToleranceY:");

    float v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offsetFromToleranceZ"];
    [v11 floatValue];
    -[MSDKPeerDemoGKData setOffsetFromToleranceZ:](v5, "setOffsetFromToleranceZ:");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  BOOL v6 = objc_msgSend(v4, "numberWithBool:", -[MSDKPeerDemoGKData dataValid](self, "dataValid"));
  [v5 encodeObject:v6 forKey:@"dataValid"];

  float v7 = NSNumber;
  [(MSDKPeerDemoGKData *)self reliefBoxSpaceMM];
  double v8 = objc_msgSend(v7, "numberWithFloat:");
  [v5 encodeObject:v8 forKey:@"reliefBoxSpaceMM"];

  float v9 = NSNumber;
  [(MSDKPeerDemoGKData *)self reliefTotalBoxSpaceMM];
  double v10 = objc_msgSend(v9, "numberWithFloat:");
  [v5 encodeObject:v10 forKey:@"reliefTotalBoxSpaceMM"];

  float v11 = NSNumber;
  [(MSDKPeerDemoGKData *)self offsetFromToleranceX];
  double v12 = objc_msgSend(v11, "numberWithFloat:");
  [v5 encodeObject:v12 forKey:@"offsetFromToleranceX"];

  objc_super v13 = NSNumber;
  [(MSDKPeerDemoGKData *)self offsetFromToleranceY];
  double v14 = objc_msgSend(v13, "numberWithFloat:");
  [v5 encodeObject:v14 forKey:@"offsetFromToleranceY"];

  float v15 = NSNumber;
  [(MSDKPeerDemoGKData *)self offsetFromToleranceZ];
  objc_msgSend(v15, "numberWithFloat:");
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v16 forKey:@"offsetFromToleranceZ"];
}

- (BOOL)dataValid
{
  return self->_dataValid;
}

- (void)setDataValid:(BOOL)a3
{
  self->_dataValid = a3;
}

- (float)reliefBoxSpaceMM
{
  return self->_reliefBoxSpaceMM;
}

- (void)setReliefBoxSpaceMM:(float)a3
{
  self->_reliefBoxSpaceMM = a3;
}

- (float)reliefTotalBoxSpaceMM
{
  return self->_reliefTotalBoxSpaceMM;
}

- (void)setReliefTotalBoxSpaceMM:(float)a3
{
  self->_reliefTotalBoxSpaceMM = a3;
}

- (float)offsetFromToleranceX
{
  return self->_offsetFromToleranceX;
}

- (void)setOffsetFromToleranceX:(float)a3
{
  self->_offsetFromToleranceX = a3;
}

- (float)offsetFromToleranceY
{
  return self->_offsetFromToleranceY;
}

- (void)setOffsetFromToleranceY:(float)a3
{
  self->_offsetFromToleranceY = a3;
}

- (float)offsetFromToleranceZ
{
  return self->_offsetFromToleranceZ;
}

- (void)setOffsetFromToleranceZ:(float)a3
{
  self->_offsetFromToleranceZ = a3;
}

@end