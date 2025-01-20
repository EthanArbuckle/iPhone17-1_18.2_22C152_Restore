@interface VKCStickerEffect
+ (id)comicEffect;
+ (id)effectFromInternalEffect:(id)a3;
+ (id)effectWithType:(unint64_t)a3;
+ (id)iridescentEffect;
+ (id)noneEffect;
+ (id)puffyEffect;
+ (id)strokeEffect;
+ (int)internalIridescenceFromVKC:(unint64_t)a3;
+ (unint64_t)vkcIridescenceFromInternal:(int)a3;
- (BOOL)applyBrushBeforeStroke;
- (BOOL)applyIridescenceBeforeStroke;
- (BOOL)forceSmallStrokeRadiusMultiplier;
- (BOOL)isBrushed;
- (BOOL)isComicEnabled;
- (BOOL)isCurlEnabled;
- (BOOL)isInkEnabled;
- (BOOL)isPuffy;
- (BOOL)isStroked;
- (BOOL)requiresDeviceMotion;
- (CGPoint)shadowOffset;
- (CGPoint)shadowParallax;
- (VKCStickerEffectView)viewForRendering;
- (_VKStickerEffectInternal)internalEffect;
- (double)normalsRadius;
- (double)shadowRadius;
- (double)strokeRadius;
- (float)smallShadowAlphaMultiplier;
- (float)smallShadowSizeMultiplier;
- (float)smallStrokeRadiusMultiplier;
- (float)strokeBlurRadius;
- (id)description;
- (id)initInternal;
- (unint64_t)iridescence;
- (unint64_t)type;
- (void)applyToImage:(id)a3 completion:(id)a4;
- (void)applyToImageSequence:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)setApplyBrushBeforeStroke:(BOOL)a3;
- (void)setApplyIridescenceBeforeStroke:(BOOL)a3;
- (void)setForceSmallStrokeRadiusMultiplier:(BOOL)a3;
- (void)setIridescence:(unint64_t)a3;
- (void)setIsBrushed:(BOOL)a3;
- (void)setIsComicEnabled:(BOOL)a3;
- (void)setIsCurlEnabled:(BOOL)a3;
- (void)setIsInkEnabled:(BOOL)a3;
- (void)setIsPuffy:(BOOL)a3;
- (void)setIsStroked:(BOOL)a3;
- (void)setNormalsRadius:(double)a3;
- (void)setShadowOffset:(CGPoint)a3;
- (void)setShadowParallax:(CGPoint)a3;
- (void)setShadowRadius:(double)a3;
- (void)setSmallShadowAlphaMultiplier:(float)a3;
- (void)setSmallShadowSizeMultiplier:(float)a3;
- (void)setSmallStrokeRadiusMultiplier:(float)a3;
- (void)setStrokeBlurRadius:(float)a3;
- (void)setStrokeRadius:(double)a3;
- (void)setType:(unint64_t)a3;
- (void)setViewForRendering:(id)a3;
@end

@implementation VKCStickerEffect

+ (id)effectWithType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      v3 = [a1 strokeEffect];
      break;
    case 2uLL:
      v3 = [a1 comicEffect];
      break;
    case 3uLL:
      v3 = [a1 puffyEffect];
      break;
    case 4uLL:
      v3 = [a1 iridescentEffect];
      break;
    default:
      v3 = [a1 noneEffect];
      break;
  }
  return v3;
}

- (id)description
{
  v2 = [(VKCStickerEffect *)self internalEffect];
  v3 = VKProtocolCast((uint64_t)&unk_1F35C96C8, v2);

  v4 = [v3 description];

  return v4;
}

- (_VKStickerEffectInternal)internalEffect
{
  v3 = [MEMORY[0x1E4FB4010] makeNewEffect];
  objc_msgSend(v3, "setIsStroked:", -[VKCStickerEffect isStroked](self, "isStroked"));
  [(VKCStickerEffect *)self strokeRadius];
  *(float *)&double v4 = v4;
  [v3 setStrokeRadius:v4];
  [(VKCStickerEffect *)self strokeBlurRadius];
  objc_msgSend(v3, "setStrokeBlurRadius:");
  [(VKCStickerEffect *)self smallStrokeRadiusMultiplier];
  objc_msgSend(v3, "setSmallStrokeRadiusMultiplier:");
  [(VKCStickerEffect *)self smallShadowSizeMultiplier];
  objc_msgSend(v3, "setSmallShadowSizeMultiplier:");
  [(VKCStickerEffect *)self smallShadowAlphaMultiplier];
  objc_msgSend(v3, "setSmallShadowAlphaMultiplier:");
  objc_msgSend(v3, "setForceSmallStrokeRadiusMultiplier:", -[VKCStickerEffect forceSmallStrokeRadiusMultiplier](self, "forceSmallStrokeRadiusMultiplier"));
  objc_msgSend(v3, "setType:", -[VKCStickerEffect type](self, "type"));
  objc_msgSend(v3, "setIsPuffy:", -[VKCStickerEffect isPuffy](self, "isPuffy"));
  [(VKCStickerEffect *)self normalsRadius];
  *(float *)&double v5 = v5;
  [v3 setNormalsRadius:v5];
  objc_msgSend(v3, "setIsBrushed:", -[VKCStickerEffect isBrushed](self, "isBrushed"));
  objc_msgSend(v3, "setApplyBrushBeforeStroke:", -[VKCStickerEffect applyBrushBeforeStroke](self, "applyBrushBeforeStroke"));
  objc_msgSend(v3, "setApplyIridescenceBeforeStroke:", -[VKCStickerEffect applyIridescenceBeforeStroke](self, "applyIridescenceBeforeStroke"));
  [(VKCStickerEffect *)self shadowRadius];
  *(float *)&double v6 = v6;
  [v3 setShadowRadius:v6];
  [(VKCStickerEffect *)self shadowOffset];
  float64_t v15 = v7;
  [(VKCStickerEffect *)self shadowOffset];
  v8.f64[0] = v15;
  v8.f64[1] = v9;
  [v3 setShadowOffset:COERCE_DOUBLE(vcvt_f32_f64(v8))];
  [(VKCStickerEffect *)self shadowParallax];
  float64_t v16 = v10;
  [(VKCStickerEffect *)self shadowParallax];
  v11.f64[0] = v16;
  v11.f64[1] = v12;
  [v3 setShadowParallax:COERCE_DOUBLE(vcvt_f32_f64(v11))];
  BOOL v13 = [(VKCStickerEffect *)self isComicEnabled]
     || [(VKCStickerEffect *)self isInkEnabled];
  [v3 setIsComicEnabled:v13];
  if ([v3 isComicEnabled])
  {
    if ([(VKCStickerEffect *)self isComicEnabled]) {
      [v3 applyComicParameters];
    }
    else {
      [v3 applyComicInkParameters];
    }
  }
  objc_msgSend(v3, "setIsCurlEnabled:", -[VKCStickerEffect isCurlEnabled](self, "isCurlEnabled"));
  objc_msgSend(v3, "setIridescence:", objc_msgSend((id)objc_opt_class(), "internalIridescenceFromVKC:", -[VKCStickerEffect iridescence](self, "iridescence")));
  return (_VKStickerEffectInternal *)v3;
}

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)VKCStickerEffect;
  return [(VKCStickerEffect *)&v3 init];
}

+ (id)noneEffect
{
  objc_super v3 = [MEMORY[0x1E4FB4010] noneEffect];
  double v4 = [a1 effectFromInternalEffect:v3];

  return v4;
}

+ (id)strokeEffect
{
  objc_super v3 = [MEMORY[0x1E4FB4010] strokeEffect];
  double v4 = [a1 effectFromInternalEffect:v3];

  return v4;
}

+ (id)comicEffect
{
  objc_super v3 = [MEMORY[0x1E4FB4010] comicEffect];
  double v4 = [a1 effectFromInternalEffect:v3];

  return v4;
}

+ (id)puffyEffect
{
  objc_super v3 = [MEMORY[0x1E4FB4010] puffyEffect];
  double v4 = [a1 effectFromInternalEffect:v3];

  return v4;
}

+ (id)iridescentEffect
{
  objc_super v3 = [MEMORY[0x1E4FB4010] iridescentEffect];
  double v4 = [a1 effectFromInternalEffect:v3];

  return v4;
}

+ (unint64_t)vkcIridescenceFromInternal:(int)a3
{
  uint64_t v3 = (a3 - 1);
  if (v3 < 4) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

+ (int)internalIridescenceFromVKC:(unint64_t)a3
{
  if (a3 - 1 < 4) {
    return a3;
  }
  else {
    return 0;
  }
}

+ (id)effectFromInternalEffect:(id)a3
{
  id v3 = a3;
  id v4 = [[VKCStickerEffect alloc] initInternal];
  objc_msgSend(v4, "setType:", objc_msgSend(v3, "type"));
  objc_msgSend(v4, "setIsStroked:", objc_msgSend(v3, "isStroked"));
  [v3 strokeRadius];
  [v4 setStrokeRadius:v5];
  [v3 strokeBlurRadius];
  objc_msgSend(v4, "setStrokeBlurRadius:");
  [v3 smallStrokeRadiusMultiplier];
  objc_msgSend(v4, "setSmallStrokeRadiusMultiplier:");
  [v3 smallShadowSizeMultiplier];
  objc_msgSend(v4, "setSmallShadowSizeMultiplier:");
  [v3 smallShadowAlphaMultiplier];
  objc_msgSend(v4, "setSmallShadowAlphaMultiplier:");
  objc_msgSend(v4, "setForceSmallStrokeRadiusMultiplier:", objc_msgSend(v3, "forceSmallStrokeRadiusMultiplier"));
  objc_msgSend(v4, "setIsPuffy:", objc_msgSend(v3, "isPuffy"));
  [v3 normalsRadius];
  [v4 setNormalsRadius:v6];
  objc_msgSend(v4, "setIsBrushed:", objc_msgSend(v3, "isBrushed"));
  objc_msgSend(v4, "setApplyBrushBeforeStroke:", objc_msgSend(v3, "applyBrushBeforeStroke"));
  objc_msgSend(v4, "setApplyIridescenceBeforeStroke:", objc_msgSend(v3, "applyIridescenceBeforeStroke"));
  [v3 shadowRadius];
  [v4 setShadowRadius:v7];
  [v3 shadowOffset];
  double v9 = v8;
  [v3 shadowOffset];
  objc_msgSend(v4, "setShadowOffset:", v9, v10);
  [v3 shadowParallax];
  double v12 = v11;
  [v3 shadowParallax];
  objc_msgSend(v4, "setShadowParallax:", v12, v13);
  objc_msgSend(v4, "setIsComicEnabled:", objc_msgSend(v3, "isComicEnabled"));
  objc_msgSend(v4, "setIsCurlEnabled:", objc_msgSend(v3, "isCurlEnabled"));
  uint64_t v14 = [v3 iridescence];

  objc_msgSend(v4, "setIridescence:", +[VKCStickerEffect vkcIridescenceFromInternal:](VKCStickerEffect, "vkcIridescenceFromInternal:", v14));
  return v4;
}

- (BOOL)requiresDeviceMotion
{
  v2 = [(VKCStickerEffect *)self internalEffect];
  id v3 = VKProtocolCast((uint64_t)&unk_1F35C96C8, v2);

  LOBYTE(v2) = [v3 requiresDeviceMotion];
  return (char)v2;
}

- (void)applyToImage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__VKCStickerEffect_applyToImage_completion___block_invoke;
  v10[3] = &unk_1E6BF0EF8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  vk_performBlockOnMainThread(v10);
}

void __44__VKCStickerEffect_applyToImage_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) viewForRendering];

  if (!v2)
  {
    id v3 = [VKCStickerEffectView alloc];
    id v4 = MTLCreateSystemDefaultDevice();
    float v5 = [(VKCStickerEffectView *)v3 initWithDevice:v4];
    [*(id *)(a1 + 32) setViewForRendering:v5];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) viewForRendering];
  [v7 setImage:v6];

  id v8 = *(void **)(a1 + 32);
  id v9 = [v8 viewForRendering];
  [v9 setEffect:v8];

  id v10 = [*(id *)(a1 + 32) viewForRendering];
  [v10 snapshotWithCompletionHandler:*(void *)(a1 + 48)];
}

- (void)applyToImageSequence:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(0, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__VKCStickerEffect_applyToImageSequence_progressHandler_completionHandler___block_invoke;
  v15[3] = &unk_1E6BF0F70;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __75__VKCStickerEffect_applyToImageSequence_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__VKCStickerEffect_applyToImageSequence_progressHandler_completionHandler___block_invoke_2;
  v4[3] = &unk_1E6BF0F48;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  +[VKCStickerEffectVideoProcessor applyEffect:v1 toImageSequence:v2 progressHandler:v3 completionHandler:v4];
}

void __75__VKCStickerEffect_applyToImageSequence_progressHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__VKCStickerEffect_applyToImageSequence_progressHandler_completionHandler___block_invoke_3;
  v10[3] = &unk_1E6BF0F20;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  vk_dispatchMainAfterDelay(v10, 0.0);
}

uint64_t __75__VKCStickerEffect_applyToImageSequence_progressHandler_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)forceSmallStrokeRadiusMultiplier
{
  return self->_forceSmallStrokeRadiusMultiplier;
}

- (void)setForceSmallStrokeRadiusMultiplier:(BOOL)a3
{
  self->_forceSmallStrokeRadiusMultiplier = a3;
}

- (VKCStickerEffectView)viewForRendering
{
  return self->_viewForRendering;
}

- (void)setViewForRendering:(id)a3
{
}

- (unint64_t)iridescence
{
  return self->_iridescence;
}

- (void)setIridescence:(unint64_t)a3
{
  self->_iridescence = a3;
}

- (BOOL)isStroked
{
  return self->_isStroked;
}

- (void)setIsStroked:(BOOL)a3
{
  self->_isStroked = a3;
}

- (double)strokeRadius
{
  return self->_strokeRadius;
}

- (void)setStrokeRadius:(double)a3
{
  self->_strokeRadius = a3;
}

- (float)strokeBlurRadius
{
  return self->_strokeBlurRadius;
}

- (void)setStrokeBlurRadius:(float)a3
{
  self->_strokeBlurRadius = a3;
}

- (float)smallStrokeRadiusMultiplier
{
  return self->_smallStrokeRadiusMultiplier;
}

- (void)setSmallStrokeRadiusMultiplier:(float)a3
{
  self->_smallStrokeRadiusMultiplier = a3;
}

- (float)smallShadowSizeMultiplier
{
  return self->_smallShadowSizeMultiplier;
}

- (void)setSmallShadowSizeMultiplier:(float)a3
{
  self->_smallShadowSizeMultiplier = a3;
}

- (float)smallShadowAlphaMultiplier
{
  return self->_smallShadowAlphaMultiplier;
}

- (void)setSmallShadowAlphaMultiplier:(float)a3
{
  self->_smallShadowAlphaMultiplier = a3;
}

- (BOOL)isPuffy
{
  return self->_isPuffy;
}

- (void)setIsPuffy:(BOOL)a3
{
  self->_isPuffy = a3;
}

- (double)normalsRadius
{
  return self->_normalsRadius;
}

- (void)setNormalsRadius:(double)a3
{
  self->_normalsRadius = a3;
}

- (BOOL)isBrushed
{
  return self->_isBrushed;
}

- (void)setIsBrushed:(BOOL)a3
{
  self->_isBrushed = a3;
}

- (BOOL)applyBrushBeforeStroke
{
  return self->_applyBrushBeforeStroke;
}

- (void)setApplyBrushBeforeStroke:(BOOL)a3
{
  self->_applyBrushBeforeStroke = a3;
}

- (BOOL)applyIridescenceBeforeStroke
{
  return self->_applyIridescenceBeforeStroke;
}

- (void)setApplyIridescenceBeforeStroke:(BOOL)a3
{
  self->_applyIridescenceBeforeStroke = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (CGPoint)shadowOffset
{
  double x = self->_shadowOffset.x;
  double y = self->_shadowOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setShadowOffset:(CGPoint)a3
{
  self->_shadowOffset = a3;
}

- (CGPoint)shadowParallax
{
  double x = self->_shadowParallax.x;
  double y = self->_shadowParallax.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setShadowParallax:(CGPoint)a3
{
  self->_shadowParalladouble x = a3;
}

- (BOOL)isComicEnabled
{
  return self->_isComicEnabled;
}

- (void)setIsComicEnabled:(BOOL)a3
{
  self->_isComicEnabled = a3;
}

- (BOOL)isInkEnabled
{
  return self->_isInkEnabled;
}

- (void)setIsInkEnabled:(BOOL)a3
{
  self->_isInkEnabled = a3;
}

- (BOOL)isCurlEnabled
{
  return self->_isCurlEnabled;
}

- (void)setIsCurlEnabled:(BOOL)a3
{
  self->_isCurlEnabled = a3;
}

- (void).cxx_destruct
{
}

@end