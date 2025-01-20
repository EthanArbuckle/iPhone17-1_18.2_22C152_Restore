@interface EpisodeListAvailableStyle
+ (id)defaultStyle;
- (MTDynamicTypeConstant)cell_container_To_mainHeaderBL;
- (MTDynamicTypeConstant)cell_mainHeaderBL_To_collectionViewTop;
- (MTDynamicTypeConstant)cell_titleBL_To_subtitleBL;
- (MTDynamicTypeConstant)cell_topAndBottomPadding;
- (MTDynamicTypeConstant)seeMore_buttonBL_To_containerBottom;
- (MTDynamicTypeConstant)seeMore_containerTop_To_buttonBL;
- (double)cell_artworkDimension;
- (double)cell_artworkToContentSpacing;
- (double)cell_playButtonToContentSpacing;
- (double)defaultMarginH;
- (id)_initDefault;
- (id)cell_newArtworkView;
- (id)cell_newHorizontalSeparatorView;
- (id)cell_newPlayButton;
- (id)cell_newSubtitleLabel;
- (id)cell_newTitleLabel;
- (id)newSeeMoreButton;
- (void)setCell_artworkDimension:(double)a3;
- (void)setCell_artworkToContentSpacing:(double)a3;
- (void)setCell_container_To_mainHeaderBL:(id)a3;
- (void)setCell_mainHeaderBL_To_collectionViewTop:(id)a3;
- (void)setCell_playButtonToContentSpacing:(double)a3;
- (void)setCell_titleBL_To_subtitleBL:(id)a3;
- (void)setCell_topAndBottomPadding:(id)a3;
- (void)setDefaultMarginH:(double)a3;
- (void)setSeeMore_buttonBL_To_containerBottom:(id)a3;
- (void)setSeeMore_containerTop_To_buttonBL:(id)a3;
@end

@implementation EpisodeListAvailableStyle

+ (id)defaultStyle
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012FF4;
  block[3] = &unk_10002D100;
  block[4] = a1;
  if (qword_1000373D8 != -1) {
    dispatch_once(&qword_1000373D8, block);
  }
  v2 = (void *)qword_1000373E0;

  return v2;
}

- (id)_initDefault
{
  v18.receiver = self;
  v18.super_class = (Class)EpisodeListAvailableStyle;
  v2 = [(EpisodeListAvailableStyle *)&v18 init];
  v3 = v2;
  if (v2)
  {
    v2->_defaultMarginH = 16.0;
    *(_OWORD *)&v2->_cell_artworkDimension = xmmword_10002AFB0;
    v2->_cell_playButtonToContentSpacing = 12.0;
    v4 = [[MTDynamicTypeConstant alloc] initWithDefaultConstant:UIFontTextStyleTitle1 textStyle:44.0];
    cell_container_To_mainHeaderBL = v3->_cell_container_To_mainHeaderBL;
    v3->_cell_container_To_mainHeaderBL = v4;

    v6 = [[MTDynamicTypeConstant alloc] initWithDefaultConstant:UIFontTextStyleTitle1 textStyle:14.0];
    cell_mainHeaderBL_To_collectionViewTop = v3->_cell_mainHeaderBL_To_collectionViewTop;
    v3->_cell_mainHeaderBL_To_collectionViewTop = v6;

    v8 = [[MTDynamicTypeConstant alloc] initWithDefaultConstant:UIFontTextStyleBody textStyle:16.0];
    cell_topAndBottomPadding = v3->_cell_topAndBottomPadding;
    v3->_cell_topAndBottomPadding = v8;

    v10 = [MTDynamicTypeConstant alloc];
    v11 = [(MTDynamicTypeConstant *)v10 initWithDefaultConstant:UIFontTextStyleSubhead textStyle:18.0];
    cell_titleBL_To_subtitleBL = v3->_cell_titleBL_To_subtitleBL;
    v3->_cell_titleBL_To_subtitleBL = v11;

    v13 = [[MTDynamicTypeConstant alloc] initWithDefaultConstant:UIFontTextStyleBody textStyle:32.0];
    seeMore_containerTop_To_buttonBL = v3->_seeMore_containerTop_To_buttonBL;
    v3->_seeMore_containerTop_To_buttonBL = v13;

    v15 = [[MTDynamicTypeConstant alloc] initWithDefaultConstant:UIFontTextStyleBody textStyle:24.0];
    seeMore_buttonBL_To_containerBottom = v3->_seeMore_buttonBL_To_containerBottom;
    v3->_seeMore_buttonBL_To_containerBottom = v15;
  }
  return v3;
}

- (id)cell_newTitleLabel
{
  v2 = [[MTDynamicTypeLabel alloc] initWithTextStyle:UIFontTextStyleBody symbolicTraits:0];
  [(MTDynamicTypeLabel *)v2 setNumberOfLines:2];

  return v2;
}

- (id)cell_newSubtitleLabel
{
  v2 = [[MTDynamicTypeLabel alloc] initWithTextStyle:UIFontTextStyleFootnote symbolicTraits:0];
  v3 = +[UIColor systemGrayColor];
  [(MTDynamicTypeLabel *)v2 setTextColor:v3];

  [(MTDynamicTypeLabel *)v2 setNumberOfLines:1];

  return v2;
}

- (id)cell_newArtworkView
{
  [(EpisodeListAvailableStyle *)self cell_artworkDimension];
  double v3 = v2;
  v4 = objc_opt_new();
  [v4 mt_configureForDisplayingArtworkWithRadius:4.0];
  [v4 setFrame:0.0, 0.0, v3, v3];

  return v4;
}

- (id)cell_newPlayButton
{
  double v2 = +[MTButtonWithTouchInsets buttonWithType:0];
  double v3 = +[UIImage imageNamed:@"notifications_play_grayback"];
  [v2 setImage:v3 forState:0];
  [v2 setImageEdgeInsets:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
  [v2 sizeToFit];

  return v2;
}

- (id)cell_newHorizontalSeparatorView
{
  double v2 = objc_opt_new();
  double v3 = +[UIScreen mainScreen];
  [v3 scale];
  double v5 = v4;

  [v2 setFrame:CGRectMake(0.0, 0.0, 0.0, 1.0 / v5)];
  v6 = +[UIColor cellSeparatorColor];
  [v2 setBackgroundColor:v6];

  return v2;
}

- (id)newSeeMoreButton
{
  double v2 = +[UIButton buttonWithType:1];
  double v3 = +[UIFont mt_preferredFontForTextStyle:UIFontTextStyleBody];
  double v4 = [v2 titleLabel];
  [v4 setFont:v3];

  [v2 setTitleEdgeInsets:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
  double v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"SEE_MORE_BUTTON_TITLE" value:&stru_10002D2B8 table:0];
  [v2 setTitle:v6 forState:0];

  return v2;
}

- (double)defaultMarginH
{
  return self->_defaultMarginH;
}

- (void)setDefaultMarginH:(double)a3
{
  self->_defaultMarginH = a3;
}

- (MTDynamicTypeConstant)seeMore_containerTop_To_buttonBL
{
  return self->_seeMore_containerTop_To_buttonBL;
}

- (void)setSeeMore_containerTop_To_buttonBL:(id)a3
{
}

- (MTDynamicTypeConstant)seeMore_buttonBL_To_containerBottom
{
  return self->_seeMore_buttonBL_To_containerBottom;
}

- (void)setSeeMore_buttonBL_To_containerBottom:(id)a3
{
}

- (double)cell_artworkDimension
{
  return self->_cell_artworkDimension;
}

- (void)setCell_artworkDimension:(double)a3
{
  self->_cell_artworkDimension = a3;
}

- (double)cell_artworkToContentSpacing
{
  return self->_cell_artworkToContentSpacing;
}

- (void)setCell_artworkToContentSpacing:(double)a3
{
  self->_cell_artworkToContentSpacing = a3;
}

- (double)cell_playButtonToContentSpacing
{
  return self->_cell_playButtonToContentSpacing;
}

- (void)setCell_playButtonToContentSpacing:(double)a3
{
  self->_cell_playButtonToContentSpacing = a3;
}

- (MTDynamicTypeConstant)cell_container_To_mainHeaderBL
{
  return self->_cell_container_To_mainHeaderBL;
}

- (void)setCell_container_To_mainHeaderBL:(id)a3
{
}

- (MTDynamicTypeConstant)cell_mainHeaderBL_To_collectionViewTop
{
  return self->_cell_mainHeaderBL_To_collectionViewTop;
}

- (void)setCell_mainHeaderBL_To_collectionViewTop:(id)a3
{
}

- (MTDynamicTypeConstant)cell_titleBL_To_subtitleBL
{
  return self->_cell_titleBL_To_subtitleBL;
}

- (void)setCell_titleBL_To_subtitleBL:(id)a3
{
}

- (MTDynamicTypeConstant)cell_topAndBottomPadding
{
  return self->_cell_topAndBottomPadding;
}

- (void)setCell_topAndBottomPadding:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell_topAndBottomPadding, 0);
  objc_storeStrong((id *)&self->_cell_titleBL_To_subtitleBL, 0);
  objc_storeStrong((id *)&self->_cell_mainHeaderBL_To_collectionViewTop, 0);
  objc_storeStrong((id *)&self->_cell_container_To_mainHeaderBL, 0);
  objc_storeStrong((id *)&self->_seeMore_buttonBL_To_containerBottom, 0);

  objc_storeStrong((id *)&self->_seeMore_containerTop_To_buttonBL, 0);
}

@end