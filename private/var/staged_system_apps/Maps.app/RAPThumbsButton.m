@interface RAPThumbsButton
+ (id)buttonWithType:(int64_t)a3;
- (void)_updateColors;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RAPThumbsButton

+ (id)buttonWithType:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___RAPThumbsButton;
  v3 = [super buttonWithType:a3];
  [v3 _updateColors];

  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)RAPThumbsButton;
  [(RAPThumbsButton *)&v4 layoutSubviews];
  [(RAPThumbsButton *)self frame];
  [(RAPThumbsButton *)self _setCornerRadius:v3 * 0.5];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RAPThumbsButton;
  [(RAPThumbsButton *)&v4 setSelected:a3];
  [(RAPThumbsButton *)self _updateColors];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RAPThumbsButton;
  [(RAPThumbsButton *)&v4 setHighlighted:a3];
  [(RAPThumbsButton *)self _updateColors];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RAPThumbsButton;
  id v4 = a3;
  [(RAPThumbsButton *)&v8 traitCollectionDidChange:v4];
  objc_super v5 = [(RAPThumbsButton *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(RAPThumbsButton *)self _updateColors];
  }
}

- (void)_updateColors
{
  if (([(RAPThumbsButton *)self isHighlighted] & 1) != 0
    || ([(RAPThumbsButton *)self isSelected] & 1) != 0)
  {
    double v3 = [(RAPThumbsButton *)self theme];
    id v4 = [v3 keyColor];
    [(RAPThumbsButton *)self setBackgroundColor:v4];

    uint64_t v5 = +[UIColor whiteColor];
  }
  else
  {
    id v6 = +[UIColor tertiarySystemFillColor];
    [(RAPThumbsButton *)self setBackgroundColor:v6];

    uint64_t v5 = +[UIColor secondaryLabelColor];
  }
  id v8 = (id)v5;
  id v7 = [(RAPThumbsButton *)self imageView];
  [v7 setTintColor:v8];
}

@end