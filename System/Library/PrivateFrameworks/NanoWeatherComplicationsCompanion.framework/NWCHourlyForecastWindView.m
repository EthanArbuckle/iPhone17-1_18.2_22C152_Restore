@interface NWCHourlyForecastWindView
- (void)applyAccentFilters:(id)a3;
- (void)applyEntryModel:(id)a3 date:(id)a4 timeZone:(id)a5;
- (void)applyNonAccentFilters:(id)a3;
- (void)applySimpleEntryModel:(id)a3;
- (void)applyStyle;
@end

@implementation NWCHourlyForecastWindView

- (void)applyEntryModel:(id)a3 date:(id)a4 timeZone:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = +[NWCColor tintColor];
  v12 = [v8 conditions];
  uint64_t v13 = objc_msgSend(v12, "nwm_localizedWindDirectionAbbreviationCompact");
  if (v13)
  {
    v14 = (void *)v13;
  }
  else
  {
    uint64_t v15 = +[NWCColor systemGrayTextColor];

    v14 = NWCLocalizedString(@"NO_DATA_ROUNDED");
    v11 = (void *)v15;
  }
  v16 = [(NWCHourlyForecastView *)self topLabel];
  [v16 setText:v14];

  v17 = [(NWCHourlyForecastView *)self topLabel];
  [v17 setTextColor:v11];

  v18 = objc_msgSend(v12, "nwm_localizedWindspeedWithoutUnit");
  v19 = v18;
  if (!v18)
  {
    v19 = NWCLocalizedString(@"NO_DATA_ROUNDED");
  }
  v20 = [(NWCHourlyForecastView *)self middleLabel];
  [v20 setText:v19];

  if (!v18) {
  v21 = [MEMORY[0x263F1C550] whiteColor];
  }
  v22 = [(NWCHourlyForecastView *)self middleLabel];
  [v22 setTextColor:v21];

  v23.receiver = self;
  v23.super_class = (Class)NWCHourlyForecastWindView;
  [(NWCHourlyForecastView *)&v23 applyEntryModel:v8 date:v10 timeZone:v9];
}

- (void)applySimpleEntryModel:(id)a3
{
  id v4 = a3;
  v5 = +[NWCColor tintColor];
  uint64_t v6 = [v4 topString];
  if (v6)
  {
    v7 = (void *)v6;
  }
  else
  {
    uint64_t v8 = +[NWCColor systemGrayTextColor];

    v7 = NWCLocalizedString(@"NO_DATA_ROUNDED");
    v5 = (void *)v8;
  }
  id v9 = [(NWCHourlyForecastView *)self topLabel];
  [v9 setText:v7];

  id v10 = [(NWCHourlyForecastView *)self topLabel];
  [v10 setTextColor:v5];

  v11 = [v4 middleString];
  if (!v11)
  {
    v11 = NWCLocalizedString(@"NO_DATA_ROUNDED");
  }
  v12 = [(NWCHourlyForecastView *)self middleLabel];
  [v12 setText:v11];

  uint64_t v13 = [MEMORY[0x263F1C550] whiteColor];
  v14 = [(NWCHourlyForecastView *)self middleLabel];
  [v14 setTextColor:v13];

  v15.receiver = self;
  v15.super_class = (Class)NWCHourlyForecastWindView;
  [(NWCHourlyForecastView *)&v15 applySimpleEntryModel:v4];
}

- (void)applyStyle
{
  v19.receiver = self;
  v19.super_class = (Class)NWCHourlyForecastWindView;
  [(NWCHourlyForecastView *)&v19 applyStyle];
  id v3 = [MEMORY[0x263EFD180] currentDevice];
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_0);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_0);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_LayoutConstants___cachedDevice_0, v3);
    _LayoutConstants___previousCLKDeviceVersion_0 = [v3 version];

    ___LayoutConstants_block_invoke_0(v10, v3);
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _LayoutConstants___previousCLKDeviceVersion_0;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_0);
  double v11 = *(double *)&_LayoutConstants_constants_0_0;
  double v12 = *(double *)&_LayoutConstants_constants_1_0;

  double v13 = *MEMORY[0x263F1D330];
  v14 = (void *)MEMORY[0x263EFCF58];
  objc_super v15 = [MEMORY[0x263EFD198] systemFontOfSize:*MEMORY[0x263EFCF58] weight:v11 design:*MEMORY[0x263F1D330]];
  v16 = [(NWCHourlyForecastView *)self topLabel];
  [v16 setFont:v15];

  v17 = [MEMORY[0x263EFD198] systemFontOfSize:*v14 weight:v12 design:v13];
  v18 = [(NWCHourlyForecastView *)self middleLabel];
  [v18 setFont:v17];
}

- (void)applyAccentFilters:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NWCHourlyForecastWindView;
  id v4 = a3;
  [(NWCHourlyForecastView *)&v7 applyAccentFilters:v4];
  v5 = [(NWCHourlyForecastView *)self topLabel];
  id v6 = [v5 layer];
  [v6 setFilters:v4];
}

- (void)applyNonAccentFilters:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NWCHourlyForecastWindView;
  id v4 = a3;
  [(NWCHourlyForecastView *)&v9 applyNonAccentFilters:v4];
  v5 = [(NWCHourlyForecastView *)self middleImageView];
  id v6 = [v5 layer];
  [v6 setFilters:v4];

  objc_super v7 = [(NWCHourlyForecastView *)self timeLabel];
  uint64_t v8 = [v7 layer];
  [v8 setFilters:v4];
}

@end