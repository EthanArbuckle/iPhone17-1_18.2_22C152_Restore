@interface BKTOCBookmarksDescription
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation BKTOCBookmarksDescription

- (void)layoutSubviews
{
  [(BKTOCBookmarksDescription *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  double v11 = v7 + -50.0;
  id v12 = objc_alloc_init((Class)NSStringDrawingContext);
  NSAttributedStringKey v29 = NSFontAttributeName;
  v13 = [(UILabel *)self->_titleLabel font];
  v30 = v13;
  v14 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];

  v15 = [(UILabel *)self->_titleLabel text];
  [v15 boundingRectWithSize:3 options:v14 attributes:v12 context:200.0];
  double v17 = v16;

  v18 = [(UILabel *)self->_descriptionLabel text];
  NSAttributedStringKey v27 = NSFontAttributeName;
  v19 = [(UILabel *)self->_descriptionLabel font];
  v28 = v19;
  v20 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  [v18 boundingRectWithSize:3 options:v20 attributes:v12 context:v11 - v17];
  double v22 = v21;

  double v23 = ceil(v17);
  double v24 = ceil(v22);
  if (isPad()) {
    double v25 = 11.0;
  }
  else {
    double v25 = 15.0;
  }
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  double v26 = round((CGRectGetHeight(v31) - (v24 + v23 + v25)) * 0.5);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 25.0, v26, v11, v23);
  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", 25.0, v23 + v25 + v26, v11, v24);
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(BKTOCBookmarksDescription *)self backgroundColor];

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)BKTOCBookmarksDescription;
    [(BKTOCBookmarksDescription *)&v6 setBackgroundColor:v4];
    [(UILabel *)self->_titleLabel setBackgroundColor:v4];
    [(UILabel *)self->_descriptionLabel setBackgroundColor:v4];
  }
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    id v5 = self->_titleLabel;
    self->_titleLabel = v4;

    objc_super v6 = +[UIFont systemFontOfSize:26.0];
    [(UILabel *)self->_titleLabel setFont:v6];

    [(UILabel *)self->_titleLabel setNumberOfLines:2];
    [(UILabel *)self->_titleLabel setTextAlignment:1];
    [(UILabel *)self->_titleLabel setLineBreakMode:0];
    double v7 = [(BKTOCBookmarksDescription *)self backgroundColor];
    [(UILabel *)self->_titleLabel setBackgroundColor:v7];

    [(BKTOCBookmarksDescription *)self addSubview:self->_titleLabel];
    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (UILabel)descriptionLabel
{
  descriptionLabel = self->_descriptionLabel;
  if (!descriptionLabel)
  {
    id v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    id v5 = self->_descriptionLabel;
    self->_descriptionLabel = v4;

    objc_super v6 = +[UIFont systemFontOfSize:16.0];
    [(UILabel *)self->_descriptionLabel setFont:v6];

    [(UILabel *)self->_descriptionLabel setNumberOfLines:10];
    [(UILabel *)self->_descriptionLabel setTextAlignment:1];
    [(UILabel *)self->_descriptionLabel setLineBreakMode:0];
    double v7 = [(BKTOCBookmarksDescription *)self backgroundColor];
    [(UILabel *)self->_descriptionLabel setBackgroundColor:v7];

    [(BKTOCBookmarksDescription *)self addSubview:self->_descriptionLabel];
    descriptionLabel = self->_descriptionLabel;
  }

  return descriptionLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end