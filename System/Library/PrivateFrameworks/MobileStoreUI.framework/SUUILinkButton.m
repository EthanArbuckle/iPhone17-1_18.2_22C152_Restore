@interface SUUILinkButton
+ (SUUILinkButton)buttonWithArrowStyle:(int64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUILinkButton)initWithArrowStyle:(int64_t)a3;
- (double)_linkImagePaddingLeft;
- (int64_t)arrowStyle;
- (void)_reloadIcons;
- (void)layoutSubviews;
- (void)setTitleColor:(id)a3 forState:(unint64_t)a4;
- (void)sizeToFit;
- (void)tintColorDidChange;
@end

@implementation SUUILinkButton

+ (SUUILinkButton)buttonWithArrowStyle:(int64_t)a3
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SUUILinkButton;
  v4 = objc_msgSendSuper2(&v8, sel_buttonWithType_, 1);
  v4[93] = a3;
  v5 = [v4 titleLabel];
  [v5 setNumberOfLines:1];

  v6 = [v4 titleLabel];
  [v6 setLineBreakMode:4];

  [v4 _reloadIcons];
  return (SUUILinkButton *)v4;
}

- (SUUILinkButton)initWithArrowStyle:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUUILinkButton;
  v4 = [(SUUILinkButton *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_arrowStyle = a3;
    v6 = [(SUUILinkButton *)v4 titleLabel];
    [v6 setNumberOfLines:1];

    v7 = [(SUUILinkButton *)v5 titleLabel];
    [v7 setLineBreakMode:4];

    [(SUUILinkButton *)v5 _reloadIcons];
  }
  return v5;
}

- (void)setTitleColor:(id)a3 forState:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SUUILinkButton;
  [(SUUILinkButton *)&v5 setTitleColor:a3 forState:a4];
  [(SUUILinkButton *)self _reloadIcons];
}

- (void)tintColorDidChange
{
  [(SUUILinkButton *)self _reloadIcons];
  v3.receiver = self;
  v3.super_class = (Class)SUUILinkButton;
  [(SUUILinkButton *)&v3 tintColorDidChange];
}

- (void)sizeToFit
{
  -[SUUILinkButton sizeThatFits:](self, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
  [(SUUILinkButton *)self frame];
  -[SUUILinkButton setFrame:](self, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(SUUILinkButton *)self imageView];
  v7 = [(SUUILinkButton *)self imageForState:0];
  [v6 setImage:v7];

  objc_super v8 = [(SUUILinkButton *)self titleLabel];
  objc_super v9 = [(SUUILinkButton *)self titleForState:0];
  [v8 setText:v9];

  BOOL v10 = width == *MEMORY[0x263F001B0];
  BOOL v11 = height == *(double *)(MEMORY[0x263F001B0] + 8);
  if (v10 && v11) {
    double v12 = *(double *)(MEMORY[0x263F00190] + 24);
  }
  else {
    double v12 = height;
  }
  if (v10 && v11) {
    double v13 = *(double *)(MEMORY[0x263F00190] + 16);
  }
  else {
    double v13 = width;
  }
  objc_msgSend(v6, "sizeThatFits:", v13, v12);
  double v15 = v14;
  double v17 = v16;
  [(SUUILinkButton *)self _linkImagePaddingLeft];
  double v19 = v13 - (v15 + v18);
  objc_msgSend(v8, "sizeThatFits:", v19, v12);
  double v22 = v21;
  if (v20 >= v19) {
    double v20 = v19;
  }
  double v23 = v15 + v20;
  [(SUUILinkButton *)self _linkImagePaddingLeft];
  double v25 = ceil(v24 + v23);
  if (width >= v25) {
    double width = v25;
  }
  if (v22 >= v17) {
    double v26 = v22;
  }
  else {
    double v26 = v17;
  }
  double v27 = ceil(v26);
  if (height >= v27) {
    double height = v27;
  }

  double v28 = width;
  double v29 = height;
  result.double height = v29;
  result.double width = v28;
  return result;
}

- (void)layoutSubviews
{
  [MEMORY[0x263F82E00] setAnimationsEnabled:0];
  v42.receiver = self;
  v42.super_class = (Class)SUUILinkButton;
  [(SUUILinkButton *)&v42 layoutSubviews];
  [(SUUILinkButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [(SUUILinkButton *)self imageView];
  uint64_t v8 = [(SUUILinkButton *)self titleLabel];
  objc_super v9 = (void *)v8;
  double v10 = *MEMORY[0x263F001B0];
  double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v7 && v8)
  {
    [(SUUILinkButton *)self _linkImagePaddingLeft];
    double v13 = v4 - v12;
  }
  else
  {
    double v13 = v4;
    double v14 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v15 = *MEMORY[0x263F001B0];
    double v16 = v4;
    if (!v7) {
      goto LABEL_6;
    }
  }
  objc_msgSend(v7, "sizeThatFits:", v13, v6);
  double v15 = v17;
  double v14 = v18;
  double v16 = v13 - v17;
LABEL_6:
  double v41 = v4;
  if (v9)
  {
    objc_msgSend(v9, "sizeThatFits:", v16, v6);
    double v11 = v20;
    if (v19 >= v16) {
      double v10 = v16;
    }
    else {
      double v10 = v19;
    }
  }
  [(SUUILinkButton *)self _linkImagePaddingLeft];
  double v22 = v15 + v10 + v21;
  double v23 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v24 = [v23 userInterfaceLayoutDirection];

  if (v7)
  {
    [v7 frame];
    float v25 = (v40 - v14) * 0.5;
    double v26 = v11;
    double v27 = roundf(v25);
    float v28 = (v41 - v22) * 0.5;
    double v29 = roundf(v28);
    if (v24) {
      double v30 = v29;
    }
    else {
      double v30 = v22 + v29 - v15;
    }
    v31 = [(SUUILinkButton *)self titleLabel];
    v32 = [v31 font];
    [v32 lineHeight];
    double v34 = v33;

    if (v34 <= 14.0) {
      double v35 = v27 + 1.0;
    }
    else {
      double v35 = v27;
    }
    double v11 = v26;
    objc_msgSend(v7, "setFrame:", v30, v35, v15, v14);
  }
  if (v9)
  {
    [v9 frame];
    float v36 = (v40 - v11) * 0.5;
    double v37 = roundf(v36);
    float v38 = (v41 - v22) * 0.5;
    double v39 = roundf(v38);
    if (v24) {
      double v39 = v22 + v39 - v10;
    }
    objc_msgSend(v9, "setFrame:", v39, v37, v10, v11);
  }
  [MEMORY[0x263F82E00] setAnimationsEnabled:1];
}

- (double)_linkImagePaddingLeft
{
  double result = 4.0;
  switch(self->_arrowStyle)
  {
    case 0:
    case 1:
    case 5:
      double v3 = [(SUUILinkButton *)self titleLabel];
      double v4 = [v3 font];
      [v4 lineHeight];
      double v6 = v5;

      double result = 3.0;
      if (v6 < 13.0) {
        double result = 2.0;
      }
      break;
    case 3:
      double result = 3.0;
      break;
    case 4:
      double result = 7.0;
      break;
    default:
      return result;
  }
  return result;
}

- (void)_reloadIcons
{
  switch(self->_arrowStyle)
  {
    case 0:
      double v3 = (void *)MEMORY[0x263F827E8];
      double v4 = SUUIBundle();
      double v5 = @"ChevronTerms";
      goto LABEL_9;
    case 1:
      double v3 = (void *)MEMORY[0x263F827E8];
      double v4 = SUUIBundle();
      double v5 = @"ChevronSeeAll";
      goto LABEL_9;
    case 2:
      double v3 = (void *)MEMORY[0x263F827E8];
      double v4 = SUUIBundle();
      double v5 = @"MoreDisclosureTriangleMask";
      goto LABEL_9;
    case 3:
      double v3 = (void *)MEMORY[0x263F827E8];
      double v4 = SUUIBundle();
      double v5 = @"SearchFilterDisclosureChevron";
      goto LABEL_9;
    case 4:
      double v3 = (void *)MEMORY[0x263F827E8];
      double v4 = SUUIBundle();
      double v5 = @"ChevronSwooshTitle";
      goto LABEL_9;
    case 5:
      double v3 = (void *)MEMORY[0x263F827E8];
      double v4 = SUUIBundle();
      double v5 = @"ChevronSeeAllLeft";
LABEL_9:
      id v10 = [v3 imageNamed:v5 inBundle:v4];

      break;
    default:
      id v10 = 0;
      break;
  }
  double v6 = [(SUUILinkButton *)self titleColorForState:0];
  if (v6 || ([(SUUILinkButton *)self tintColor], (double v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = [v10 _flatImageWithColor:v6];
  }
  else
  {
    v7 = 0;
  }
  [(SUUILinkButton *)self setImage:v7 forState:0];
  uint64_t v8 = [(SUUILinkButton *)self titleColorForState:1];
  if (v8)
  {
    objc_super v9 = [v10 _flatImageWithColor:v8];
  }
  else
  {
    objc_super v9 = 0;
  }
  [(SUUILinkButton *)self setImage:v9 forState:1];
}

- (int64_t)arrowStyle
{
  return self->_arrowStyle;
}

@end