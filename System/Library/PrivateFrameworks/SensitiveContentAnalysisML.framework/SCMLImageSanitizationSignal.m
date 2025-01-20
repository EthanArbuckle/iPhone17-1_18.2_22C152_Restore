@interface SCMLImageSanitizationSignal
- (BOOL)safe;
- (NSNumber)score;
- (SCMLImageSanitizationSignal)init;
- (void)setSafe:(BOOL)a3;
- (void)setScore:(id)a3;
@end

@implementation SCMLImageSanitizationSignal

- (SCMLImageSanitizationSignal)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCMLImageSanitizationSignal;
  v2 = [(SCMLImageSanitizationSignal *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_safe = 1;
    score = v2->_score;
    v2->_score = 0;
  }
  return v3;
}

- (BOOL)safe
{
  return self->_safe;
}

- (void)setSafe:(BOOL)a3
{
  self->_safe = a3;
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end