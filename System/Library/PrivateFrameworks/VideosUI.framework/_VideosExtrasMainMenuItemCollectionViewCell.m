@interface _VideosExtrasMainMenuItemCollectionViewCell
+ (id)_createLabelInCell:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSLayoutConstraint)textLabelConstraint;
- (UILabel)textLabel;
- (_VideosExtrasMainMenuItemCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_dynamicTypeChanged;
- (void)dealloc;
- (void)safeAreaInsetsDidChange;
- (void)setSelected:(BOOL)a3;
- (void)setTextLabelConstraint:(id)a3;
@end

@implementation _VideosExtrasMainMenuItemCollectionViewCell

+ (id)_createLabelInCell:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
  v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v5, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  if (v3)
  {
    v6 = [v3 contentView];
    [v6 addSubview:v5];
    v7 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v5, v6, 10, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    v8 = (void *)MEMORY[0x1E4F28DC8];
    v9 = [(id)*MEMORY[0x1E4FB2608] keyWindow];
    [v9 safeAreaInsets];
    v11 = [v8 constraintWithItem:v5 attribute:10 relatedBy:0 toItem:v6 attribute:10 multiplier:1.0 constant:v10 * -0.5];
    [v3 setTextLabelConstraint:v11];

    v12 = [v3 textLabelConstraint];
    v13 = [v7 arrayByAddingObject:v12];
    [v6 addConstraints:v13];
  }
  return v5;
}

- (_VideosExtrasMainMenuItemCollectionViewCell)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_VideosExtrasMainMenuItemCollectionViewCell;
  id v3 = -[_VideosExtrasMainMenuItemCollectionViewCell initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    v5 = [(_VideosExtrasMainMenuItemCollectionViewCell *)v3 contentView];
    uint64_t v6 = [(id)objc_opt_class() _createLabelInCell:v4];
    textLabel = v4->_textLabel;
    v4->_textLabel = (UILabel *)v6;

    v8 = [v5 layer];
    [v8 setAllowsGroupOpacity:0];

    v9 = [v5 layer];
    [v9 setAllowsGroupBlending:0];

    double v10 = [(_VideosExtrasMainMenuItemCollectionViewCell *)v4 layer];
    [v10 setAllowsGroupOpacity:0];

    v11 = [(_VideosExtrasMainMenuItemCollectionViewCell *)v4 layer];
    [v11 setAllowsGroupBlending:0];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v4 selector:sel__dynamicTypeChanged name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v4;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_VideosExtrasMainMenuItemCollectionViewCell;
  [(_VideosExtrasMainMenuItemCollectionViewCell *)&v4 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  id v4 = [(_VideosExtrasMainMenuItemCollectionViewCell *)self textLabelConstraint];
  [(_VideosExtrasMainMenuItemCollectionViewCell *)self safeAreaInsets];
  [v4 setConstant:v3 * -0.5];
}

- (void)_dynamicTypeChanged
{
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_VideosExtrasMainMenuItemCollectionViewCell;
  -[_VideosExtrasMainMenuItemCollectionViewCell setSelected:](&v10, sel_setSelected_);
  if (v3)
  {
    textLabel = self->_textLabel;
    uint64_t v6 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)textLabel setTextColor:v6];

    v7 = [(UILabel *)self->_textLabel layer];
    v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A320]];
    [v7 setCompositingFilter:v8];
  }
  else
  {
    v7 = +[VideosExtrasNavigationBarButton textDodgeColor];
    [(UILabel *)self->_textLabel setTextColor:v7];
    v8 = [(UILabel *)self->_textLabel layer];
    v9 = +[VideosExtrasNavigationBarButton textFilter];
    [v8 setCompositingFilter:v9];
  }
}

- (NSLayoutConstraint)textLabelConstraint
{
  return self->_textLabelConstraint;
}

- (void)setTextLabelConstraint:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_textLabelConstraint, 0);
}

@end