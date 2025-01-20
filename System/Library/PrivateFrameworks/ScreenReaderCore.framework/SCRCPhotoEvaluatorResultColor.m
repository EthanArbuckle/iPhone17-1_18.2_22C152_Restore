@interface SCRCPhotoEvaluatorResultColor
- (SCRCPhotoEvaluatorResultColor)initWithRedLevel:(double)a3 blueLevel:(double)a4 greenLevel:(double)a5;
- (double)blueLevel;
- (double)greenLevel;
- (double)redLevel;
- (id)humanReadableResult;
@end

@implementation SCRCPhotoEvaluatorResultColor

- (SCRCPhotoEvaluatorResultColor)initWithRedLevel:(double)a3 blueLevel:(double)a4 greenLevel:(double)a5
{
  v12.receiver = self;
  v12.super_class = (Class)SCRCPhotoEvaluatorResultColor;
  v8 = [(SCRCPhotoEvaluatorResultColor *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_redLevel = a3;
    v8->_blueLevel = a4;
    v8->_greenLevel = a5;
    v10 = v8;
  }

  return v9;
}

- (id)humanReadableResult
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"rgb %2.2f %2.2f %2.2f 1.00", *(void *)&self->_redLevel, *(void *)&self->_greenLevel, *(void *)&self->_blueLevel);
}

- (double)redLevel
{
  return self->_redLevel;
}

- (double)blueLevel
{
  return self->_blueLevel;
}

- (double)greenLevel
{
  return self->_greenLevel;
}

@end