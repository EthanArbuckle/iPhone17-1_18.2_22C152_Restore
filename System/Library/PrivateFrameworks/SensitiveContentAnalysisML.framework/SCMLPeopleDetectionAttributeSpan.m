@interface SCMLPeopleDetectionAttributeSpan
- (SCMLPeopleDetectionAttributeSpan)init;
- (_NSRange)range;
- (unsigned)gender;
- (void)setGender:(unsigned int)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation SCMLPeopleDetectionAttributeSpan

- (SCMLPeopleDetectionAttributeSpan)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCMLPeopleDetectionAttributeSpan;
  v2 = [(SCMLPeopleDetectionAttributeSpan *)&v5 init];
  v3 = v2;
  if (v2) {
    -[SCMLPeopleDetectionAttributeSpan setRange:](v2, "setRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  }
  return v3;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (unsigned)gender
{
  return self->_gender;
}

- (void)setGender:(unsigned int)a3
{
  self->_gender = a3;
}

@end