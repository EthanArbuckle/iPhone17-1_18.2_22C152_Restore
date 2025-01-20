@interface WAAQIView
+ (id)createWeatherLabelWithLightColor:(BOOL)a3;
- (BOOL)forceHideThisEntireView;
- (BOOL)hideCitationString;
- (BOOL)hideRecommendationString;
- (BOOL)initialized;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldInsertGlyphImage:(id)a3;
- (CGRect)adjustedFrame:(CGRect)a3 basedOnFont:(id)a4 desiredBaseline:(double)a5;
- (CGRect)rtlAdjustFrame:(CGRect)a3 inBounds:(CGRect)a4;
- (CGSize)sizeForAQIAvailableThatFits:(CGSize)a3;
- (CGSize)sizeForAQITemporarilyUnavailableThatFits:(CGSize)a3;
- (CGSize)sizeForCompactOneLineLayoutWithScaleViewThatFits:(CGSize)a3 platterView:(BOOL)a4;
- (CGSize)sizeForExtendedLayoutWithScaleViewThatFits:(CGSize)a3;
- (CGSize)sizeForLayoutWithoutScaleViewThatFits:(CGSize)a3;
- (CGSize)sizeForTwoLineLayoutWithScaleViewTheFits:(CGSize)a3 platterView:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (City)city;
- (UILabel)airQualityMetadataGradeLabel;
- (UILabel)airQualityRecommendationLabel;
- (UILabel)aqiAgencyLabel;
- (UILabel)aqiCategoryLabel;
- (UILabel)aqiCitationLabel;
- (UILabel)aqiIndexLabel;
- (UILabel)aqiLabel;
- (UILabel)dash;
- (WAAQIAttributionStringBuilder)attributionStringBuilder;
- (WAAQIScaleView)aqiScaleView;
- (WAAQIViewDelegate)delegate;
- (WAAQIViewStyler)styler;
- (double)contentMarginFromTop;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)currentScaleCategoryLabelForCity:(id)a3;
- (id)drawableScaleForCity:(id)a3;
- (id)metadataLabelForCity:(id)a3;
- (id)scaleDisplayNameForCity:(id)a3;
- (unint64_t)layoutMode;
- (void)handleTapGesture:(id)a3;
- (void)hideEverything;
- (void)initialize;
- (void)layoutForCompactModeWithScaleInPlatterView:(BOOL)a3;
- (void)layoutForExtendedModeWithScale;
- (void)layoutForModeAQITemporarilyUnavailable;
- (void)layoutForModeWithoutScale;
- (void)layoutForTwoLinesLayoutWithScaleInPlatterView:(BOOL)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAirQualityMetadataGradeLabel:(id)a3;
- (void)setAirQualityRecommendationLabel:(id)a3;
- (void)setAqiAgencyLabel:(id)a3;
- (void)setAqiCategoryLabel:(id)a3;
- (void)setAqiCitationLabel:(id)a3;
- (void)setAqiIndexLabel:(id)a3;
- (void)setAqiLabel:(id)a3;
- (void)setAqiScaleView:(id)a3;
- (void)setAttributionStringBuilder:(id)a3;
- (void)setCity:(id)a3;
- (void)setDash:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceHideThisEntireView:(BOOL)a3;
- (void)setHideCitationString:(BOOL)a3;
- (void)setHideRecommendationString:(BOOL)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setLayoutMode:(unint64_t)a3;
- (void)setStyler:(id)a3;
- (void)setupForLayoutCompactScaleViewOneLinePlatterView:(BOOL)a3;
- (void)setupForLayoutCompactScaleViewTwoLinesPlatterView:(BOOL)a3;
- (void)setupForLayoutExtendedNoScaleView;
- (void)setupForLayoutExtendedScaleView;
- (void)setupForLayoutTemporarilyUnavailable;
- (void)updateWithCity:(id)a3 layoutMode:(unint64_t)a4;
@end

@implementation WAAQIView

- (void)initialize
{
  v3 = +[WAAQIView createWeatherLabelWithLightColor:0];
  aqiLabel = self->_aqiLabel;
  self->_aqiLabel = v3;

  v5 = +[WAAQIView createWeatherLabelWithLightColor:0];
  aqiIndexLabel = self->_aqiIndexLabel;
  self->_aqiIndexLabel = v5;

  v7 = +[WAAQIView createWeatherLabelWithLightColor:0];
  aqiAgencyLabel = self->_aqiAgencyLabel;
  self->_aqiAgencyLabel = v7;

  v9 = +[WAAQIView createWeatherLabelWithLightColor:0];
  dash = self->_dash;
  self->_dash = v9;

  v11 = [WAAQIScaleView alloc];
  v12 = -[WAAQIScaleView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  aqiScaleView = self->_aqiScaleView;
  self->_aqiScaleView = v12;

  v14 = +[WAAQIView createWeatherLabelWithLightColor:0];
  aqiCategoryLabel = self->_aqiCategoryLabel;
  self->_aqiCategoryLabel = v14;

  v16 = +[WAAQIView createWeatherLabelWithLightColor:0];
  airQualityMetadataGradeLabel = self->_airQualityMetadataGradeLabel;
  self->_airQualityMetadataGradeLabel = v16;

  v18 = +[WAAQIView createWeatherLabelWithLightColor:0];
  airQualityRecommendationLabel = self->_airQualityRecommendationLabel;
  self->_airQualityRecommendationLabel = v18;

  v20 = +[WAAQIView createWeatherLabelWithLightColor:0];
  aqiCitationLabel = self->_aqiCitationLabel;
  self->_aqiCitationLabel = v20;

  [(UILabel *)self->_aqiLabel setNumberOfLines:0];
  [(UILabel *)self->_aqiIndexLabel setNumberOfLines:0];
  [(UILabel *)self->_aqiAgencyLabel setNumberOfLines:0];
  [(UILabel *)self->_aqiCategoryLabel setNumberOfLines:0];
  [(UILabel *)self->_airQualityMetadataGradeLabel setNumberOfLines:0];
  [(UILabel *)self->_airQualityRecommendationLabel setNumberOfLines:0];
  [(UILabel *)self->_aqiCitationLabel setNumberOfLines:0];
  self->_layoutMode = 1;
  v22 = objc_alloc_init(WAAQIViewStyler);
  styler = self->_styler;
  self->_styler = v22;

  v24 = objc_alloc_init(WAAQIAttributionStringBuilder);
  attributionStringBuilder = self->_attributionStringBuilder;
  self->_attributionStringBuilder = v24;

  [(WAAQIView *)self addSubview:self->_aqiLabel];
  [(WAAQIView *)self addSubview:self->_aqiIndexLabel];
  [(WAAQIView *)self addSubview:self->_aqiAgencyLabel];
  [(WAAQIView *)self addSubview:self->_dash];
  [(WAAQIView *)self addSubview:self->_aqiScaleView];
  [(WAAQIView *)self addSubview:self->_aqiCategoryLabel];
  [(WAAQIView *)self addSubview:self->_aqiCitationLabel];
  [(WAAQIView *)self addSubview:self->_airQualityMetadataGradeLabel];
  [(WAAQIView *)self addSubview:self->_airQualityRecommendationLabel];
  self->_hideCitationString = 0;
  self->_forceHideThisEntireView = 0;
  self->_initialized = 1;
}

- (void)updateWithCity:(id)a3 layoutMode:(unint64_t)a4
{
  id v6 = a3;
  if (![(WAAQIView *)self initialized]) {
    [(WAAQIView *)self initialize];
  }
  [(WAAQIView *)self prepareForReuse];
  [(WAAQIView *)self setCity:v6];

  [(WAAQIView *)self setLayoutMode:a4];
  v7 = [(WAAQIView *)self city];
  uint64_t v8 = [v7 aqiDataAvailabilityStatus];

  if (v8 == 2)
  {
    switch([(WAAQIView *)self layoutMode])
    {
      case 0uLL:
        [(WAAQIView *)self setupForLayoutExtendedNoScaleView];
        break;
      case 1uLL:
        v9 = self;
        uint64_t v10 = 0;
        goto LABEL_11;
      case 2uLL:
        [(WAAQIView *)self setupForLayoutExtendedScaleView];
        break;
      case 3uLL:
        v9 = self;
        uint64_t v10 = 1;
LABEL_11:
        [(WAAQIView *)v9 setupForLayoutCompactScaleViewOneLinePlatterView:v10];
        break;
      default:
        break;
    }
  }
  else if (v8 == 1)
  {
    [(WAAQIView *)self setupForLayoutTemporarilyUnavailable];
  }
  [(WAAQIView *)self setNeedsLayout];
}

- (void)handleTapGesture:(id)a3
{
  id v4 = a3;
  id v20 = [(WAAQIView *)self aqiCitationLabel];
  [v20 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 locationInView:v20];
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  v22.x = v14;
  v22.y = v16;
  if (CGRectContainsPoint(v23, v22))
  {
    v17 = [(WAAQIView *)self delegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      v19 = [(WAAQIView *)self delegate];
      [v19 aqiViewAttributionLabelTapped:self];
    }
  }
}

- (double)contentMarginFromTop
{
  v3 = [(WAAQIView *)self aqiIndexLabel];
  [v3 _firstBaselineOffsetFromTop];
  double v5 = v4;

  CGFloat v6 = [(WAAQIView *)self aqiIndexLabel];
  double v7 = [v6 font];
  [v7 capHeight];
  double v9 = v8;

  CGFloat v10 = [(WAAQIView *)self aqiIndexLabel];
  [v10 frame];
  double v12 = v5 - v9 + v11;

  return v12;
}

+ (id)createWeatherLabelWithLightColor:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F1C768]);
  double v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  CGFloat v6 = [MEMORY[0x263F1C550] clearColor];
  [v5 setBackgroundColor:v6];

  double v7 = +[WAAQIViewStyler textColorWithLightLabel:v3];
  [v5 setTextColor:v7];

  double v8 = +[WAAQIViewStyler shadowColor];
  [v5 setShadowColor:v8];

  objc_msgSend(v5, "setShadowOffset:", 0.0, 2.0);
  [v5 setAllowsDefaultTighteningForTruncation:1];
  [v5 setShadowBlur:3.0];
  return v5;
}

- (id)scaleDisplayNameForCity:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = WALogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v6 = [v4 airQualityScale];
    double v7 = [v6 displayName];
    double v8 = [(WAAQIView *)self city];
    int v12 = 138412546;
    double v13 = v7;
    __int16 v14 = 2112;
    double v15 = v8;
    _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "Using displayName: %@ for city: %@", (uint8_t *)&v12, 0x16u);
  }
  double v9 = [v4 airQualityScale];
  CGFloat v10 = [v9 displayName];

  return v10;
}

- (id)metadataLabelForCity:(id)a3
{
  BOOL v3 = [a3 airQualityScale];
  id v4 = [v3 displayLabel];
  double v5 = [v4 localizedUppercaseString];

  return v5;
}

- (id)drawableScaleForCity:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = [a3 airQualityScale];
  double v5 = WALogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v6 = [(WAAQIView *)self city];
    int v9 = 138412546;
    CGFloat v10 = v4;
    __int16 v11 = 2112;
    int v12 = v6;
    _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "Using scale: %@ for gradient for city: %@", (uint8_t *)&v9, 0x16u);
  }
  double v7 = +[WAAQIScale scaleFromFoundationScale:v4];

  return v7;
}

- (id)currentScaleCategoryLabelForCity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 airQualityScale];

  if (v4)
  {
    double v5 = [v3 airQualityCurrentScaleCategory];
    CGFloat v6 = v5;
    if (v5)
    {
      double v7 = [v5 categoryName];
      goto LABEL_10;
    }
    double v8 = WALogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGFloat v10 = 0;
      _os_log_impl(&dword_226D1D000, v8, OS_LOG_TYPE_DEFAULT, "No current scale category - bailing", v10, 2u);
    }
  }
  else
  {
    CGFloat v6 = WALogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226D1D000, v6, OS_LOG_TYPE_DEFAULT, "No scale - bailing", buf, 2u);
    }
  }
  double v7 = 0;
LABEL_10:

  return v7;
}

- (CGRect)adjustedFrame:(CGRect)a3 basedOnFont:(id)a4 desiredBaseline:(double)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [a4 ascender];
  double v11 = y + a5 - (y + v10);
  double v12 = x;
  double v13 = width;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.double y = v11;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)rtlAdjustFrame:(CGRect)a3 inBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat MinY = a3.origin.y;
  double v11 = a3.origin.x;
  if (IsUIRTL())
  {
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v18);
    v19.origin.CGFloat x = v11;
    v19.origin.CGFloat y = MinY;
    v19.size.CGFloat width = v9;
    v19.size.CGFloat height = v8;
    double v13 = MaxX - CGRectGetMaxX(v19);
    v20.origin.CGFloat x = v11;
    v20.origin.CGFloat y = MinY;
    v20.size.CGFloat width = v9;
    v20.size.CGFloat height = v8;
    CGFloat MinY = CGRectGetMinY(v20);
    double v11 = v13;
  }
  double v14 = v11;
  double v15 = MinY;
  double v16 = v9;
  double v17 = v8;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)prepareForReuse
{
  id v3 = [(WAAQIView *)self aqiLabel];
  [v3 setAttributedText:0];

  id v4 = [(WAAQIView *)self aqiIndexLabel];
  [v4 setAttributedText:0];

  double v5 = [(WAAQIView *)self aqiAgencyLabel];
  [v5 setAttributedText:0];

  CGFloat v6 = [(WAAQIView *)self aqiCategoryLabel];
  [v6 setAttributedText:0];

  double v7 = [(WAAQIView *)self airQualityMetadataGradeLabel];
  [v7 setAttributedText:0];

  CGFloat v8 = [(WAAQIView *)self airQualityRecommendationLabel];
  [v8 setAttributedText:0];

  CGFloat v9 = [(WAAQIView *)self aqiCitationLabel];
  [v9 setAttributedText:0];

  double v10 = [(WAAQIView *)self aqiLabel];
  [v10 setNumberOfLines:0];

  double v11 = [(WAAQIView *)self aqiIndexLabel];
  [v11 setNumberOfLines:0];

  double v12 = [(WAAQIView *)self aqiAgencyLabel];
  [v12 setNumberOfLines:0];

  double v13 = [(WAAQIView *)self aqiCategoryLabel];
  [v13 setNumberOfLines:0];

  double v14 = [(WAAQIView *)self airQualityMetadataGradeLabel];
  [v14 setNumberOfLines:0];

  double v15 = [(WAAQIView *)self airQualityRecommendationLabel];
  [v15 setNumberOfLines:0];

  double v16 = [(WAAQIView *)self aqiCitationLabel];
  [v16 setNumberOfLines:0];

  [(WAAQIView *)self setHideCitationString:0];
  [(WAAQIView *)self setForceHideThisEntireView:0];
}

- (BOOL)shouldInsertGlyphImage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 airQualityAttribution];
  unint64_t v5 = [v4 dataOrigination];

  if (v5 > 1)
  {
    BOOL v7 = 0;
  }
  else
  {
    CGFloat v6 = [v3 airQualityLearnMoreURL];

    BOOL v7 = v6 != 0;
  }

  return v7;
}

- (void)setupForLayoutTemporarilyUnavailable
{
  id v21 = [(WAAQIView *)self city];
  id v3 = [(WAAQIView *)self styler];
  id v4 = [(WAAQIView *)self metadataLabelForCity:v21];
  unint64_t v5 = [v3 styledAQIMetadataSourceText:v4];
  CGFloat v6 = [(WAAQIView *)self aqiLabel];
  [v6 setAttributedText:v5];

  BOOL v7 = [(WAAQIView *)self styler];
  CGFloat v8 = [(WAAQIView *)self scaleDisplayNameForCity:v21];
  CGFloat v9 = [v7 styledAQIMetadataSourceText:v8];
  double v10 = [(WAAQIView *)self aqiAgencyLabel];
  [v10 setAttributedText:v9];

  double v11 = [(WAAQIView *)self styler];
  double v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v13 = [v12 localizedStringForKey:@"AQI_VIEW_STATUS_UNAVAILABLE" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
  double v14 = [v11 styledAQIMetadataGradeText:v13];
  double v15 = [(WAAQIView *)self aqiCategoryLabel];
  [v15 setAttributedText:v14];

  double v16 = [(WAAQIView *)self styler];
  double v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  CGRect v18 = [v17 localizedStringForKey:@"AQI_VIEW_RECOMMENDATION_STATUS_UNAVAILABLE" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
  CGRect v19 = [v16 styledAQIMetadataCitationText:v18 attribution:0 shouldInsertGlyph:0];
  CGRect v20 = [(WAAQIView *)self aqiCitationLabel];
  [v20 setAttributedText:v19];
}

- (void)setupForLayoutCompactScaleViewOneLinePlatterView:(BOOL)a3
{
  BOOL v3 = a3;
  id v30 = [(WAAQIView *)self city];
  unint64_t v5 = -[WAAQIView drawableScaleForCity:](self, "drawableScaleForCity:");
  if (v5)
  {
    CGFloat v6 = [(WAAQIView *)self aqiScaleView];
    [v6 setScale:v5];

    BOOL v7 = !WAIsShortDevice();
    if (v3) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 1;
    }
    CGFloat v9 = [(WAAQIView *)self styler];
    double v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v11 = [v10 localizedStringForKey:@"AQI_SHORT_STRING" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
    double v12 = objc_msgSend(v9, "styledAQIText:mode:", v11, v8, v7);
    double v13 = [(WAAQIView *)self aqiLabel];
    [v13 setAttributedText:v12];

    double v14 = [(WAAQIView *)self aqiLabel];
    [v14 setNumberOfLines:1];

    double v15 = WANumberFormatterForDisplayingAQI();
    double v16 = [v30 airQualityIdx];
    double v17 = [v15 stringFromNumber:v16];

    if (([v30 airQualityScaleIsNumerical] & 1) == 0)
    {

      double v17 = &stru_26DADC2F0;
    }
    CGRect v18 = [(WAAQIView *)self currentScaleCategoryLabelForCity:v30];
    CGRect v19 = [v30 airQualityIdx];
    uint64_t v20 = [v19 unsignedIntegerValue];
    id v21 = [(WAAQIView *)self aqiScaleView];
    [v21 setAQI:v20];

    CGPoint v22 = [(WAAQIView *)self styler];
    CGRect v23 = objc_msgSend(v22, "styledAQILocalizedIndexText:mode:", v17, v8, v7);
    v24 = [(WAAQIView *)self aqiIndexLabel];
    [v24 setAttributedText:v23];

    v25 = [(WAAQIView *)self aqiIndexLabel];
    [v25 setNumberOfLines:1];

    v26 = [(WAAQIView *)self styler];
    v27 = objc_msgSend(v26, "styledAQICategoryText:mode:", v18, v8, v7);
    v28 = [(WAAQIView *)self aqiCategoryLabel];
    [v28 setAttributedText:v27];

    v29 = [(WAAQIView *)self aqiCategoryLabel];
    [v29 setNumberOfLines:1];
  }
  else
  {
    [(WAAQIView *)self setForceHideThisEntireView:1];
  }
}

- (void)setupForLayoutCompactScaleViewTwoLinesPlatterView:(BOOL)a3
{
  BOOL v3 = a3;
  [(WAAQIView *)self prepareForReuse];
  id v32 = [(WAAQIView *)self city];
  unint64_t v5 = -[WAAQIView drawableScaleForCity:](self, "drawableScaleForCity:");
  if (v5)
  {
    CGFloat v6 = [(WAAQIView *)self aqiScaleView];
    v31 = v5;
    [v6 setScale:v5];

    BOOL v7 = !WAIsShortDevice();
    if (v3) {
      uint64_t v8 = 4;
    }
    else {
      uint64_t v8 = 2;
    }
    CGFloat v9 = [(WAAQIView *)self styler];
    double v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v11 = [v10 localizedStringForKey:@"AQI_SHORT_STRING" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
    double v12 = objc_msgSend(v9, "styledAQIText:mode:", v11, v8, v7);

    double v13 = WANumberFormatterForDisplayingAQI();
    double v14 = [v32 airQualityIdx];
    double v15 = [v13 stringFromNumber:v14];

    double v16 = [(WAAQIView *)self currentScaleCategoryLabelForCity:v32];
    double v17 = [v32 airQualityIdx];
    uint64_t v18 = [v17 unsignedIntegerValue];
    CGRect v19 = [(WAAQIView *)self aqiScaleView];
    [v19 setAQI:v18];

    uint64_t v20 = [(WAAQIView *)self styler];
    id v21 = objc_msgSend(v20, "styledAQILocalizedIndexText:mode:", v15, v8, v7);

    CGPoint v22 = [(WAAQIView *)self styler];
    CGRect v23 = objc_msgSend(v22, "styledAQICategoryText:mode:", v16, v8, v7);

    v24 = [(WAAQIView *)self styler];
    v25 = objc_msgSend(v24, "styledAQICategoryText:mode:", @" ", v8, v7);

    v26 = [(WAAQIView *)self styler];
    v27 = [v26 styledDashWithLabelColor:v3];

    id v28 = objc_alloc_init(MEMORY[0x263F089B8]);
    [v28 appendAttributedString:v12];
    [v28 appendAttributedString:v25];
    if ([v32 airQualityScaleIsNumerical])
    {
      [v28 appendAttributedString:v21];
      [v28 appendAttributedString:v25];
    }
    [v28 appendAttributedString:v27];
    [v28 appendAttributedString:v25];
    [v28 appendAttributedString:v23];
    v29 = [(WAAQIView *)self aqiIndexLabel];
    [v29 setAttributedText:v28];

    id v30 = [(WAAQIView *)self aqiIndexLabel];
    [v30 setNumberOfLines:0];

    unint64_t v5 = v31;
  }
  else
  {
    [(WAAQIView *)self setForceHideThisEntireView:1];
  }
}

- (void)setupForLayoutExtendedScaleView
{
  [(WAAQIView *)self setHideRecommendationString:1];
  [(WAAQIView *)self setHideCitationString:0];
  id v38 = [(WAAQIView *)self city];
  BOOL v3 = -[WAAQIView drawableScaleForCity:](self, "drawableScaleForCity:");
  if (v3)
  {
    id v4 = [(WAAQIView *)self aqiScaleView];
    [v4 setScale:v3];

    unint64_t v5 = [(WAAQIView *)self styler];
    CGFloat v6 = [(WAAQIView *)self metadataLabelForCity:v38];
    BOOL v7 = [v5 styledAQIMetadataSourceText:v6];
    uint64_t v8 = [(WAAQIView *)self aqiLabel];
    [v8 setAttributedText:v7];

    CGFloat v9 = [(WAAQIView *)self styler];
    double v10 = [(WAAQIView *)self scaleDisplayNameForCity:v38];
    double v11 = [v9 styledAQIMetadataSourceText:v10];
    double v12 = [(WAAQIView *)self aqiAgencyLabel];
    [v12 setAttributedText:v11];

    double v13 = [v38 airQualityIdx];
    uint64_t v14 = [v13 unsignedIntegerValue];

    double v15 = [(WAAQIView *)self aqiScaleView];
    [v15 setAQI:v14];

    double v16 = [(WAAQIView *)self currentScaleCategoryLabelForCity:v38];
    if ([v38 airQualityScaleIsNumerical])
    {
      double v17 = WANumberFormatterForDisplayingAQI();
      uint64_t v18 = [v38 airQualityIdx];
      CGRect v19 = [v17 stringFromNumber:v18];

      uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v21 = [v20 localizedStringForKey:@"AQI_INDEX_STRING" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];

      objc_msgSend(NSString, "stringWithFormat:", v21, v19, v16);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v22 = v16;
    }
    CGRect v23 = [(WAAQIView *)self styler];
    v24 = [v23 styledAQIMetadataGradeText:v22];
    uint64_t v25 = [(WAAQIView *)self airQualityMetadataGradeLabel];
    [(id)v25 setAttributedText:v24];

    v26 = [(WAAQIView *)self city];
    v27 = [v26 airQualityAttribution];
    LOBYTE(v25) = [v27 isValid];

    if (v25)
    {
      id v28 = [(WAAQIView *)self attributionStringBuilder];
      v29 = [(WAAQIView *)self city];
      id v30 = [v28 buildAttributionStringFromCity:v29];

      v31 = [(WAAQIView *)self city];
      BOOL v32 = [(WAAQIView *)self shouldInsertGlyphImage:v31];

      v33 = [(WAAQIView *)self styler];
      v34 = [(WAAQIView *)self city];
      v35 = [v34 airQualityAttribution];
      v36 = [v33 styledAQIMetadataCitationText:v30 attribution:v35 shouldInsertGlyph:v32];
      v37 = [(WAAQIView *)self aqiCitationLabel];
      [v37 setAttributedText:v36];
    }
    else
    {
      [(WAAQIView *)self setHideCitationString:1];
    }
  }
  else
  {
    [(WAAQIView *)self setForceHideThisEntireView:1];
  }
}

- (void)setupForLayoutExtendedNoScaleView
{
  [(WAAQIView *)self setHideRecommendationString:0];
  [(WAAQIView *)self setHideCitationString:0];
  id v39 = [(WAAQIView *)self city];
  BOOL v3 = [v39 airQualityScale];

  if (v3)
  {
    id v4 = [(WAAQIView *)self styler];
    unint64_t v5 = [(WAAQIView *)self metadataLabelForCity:v39];
    CGFloat v6 = [v4 styledAQIMetadataSourceText:v5];
    BOOL v7 = [(WAAQIView *)self aqiLabel];
    [v7 setAttributedText:v6];

    uint64_t v8 = [(WAAQIView *)self styler];
    CGFloat v9 = [(WAAQIView *)self scaleDisplayNameForCity:v39];
    double v10 = [v8 styledAQIMetadataSourceText:v9];
    double v11 = [(WAAQIView *)self aqiAgencyLabel];
    [v11 setAttributedText:v10];

    double v12 = [(WAAQIView *)self currentScaleCategoryLabelForCity:v39];
    if ([v39 airQualityScaleIsNumerical])
    {
      double v13 = WANumberFormatterForDisplayingAQI();
      uint64_t v14 = [v39 airQualityIdx];
      double v15 = [v13 stringFromNumber:v14];

      double v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v17 = [v16 localizedStringForKey:@"AQI_INDEX_STRING" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];

      objc_msgSend(NSString, "stringWithFormat:", v17, v15, v12);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v18 = v12;
    }
    CGRect v19 = [(WAAQIView *)self styler];
    uint64_t v20 = [v19 styledAQIMetadataGradeText:v18];
    id v21 = [(WAAQIView *)self airQualityMetadataGradeLabel];
    [v21 setAttributedText:v20];

    id v22 = [v39 airQualityRecommendation];
    if (v22 && ![v39 airQualityForceHideRecommendation])
    {
      CGRect v23 = [(WAAQIView *)self styler];
      v24 = [v23 styledAQIMetadataRecommendationText:v22];
      uint64_t v25 = [(WAAQIView *)self airQualityRecommendationLabel];
      [v25 setAttributedText:v24];
    }
    else
    {
      [(WAAQIView *)self setHideRecommendationString:1];
    }
    v26 = [(WAAQIView *)self city];
    v27 = [v26 airQualityAttribution];
    char v28 = [v27 isValid];

    if (v28)
    {
      v29 = [(WAAQIView *)self attributionStringBuilder];
      id v30 = [(WAAQIView *)self city];
      v31 = [v29 buildAttributionStringFromCity:v30];

      BOOL v32 = [(WAAQIView *)self city];
      BOOL v33 = [(WAAQIView *)self shouldInsertGlyphImage:v32];

      v34 = [(WAAQIView *)self styler];
      v35 = [(WAAQIView *)self city];
      v36 = [v35 airQualityAttribution];
      v37 = [v34 styledAQIMetadataCitationText:v31 attribution:v36 shouldInsertGlyph:v33];
      id v38 = [(WAAQIView *)self aqiCitationLabel];
      [v38 setAttributedText:v37];
    }
    else
    {
      [(WAAQIView *)self setHideCitationString:1];
    }
  }
  else
  {
    [(WAAQIView *)self setForceHideThisEntireView:1];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  CGFloat v6 = [(WAAQIView *)self city];
  uint64_t v7 = [v6 aqiDataAvailabilityStatus];

  if (v7 == 2)
  {
    -[WAAQIView sizeForAQIAvailableThatFits:](self, "sizeForAQIAvailableThatFits:", width, height);
  }
  else if (v7 == 1)
  {
    -[WAAQIView sizeForAQITemporarilyUnavailableThatFits:](self, "sizeForAQITemporarilyUnavailableThatFits:", width, height);
  }
  else
  {
    double v8 = *MEMORY[0x263F001B0];
    double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)sizeForAQIAvailableThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  switch([(WAAQIView *)self layoutMode])
  {
    case 0uLL:
      -[WAAQIView sizeForLayoutWithoutScaleViewThatFits:](self, "sizeForLayoutWithoutScaleViewThatFits:", width, height);
      break;
    case 1uLL:
      double v8 = self;
      double v9 = width;
      double v10 = height;
      uint64_t v11 = 0;
      goto LABEL_7;
    case 2uLL:
      -[WAAQIView sizeForExtendedLayoutWithScaleViewThatFits:](self, "sizeForExtendedLayoutWithScaleViewThatFits:", width, height);
      break;
    case 3uLL:
      double v8 = self;
      double v9 = width;
      double v10 = height;
      uint64_t v11 = 1;
LABEL_7:
      -[WAAQIView sizeForCompactOneLineLayoutWithScaleViewThatFits:platterView:](v8, "sizeForCompactOneLineLayoutWithScaleViewThatFits:platterView:", v11, v9, v10);
      break;
    default:
      double v6 = *MEMORY[0x263F001B0];
      double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
      break;
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (CGSize)sizeForCompactOneLineLayoutWithScaleViewThatFits:(CGSize)a3 platterView:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  BOOL v8 = [(WAAQIView *)self forceHideThisEntireView];
  double v9 = 0.0;
  double v10 = 0.0;
  if (!v8)
  {
    uint64_t v11 = [(WAAQIView *)self aqiLabel];
    objc_msgSend(v11, "sizeThatFits:", width, height);
    double v13 = v12;

    uint64_t v14 = [(WAAQIView *)self aqiIndexLabel];
    objc_msgSend(v14, "sizeThatFits:", width, height);
    double v16 = v15;

    double v17 = [(WAAQIView *)self aqiCategoryLabel];
    objc_msgSend(v17, "sizeThatFits:", width, height);
    double v19 = v18;

    if (floor(width - v13 - v16 - v19 + -24.0) <= 130.0)
    {
      -[WAAQIView sizeForTwoLineLayoutWithScaleViewTheFits:platterView:](self, "sizeForTwoLineLayoutWithScaleViewTheFits:platterView:", v4, width, height);
    }
    else
    {
      BOOL v20 = WAIsShortDevice();
      if (v20) {
        double v21 = 9.0;
      }
      else {
        double v21 = 16.0;
      }
      if (v20) {
        double v22 = 10.0;
      }
      else {
        double v22 = 19.0;
      }
      CGRect v23 = [(WAAQIView *)self aqiLabel];
      v24 = [v23 attributedText];
      uint64_t v25 = objc_msgSend(v24, "wa_font");
      [v25 capHeight];
      double v27 = v26;

      char v28 = [(WAAQIView *)self aqiCategoryLabel];
      v29 = [v28 attributedText];
      id v30 = objc_msgSend(v29, "wa_font");
      [v30 capHeight];
      double v32 = v31;

      if (v27 >= v32) {
        double v33 = v32;
      }
      else {
        double v33 = v27;
      }
      double v10 = v21 + v22 + v33;
      double v9 = width;
    }
  }
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)sizeForTwoLineLayoutWithScaleViewTheFits:(CGSize)a3 platterView:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat width = a3.width;
  BOOL v7 = [(WAAQIView *)self forceHideThisEntireView];
  double v8 = 0.0;
  double v9 = 0.0;
  if (!v7)
  {
    -[WAAQIView setupForLayoutCompactScaleViewTwoLinesPlatterView:](self, "setupForLayoutCompactScaleViewTwoLinesPlatterView:", v4, 0.0, 0.0);
    [(WAAQIView *)self bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v18 = [(WAAQIView *)self aqiIndexLabel];
    objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

    double v19 = [(WAAQIView *)self aqiIndexLabel];
    [v19 sizeToFit];

    BOOL v20 = WAIsShortDevice();
    if (v20) {
      double v21 = 8.0;
    }
    else {
      double v21 = 11.0;
    }
    if (v20) {
      double v22 = 11.0;
    }
    else {
      double v22 = 12.0;
    }
    if (v20) {
      double v23 = 11.0;
    }
    else {
      double v23 = 10.0;
    }
    v24 = [(WAAQIView *)self aqiIndexLabel];
    [v24 frame];
    double Height = CGRectGetHeight(v35);
    double v26 = [(WAAQIView *)self aqiIndexLabel];
    double v27 = [v26 attributedText];
    char v28 = objc_msgSend(v27, "wa_font");
    [v28 descender];
    double v30 = Height + v29;

    double v31 = [(WAAQIView *)self aqiScaleView];
    [v31 intrinsicContentSize];
    double v33 = v32;

    double v9 = v22 + v21 + v23 + v30 + v33;
    double v8 = width;
  }
  result.double height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CGSize)sizeForAQITemporarilyUnavailableThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(WAAQIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(WAAQIView *)self aqiLabel];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  [(WAAQIView *)self bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v22 = [(WAAQIView *)self aqiAgencyLabel];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  [(WAAQIView *)self bounds];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v31 = [(WAAQIView *)self aqiCategoryLabel];
  objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

  [(WAAQIView *)self bounds];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  v40 = [(WAAQIView *)self aqiCitationLabel];
  objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

  v41 = [(WAAQIView *)self aqiLabel];
  [v41 sizeToFit];

  v42 = [(WAAQIView *)self aqiAgencyLabel];
  [v42 sizeToFit];

  v43 = [(WAAQIView *)self aqiCategoryLabel];
  [v43 sizeToFit];

  v44 = [(WAAQIView *)self aqiCitationLabel];
  [v44 sizeToFit];

  v45 = [(WAAQIView *)self aqiLabel];
  v46 = [v45 attributedText];
  v47 = objc_msgSend(v46, "wa_font");
  [v47 ascender];
  double v49 = v48;

  v50 = [(WAAQIView *)self aqiAgencyLabel];
  v51 = [v50 attributedText];
  v52 = objc_msgSend(v51, "wa_font");
  [v52 ascender];
  double v54 = v53;

  if (v49 >= v54) {
    double v54 = v49;
  }
  v55 = [(WAAQIView *)self aqiCategoryLabel];
  v56 = [v55 attributedText];
  v57 = objc_msgSend(v56, "wa_font");
  [v57 descender];
  double v59 = v58;
  v60 = [(WAAQIView *)self aqiCategoryLabel];
  [v60 frame];
  double v62 = v59 + v61;

  v63 = [(WAAQIView *)self aqiCitationLabel];
  v64 = [v63 attributedText];
  v65 = objc_msgSend(v64, "wa_font");
  [v65 descender];
  double v67 = v66;
  v68 = [(WAAQIView *)self aqiCitationLabel];
  [v68 frame];
  double v70 = v67 + v69;

  double v71 = v54 + 6.0 + 1.0 + v62 + v70 + 9.0;
  double v72 = width;
  result.double height = v71;
  result.CGFloat width = v72;
  return result;
}

- (CGSize)sizeForExtendedLayoutWithScaleViewThatFits:(CGSize)a3
{
  double width = a3.width;
  BOOL v5 = [(WAAQIView *)self forceHideThisEntireView];
  double v6 = 0.0;
  double v7 = 0.0;
  if (!v5)
  {
    [(WAAQIView *)self bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = [(WAAQIView *)self aqiLabel];
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    [(WAAQIView *)self bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v25 = [(WAAQIView *)self aqiAgencyLabel];
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

    [(WAAQIView *)self bounds];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v34 = [(WAAQIView *)self airQualityMetadataGradeLabel];
    objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

    [(WAAQIView *)self bounds];
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    v43 = [(WAAQIView *)self airQualityRecommendationLabel];
    objc_msgSend(v43, "setFrame:", v36, v38, v40, v42);

    [(WAAQIView *)self bounds];
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    v52 = [(WAAQIView *)self aqiCitationLabel];
    objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

    double v53 = [(WAAQIView *)self aqiLabel];
    [v53 sizeToFit];

    double v54 = [(WAAQIView *)self aqiAgencyLabel];
    [v54 sizeToFit];

    v55 = [(WAAQIView *)self airQualityMetadataGradeLabel];
    [v55 sizeToFit];

    v56 = [(WAAQIView *)self airQualityRecommendationLabel];
    [v56 sizeToFit];

    v57 = [(WAAQIView *)self aqiCitationLabel];
    [v57 sizeToFit];

    BOOL v58 = [(WAAQIView *)self hideRecommendationString];
    double v59 = 9.0;
    double v60 = 0.0;
    if (v58) {
      double v59 = 0.0;
    }
    double v108 = v59;
    BOOL v61 = [(WAAQIView *)self hideCitationString];
    double v62 = 8.0;
    if (v61) {
      double v62 = 0.0;
    }
    v63 = [(WAAQIView *)self aqiLabel];
    v64 = [v63 attributedText];
    v65 = objc_msgSend(v64, "wa_font");
    [v65 ascender];
    double v67 = v66;

    v68 = [(WAAQIView *)self aqiAgencyLabel];
    double v69 = [v68 attributedText];
    double v70 = objc_msgSend(v69, "wa_font");
    [v70 ascender];
    double v72 = v71;

    if (v67 >= v72) {
      double v73 = v67;
    }
    else {
      double v73 = v72;
    }
    v74 = [(WAAQIView *)self airQualityMetadataGradeLabel];
    v75 = [v74 attributedText];
    v76 = objc_msgSend(v75, "wa_font");
    [v76 descender];
    double v78 = v77;
    v79 = [(WAAQIView *)self airQualityMetadataGradeLabel];
    [v79 frame];
    double v81 = v78 + v80;

    v82 = [(WAAQIView *)self aqiScaleView];
    [v82 intrinsicContentSize];
    double v84 = v83;

    v85 = [(WAAQIView *)self airQualityRecommendationLabel];
    v86 = [v85 attributedText];
    v87 = objc_msgSend(v86, "wa_font");
    [v87 descender];
    double v89 = v88;
    v90 = [(WAAQIView *)self airQualityRecommendationLabel];
    [v90 frame];
    double v92 = v89 + v91;

    if (![(WAAQIView *)self hideCitationString])
    {
      v93 = [(WAAQIView *)self aqiCitationLabel];
      v94 = [v93 attributedText];
      v95 = objc_msgSend(v94, "wa_font");
      [v95 descender];
      double v97 = v96;
      v98 = [(WAAQIView *)self aqiCitationLabel];
      [v98 frame];
      double v60 = v97 + v99;
    }
    v100 = [(WAAQIView *)self aqiLabel];
    [v100 frame];
    double v102 = v101;
    v103 = [(WAAQIView *)self aqiAgencyLabel];
    [v103 frame];
    double v105 = v102 + v104 + 10.0;

    double v106 = v73 + v73 + 1.0;
    if (v105 < width) {
      double v106 = v73;
    }
    double v7 = v60 + v107 + v92 + v108 + v84 + v81 + v106 + 6.0 + 1.0 + 10.0 + 9.0;
    double v6 = width;
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (CGSize)sizeForLayoutWithoutScaleViewThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(WAAQIView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(WAAQIView *)self aqiLabel];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  [(WAAQIView *)self bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v21 = [(WAAQIView *)self aqiAgencyLabel];
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  [(WAAQIView *)self bounds];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v30 = [(WAAQIView *)self airQualityMetadataGradeLabel];
  objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

  [(WAAQIView *)self bounds];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v39 = [(WAAQIView *)self airQualityRecommendationLabel];
  objc_msgSend(v39, "setFrame:", v32, v34, v36, v38);

  [(WAAQIView *)self bounds];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  double v48 = [(WAAQIView *)self aqiCitationLabel];
  objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

  double v49 = [(WAAQIView *)self aqiLabel];
  [v49 sizeToFit];

  double v50 = [(WAAQIView *)self aqiAgencyLabel];
  [v50 sizeToFit];

  double v51 = [(WAAQIView *)self airQualityMetadataGradeLabel];
  [v51 sizeToFit];

  v52 = [(WAAQIView *)self airQualityRecommendationLabel];
  [v52 sizeToFit];

  double v53 = [(WAAQIView *)self aqiCitationLabel];
  [v53 sizeToFit];

  BOOL v54 = [(WAAQIView *)self hideCitationString];
  v55 = [(WAAQIView *)self aqiLabel];
  v56 = [v55 attributedText];
  v57 = objc_msgSend(v56, "wa_font");
  [v57 ascender];
  double v59 = v58;

  double v60 = [(WAAQIView *)self aqiAgencyLabel];
  BOOL v61 = [v60 attributedText];
  double v62 = objc_msgSend(v61, "wa_font");
  [v62 ascender];
  double v64 = v63;

  v65 = [(WAAQIView *)self airQualityMetadataGradeLabel];
  double v66 = [v65 attributedText];
  double v67 = objc_msgSend(v66, "wa_font");
  [v67 descender];
  double v69 = v68;
  double v70 = [(WAAQIView *)self airQualityMetadataGradeLabel];
  [v70 frame];
  double v72 = v71;

  double v73 = [(WAAQIView *)self airQualityRecommendationLabel];
  v74 = [v73 attributedText];
  v75 = objc_msgSend(v74, "wa_font");
  [v75 descender];
  double v77 = v76;
  double v78 = [(WAAQIView *)self airQualityRecommendationLabel];
  [v78 frame];
  double v80 = v79;

  double v81 = 0.0;
  if (![(WAAQIView *)self hideCitationString])
  {
    v82 = [(WAAQIView *)self aqiCitationLabel];
    double v83 = [v82 attributedText];
    double v84 = objc_msgSend(v83, "wa_font");
    [v84 descender];
    double v86 = v85;
    v87 = [(WAAQIView *)self aqiCitationLabel];
    [v87 frame];
    double v81 = v86 + v88;
  }
  if (v59 >= v64) {
    double v89 = v59;
  }
  else {
    double v89 = v64;
  }
  double v90 = 8.0;
  if (v54) {
    double v90 = 0.0;
  }
  double v91 = v90 + v89 + 6.0 + 1.0 + v69 + v72 + 10.0 + v77 + v80 + v81 + 9.0;
  double v92 = width;
  result.double height = v91;
  result.CGFloat width = v92;
  return result;
}

- (void)hideEverything
{
  BOOL v3 = [(WAAQIView *)self aqiLabel];
  [v3 setHidden:1];

  double v4 = [(WAAQIView *)self aqiIndexLabel];
  [v4 setHidden:1];

  double v5 = [(WAAQIView *)self aqiAgencyLabel];
  [v5 setHidden:1];

  double v6 = [(WAAQIView *)self dash];
  [v6 setHidden:1];

  double v7 = [(WAAQIView *)self aqiScaleView];
  [v7 setHidden:1];

  double v8 = [(WAAQIView *)self aqiCategoryLabel];
  [v8 setHidden:1];

  double v9 = [(WAAQIView *)self aqiCitationLabel];
  [v9 setHidden:1];

  double v10 = [(WAAQIView *)self airQualityMetadataGradeLabel];
  [v10 setHidden:1];

  id v11 = [(WAAQIView *)self airQualityRecommendationLabel];
  [v11 setHidden:1];
}

- (void)layoutSubviews
{
  [(WAAQIView *)self hideEverything];
  BOOL v3 = [(WAAQIView *)self city];
  uint64_t v4 = [v3 aqiDataAvailabilityStatus];

  if (v4 == 1)
  {
    [(WAAQIView *)self layoutForModeAQITemporarilyUnavailable];
  }
  else if (v4 == 2)
  {
    switch([(WAAQIView *)self layoutMode])
    {
      case 0uLL:
        [(WAAQIView *)self layoutForModeWithoutScale];
        break;
      case 1uLL:
        double v5 = self;
        uint64_t v6 = 0;
        goto LABEL_16;
      case 2uLL:
        [(WAAQIView *)self layoutForExtendedModeWithScale];
        break;
      case 3uLL:
        double v5 = self;
        uint64_t v6 = 1;
LABEL_16:
        [(WAAQIView *)v5 layoutForCompactModeWithScaleInPlatterView:v6];
        break;
      default:
        return;
    }
  }
}

- (void)layoutForCompactModeWithScaleInPlatterView:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(WAAQIView *)self forceHideThisEntireView])
  {
    double v5 = [(WAAQIView *)self aqiLabel];
    [(WAAQIView *)self bounds];
    objc_msgSend(v5, "sizeThatFits:", v6, v7);
    double v9 = v8;

    double v10 = [(WAAQIView *)self aqiIndexLabel];
    [(WAAQIView *)self bounds];
    objc_msgSend(v10, "sizeThatFits:", v11, v12);
    double v14 = v13;

    double v15 = [(WAAQIView *)self aqiCategoryLabel];
    [(WAAQIView *)self bounds];
    objc_msgSend(v15, "sizeThatFits:", v16, v17);
    double v19 = v18;

    double v20 = [(WAAQIView *)self aqiScaleView];
    [v20 intrinsicContentSize];
    double v22 = v21;

    if (v14 <= 0.0) {
      double v23 = 16.0;
    }
    else {
      double v23 = 24.0;
    }
    [(WAAQIView *)self bounds];
    double v25 = floor(v24 - v9 - v14 - v19 - v23);
    if (v25 <= 130.0)
    {
      [(WAAQIView *)self layoutForTwoLinesLayoutWithScaleInPlatterView:v3];
    }
    else
    {
      double v155 = v25;
      double v156 = v22;
      if (WAIsShortDevice()) {
        double v26 = 9.0;
      }
      else {
        double v26 = 16.0;
      }
      double v27 = [(WAAQIView *)self aqiLabel];
      [v27 sizeToFit];

      double v28 = [(WAAQIView *)self aqiIndexLabel];
      [v28 sizeToFit];

      double v29 = [(WAAQIView *)self aqiCategoryLabel];
      [v29 sizeToFit];

      double v30 = [(WAAQIView *)self aqiLabel];
      [v30 setHidden:0];

      double v31 = [(WAAQIView *)self aqiIndexLabel];
      [v31 setHidden:0];

      double v32 = [(WAAQIView *)self aqiCategoryLabel];
      [v32 setHidden:0];

      double v33 = [(WAAQIView *)self aqiScaleView];
      [v33 setHidden:0];

      [(WAAQIView *)self bounds];
      CGFloat v34 = CGRectGetMaxY(v160) - v26;
      double v35 = [(WAAQIView *)self aqiLabel];
      [v35 frame];
      double v37 = v36;
      double v39 = v38;

      double v40 = *MEMORY[0x263F00148];
      [(WAAQIView *)self frame];
      double v42 = v41 * 0.5 - v39 * 0.5;
      double v43 = [(WAAQIView *)self aqiLabel];
      double v44 = [v43 attributedText];
      double v45 = objc_msgSend(v44, "wa_font");
      double v157 = v34;
      -[WAAQIView adjustedFrame:basedOnFont:desiredBaseline:](self, "adjustedFrame:basedOnFont:desiredBaseline:", v45, v40, v42, v37, v39, v34);
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      double v53 = v52;

      [(WAAQIView *)self bounds];
      CGFloat rect = v51;
      -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v47, v49, v51, v53, v54, v55, v56, v57);
      double v59 = v58;
      double v61 = v60;
      double v63 = v62;
      double v65 = v64;
      double v66 = [(WAAQIView *)self aqiLabel];
      objc_msgSend(v66, "setFrame:", v59, v61, v63, v65);

      double v67 = [(WAAQIView *)self aqiLabel];
      [v67 frame];
      double v69 = v68;
      double v71 = v70;
      double v73 = v72;
      double v75 = v74;

      double v76 = [(WAAQIView *)self aqiIndexLabel];
      [v76 frame];
      double v78 = v77;

      if (v78 > 0.0)
      {
        double v79 = [(WAAQIView *)self aqiIndexLabel];
        [v79 frame];
        double v81 = v80;
        double v83 = v82;

        v161.origin.CGFloat x = v47;
        v161.origin.CGFloat y = v49;
        v161.size.CGFloat width = rect;
        v161.size.double height = v53;
        CGFloat v84 = CGRectGetMaxX(v161) + 8.0;
        [(WAAQIView *)self frame];
        double v86 = v85 * 0.5 - v83 * 0.5;
        v87 = [(WAAQIView *)self aqiIndexLabel];
        double v88 = [v87 attributedText];
        double v89 = objc_msgSend(v88, "wa_font");
        -[WAAQIView adjustedFrame:basedOnFont:desiredBaseline:](self, "adjustedFrame:basedOnFont:desiredBaseline:", v89, v84, v86, v81, v83, v157);
        double v69 = v90;
        double v71 = v91;
        double v73 = v92;
        double v75 = v93;

        [(WAAQIView *)self bounds];
        -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v69, v71, v73, v75, v94, v95, v96, v97);
        double v99 = v98;
        double v101 = v100;
        double v103 = v102;
        double v105 = v104;
        double v106 = [(WAAQIView *)self aqiIndexLabel];
        objc_msgSend(v106, "setFrame:", v99, v101, v103, v105);
      }
      double v107 = [(WAAQIView *)self aqiScaleView];
      [v107 frame];

      v162.origin.CGFloat x = v69;
      v162.origin.CGFloat y = v71;
      v162.size.CGFloat width = v73;
      v162.size.double height = v75;
      CGFloat v108 = CGRectGetMaxX(v162) + 8.0;
      v163.origin.CGFloat x = v69;
      v163.origin.CGFloat y = v71;
      v163.size.CGFloat width = v73;
      v163.size.double height = v75;
      CGFloat v109 = CGRectGetMaxY(v163) - v75 * 0.5 - v156 * 0.5;
      [(WAAQIView *)self bounds];
      -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v108, v109, v155, v156, v110, v111, v112, v113);
      double v115 = v114;
      double v117 = v116;
      double v119 = v118;
      double v121 = v120;
      v122 = [(WAAQIView *)self aqiScaleView];
      objc_msgSend(v122, "setFrame:", v115, v117, v119, v121);

      v123 = [(WAAQIView *)self aqiCategoryLabel];
      [v123 frame];
      double v125 = v124;
      double v127 = v126;

      v164.origin.CGFloat x = v108;
      v164.origin.CGFloat y = v109;
      v164.size.CGFloat width = v155;
      v164.size.double height = v156;
      CGFloat v128 = CGRectGetMaxX(v164) + 8.0;
      [(WAAQIView *)self frame];
      double v130 = v129 * 0.5 - v127 * 0.5;
      v131 = [(WAAQIView *)self aqiCategoryLabel];
      v132 = [v131 attributedText];
      v133 = objc_msgSend(v132, "wa_font");
      -[WAAQIView adjustedFrame:basedOnFont:desiredBaseline:](self, "adjustedFrame:basedOnFont:desiredBaseline:", v133, v128, v130, v125, v127, v157);
      double v135 = v134;
      double v137 = v136;
      double v139 = v138;
      double v141 = v140;

      [(WAAQIView *)self bounds];
      -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v135, v137, v139, v141, v142, v143, v144, v145);
      double v147 = v146;
      double v149 = v148;
      double v151 = v150;
      double v153 = v152;
      id v158 = [(WAAQIView *)self aqiCategoryLabel];
      objc_msgSend(v158, "setFrame:", v147, v149, v151, v153);
    }
  }
}

- (void)layoutForTwoLinesLayoutWithScaleInPlatterView:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(WAAQIView *)self forceHideThisEntireView])
  {
    [(WAAQIView *)self setupForLayoutCompactScaleViewTwoLinesPlatterView:v3];
    [(WAAQIView *)self hideEverything];
    [(WAAQIView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = [(WAAQIView *)self aqiIndexLabel];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    double v14 = [(WAAQIView *)self aqiIndexLabel];
    [v14 sizeToFit];

    double v15 = [(WAAQIView *)self aqiIndexLabel];
    [v15 setHidden:0];

    double v16 = [(WAAQIView *)self aqiScaleView];
    [v16 setHidden:0];

    BOOL v17 = WAIsShortDevice();
    double v18 = 8.0;
    if (!v17) {
      double v18 = 11.0;
    }
    double v62 = v18;
    if (v17) {
      double v19 = 11.0;
    }
    else {
      double v19 = 10.0;
    }
    double v20 = [(WAAQIView *)self aqiScaleView];
    [v20 intrinsicContentSize];
    id v63 = v21;

    [(WAAQIView *)self frame];
    double v61 = v22;
    double v23 = [(WAAQIView *)self aqiIndexLabel];
    [v23 frame];
    double v25 = v24;
    double v27 = v26;

    double v28 = *MEMORY[0x263F00148];
    [(WAAQIView *)self bounds];
    -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v28, v19, v25, v27, v29, v30, v31, v32);
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    double v41 = [(WAAQIView *)self aqiIndexLabel];
    objc_msgSend(v41, "setFrame:", v34, v36, v38, v40);

    double v42 = [(WAAQIView *)self aqiIndexLabel];
    double v43 = [v42 attributedText];
    double v44 = objc_msgSend(v43, "wa_font");
    [v44 descender];
    double v46 = v45;
    v66.origin.CGFloat x = v28;
    v66.origin.CGFloat y = v19;
    v66.size.CGFloat width = v25;
    v66.size.double height = v27;
    double v47 = v46 + CGRectGetMaxY(v66);

    double v48 = [(WAAQIView *)self aqiScaleView];
    [v48 frame];

    [(WAAQIView *)self bounds];
    -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v28, v62 + v47, v61, *(double *)&v63, v49, v50, v51, v52);
    double v54 = v53;
    double v56 = v55;
    double v58 = v57;
    double v60 = v59;
    id v64 = [(WAAQIView *)self aqiScaleView];
    objc_msgSend(v64, "setFrame:", v54, v56, v58, v60);
  }
}

- (void)layoutForModeAQITemporarilyUnavailable
{
  [(WAAQIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(WAAQIView *)self aqiLabel];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  double v12 = [(WAAQIView *)self aqiLabel];
  [v12 sizeToFit];

  double v13 = [(WAAQIView *)self aqiLabel];
  [v13 setHidden:0];

  [(WAAQIView *)self bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v22 = [(WAAQIView *)self aqiAgencyLabel];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  double v23 = [(WAAQIView *)self aqiAgencyLabel];
  [v23 sizeToFit];

  double v24 = [(WAAQIView *)self aqiAgencyLabel];
  [v24 setHidden:0];

  [(WAAQIView *)self bounds];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v33 = [(WAAQIView *)self aqiCategoryLabel];
  objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

  double v34 = [(WAAQIView *)self aqiCategoryLabel];
  [v34 sizeToFit];

  double v35 = [(WAAQIView *)self aqiCategoryLabel];
  [v35 setHidden:0];

  [(WAAQIView *)self bounds];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v44 = [(WAAQIView *)self aqiCitationLabel];
  objc_msgSend(v44, "setFrame:", v37, v39, v41, v43);

  double v45 = [(WAAQIView *)self aqiCitationLabel];
  [v45 sizeToFit];

  double v46 = [(WAAQIView *)self aqiCitationLabel];
  [v46 setHidden:0];

  double v47 = [(WAAQIView *)self aqiLabel];
  [v47 frame];
  double v49 = v48;
  double v51 = v50;

  double v52 = *MEMORY[0x263F00148];
  [(WAAQIView *)self bounds];
  -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v52, 6.0, v49, v51, v53, v54, v55, v56);
  double v58 = v57;
  double v60 = v59;
  double v62 = v61;
  double v64 = v63;
  double v65 = [(WAAQIView *)self aqiLabel];
  objc_msgSend(v65, "setFrame:", v58, v60, v62, v64);

  CGRect v66 = [(WAAQIView *)self aqiAgencyLabel];
  [v66 frame];
  double v68 = v67;
  double v70 = v69;

  [(WAAQIView *)self bounds];
  CGFloat v71 = CGRectGetMaxX(v134) - v68;
  [(WAAQIView *)self bounds];
  -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v71, 6.0, v68, v70, v72, v73, v74, v75);
  double v77 = v76;
  double v79 = v78;
  double v81 = v80;
  double v83 = v82;
  CGFloat v84 = [(WAAQIView *)self aqiAgencyLabel];
  objc_msgSend(v84, "setFrame:", v77, v79, v81, v83);

  double v85 = [(WAAQIView *)self aqiLabel];
  double v86 = [v85 attributedText];
  v87 = objc_msgSend(v86, "wa_font");
  [v87 ascender];
  double v89 = v88;

  double v90 = [(WAAQIView *)self aqiCategoryLabel];
  [v90 frame];
  double v92 = v91;
  double v94 = v93;

  CGFloat v95 = v89 + 1.0;
  [(WAAQIView *)self bounds];
  -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v52, v95, v92, v94, v96, v97, v98, v99);
  double v101 = v100;
  double v103 = v102;
  double v105 = v104;
  double v107 = v106;
  CGFloat v108 = [(WAAQIView *)self aqiCategoryLabel];
  objc_msgSend(v108, "setFrame:", v101, v103, v105, v107);

  CGFloat v109 = [(WAAQIView *)self aqiCategoryLabel];
  double v110 = [v109 attributedText];
  double v111 = objc_msgSend(v110, "wa_font");
  [v111 descender];
  double v113 = v112;
  v135.origin.CGFloat x = v52;
  v135.origin.CGFloat y = v95;
  v135.size.CGFloat width = v92;
  v135.size.double height = v94;
  double v114 = v113 + CGRectGetMaxY(v135);

  double v115 = [(WAAQIView *)self aqiCitationLabel];
  [v115 frame];
  double v117 = v116;
  double v119 = v118;

  [(WAAQIView *)self bounds];
  -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v52, v114 + 1.0, v117, v119, v120, v121, v122, v123);
  double v125 = v124;
  double v127 = v126;
  double v129 = v128;
  double v131 = v130;
  id v132 = [(WAAQIView *)self aqiCitationLabel];
  objc_msgSend(v132, "setFrame:", v125, v127, v129, v131);
}

- (void)layoutForExtendedModeWithScale
{
  if (![(WAAQIView *)self forceHideThisEntireView])
  {
    [(WAAQIView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v11 = [(WAAQIView *)self aqiLabel];
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

    double v12 = [(WAAQIView *)self aqiLabel];
    [v12 sizeToFit];

    double v13 = [(WAAQIView *)self aqiLabel];
    [v13 setHidden:0];

    [(WAAQIView *)self bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v22 = [(WAAQIView *)self aqiAgencyLabel];
    objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

    double v23 = [(WAAQIView *)self aqiAgencyLabel];
    [v23 sizeToFit];

    double v24 = [(WAAQIView *)self aqiAgencyLabel];
    [v24 setHidden:0];

    [(WAAQIView *)self bounds];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v33 = [(WAAQIView *)self airQualityMetadataGradeLabel];
    objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

    double v34 = [(WAAQIView *)self airQualityMetadataGradeLabel];
    [v34 sizeToFit];

    double v35 = [(WAAQIView *)self airQualityMetadataGradeLabel];
    [v35 setHidden:0];

    double v36 = [(WAAQIView *)self aqiScaleView];
    [v36 setHidden:0];

    if (![(WAAQIView *)self hideRecommendationString])
    {
      [(WAAQIView *)self bounds];
      double v38 = v37;
      double v40 = v39;
      double v42 = v41;
      double v44 = v43;
      double v45 = [(WAAQIView *)self airQualityRecommendationLabel];
      objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);

      double v46 = [(WAAQIView *)self airQualityRecommendationLabel];
      [v46 sizeToFit];

      double v47 = [(WAAQIView *)self airQualityRecommendationLabel];
      [v47 setHidden:0];
    }
    if (![(WAAQIView *)self hideCitationString])
    {
      [(WAAQIView *)self bounds];
      double v49 = v48;
      double v51 = v50;
      double v53 = v52;
      double v55 = v54;
      double v56 = [(WAAQIView *)self aqiCitationLabel];
      objc_msgSend(v56, "setFrame:", v49, v51, v53, v55);

      double v57 = [(WAAQIView *)self aqiCitationLabel];
      [v57 sizeToFit];

      double v58 = [(WAAQIView *)self aqiCitationLabel];
      [v58 setHidden:0];
    }
    double v59 = [(WAAQIView *)self aqiScaleView];
    [v59 intrinsicContentSize];
    id v217 = v60;

    [(WAAQIView *)self frame];
    double v216 = v61;
    double v62 = [(WAAQIView *)self aqiLabel];
    [v62 frame];
    double v64 = v63;
    double v66 = v65;

    double v67 = *MEMORY[0x263F00148];
    [(WAAQIView *)self bounds];
    double v68 = 6.0;
    -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v67, 6.0, v64, v66, v69, v70, v71, v72);
    double v74 = v73;
    double v76 = v75;
    double v78 = v77;
    double v80 = v79;
    double v81 = [(WAAQIView *)self aqiLabel];
    objc_msgSend(v81, "setFrame:", v74, v76, v78, v80);

    double v82 = [(WAAQIView *)self aqiAgencyLabel];
    [v82 frame];
    double v84 = v83;
    double v86 = v85;

    v87 = [(WAAQIView *)self aqiLabel];
    [v87 frame];
    double v89 = v88;
    double v90 = [(WAAQIView *)self aqiAgencyLabel];
    [v90 frame];
    double v92 = v89 + v91 + 10.0;
    [(WAAQIView *)self bounds];
    double v94 = v93;

    if (v92 >= v94)
    {
      double v114 = [(WAAQIView *)self aqiLabel];
      double v115 = [v114 attributedText];
      double v116 = objc_msgSend(v115, "wa_font");
      [v116 ascender];
      double v118 = v117 + 6.0;

      double v113 = v118 + 1.0;
      [(WAAQIView *)self bounds];
      -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v67, v118 + 1.0, v84, v86, v119, v120, v121, v122);
      double v124 = v123;
      double v126 = v125;
      double v128 = v127;
      double v130 = v129;
      double v131 = [(WAAQIView *)self aqiAgencyLabel];
      objc_msgSend(v131, "setFrame:", v124, v126, v128, v130);

      CGFloat v109 = [(WAAQIView *)self aqiAgencyLabel];
      double v110 = [v109 attributedText];
      double v111 = objc_msgSend(v110, "wa_font");
      [v111 ascender];
      double v68 = v132;
    }
    else
    {
      [(WAAQIView *)self bounds];
      CGFloat v95 = CGRectGetMaxX(v220) - v84;
      [(WAAQIView *)self bounds];
      -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v95, 6.0, v84, v86, v96, v97, v98, v99);
      double v101 = v100;
      double v103 = v102;
      double v105 = v104;
      double v107 = v106;
      CGFloat v108 = [(WAAQIView *)self aqiAgencyLabel];
      objc_msgSend(v108, "setFrame:", v101, v103, v105, v107);

      CGFloat v109 = [(WAAQIView *)self aqiAgencyLabel];
      double v110 = [v109 attributedText];
      double v111 = objc_msgSend(v110, "wa_font");
      [v111 ascender];
      double v113 = v112;
    }
    double v133 = v113 + v68;

    CGRect v134 = [(WAAQIView *)self airQualityMetadataGradeLabel];
    [v134 frame];
    double v136 = v135;
    double v138 = v137;

    CGFloat v139 = v133 + 1.0;
    [(WAAQIView *)self bounds];
    -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v67, v133 + 1.0, v136, v138, v140, v141, v142, v143);
    double v145 = v144;
    double v147 = v146;
    double v149 = v148;
    double v151 = v150;
    double v152 = [(WAAQIView *)self airQualityMetadataGradeLabel];
    objc_msgSend(v152, "setFrame:", v145, v147, v149, v151);

    double v153 = [(WAAQIView *)self airQualityMetadataGradeLabel];
    v154 = [v153 attributedText];
    double v155 = objc_msgSend(v154, "wa_font");
    [v155 descender];
    double v157 = v156;
    v221.origin.CGFloat x = v67;
    v221.origin.CGFloat y = v139;
    v221.size.CGFloat width = v136;
    v221.size.double height = v138;
    double v158 = v157 + CGRectGetMaxY(v221);

    v159 = [(WAAQIView *)self aqiScaleView];
    [v159 frame];

    CGFloat v160 = v158 + 10.0;
    [(WAAQIView *)self bounds];
    -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v67, v160, v216, *(double *)&v217, v161, v162, v163, v164);
    double v166 = v165;
    double v168 = v167;
    double v170 = v169;
    double v172 = v171;
    v173 = [(WAAQIView *)self aqiScaleView];
    objc_msgSend(v173, "setFrame:", v166, v168, v170, v172);

    v222.origin.CGFloat x = v67;
    v222.origin.CGFloat y = v160;
    v222.size.CGFloat width = v216;
    *(void *)&v222.size.double height = v217;
    double MaxY = CGRectGetMaxY(v222);
    if (![(WAAQIView *)self hideRecommendationString])
    {
      v175 = [(WAAQIView *)self airQualityRecommendationLabel];
      [v175 frame];
      double v177 = v176;
      double v179 = v178;

      CGFloat v180 = MaxY + 10.0;
      [(WAAQIView *)self bounds];
      -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v67, v180, v177, v179, v181, v182, v183, v184);
      double v186 = v185;
      double v188 = v187;
      double v190 = v189;
      double v192 = v191;
      v193 = [(WAAQIView *)self airQualityRecommendationLabel];
      objc_msgSend(v193, "setFrame:", v186, v188, v190, v192);

      v194 = [(WAAQIView *)self airQualityRecommendationLabel];
      v195 = [v194 attributedText];
      v196 = objc_msgSend(v195, "wa_font");
      [v196 descender];
      double v198 = v197;
      v223.origin.CGFloat x = v67;
      v223.origin.CGFloat y = v180;
      v223.size.CGFloat width = v177;
      v223.size.double height = v179;
      double MaxY = v198 + CGRectGetMaxY(v223);
    }
    if (![(WAAQIView *)self hideCitationString])
    {
      v199 = [(WAAQIView *)self aqiCitationLabel];
      [v199 frame];
      double v201 = v200;
      double v203 = v202;

      [(WAAQIView *)self bounds];
      -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v67, MaxY + 8.0, v201, v203, v204, v205, v206, v207);
      double v209 = v208;
      double v211 = v210;
      double v213 = v212;
      double v215 = v214;
      id v218 = [(WAAQIView *)self aqiCitationLabel];
      objc_msgSend(v218, "setFrame:", v209, v211, v213, v215);
    }
  }
}

- (void)layoutForModeWithoutScale
{
  [(WAAQIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(WAAQIView *)self aqiLabel];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  double v12 = [(WAAQIView *)self aqiLabel];
  [v12 sizeToFit];

  double v13 = [(WAAQIView *)self aqiLabel];
  [v13 setHidden:0];

  [(WAAQIView *)self bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v22 = [(WAAQIView *)self aqiAgencyLabel];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  double v23 = [(WAAQIView *)self aqiAgencyLabel];
  [v23 sizeToFit];

  double v24 = [(WAAQIView *)self aqiAgencyLabel];
  [v24 setHidden:0];

  [(WAAQIView *)self bounds];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v33 = [(WAAQIView *)self airQualityMetadataGradeLabel];
  objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

  double v34 = [(WAAQIView *)self airQualityMetadataGradeLabel];
  [v34 sizeToFit];

  double v35 = [(WAAQIView *)self airQualityMetadataGradeLabel];
  [v35 setHidden:0];

  if (![(WAAQIView *)self hideRecommendationString])
  {
    [(WAAQIView *)self bounds];
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v44 = [(WAAQIView *)self airQualityRecommendationLabel];
    objc_msgSend(v44, "setFrame:", v37, v39, v41, v43);

    double v45 = [(WAAQIView *)self airQualityRecommendationLabel];
    [v45 sizeToFit];

    double v46 = [(WAAQIView *)self airQualityRecommendationLabel];
    [v46 setHidden:0];
  }
  if (![(WAAQIView *)self hideCitationString])
  {
    [(WAAQIView *)self bounds];
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
    double v55 = [(WAAQIView *)self aqiCitationLabel];
    objc_msgSend(v55, "setFrame:", v48, v50, v52, v54);

    double v56 = [(WAAQIView *)self aqiCitationLabel];
    [v56 sizeToFit];

    double v57 = [(WAAQIView *)self aqiCitationLabel];
    [v57 setHidden:0];
  }
  double v58 = [(WAAQIView *)self aqiLabel];
  [v58 frame];
  double v60 = v59;
  double v62 = v61;

  double v63 = *MEMORY[0x263F00148];
  [(WAAQIView *)self bounds];
  -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v63, 6.0, v60, v62, v64, v65, v66, v67);
  double v69 = v68;
  double v71 = v70;
  double v73 = v72;
  double v75 = v74;
  double v76 = [(WAAQIView *)self aqiLabel];
  objc_msgSend(v76, "setFrame:", v69, v71, v73, v75);

  double v77 = [(WAAQIView *)self aqiAgencyLabel];
  [v77 frame];
  double v79 = v78;
  double v81 = v80;

  [(WAAQIView *)self bounds];
  double MaxX = CGRectGetMaxX(v172);
  double v83 = [(WAAQIView *)self aqiAgencyLabel];
  [v83 frame];
  double v85 = MaxX - v84;

  [(WAAQIView *)self bounds];
  -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v85, 6.0, v79, v81, v86, v87, v88, v89);
  double v91 = v90;
  double v93 = v92;
  double v95 = v94;
  double v97 = v96;
  double v98 = [(WAAQIView *)self aqiAgencyLabel];
  objc_msgSend(v98, "setFrame:", v91, v93, v95, v97);

  double v99 = [(WAAQIView *)self aqiAgencyLabel];
  double v100 = [v99 attributedText];
  double v101 = objc_msgSend(v100, "wa_font");
  [v101 ascender];
  double v103 = v102 + 6.0;

  double v104 = [(WAAQIView *)self airQualityMetadataGradeLabel];
  [v104 frame];
  double v106 = v105;
  double v108 = v107;

  CGFloat v109 = v103 + 1.0;
  [(WAAQIView *)self bounds];
  -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v63, v109, v106, v108, v110, v111, v112, v113);
  double v115 = v114;
  double v117 = v116;
  double v119 = v118;
  double v121 = v120;
  double v122 = [(WAAQIView *)self airQualityMetadataGradeLabel];
  objc_msgSend(v122, "setFrame:", v115, v117, v119, v121);

  double v123 = [(WAAQIView *)self airQualityMetadataGradeLabel];
  double v124 = [v123 attributedText];
  double v125 = objc_msgSend(v124, "wa_font");
  [v125 descender];
  double v127 = v126;
  v173.origin.CGFloat x = v63;
  v173.origin.CGFloat y = v109;
  v173.size.CGFloat width = v106;
  v173.size.double height = v108;
  double v128 = v127 + CGRectGetMaxY(v173);

  if (![(WAAQIView *)self hideRecommendationString])
  {
    double v129 = [(WAAQIView *)self airQualityRecommendationLabel];
    [v129 frame];
    double v131 = v130;
    double v133 = v132;

    CGFloat v134 = v128 + 10.0;
    [(WAAQIView *)self bounds];
    -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v63, v134, v131, v133, v135, v136, v137, v138);
    double v140 = v139;
    double v142 = v141;
    double v144 = v143;
    double v146 = v145;
    double v147 = [(WAAQIView *)self airQualityRecommendationLabel];
    objc_msgSend(v147, "setFrame:", v140, v142, v144, v146);

    double v148 = [(WAAQIView *)self airQualityRecommendationLabel];
    double v149 = [v148 attributedText];
    double v150 = objc_msgSend(v149, "wa_font");
    [v150 descender];
    double v152 = v151;
    v174.origin.CGFloat x = v63;
    v174.origin.CGFloat y = v134;
    v174.size.CGFloat width = v131;
    v174.size.double height = v133;
    double v128 = v152 + CGRectGetMaxY(v174);
  }
  if (![(WAAQIView *)self hideCitationString])
  {
    double v153 = [(WAAQIView *)self aqiCitationLabel];
    [v153 frame];
    double v155 = v154;
    double v157 = v156;

    [(WAAQIView *)self bounds];
    -[WAAQIView rtlAdjustFrame:inBounds:](self, "rtlAdjustFrame:inBounds:", v63, v128 + 8.0, v155, v157, v158, v159, v160, v161);
    double v163 = v162;
    double v165 = v164;
    double v167 = v166;
    double v169 = v168;
    id v170 = [(WAAQIView *)self aqiCitationLabel];
    objc_msgSend(v170, "setFrame:", v163, v165, v167, v169);
  }
}

- (BOOL)isAccessibilityElement
{
  return ![(WAAQIView *)self forceHideThisEntireView]
      && [(WAAQIView *)self layoutMode] != 0;
}

- (id)accessibilityLabel
{
  if ([(WAAQIView *)self layoutMode] - 1 > 2)
  {
    double v4 = 0;
  }
  else
  {
    double v3 = [(WAAQIView *)self aqiLabel];
    double v4 = [v3 text];
  }
  return v4;
}

- (id)accessibilityValue
{
  unint64_t v3 = [(WAAQIView *)self layoutMode];
  switch(v3)
  {
    case 3uLL:
      goto LABEL_4;
    case 2uLL:
      double v10 = [(WAAQIView *)self airQualityMetadataGradeLabel];
      double v5 = [v10 text];

      double v11 = [(WAAQIView *)self aqiAgencyLabel];
      double v7 = [v11 text];

      double v12 = [(WAAQIView *)self aqiCitationLabel];
      double v13 = [v12 attributedText];
      double v8 = [v13 string];

      double v14 = objc_msgSend(MEMORY[0x263EFF8C0], "waaxArrayByIgnoringNilElementsWithCount:", 3, v5, v7, v8);
      double v9 = [v14 componentsJoinedByString:@", "];

      goto LABEL_6;
    case 1uLL:
LABEL_4:
      double v4 = [(WAAQIView *)self aqiIndexLabel];
      double v5 = [v4 text];

      double v6 = [(WAAQIView *)self aqiCategoryLabel];
      double v7 = [v6 text];

      double v8 = objc_msgSend(MEMORY[0x263EFF8C0], "waaxArrayByIgnoringNilElementsWithCount:", 2, v5, v7);
      double v9 = [v8 componentsJoinedByString:@", "];
LABEL_6:

      goto LABEL_8;
  }
  double v9 = 0;
LABEL_8:
  return v9;
}

- (WAAQIViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WAAQIViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)aqiLabel
{
  return self->_aqiLabel;
}

- (void)setAqiLabel:(id)a3
{
}

- (UILabel)aqiIndexLabel
{
  return self->_aqiIndexLabel;
}

- (void)setAqiIndexLabel:(id)a3
{
}

- (UILabel)aqiAgencyLabel
{
  return self->_aqiAgencyLabel;
}

- (void)setAqiAgencyLabel:(id)a3
{
}

- (UILabel)dash
{
  return self->_dash;
}

- (void)setDash:(id)a3
{
}

- (WAAQIScaleView)aqiScaleView
{
  return self->_aqiScaleView;
}

- (void)setAqiScaleView:(id)a3
{
}

- (UILabel)aqiCategoryLabel
{
  return self->_aqiCategoryLabel;
}

- (void)setAqiCategoryLabel:(id)a3
{
}

- (UILabel)airQualityMetadataGradeLabel
{
  return self->_airQualityMetadataGradeLabel;
}

- (void)setAirQualityMetadataGradeLabel:(id)a3
{
}

- (UILabel)airQualityRecommendationLabel
{
  return self->_airQualityRecommendationLabel;
}

- (void)setAirQualityRecommendationLabel:(id)a3
{
}

- (UILabel)aqiCitationLabel
{
  return self->_aqiCitationLabel;
}

- (void)setAqiCitationLabel:(id)a3
{
}

- (WAAQIViewStyler)styler
{
  return self->_styler;
}

- (void)setStyler:(id)a3
{
}

- (City)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (WAAQIAttributionStringBuilder)attributionStringBuilder
{
  return self->_attributionStringBuilder;
}

- (void)setAttributionStringBuilder:(id)a3
{
}

- (BOOL)hideCitationString
{
  return self->_hideCitationString;
}

- (void)setHideCitationString:(BOOL)a3
{
  self->_hideCitationString = a3;
}

- (BOOL)hideRecommendationString
{
  return self->_hideRecommendationString;
}

- (void)setHideRecommendationString:(BOOL)a3
{
  self->_hideRecommendationString = a3;
}

- (BOOL)forceHideThisEntireView
{
  return self->_forceHideThisEntireView;
}

- (void)setForceHideThisEntireView:(BOOL)a3
{
  self->_forceHideThisEntireView = a3;
}

- (unint64_t)layoutMode
{
  return self->_layoutMode;
}

- (void)setLayoutMode:(unint64_t)a3
{
  self->_layoutMode = a3;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionStringBuilder, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_styler, 0);
  objc_storeStrong((id *)&self->_aqiCitationLabel, 0);
  objc_storeStrong((id *)&self->_airQualityRecommendationLabel, 0);
  objc_storeStrong((id *)&self->_airQualityMetadataGradeLabel, 0);
  objc_storeStrong((id *)&self->_aqiCategoryLabel, 0);
  objc_storeStrong((id *)&self->_aqiScaleView, 0);
  objc_storeStrong((id *)&self->_dash, 0);
  objc_storeStrong((id *)&self->_aqiAgencyLabel, 0);
  objc_storeStrong((id *)&self->_aqiIndexLabel, 0);
  objc_storeStrong((id *)&self->_aqiLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end