@interface _RCPEventActionSetPointerLocation
- (CGPoint)modelPoint;
- (_RCPEventActionSetPointerLocation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)play;
- (void)setModelPoint:(CGPoint)a3;
@end

@implementation _RCPEventActionSetPointerLocation

- (_RCPEventActionSetPointerLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_RCPEventActionSetPointerLocation;
  v5 = [(RCPEventAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"modelPointX"];
    v5->_modelPoint.x = v6;
    [v4 decodeDoubleForKey:@"modelPointY"];
    v5->_modelPoint.y = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = (double *)self;
  v5.receiver = self;
  v5.super_class = (Class)_RCPEventActionSetPointerLocation;
  id v4 = a3;
  [(RCPEventAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"modelPointX", *++v3, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"modelPointY" forKey:v3[1]];
}

- (void)play
{
  v3 = +[RCPEventEnvironment currentEnvironment];
  id v4 = [v3 screens];
  id v15 = [v4 firstObject];

  [v15 pointSize];
  double x = self->_modelPoint.x;
  double y = self->_modelPoint.y;
  double v9 = v5 * x;
  double v10 = v6 * y;
  if (_CLTLogLevel >= 2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"set model point: %g,%g -> %g,%g \n", *(void *)&x, *(void *)&y, v5 * x, v6 * y);
    id v11 = objc_claimAutoreleasedReturnValue();
    v12 = (const char *)[v11 UTF8String];
    v13 = (FILE **)MEMORY[0x1E4F143D8];
    fputs(v12, (FILE *)*MEMORY[0x1E4F143D8]);

    fflush(*v13);
  }
  v14 = [MEMORY[0x1E4F4F350] sharedInstance];
  objc_msgSend(v14, "setGlobalPointerPosition:", v9, v10);
}

- (CGPoint)modelPoint
{
  double x = self->_modelPoint.x;
  double y = self->_modelPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setModelPoint:(CGPoint)a3
{
  self->_modelPoint = a3;
}

@end