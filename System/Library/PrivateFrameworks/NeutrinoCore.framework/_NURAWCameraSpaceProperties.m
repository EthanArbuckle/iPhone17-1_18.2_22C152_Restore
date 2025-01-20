@interface _NURAWCameraSpaceProperties
- (NSArray)xyzToCamera1;
- (NSArray)xyzToCamera2;
- (double)whiteFactor;
- (double)whiteValue;
- (id)description;
- (void)setWhiteFactor:(double)a3;
- (void)setWhiteValue:(double)a3;
- (void)setXyzToCamera1:(id)a3;
- (void)setXyzToCamera2:(id)a3;
@end

@implementation _NURAWCameraSpaceProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xyzToCamera2, 0);

  objc_storeStrong((id *)&self->_xyzToCamera1, 0);
}

- (void)setWhiteFactor:(double)a3
{
  self->_whiteFactor = a3;
}

- (double)whiteFactor
{
  return self->_whiteFactor;
}

- (void)setWhiteValue:(double)a3
{
  self->_whiteValue = a3;
}

- (double)whiteValue
{
  return self->_whiteValue;
}

- (void)setXyzToCamera2:(id)a3
{
}

- (NSArray)xyzToCamera2
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXyzToCamera1:(id)a3
{
}

- (NSArray)xyzToCamera1
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_NURAWCameraSpaceProperties *)self xyzToCamera1];
  v6 = [(_NURAWCameraSpaceProperties *)self xyzToCamera2];
  [(_NURAWCameraSpaceProperties *)self whiteValue];
  uint64_t v8 = v7;
  [(_NURAWCameraSpaceProperties *)self whiteFactor];
  v10 = [v3 stringWithFormat:@"<%@:%p> xyzToCamera1=%@ xyzToCamera2=%@ whiteValue=%f whiteFactor=%f", v4, self, v5, v6, v8, v9];

  return v10;
}

@end