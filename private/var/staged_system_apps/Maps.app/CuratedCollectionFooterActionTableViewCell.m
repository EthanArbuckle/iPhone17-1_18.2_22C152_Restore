@interface CuratedCollectionFooterActionTableViewCell
+ (id)reuseIdentifier;
- (CuratedCollectionFooterActionItem)actionItem;
- (CuratedCollectionFooterActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MUCirclePlatterView)platterView;
- (UILabel)actionTitleLabel;
- (void)initializeSubviews;
- (void)prepareForReuse;
- (void)setActionItem:(id)a3;
- (void)setActionTitleLabel:(id)a3;
- (void)setPlatterView:(id)a3;
@end

@implementation CuratedCollectionFooterActionTableViewCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (CuratedCollectionFooterActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionFooterActionTableViewCell;
  v4 = [(MapsThemeTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIColor clearColor];
    [(CuratedCollectionFooterActionTableViewCell *)v4 setBackgroundColor:v5];

    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [(CuratedCollectionFooterActionTableViewCell *)v4 setAccessibilityIdentifier:v7];

    [(CuratedCollectionFooterActionTableViewCell *)v4 initializeSubviews];
  }
  return v4;
}

- (void)initializeSubviews
{
  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  actionTitleLabel = self->_actionTitleLabel;
  self->_actionTitleLabel = v3;

  [(UILabel *)self->_actionTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = +[UIColor clearColor];
  [(UILabel *)self->_actionTitleLabel setBackgroundColor:v5];

  v6 = +[UIColor systemBlueColor];
  [(UILabel *)self->_actionTitleLabel setTextColor:v6];

  [(UILabel *)self->_actionTitleLabel setNumberOfLines:1];
  [(UILabel *)self->_actionTitleLabel setAccessibilityIdentifier:@"ActionTitleLabel"];
  v7 = [(CuratedCollectionFooterActionTableViewCell *)self contentView];
  [v7 addSubview:self->_actionTitleLabel];

  v8 = [objc_alloc((Class)MUCirclePlatterView) initWithFrame:0.0, 0.0, 37.0, 37.0];
  platterView = self->_platterView;
  self->_platterView = v8;

  [(MUCirclePlatterView *)self->_platterView setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = +[UIColor systemBlueColor];
  [(MUCirclePlatterView *)self->_platterView setGlyphColor:v10];

  [(MUCirclePlatterView *)self->_platterView setContentMode:1];
  [(MUCirclePlatterView *)self->_platterView setAccessibilityIdentifier:@"PlatterView"];
  v11 = [(CuratedCollectionFooterActionTableViewCell *)self contentView];
  [v11 addSubview:self->_platterView];

  v41 = [(UILabel *)self->_actionTitleLabel leadingAnchor];
  v42 = [(CuratedCollectionFooterActionTableViewCell *)self contentView];
  v40 = [v42 leadingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40 constant:16.0];
  v43[0] = v39;
  v37 = [(UILabel *)self->_actionTitleLabel topAnchor];
  v38 = [(CuratedCollectionFooterActionTableViewCell *)self contentView];
  v36 = [v38 topAnchor];
  v35 = [v37 constraintEqualToAnchor:v36 constant:16.0];
  v43[1] = v35;
  v33 = [(UILabel *)self->_actionTitleLabel bottomAnchor];
  v34 = [(CuratedCollectionFooterActionTableViewCell *)self contentView];
  v32 = [v34 bottomAnchor];
  v31 = [v33 constraintEqualToAnchor:v32 constant:-16.0];
  v43[2] = v31;
  v30 = [(UILabel *)self->_actionTitleLabel trailingAnchor];
  v29 = [(MUCirclePlatterView *)self->_platterView leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29 constant:-16.0];
  v43[3] = v28;
  v26 = [(MUCirclePlatterView *)self->_platterView centerYAnchor];
  v27 = [(CuratedCollectionFooterActionTableViewCell *)self contentView];
  v25 = [v27 centerYAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v43[4] = v24;
  v22 = [(MUCirclePlatterView *)self->_platterView trailingAnchor];
  v23 = [(CuratedCollectionFooterActionTableViewCell *)self contentView];
  v12 = [v23 trailingAnchor];
  v13 = [v22 constraintEqualToAnchor:v12 constant:-16.0];
  v43[5] = v13;
  v14 = [(MUCirclePlatterView *)self->_platterView widthAnchor];
  v15 = [v14 constraintEqualToConstant:37.0];
  v43[6] = v15;
  v16 = [(MUCirclePlatterView *)self->_platterView heightAnchor];
  v17 = [v16 constraintEqualToConstant:37.0];
  v43[7] = v17;
  v18 = [(CuratedCollectionFooterActionTableViewCell *)self contentView];
  v19 = [v18 heightAnchor];
  v20 = [v19 constraintEqualToConstant:60.0];
  v43[8] = v20;
  v21 = +[NSArray arrayWithObjects:v43 count:9];
  +[NSLayoutConstraint activateConstraints:v21];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CuratedCollectionFooterActionTableViewCell;
  [(CuratedCollectionFooterActionTableViewCell *)&v5 prepareForReuse];
  v3 = [(CuratedCollectionFooterActionTableViewCell *)self actionTitleLabel];
  [v3 setText:0];

  v4 = [(CuratedCollectionFooterActionTableViewCell *)self platterView];
  [v4 setGlyph:0];
}

- (void)setActionItem:(id)a3
{
  p_actionItem = &self->_actionItem;
  objc_storeStrong((id *)&self->_actionItem, a3);
  id v6 = a3;
  v7 = [(CuratedCollectionFooterActionItem *)*p_actionItem title];
  v8 = [(CuratedCollectionFooterActionTableViewCell *)self actionTitleLabel];
  [v8 setText:v7];

  id v10 = [(CuratedCollectionFooterActionItem *)*p_actionItem glyph];

  objc_super v9 = [(CuratedCollectionFooterActionTableViewCell *)self platterView];
  [v9 setGlyph:v10];
}

- (CuratedCollectionFooterActionItem)actionItem
{
  return self->_actionItem;
}

- (UILabel)actionTitleLabel
{
  return self->_actionTitleLabel;
}

- (void)setActionTitleLabel:(id)a3
{
}

- (MUCirclePlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_actionTitleLabel, 0);

  objc_storeStrong((id *)&self->_actionItem, 0);
}

@end