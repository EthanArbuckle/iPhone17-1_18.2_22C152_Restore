@interface CHAchievementsCollectionViewCell
- (BOOL)appliesLargeCellInset;
- (CGRect)badgeRect;
- (CHAchievementsCollectionViewCell)initWithFrame:(CGRect)a3;
- (double)preferredWidth;
- (void)applyViewConstraints;
- (void)configureWithAchievement:(id)a3 badgeImageFactory:(id)a4 locProvider:(id)a5;
- (void)configureWithAchievement:(id)a3 badgeImageFactory:(id)a4 locProvider:(id)a5 shouldShowProgressBar:(BOOL)a6 formatForFriend:(BOOL)a7;
- (void)prepareForReuse;
- (void)setAppliesLargeCellInset:(BOOL)a3;
- (void)setBadgeHidden:(BOOL)a3;
- (void)setPreferredWidth:(double)a3;
@end

@implementation CHAchievementsCollectionViewCell

- (CHAchievementsCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CHAchievementsCollectionViewCell;
  v3 = -[CHAchievementsCollectionViewCell initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[CHAchievementsCellContentView initWithFrame:]([CHAchievementsCellContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    cellContentView = v3->_cellContentView;
    v3->_cellContentView = v4;

    [(CHAchievementsCellContentView *)v3->_cellContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(CHAchievementsCollectionViewCell *)v3 contentView];
    [v6 addSubview:v3->_cellContentView];

    [(CHAchievementsCollectionViewCell *)v3 applyViewConstraints];
  }
  return v3;
}

- (void)applyViewConstraints
{
  v3 = [(CHAchievementsCellContentView *)self->_cellContentView leadingAnchor];
  v4 = [(CHAchievementsCollectionViewCell *)self contentView];
  v5 = [v4 leadingAnchor];
  v6 = [v3 constraintEqualToAnchor:v5];
  [v6 setActive:1];

  v7 = [(CHAchievementsCellContentView *)self->_cellContentView topAnchor];
  objc_super v8 = [(CHAchievementsCollectionViewCell *)self contentView];
  v9 = [v8 topAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  v11 = [(CHAchievementsCellContentView *)self->_cellContentView trailingAnchor];
  v12 = [(CHAchievementsCollectionViewCell *)self contentView];
  v13 = [v12 trailingAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  id v18 = [(CHAchievementsCellContentView *)self->_cellContentView bottomAnchor];
  v15 = [(CHAchievementsCollectionViewCell *)self contentView];
  v16 = [v15 bottomAnchor];
  v17 = [v18 constraintEqualToAnchor:v16];
  [v17 setActive:1];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CHAchievementsCollectionViewCell;
  [(CHAchievementsCollectionViewCell *)&v3 prepareForReuse];
  [(CHAchievementsCellContentView *)self->_cellContentView prepareForReuse];
}

- (void)setPreferredWidth:(double)a3
{
}

- (void)setAppliesLargeCellInset:(BOOL)a3
{
}

- (CGRect)badgeRect
{
  [(CHAchievementsCellContentView *)self->_cellContentView badgeRect];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)configureWithAchievement:(id)a3 badgeImageFactory:(id)a4 locProvider:(id)a5
{
}

- (void)configureWithAchievement:(id)a3 badgeImageFactory:(id)a4 locProvider:(id)a5 shouldShowProgressBar:(BOOL)a6 formatForFriend:(BOOL)a7
{
}

- (void)setBadgeHidden:(BOOL)a3
{
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (BOOL)appliesLargeCellInset
{
  return self->_appliesLargeCellInset;
}

- (void).cxx_destruct
{
}

@end