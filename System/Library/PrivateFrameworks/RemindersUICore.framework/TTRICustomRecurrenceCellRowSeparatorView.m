@interface TTRICustomRecurrenceCellRowSeparatorView
- (BOOL)vibrant;
- (void)setVibrant:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation TTRICustomRecurrenceCellRowSeparatorView

- (void)tintColorDidChange
{
  if ([(TTRICustomRecurrenceCellRowSeparatorView *)self vibrant])
  {
    id v3 = [(TTRICustomRecurrenceCellRowSeparatorView *)self tintColor];
    [(TTRICustomRecurrenceCellRowSeparatorView *)self setBackgroundColor:v3];
  }
}

- (BOOL)vibrant
{
  return self->_vibrant;
}

- (void)setVibrant:(BOOL)a3
{
  self->_vibrant = a3;
}

@end