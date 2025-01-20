@interface EpisodeAvailableStyle
+ (id)defaultStyle;
- (MTDynamicTypeConstant)artTop_To_mainHeaderBL;
- (MTDynamicTypeConstant)container_To_artTop;
- (MTDynamicTypeConstant)dateBL_To_titleBL;
- (MTDynamicTypeConstant)divider_To_summaryBL;
- (MTDynamicTypeConstant)episodeTitleBL_To_divider;
- (MTDynamicTypeConstant)mainHeaderBL_To_showTitleBL;
- (MTDynamicTypeConstant)metadataBL_To_bottomBL;
- (MTDynamicTypeConstant)showTitleBL_To_dateBaseline_Min;
- (MTDynamicTypeConstant)summaryBL_To_metadataBL;
- (double)defaultMarginH;
- (double)spacingBetweenTextAndArtwork;
- (id)_initDefault;
- (id)newArtworkView;
- (void)setArtTop_To_mainHeaderBL:(id)a3;
- (void)setContainer_To_artTop:(id)a3;
- (void)setDateBL_To_titleBL:(id)a3;
- (void)setDefaultMarginH:(double)a3;
- (void)setDivider_To_summaryBL:(id)a3;
- (void)setEpisodeTitleBL_To_divider:(id)a3;
- (void)setMainHeaderBL_To_showTitleBL:(id)a3;
- (void)setMetadataBL_To_bottomBL:(id)a3;
- (void)setShowTitleBL_To_dateBaseline_Min:(id)a3;
- (void)setSpacingBetweenTextAndArtwork:(double)a3;
- (void)setSummaryBL_To_metadataBL:(id)a3;
@end

@implementation EpisodeAvailableStyle

+ (id)defaultStyle
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012BCC;
  block[3] = &unk_10002D100;
  block[4] = a1;
  if (qword_1000373C8 != -1) {
    dispatch_once(&qword_1000373C8, block);
  }
  v2 = (void *)qword_1000373D0;

  return v2;
}

- (id)_initDefault
{
  v23.receiver = self;
  v23.super_class = (Class)EpisodeAvailableStyle;
  v2 = [(EpisodeAvailableStyle *)&v23 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_10002AFA0;
    v4 = [[MTDynamicTypeConstant alloc] initWithDefaultConstant:UIFontTextStyleBody textStyle:20.0];
    v5 = (void *)v3[3];
    v3[3] = v4;

    v6 = [[MTDynamicTypeConstant alloc] initWithDefaultConstant:UIFontTextStyleTitle1 textStyle:24.0];
    v7 = (void *)v3[4];
    v3[4] = v6;

    v8 = [[MTDynamicTypeConstant alloc] initWithDefaultConstant:UIFontTextStyleBody textStyle:24.0];
    v9 = (void *)v3[5];
    v3[5] = v8;

    v10 = [[MTDynamicTypeConstant alloc] initWithDefaultConstant:UIFontTextStyleSubheadline textStyle:24.0];
    v11 = (void *)v3[6];
    v3[6] = v10;

    v12 = [[MTDynamicTypeConstant alloc] initWithDefaultConstant:UIFontTextStyleBody textStyle:24.0];
    v13 = (void *)v3[7];
    v3[7] = v12;

    v14 = [[MTDynamicTypeConstant alloc] initWithDefaultConstant:UIFontTextStyleBody textStyle:24.0];
    v15 = (void *)v3[8];
    v3[8] = v14;

    v16 = [[MTDynamicTypeConstant alloc] initWithDefaultConstant:UIFontTextStyleSubheadline textStyle:32.0];
    v17 = (void *)v3[9];
    v3[9] = v16;

    v18 = [[MTDynamicTypeConstant alloc] initWithDefaultConstant:UIFontTextStyleSubheadline textStyle:24.0];
    v19 = (void *)v3[10];
    v3[10] = v18;

    v20 = [[MTDynamicTypeConstant alloc] initWithDefaultConstant:UIFontTextStyleSubheadline textStyle:24.0];
    v21 = (void *)v3[11];
    v3[11] = v20;
  }
  return v3;
}

- (id)newArtworkView
{
  v2 = objc_opt_new();
  [v2 mt_configureForDisplayingArtworkWithRadius:4.0];
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

- (double)spacingBetweenTextAndArtwork
{
  return self->_spacingBetweenTextAndArtwork;
}

- (void)setSpacingBetweenTextAndArtwork:(double)a3
{
  self->_spacingBetweenTextAndArtwork = a3;
}

- (MTDynamicTypeConstant)container_To_artTop
{
  return self->_container_To_artTop;
}

- (void)setContainer_To_artTop:(id)a3
{
}

- (MTDynamicTypeConstant)artTop_To_mainHeaderBL
{
  return self->_artTop_To_mainHeaderBL;
}

- (void)setArtTop_To_mainHeaderBL:(id)a3
{
}

- (MTDynamicTypeConstant)mainHeaderBL_To_showTitleBL
{
  return self->_mainHeaderBL_To_showTitleBL;
}

- (void)setMainHeaderBL_To_showTitleBL:(id)a3
{
}

- (MTDynamicTypeConstant)showTitleBL_To_dateBaseline_Min
{
  return self->_showTitleBL_To_dateBaseline_Min;
}

- (void)setShowTitleBL_To_dateBaseline_Min:(id)a3
{
}

- (MTDynamicTypeConstant)dateBL_To_titleBL
{
  return self->_dateBL_To_titleBL;
}

- (void)setDateBL_To_titleBL:(id)a3
{
}

- (MTDynamicTypeConstant)episodeTitleBL_To_divider
{
  return self->_episodeTitleBL_To_divider;
}

- (void)setEpisodeTitleBL_To_divider:(id)a3
{
}

- (MTDynamicTypeConstant)divider_To_summaryBL
{
  return self->_divider_To_summaryBL;
}

- (void)setDivider_To_summaryBL:(id)a3
{
}

- (MTDynamicTypeConstant)summaryBL_To_metadataBL
{
  return self->_summaryBL_To_metadataBL;
}

- (void)setSummaryBL_To_metadataBL:(id)a3
{
}

- (MTDynamicTypeConstant)metadataBL_To_bottomBL
{
  return self->_metadataBL_To_bottomBL;
}

- (void)setMetadataBL_To_bottomBL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataBL_To_bottomBL, 0);
  objc_storeStrong((id *)&self->_summaryBL_To_metadataBL, 0);
  objc_storeStrong((id *)&self->_divider_To_summaryBL, 0);
  objc_storeStrong((id *)&self->_episodeTitleBL_To_divider, 0);
  objc_storeStrong((id *)&self->_dateBL_To_titleBL, 0);
  objc_storeStrong((id *)&self->_showTitleBL_To_dateBaseline_Min, 0);
  objc_storeStrong((id *)&self->_mainHeaderBL_To_showTitleBL, 0);
  objc_storeStrong((id *)&self->_artTop_To_mainHeaderBL, 0);

  objc_storeStrong((id *)&self->_container_To_artTop, 0);
}

@end