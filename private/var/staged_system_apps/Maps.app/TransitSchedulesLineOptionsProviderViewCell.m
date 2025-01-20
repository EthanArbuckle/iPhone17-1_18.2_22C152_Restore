@interface TransitSchedulesLineOptionsProviderViewCell
- (TransitSchedulesLineOptionsProviderViewCell)initWithFrame:(CGRect)a3;
- (id)viewModel;
- (void)setTitle:(id)a3 symbolName:(id)a4 action:(id)a5 axIdentifierForAction:(id)a6;
- (void)setViewModel:(id)a3;
@end

@implementation TransitSchedulesLineOptionsProviderViewCell

- (TransitSchedulesLineOptionsProviderViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v31.receiver = self;
  v31.super_class = (Class)TransitSchedulesLineOptionsProviderViewCell;
  v7 = -[MapsThemeCollectionViewCell initWithFrame:](&v31, "initWithFrame:");
  if (v7)
  {
    v8 = [objc_alloc((Class)MUButtonCellRowView) initWithFrame:x, y, width, height];
    mapsUIButtonCellView = v7->_mapsUIButtonCellView;
    v7->_mapsUIButtonCellView = v8;

    [(MUButtonCellRowView *)v7->_mapsUIButtonCellView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MUButtonCellRowView *)v7->_mapsUIButtonCellView setHandlesHighlighting:1];
    [(MUButtonCellRowView *)v7->_mapsUIButtonCellView setBottomHairlineHidden:1];
    v10 = +[UIColor tableCellGroupedBackgroundColor];
    v11 = [(TransitSchedulesLineOptionsProviderViewCell *)v7 contentView];
    [v11 setBackgroundColor:v10];

    v12 = [(TransitSchedulesLineOptionsProviderViewCell *)v7 contentView];
    [v12 addSubview:v7->_mapsUIButtonCellView];

    v29 = [(MUButtonCellRowView *)v7->_mapsUIButtonCellView topAnchor];
    v30 = [(TransitSchedulesLineOptionsProviderViewCell *)v7 contentView];
    v28 = [v30 topAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v32[0] = v27;
    v25 = [(MUButtonCellRowView *)v7->_mapsUIButtonCellView bottomAnchor];
    v26 = [(TransitSchedulesLineOptionsProviderViewCell *)v7 contentView];
    v24 = [v26 bottomAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v32[1] = v23;
    v13 = [(MUButtonCellRowView *)v7->_mapsUIButtonCellView leadingAnchor];
    v14 = [(TransitSchedulesLineOptionsProviderViewCell *)v7 contentView];
    v15 = [v14 leadingAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v32[2] = v16;
    v17 = [(MUButtonCellRowView *)v7->_mapsUIButtonCellView trailingAnchor];
    v18 = [(TransitSchedulesLineOptionsProviderViewCell *)v7 contentView];
    v19 = [v18 trailingAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    v32[3] = v20;
    v21 = +[NSArray arrayWithObjects:v32 count:4];
    +[NSLayoutConstraint activateConstraints:v21];

    [(TransitSchedulesLineOptionsProviderViewCell *)v7 setAccessibilityIdentifier:@"TransitSchedulesLineOptionsProviderViewCell"];
  }
  return v7;
}

- (void)setTitle:(id)a3 symbolName:(id)a4 action:(id)a5 axIdentifierForAction:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[TransitSchedulesLineOptionsProviderViewModel alloc] initWithTitle:v13 symbolName:v12 action:v11 axIdentifierForAction:v10];

  [(MUButtonCellRowView *)self->_mapsUIButtonCellView setViewModel:v14];
}

- (void)setViewModel:(id)a3
{
}

- (id)viewModel
{
  return [(MUButtonCellRowView *)self->_mapsUIButtonCellView viewModel];
}

- (void).cxx_destruct
{
}

@end