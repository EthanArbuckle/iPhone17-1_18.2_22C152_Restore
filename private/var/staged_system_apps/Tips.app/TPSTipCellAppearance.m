@interface TPSTipCellAppearance
- (BOOL)isBookendsCompactLayout;
- (BOOL)useBookendsRegularTitleBaseline;
- (double)assetHeight;
- (double)bookendsContentSidePadding;
- (double)bookendsHeightMultiplier;
- (double)contentSidePadding;
- (double)outroTextLabelTopPadding;
- (double)outroWidthMultiplier;
- (double)topSafeAreaHeight;
- (int64_t)userInterfaceStyle;
- (unint64_t)bookendsMediaSizeType;
- (unint64_t)displayType;
- (void)setAssetHeight:(double)a3;
- (void)setBookendsContentSidePadding:(double)a3;
- (void)setBookendsHeightMultiplier:(double)a3;
- (void)setBookendsMediaSizeType:(unint64_t)a3;
- (void)setContentSidePadding:(double)a3;
- (void)setDisplayType:(unint64_t)a3;
- (void)setOutroTextLabelTopPadding:(double)a3;
- (void)setOutroWidthMultiplier:(double)a3;
- (void)setTopSafeAreaHeight:(double)a3;
- (void)setUseBookendsRegularTitleBaseline:(BOOL)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)updateAppearanceWithSize:(CGSize)a3;
- (void)updateMediaSizeType;
@end

@implementation TPSTipCellAppearance

- (void)updateMediaSizeType
{
  [(TPSTipCellAppearance *)self size];
  if (v4 != CGSizeZero.width || v3 != CGSizeZero.height)
  {
    self->_useBookendsRegularTitleBaseline = 0;
    if (+[TPSAppearance isPhoneUI])
    {
      self->_displayType = 0;
      [(TPSTipCellAppearance *)self setMediaSizeType:1];
    }
    else
    {
      [(TPSTipCellAppearance *)self setMediaSizeType:1];
      self->_displayType = 2;
    }
    self->_bookendsMediaSizeType = 1;
  }
}

- (BOOL)isBookendsCompactLayout
{
  return self->_bookendsMediaSizeType == 1;
}

- (void)updateAppearanceWithSize:(CGSize)a3
{
  double width = a3.width;
  v39.receiver = self;
  v39.super_class = (Class)TPSTipCellAppearance;
  -[TPSTipCellAppearance updateAppearanceWithSize:](&v39, "updateAppearanceWithSize:", a3.width, a3.height);
  [(TPSTipCellAppearance *)self updateMediaSizeType];
  v5 = [(TPSTipCellAppearance *)self traitCollection];

  if (v5)
  {
    v6 = +[TPSUIAppController sharedInstance];
    v7 = [v6 assetSizes];

    if (+[TPSAppearance isPhoneUI])
    {
      self->_outroTextLabelTopPadding = 26.0;
      v8 = +[TPSCommonDefines sharedInstance];
      id v9 = [v8 assetRatioType];

      if (v9)
      {
        self->_outroWidthMultiplier = 2.31466667;
        double v10 = 1.28019324;
        double v11 = 1.99466667;
      }
      else
      {
        double v10 = 0.938666667;
        double v11 = 1.608;
      }
      self->_bookendsHeightMultiplier = v11;
      v22 = [v7 tip];
      [(TPSTipCellAppearance *)self heightToWidthRatioFromSizes:v22 mediaSizeType:[(TPSTipCellAppearance *)self mediaSizeType] defaultValue:v10];
      double v24 = v23;

      double v25 = ceil(width * v24);
      double v26 = 30.0;
      double v27 = 30.0;
    }
    else
    {
      [(TPSTipCellAppearance *)self size];
      double v13 = v12;
      [(TPSTipCellAppearance *)self size];
      double v15 = v14;
      v16 = +[UIScreen mainScreen];
      [v16 bounds];
      double v18 = v17;
      double v20 = v19;

      if (v13 > v15 && v15 == v20)
      {
        double v21 = 33.0;
      }
      else if (v18 <= v20)
      {
        double v21 = 40.0;
      }
      else if (v13 / v18 <= 0.6)
      {
        double v21 = 40.0;
      }
      else
      {
        double v21 = 33.0;
      }
      double v28 = v18 / width;
      v29 = +[TPSCommonDefines sharedInstance];
      BOOL v30 = [v29 assetRatioType] == 0;

      self->_outroTextLabelTopPadding = v21;
      unsigned int v31 = [(TPSTipCellAppearance *)self isBookendsCompactLayout];
      v32 = (double *)&unk_10008C4F0;
      if (v31) {
        v32 = (double *)&unk_10008C500;
      }
      self->_bookendsHeightMultiplier = v32[v30];
      if (v28 == 1.0)
      {
        double v27 = 30.0;
      }
      else
      {
        self->_outroTextLabelTopPadding = ceil(self->_outroTextLabelTopPadding / v28);
        double v27 = ceil(30.0 / v28);
      }
      double v33 = round((v13 + -672.0) * 0.5);
      if (v13 <= 834.0) {
        double v26 = 56.0;
      }
      else {
        double v26 = v33;
      }
      double v34 = v13 * 0.9644;
      if (v15 >= v13 * 0.9644 + 89.95)
      {
        double v36 = -110.05;
      }
      else
      {
        [(TPSTipCellAppearance *)self topSafeAreaHeight];
        double v34 = v15 - v35;
        double v36 = -200.0;
      }
      double v25 = round(v34 + v36);
    }
    self->_assetHeight = v25;
    v37 = [v7 tipIntro];
    [(TPSTipCellAppearance *)self heightToWidthRatioFromSizes:v37 mediaSizeType:self->_bookendsMediaSizeType defaultValue:self->_bookendsHeightMultiplier];
    self->_bookendsHeightMultiplier = v38;

    self->_contentSidePadding = v26;
    self->_bookendsContentSidePadding = v27;
  }
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(unint64_t)a3
{
  self->_displayType = a3;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (unint64_t)bookendsMediaSizeType
{
  return self->_bookendsMediaSizeType;
}

- (void)setBookendsMediaSizeType:(unint64_t)a3
{
  self->_bookendsMediaSizeType = a3;
}

- (BOOL)useBookendsRegularTitleBaseline
{
  return self->_useBookendsRegularTitleBaseline;
}

- (void)setUseBookendsRegularTitleBaseline:(BOOL)a3
{
  self->_useBookendsRegularTitleBaseline = a3;
}

- (double)contentSidePadding
{
  return self->_contentSidePadding;
}

- (void)setContentSidePadding:(double)a3
{
  self->_contentSidePadding = a3;
}

- (double)bookendsContentSidePadding
{
  return self->_bookendsContentSidePadding;
}

- (void)setBookendsContentSidePadding:(double)a3
{
  self->_bookendsContentSidePadding = a3;
}

- (double)outroWidthMultiplier
{
  return self->_outroWidthMultiplier;
}

- (void)setOutroWidthMultiplier:(double)a3
{
  self->_outroWidthMultiplier = a3;
}

- (double)outroTextLabelTopPadding
{
  return self->_outroTextLabelTopPadding;
}

- (void)setOutroTextLabelTopPadding:(double)a3
{
  self->_outroTextLabelTopPadding = a3;
}

- (double)bookendsHeightMultiplier
{
  return self->_bookendsHeightMultiplier;
}

- (void)setBookendsHeightMultiplier:(double)a3
{
  self->_bookendsHeightMultiplier = a3;
}

- (double)assetHeight
{
  return self->_assetHeight;
}

- (void)setAssetHeight:(double)a3
{
  self->_assetHeight = a3;
}

- (double)topSafeAreaHeight
{
  return self->_topSafeAreaHeight;
}

- (void)setTopSafeAreaHeight:(double)a3
{
  self->_topSafeAreaHeight = a3;
}

@end