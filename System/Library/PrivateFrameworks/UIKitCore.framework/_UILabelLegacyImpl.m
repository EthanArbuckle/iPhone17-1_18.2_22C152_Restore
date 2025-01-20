@interface _UILabelLegacyImpl
- (_UILabelLegacyImpl)init;
- (double)minimumScaleFactor;
- (void)setMinimumScaleFactor:(double)a3;
@end

@implementation _UILabelLegacyImpl

- (_UILabelLegacyImpl)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UILabelLegacyImpl;
  return [(_UILabelLegacyImpl *)&v3 init];
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (void)setMinimumScaleFactor:(double)a3
{
  float v3 = a3;
  self->_minimumScaleFactor = fmax(fminf(v3, 1.0), 0.0);
}

@end