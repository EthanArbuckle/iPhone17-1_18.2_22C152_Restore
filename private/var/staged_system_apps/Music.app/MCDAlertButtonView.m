@interface MCDAlertButtonView
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (MCDAlertButtonView)initWithTitle:(id)a3 image:(id)a4;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)label;
- (id)accessibilityLabel;
- (void)_setHighlightsForHitView:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLabel:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation MCDAlertButtonView

- (MCDAlertButtonView)initWithTitle:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MCDAlertButtonView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v11 = -[MCDAlertButtonView initWithFrame:](&v18, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v11)
  {
    v12 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v7];
    imageView = v11->_imageView;
    v11->_imageView = v12;

    v14 = [(MCDAlertButtonView *)v11 imageView];
    [v14 setContentMode:1];

    objc_storeStrong((id *)&v11->_image, a4);
    [(MCDAlertButtonView *)v11 addSubview:v11->_imageView];
    v15 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    label = v11->_label;
    v11->_label = v15;

    [(UILabel *)v11->_label setText:v6];
    [(UILabel *)v11->_label sizeToFit];
    [(MCDAlertButtonView *)v11 addSubview:v11->_label];
  }

  return v11;
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)MCDAlertButtonView;
  [(MCDAlertButtonView *)&v41 layoutSubviews];
  [(MCDAlertButtonView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MCDAlertButtonView *)self traitCollection];
  [v11 displayScale];
  uint64_t v13 = v12;

  v42.origin.x = v4;
  v42.origin.double y = v6;
  v42.size.double width = v8;
  v42.size.double height = v10;
  CGRectGetWidth(v42);
  v43.origin.x = 0.0;
  v43.origin.double y = 0.0;
  v43.size.double width = 24.0;
  v43.size.double height = 24.0;
  CGRectGetWidth(v43);
  UIRectCenteredYInRectScale();
  CGFloat v18 = sub_1000B4E80(self, v14, v15, v16, v17);
  double v39 = v19;
  double v40 = v18;
  double v21 = v20;
  double v38 = v22;
  double v23 = v8 - (v20 + 20.0);
  v24 = [(MCDAlertButtonView *)self label];
  [v24 sizeThatFits:v23, v10];

  UIRectCenteredYInRectScale();
  double v29 = sub_1000B4E80(self, v25, v26, v27, v28);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  v36 = [(MCDAlertButtonView *)self imageView];
  [v36 setFrame:v40, v39, v21, v38];

  v37 = [(MCDAlertButtonView *)self label];
  [v37 setFrame:v29, v31, v33, v35];

  [(MCDAlertButtonView *)self setHighlighted:0];
}

- (void)setHighlighted:(BOOL)a3
{
  if (a3)
  {
    CGFloat v4 = +[UIColor _carSystemFocusColor];
    [(MCDAlertButtonView *)self setBackgroundColor:v4];

    double v5 = [(MCDAlertButtonView *)self label];
    CGFloat v6 = +[UIColor _carSystemFocusLabelColor];
    [v5 setTextColor:v6];

    id v13 = [(MCDAlertButtonView *)self image];
    +[UIColor _carSystemFocusLabelColor];
  }
  else
  {
    double v7 = +[UIColor clearColor];
    [(MCDAlertButtonView *)self setBackgroundColor:v7];

    double v8 = [(MCDAlertButtonView *)self label];
    double v9 = +[UIColor _carSystemFocusColor];
    [v8 setTextColor:v9];

    id v13 = [(MCDAlertButtonView *)self image];
    +[UIColor _carSystemFocusColor];
  double v10 = };
  v11 = [v13 imageWithTintColor:v10 renderingMode:1];
  uint64_t v12 = [(MCDAlertButtonView *)self imageView];
  [v12 setImage:v11];
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  double v5 = [a3 nextFocusedItem];
  [(MCDAlertButtonView *)self setHighlighted:v5 == self];
}

- (void)_setHighlightsForHitView:(id)a3
{
  if (a3 == self) {
    [a3 setHighlighted:1];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MCDAlertButtonView;
  [(MCDAlertButtonView *)&v20 touchesBegan:v6 withEvent:v7];
  id v8 = v6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      id v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        if (![*(id *)(*((void *)&v21 + 1) + 8 * (void)v13) type])
        {

          CGFloat v14 = [v9 anyObject];
          [v14 locationInView:self];
          double v16 = v15;
          double v18 = v17;

          double v19 = -[MCDAlertButtonView hitTest:withEvent:](self, "hitTest:withEvent:", v7, v16, v18);
          [(MCDAlertButtonView *)self _setHighlightsForHitView:v19];

          goto LABEL_11;
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MCDAlertButtonView;
  [(MCDAlertButtonView *)&v20 touchesMoved:v6 withEvent:v7];
  id v8 = v6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      id v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        if (![*(id *)(*((void *)&v21 + 1) + 8 * (void)v13) type])
        {

          CGFloat v14 = [v9 anyObject];
          [v14 locationInView:self];
          double v16 = v15;
          double v18 = v17;

          double v19 = -[MCDAlertButtonView hitTest:withEvent:](self, "hitTest:withEvent:", v7, v16, v18);
          [(MCDAlertButtonView *)self _setHighlightsForHitView:v19];

          goto LABEL_11;
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCDAlertButtonView;
  [(MCDAlertButtonView *)&v13 touchesCancelled:v6 withEvent:a4];
  id v7 = v6;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        if (![*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) type])
        {

          [(MCDAlertButtonView *)self setHighlighted:0];
          goto LABEL_11;
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCDAlertButtonView;
  [(MCDAlertButtonView *)&v13 touchesEnded:v6 withEvent:a4];
  id v7 = v6;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        if (![*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) type])
        {

          [(MCDAlertButtonView *)self setHighlighted:0];
          goto LABEL_11;
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(MCDAlertButtonView *)self label];
  double v3 = [v2 text];

  return v3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end