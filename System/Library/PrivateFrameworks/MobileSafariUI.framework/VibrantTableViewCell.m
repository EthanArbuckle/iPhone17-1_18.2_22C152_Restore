@interface VibrantTableViewCell
- (BOOL)usesVibrantEffect;
- (void)setUsesVibrantEffect:(BOOL)a3;
@end

@implementation VibrantTableViewCell

- (void)setUsesVibrantEffect:(BOOL)a3
{
  if (self->_usesVibrantEffect != a3)
  {
    BOOL v3 = a3;
    self->_usesVibrantEffect = a3;
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(VibrantTableViewCell *)self setBackgroundColor:v5];

    [(VibrantTableViewCell *)self sf_setUsesVibrantSelection:v3];
  }
}

- (BOOL)usesVibrantEffect
{
  return self->_usesVibrantEffect;
}

@end