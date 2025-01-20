@interface NTKFaceViewComplicationFactory
+ (id)_genericComplicationAnimationWithDuration:(double)a3 applier:(id)a4;
- (BOOL)fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4 faceView:(id)a5;
- (CLKDevice)device;
- (UIColor)foregroundColor;
- (UIColor)platterColor;
- (double)alpha;
- (double)contentSpecificAnimationDuration;
- (double)minimumBreathingScaleForComplicationSlot:(id)a3 faceView:(id)a4;
- (id)alphaProviderBlock;
- (id)createComplicationContentSpecificAttributesAnimationWithAttributes:(unint64_t)a3 faceView:(id)a4 forSlots:(id)a5;
- (id)detachedComplicationDisplaysForFaceView:(id)a3;
- (id)foregroundColorProviderBlock;
- (id)initForDevice:(id)a3;
- (id)keylineViewForComplicationSlot:(id)a3;
- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6;
- (id)platterColorProviderBlock;
- (int64_t)keylineStyleForComplicationSlot:(id)a3;
- (int64_t)legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4 faceView:(id)a5;
- (void)applyComplicationContentSpecificAttributesAnimated:(BOOL)a3 attributes:(unint64_t)a4 faceView:(id)a5;
- (void)applyComplicationContentSpecificAttributesAnimated:(BOOL)a3 faceView:(id)a4;
- (void)setAlpha:(double)a3;
- (void)setAlpha:(double)a3 faceView:(id)a4;
- (void)setAlphaProviderBlock:(id)a3;
- (void)setContentSpecificAnimationDuration:(double)a3;
- (void)setForegroundColor:(id)a3;
- (void)setForegroundColor:(id)a3 faceView:(id)a4;
- (void)setForegroundColorProviderBlock:(id)a3;
- (void)setPlatterColor:(id)a3;
- (void)setPlatterColor:(id)a3 faceView:(id)a4;
- (void)setPlatterColorProviderBlock:(id)a3;
@end

@implementation NTKFaceViewComplicationFactory

+ (id)_genericComplicationAnimationWithDuration:(double)a3 applier:(id)a4
{
  return 0;
}

- (id)initForDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKFaceViewComplicationFactory;
  v6 = [(NTKFaceViewComplicationFactory *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v7->_contentSpecificAnimationDuration = 0.45;
  }

  return v7;
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5 faceView:(id)a6
{
  return 0;
}

- (int64_t)legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4 faceView:(id)a5
{
  return 0;
}

- (BOOL)fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4 faceView:(id)a5
{
  return 0;
}

- (double)minimumBreathingScaleForComplicationSlot:(id)a3 faceView:(id)a4
{
  return 0.9;
}

- (id)keylineViewForComplicationSlot:(id)a3
{
  return 0;
}

- (int64_t)keylineStyleForComplicationSlot:(id)a3
{
  return 0;
}

- (id)detachedComplicationDisplaysForFaceView:(id)a3
{
  return 0;
}

- (void)setForegroundColor:(id)a3 faceView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([(UIColor *)self->_foregroundColor isEqual:v7] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__NTKFaceViewComplicationFactory_setForegroundColor_faceView___block_invoke;
    v9[3] = &unk_1E62C15B0;
    v9[4] = self;
    id v10 = v8;
    [v10 enumerateComplicationDisplayWrappersWithBlock:v9];
  }
}

void __62__NTKFaceViewComplicationFactory_setForegroundColor_faceView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [a3 display];
  [v5 configureComplicationView:v7 forSlot:v6 faceView:*(void *)(a1 + 40)];
}

- (void)setPlatterColor:(id)a3 faceView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([(UIColor *)self->_platterColor isEqual:v7] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_platterColor, a3);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__NTKFaceViewComplicationFactory_setPlatterColor_faceView___block_invoke;
    v9[3] = &unk_1E62C15B0;
    v9[4] = self;
    id v10 = v8;
    [v10 enumerateComplicationDisplayWrappersWithBlock:v9];
  }
}

void __59__NTKFaceViewComplicationFactory_setPlatterColor_faceView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [a3 display];
  [v5 configureComplicationView:v7 forSlot:v6 faceView:*(void *)(a1 + 40)];
}

- (void)setAlpha:(double)a3 faceView:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_alpha != a3)
  {
    self->_alpha = a3;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__NTKFaceViewComplicationFactory_setAlpha_faceView___block_invoke;
    v8[3] = &unk_1E62C15B0;
    v8[4] = self;
    id v9 = v6;
    [v9 enumerateComplicationDisplayWrappersWithBlock:v8];
  }
}

void __52__NTKFaceViewComplicationFactory_setAlpha_faceView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [a3 display];
  [v5 configureComplicationView:v7 forSlot:v6 faceView:*(void *)(a1 + 40)];
}

- (UIColor)foregroundColor
{
  foregroundColorProviderBlock = (void (**)(id, SEL))self->_foregroundColorProviderBlock;
  if (foregroundColorProviderBlock)
  {
    foregroundColorProviderBlock[2](foregroundColorProviderBlock, a2);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    foregroundColor = v4;
    if (!v4) {
      foregroundColor = self->_foregroundColor;
    }
    id v6 = foregroundColor;
  }
  else
  {
    id v6 = self->_foregroundColor;
  }
  return v6;
}

- (UIColor)platterColor
{
  platterColorProviderBlock = (void (**)(id, SEL))self->_platterColorProviderBlock;
  if (platterColorProviderBlock)
  {
    platterColorProviderBlock[2](platterColorProviderBlock, a2);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    platterColor = v4;
    if (!v4) {
      platterColor = self->_platterColor;
    }
    id v6 = platterColor;
  }
  else
  {
    id v6 = self->_platterColor;
  }
  return v6;
}

- (double)alpha
{
  alphaProviderBlock = (void (**)(void))self->_alphaProviderBlock;
  if (!alphaProviderBlock) {
    return self->_alpha;
  }
  alphaProviderBlock[2]();
  return result;
}

- (void)applyComplicationContentSpecificAttributesAnimated:(BOOL)a3 faceView:(id)a4
{
}

- (void)applyComplicationContentSpecificAttributesAnimated:(BOOL)a3 attributes:(unint64_t)a4 faceView:(id)a5
{
  id v5 = [(NTKFaceViewComplicationFactory *)self createComplicationContentSpecificAttributesAnimationWithAttributes:a4 faceView:a5 forSlots:0];
}

- (id)createComplicationContentSpecificAttributesAnimationWithAttributes:(unint64_t)a3 faceView:(id)a4 forSlots:(id)a5
{
  return 0;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setForegroundColor:(id)a3
{
}

- (void)setPlatterColor:(id)a3
{
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (id)foregroundColorProviderBlock
{
  return self->_foregroundColorProviderBlock;
}

- (void)setForegroundColorProviderBlock:(id)a3
{
}

- (id)platterColorProviderBlock
{
  return self->_platterColorProviderBlock;
}

- (void)setPlatterColorProviderBlock:(id)a3
{
}

- (id)alphaProviderBlock
{
  return self->_alphaProviderBlock;
}

- (void)setAlphaProviderBlock:(id)a3
{
}

- (double)contentSpecificAnimationDuration
{
  return self->_contentSpecificAnimationDuration;
}

- (void)setContentSpecificAnimationDuration:(double)a3
{
  self->_contentSpecificAnimationDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_alphaProviderBlock, 0);
  objc_storeStrong(&self->_platterColorProviderBlock, 0);
  objc_storeStrong(&self->_foregroundColorProviderBlock, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_platterColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
}

@end