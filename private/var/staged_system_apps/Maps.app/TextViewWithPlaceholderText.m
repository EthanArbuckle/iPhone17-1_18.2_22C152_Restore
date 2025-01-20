@interface TextViewWithPlaceholderText
- (TextViewWithPlaceholderText)initWithFrame:(CGRect)a3;
- (UILabel)placeholderLabel;
- (void)_updatePlaceholderVisibility;
- (void)layoutSubviews;
- (void)setText:(id)a3;
@end

@implementation TextViewWithPlaceholderText

- (TextViewWithPlaceholderText)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TextViewWithPlaceholderText;
  v3 = -[TextViewWithPlaceholderText initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(TextViewWithPlaceholderText *)v3 setBackgroundColor:v4];

    v5 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    placeholderLabel = v3->_placeholderLabel;
    v3->_placeholderLabel = v5;

    v7 = [(TextViewWithPlaceholderText *)v3 font];
    [(UILabel *)v3->_placeholderLabel setFont:v7];

    v8 = +[UIColor tertiaryLabelColor];
    [(UILabel *)v3->_placeholderLabel setTextColor:v8];

    [(UILabel *)v3->_placeholderLabel setContentMode:5];
    [(UILabel *)v3->_placeholderLabel setNumberOfLines:0];
    [(TextViewWithPlaceholderText *)v3 addSubview:v3->_placeholderLabel];
    if ([(TextViewWithPlaceholderText *)v3 _shouldReverseLayoutDirection]) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 0;
    }
    [(TextViewWithPlaceholderText *)v3 setTextAlignment:v9];
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v3 selector:"_updatePlaceholderVisibility" name:UITextViewTextDidChangeNotification object:0];
  }
  return v3;
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)TextViewWithPlaceholderText;
  [(TextViewWithPlaceholderText *)&v32 layoutSubviews];
  v3 = [(TextViewWithPlaceholderText *)self placeholderLabel];
  unsigned __int8 v4 = [v3 isHidden];

  if ((v4 & 1) == 0)
  {
    v5 = [(TextViewWithPlaceholderText *)self placeholderLabel];
    [(TextViewWithPlaceholderText *)self bringSubviewToFront:v5];

    [(TextViewWithPlaceholderText *)self textContainerInset];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    v14 = [(TextViewWithPlaceholderText *)self textContainer];
    [v14 lineFragmentPadding];
    double v16 = v9 + v15;

    v17 = [(TextViewWithPlaceholderText *)self textContainer];
    [v17 lineFragmentPadding];
    double v19 = v13 + v18;

    [(TextViewWithPlaceholderText *)self bounds];
    double v21 = v16 + v20;
    double v23 = v7 + v22;
    double v25 = v24 - (v16 + v19);
    double v27 = v26 - (v7 + v11);
    v28 = [(TextViewWithPlaceholderText *)self placeholderLabel];
    [v28 sizeThatFits:v25];
    double v30 = v29;

    if (v27 < v30) {
      double v30 = v27;
    }
    v31 = [(TextViewWithPlaceholderText *)self placeholderLabel];
    [v31 setFrame:v21, v23, v25, v30];
  }
}

- (void)_updatePlaceholderVisibility
{
  v3 = [(TextViewWithPlaceholderText *)self placeholderLabel];
  unsigned int v4 = [v3 isHidden];

  v5 = [(TextViewWithPlaceholderText *)self text];
  BOOL v6 = [v5 length] != 0;
  double v7 = [(TextViewWithPlaceholderText *)self placeholderLabel];
  [v7 setHidden:v6];

  if (v4)
  {
    double v8 = [(TextViewWithPlaceholderText *)self placeholderLabel];
    unsigned __int8 v9 = [v8 isHidden];

    if ((v9 & 1) == 0)
    {
      [(TextViewWithPlaceholderText *)self setNeedsLayout];
    }
  }
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TextViewWithPlaceholderText;
  [(TextViewWithPlaceholderText *)&v4 setText:a3];
  [(TextViewWithPlaceholderText *)self _updatePlaceholderVisibility];
}

- (UILabel)placeholderLabel
{
  return self->_placeholderLabel;
}

- (void).cxx_destruct
{
}

@end