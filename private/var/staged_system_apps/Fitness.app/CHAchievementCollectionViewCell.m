@interface CHAchievementCollectionViewCell
- (AAUIBadgeImageFactory)imageFactory;
- (ACHAchievement)achievement;
- (ACHAchievementLocalizationProvider)locProvider;
- (BOOL)imageHidden;
- (CGRect)badgeFrame;
- (CHAchievementCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (double)imageDimension;
- (void)_createAndAddSubviews;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAchievement:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageDimension:(double)a3;
- (void)setImageFactory:(id)a3;
- (void)setImageHidden:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setLocProvider:(id)a3;
@end

@implementation CHAchievementCollectionViewCell

- (CHAchievementCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CHAchievementCollectionViewCell;
  v3 = -[CHAchievementCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(CHAchievementCollectionViewCell *)v3 setBackgroundColor:v4];

    [(CHAchievementCollectionViewCell *)v3 _createAndAddSubviews];
    [(CHAchievementCollectionViewCell *)v3 setIsAccessibilityElement:1];
  }
  return v3;
}

- (void)setImageHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_imageHidden = a3;
  id v4 = [(CHAchievementCollectionViewCell *)self imageView];
  [v4 setHidden:v3];
}

- (void)_createAndAddSubviews
{
  BOOL v3 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  imageView = self->_imageView;
  self->_imageView = v3;

  [(UIImageView *)self->_imageView setContentMode:4];
  id v5 = [(CHAchievementCollectionViewCell *)self contentView];
  [v5 addSubview:self->_imageView];
}

- (void)setAchievement:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_achievement, a3);
  objc_super v6 = [(CHAchievementCollectionViewCell *)self locProvider];
  v7 = [v6 titleForAchievement:v5];
  [(CHAchievementCollectionViewCell *)self setAccessibilityLabel:v7];

  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"ACHIEVEMENT_TITLE_ACCESSIBILITY_HINT" value:&stru_1008D8AB8 table:@"Localizable"];
  [(CHAchievementCollectionViewCell *)self setAccessibilityHint:v9];

  v10 = [v5 template];
  v11 = [v10 uniqueName];
  [(CHAchievementCollectionViewCell *)self setAccessibilityIdentifier:v11];

  v12 = dispatch_get_global_queue(25, 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10014E674;
  v14[3] = &unk_1008ABB38;
  v14[4] = self;
  id v15 = v5;
  id v13 = v5;
  dispatch_async(v12, v14);
}

- (void)setHighlighted:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CHAchievementCollectionViewCell;
  [(CHAchievementCollectionViewCell *)&v3 setHighlighted:a3];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CHAchievementCollectionViewCell;
  [(CHAchievementCollectionViewCell *)&v12 layoutSubviews];
  [(CHAchievementCollectionViewCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CHAchievementCollectionViewCell *)self imageView];
  [v11 setFrame:v4, v6, v8, v10];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CHAchievementCollectionViewCell;
  [(CHAchievementCollectionViewCell *)&v4 prepareForReuse];
  double v3 = [(CHAchievementCollectionViewCell *)self imageView];
  [v3 setImage:0];
}

- (CGRect)badgeFrame
{
  v2 = [(CHAchievementCollectionViewCell *)self imageView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (ACHAchievement)achievement
{
  return self->_achievement;
}

- (BOOL)imageHidden
{
  return self->_imageHidden;
}

- (ACHAchievementLocalizationProvider)locProvider
{
  return self->_locProvider;
}

- (void)setLocProvider:(id)a3
{
}

- (AAUIBadgeImageFactory)imageFactory
{
  return self->_imageFactory;
}

- (void)setImageFactory:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (double)imageDimension
{
  return self->_imageDimension;
}

- (void)setImageDimension:(double)a3
{
  self->_imageDimension = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageFactory, 0);
  objc_storeStrong((id *)&self->_locProvider, 0);

  objc_storeStrong((id *)&self->_achievement, 0);
}

@end