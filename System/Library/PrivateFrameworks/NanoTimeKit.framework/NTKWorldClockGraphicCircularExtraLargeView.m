@interface NTKWorldClockGraphicCircularExtraLargeView
+ ($513C300AF4A6862D8B434F9A964F3546)_layoutConstantsForDevice:(SEL)a3;
+ (id)_createHandsViewForDevice:(id)a3;
@end

@implementation NTKWorldClockGraphicCircularExtraLargeView

+ (id)_createHandsViewForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [(NTKWorldClockRichComplicationHandsBaseView *)[NTKWorldClockRichComplicationHandsExtraLargeView alloc] initForDevice:v3];

  return v4;
}

+ ($513C300AF4A6862D8B434F9A964F3546)_layoutConstantsForDevice:(SEL)a3
{
  id obj = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstantsExtraLarge___lock_2);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstantsExtraLarge___cachedDevice_2);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    id v7 = objc_loadWeakRetained(&_LayoutConstantsExtraLarge___cachedDevice_2);
    if (v7 == obj)
    {
      uint64_t v8 = [obj version];
      uint64_t v9 = _LayoutConstantsExtraLarge___previousCLKDeviceVersion_2;

      if (v8 == v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v10 = objc_storeWeak(&_LayoutConstantsExtraLarge___cachedDevice_2, obj);
  _LayoutConstantsExtraLarge___previousCLKDeviceVersion_2 = [obj version];

  ___LayoutConstantsExtraLarge_block_invoke_3(v11, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstantsExtraLarge___lock_2);
  CGSize v12 = (CGSize)xmmword_1E9FA86B0;
  *(_OWORD *)&retstr->var4 = xmmword_1E9FA86A0;
  retstr->var6 = v12;
  retstr->var7 = (CGSize)xmmword_1E9FA86C0;
  long long v13 = *(_OWORD *)algn_1E9FA8690;
  *(_OWORD *)&retstr->var0 = _LayoutConstantsExtraLarge___constantsGraphicExtraLarge;
  *(_OWORD *)&retstr->var2 = v13;

  return result;
}

@end