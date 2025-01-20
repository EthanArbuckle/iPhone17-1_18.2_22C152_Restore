@interface MSDIsEnrolledResponse
- (BOOL)isEnrolled;
- (void)setIsEnrolled:(BOOL)a3;
@end

@implementation MSDIsEnrolledResponse

- (BOOL)isEnrolled
{
  return self->_isEnrolled;
}

- (void)setIsEnrolled:(BOOL)a3
{
  self->_isEnrolled = a3;
}

@end