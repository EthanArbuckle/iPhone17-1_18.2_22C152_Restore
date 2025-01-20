@interface ICParticipantBaseColorValues
- (ICParticipantBaseColorValues)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (double)alphaValue;
- (double)blueValue;
- (double)greenValue;
- (double)redValue;
- (void)setAlphaValue:(double)a3;
- (void)setBlueValue:(double)a3;
- (void)setGreenValue:(double)a3;
- (void)setRedValue:(double)a3;
@end

@implementation ICParticipantBaseColorValues

- (ICParticipantBaseColorValues)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)ICParticipantBaseColorValues;
  result = [(ICParticipantBaseColorValues *)&v11 init];
  if (result)
  {
    result->_redValue = a3;
    result->_greenValue = a4;
    result->_blueValue = a5;
    result->_alphaValue = a6;
  }
  return result;
}

- (double)redValue
{
  return self->_redValue;
}

- (void)setRedValue:(double)a3
{
  self->_redValue = a3;
}

- (double)greenValue
{
  return self->_greenValue;
}

- (void)setGreenValue:(double)a3
{
  self->_greenValue = a3;
}

- (double)blueValue
{
  return self->_blueValue;
}

- (void)setBlueValue:(double)a3
{
  self->_blueValue = a3;
}

- (double)alphaValue
{
  return self->_alphaValue;
}

- (void)setAlphaValue:(double)a3
{
  self->_alphaValue = a3;
}

@end