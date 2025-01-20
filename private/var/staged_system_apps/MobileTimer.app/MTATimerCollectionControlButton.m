@interface MTATimerCollectionControlButton
- (MTATimerCollectionControlButton)initWithFrame:(CGRect)a3;
- (UIColor)highlightedBackgroundColor;
- (UIColor)normalBackgroundColor;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedBackgroundColor:(id)a3;
- (void)setNormalBackgroundColor:(id)a3;
@end

@implementation MTATimerCollectionControlButton

- (MTATimerCollectionControlButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTATimerCollectionControlButton;
  v3 = -[MTATimerCollectionControlButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MTATimerCollectionControlButton *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MTATimerCollectionControlButton *)v4 setAdjustsImageWhenHighlighted:0];
  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTATimerCollectionControlButton;
  -[MTATimerCollectionControlButton setHighlighted:](&v11, "setHighlighted:");
  if (!v3)
  {
    v7 = [(MTATimerCollectionControlButton *)self normalBackgroundColor];

    if (v7)
    {
      uint64_t v6 = [(MTATimerCollectionControlButton *)self normalBackgroundColor];
      goto LABEL_6;
    }
    v8 = [(MTATimerCollectionControlButton *)self tintColor];
    uint64_t v9 = [v8 normalShade];
LABEL_9:
    v10 = (void *)v9;
    [(MTATimerCollectionControlButton *)self setBackgroundColor:v9];

    goto LABEL_10;
  }
  v5 = [(MTATimerCollectionControlButton *)self highlightedBackgroundColor];

  if (!v5)
  {
    v8 = [(MTATimerCollectionControlButton *)self tintColor];
    uint64_t v9 = [v8 highlightedShade];
    goto LABEL_9;
  }
  uint64_t v6 = [(MTATimerCollectionControlButton *)self highlightedBackgroundColor];
LABEL_6:
  v8 = (void *)v6;
  [(MTATimerCollectionControlButton *)self setBackgroundColor:v6];
LABEL_10:
}

- (UIColor)normalBackgroundColor
{
  return self->_normalBackgroundColor;
}

- (void)setNormalBackgroundColor:(id)a3
{
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (void)setHighlightedBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);

  objc_storeStrong((id *)&self->_normalBackgroundColor, 0);
}

@end