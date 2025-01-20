@interface SmallButtonOutlineCell
- (SmallButtonOutlineCell)initWithFrame:(CGRect)a3;
- (SmallButtonOutlineCellModel)cellModel;
- (void)_buttonTapped:(id)a3;
- (void)_updateFromModel;
- (void)_updateImage;
- (void)_updateTitleColor;
- (void)hoverSourceStateDidChange:(id)a3;
- (void)setCellModel:(id)a3;
- (void)tintColorDidChange;
@end

@implementation SmallButtonOutlineCell

- (SmallButtonOutlineCell)initWithFrame:(CGRect)a3
{
  v32.receiver = self;
  v32.super_class = (Class)SmallButtonOutlineCell;
  v3 = -[SidebarOutlineCell initWithFrame:](&v32, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[MapsThemeButton buttonWithType:0];
    button = v3->_button;
    v3->_button = (MapsThemeButton *)v4;

    [(MapsThemeButton *)v3->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = sub_100A92448();
    v7 = [(MapsThemeButton *)v3->_button titleLabel];
    [v7 setFont:v6];

    v8 = sub_100A92454();
    v9 = [(MapsThemeButton *)v3->_button imageView];
    [v9 setPreferredSymbolConfiguration:v8];

    [(MapsThemeButton *)v3->_button addTarget:v3 action:"_buttonTapped:" forControlEvents:64];
    v10 = [(SmallButtonOutlineCell *)v3 contentView];
    [v10 addSubview:v3->_button];

    v30 = [(MapsThemeButton *)v3->_button topAnchor];
    v31 = [(SmallButtonOutlineCell *)v3 contentView];
    v29 = [v31 topAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v33[0] = v28;
    v26 = [(MapsThemeButton *)v3->_button leadingAnchor];
    v27 = [(SmallButtonOutlineCell *)v3 contentView];
    v25 = [v27 layoutMarginsGuide];
    v24 = [v25 leadingAnchor];
    v23 = [v26 constraintEqualToAnchor:v24];
    v33[1] = v23;
    v22 = [(MapsThemeButton *)v3->_button trailingAnchor];
    v11 = [(SmallButtonOutlineCell *)v3 contentView];
    v12 = [v11 layoutMarginsGuide];
    v13 = [v12 trailingAnchor];
    v14 = [v22 constraintLessThanOrEqualToAnchor:v13];
    v33[2] = v14;
    v15 = [(MapsThemeButton *)v3->_button bottomAnchor];
    v16 = [(SmallButtonOutlineCell *)v3 contentView];
    v17 = [v16 bottomAnchor];
    LODWORD(v18) = 1112276992;
    v19 = [v15 constraintEqualToAnchor:v17 constant:0.0 priority:v18];
    v33[3] = v19;
    v20 = +[NSArray arrayWithObjects:v33 count:4];
    +[NSLayoutConstraint activateConstraints:v20];
  }
  return v3;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SmallButtonOutlineCell;
  [(SmallButtonOutlineCell *)&v3 tintColorDidChange];
  [(SmallButtonOutlineCell *)self _updateTitleColor];
}

- (void)setCellModel:(id)a3
{
  v5 = (SmallButtonOutlineCellModel *)a3;
  v6 = v5;
  if (self->_cellModel != v5)
  {
    v8 = v5;
    unsigned __int8 v7 = -[SmallButtonOutlineCellModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cellModel, a3);
      [(SmallButtonOutlineCell *)self _updateFromModel];
      v6 = v8;
    }
  }
}

- (void)_updateFromModel
{
  button = self->_button;
  uint64_t v4 = [(SmallButtonOutlineCellModel *)self->_cellModel title];
  [(MapsThemeButton *)button setTitle:v4 forState:0];

  [(MapsThemeButton *)self->_button setAccessibilityIdentifier:@"SmallButton"];
  [(SmallButtonOutlineCell *)self _updateTitleColor];

  [(SmallButtonOutlineCell *)self _updateImage];
}

- (void)_updateTitleColor
{
  int64_t v3 = [(SmallButtonOutlineCellModel *)self->_cellModel style];
  if (v3 == 1)
  {
    unsigned __int8 v7 = +[UIColor secondaryLabelColor];
    [(MapsThemeButton *)self->_button setTintColor:v7];

    button = self->_button;
    uint64_t v5 = +[UIColor secondaryLabelColor];
    v6 = button;
  }
  else
  {
    if (v3) {
      return;
    }
    [(MapsThemeButton *)self->_button setTintColor:0];
    uint64_t v4 = self->_button;
    uint64_t v5 = [(SmallButtonOutlineCell *)self tintColor];
    v6 = v4;
  }
  id v9 = (id)v5;
  -[MapsThemeButton setTitleColor:forState:](v6, "setTitleColor:forState:");
}

- (void)_updateImage
{
  int64_t v3 = [(SidebarOutlineCell *)self hoverSource];
  id v19 = [v3 hoverGestureRecognizer];

  uint64_t v4 = [(SmallButtonOutlineCellModel *)self->_cellModel hoverImage];
  if (v4 && objc_msgSend(v19, "_maps_isHovering"))
  {
    [(MapsThemeButton *)self->_button bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v19 locationInView:self->_button];
    v21.x = v13;
    v21.y = v14;
    v22.origin.x = v6;
    v22.origin.y = v8;
    v22.size.width = v10;
    v22.size.height = v12;
    BOOL v15 = CGRectContainsPoint(v22, v21);

    if (v15)
    {
      button = self->_button;
      uint64_t v17 = [(SmallButtonOutlineCellModel *)self->_cellModel hoverImage];
      goto LABEL_7;
    }
  }
  else
  {
  }
  button = self->_button;
  uint64_t v17 = [(SmallButtonOutlineCellModel *)self->_cellModel image];
LABEL_7:
  double v18 = (void *)v17;
  [(MapsThemeButton *)button setImage:v17 forState:0];
}

- (void)_buttonTapped:(id)a3
{
  id v4 = [(SmallButtonOutlineCellModel *)self->_cellModel delegate];
  [v4 smallButtonOutlineCellTapped:self];
}

- (void)hoverSourceStateDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SmallButtonOutlineCell;
  [(SidebarOutlineCell *)&v4 hoverSourceStateDidChange:a3];
  [(SmallButtonOutlineCell *)self _updateImage];
}

- (SmallButtonOutlineCellModel)cellModel
{
  return self->_cellModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end