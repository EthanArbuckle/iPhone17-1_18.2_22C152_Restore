@interface _UICalendarDecorationImageView
- (_UICalendarDecorationImageView)initWithFrame:(CGRect)a3;
- (int64_t)decorationSize;
- (void)_updateSymbolConfiguration;
- (void)setDecorationSize:(int64_t)a3;
@end

@implementation _UICalendarDecorationImageView

- (_UICalendarDecorationImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UICalendarDecorationImageView;
  v3 = -[UIImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_decorationSize = 1;
    [(_UICalendarDecorationImageView *)v3 _updateSymbolConfiguration];
  }
  return v4;
}

- (void)setDecorationSize:(int64_t)a3
{
  if (self->_decorationSize != a3)
  {
    self->_decorationSize = a3;
    [(_UICalendarDecorationImageView *)self _updateSymbolConfiguration];
  }
}

- (void)_updateSymbolConfiguration
{
  unint64_t v3 = [(_UICalendarDecorationImageView *)self decorationSize];
  if (v3 < 3) {
    uint64_t v4 = v3 + 1;
  }
  else {
    uint64_t v4 = -1;
  }
  id v5 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleCaption2" scale:v4];
  [(UIImageView *)self setPreferredSymbolConfiguration:v5];
}

- (int64_t)decorationSize
{
  return self->_decorationSize;
}

@end