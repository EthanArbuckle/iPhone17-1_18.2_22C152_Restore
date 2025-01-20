@interface PXKeyboardSettings
+ (PXKeyboardSettings)sharedInstance;
+ (id)_makeAnimationStyleChoiceRowWithTitle:(id)a3 valueKeyPath:(id)a4;
+ (id)_makeGlobalFocusAnimationSection;
+ (id)_makeLocalFocusAnimationSection;
+ (id)settingsControllerModule;
- (BOOL)enableShadow;
- (double)allPhotosAspectFillFocusPadding;
- (double)allPhotosAspectFitFocusPadding;
- (double)daysFocusPadding;
- (double)detailsViewOverlayAlpha;
- (double)monthsFocusPadding;
- (double)shadowBlurRadius;
- (double)shadowOpacity;
- (double)shadowYOffset;
- (double)yearsFocusPadding;
- (id)archiveValueForKey:(id)a3;
- (id)globalFocusAnimationShadow;
- (id)parentSettings;
- (int64_t)allPhotosAspectFillFocusAnimationStyle;
- (int64_t)allPhotosAspectFitFocusAnimationStyle;
- (int64_t)daysFocusAnimationStyle;
- (int64_t)monthsFocusAnimationStyle;
- (int64_t)yearsFocusAnimationStyle;
- (void)applyArchiveValue:(id)a3 forKey:(id)a4;
- (void)setAllPhotosAspectFillFocusAnimationStyle:(int64_t)a3;
- (void)setAllPhotosAspectFillFocusPadding:(double)a3;
- (void)setAllPhotosAspectFitFocusAnimationStyle:(int64_t)a3;
- (void)setAllPhotosAspectFitFocusPadding:(double)a3;
- (void)setDaysFocusAnimationStyle:(int64_t)a3;
- (void)setDaysFocusPadding:(double)a3;
- (void)setDefaultValues;
- (void)setDetailsViewOverlayAlpha:(double)a3;
- (void)setEnableShadow:(BOOL)a3;
- (void)setMonthsFocusAnimationStyle:(int64_t)a3;
- (void)setMonthsFocusPadding:(double)a3;
- (void)setShadowBlurRadius:(double)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShadowYOffset:(double)a3;
- (void)setYearsFocusAnimationStyle:(int64_t)a3;
- (void)setYearsFocusPadding:(double)a3;
@end

@implementation PXKeyboardSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXKeyboardSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXKeyboardSettings *)self setEnableShadow:0];
  [(PXKeyboardSettings *)self setShadowYOffset:10.0];
  [(PXKeyboardSettings *)self setShadowBlurRadius:30.0];
  [(PXKeyboardSettings *)self setShadowOpacity:3.0];
  [(PXKeyboardSettings *)self setYearsFocusAnimationStyle:0];
  [(PXKeyboardSettings *)self setYearsFocusPadding:20.0];
  [(PXKeyboardSettings *)self setMonthsFocusAnimationStyle:0];
  [(PXKeyboardSettings *)self setMonthsFocusPadding:20.0];
  [(PXKeyboardSettings *)self setDaysFocusAnimationStyle:0];
  [(PXKeyboardSettings *)self setDaysFocusPadding:20.0];
  [(PXKeyboardSettings *)self setAllPhotosAspectFitFocusAnimationStyle:0];
  [(PXKeyboardSettings *)self setAllPhotosAspectFitFocusPadding:20.0];
  [(PXKeyboardSettings *)self setAllPhotosAspectFillFocusAnimationStyle:0];
  [(PXKeyboardSettings *)self setAllPhotosAspectFillFocusPadding:20.0];
  [(PXKeyboardSettings *)self setDetailsViewOverlayAlpha:0.3];
}

- (void)setYearsFocusPadding:(double)a3
{
  self->_yearsFocusPadding = a3;
}

- (void)setYearsFocusAnimationStyle:(int64_t)a3
{
  self->_yearsFocusAnimationStyle = a3;
}

- (void)setShadowYOffset:(double)a3
{
  self->_shadowYOffset = a3;
}

- (void)setShadowOpacity:(double)a3
{
  self->_shadowOpacity = a3;
}

- (void)setShadowBlurRadius:(double)a3
{
  self->_shadowBlurRadius = a3;
}

- (void)setMonthsFocusPadding:(double)a3
{
  self->_monthsFocusPadding = a3;
}

- (void)setMonthsFocusAnimationStyle:(int64_t)a3
{
  self->_monthsFocusAnimationStyle = a3;
}

- (void)setEnableShadow:(BOOL)a3
{
  self->_enableShadow = a3;
}

- (void)setDetailsViewOverlayAlpha:(double)a3
{
  self->_detailsViewOverlayAlpha = a3;
}

- (void)setDaysFocusPadding:(double)a3
{
  self->_daysFocusPadding = a3;
}

- (void)setDaysFocusAnimationStyle:(int64_t)a3
{
  self->_daysFocusAnimationStyle = a3;
}

- (void)setAllPhotosAspectFitFocusPadding:(double)a3
{
  self->_allPhotosAspectFitFocusPadding = a3;
}

- (void)setAllPhotosAspectFitFocusAnimationStyle:(int64_t)a3
{
  self->_allPhotosAspectFitFocusAnimationStyle = a3;
}

- (void)setAllPhotosAspectFillFocusPadding:(double)a3
{
  self->_allPhotosAspectFillFocusPadding = a3;
}

- (void)setAllPhotosAspectFillFocusAnimationStyle:(int64_t)a3
{
  self->_allPhotosAspectFillFocusAnimationStyle = a3;
}

+ (id)_makeAnimationStyleChoiceRowWithTitle:(id)a3 valueKeyPath:(id)a4
{
  v4 = [MEMORY[0x1E4F941A0] rowWithTitle:a3 valueKeyPath:a4];
  id v5 = (id)[v4 possibleValues:&unk_1F02D4B88 titles:&unk_1F02D4BA0];
  return v4;
}

+ (id)_makeGlobalFocusAnimationSection
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v3 = (void *)MEMORY[0x1E4F941B8];
  v4 = NSStringFromSelector(sel_shadowYOffset);
  id v5 = [v3 rowWithTitle:@"Shadow Y Offset" valueKeyPath:v4];
  v6 = [v5 minValue:0.0 maxValue:50.0];
  v7 = objc_msgSend(v6, "px_increment:", 1.0);
  [v2 addObject:v7];

  v8 = (void *)MEMORY[0x1E4F941B8];
  v9 = NSStringFromSelector(sel_shadowBlurRadius);
  v10 = [v8 rowWithTitle:@"Shadow Blur Radius" valueKeyPath:v9];
  v11 = [v10 minValue:0.0 maxValue:50.0];
  v12 = objc_msgSend(v11, "px_increment:", 1.0);
  [v2 addObject:v12];

  v13 = (void *)MEMORY[0x1E4F941B8];
  v14 = NSStringFromSelector(sel_shadowOpacity);
  v15 = [v13 rowWithTitle:@"Shadow Opacity" valueKeyPath:v14];
  v16 = [v15 minValue:0.0 maxValue:1.0];
  v17 = objc_msgSend(v16, "px_increment:", 0.01);
  [v2 addObject:v17];

  v18 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Shadow" valueKeyPath:@"enableShadow"];
  [v2 addObject:v18];

  v19 = [MEMORY[0x1E4F94160] sectionWithRows:v2 title:@"Global Settings"];

  return v19;
}

+ (id)_makeLocalFocusAnimationSection
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([&unk_1F02D4B28 count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [&unk_1F02D4B58 objectAtIndexedSubscript:v4];
      v6 = [&unk_1F02D4B70 objectAtIndexedSubscript:v4];
      v7 = [a1 _makeAnimationStyleChoiceRowWithTitle:v5 valueKeyPath:v6];
      [v3 addObject:v7];

      v8 = (void *)MEMORY[0x1E4F941D8];
      v9 = [&unk_1F02D4B28 objectAtIndexedSubscript:v4];
      v10 = [&unk_1F02D4B40 objectAtIndexedSubscript:v4];
      v11 = [v8 rowWithTitle:v9 valueKeyPath:v10];
      v12 = [v11 minValue:2.0 maxValue:30.0];
      v13 = objc_msgSend(v12, "px_increment:", 2.0);
      [v3 addObject:v13];

      ++v4;
    }
    while (v4 < [&unk_1F02D4B28 count]);
  }
  v14 = (void *)MEMORY[0x1E4F941D8];
  v15 = NSStringFromSelector(sel_detailsViewOverlayAlpha);
  v16 = [v14 rowWithTitle:@"Details Overlay Alpha" valueKeyPath:v15];
  [v3 addObject:v16];

  v17 = [MEMORY[0x1E4F94160] sectionWithRows:v3 title:@"Local Settings"];

  return v17;
}

+ (id)settingsControllerModule
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F94160];
  unint64_t v4 = [a1 _makeGlobalFocusAnimationSection];
  id v5 = objc_msgSend(a1, "_makeLocalFocusAnimationSection", v4);
  v10[1] = v5;
  v6 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v10[2] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  v8 = [v3 moduleWithTitle:@"Keyboard" contents:v7];

  return v8;
}

- (double)detailsViewOverlayAlpha
{
  return self->_detailsViewOverlayAlpha;
}

- (double)allPhotosAspectFillFocusPadding
{
  return self->_allPhotosAspectFillFocusPadding;
}

- (int64_t)allPhotosAspectFillFocusAnimationStyle
{
  return self->_allPhotosAspectFillFocusAnimationStyle;
}

- (double)allPhotosAspectFitFocusPadding
{
  return self->_allPhotosAspectFitFocusPadding;
}

- (int64_t)allPhotosAspectFitFocusAnimationStyle
{
  return self->_allPhotosAspectFitFocusAnimationStyle;
}

- (double)daysFocusPadding
{
  return self->_daysFocusPadding;
}

- (int64_t)daysFocusAnimationStyle
{
  return self->_daysFocusAnimationStyle;
}

- (double)monthsFocusPadding
{
  return self->_monthsFocusPadding;
}

- (int64_t)monthsFocusAnimationStyle
{
  return self->_monthsFocusAnimationStyle;
}

- (double)yearsFocusPadding
{
  return self->_yearsFocusPadding;
}

- (int64_t)yearsFocusAnimationStyle
{
  return self->_yearsFocusAnimationStyle;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (double)shadowBlurRadius
{
  return self->_shadowBlurRadius;
}

- (double)shadowYOffset
{
  return self->_shadowYOffset;
}

- (BOOL)enableShadow
{
  return self->_enableShadow;
}

- (id)globalFocusAnimationShadow
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB0858]);
  unint64_t v4 = (void *)MEMORY[0x1E4FB1618];
  [(PXKeyboardSettings *)self shadowOpacity];
  v6 = [v4 colorWithWhite:0.0 alpha:v5];
  [v3 setShadowColor:v6];

  [(PXKeyboardSettings *)self shadowBlurRadius];
  objc_msgSend(v3, "setShadowBlurRadius:");
  [(PXKeyboardSettings *)self shadowYOffset];
  objc_msgSend(v3, "setShadowOffset:", 0.0, v7);
  return v3;
}

- (id)archiveValueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"globalFocusAnimationShadow"])
  {
    double v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXKeyboardSettings;
    double v5 = [(PXSettings *)&v7 archiveValueForKey:v4];
  }

  return v5;
}

- (void)applyArchiveValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isEqualToString:@"globalFocusAnimationShadow"] & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PXKeyboardSettings;
    [(PXSettings *)&v8 applyArchiveValue:v6 forKey:v7];
  }
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (PXKeyboardSettings)sharedInstance
{
  if (sharedInstance_onceToken_294366 != -1) {
    dispatch_once(&sharedInstance_onceToken_294366, &__block_literal_global_294367);
  }
  id v2 = (void *)sharedInstance_sharedInstance_294368;
  return (PXKeyboardSettings *)v2;
}

void __36__PXKeyboardSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 keyboardSettings];
  v1 = (void *)sharedInstance_sharedInstance_294368;
  sharedInstance_sharedInstance_294368 = v0;
}

@end