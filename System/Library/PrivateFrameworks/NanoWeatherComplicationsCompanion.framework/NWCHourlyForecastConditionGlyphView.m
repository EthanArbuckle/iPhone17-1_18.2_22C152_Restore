@interface NWCHourlyForecastConditionGlyphView
- (id)topLabelTextFromConditions:(id)a3;
- (void)applyAccentFilters:(id)a3;
- (void)applyEntryModel:(id)a3 date:(id)a4 timeZone:(id)a5;
- (void)applyNonAccentFilters:(id)a3;
- (void)applySimpleEntryModel:(id)a3;
- (void)applyStyle;
@end

@implementation NWCHourlyForecastConditionGlyphView

- (void)applySimpleEntryModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 topString];
  if (!v5)
  {
    v5 = NWCLocalizedString(@"NO_DATA_ROUNDED");
  }
  v6 = [(NWCHourlyForecastView *)self topLabel];
  [v6 setText:v5];

  v7 = [v4 middleString];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    v9 = [MEMORY[0x263F1C6C8] configurationWithScale:1];
    v10 = (void *)MEMORY[0x263F1C6B0];
    v11 = [v4 middleString];
    v12 = [v10 systemImageNamed:v11 withConfiguration:v9];

    v13 = [v12 imageWithRenderingMode:1];

    v14 = [(NWCHourlyForecastView *)self middleImageView];
    [v14 setImage:v13];

    v15 = [(NWCHourlyForecastView *)self middleLabel];
    [v15 setText:0];
  }
  else
  {
    v16 = objc_msgSend(MEMORY[0x263F85F98], "nwm_localizedNoDataRounded");
    v17 = [(NWCHourlyForecastView *)self middleLabel];
    [v17 setText:v16];

    v18 = +[NWCColor conditionsNoDataColor];
    v19 = [(NWCHourlyForecastView *)self middleLabel];
    [v19 setTextColor:v18];

    v9 = [(NWCHourlyForecastView *)self middleImageView];
    [v9 setImage:0];
  }

  v20.receiver = self;
  v20.super_class = (Class)NWCHourlyForecastConditionGlyphView;
  [(NWCHourlyForecastView *)&v20 applySimpleEntryModel:v4];
}

- (void)applyEntryModel:(id)a3 date:(id)a4 timeZone:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 conditions];
  v12 = [v8 conditions];
  v13 = [(NWCHourlyForecastConditionGlyphView *)self topLabelTextFromConditions:v12];
  v14 = [(NWCHourlyForecastView *)self topLabel];
  [v14 setText:v13];

  if (v11)
  {
    v15 = objc_msgSend(v11, "nwc_conditionImageForTimeOfDay:withScale:", objc_msgSend(v8, "timeOfDay"), 1);
    v16 = [(NWCHourlyForecastView *)self middleImageView];
    [v16 setImage:v15];
  }
  else
  {
    v15 = [(NWCHourlyForecastView *)self middleImageView];
    [v15 setImage:0];
  }

  v17 = [(NWCHourlyForecastView *)self middleImageView];
  v18 = [v17 image];

  if (v18)
  {
    v19 = [(NWCHourlyForecastView *)self middleLabel];
    [v19 setText:0];
  }
  else
  {
    objc_super v20 = objc_msgSend(MEMORY[0x263F85F98], "nwm_localizedNoDataRounded");
    v21 = [(NWCHourlyForecastView *)self middleLabel];
    [v21 setText:v20];

    v19 = +[NWCColor conditionsNoDataColor];
    v22 = [(NWCHourlyForecastView *)self middleLabel];
    [v22 setTextColor:v19];
  }
  v23.receiver = self;
  v23.super_class = (Class)NWCHourlyForecastConditionGlyphView;
  [(NWCHourlyForecastView *)&v23 applyEntryModel:v8 date:v10 timeZone:v9];
}

- (void)applyStyle
{
  v19.receiver = self;
  v19.super_class = (Class)NWCHourlyForecastConditionGlyphView;
  [(NWCHourlyForecastView *)&v19 applyStyle];
  id v3 = [MEMORY[0x263EFD180] currentDevice];
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_1);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_1);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_1);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_LayoutConstants___cachedDevice_1, v3);
    _LayoutConstants___previousCLKDeviceVersion_1 = [v3 version];

    ___LayoutConstants_block_invoke_1(v10, v3);
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _LayoutConstants___previousCLKDeviceVersion_1;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_1);
  double v11 = *(double *)&_LayoutConstants_constants_0_1;
  double v12 = *(double *)&_LayoutConstants_constants_1_1;

  double v13 = *MEMORY[0x263F1D340];
  v14 = (void *)MEMORY[0x263EFCF58];
  v15 = [MEMORY[0x263EFD198] systemFontOfSize:*MEMORY[0x263EFCF58] weight:v11 design:*MEMORY[0x263F1D340]];
  v16 = [(NWCHourlyForecastView *)self topLabel];
  [v16 setFont:v15];

  v17 = [MEMORY[0x263EFD198] systemFontOfSize:*v14 weight:v12 design:v13];
  v18 = [(NWCHourlyForecastView *)self middleLabel];
  [v18 setFont:v17];
}

- (void)applyAccentFilters:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NWCHourlyForecastConditionGlyphView;
  id v4 = a3;
  [(NWCHourlyForecastView *)&v7 applyAccentFilters:v4];
  v5 = [(NWCHourlyForecastView *)self middleImageView];
  id v6 = [v5 layer];
  [v6 setFilters:v4];
}

- (void)applyNonAccentFilters:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NWCHourlyForecastConditionGlyphView;
  id v4 = a3;
  [(NWCHourlyForecastView *)&v9 applyNonAccentFilters:v4];
  v5 = [(NWCHourlyForecastView *)self topLabel];
  id v6 = [v5 layer];
  [v6 setFilters:v4];

  objc_super v7 = [(NWCHourlyForecastView *)self timeLabel];
  uint64_t v8 = [v7 layer];
  [v8 setFilters:v4];
}

- (id)topLabelTextFromConditions:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Subclasses should override %@.", v5 format];

  return 0;
}

@end