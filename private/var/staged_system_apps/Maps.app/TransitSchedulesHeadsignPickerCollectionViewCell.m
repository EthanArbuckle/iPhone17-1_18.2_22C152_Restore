@interface TransitSchedulesHeadsignPickerCollectionViewCell
+ (NSString)cellIdentifier;
- (TransitSchedulesHeadsignPickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (TransitSchedulesHeadsignPickerCollectionViewCellDelegate)delegate;
- (void)_updateDeparturePickerWithSelectedDepartureSequence:(id)a3;
- (void)configureViews;
- (void)setDelegate:(id)a3;
- (void)setDepartureSequences:(id)a3 withSelectedDepartureSequence:(id)a4;
@end

@implementation TransitSchedulesHeadsignPickerCollectionViewCell

- (TransitSchedulesHeadsignPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TransitSchedulesHeadsignPickerCollectionViewCell;
  v3 = -[TransitSchedulesHeadsignPickerCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(TransitSchedulesHeadsignPickerCollectionViewCell *)v3 configureViews];
  }
  return v4;
}

- (void)configureViews
{
  v3 = [(TransitSchedulesHeadsignPickerCollectionViewCell *)self contentView];
  [v3 setAccessibilityIdentifier:@"TransitSchedulesHeadsignPickerCollectionViewCell"];
  v4 = +[UIButton buttonWithType:124];
  picker = self->_picker;
  self->_picker = v4;

  objc_super v6 = [(UIButton *)self->_picker titleLabel];
  [v6 setTextAlignment:0];

  [(UIButton *)self->_picker setContentHorizontalAlignment:1];
  [(UIButton *)self->_picker setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_picker setShowsMenuAsPrimaryAction:1];
  [(UIButton *)self->_picker setContextMenuInteractionEnabled:1];
  [(UIButton *)self->_picker setAccessibilityIdentifier:@"TransitSchedulesHeadsignPickerCollectionViewCellPicker"];
  [v3 addSubview:self->_picker];
  v19 = [(UIButton *)self->_picker leadingAnchor];
  v18 = [v3 leadingAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v20[0] = v17;
  v16 = [(UIButton *)self->_picker trailingAnchor];
  v7 = [v3 trailingAnchor];
  v8 = [v16 constraintEqualToAnchor:v7];
  v20[1] = v8;
  v9 = [(UIButton *)self->_picker topAnchor];
  v10 = [v3 topAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v20[2] = v11;
  v12 = [(UIButton *)self->_picker bottomAnchor];
  v13 = [v3 bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v20[3] = v14;
  v15 = +[NSArray arrayWithObjects:v20 count:4];
  +[NSLayoutConstraint activateConstraints:v15];
}

+ (NSString)cellIdentifier
{
  return (NSString *)@"TransitSchedulesHeadsignPickerCellIdentifier";
}

- (void)setDepartureSequences:(id)a3 withSelectedDepartureSequence:(id)a4
{
  id v8 = a4;
  objc_super v6 = (NSArray *)[a3 copy];
  departureSequences = self->_departureSequences;
  self->_departureSequences = v6;

  [(TransitSchedulesHeadsignPickerCollectionViewCell *)self _updateDeparturePickerWithSelectedDepartureSequence:v8];
}

- (void)_updateDeparturePickerWithSelectedDepartureSequence:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  objc_initWeak(&location, self);
  departureSequences = self->_departureSequences;
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_100A5141C;
  v13 = &unk_101315368;
  objc_copyWeak(&v16, &location);
  id v7 = v4;
  id v14 = v7;
  id v8 = v5;
  id v15 = v8;
  [(NSArray *)departureSequences enumerateObjectsUsingBlock:&v10];
  v9 = +[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_101324E70, v8, v10, v11, v12, v13);
  [(UIButton *)self->_picker setMenu:v9];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (TransitSchedulesHeadsignPickerCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TransitSchedulesHeadsignPickerCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_departureSequences, 0);

  objc_storeStrong((id *)&self->_picker, 0);
}

@end