@interface NTKStopwatchRichComplicationBezelView
- (NTKStopwatchRichComplicationBezelView)init;
- (id)_createLabelViewWithFont:(id)a3;
- (void)_editingDidEnd;
- (void)_updateTextProvider;
@end

@implementation NTKStopwatchRichComplicationBezelView

- (NTKStopwatchRichComplicationBezelView)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKStopwatchRichComplicationBezelView;
  v2 = [(NTKRichComplicationBezelBaseTextView *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB1618] clearColor];
    [(NTKStopwatchRichComplicationBezelView *)v2 setBackgroundColor:v3];
  }
  return v2;
}

- (id)_createLabelViewWithFont:(id)a3
{
  id v4 = a3;
  objc_super v5 = (CLKUIColoringLabel *)objc_alloc_init((Class)off_1E62BDB58);
  [(CLKUIColoringLabel *)v5 setInTimeTravel:0];
  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __66__NTKStopwatchRichComplicationBezelView__createLabelViewWithFont___block_invoke;
  v22[3] = &unk_1E62C0040;
  objc_copyWeak(&v23, &location);
  [(CLKUIColoringLabel *)v5 setNowProvider:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66__NTKStopwatchRichComplicationBezelView__createLabelViewWithFont___block_invoke_2;
  v20[3] = &unk_1E62C0068;
  objc_copyWeak(&v21, &location);
  [(CLKUIColoringLabel *)v5 setNeedsResizeHandler:v20];
  [(CLKUIColoringLabel *)v5 setUppercase:1];
  [(CLKUIColoringLabel *)v5 setFont:v4];
  id v6 = [(CDRichComplicationView *)self device];
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_53);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_53);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    id v9 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_53);
    if (v9 == v6)
    {
      uint64_t v10 = [v6 version];
      uint64_t v11 = _LayoutConstants___previousCLKDeviceVersion_53;

      if (v10 == v11) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v12 = objc_storeWeak(&_LayoutConstants___cachedDevice_53, v6);
  _LayoutConstants___previousCLKDeviceVersion_53 = [v6 version];

  ___LayoutConstants_block_invoke_51(v13, (uint64_t)v6);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_53);
  double v14 = *(double *)&_LayoutConstants___constants_0_10;

  [(CLKUIColoringLabel *)v5 setMaxWidth:v14];
  v15 = [MEMORY[0x1E4FB1618] blackColor];
  [(CLKUIColoringLabel *)v5 setTextColor:v15];

  textLabel = self->_textLabel;
  self->_textLabel = v5;
  v17 = v5;

  v18 = self->_textLabel;
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v18;
}

id __66__NTKStopwatchRichComplicationBezelView__createLabelViewWithFont___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = (id)MEMORY[0x1E4F19A20];
  }
  v3 = [WeakRetained complicationDate];

  return v3;
}

void __66__NTKStopwatchRichComplicationBezelView__createLabelViewWithFont___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

- (void)_editingDidEnd
{
}

- (void)_updateTextProvider
{
  v3 = [(CDRichComplicationTemplateView *)self complicationTemplate];
  id v6 = [v3 metadata];

  id v4 = [v6 objectForKeyedSubscript:@"NTKStopwatchBezelComplicationMetadataTimeTextProviderKey"];
  objc_super v5 = [(CLKUIColoringLabel *)self->_textLabel textProvider];
  objc_msgSend(v4, "setPaused:", objc_msgSend(v5, "paused"));

  [(CLKUIColoringLabel *)self->_textLabel setTextProvider:v4];
}

- (void).cxx_destruct
{
}

@end