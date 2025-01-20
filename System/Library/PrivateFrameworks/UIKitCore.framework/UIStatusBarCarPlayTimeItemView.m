@interface UIStatusBarCarPlayTimeItemView
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (double)extraLeftPadding;
- (double)extraRightPadding;
- (double)neededSizeForImageSet:(id)a3;
- (id)_timeImageSet;
- (id)_timeImageSetForColor:(id)a3;
- (int64_t)textStyle;
@end

@implementation UIStatusBarCarPlayTimeItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5 = [a3 rawData];
  v6 = (void *)[[NSString alloc] initWithCString:v5 + 46 encoding:4];
  p_timeString = &self->_timeString;
  char v8 = [v6 isEqualToString:*p_timeString];
  if ((v8 & 1) == 0) {
    objc_storeStrong((id *)p_timeString, v6);
  }

  return v8 ^ 1;
}

- (double)neededSizeForImageSet:(id)a3
{
  v4 = [(UIStatusBarCarPlayTimeItemView *)self _timeImageSet];
  v8.receiver = self;
  v8.super_class = (Class)UIStatusBarCarPlayTimeItemView;
  [(UIStatusBarItemView *)&v8 neededSizeForImageSet:v4];
  double v6 = v5;

  return v6;
}

- (int64_t)textStyle
{
  return 3;
}

- (double)extraLeftPadding
{
  v2 = [(UIStatusBarItemView *)self foregroundStyle];
  [v2 scale];

  return -4.0;
}

- (double)extraRightPadding
{
  v2 = [(UIStatusBarItemView *)self foregroundStyle];
  [v2 scale];
  double v4 = v3;

  double result = -5.0;
  if (v4 == 2.0) {
    return -4.0;
  }
  return result;
}

- (id)_timeImageSet
{
  return [(UIStatusBarCarPlayTimeItemView *)self _timeImageSetForColor:0];
}

- (id)_timeImageSetForColor:(id)a3
{
  id v4 = a3;
  double v5 = [(UIStatusBarItemView *)self imageWithText:self->_timeString];
  double v6 = v5;
  if (v4)
  {
    v7 = [v5 image];
    objc_super v8 = [v7 _flatImageWithColor:v4];

    [v6 setImage:v8];
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end