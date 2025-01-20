@interface NTKComplicationModuleView
+ (id)_extraLargeAlarmImageProvider;
+ (id)_extraLargeStopwatchImageProviderForDevice:(id)a3;
+ (id)_imageProviderForImageSymbolName:(id)a3 imageAssetNamePrefix:(id)a4;
+ (id)_modularSmallAlarmImageProvider;
+ (id)_modularSmallStopwatchImageProviderForDevice:(id)a3;
+ (id)largeModuleViewForComplicationType:(unint64_t)a3;
+ (id)smallModuleViewForComplicationType:(unint64_t)a3;
+ (int64_t)layoutOverride;
- (BOOL)isXL;
- (CDComplicationDisplayObserver)displayObserver;
- (id)_attributeEnDashesWithinString:(id)a3 typographicTracking:(double)a4 baseFont:(id)a5;
- (id)_attributedStringWithText:(id)a3 typographicTracking:(double)a4 baseFont:(id)a5;
- (id)_newImageViewSubview;
- (id)_newLabelSubview;
- (id)_newLabelSubviewWithFont:(id)a3;
- (unint64_t)textLayoutStyle;
- (void)_setTypographicTracking:(double)a3 andFont:(id)a4 onAttributedString:(id *)a5 inRange:(_NSRange)a6;
- (void)setDisplayObserver:(id)a3;
- (void)setIsXL:(BOOL)a3;
- (void)setTextLayoutStyle:(unint64_t)a3;
@end

@implementation NTKComplicationModuleView

+ (int64_t)layoutOverride
{
  return 5;
}

+ (id)smallModuleViewForComplicationType:(unint64_t)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    v3 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
  }
  id v4 = objc_alloc_init(v3);

  return v4;
}

+ (id)largeModuleViewForComplicationType:(unint64_t)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    v3 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
  }
  id v4 = objc_alloc_init(v3);

  return v4;
}

- (void)setIsXL:(BOOL)a3
{
  BOOL isXL = self->_isXL;
  self->_BOOL isXL = a3;
  if (isXL != a3)
  {
    if (a3)
    {
      v5 = [(NTKModuleView *)self device];
      +[NTKModuleView cornerRadiusForComplicationFamily:7 forDevice:v5];
      -[NTKModuleView setHighlightCornerRadius:](self, "setHighlightCornerRadius:");
    }
    [(NTKComplicationModuleView *)self setNeedsLayout];
  }
}

- (BOOL)isXL
{
  return self->_isXL;
}

- (id)_newLabelSubview
{
  id v3 = objc_alloc_init((Class)off_1E62BDB58);
  id v4 = [(NTKModuleView *)self contentView];
  [v4 addSubview:v3];

  return v3;
}

- (id)_newLabelSubviewWithFont:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKComplicationModuleView *)self _newLabelSubview];
  [v5 setFont:v4];

  return v5;
}

- (id)_newImageViewSubview
{
  id v3 = objc_alloc_init((Class)off_1E62BDB50);
  id v4 = [(NTKModuleView *)self contentView];
  [v4 addSubview:v3];

  return v3;
}

- (id)_attributeEnDashesWithinString:(id)a3 typographicTracking:(double)a4 baseFont:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v8];
  v11 = [v9 CLKFontWithAlternativePunctuation];
  if ([v8 length])
  {
    unint64_t v12 = 0;
    do
    {
      if ([v8 characterAtIndex:v12] == 8211)
      {
        id v15 = v10;
        -[NTKComplicationModuleView _setTypographicTracking:andFont:onAttributedString:inRange:](self, "_setTypographicTracking:andFont:onAttributedString:inRange:", v11, &v15, v12, 1, a4);
        id v13 = v15;

        v10 = v13;
      }
      ++v12;
    }
    while (v12 < [v8 length]);
  }

  return v10;
}

- (id)_attributedStringWithText:(id)a3 typographicTracking:(double)a4 baseFont:(id)a5
{
  id v8 = a3;
  id v9 = [a5 CLKFontWithAlternativePunctuation];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v8];
  uint64_t v11 = [v8 length];

  id v14 = v10;
  -[NTKComplicationModuleView _setTypographicTracking:andFont:onAttributedString:inRange:](self, "_setTypographicTracking:andFont:onAttributedString:inRange:", v9, &v14, 0, v11, a4);
  id v12 = v14;

  return v12;
}

- (void)_setTypographicTracking:(double)a3 andFont:(id)a4 onAttributedString:(id *)a5 inRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v12 = a4;
  CLKKernValueForDesignSpecTrackingValue();
  id v9 = *a5;
  uint64_t v10 = *MEMORY[0x1E4FB0710];
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithDouble:");
  objc_msgSend(v9, "addAttribute:value:range:", v10, v11, location, length);

  objc_msgSend(*a5, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v12, location, length);
}

+ (id)_imageProviderForImageSymbolName:(id)a3 imageAssetNamePrefix:(id)a4
{
  id v4 = a3;
  CLKUIImageNamed();
}

+ (id)_modularSmallAlarmImageProvider
{
  os_unfair_lock_lock((os_unfair_lock_t)&_modularSmallAlarmImageProvider___lock);
  id WeakRetained = objc_loadWeakRetained(&_modularSmallAlarmImageProvider___cachedDevice);
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v4 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    id v5 = [v4 device];
    id v6 = objc_loadWeakRetained(&_modularSmallAlarmImageProvider___cachedDevice);
    if (v5 == v6)
    {
      v7 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
      id v8 = [v7 device];
      uint64_t v9 = [v8 version];
      uint64_t v10 = _modularSmallAlarmImageProvider___previousCLKDeviceVersion;

      if (v9 == v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v12 = [v11 device];
  objc_storeWeak(&_modularSmallAlarmImageProvider___cachedDevice, v12);

  id v13 = objc_loadWeakRetained(&_modularSmallAlarmImageProvider___cachedDevice);
  _modularSmallAlarmImageProvider___previousCLKDeviceVersion = [v13 version];

  id v14 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v15 = [v14 device];
  __60__NTKComplicationModuleView__modularSmallAlarmImageProvider__block_invoke();

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_modularSmallAlarmImageProvider___lock);
  v16 = (void *)_modularSmallAlarmImageProvider_glyphImageProvider;

  return v16;
}

void __60__NTKComplicationModuleView__modularSmallAlarmImageProvider__block_invoke()
{
  uint64_t v0 = +[NTKComplicationModuleView _imageProviderForImageSymbolName:@"alarm" imageAssetNamePrefix:@"modularAlarmActive"];
  v1 = (void *)_modularSmallAlarmImageProvider_glyphImageProvider;
  _modularSmallAlarmImageProvider_glyphImageProvider = v0;

  v2 = (void *)_modularSmallAlarmImageProvider_glyphImageProvider;
  id v3 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [v2 setTintColor:v3];
}

+ (id)_extraLargeAlarmImageProvider
{
  os_unfair_lock_lock((os_unfair_lock_t)&_extraLargeAlarmImageProvider___lock);
  id WeakRetained = objc_loadWeakRetained(&_extraLargeAlarmImageProvider___cachedDevice);
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v4 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    id v5 = [v4 device];
    id v6 = objc_loadWeakRetained(&_extraLargeAlarmImageProvider___cachedDevice);
    if (v5 == v6)
    {
      v7 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
      id v8 = [v7 device];
      uint64_t v9 = [v8 version];
      uint64_t v10 = _extraLargeAlarmImageProvider___previousCLKDeviceVersion;

      if (v9 == v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v12 = [v11 device];
  objc_storeWeak(&_extraLargeAlarmImageProvider___cachedDevice, v12);

  id v13 = objc_loadWeakRetained(&_extraLargeAlarmImageProvider___cachedDevice);
  _extraLargeAlarmImageProvider___previousCLKDeviceVersion = [v13 version];

  id v14 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v15 = [v14 device];
  __58__NTKComplicationModuleView__extraLargeAlarmImageProvider__block_invoke();

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_extraLargeAlarmImageProvider___lock);
  v16 = (void *)_extraLargeAlarmImageProvider_glyphImageProvider;

  return v16;
}

void __58__NTKComplicationModuleView__extraLargeAlarmImageProvider__block_invoke()
{
  uint64_t v0 = +[NTKComplicationModuleView _imageProviderForImageSymbolName:@"alarm" imageAssetNamePrefix:@"XLmodularAlarmActive"];
  v1 = (void *)_extraLargeAlarmImageProvider_glyphImageProvider;
  _extraLargeAlarmImageProvider_glyphImageProvider = v0;

  v2 = (void *)_extraLargeAlarmImageProvider_glyphImageProvider;
  id v3 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [v2 setTintColor:v3];
}

+ (id)_modularSmallStopwatchImageProviderForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_modularSmallStopwatchImageProviderForDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&_modularSmallStopwatchImageProviderForDevice____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_modularSmallStopwatchImageProviderForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_modularSmallStopwatchImageProviderForDevice____cachedDevice, v3);
    _modularSmallStopwatchImageProviderForDevice____previousCLKDeviceVersion = [v3 version];

    __74__NTKComplicationModuleView__modularSmallStopwatchImageProviderForDevice___block_invoke();
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _modularSmallStopwatchImageProviderForDevice____previousCLKDeviceVersion;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_modularSmallStopwatchImageProviderForDevice____lock);
  id v10 = (id)_modularSmallStopwatchImageProviderForDevice__glyphImageProvider;

  return v10;
}

void __74__NTKComplicationModuleView__modularSmallStopwatchImageProviderForDevice___block_invoke()
{
  uint64_t v0 = +[NTKComplicationModuleView _imageProviderForImageSymbolName:@"stopwatch" imageAssetNamePrefix:@"modularStopwatch"];
  v1 = (void *)_modularSmallStopwatchImageProviderForDevice__glyphImageProvider;
  _modularSmallStopwatchImageProviderForDevice__glyphImageProvider = v0;

  v2 = (void *)_modularSmallStopwatchImageProviderForDevice__glyphImageProvider;
  id v3 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [v2 setTintColor:v3];
}

+ (id)_extraLargeStopwatchImageProviderForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_extraLargeStopwatchImageProviderForDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&_extraLargeStopwatchImageProviderForDevice____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_extraLargeStopwatchImageProviderForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_extraLargeStopwatchImageProviderForDevice____cachedDevice, v3);
    _extraLargeStopwatchImageProviderForDevice____previousCLKDeviceVersion = [v3 version];

    __72__NTKComplicationModuleView__extraLargeStopwatchImageProviderForDevice___block_invoke();
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _extraLargeStopwatchImageProviderForDevice____previousCLKDeviceVersion;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_extraLargeStopwatchImageProviderForDevice____lock);
  id v10 = (id)_extraLargeStopwatchImageProviderForDevice__glyphImageProvider;

  return v10;
}

void __72__NTKComplicationModuleView__extraLargeStopwatchImageProviderForDevice___block_invoke()
{
  uint64_t v0 = +[NTKComplicationModuleView _imageProviderForImageSymbolName:@"stopwatch" imageAssetNamePrefix:@"XLmodularStopwatch"];
  v1 = (void *)_extraLargeStopwatchImageProviderForDevice__glyphImageProvider;
  _extraLargeStopwatchImageProviderForDevice__glyphImageProvider = v0;

  v2 = (void *)_extraLargeStopwatchImageProviderForDevice__glyphImageProvider;
  id v3 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [v2 setTintColor:v3];
}

- (CDComplicationDisplayObserver)displayObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->displayObserver);

  return (CDComplicationDisplayObserver *)WeakRetained;
}

- (void)setDisplayObserver:(id)a3
{
}

- (unint64_t)textLayoutStyle
{
  return self->textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->textLayoutStyle = a3;
}

- (void).cxx_destruct
{
}

@end