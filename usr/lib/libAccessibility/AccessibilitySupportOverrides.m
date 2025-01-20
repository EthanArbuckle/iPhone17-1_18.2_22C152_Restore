@interface AccessibilitySupportOverrides
+ (id)shared;
- (NSNumber)boldText;
- (NSNumber)buttonShapes;
- (NSNumber)differentiateWithoutColor;
- (NSNumber)grayscale;
- (NSNumber)increaseContrast;
- (NSNumber)onOffLabels;
- (NSNumber)reduceMotion;
- (NSNumber)reduceTransparency;
- (NSNumber)smartInvert;
- (void)_addFilter:(id)a3;
- (void)_installGrayscaleFilter;
- (void)_installInvertColorsFilter;
- (void)_removeFilterWithName:(id)a3;
- (void)setBoldText:(id)a3;
- (void)setButtonShapes:(id)a3;
- (void)setDifferentiateWithoutColor:(id)a3;
- (void)setGrayscale:(id)a3;
- (void)setIncreaseContrast:(id)a3;
- (void)setOnOffLabels:(id)a3;
- (void)setReduceMotion:(id)a3;
- (void)setReduceTransparency:(id)a3;
- (void)setSmartInvert:(id)a3;
@end

@implementation AccessibilitySupportOverrides

- (NSNumber)grayscale
{
  return self->_grayscale;
}

- (NSNumber)onOffLabels
{
  return self->_onOffLabels;
}

- (NSNumber)differentiateWithoutColor
{
  return self->_differentiateWithoutColor;
}

- (NSNumber)buttonShapes
{
  return self->_buttonShapes;
}

- (NSNumber)reduceTransparency
{
  return self->_reduceTransparency;
}

- (NSNumber)reduceMotion
{
  return self->_reduceMotion;
}

- (NSNumber)smartInvert
{
  return self->_smartInvert;
}

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global);
  }
  v2 = (void *)shared_Shared;

  return v2;
}

- (NSNumber)increaseContrast
{
  return self->_increaseContrast;
}

- (NSNumber)boldText
{
  return self->_boldText;
}

uint64_t __39__AccessibilitySupportOverrides_shared__block_invoke()
{
  shared_Shared = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (void)setBoldText:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__AccessibilitySupportOverrides_setBoldText___block_invoke;
  v6[3] = &unk_1E568BDF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __45__AccessibilitySupportOverrides_setBoldText___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:kAXSEnhanceTextLegibilityChangedNotification object:0];
}

- (void)setReduceMotion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__AccessibilitySupportOverrides_setReduceMotion___block_invoke;
  v6[3] = &unk_1E568BDF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __49__AccessibilitySupportOverrides_setReduceMotion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:kAXSReduceMotionChangedNotification object:0];
}

- (void)setReduceTransparency:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__AccessibilitySupportOverrides_setReduceTransparency___block_invoke;
  v6[3] = &unk_1E568BDF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __55__AccessibilitySupportOverrides_setReduceTransparency___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:kAXSEnhanceBackgroundContrastChangedNotification object:0];
}

- (void)setIncreaseContrast:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__AccessibilitySupportOverrides_setIncreaseContrast___block_invoke;
  v6[3] = &unk_1E568BDF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __53__AccessibilitySupportOverrides_setIncreaseContrast___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:kAXSDarkenSystemColorsEnabledNotification object:0];
}

- (void)setOnOffLabels:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__AccessibilitySupportOverrides_setOnOffLabels___block_invoke;
  v6[3] = &unk_1E568BDF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __48__AccessibilitySupportOverrides_setOnOffLabels___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:kAXSIncreaseButtonLegibilityNotification object:0];
}

- (void)setGrayscale:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__AccessibilitySupportOverrides_setGrayscale___block_invoke;
  v6[3] = &unk_1E568BDF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __46__AccessibilitySupportOverrides_setGrayscale___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) _installGrayscaleFilter];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:kAXSGrayscaleEnabledNotification object:0];
}

- (void)setSmartInvert:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__AccessibilitySupportOverrides_setSmartInvert___block_invoke;
  v6[3] = &unk_1E568BDF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __48__AccessibilitySupportOverrides_setSmartInvert___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) _installInvertColorsFilter];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:kAXSInvertColorsEnabledNotification object:0];
}

- (void)setButtonShapes:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__AccessibilitySupportOverrides_setButtonShapes___block_invoke;
  v6[3] = &unk_1E568BDF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __49__AccessibilitySupportOverrides_setButtonShapes___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:kAXSButtonShapesEnabledNotification object:0];
}

- (void)setDifferentiateWithoutColor:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__AccessibilitySupportOverrides_setDifferentiateWithoutColor___block_invoke;
  v6[3] = &unk_1E568BDF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __62__AccessibilitySupportOverrides_setDifferentiateWithoutColor___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
  id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:kAXSDifferentiateWithoutColorChangedNotification object:0];
}

- (void)_addFilter:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [NSClassFromString(&cfstr_Uiapplication.isa) sharedApplication];
  id v5 = [v4 keyWindow];
  v6 = [v5 layer];

  uint64_t v7 = [v6 filters];
  if (v7)
  {
    v8 = (void *)v7;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__AccessibilitySupportOverrides__addFilter___block_invoke;
    v11[3] = &unk_1E568BE18;
    id v9 = v3;
    id v12 = v9;
    if ([v8 indexOfObjectPassingTest:v11] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = [v8 arrayByAddingObject:v9];

      v8 = (void *)v10;
    }
  }
  else
  {
    v13[0] = v3;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  [v6 setValue:v8 forKey:@"filters"];
}

uint64_t __44__AccessibilitySupportOverrides__addFilter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  id v4 = [*(id *)(a1 + 32) name];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)_removeFilterWithName:(id)a3
{
  id v3 = a3;
  id v4 = [NSClassFromString(&cfstr_Uiapplication.isa) sharedApplication];
  uint64_t v5 = [v4 keyWindow];
  v6 = [v5 layer];

  uint64_t v7 = [v6 filters];
  if (v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__AccessibilitySupportOverrides__removeFilterWithName___block_invoke;
    v11[3] = &unk_1E568BE18;
    id v12 = v3;
    uint64_t v8 = [v7 indexOfObjectPassingTest:v11];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = v8;
      uint64_t v10 = (void *)[v7 mutableCopy];
      [v10 removeObjectAtIndex:v9];
      [v6 setValue:v10 forKey:@"filters"];
    }
  }
}

uint64_t __55__AccessibilitySupportOverrides__removeFilterWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_installInvertColorsFilter
{
  id v3 = [(AccessibilitySupportOverrides *)self smartInvert];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = [NSClassFromString(&cfstr_Cafilter.isa) filterWithType:@"colorInvert"];
    [v5 setName:@"colorInvert"];
    [v5 setAccessibility:1];
    [(AccessibilitySupportOverrides *)self _addFilter:v5];
  }
  else
  {
    [(AccessibilitySupportOverrides *)self _removeFilterWithName:@"colorInvert"];
  }
}

- (void)_installGrayscaleFilter
{
  id v3 = [(AccessibilitySupportOverrides *)self grayscale];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = [NSClassFromString(&cfstr_Cafilter.isa) filterWithType:@"colorMonochrome"];
    [v5 setName:@"colorMonochrome"];
    [v5 setAccessibility:1];
    [(AccessibilitySupportOverrides *)self _addFilter:v5];
  }
  else
  {
    [(AccessibilitySupportOverrides *)self _removeFilterWithName:@"colorMonochrome"];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_differentiateWithoutColor, 0);
  objc_storeStrong((id *)&self->_smartInvert, 0);
  objc_storeStrong((id *)&self->_grayscale, 0);
  objc_storeStrong((id *)&self->_buttonShapes, 0);
  objc_storeStrong((id *)&self->_onOffLabels, 0);
  objc_storeStrong((id *)&self->_reduceMotion, 0);
  objc_storeStrong((id *)&self->_reduceTransparency, 0);
  objc_storeStrong((id *)&self->_increaseContrast, 0);

  objc_storeStrong((id *)&self->_boldText, 0);
}

@end