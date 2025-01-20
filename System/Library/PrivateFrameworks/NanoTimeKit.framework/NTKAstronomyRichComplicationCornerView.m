@interface NTKAstronomyRichComplicationCornerView
- (id)_outerView;
- (void)_applyPausedUpdate;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)_updateInnerLabel;
- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)setEditing:(BOOL)a3;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKAstronomyRichComplicationCornerView

- (id)_outerView
{
  astronomyContentView = self->_astronomyContentView;
  if (!astronomyContentView)
  {
    [(CDRichComplicationCornerTextCustomView *)self _outerViewDiameter];
    double v5 = v4;
    v6 = [NTKAstronomyRichComplicationContentView alloc];
    v7 = [(CDRichComplicationView *)self device];
    v8 = [(NTKAstronomyRichComplicationContentView *)v6 initForDevice:v7 family:10 diameter:v5];
    v9 = self->_astronomyContentView;
    self->_astronomyContentView = v8;

    astronomyContentView = self->_astronomyContentView;
  }
  return astronomyContentView;
}

- (void)_applyPausedUpdate
{
  astronomyContentView = self->_astronomyContentView;
  BOOL v3 = [(CDRichComplicationView *)self paused];
  [(NTKAstronomyRichComplicationContentView *)astronomyContentView applyPausedUpdate:v3];
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  astronomyContentView = self->_astronomyContentView;
  v7 = [a3 metadata];
  [(NTKAstronomyRichComplicationContentView *)astronomyContentView handleTemplateMetadata:v7 reason:a4];

  [(NTKAstronomyRichComplicationCornerView *)self _updateInnerLabel];
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)NTKAstronomyRichComplicationCornerView;
  id v6 = a3;
  [(CDRichComplicationTemplateView *)&v7 setTimeTravelDate:v6 animated:v4];
  -[NTKAstronomyRichComplicationContentView setTimeTravelDate:animated:](self->_astronomyContentView, "setTimeTravelDate:animated:", v6, v4, v7.receiver, v7.super_class);

  [(NTKAstronomyRichComplicationCornerView *)self _updateInnerLabel];
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKAstronomyRichComplicationCornerView;
  -[CDRichComplicationView setEditing:](&v5, sel_setEditing_);
  [(NTKAstronomyRichComplicationContentView *)self->_astronomyContentView setEditing:v3];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5 = [(CDRichComplicationView *)self filterProvider];
  id v11 = [v5 filtersForView:self style:2 fraction:a3];

  id v6 = [(CDRichComplicationCornerBaseTextView *)self innerLabel];
  objc_super v7 = [v6 layer];
  [v7 setFilters:v11];

  v8 = [(CDRichComplicationView *)self filterProvider];
  v9 = [v8 filtersForView:self style:4 fraction:a3];

  v10 = [(NTKAstronomyRichComplicationContentView *)self->_astronomyContentView layer];
  [v10 setFilters:v9];
}

- (void)updateMonochromeColor
{
  BOOL v3 = [(CDRichComplicationView *)self filterProvider];
  id v9 = [v3 filtersForView:self style:2];

  BOOL v4 = [(CDRichComplicationCornerBaseTextView *)self innerLabel];
  objc_super v5 = [v4 layer];
  [v5 setFilters:v9];

  id v6 = [(CDRichComplicationView *)self filterProvider];
  objc_super v7 = [v6 filtersForView:self style:4];

  v8 = [(NTKAstronomyRichComplicationContentView *)self->_astronomyContentView layer];
  [v8 setFilters:v7];
}

- (void)_updateInnerLabel
{
  v2 = self;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CDRichComplicationTemplateView *)self template];
  BOOL v4 = [v3 metadata];

  objc_super v5 = [v4 objectForKeyedSubscript:@"current date"];
  id v6 = [v4 objectForKeyedSubscript:@"current location"];
  objc_super v7 = [v4 objectForKeyedSubscript:@"any location"];
  v8 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(CDRichComplicationView *)v2 timeTravelDate];
    *(_DWORD *)buf = 138478595;
    v31 = v6;
    __int16 v32 = 2113;
    v33 = v7;
    __int16 v34 = 2112;
    v35 = v5;
    __int16 v36 = 2112;
    v37 = v9;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "NTKAstronomyRichComplicationCornerView create moon phase model with currentLocation:%{private}@ anyLocation:%{private}@ entryDate:%@ timeTravelDate:%@", buf, 0x2Au);
  }
  v10 = [(CDRichComplicationView *)v2 timeTravelDate];
  if (v10)
  {
    id v11 = [(CDRichComplicationView *)v2 timeTravelDate];
  }
  else
  {
    id v11 = v5;
  }
  v12 = v11;

  id v13 = objc_alloc(MEMORY[0x1E4F7A060]);
  if (v6) {
    v14 = v6;
  }
  else {
    v14 = v7;
  }
  v15 = (void *)[v13 initWithDate:v12 location:v14];
  v16 = [v15 eventDate];
  v17 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v16;
    _os_log_impl(&dword_1BC5A9000, v17, OS_LOG_TYPE_DEFAULT, "NTKAstronomyRichComplicationCornerView created NUNIMoonPhaseModel with date:%@", buf, 0xCu);
  }

  if (v16)
  {
    [MEMORY[0x1E4F19AE0] textProviderWithDate:v16];
    v29 = v15;
    v18 = v2;
    v19 = v4;
    v20 = v6;
    v21 = v12;
    v22 = v7;
    v24 = v23 = v5;
    v25 = [MEMORY[0x1E4F19A88] textProviderWithDate:v16 style:3 units:96];
    v26 = [MEMORY[0x1E4F19AC0] textProviderWithFormat:@"%@, %@", v24, v25];

    objc_super v5 = v23;
    objc_super v7 = v22;
    v12 = v21;
    id v6 = v20;
    BOOL v4 = v19;
    v2 = v18;
    v15 = v29;
  }
  else
  {
    v26 = [MEMORY[0x1E4F19AC0] textProviderWithFormat:&stru_1F1635E90];
  }
  v27 = NTKAstronomyComplicationForegroundColor(1);
  [v26 setTintColor:v27];

  v28 = [(CDRichComplicationCornerBaseTextView *)v2 innerLabel];
  [v28 setTextProvider:v26];
}

- (void).cxx_destruct
{
}

@end