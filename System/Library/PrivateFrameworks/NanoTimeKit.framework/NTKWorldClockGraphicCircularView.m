@interface NTKWorldClockGraphicCircularView
+ ($513C300AF4A6862D8B434F9A964F3546)_layoutConstantsForDevice:(SEL)a3;
+ (BOOL)_shouldUseDaytimeColoringForTransitInfo:(id)a3 atDate:(id)a4;
+ (id)_createHandsViewForDevice:(id)a3;
+ (id)eastLabelNumber;
+ (id)northLabelNumber;
+ (id)southLabelNumber;
+ (id)westLabelNumber;
+ (void)initialize;
- ($513C300AF4A6862D8B434F9A964F3546)layoutConstants;
- (BOOL)_updateLabelAndDial;
- (BOOL)hasPerformedColoringFirstPass;
- (BOOL)positionLabelNorthSide;
- (BOOL)useDayTimeColoring;
- (CLKClockTimerToken)clockTimerToken;
- (CLKDevice)device;
- (CLKMonochromeFilterProvider)filterProvider;
- (CLKUIAlmanacTransitInfo)transitInfo;
- (NSArray)hourLabels;
- (NTKRichComplicationDialView)dialView;
- (NTKWorldClockGraphicCircularView)initWithDevice:(id)a3 smallTickCount:(unint64_t)a4;
- (NTKWorldClockRichComplicationHandsBaseView)handsView;
- (UIColor)daytimeBackgroundColor;
- (UIColor)daytimeHandsColor;
- (UIColor)daytimeHandsLargeTickColor;
- (UIColor)daytimeHandsSmallTickColor;
- (UIColor)daytimeSecondHandColor;
- (UIColor)nighttimeBackgroundColor;
- (UIColor)nighttimeHandsColor;
- (UIColor)nighttimeHandsLargeTickColor;
- (UIColor)nighttimeHandsSmallTickColor;
- (UIColor)nighttimeSecondHandColor;
- (UIColor)tintedPlatterColor;
- (UILabel)cityNameLabel;
- (UILabel)eastHourLabel;
- (UILabel)northHourLabel;
- (UILabel)southHourLabel;
- (UILabel)westHourLabel;
- (UIView)platter;
- (double)monochromeFraction;
- (double)tintedFraction;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (void)_startClockUpdates;
- (void)_stopClockUpdates;
- (void)_updateCityAbbreviationColor;
- (void)_updateDayTimeColoring;
- (void)_updateHandsColor;
- (void)_updateHourLabelColors;
- (void)_updatePlatterColor;
- (void)_updateTickColor;
- (void)_updateUI;
- (void)applyConfiguration:(id)a3 animated:(BOOL)a4;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)pauseLiveFullColorImageView;
- (void)resumeLiveFullColorImageView;
- (void)setClockTimerToken:(id)a3;
- (void)setColoringFirstPassPerformed:(BOOL)a3;
- (void)setDaytimeBackgroundColor:(id)a3;
- (void)setDaytimeHandsColor:(id)a3;
- (void)setDaytimeHandsLargeTickColor:(id)a3;
- (void)setDaytimeHandsSmallTickColor:(id)a3;
- (void)setDaytimeSecondHandColor:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setMonochromeFraction:(double)a3;
- (void)setNighttimeBackgroundColor:(id)a3;
- (void)setNighttimeHandsColor:(id)a3;
- (void)setNighttimeHandsLargeTickColor:(id)a3;
- (void)setNighttimeHandsSmallTickColor:(id)a3;
- (void)setNighttimeSecondHandColor:(id)a3;
- (void)setPositionLabelNorthSide:(BOOL)a3;
- (void)setTintedFraction:(double)a3;
- (void)setTintedPlatterColor:(id)a3;
- (void)setTransitInfo:(id)a3;
- (void)setUseDayTimeColoring:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKWorldClockGraphicCircularView

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_102);
  }
}

void __46__NTKWorldClockGraphicCircularView_initialize__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.898039222 green:0.898039222 blue:0.898039222 alpha:1.0];
  v1 = (void *)LegacyDefaultDaytimeBackgroundColor;
  LegacyDefaultDaytimeBackgroundColor = v0;

  uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithWhite:0.100000001 alpha:1.0];
  v3 = (void *)LegacyDefaultNighttimeBackgroundColor;
  LegacyDefaultNighttimeBackgroundColor = v2;

  uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.75];
  v5 = (void *)LegacyDefaultDaytimeLargeTickColor;
  LegacyDefaultDaytimeLargeTickColor = v4;

  uint64_t v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.75];
  v7 = (void *)LegacyDefaultDaytimeSmallTickColor;
  LegacyDefaultDaytimeSmallTickColor = v6;

  uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.75];
  v9 = (void *)LegacyDefaultNighttimeLargeTickColor;
  LegacyDefaultNighttimeLargeTickColor = v8;

  uint64_t v10 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.75];
  v11 = (void *)LegacyDefaultNighttimeSmallTickColor;
  LegacyDefaultNighttimeSmallTickColor = v10;

  uint64_t v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.949019611 alpha:1.0];
  v13 = (void *)GossamerDefaultDaytimeBackgroundColor;
  GossamerDefaultDaytimeBackgroundColor = v12;

  uint64_t v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.100000001 alpha:1.0];
  v15 = (void *)GossamerDefaultNighttimeBackgroundColor;
  GossamerDefaultNighttimeBackgroundColor = v14;

  uint64_t v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:1.0];
  v17 = (void *)GossamerDefaultDaytimeLargeTickColor;
  GossamerDefaultDaytimeLargeTickColor = v16;

  uint64_t v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.75];
  v19 = (void *)GossamerDefaultDaytimeSmallTickColor;
  GossamerDefaultDaytimeSmallTickColor = v18;

  uint64_t v20 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
  v21 = (void *)GossamerDefaultNighttimeLargeTickColor;
  GossamerDefaultNighttimeLargeTickColor = v20;

  uint64_t v22 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.75];
  v23 = (void *)GossamerDefaultNighttimeSmallTickColor;
  GossamerDefaultNighttimeSmallTickColor = v22;
}

+ (id)northLabelNumber
{
  return &unk_1F16E1D58;
}

+ (id)eastLabelNumber
{
  return &unk_1F16E1D70;
}

+ (id)southLabelNumber
{
  return &unk_1F16E1D88;
}

+ (id)westLabelNumber
{
  return &unk_1F16E1DA0;
}

- (void)applyConfiguration:(id)a3 animated:(BOOL)a4
{
  BOOL v22 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v25 = [v5 transitInfo];
  -[NTKWorldClockGraphicCircularView setTransitInfo:](self, "setTransitInfo:");
  v24 = [v5 labelText];
  uint64_t v6 = [v24 length];
  v7 = [(NTKWorldClockGraphicCircularView *)self cityNameLabel];
  v23 = [v7 text];
  uint64_t v21 = [v23 length];
  [v7 setHidden:v6 == 0];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [(NTKWorldClockGraphicCircularView *)self hourLabels];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ((v6 != 0) != [v13 isHidden]) {
          [v13 setHidden:v6 != 0];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  [v7 setText:v24];
  if (v6 != v21) {
    [(NTKWorldClockGraphicCircularView *)self setNeedsLayout];
  }
  uint64_t v14 = [(NTKWorldClockGraphicCircularView *)self handsView];
  v15 = [v14 secondHandView];
  int v16 = [v15 isHidden];
  uint64_t v17 = [v5 inTritium];
  if (v16 != v17) {
    [v15 setHidden:v17];
  }
  uint64_t v18 = [v5 timeZone];
  [v14 setTimeZone:v18];
  v19 = [v5 overrideDate];
  double v20 = 0.300000012;
  if (!v22) {
    double v20 = 0.0;
  }
  [v14 setOverrideDate:v19 duration:v20];
  objc_msgSend(v14, "setHidden:", objc_msgSend(v5, "isPrivacy"));
  [(NTKWorldClockGraphicCircularView *)self _updateUI];
}

- (void)dealloc
{
  [(NTKWorldClockGraphicCircularView *)self _stopClockUpdates];
  v3.receiver = self;
  v3.super_class = (Class)NTKWorldClockGraphicCircularView;
  [(NTKWorldClockGraphicCircularView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v61.receiver = self;
  v61.super_class = (Class)NTKWorldClockGraphicCircularView;
  [(NTKWorldClockGraphicCircularView *)&v61 layoutSubviews];
  [(NTKWorldClockGraphicCircularView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(NTKWorldClockGraphicCircularView *)self platter];
  uint64_t v12 = [(NTKWorldClockGraphicCircularView *)self handsView];
  v62.origin.x = v4;
  v62.origin.y = v6;
  v62.size.width = v8;
  v62.size.height = v10;
  if (CGRectIsNull(v62)) {
    goto LABEL_4;
  }
  v63.origin.x = v4;
  v63.origin.y = v6;
  v63.size.width = v8;
  v63.size.height = v10;
  if (CGRectIsEmpty(v63)
    || (v64.origin.x = v4, v64.origin.y = v6, v64.size.width = v8, v64.size.height = v10, CGRectIsInfinite(v64)))
  {
LABEL_4:
    v13 = [(NTKWorldClockGraphicCircularView *)self layer];
    [v13 setCornerRadius:0.0];

    double v14 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v16 = v4;
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    objc_msgSend(v11, "setBounds:", *MEMORY[0x1E4F1DB28], v15, v17, v18);
    double v19 = v18;
    double v4 = v16;
    objc_msgSend(v12, "setBounds:", v14, v15, v17, v19);
  }
  else
  {
    v70.origin.x = v4;
    v70.origin.y = v6;
    v70.size.width = v8;
    v70.size.height = v10;
    double Width = CGRectGetWidth(v70);
    v71.origin.x = v4;
    v71.origin.y = v6;
    v71.size.width = v8;
    v71.size.height = v10;
    double Height = CGRectGetHeight(v71);
    if (Width < Height) {
      double Height = Width;
    }
    double v55 = Height * 0.5;
    v56 = [(NTKWorldClockGraphicCircularView *)self layer];
    [v56 setCornerRadius:v55];

    v72.origin.x = v4;
    v72.origin.y = v6;
    v72.size.width = v8;
    v72.size.height = v10;
    double MidX = CGRectGetMidX(v72);
    v73.origin.x = v4;
    v73.origin.y = v6;
    v73.size.width = v8;
    v73.size.height = v10;
    double MidY = CGRectGetMidY(v73);
    objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
    objc_msgSend(v11, "setCenter:", MidX, MidY);
    objc_msgSend(v12, "setBounds:", v4, v6, v8, v10);
    objc_msgSend(v12, "setCenter:", MidX, MidY);
  }
  [(NTKWorldClockGraphicCircularView *)self layoutConstants];
  double v20 = [(NTKWorldClockGraphicCircularView *)self dialView];
  uint64_t v21 = [(NTKWorldClockGraphicCircularView *)self device];
  CLKSizeCenteredInRectForDevice();
  objc_msgSend(v20, "setFrame:");

  BOOL v22 = [(NTKWorldClockGraphicCircularView *)self positionLabelNorthSide];
  uint64_t v23 = 16;
  if (v22) {
    uint64_t v23 = 8;
  }
  double v24 = *(double *)((char *)&self->_layoutConstants.cityNameFontSize + v23);
  v25 = [(NTKWorldClockGraphicCircularView *)self cityNameLabel];
  long long v26 = [v25 text];
  uint64_t v27 = [v26 length];
  int v28 = [v25 isHidden];
  v60 = v12;
  if (v27)
  {
    if (v28) {
      [v25 setHidden:0];
    }
    long long v29 = v11;
    [v25 sizeToFit];
    [(UILabel *)self->_cityNameLabel frame];
    v30 = [(NTKWorldClockGraphicCircularView *)self device];
    CLKRectCenteredXInRectForDevice();
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;

    [v25 _lastLineBaseline];
    objc_msgSend(v25, "setFrame:", v32, v24 - v37, v34, v36);
  }
  else
  {
    long long v29 = v11;
    if ((v28 & 1) == 0) {
      [v25 setHidden:1];
    }
  }
  v65.origin.x = v4;
  v65.origin.y = v6;
  v65.size.width = v8;
  v65.size.height = v10;
  double v38 = CGRectGetMidX(v65);
  v66.origin.x = v4;
  v66.origin.y = v6;
  v66.size.width = v8;
  v66.size.height = v10;
  double v59 = CGRectGetMidY(v66);
  v39 = [(NTKWorldClockGraphicCircularView *)self device];
  v40 = [(NTKWorldClockGraphicCircularView *)self northHourLabel];
  v41 = [v40 font];

  [v41 ascender];
  [v41 capHeight];
  CGFloat v42 = v10;
  CGFloat v43 = v8;
  CGFloat v44 = v6;
  CGFloat v45 = v4;
  [v41 descender];
  v46 = [(NTKWorldClockGraphicCircularView *)self northHourLabel];
  CLKRoundForDevice();
  objc_msgSend(v46, "setCenter:", v38, 0.0 - v47);
  v48 = [(NTKWorldClockGraphicCircularView *)self eastHourLabel];
  v67.origin.x = v4;
  v67.origin.y = v44;
  v67.size.width = v43;
  v67.size.height = v42;
  objc_msgSend(v48, "setCenter:", CGRectGetMaxY(v67) - 0.0, v59);
  v49 = [(NTKWorldClockGraphicCircularView *)self southHourLabel];
  v68.origin.x = v4;
  v68.origin.y = v44;
  v68.size.width = v43;
  v68.size.height = v42;
  CGFloat v50 = CGRectGetMaxY(v68) - 0.0;
  CLKRoundForDevice();
  objc_msgSend(v49, "setCenter:", v38, v50 - v51);
  v52 = [(NTKWorldClockGraphicCircularView *)self westHourLabel];
  v69.origin.x = v45;
  v69.origin.y = v44;
  v69.size.width = v43;
  v69.size.height = v42;
  objc_msgSend(v52, "setCenter:", CGRectGetMinX(v69) + 0.0, v59);
}

- (UIColor)daytimeBackgroundColor
{
  p_daytimeBackgroundColor = &self->_daytimeBackgroundColor;
  if (!self->_daytimeBackgroundColor)
  {
    if (self->_showGossamerUI) {
      double v3 = &GossamerDefaultDaytimeBackgroundColor;
    }
    else {
      double v3 = &LegacyDefaultDaytimeBackgroundColor;
    }
    objc_storeStrong((id *)&self->_daytimeBackgroundColor, (id)*v3);
  }
  double v4 = *p_daytimeBackgroundColor;

  return v4;
}

- (void)setDaytimeBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_daytimeBackgroundColor, a3);
  if ([(NTKWorldClockGraphicCircularView *)self useDayTimeColoring])
  {
    [(NTKWorldClockGraphicCircularView *)self _updatePlatterColor];
  }
}

- (UIColor)daytimeHandsColor
{
  daytimeHandsColor = self->_daytimeHandsColor;
  if (!daytimeHandsColor)
  {
    double v4 = [MEMORY[0x1E4FB1618] systemOrangeColor];
    double v5 = self->_daytimeHandsColor;
    self->_daytimeHandsColor = v4;

    daytimeHandsColor = self->_daytimeHandsColor;
  }

  return daytimeHandsColor;
}

- (void)setDaytimeHandsColor:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_daytimeHandsColor, a3);
  if ([(NTKWorldClockGraphicCircularView *)self useDayTimeColoring])
  {
    double v5 = [(CLKUIAnalogHandsView *)self->_handsView hourHandView];
    [v5 setColor:v7];

    double v6 = [(CLKUIAnalogHandsView *)self->_handsView minuteHandView];
    [v6 setColor:v7];
  }
}

- (UIColor)daytimeSecondHandColor
{
  daytimeSecondHandColor = self->_daytimeSecondHandColor;
  if (!daytimeSecondHandColor)
  {
    double v4 = [MEMORY[0x1E4FB1618] systemOrangeColor];
    double v5 = self->_daytimeSecondHandColor;
    self->_daytimeSecondHandColor = v4;

    daytimeSecondHandColor = self->_daytimeSecondHandColor;
  }

  return daytimeSecondHandColor;
}

- (void)setDaytimeSecondHandColor:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_daytimeSecondHandColor, a3);
  if ([(NTKWorldClockGraphicCircularView *)self useDayTimeColoring])
  {
    double v5 = [(CLKUIAnalogHandsView *)self->_handsView secondHandView];
    [v5 setColor:v6];
  }
}

- (UIColor)nighttimeBackgroundColor
{
  p_nighttimeBackgroundColor = &self->_nighttimeBackgroundColor;
  if (!self->_nighttimeBackgroundColor)
  {
    if (self->_showGossamerUI) {
      double v3 = &GossamerDefaultNighttimeBackgroundColor;
    }
    else {
      double v3 = &LegacyDefaultNighttimeBackgroundColor;
    }
    objc_storeStrong((id *)&self->_nighttimeBackgroundColor, (id)*v3);
  }
  double v4 = *p_nighttimeBackgroundColor;

  return v4;
}

- (void)setNighttimeBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_nighttimeBackgroundColor, a3);
  if (![(NTKWorldClockGraphicCircularView *)self useDayTimeColoring])
  {
    [(NTKWorldClockGraphicCircularView *)self _updatePlatterColor];
  }
}

- (UIColor)nighttimeHandsColor
{
  nighttimeHandsColor = self->_nighttimeHandsColor;
  if (!nighttimeHandsColor)
  {
    double v4 = [MEMORY[0x1E4FB1618] systemOrangeColor];
    double v5 = self->_nighttimeHandsColor;
    self->_nighttimeHandsColor = v4;

    nighttimeHandsColor = self->_nighttimeHandsColor;
  }

  return nighttimeHandsColor;
}

- (void)setNighttimeHandsColor:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_nighttimeHandsColor, a3);
  if (![(NTKWorldClockGraphicCircularView *)self useDayTimeColoring])
  {
    double v5 = [(CLKUIAnalogHandsView *)self->_handsView hourHandView];
    [v5 setColor:v7];

    id v6 = [(CLKUIAnalogHandsView *)self->_handsView minuteHandView];
    [v6 setColor:v7];
  }
}

- (UIColor)nighttimeSecondHandColor
{
  nighttimeSecondHandColor = self->_nighttimeSecondHandColor;
  if (!nighttimeSecondHandColor)
  {
    double v4 = [MEMORY[0x1E4FB1618] systemOrangeColor];
    double v5 = self->_nighttimeSecondHandColor;
    self->_nighttimeSecondHandColor = v4;

    nighttimeSecondHandColor = self->_nighttimeSecondHandColor;
  }

  return nighttimeSecondHandColor;
}

- (void)setNighttimeSecondHandColor:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_nighttimeSecondHandColor, a3);
  if (![(NTKWorldClockGraphicCircularView *)self useDayTimeColoring])
  {
    double v5 = [(CLKUIAnalogHandsView *)self->_handsView secondHandView];
    [v5 setColor:v6];
  }
}

- (UIColor)daytimeHandsLargeTickColor
{
  p_daytimeHandsLargeTickColor = &self->_daytimeHandsLargeTickColor;
  if (!self->_daytimeHandsLargeTickColor)
  {
    if (self->_showGossamerUI) {
      double v3 = &GossamerDefaultDaytimeLargeTickColor;
    }
    else {
      double v3 = &LegacyDefaultDaytimeLargeTickColor;
    }
    objc_storeStrong((id *)&self->_daytimeHandsLargeTickColor, (id)*v3);
  }
  double v4 = *p_daytimeHandsLargeTickColor;

  return v4;
}

- (void)setDaytimeHandsLargeTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_daytimeHandsLargeTickColor, a3);
  if ([(NTKWorldClockGraphicCircularView *)self useDayTimeColoring])
  {
    [(NTKWorldClockGraphicCircularView *)self _updateHourLabelColors];
    [(NTKWorldClockGraphicCircularView *)self _updateTickColor];
  }
}

- (UIColor)daytimeHandsSmallTickColor
{
  p_daytimeHandsSmallTickColor = &self->_daytimeHandsSmallTickColor;
  if (!self->_daytimeHandsSmallTickColor)
  {
    if (self->_showGossamerUI) {
      double v3 = &GossamerDefaultDaytimeSmallTickColor;
    }
    else {
      double v3 = &LegacyDefaultDaytimeSmallTickColor;
    }
    objc_storeStrong((id *)&self->_daytimeHandsSmallTickColor, (id)*v3);
  }
  double v4 = *p_daytimeHandsSmallTickColor;

  return v4;
}

- (void)setDaytimeHandsSmallTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_daytimeHandsSmallTickColor, a3);
  if ([(NTKWorldClockGraphicCircularView *)self useDayTimeColoring])
  {
    [(NTKWorldClockGraphicCircularView *)self _updateTickColor];
  }
}

- (UIColor)nighttimeHandsLargeTickColor
{
  p_nighttimeHandsLargeTickColor = &self->_nighttimeHandsLargeTickColor;
  if (!self->_nighttimeHandsLargeTickColor)
  {
    if (self->_showGossamerUI) {
      double v3 = &GossamerDefaultNighttimeLargeTickColor;
    }
    else {
      double v3 = &LegacyDefaultNighttimeLargeTickColor;
    }
    objc_storeStrong((id *)&self->_nighttimeHandsLargeTickColor, (id)*v3);
  }
  double v4 = *p_nighttimeHandsLargeTickColor;

  return v4;
}

- (void)setNighttimeHandsLargeTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_nighttimeHandsLargeTickColor, a3);
  if (![(NTKWorldClockGraphicCircularView *)self useDayTimeColoring])
  {
    [(NTKWorldClockGraphicCircularView *)self _updateHourLabelColors];
    [(NTKWorldClockGraphicCircularView *)self _updateTickColor];
  }
}

- (UIColor)nighttimeHandsSmallTickColor
{
  p_nighttimeHandsSmallTickColor = &self->_nighttimeHandsSmallTickColor;
  if (!self->_nighttimeHandsSmallTickColor)
  {
    if (self->_showGossamerUI) {
      double v3 = &GossamerDefaultNighttimeSmallTickColor;
    }
    else {
      double v3 = &LegacyDefaultNighttimeSmallTickColor;
    }
    objc_storeStrong((id *)&self->_nighttimeHandsSmallTickColor, (id)*v3);
  }
  double v4 = *p_nighttimeHandsSmallTickColor;

  return v4;
}

- (void)setNighttimeHandsSmallTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_nighttimeHandsSmallTickColor, a3);
  if (![(NTKWorldClockGraphicCircularView *)self useDayTimeColoring])
  {
    [(NTKWorldClockGraphicCircularView *)self _updateTickColor];
  }
}

- (void)setTintedFraction:(double)a3
{
  double v3 = fmin(fmax(a3, 0.0), 1.0);
  if (self->_tintedFraction != v3)
  {
    self->_tintedFraction = v3;
    [(NTKWorldClockGraphicCircularView *)self _updatePlatterColor];
    [(NTKWorldClockGraphicCircularView *)self _updateCityAbbreviationColor];
    [(NTKWorldClockGraphicCircularView *)self _updateHourLabelColors];
    [(NTKWorldClockGraphicCircularView *)self _updateTickColor];
    [(NTKWorldClockGraphicCircularView *)self _updateHandsColor];
  }
}

- (void)setTintedPlatterColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_tintedPlatterColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tintedPlatterColor, a3);
    [(NTKWorldClockGraphicCircularView *)self _updatePlatterColor];
  }
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return [(NTKWorldClockGraphicCircularView *)self initWithDevice:a3 smallTickCount:2];
}

- (NTKWorldClockGraphicCircularView)initWithDevice:(id)a3 smallTickCount:(unint64_t)a4
{
  v69[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v68.receiver = self;
  v68.super_class = (Class)NTKWorldClockGraphicCircularView;
  double v8 = -[NTKWorldClockGraphicCircularView initWithFrame:](&v68, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v9->_showGossamerUI = NTKShowGossamerUI(v7);
    CGSize v66 = (CGSize)0;
    CGSize v67 = (CGSize)0;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v63 = 0u;
    double v10 = objc_opt_class();
    if (v10)
    {
      [v10 _layoutConstantsForDevice:v7];
    }
    else
    {
      CGSize v66 = (CGSize)0;
      CGSize v67 = (CGSize)0;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v63 = 0u;
    }
    *(_OWORD *)&v9->_layoutConstants.cityNameFontSize = v63;
    CGSize v11 = v67;
    long long v13 = v64;
    long long v12 = v65;
    v9->_layoutConstants.majorTickSize = v66;
    v9->_layoutConstants.minorTickSize = v11;
    *(_OWORD *)&v9->_layoutConstants.cityNameBaselineOffsetSouthSide = v13;
    *(_OWORD *)&v9->_layoutConstants.hourInset = v12;
    [(NTKWorldClockGraphicCircularView *)v9 setClipsToBounds:1];
    double v14 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(UIView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(NTKWorldClockGraphicCircularView *)v9 addSubview:v14];
    platter = v9->_platter;
    v9->_platter = v14;
    v58 = v14;

    double v16 = [(id)objc_opt_class() _createHandsViewForDevice:v7];
    uint64_t v17 = [(NTKWorldClockGraphicCircularView *)v9 daytimeHandsColor];
    double v18 = [v16 minuteHandView];
    v57 = (void *)v17;
    [v18 setColor:v17];

    double v19 = [v16 hourHandView];
    [v19 setColor:v17];

    objc_storeStrong((id *)&v9->_handsView, v16);
    [(NTKWorldClockGraphicCircularView *)v9 addSubview:v9->_handsView];
    double v20 = -[NTKRichComplicationDialView initWithLargeTickCount:smallTickCountPerLargeTick:largeTickSize:smallTickSize:dialRange:startAngle:]([NTKRichComplicationDialView alloc], "initWithLargeTickCount:smallTickCountPerLargeTick:largeTickSize:smallTickSize:dialRange:startAngle:", 12, a4, v9->_layoutConstants.majorTickSize.width, v9->_layoutConstants.majorTickSize.height, v9->_layoutConstants.minorTickSize.width, v9->_layoutConstants.minorTickSize.height, 6.28318531, 0.0);
    dialView = v9->_dialView;
    v9->_dialView = v20;
    v56 = v20;

    [(NTKWorldClockGraphicCircularView *)v9 insertSubview:v9->_dialView belowSubview:v9->_handsView];
    BOOL v22 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    double v23 = *MEMORY[0x1E4FB09E0];
    double v24 = (void *)MEMORY[0x1E4F19680];
    v25 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:v9->_layoutConstants.cityNameFontSize design:*MEMORY[0x1E4FB09E0]];
    long long v26 = [v25 CLKFontWithAlternativePunctuation];
    [(UILabel *)v22 setFont:v26];

    cityNameLabel = v9->_cityNameLabel;
    v9->_cityNameLabel = v22;
    double v55 = v22;

    [(NTKWorldClockGraphicCircularView *)v9 insertSubview:v9->_cityNameLabel belowSubview:v9->_handsView];
    int v28 = [MEMORY[0x1E4F19A50] systemFontOfSize:*v24 weight:v9->_layoutConstants.hourFontSize design:v23];
    long long v29 = [v28 CLKFontWithAlternativePunctuation];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__NTKWorldClockGraphicCircularView_initWithDevice_smallTickCount___block_invoke;
    aBlock[3] = &unk_1E62C5CD8;
    id v60 = v29;
    v30 = v9;
    objc_super v61 = v30;
    id v62 = v16;
    id v54 = v16;
    id v31 = v29;
    double v32 = (void (**)(void *, void *))_Block_copy(aBlock);
    double v33 = [(id)objc_opt_class() northLabelNumber];
    uint64_t v34 = v32[2](v32, v33);
    id v35 = v30[67];
    v30[67] = (id)v34;

    double v36 = [v30[67] layer];
    objc_msgSend(v36, "setAnchorPoint:", 0.5, 0.0);

    double v37 = [(id)objc_opt_class() eastLabelNumber];
    uint64_t v38 = v32[2](v32, v37);
    id v39 = v30[68];
    v30[68] = (id)v38;

    v40 = [v30[68] layer];
    objc_msgSend(v40, "setAnchorPoint:", 1.0, 0.5);

    v41 = [(id)objc_opt_class() southLabelNumber];
    uint64_t v42 = v32[2](v32, v41);
    id v43 = v30[70];
    v30[70] = (id)v42;

    CGFloat v44 = [v30[70] layer];
    objc_msgSend(v44, "setAnchorPoint:", 0.5, 1.0);

    CGFloat v45 = [(id)objc_opt_class() westLabelNumber];
    uint64_t v46 = v32[2](v32, v45);
    id v47 = v30[69];
    v30[69] = (id)v46;

    v48 = [v30[69] layer];
    objc_msgSend(v48, "setAnchorPoint:", 0.0, 0.5);

    v69[0] = v30[67];
    v69[1] = v30[68];
    v69[2] = v30[70];
    v69[3] = v30[69];
    uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:4];
    id v50 = v30[63];
    v30[63] = (id)v49;

    uint64_t v51 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.25];
    id v52 = v30[65];
    v30[65] = (id)v51;

    [v30 _updateUI];
  }

  return v9;
}

id __66__NTKWorldClockGraphicCircularView_initWithDevice_smallTickCount___block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:a2 numberStyle:0];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v4 setFont:*(void *)(a1 + 32)];
  [v4 setText:v3];
  [v4 sizeToFit];
  [v4 setHidden:1];
  [*(id *)(a1 + 40) insertSubview:v4 belowSubview:*(void *)(a1 + 48)];

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKWorldClockGraphicCircularView;
  [(NTKWorldClockGraphicCircularView *)&v4 traitCollectionDidChange:a3];
  [(NTKWorldClockGraphicCircularView *)self setNeedsLayout];
}

- (void)pauseLiveFullColorImageView
{
  id v3 = [(NTKWorldClockGraphicCircularView *)self handsView];
  [v3 setFrozen:1];
  [(NTKWorldClockGraphicCircularView *)self _stopClockUpdates];
}

- (void)resumeLiveFullColorImageView
{
  id v3 = [(NTKWorldClockGraphicCircularView *)self handsView];
  [v3 setFrozen:0];
  [(NTKWorldClockGraphicCircularView *)self _startClockUpdates];
  [(NTKWorldClockGraphicCircularView *)self _updateUI];
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v20 = a3;
  id v5 = [v20 metadata];
  id v6 = [v5 objectForKey:@"NTKWorldClockGraphicCircularViewOverrideDateKey"];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = objc_msgSend(v20, "tritium_isTritiumInactiveFullColorImageProvider");
      id v8 = v6;
      double v9 = v8;
LABEL_7:
      CGSize v11 = v8;
      goto LABEL_9;
    }
  }

  uint64_t v7 = objc_msgSend(v20, "tritium_isTritiumInactiveFullColorImageProvider");
  if (v7)
  {
    double v10 = [MEMORY[0x1E4F19A20] complicationDate];
    if (v10)
    {
      id v8 = v10;
      double v9 = v8;
      uint64_t v7 = 1;
      goto LABEL_7;
    }
  }
  double v9 = +[NTKDate faceDate];
  CGSize v11 = 0;
LABEL_9:
  long long v12 = +[NTKLocationManager sharedLocationManager];
  long long v13 = [v12 currentLocation];
  double v14 = v13;
  if (v13)
  {
    [v13 coordinate];
    double v16 = v15;
    [v14 coordinate];
  }
  else
  {
    double v16 = -180.0;
  }
  uint64_t v17 = [off_1E62BDB30 transitInfoForDate:v9 location:v16];
  double v18 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  double v19 = [[NTKWorldClockGraphicCircularViewConfiguration alloc] initWithTimeZone:v18 labelText:0 transitInfo:v17 inTritium:v7 overrideDate:v11 isPrivacy:0];
  [(NTKWorldClockGraphicCircularView *)self applyConfiguration:v19 animated:NTKIsDaemonOrFaceSnapshotService() ^ 1];
}

- (void)setFilterProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_filterProvider, obj);
    id v5 = [(NTKWorldClockGraphicCircularView *)self handsView];
    [v5 setFilterProvider:obj];
  }
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  [(NTKWorldClockGraphicCircularView *)self setMonochromeFraction:a3];
  [(NTKWorldClockGraphicCircularView *)self _updatePlatterColor];
  [(NTKWorldClockGraphicCircularView *)self _updateCityAbbreviationColor];
  [(NTKWorldClockGraphicCircularView *)self _updateHourLabelColors];
  [(NTKWorldClockGraphicCircularView *)self _updateTickColor];

  [(NTKWorldClockGraphicCircularView *)self _updateHandsColor];
}

- (void)updateMonochromeColor
{
  [(NTKWorldClockGraphicCircularView *)self setMonochromeFraction:1.0];
  [(NTKWorldClockGraphicCircularView *)self _updatePlatterColor];
  [(NTKWorldClockGraphicCircularView *)self _updateCityAbbreviationColor];
  [(NTKWorldClockGraphicCircularView *)self _updateHourLabelColors];
  [(NTKWorldClockGraphicCircularView *)self _updateTickColor];

  [(NTKWorldClockGraphicCircularView *)self _updateHandsColor];
}

+ (id)_createHandsViewForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [(NTKWorldClockRichComplicationHandsBaseView *)[NTKWorldClockRichComplicationHandsView alloc] initForDevice:v3];

  return v4;
}

+ ($513C300AF4A6862D8B434F9A964F3546)_layoutConstantsForDevice:(SEL)a3
{
  _LayoutConstantsCircular(a4, retstr);
  return result;
}

+ (BOOL)_shouldUseDaytimeColoringForTransitInfo:(id)a3 atDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 rise];
  if (v7)
  {
  }
  else
  {
    id v8 = [v5 set];

    if (!v8)
    {
      BOOL v16 = [v5 constantSun] == 2;
LABEL_14:
      BOOL v20 = v16;
      goto LABEL_17;
    }
  }
  uint64_t v9 = [v5 rise];
  if (v9)
  {
    double v10 = (void *)v9;
    CGSize v11 = [v5 set];

    if (v11)
    {
      long long v12 = [v5 rise];
      unint64_t v13 = [v6 compare:v12];

      double v14 = [v5 set];
      uint64_t v15 = [v6 compare:v14];

      BOOL v16 = v13 < 2 && v15 == -1;
      goto LABEL_14;
    }
  }
  uint64_t v17 = [v5 rise];

  if (v17)
  {
    double v18 = [v5 rise];
    unint64_t v19 = [v6 compare:v18];

    BOOL v20 = v19 < 2;
    goto LABEL_17;
  }
  uint64_t v21 = [v5 set];

  if (v21)
  {
    BOOL v22 = [v5 set];
    uint64_t v23 = [v6 compare:v22];

    BOOL v16 = v23 == -1;
    goto LABEL_14;
  }
  v25 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    +[NTKWorldClockGraphicCircularView _shouldUseDaytimeColoringForTransitInfo:atDate:](v25);
  }

  BOOL v20 = 1;
LABEL_17:

  return v20;
}

- (void)_startClockUpdates
{
  id v3 = [(NTKWorldClockGraphicCircularView *)self clockTimerToken];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = [MEMORY[0x1E4F196B0] sharedInstance];
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    uint64_t v7 = __54__NTKWorldClockGraphicCircularView__startClockUpdates__block_invoke;
    id v8 = &unk_1E62C1288;
    objc_copyWeak(&v9, &location);
    id v3 = [v4 startUpdatesWithUpdateFrequency:0 withHandler:&v5 identificationLog:&__block_literal_global_80];

    -[NTKWorldClockGraphicCircularView setClockTimerToken:](self, "setClockTimerToken:", v3, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __54__NTKWorldClockGraphicCircularView__startClockUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateUI];
}

__CFString *__54__NTKWorldClockGraphicCircularView__startClockUpdates__block_invoke_77()
{
  return @"World Clock Rich Circular Complication";
}

- (void)_stopClockUpdates
{
  id v4 = [(NTKWorldClockGraphicCircularView *)self clockTimerToken];
  if (v4)
  {
    id v3 = [MEMORY[0x1E4F196B0] sharedInstance];
    [v3 stopUpdatesForToken:v4];

    [(NTKWorldClockGraphicCircularView *)self setClockTimerToken:0];
  }
}

- (void)_updateDayTimeColoring
{
  BOOL v3 = [(NTKWorldClockGraphicCircularView *)self hasPerformedColoringFirstPass];
  id v10 = [(NTKWorldClockGraphicCircularView *)self handsView];
  id v4 = [v10 overrideDate];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[NTKDate faceDate];
  }
  uint64_t v7 = v6;
  id v8 = [(NTKWorldClockGraphicCircularView *)self transitInfo];
  uint64_t v9 = [(id)objc_opt_class() _shouldUseDaytimeColoringForTransitInfo:v8 atDate:v7];
  if (!v3 || v9 != [(NTKWorldClockGraphicCircularView *)self useDayTimeColoring])
  {
    [(NTKWorldClockGraphicCircularView *)self setUseDayTimeColoring:v9];
    [(NTKWorldClockGraphicCircularView *)self _updatePlatterColor];
    [(NTKWorldClockGraphicCircularView *)self _updateCityAbbreviationColor];
    [(NTKWorldClockGraphicCircularView *)self _updateHourLabelColors];
    [(NTKWorldClockGraphicCircularView *)self _updateTickColor];
    [(NTKWorldClockGraphicCircularView *)self _updateHandsColor];
    [(NTKWorldClockGraphicCircularView *)self setColoringFirstPassPerformed:1];
  }
}

- (BOOL)_updateLabelAndDial
{
  int64_t v3 = [(NTKWorldClockRichComplicationHandsBaseView *)self->_handsView displayedHour];
  id v4 = [(NTKWorldClockGraphicCircularView *)self cityNameLabel];
  uint64_t v5 = [v4 text];
  if (![v5 length]) {
    goto LABEL_8;
  }
  char v6 = [(NTKWorldClockRichComplicationHandsBaseView *)self->_handsView isHidden];
  BOOL v7 = (unint64_t)(v3 - 3) < 6 || (unint64_t)(v3 - 15) < 6;
  if (v6) {
    BOOL v7 = 1;
  }
  if (self->_positionLabelNorthSide != v7)
  {
    self->_positionLabelNorthSide = v7;
    BOOL v8 = 1;
  }
  else
  {
LABEL_8:
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_updateUI
{
  [(NTKWorldClockGraphicCircularView *)self _updateDayTimeColoring];
  if ([(NTKWorldClockGraphicCircularView *)self _updateLabelAndDial])
  {
    [(NTKWorldClockGraphicCircularView *)self setNeedsLayout];
  }
}

- (void)_updateCityAbbreviationColor
{
  id v7 = [(NTKWorldClockGraphicCircularView *)self cityNameLabel];
  if ([(NTKWorldClockGraphicCircularView *)self useDayTimeColoring]) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  int64_t v3 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  id v4 = [(NTKWorldClockGraphicCircularView *)self filterProvider];
  uint64_t v5 = [v4 colorForView:v7 accented:0];
  [(NTKWorldClockGraphicCircularView *)self tintedFraction];
  char v6 = NTKInterpolateBetweenColors();
  [v7 setTextColor:v6];
}

- (void)_updateHandsColor
{
  int64_t v3 = [(NTKWorldClockGraphicCircularView *)self handsView];
  id v4 = [(NTKWorldClockGraphicCircularView *)self filterProvider];
  if ([(NTKWorldClockGraphicCircularView *)self useDayTimeColoring]) {
    [(NTKWorldClockGraphicCircularView *)self daytimeHandsColor];
  }
  else {
  uint64_t v5 = [(NTKWorldClockGraphicCircularView *)self nighttimeHandsColor];
  }
  char v6 = [v4 colorForView:v3 accented:1];
  [(NTKWorldClockGraphicCircularView *)self monochromeFraction];
  id v7 = NTKInterpolateBetweenColors();

  if ([(id)objc_opt_class() showsSecondHand])
  {
    BOOL v8 = [v4 colorForView:v3 accented:1];
    [(NTKWorldClockGraphicCircularView *)self tintedFraction];
    uint64_t v9 = NTKInterpolateBetweenColors();
    id v10 = [v3 secondHandView];
    [v10 setColor:v9];

    CGSize v11 = [v4 colorForView:v3 accented:0];
    long long v12 = [v3 hourHandView];
    [v12 setColor:v11];

    unint64_t v13 = [v3 minuteHandView];
    [v13 setColor:v11];
  }
  else
  {
    BOOL v8 = [v4 colorForView:v3 accented:0];
    [(NTKWorldClockGraphicCircularView *)self tintedFraction];
    CGSize v11 = NTKInterpolateBetweenColors();
    double v14 = [v3 hourHandView];
    [v14 setColor:v11];

    uint64_t v15 = [v3 minuteHandView];
    [v15 setColor:v11];

    [v3 setPegDotColor:v8];
  }

  BOOL v16 = [(NTKWorldClockGraphicCircularView *)self platter];
  uint64_t v17 = [v16 backgroundColor];

  BOOL v18 = [(NTKWorldClockGraphicCircularView *)self useDayTimeColoring];
  BOOL v20 = 1;
  if (v18)
  {
    if (v17)
    {
      double v23 = 0.0;
      [v17 getRed:0 green:0 blue:0 alpha:&v23];
      double v19 = v23;
      if (v23 >= 0.7)
      {
        CLKContrastRatioForColors();
        BOOL v20 = v19 > 1.7;
      }
    }
  }
  uint64_t v21 = objc_msgSend(v3, "hourHandView", v19);
  [v21 setShadowsHidden:v20];

  BOOL v22 = [v3 minuteHandView];
  [v22 setShadowsHidden:v20];
}

- (void)_updateHourLabelColors
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(NTKWorldClockGraphicCircularView *)self dialView];
  if ([(NTKWorldClockGraphicCircularView *)self useDayTimeColoring]) {
    [(NTKWorldClockGraphicCircularView *)self daytimeHandsLargeTickColor];
  }
  else {
  id v4 = [(NTKWorldClockGraphicCircularView *)self nighttimeHandsLargeTickColor];
  }
  uint64_t v5 = [(NTKWorldClockGraphicCircularView *)self filterProvider];
  char v6 = [v5 colorForView:v3 accented:0];
  [(NTKWorldClockGraphicCircularView *)self tintedFraction];
  id v7 = NTKInterpolateBetweenColors();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v8 = [(NTKWorldClockGraphicCircularView *)self hourLabels];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) setTextColor:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_updatePlatterColor
{
  if ([(NTKWorldClockGraphicCircularView *)self useDayTimeColoring])
  {
    id v6 = [(NTKWorldClockGraphicCircularView *)self daytimeBackgroundColor];
    [(NTKWorldClockGraphicCircularView *)self tintedPlatterColor];
  }
  else
  {
    id v6 = [(NTKWorldClockGraphicCircularView *)self nighttimeBackgroundColor];
    [MEMORY[0x1E4FB1618] clearColor];
  int64_t v3 = };
  [(NTKWorldClockGraphicCircularView *)self tintedFraction];
  id v4 = NTKInterpolateBetweenColors();
  uint64_t v5 = [(NTKWorldClockGraphicCircularView *)self platter];
  [v5 setBackgroundColor:v4];
}

- (void)_updateTickColor
{
  id v17 = [(NTKWorldClockGraphicCircularView *)self dialView];
  BOOL v3 = [(NTKWorldClockGraphicCircularView *)self useDayTimeColoring];
  id v4 = [(NTKWorldClockGraphicCircularView *)self filterProvider];
  [(NTKWorldClockGraphicCircularView *)self tintedFraction];
  uint64_t v5 = [v4 colorForView:v17 accented:0];
  if (v3) {
    [(NTKWorldClockGraphicCircularView *)self daytimeHandsLargeTickColor];
  }
  else {
  id v6 = [(NTKWorldClockGraphicCircularView *)self nighttimeHandsLargeTickColor];
  }
  id v7 = NTKInterpolateBetweenColors();

  if (v3) {
    [(NTKWorldClockGraphicCircularView *)self daytimeHandsSmallTickColor];
  }
  else {
  BOOL v8 = [(NTKWorldClockGraphicCircularView *)self nighttimeHandsSmallTickColor];
  }
  uint64_t v9 = [v5 colorWithAlphaComponent:0.75];
  uint64_t v10 = NTKInterpolateBetweenColors();

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  id v11 = v7;
  uint64_t v12 = [v11 CGColor];
  long long v13 = [v17 largeTickLayer];
  [v13 setBackgroundColor:v12];

  id v14 = v10;
  uint64_t v15 = [v14 CGColor];
  long long v16 = [v17 smallTickLayer];
  [v16 setBackgroundColor:v15];

  [MEMORY[0x1E4F39CF8] commit];
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (BOOL)useDayTimeColoring
{
  return self->_useDayTimeColoring;
}

- (void)setUseDayTimeColoring:(BOOL)a3
{
  self->_useDayTimeColoring = a3;
}

- (NSArray)hourLabels
{
  return self->_hourLabels;
}

- (double)tintedFraction
{
  return self->_tintedFraction;
}

- (UIColor)tintedPlatterColor
{
  return self->_tintedPlatterColor;
}

- (UILabel)cityNameLabel
{
  return self->_cityNameLabel;
}

- (UILabel)northHourLabel
{
  return self->_northHourLabel;
}

- (UILabel)eastHourLabel
{
  return self->_eastHourLabel;
}

- (UILabel)westHourLabel
{
  return self->_westHourLabel;
}

- (UILabel)southHourLabel
{
  return self->_southHourLabel;
}

- (NTKWorldClockRichComplicationHandsBaseView)handsView
{
  return self->_handsView;
}

- (NTKRichComplicationDialView)dialView
{
  return self->_dialView;
}

- (UIView)platter
{
  return self->_platter;
}

- (CLKDevice)device
{
  return self->_device;
}

- ($513C300AF4A6862D8B434F9A964F3546)layoutConstants
{
  CGSize v3 = *(CGSize *)&self[8].var4;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[8].var2;
  retstr->var6 = v3;
  retstr->var7 = self[8].var6;
  long long v4 = *(_OWORD *)&self[8].var0;
  *(CGSize *)&retstr->var0 = self[7].var7;
  *(_OWORD *)&retstr->var2 = v4;
  return self;
}

- (CLKClockTimerToken)clockTimerToken
{
  return self->_clockTimerToken;
}

- (void)setClockTimerToken:(id)a3
{
}

- (BOOL)positionLabelNorthSide
{
  return self->_positionLabelNorthSide;
}

- (void)setPositionLabelNorthSide:(BOOL)a3
{
  self->_positionLabelNorthSide = a3;
}

- (CLKUIAlmanacTransitInfo)transitInfo
{
  return self->_transitInfo;
}

- (void)setTransitInfo:(id)a3
{
}

- (double)monochromeFraction
{
  return self->_monochromeFraction;
}

- (void)setMonochromeFraction:(double)a3
{
  self->_monochromeFraction = a3;
}

- (BOOL)hasPerformedColoringFirstPass
{
  return self->_coloringFirstPassPerformed;
}

- (void)setColoringFirstPassPerformed:(BOOL)a3
{
  self->_coloringFirstPassPerformed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitInfo, 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_platter, 0);
  objc_storeStrong((id *)&self->_dialView, 0);
  objc_storeStrong((id *)&self->_handsView, 0);
  objc_storeStrong((id *)&self->_southHourLabel, 0);
  objc_storeStrong((id *)&self->_westHourLabel, 0);
  objc_storeStrong((id *)&self->_eastHourLabel, 0);
  objc_storeStrong((id *)&self->_northHourLabel, 0);
  objc_storeStrong((id *)&self->_cityNameLabel, 0);
  objc_storeStrong((id *)&self->_tintedPlatterColor, 0);
  objc_storeStrong((id *)&self->_hourLabels, 0);
  objc_storeStrong((id *)&self->_nighttimeHandsSmallTickColor, 0);
  objc_storeStrong((id *)&self->_nighttimeHandsLargeTickColor, 0);
  objc_storeStrong((id *)&self->_daytimeHandsSmallTickColor, 0);
  objc_storeStrong((id *)&self->_daytimeHandsLargeTickColor, 0);
  objc_storeStrong((id *)&self->_nighttimeSecondHandColor, 0);
  objc_storeStrong((id *)&self->_nighttimeHandsColor, 0);
  objc_storeStrong((id *)&self->_nighttimeBackgroundColor, 0);
  objc_storeStrong((id *)&self->_daytimeSecondHandColor, 0);
  objc_storeStrong((id *)&self->_daytimeHandsColor, 0);
  objc_storeStrong((id *)&self->_daytimeBackgroundColor, 0);

  objc_destroyWeak((id *)&self->_filterProvider);
}

+ (void)_shouldUseDaytimeColoringForTransitInfo:(os_log_t)log atDate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Unhandled sunrise/sunset case (logic error)", v1, 2u);
}

@end