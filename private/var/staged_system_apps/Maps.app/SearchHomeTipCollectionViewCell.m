@interface SearchHomeTipCollectionViewCell
+ (id)identifier;
- (BOOL)canBecomeFirstResponder;
- (SearchHomeTipCollectionViewCell)initWithFrame:(CGRect)a3;
- (SearchHomeTipView)searchHomeTipView;
- (void)setSearchHomeTipView:(id)a3;
@end

@implementation SearchHomeTipCollectionViewCell

- (SearchHomeTipCollectionViewCell)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SearchHomeTipCollectionViewCell;
  v3 = -[SearchHomeTipCollectionViewCell initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(SearchHomeTipCollectionViewCell *)v3 setAccessibilityIdentifier:v5];

    v6 = +[UIColor clearColor];
    [(SearchHomeTipCollectionViewCell *)v3 setBackgroundColor:v6];

    v7 = +[UIColor clearColor];
    v8 = [(SearchHomeTipCollectionViewCell *)v3 contentView];
    [v8 setBackgroundColor:v7];

    v9 = [SearchHomeTipView alloc];
    v10 = [(SearchHomeTipCollectionViewCell *)v3 contentView];
    [v10 bounds];
    v11 = -[SearchHomeTipView initWithFrame:](v9, "initWithFrame:");
    searchHomeTipView = v3->_searchHomeTipView;
    v3->_searchHomeTipView = v11;

    [(SearchHomeTipView *)v3->_searchHomeTipView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [(SearchHomeTipCollectionViewCell *)v3 contentView];
    [v13 addSubview:v3->_searchHomeTipView];

    v14 = v3->_searchHomeTipView;
    v15 = [(SearchHomeTipCollectionViewCell *)v3 contentView];
    LODWORD(v16) = 1148846080;
    v17 = -[SearchHomeTipView _maps_constraintsEqualToEdgesOfView:insets:priority:](v14, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v15, 0.0, 10.0, 0.0, 10.0, v16);
    v18 = [v17 allConstraints];
    +[NSLayoutConstraint activateConstraints:v18];
  }
  return v3;
}

+ (id)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (BOOL)canBecomeFirstResponder
{
  return sub_1000BBB44(self) == 5;
}

- (SearchHomeTipView)searchHomeTipView
{
  return self->_searchHomeTipView;
}

- (void)setSearchHomeTipView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end