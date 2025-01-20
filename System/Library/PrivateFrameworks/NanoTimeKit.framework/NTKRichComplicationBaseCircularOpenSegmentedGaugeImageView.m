@interface NTKRichComplicationBaseCircularOpenSegmentedGaugeImageView
+ (int64_t)progressFillStyle;
- ($8502DCEA08BBBE1AB2005217B3838BBD)_layoutConstraintsWithDevice:(SEL)a3 family:(id)a4;
- (double)_smallLabelFontWeight;
@end

@implementation NTKRichComplicationBaseCircularOpenSegmentedGaugeImageView

+ (int64_t)progressFillStyle
{
  return 7;
}

- ($8502DCEA08BBBE1AB2005217B3838BBD)_layoutConstraintsWithDevice:(SEL)a3 family:(id)a4
{
  id v7 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_61);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_61);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    id v10 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_61);
    if (v10 == v7)
    {
      uint64_t v11 = [v7 version];
      uint64_t v12 = _LayoutConstants___previousCLKDeviceVersion_61;

      if (v11 == v12) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v13 = objc_storeWeak(&_LayoutConstants___cachedDevice_61, v7);
  _LayoutConstants___previousCLKDeviceVersion_61 = [v7 version];

  ___LayoutConstants_block_invoke_58(v14, v7);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_61);
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  if (a5 == 12)
  {
    v16 = &_LayoutConstants__constantsGraphicExtraLarge_0;
  }
  else
  {
    if (a5 != 10)
    {
      v15 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView _layoutConstraintsWithDevice:family:](a5, v15);
      }
    }
    v16 = &_LayoutConstants__constants_2;
  }
  long long v17 = v16[1];
  *(_OWORD *)&retstr->var0 = *v16;
  *(_OWORD *)&retstr->var2 = v17;
  long long v18 = v16[3];
  *(_OWORD *)&retstr->var4 = v16[2];
  *(_OWORD *)&retstr->var6 = v18;

  return result;
}

- (double)_smallLabelFontWeight
{
  return *MEMORY[0x1E4FB09D0];
}

@end