@interface CHHorizontalScrollingAchievementsTableViewCell
- (BOOL)hasVisibleAchievements;
- (CGSize)sizeThatFits:(CGSize)result;
- (CHHorizontalScrollingAchievementsTableViewCell)initWithFrame:(CGRect)a3 badgeImageFactory:(id)a4 locProvider:(id)a5;
- (CHHorizontalScrollingAchievementsTableViewCellDelegate)delegate;
- (CHHorizontalScrollingAchievementsView)achievementsView;
- (UILabel)titleLabel;
- (UIView)topDivider;
- (void)achievementsView:(id)a3 didTapAchievement:(id)a4 cell:(id)a5;
- (void)layoutSubviews;
- (void)setAchievements:(id)a3;
- (void)setAchievementsView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTopDivider:(id)a3;
@end

@implementation CHHorizontalScrollingAchievementsTableViewCell

- (CHHorizontalScrollingAchievementsTableViewCell)initWithFrame:(CGRect)a3 badgeImageFactory:(id)a4 locProvider:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v33.receiver = self;
  v33.super_class = (Class)CHHorizontalScrollingAchievementsTableViewCell;
  v13 = -[CHHorizontalScrollingAchievementsTableViewCell initWithFrame:](&v33, "initWithFrame:", x, y, width, height);
  if (v13)
  {
    v14 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v13->_titleLabel;
    v13->_titleLabel = v14;

    v16 = v13->_titleLabel;
    v17 = +[UIFont systemFontOfSize:22.0];
    [(UILabel *)v16 setFont:v17];

    v18 = v13->_titleLabel;
    v19 = +[UIColor grayColor];
    [(UILabel *)v18 setTextColor:v19];

    v20 = v13->_titleLabel;
    v21 = +[NSBundle mainBundle];
    v22 = [v21 localizedStringForKey:@"AWARDS" value:&stru_1008D8AB8 table:@"Localizable"];
    [(UILabel *)v20 setText:v22];

    v23 = [(CHHorizontalScrollingAchievementsTableViewCell *)v13 contentView];
    [v23 addSubview:v13->_titleLabel];

    v24 = -[CHHorizontalScrollingAchievementsView initWithFrame:badgeImageFactory:locProvider:]([CHHorizontalScrollingAchievementsView alloc], "initWithFrame:badgeImageFactory:locProvider:", v11, v12, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    achievementsView = v13->_achievementsView;
    v13->_achievementsView = v24;

    [(CHHorizontalScrollingAchievementsView *)v13->_achievementsView setDelegate:v13];
    v26 = [(CHHorizontalScrollingAchievementsTableViewCell *)v13 contentView];
    [v26 addSubview:v13->_achievementsView];

    v27 = (UIView *)objc_alloc_init((Class)UIView);
    topDivider = v13->_topDivider;
    v13->_topDivider = v27;

    v29 = v13->_topDivider;
    v30 = +[UIColor colorWithWhite:0.300000012 alpha:1.0];
    [(UIView *)v29 setBackgroundColor:v30];

    [(CHHorizontalScrollingAchievementsTableViewCell *)v13 addSubview:v13->_topDivider];
    v31 = +[UIColor clearColor];
    [(CHHorizontalScrollingAchievementsTableViewCell *)v13 setBackgroundColor:v31];

    [(CHHorizontalScrollingAchievementsTableViewCell *)v13 setSelectionStyle:0];
  }

  return v13;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 124.0;
  result.double height = v3;
  return result;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)CHHorizontalScrollingAchievementsTableViewCell;
  [(CHHorizontalScrollingAchievementsTableViewCell *)&v23 layoutSubviews];
  double v3 = [(CHHorizontalScrollingAchievementsTableViewCell *)self contentView];
  [v3 bounds];

  v4 = [(CHHorizontalScrollingAchievementsTableViewCell *)self contentView];
  [v4 bounds];
  double v6 = v5;

  v7 = [(CHHorizontalScrollingAchievementsTableViewCell *)self titleLabel];
  [v7 sizeToFit];

  v8 = [(CHHorizontalScrollingAchievementsTableViewCell *)self titleLabel];
  [v8 frame];
  double v10 = v9;
  id v11 = [(CHHorizontalScrollingAchievementsTableViewCell *)self titleLabel];
  [v11 frame];
  double v22 = v12;

  FIUIFlipFrameRightToLeftIfNeeded();
  v13 = [(CHHorizontalScrollingAchievementsTableViewCell *)self titleLabel];
  [v13 setFrame:16.0, 5.0, v10, v22];

  v24.origin.double x = 16.0;
  v24.origin.double y = 5.0;
  v24.size.double width = v10;
  v24.size.double height = v22;
  CGFloat v14 = CGRectGetMaxY(v24) + 6.0;
  v15 = [(CHHorizontalScrollingAchievementsTableViewCell *)self achievementsView];
  [v15 setFrame:0.0, v14, v6, 70.0];

  double bottom = UIEdgeInsetsZero.bottom;
  v17 = [(CHHorizontalScrollingAchievementsTableViewCell *)self achievementsView];
  [v17 setScrollViewContentInset:UIEdgeInsetsZero.top, 16.0 + 2.0, bottom, 16.0 + 2.0];

  if (qword_10096B5B8 != -1) {
    dispatch_once(&qword_10096B5B8, &stru_1008ADB88);
  }
  double v18 = *(double *)&qword_10096B5B0;
  v19 = [(CHHorizontalScrollingAchievementsTableViewCell *)self topDivider];
  [v19 setFrame:CGRectMake(16.0, 0.0, v6, v18)];

  v20 = [(CHHorizontalScrollingAchievementsTableViewCell *)self topDivider];
  v21 = [(CHHorizontalScrollingAchievementsTableViewCell *)self contentView];
  [v21 bounds];
  FIUIFlipViewRightToLeftIfNeeded();
}

- (void)setAchievements:(id)a3
{
  id v4 = a3;
  double v5 = [(CHHorizontalScrollingAchievementsTableViewCell *)self achievementsView];
  [v5 setAchievements:v4];

  [(CHHorizontalScrollingAchievementsTableViewCell *)self setNeedsLayout];
}

- (BOOL)hasVisibleAchievements
{
  v2 = [(CHHorizontalScrollingAchievementsTableViewCell *)self achievementsView];
  unsigned __int8 v3 = [v2 hasVisibleAchievements];

  return v3;
}

- (void)achievementsView:(id)a3 didTapAchievement:(id)a4 cell:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  [v7 badgeFrame];
  [v7 convertRect:self toView:self];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  +[AAUIBadgeView badgeAspectRatio];
  double v18 = (v16 * v17 - v16) * -0.5;
  double v19 = v16 / v17;
  double v20 = v12 + v18;
  id v21 = [(CHHorizontalScrollingAchievementsTableViewCell *)self delegate];
  [v21 achievementsCell:self didTapAchievement:v8 subCell:v7 frameInCHHorizontalScrollingAchievementsTableViewCellCoordinates:v10 v20 v14 v19];
}

- (CHHorizontalScrollingAchievementsTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CHHorizontalScrollingAchievementsTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)topDivider
{
  return self->_topDivider;
}

- (void)setTopDivider:(id)a3
{
}

- (CHHorizontalScrollingAchievementsView)achievementsView
{
  return self->_achievementsView;
}

- (void)setAchievementsView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_achievementsView, 0);
  objc_storeStrong((id *)&self->_topDivider, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end