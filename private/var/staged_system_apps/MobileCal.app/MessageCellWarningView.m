@interface MessageCellWarningView
- (MessageCellWarningView)init;
- (void)setImage:(id)a3 warningString:(id)a4 emphasizedRangeValue:(id)a5;
@end

@implementation MessageCellWarningView

- (MessageCellWarningView)init
{
  v16.receiver = self;
  v16.super_class = (Class)MessageCellWarningView;
  v2 = [(MessageCellWarningView *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    imageView = v2->_imageView;
    v2->_imageView = (UIImageView *)v3;

    [(UIImageView *)v2->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v5) = 1148846080;
    [(UIImageView *)v2->_imageView setContentHuggingPriority:0 forAxis:v5];
    LODWORD(v6) = 1148846080;
    [(UIImageView *)v2->_imageView setContentHuggingPriority:1 forAxis:v6];
    LODWORD(v7) = 1148846080;
    [(UIImageView *)v2->_imageView setContentCompressionResistancePriority:0 forAxis:v7];
    LODWORD(v8) = 1148846080;
    [(UIImageView *)v2->_imageView setContentCompressionResistancePriority:1 forAxis:v8];
    uint64_t v9 = objc_opt_new();
    label = v2->_label;
    v2->_label = (UILabel *)v9;

    [(UILabel *)v2->_label setOpaque:0];
    v11 = +[UIColor clearColor];
    [(UILabel *)v2->_label setBackgroundColor:v11];

    [(UILabel *)v2->_label setLineBreakMode:4];
    [(UILabel *)v2->_label setNumberOfLines:4];
    [(UILabel *)v2->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v12) = 1144750080;
    [(UILabel *)v2->_label setContentCompressionResistancePriority:0 forAxis:v12];
    LODWORD(v13) = 1148846080;
    [(UILabel *)v2->_label setContentCompressionResistancePriority:1 forAxis:v13];
    LODWORD(v14) = 1144750080;
    [(UILabel *)v2->_label setContentHuggingPriority:1 forAxis:v14];
    [(MessageCellWarningView *)v2 addSubview:v2->_imageView];
    [(MessageCellWarningView *)v2 addSubview:v2->_label];
  }
  return v2;
}

- (void)setImage:(id)a3 warningString:(id)a4 emphasizedRangeValue:(id)a5
{
  id v8 = a5;
  imageView = self->_imageView;
  id v10 = a4;
  [(UIImageView *)imageView setImage:a3];
  v11 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote addingSymbolicTraits:0x8000 options:0];
  v26 = +[UIFont fontWithDescriptor:v11 size:0.0];
  v29[0] = NSFontAttributeName;
  v29[1] = NSForegroundColorAttributeName;
  v30[0] = v26;
  double v12 = +[UIColor labelColor];
  v30[1] = v12;
  double v13 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];

  id v14 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v10 attributes:v13];
  if (v8)
  {
    uint64_t v15 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote addingSymbolicTraits:32770 options:0];

    objc_super v16 = +[UIFont fontWithDescriptor:v15 size:0.0];
    v27[1] = NSForegroundColorAttributeName;
    v28[0] = v16;
    v27[0] = NSFontAttributeName;
    v17 = +[UIColor labelColor];
    v28[1] = v17;
    v18 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

    id v19 = [v8 rangeValue];
    [v14 setAttributes:v18 range:v19];

    v11 = (void *)v15;
  }
  [(UILabel *)self->_label setAttributedText:v14];
  if (!self->_didActivateConstraints)
  {
    v21 = _NSDictionaryOfVariableBindings(@"_imageView,_label", self->_imageView, self->_label, 0);
    +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|[_imageView]-(2)-[_label]|", 4096, 0, v21);
    v23 = id v22 = v8;
    +[NSLayoutConstraint activateConstraints:v23];

    id v8 = v22;
    v24 = _NSDictionaryOfVariableBindings(@"_imageView,_label", self->_imageView, self->_label, 0);
    v25 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_label]|" options:0 metrics:0 views:v24];
    +[NSLayoutConstraint activateConstraints:v25];

    self->_didActivateConstraints = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end