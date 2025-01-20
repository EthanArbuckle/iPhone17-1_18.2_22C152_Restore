@interface TwoLineCollectionViewListCell
+ (BOOL)hasClearBackground;
+ (double)cellHeight;
+ (double)estimatedCellHeight;
+ (id)identifier;
- (BOOL)canBecomeFirstResponder;
- (NSLayoutConstraint)leadingContraint;
- (PersonalizedItem)personalizedItemForQuickActionMenu;
- (TwoLineCollectionViewListCell)initWithFrame:(CGRect)a3;
- (TwoLinesContentView)twoLinesContentView;
- (TwoLinesContentViewModel)viewModel;
- (double)leadingPadding;
- (double)leadingSpace;
- (void)_updateAccessories;
- (void)setLeadingContraint:(id)a3;
- (void)setLeadingSpace:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTwoLinesContentView:(id)a3;
- (void)setViewModel:(id)a3;
- (void)updateLeadingSpace:(double)a3;
@end

@implementation TwoLineCollectionViewListCell

- (PersonalizedItem)personalizedItemForQuickActionMenu
{
  v2 = self;
  v3 = [(TwoLineCollectionViewListCell *)v2 viewModel];
  v4 = v3;
  if (v3)
  {
    v5 = (uint64_t (**)(void))[(TwoLinesContentViewModel *)v3 personalizedItemForQuickActionMenuCreator];
    swift_unknownObjectRelease();
    if (v5)
    {
      v4 = (TwoLinesContentViewModel *)(id)v5[2](v5);
      _Block_release(v5);
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

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

+ (BOOL)hasClearBackground
{
  return 1;
}

- (TwoLineCollectionViewListCell)initWithFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)TwoLineCollectionViewListCell;
  v3 = -[TwoLineCollectionViewListCell initWithFrame:](&v30, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if ([(id)objc_opt_class() hasClearBackground])
    {
      v4 = +[UIColor clearColor];
      [(TwoLineCollectionViewListCell *)v3 setBackgroundColor:v4];

      id v5 = objc_alloc_init((Class)UIView);
      [(TwoLineCollectionViewListCell *)v3 setBackgroundView:v5];
    }
    v6 = -[TwoLinesContentView initWithFrame:]([TwoLinesContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    twoLinesContentView = v3->_twoLinesContentView;
    v3->_twoLinesContentView = v6;

    [(TwoLinesContentView *)v3->_twoLinesContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(TwoLineCollectionViewListCell *)v3 contentView];
    [v8 addSubview:v3->_twoLinesContentView];

    v9 = [(TwoLinesContentView *)v3->_twoLinesContentView leadingAnchor];
    v10 = [(TwoLineCollectionViewListCell *)v3 contentView];
    v11 = [v10 leadingAnchor];
    [(TwoLineCollectionViewListCell *)v3 leadingPadding];
    uint64_t v12 = [v9 constraintEqualToAnchor:v11];
    leadingContraint = v3->_leadingContraint;
    v3->_leadingContraint = (NSLayoutConstraint *)v12;

    v28 = [(TwoLinesContentView *)v3->_twoLinesContentView topAnchor];
    v29 = [(TwoLineCollectionViewListCell *)v3 contentView];
    v27 = [v29 topAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v31[0] = v26;
    v31[1] = v3->_leadingContraint;
    v14 = [(TwoLinesContentView *)v3->_twoLinesContentView trailingAnchor];
    v15 = [(TwoLineCollectionViewListCell *)v3 contentView];
    v16 = [v15 trailingAnchor];
    v17 = [v14 constraintEqualToAnchor:v16 constant:-10.0];
    v31[2] = v17;
    v18 = [(TwoLinesContentView *)v3->_twoLinesContentView bottomAnchor];
    v19 = [(TwoLineCollectionViewListCell *)v3 contentView];
    v20 = [v19 bottomAnchor];
    LODWORD(v21) = 1144750080;
    v22 = [v18 constraintEqualToAnchor:v20 constant:0.0 priority:v21];
    v31[3] = v22;
    v23 = +[NSArray arrayWithObjects:v31 count:4];
    +[NSLayoutConstraint activateConstraints:v23];

    if (sub_1000BBB44(v3) == 5) {
      [(TwoLineCollectionViewListCell *)v3 _maps_setCollectionViewCellBackgroundConfiguration];
    }
    v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v3 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return sub_1000BBB44(self) == 5;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TwoLineCollectionViewListCell;
  -[TwoLineCollectionViewListCell setSelected:](&v5, "setSelected:");
  [(TwoLinesContentView *)self->_twoLinesContentView setIsParentCellSelected:v3];
}

- (double)leadingPadding
{
  sub_1000BBB44(self);
  [(TwoLineCollectionViewListCell *)self setLeadingSpace:16.0];

  [(TwoLineCollectionViewListCell *)self leadingSpace];
  return result;
}

- (void)updateLeadingSpace:(double)a3
{
  if (self->_leadingSpace != a3)
  {
    objc_super v5 = [(TwoLineCollectionViewListCell *)self leadingContraint];
    [v5 setActive:0];

    self->_leadingSpace = a3;
    v6 = [(TwoLinesContentView *)self->_twoLinesContentView leadingAnchor];
    v7 = [(TwoLineCollectionViewListCell *)self contentView];
    v8 = [v7 leadingAnchor];
    v9 = [v6 constraintEqualToAnchor:v8 constant:a3];
    [(TwoLineCollectionViewListCell *)self setLeadingContraint:v9];

    id v10 = [(TwoLineCollectionViewListCell *)self leadingContraint];
    [v10 setActive:1];
  }
}

- (void)setViewModel:(id)a3
{
  objc_super v5 = (TwoLinesContentViewModel *)a3;
  viewModel = self->_viewModel;
  v11 = v5;
  if (viewModel != v5)
  {
    v7 = [(TwoLinesContentViewModel *)viewModel observers];
    [v7 unregisterObserver:self];

    objc_storeStrong((id *)&self->_viewModel, a3);
    [(TwoLinesContentView *)self->_twoLinesContentView setViewModel:v11];
    v8 = [(TwoLinesContentViewModel *)self->_viewModel observers];
    [v8 registerObserver:self];

    v9 = [(TwoLinesContentView *)self->_twoLinesContentView viewModel];
    id v10 = [v9 axIdentifier];
    [(TwoLineCollectionViewListCell *)self setAccessibilityIdentifier:v10];

    [(TwoLineCollectionViewListCell *)self _updateAccessories];
  }
}

- (void)_updateAccessories
{
  BOOL v3 = [(TwoLinesContentViewModel *)self->_viewModel customAccessoryView];
  if (!v3)
  {
    id v6 = [(TwoLinesContentViewModel *)self->_viewModel cellAccessories];
    if (![v6 count])
    {
      [(TwoLineCollectionViewListCell *)self setAccessories:&__NSArray0__struct];
      goto LABEL_13;
    }
    uint64_t v13 = [(TwoLinesContentViewModel *)self->_viewModel cellAccessories];
    v7 = (void *)v13;
    if (v13) {
      uint64_t v12 = (void *)v13;
    }
    else {
      uint64_t v12 = &__NSArray0__struct;
    }
    v11 = self;
    goto LABEL_10;
  }
  id v4 = objc_alloc((Class)UICellAccessoryCustomView);
  objc_super v5 = [(TwoLinesContentViewModel *)self->_viewModel customAccessoryView];
  id v6 = [v4 initWithCustomView:v5 placement:1];

  [v6 setReservedLayoutWidth:0.0];
  id v14 = v6;
  v7 = +[NSArray arrayWithObjects:&v14 count:1];
  v8 = [(TwoLineCollectionViewListCell *)self accessories];
  if (v8 == v7)
  {

    goto LABEL_12;
  }
  v9 = v8;
  unsigned __int8 v10 = [v8 isEqual:v7];

  if ((v10 & 1) == 0)
  {
    v11 = self;
    uint64_t v12 = v7;
LABEL_10:
    [(TwoLineCollectionViewListCell *)v11 setAccessories:v12];
  }
LABEL_12:

LABEL_13:
}

- (TwoLinesContentViewModel)viewModel
{
  return self->_viewModel;
}

- (TwoLinesContentView)twoLinesContentView
{
  return self->_twoLinesContentView;
}

- (void)setTwoLinesContentView:(id)a3
{
}

- (NSLayoutConstraint)leadingContraint
{
  return self->_leadingContraint;
}

- (void)setLeadingContraint:(id)a3
{
}

- (double)leadingSpace
{
  return self->_leadingSpace;
}

- (void)setLeadingSpace:(double)a3
{
  self->_leadingSpace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingContraint, 0);
  objc_storeStrong((id *)&self->_twoLinesContentView, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end