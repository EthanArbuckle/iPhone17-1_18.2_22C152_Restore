@interface TTRIRowSeparatorView
- (BOOL)isVibrant;
- (void)setIsVibrant:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation TTRIRowSeparatorView

- (void)tintColorDidChange
{
  if ([(TTRIRowSeparatorView *)self isVibrant])
  {
    id v3 = [(TTRIRowSeparatorView *)self tintColor];
    [(TTRIRowSeparatorView *)self setBackgroundColor:v3];
  }
}

- (BOOL)isVibrant
{
  return self->_isVibrant;
}

- (void)setIsVibrant:(BOOL)a3
{
  self->_isVibrant = a3;
}

@end