@interface _TVStackViewCell
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setViewController:(id)a3;
@end

@implementation _TVStackViewCell

- (void)setViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_TVStackViewCell;
  id v4 = a3;
  [(_TVStackCollectionViewCell *)&v7 setViewController:v4];
  v5 = [(_TVStackCollectionViewCell *)self viewController];
  objc_opt_class();
  self->_isAdhocViewController = objc_opt_isKindOfClass() & 1;

  v6 = [v4 view];

  objc_msgSend(v6, "tv_setShowcaseFactor:", self->_showcaseFactor);
}

- (void)applyLayoutAttributes:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_TVStackViewCell;
  id v4 = a3;
  [(_TVStackViewCell *)&v9 applyLayoutAttributes:v4];
  objc_msgSend(v4, "showcaseFactor", v9.receiver, v9.super_class);
  double v6 = v5;

  self->_showcaseFactor = v6;
  objc_super v7 = [(_TVStackCollectionViewCell *)self viewController];
  v8 = [v7 view];
  objc_msgSend(v8, "tv_setShowcaseFactor:", self->_showcaseFactor);

  if (self->_isAdhocViewController) {
    [(_TVStackViewCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)_TVStackViewCell;
  [(_TVStackCollectionViewCell *)&v13 layoutSubviews];
  [(_TVStackViewCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  objc_super v7 = [(_TVStackCollectionViewCell *)self viewController];
  v8 = [v7 view];

  if (self->_isAdhocViewController)
  {
    v11 = [(_TVStackCollectionViewCell *)self viewController];
    v12 = v11;
    if (v11) {
      [v11 showcaseConfig];
    }
  }
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v4, v6, v9, v10);
  [v8 setAlpha:1.0];
}

@end