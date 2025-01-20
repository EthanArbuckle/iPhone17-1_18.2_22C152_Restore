@interface VenueDropDownOutlineCell
- (VenueDropDownOutlineCell)initWithFrame:(CGRect)a3;
- (VenueDropDownOutlineCellModel)cellModel;
- (void)_itemSelectedCategory:(id)a3;
- (void)_updateFromModel;
- (void)setCellModel:(id)a3;
@end

@implementation VenueDropDownOutlineCell

- (VenueDropDownOutlineCell)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)VenueDropDownOutlineCell;
  v3 = -[SidebarOutlineCell initWithFrame:](&v36, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[MapsRightImageButton buttonWithType:0];
    button = v3->_button;
    v3->_button = (MapsRightImageButton *)v4;

    [(MapsRightImageButton *)v3->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = sub_100A92448();
    v7 = [(MapsRightImageButton *)v3->_button titleLabel];
    [v7 setFont:v6];

    [(MapsThemeButton *)v3->_button setTitleColorProvider:&stru_1012E6340];
    v8 = v3->_button;
    v9 = sub_100A92448();
    v10 = +[UIImageSymbolConfiguration configurationWithFont:v9 scale:2];
    v11 = +[UIImage systemImageNamed:@"chevron.down" withConfiguration:v10];
    [(MapsRightImageButton *)v8 setImage:v11 forState:0];

    v12 = [(VenueDropDownOutlineCell *)v3 theme];
    v13 = [v12 keyColor];
    [(MapsRightImageButton *)v3->_button setTintColor:v13];

    [(MapsRightImageButton *)v3->_button setShowsMenuAsPrimaryAction:1];
    v14 = [(VenueDropDownOutlineCell *)v3 contentView];
    [v14 addSubview:v3->_button];

    v34 = [(MapsRightImageButton *)v3->_button topAnchor];
    v35 = [(VenueDropDownOutlineCell *)v3 contentView];
    v33 = [v35 topAnchor];
    v32 = [v34 constraintEqualToAnchor:v33 constant:4.0];
    v37[0] = v32;
    v30 = [(MapsRightImageButton *)v3->_button leadingAnchor];
    v31 = [(VenueDropDownOutlineCell *)v3 contentView];
    v29 = [v31 layoutMarginsGuide];
    v28 = [v29 leadingAnchor];
    v27 = [v30 constraintEqualToAnchor:v28];
    v37[1] = v27;
    v26 = [(MapsRightImageButton *)v3->_button trailingAnchor];
    v15 = [(VenueDropDownOutlineCell *)v3 contentView];
    v16 = [v15 layoutMarginsGuide];
    v17 = [v16 trailingAnchor];
    v18 = [v26 constraintLessThanOrEqualToAnchor:v17];
    v37[2] = v18;
    v19 = [(MapsRightImageButton *)v3->_button bottomAnchor];
    v20 = [(VenueDropDownOutlineCell *)v3 contentView];
    v21 = [v20 bottomAnchor];
    LODWORD(v22) = 1112276992;
    v23 = [v19 constraintEqualToAnchor:v21 constant:-4.0 priority:v22];
    v37[3] = v23;
    v24 = +[NSArray arrayWithObjects:v37 count:4];
    +[NSLayoutConstraint activateConstraints:v24];
  }
  return v3;
}

- (void)setCellModel:(id)a3
{
  v5 = (VenueDropDownOutlineCellModel *)a3;
  v6 = v5;
  if (self->_cellModel != v5)
  {
    v8 = v5;
    unsigned __int8 v7 = -[VenueDropDownOutlineCellModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cellModel, a3);
      [(VenueDropDownOutlineCell *)self _updateFromModel];
      v6 = v8;
    }
  }
}

- (void)_updateFromModel
{
  button = self->_button;
  uint64_t v4 = [(VenueDropDownOutlineCellModel *)self->_cellModel buttonTitle];
  v5 = [v4 stringByAppendingString:@" "];
  [(MapsRightImageButton *)button setTitle:v5 forState:0];

  [(MapsRightImageButton *)self->_button setAccessibilityIdentifier:@"VenueDropDownButton"];
  v6 = [(VenueDropDownOutlineCellModel *)self->_cellModel categories];
  id v7 = [v6 count];

  if (v7)
  {
    objc_initWeak(&location, self);
    v8 = +[NSMutableArray array];
    v9 = [(VenueDropDownOutlineCellModel *)self->_cellModel categories];
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_10036F9FC;
    v16 = &unk_1012E6390;
    objc_copyWeak(&v19, &location);
    v17 = self;
    id v10 = v8;
    id v18 = v10;
    [v9 enumerateObjectsUsingBlock:&v13];

    v11 = +[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_101324E70, v10, v13, v14, v15, v16, v17);
    [(MapsRightImageButton *)self->_button setMenu:v11];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = self->_button;
    [(MapsRightImageButton *)v12 setMenu:0];
  }
}

- (void)_itemSelectedCategory:(id)a3
{
  cellModel = self->_cellModel;
  id v5 = a3;
  id v6 = [(VenueDropDownOutlineCellModel *)cellModel delegate];
  [v6 venuesDropDownOutlineCell:self didSelectCategory:v5];
}

- (VenueDropDownOutlineCellModel)cellModel
{
  return self->_cellModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end