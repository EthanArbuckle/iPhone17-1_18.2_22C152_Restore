@interface MTContentUnavailableView
+ (id)messageLabelWithFrame:(CGRect)a3;
- (MTColorTheme)colorTheme;
- (MTContentUnavailableView)initWithFrame:(CGRect)a3;
- (MTContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4;
- (MTContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 message:(id)a5;
- (NSString)buttonText;
- (NSString)message;
- (NSString)title;
- (UIImage)placeholderImage;
- (id)buttonCallback;
- (void)_buttonClick;
- (void)_sizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setButtonCallback:(id)a3;
- (void)setButtonText:(id)a3;
- (void)setColorTheme:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MTContentUnavailableView

+ (id)messageLabelWithFrame:(CGRect)a3
{
  id v3 = [objc_alloc((Class)UILabel) initWithFrame:a3.origin.x, a3.origin.y, a3.size.width, a3.size.height];
  [v3 setTextAlignment:1];
  [v3 setOpaque:0];
  v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  v5 = +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleBody];
  [v3 setFont:v5];

  [v3 setNumberOfLines:0];
  [v3 setAlpha:0.4];
  v6 = +[UIColor blackColor];
  [v3 setTextColor:v6];

  return v3;
}

- (MTContentUnavailableView)initWithFrame:(CGRect)a3
{
  return -[MTContentUnavailableView initWithFrame:title:](self, "initWithFrame:title:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MTContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4
{
  return -[MTContentUnavailableView initWithFrame:title:message:](self, "initWithFrame:title:message:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MTContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 message:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MTContentUnavailableView;
  v13 = -[MTContentUnavailableView initWithFrame:](&v21, "initWithFrame:", x, y, width, height);
  v14 = v13;
  if (v13)
  {
    [(MTContentUnavailableView *)v13 setAutoresizingMask:18];
    id v15 = objc_alloc((Class)UIView);
    [(MTContentUnavailableView *)v14 bounds];
    v16 = [v15 initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(v22), 0.0)];
    containerView = v14->_containerView;
    v14->_containerView = v16;

    [(MTContentUnavailableView *)v14 addSubview:v14->_containerView];
    [(MTContentUnavailableView *)v14 setTitle:v11];
    [(MTContentUnavailableView *)v14 setMessage:v12];
    v18 = +[UIColor whiteColor];
    [(MTContentUnavailableView *)v14 setBackgroundColor:v18];

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v14 selector:"_sizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v14;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)MTContentUnavailableView;
  [(MTContentUnavailableView *)&v4 dealloc];
}

- (void)setColorTheme:(id)a3
{
  id v15 = a3;
  objc_storeStrong((id *)&self->_colorTheme, a3);
  if (v15)
  {
    v5 = +[UIColor primaryTextColorForTheme:v15];
    p_titleLabel = &self->_titleLabel;
    [(UILabel *)self->_titleLabel setTextColor:v5];

    v7 = +[UIColor secondaryTextColorForTheme:v15];
    p_messageLabel = &self->_messageLabel;
    double v9 = 1.0;
    v10 = &self->_messageLabel;
  }
  else
  {
    v7 = +[UIColor blackColor];
    v10 = &self->_messageLabel;
    [(UILabel *)self->_messageLabel setTextColor:v7];
    p_messageLabel = &self->_titleLabel;
    double v9 = 0.400000006;
    p_titleLabel = &self->_titleLabel;
  }
  [(UILabel *)*p_messageLabel setTextColor:v7];

  [(UILabel *)*v10 setAlpha:v9];
  [(UILabel *)*p_titleLabel setAlpha:v9];
  id v11 = [v15 backgroundColor];
  if (v11)
  {
    [(MTContentUnavailableView *)self setBackgroundColor:v11];
  }
  else
  {
    id v12 = +[UIColor whiteColor];
    [(MTContentUnavailableView *)self setBackgroundColor:v12];
  }
  button = self->_button;
  v14 = +[UIColor tintColorForTheme:v15];
  [(UIButton *)button setTitleColor:v14 forState:0];
}

- (void)setButtonText:(id)a3
{
  id v12 = a3;
  if (!-[NSString isEqualToString:](self->_buttonText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_buttonText, a3);
    v5 = +[UIButton buttonWithType:1];
    button = self->_button;
    self->_button = v5;

    [(UIButton *)self->_button setTitle:v12 forState:0];
    [(UIButton *)self->_button addTarget:self action:"_buttonClick" forControlEvents:64];
    v7 = self->_button;
    v8 = +[UIColor appTintColor];
    [(UIButton *)v7 setTitleColor:v8 forState:0];

    double v9 = +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleSubheadline];
    v10 = [(UIButton *)self->_button titleLabel];
    [v10 setFont:v9];

    id v11 = [(UIButton *)self->_button titleLabel];
    [v11 setTextAlignment:1];

    [(UIButton *)self->_button sizeToFit];
    [(UIView *)self->_containerView addSubview:self->_button];
  }
}

- (void)setPlaceholderImage:(id)a3
{
  id v7 = a3;
  if ((-[UIImage isEqual:](self->_placeholderImage, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    v5 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v7];
    imageView = self->_imageView;
    self->_imageView = v5;

    [(UIView *)self->_containerView addSubview:self->_imageView];
  }
  [(MTContentUnavailableView *)self setNeedsLayout];
}

- (void)setTitle:(id)a3
{
  if (self->_title != a3)
  {
    objc_super v4 = (NSString *)[a3 copy];
    title = self->_title;
    self->_title = v4;

    v6 = self->_title;
    if (v6 && !self->_titleLabel)
    {
      id v7 = objc_alloc((Class)UILabel);
      [(UIView *)self->_containerView bounds];
      v8 = [v7 initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(v14), 20.0)];
      titleLabel = self->_titleLabel;
      self->_titleLabel = v8;

      [(UILabel *)self->_titleLabel setTextAlignment:1];
      v10 = +[UIColor clearColor];
      [(UILabel *)self->_titleLabel setBackgroundColor:v10];

      [(UILabel *)self->_titleLabel setOpaque:0];
      id v11 = +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleHeadline];
      [(UILabel *)self->_titleLabel setFont:v11];

      [(UILabel *)self->_titleLabel setNumberOfLines:0];
      id v12 = +[UIColor blackColor];
      [(UILabel *)self->_titleLabel setTextColor:v12];

      [(UILabel *)self->_titleLabel setAlpha:0.4];
      [(UIView *)self->_containerView addSubview:self->_titleLabel];
      v6 = self->_title;
    }
    [(UILabel *)self->_titleLabel setText:v6];
    [(MTContentUnavailableView *)self setNeedsLayout];
  }
}

- (void)setMessage:(id)a3
{
  if (self->_message != a3)
  {
    objc_super v4 = (NSString *)[a3 copy];
    message = self->_message;
    self->_message = v4;

    v6 = self->_message;
    if (v6 && !self->_messageLabel)
    {
      id v7 = objc_opt_class();
      [(UIView *)self->_containerView bounds];
      [v7 messageLabelWithFrame:0.0, 0.0, CGRectGetWidth(v11), 20.0];
      v8 = (UILabel *)objc_claimAutoreleasedReturnValue();
      messageLabel = self->_messageLabel;
      self->_messageLabel = v8;

      [(UIView *)self->_containerView addSubview:self->_messageLabel];
      v6 = self->_message;
    }
    [(UILabel *)self->_messageLabel setText:v6];
    [(MTContentUnavailableView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v62.receiver = self;
  v62.super_class = (Class)MTContentUnavailableView;
  [(MTContentUnavailableView *)&v62 layoutSubviews];
  [(MTContentUnavailableView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIView *)self->_containerView frame];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  v63.origin.double x = v4;
  v63.origin.double y = v6;
  v63.size.double width = v8;
  v63.size.double height = v10;
  if (CGRectGetWidth(v63) >= 478.0)
  {
    IMRectCenteredXInRectScale();
    uint64_t v12 = v17;
    double v15 = v18;
    uint64_t v14 = v19;
  }
  else
  {
    v64.origin.double x = v4;
    v64.origin.double y = v6;
    v64.size.double width = v8;
    v64.size.double height = v10;
    double v15 = CGRectGetWidth(v64) + -30.0;
    double v16 = 15.0;
  }
  uint64_t v20 = v12;
  double v21 = v15;
  uint64_t v22 = v14;
  double Width = CGRectGetWidth(*(CGRect *)&v16);
  [(UIImageView *)self->_imageView frame];
  IMRectCenteredXInRectScale();
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  [(UIImageView *)self->_imageView setFrame:0];
  [(UILabel *)self->_titleLabel frame];
  if (self->_imageView)
  {
    v65.origin.double x = v24;
    v65.origin.double y = v26;
    v65.size.double width = v28;
    v65.size.double height = v30;
    CGRectGetMaxY(v65);
  }
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", Width, 1.79769313e308);
  IMRectCenteredXInRectScale();
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  [(UILabel *)self->_titleLabel setFrame:0];
  [(UILabel *)self->_messageLabel frame];
  if (self->_title)
  {
    v66.origin.double x = v32;
    v66.origin.double y = v34;
    v66.size.double width = v36;
    v66.size.double height = v38;
    CGRectGetMaxY(v66);
  }
  -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", Width, 1.79769313e308);
  IMRectCenteredXInRectScale();
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  double v61 = v45;
  [(UILabel *)self->_messageLabel setFrame:0];
  [(UIButton *)self->_button frame];
  v67.origin.double x = v46;
  v67.origin.double y = v40;
  v67.size.double width = v42;
  v67.size.double height = v44;
  CGRectGetMaxY(v67);
  IMRectCenteredXInRectScale();
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  [(UIButton *)self->_button setFrame:0];
  button = self->_button;
  double v56 = v61;
  if (button)
  {
    double v56 = v48;
    double v57 = v50;
  }
  else
  {
    double v57 = v40;
  }
  if (button) {
    double v58 = v52;
  }
  else {
    double v58 = v42;
  }
  if (button) {
    double v59 = v54;
  }
  else {
    double v59 = v44;
  }
  CGRectGetMaxY(*(CGRect *)&v56);
  IMRectCenteredYInRectScale();
  [(UIView *)self->_containerView setFrame:0];
}

- (void)_buttonClick
{
  double v3 = [(MTContentUnavailableView *)self buttonCallback];

  if (v3)
  {
    CGFloat v4 = [(MTContentUnavailableView *)self buttonCallback];
    v4[2]();
  }
}

- (void)_sizeCategoryDidChange:(id)a3
{
  CGFloat v4 = +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleHeadline];
  [(UILabel *)self->_titleLabel setFont:v4];

  double v5 = +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleSubheadline];
  CGFloat v6 = [(UIButton *)self->_button titleLabel];
  [v6 setFont:v5];

  [(UIButton *)self->_button sizeToFit];
  double v7 = +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_messageLabel setFont:v7];

  [(MTContentUnavailableView *)self setNeedsLayout];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (id)buttonCallback
{
  return self->_buttonCallback;
}

- (void)setButtonCallback:(id)a3
{
}

- (MTColorTheme)colorTheme
{
  return self->_colorTheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorTheme, 0);
  objc_storeStrong(&self->_buttonCallback, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end