@interface TwoLinesTableViewCell
+ (double)cellHeight;
+ (double)estimatedCellHeight;
+ (id)identifier;
- (AutocompleteCellAccessoryDelegate)accessoryViewDelegate;
- (BOOL)canBecomeFirstResponder;
- (CGSize)intrinsicContentSize;
- (PersonalizedItem)personalizedItemForQuickActionMenu;
- (PlaceContextViewModelCellDelegate)placeContextViewModelDelegate;
- (TwoLinesContentViewModel)viewModel;
- (TwoLinesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (TwoLinesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 contentViewType:(int)a5;
- (double)leadingSpacing;
- (id)accessoryViewObject;
- (int64_t)accessoryViewType;
- (void)didTapAccessoryViewButton:(id)a3;
- (void)didTapOnPlaceContextWithViewModel:(id)a3 parentView:(id)a4;
- (void)prepareContentView;
- (void)prepareForReuse;
- (void)setAccessoryViewDelegate:(id)a3;
- (void)setAccessoryViewObject:(id)a3;
- (void)setAccessoryViewType:(int64_t)a3;
- (void)setPlaceContextViewModelDelegate:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setViewModel:(id)a3;
@end

@implementation TwoLinesTableViewCell

+ (double)cellHeight
{
  return UITableViewAutomaticDimension;
}

+ (double)estimatedCellHeight
{
  +[UIFont _maps_bodyScaledValueForValue:72.0];
  return result;
}

+ (id)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (TwoLinesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return [(TwoLinesTableViewCell *)self initWithStyle:a3 reuseIdentifier:a4 contentViewType:0];
}

- (TwoLinesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 contentViewType:(int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)TwoLinesTableViewCell;
  v6 = [(MapsThemeTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  v7 = v6;
  if (v6)
  {
    v6->_contentViewType = a5;
    [(TwoLinesTableViewCell *)v6 prepareContentView];
    if (sub_1000BBB44(v7) == 5) {
      [(TwoLinesTableViewCell *)v7 _maps_setTableViewCellBackgroundConfiguration];
    }
  }
  return v7;
}

- (BOOL)canBecomeFirstResponder
{
  return sub_1000BBB44(self) == 5;
}

- (void)prepareContentView
{
  v3 = [(TwoLinesTableViewCell *)self _tableView];
  id v4 = [v3 style];

  if (v4 != (id)2)
  {
    v5 = +[UIColor clearColor];
    [(TwoLinesTableViewCell *)self setBackgroundColor:v5];
  }
  v6 = -[TwoLinesContentView initWithFrame:contentViewType:]([TwoLinesContentView alloc], "initWithFrame:contentViewType:", self->_contentViewType, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  twoLinesContentView = self->_twoLinesContentView;
  self->_twoLinesContentView = v6;

  [(TwoLinesContentView *)self->_twoLinesContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TwoLinesContentView *)self->_twoLinesContentView setPlaceContextViewModelDelegate:self];
  v8 = [(TwoLinesTableViewCell *)self contentView];
  [v8 addSubview:self->_twoLinesContentView];

  v25 = [(TwoLinesContentView *)self->_twoLinesContentView topAnchor];
  v26 = [(TwoLinesTableViewCell *)self contentView];
  v24 = [v26 topAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v27[0] = v23;
  v21 = [(TwoLinesContentView *)self->_twoLinesContentView leadingAnchor];
  v22 = [(TwoLinesTableViewCell *)self contentView];
  v20 = [v22 leadingAnchor];
  [(TwoLinesTableViewCell *)self leadingSpacing];
  objc_super v9 = [v21 constraintEqualToAnchor:v20];
  v27[1] = v9;
  v10 = [(TwoLinesContentView *)self->_twoLinesContentView trailingAnchor];
  v11 = [(TwoLinesTableViewCell *)self contentView];
  v12 = [v11 trailingAnchor];
  v13 = [v10 constraintEqualToAnchor:v12 constant:-10.0];
  v27[2] = v13;
  v14 = [(TwoLinesContentView *)self->_twoLinesContentView bottomAnchor];
  v15 = [(TwoLinesTableViewCell *)self contentView];
  v16 = [v15 bottomAnchor];
  LODWORD(v17) = 1112276992;
  v18 = [v14 constraintEqualToAnchor:v16 constant:0.0 priority:v17];
  v27[3] = v18;
  v19 = +[NSArray arrayWithObjects:v27 count:4];
  +[NSLayoutConstraint activateConstraints:v19];
}

- (double)leadingSpacing
{
  return 16.0;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)TwoLinesTableViewCell;
  [(TwoLinesTableViewCell *)&v3 prepareForReuse];
  [(TwoLinesTableViewCell *)self setAccessoryViewType:0];
  [(TwoLinesTableViewCell *)self setAccessoryViewObject:0];
  [(TwoLinesTableViewCell *)self setAccessoryViewDelegate:0];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TwoLinesTableViewCell;
  [(TwoLinesTableViewCell *)&v6 setSelected:a3 animated:a4];
  [(TwoLinesContentView *)self->_twoLinesContentView setIsParentCellSelected:v4];
}

- (CGSize)intrinsicContentSize
{
  objc_super v3 = [(TwoLinesTableViewCell *)self contentView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v19.receiver = self;
  v19.super_class = (Class)TwoLinesTableViewCell;
  [(TwoLinesTableViewCell *)&v19 intrinsicContentSize];
  double v13 = v12;
  double v15 = v14;
  v16 = [(TwoLinesTableViewCell *)self contentView];
  [v16 setFrame:v5, v7, v9, v11];

  double v17 = v13;
  double v18 = v15;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)setAccessoryViewType:(int64_t)a3
{
  self->_accessoryViewType = a3;
  switch(a3)
  {
    case 1:
      id v27 = +[UIButton buttonWithType:0];
      [v27 setBounds:0.0, 0.0, 30.0, 30.0];
      double v4 = +[UIDevice currentDevice];
      id v5 = [v4 userInterfaceIdiom];
      double v6 = @"plus";
      if (v5 == (id)5) {
        double v6 = @"plus.circle";
      }
      double v7 = v6;

      double v8 = +[UIImage systemImageNamed:v7];

      [v27 setImage:v8 forState:0];
      double v9 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
      [v27 setPreferredSymbolConfiguration:v9 forImageInState:0];

      double v10 = [v27 theme];
      double v11 = [v10 keyColor];
      [v27 setTintColor:v11];

      CFStringRef v12 = @"AccessoryAddButton";
      goto LABEL_10;
    case 2:
      id v27 = +[UIButton buttonWithType:0];
      [v27 setBounds:0.0, 0.0, 30.0, 30.0];
      double v13 = +[UIImage systemImageNamed:@"arrow.up.backward.circle"];
      [v27 setImage:v13 forState:0];

      double v14 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
      [v27 setPreferredSymbolConfiguration:v14 forImageInState:0];

      double v15 = +[UIColor secondaryLabelColor];
      [v27 setTintColor:v15];

      CFStringRef v12 = @"AccessoryQueryAcceleratorButton";
      goto LABEL_10;
    case 3:
      id v27 = +[UIButton buttonWithType:0];
      [v27 setBounds:0.0, 0.0, 30.0, 30.0];
      v16 = +[UIImage systemImageNamed:@"checkmark"];
      [v27 setImage:v16 forState:0];

      double v17 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
      [v27 setPreferredSymbolConfiguration:v17 forImageInState:0];

      double v18 = +[UIColor secondaryLabelColor];
      [v27 setTintColor:v18];

      CFStringRef v12 = @"AccessoryCheckmarkButton";
      goto LABEL_10;
    case 4:
      id v27 = +[UIButton buttonWithType:0];
      [v27 setBounds:0.0, 0.0, 30.0, 30.0];
      objc_super v19 = +[UIDevice currentDevice];
      id v20 = [v19 userInterfaceIdiom];
      v21 = @"pin";
      if (v20 == (id)5) {
        v21 = @"pin.circle";
      }
      v22 = v21;

      v23 = +[UIImage systemImageNamed:v22];

      [v27 setImage:v23 forState:0];
      v24 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
      [v27 setPreferredSymbolConfiguration:v24 forImageInState:0];

      v25 = [v27 theme];
      v26 = [v25 keyColor];
      [v27 setTintColor:v26];

      CFStringRef v12 = @"AccessoryPinButton";
LABEL_10:
      [v27 setAccessibilityIdentifier:v12];
      if (!v27) {
        goto LABEL_12;
      }
      [v27 addTarget:self action:"didTapAccessoryViewButton:" forControlEvents:64];
      break;
    default:
LABEL_12:
      id v27 = 0;
      break;
  }
  [(TwoLinesTableViewCell *)self setAccessoryView:v27];
}

- (void)didTapAccessoryViewButton:(id)a3
{
  id v6 = [(TwoLinesTableViewCell *)self accessoryViewDelegate];
  int64_t v4 = [(TwoLinesTableViewCell *)self accessoryViewType];
  id v5 = [(TwoLinesTableViewCell *)self accessoryViewObject];
  [v6 didTapOnAccessoryView:self withType:v4 object:v5];
}

- (void)setViewModel:(id)a3
{
  id v5 = (TwoLinesContentViewModel *)a3;
  p_viewModel = &self->_viewModel;
  if (self->_viewModel != v5)
  {
    double v14 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(TwoLinesContentView *)self->_twoLinesContentView setViewModel:v14];
    double v7 = [(TwoLinesContentView *)self->_twoLinesContentView viewModel];
    double v8 = [v7 axIdentifier];
    if ([v8 length])
    {
      double v9 = [(TwoLinesContentView *)self->_twoLinesContentView viewModel];
      double v10 = [v9 axIdentifier];
    }
    else
    {
      double v10 = @"TwoLinesTableViewCell";
    }

    [(TwoLinesTableViewCell *)self setAccessibilityIdentifier:v10];
    double v11 = [(TwoLinesContentViewModel *)*p_viewModel customAccessoryView];
    CFStringRef v12 = [(TwoLinesTableViewCell *)self accessoryView];

    if (v11 != v12)
    {
      double v13 = [(TwoLinesContentViewModel *)*p_viewModel customAccessoryView];
      [(TwoLinesTableViewCell *)self setAccessoryView:v13];
    }
    id v5 = v14;
  }
}

- (PersonalizedItem)personalizedItemForQuickActionMenu
{
  v2 = [(TwoLinesTableViewCell *)self viewModel];
  objc_super v3 = [v2 personalizedItemForQuickActionMenuCreator];

  if (v3)
  {
    int64_t v4 = v3[2](v3);
  }
  else
  {
    int64_t v4 = 0;
  }

  return (PersonalizedItem *)v4;
}

- (void)didTapOnPlaceContextWithViewModel:(id)a3 parentView:(id)a4
{
  id v5 = a3;
  id v6 = [(TwoLinesTableViewCell *)self placeContextViewModelDelegate];
  [v6 didTapOnPlaceContextWithViewModel:v5 parentView:self];
}

- (AutocompleteCellAccessoryDelegate)accessoryViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryViewDelegate);

  return (AutocompleteCellAccessoryDelegate *)WeakRetained;
}

- (void)setAccessoryViewDelegate:(id)a3
{
}

- (id)accessoryViewObject
{
  return self->_accessoryViewObject;
}

- (void)setAccessoryViewObject:(id)a3
{
}

- (int64_t)accessoryViewType
{
  return self->_accessoryViewType;
}

- (PlaceContextViewModelCellDelegate)placeContextViewModelDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeContextViewModelDelegate);

  return (PlaceContextViewModelCellDelegate *)WeakRetained;
}

- (void)setPlaceContextViewModelDelegate:(id)a3
{
}

- (TwoLinesContentViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_placeContextViewModelDelegate);
  objc_storeStrong(&self->_accessoryViewObject, 0);
  objc_destroyWeak((id *)&self->_accessoryViewDelegate);

  objc_storeStrong((id *)&self->_twoLinesContentView, 0);
}

@end