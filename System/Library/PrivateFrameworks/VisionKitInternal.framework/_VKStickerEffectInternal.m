@interface _VKStickerEffectInternal
+ (_VKStickerEffectInternal)comicEffect;
+ (_VKStickerEffectInternal)iridescentEffect;
+ (_VKStickerEffectInternal)noneEffect;
+ (_VKStickerEffectInternal)puffyEffect;
+ (_VKStickerEffectInternal)strokeEffect;
- (BOOL)applyBrushBeforeStroke;
- (BOOL)applyIridescenceBeforeStroke;
- (BOOL)forceSmallStrokeRadiusMultiplier;
- (BOOL)isBrushed;
- (BOOL)isComicEnabled;
- (BOOL)isCurlEnabled;
- (BOOL)isPuffy;
- (BOOL)isStroked;
- (BOOL)requiresDeviceMotion;
- (NSString)description;
- (_VKStickerEffectInternal)init;
- (double)shadowOffset;
- (double)shadowParallax;
- (float)normalsRadius;
- (float)shadowAlpha;
- (float)shadowRadius;
- (float)smallShadowAlphaMultiplier;
- (float)smallShadowSizeMultiplier;
- (float)smallStrokeRadiusMultiplier;
- (float)strokeBlurRadius;
- (float)strokeRadius;
- (int)iridescence;
- (unint64_t)type;
- (void)applyComicInkParameters;
- (void)applyComicParameters;
- (void)setApplyBrushBeforeStroke:(BOOL)a3;
- (void)setApplyIridescenceBeforeStroke:(BOOL)a3;
- (void)setForceSmallStrokeRadiusMultiplier:(BOOL)a3;
- (void)setIridescence:(int)a3;
- (void)setIsBrushed:(BOOL)a3;
- (void)setIsComicEnabled:(BOOL)a3;
- (void)setIsCurlEnabled:(BOOL)a3;
- (void)setIsPuffy:(BOOL)a3;
- (void)setIsStroked:(BOOL)a3;
- (void)setNormalsRadius:(float)a3;
- (void)setShadowAlpha:(float)a3;
- (void)setShadowOffset:(_VKStickerEffectInternal *)self;
- (void)setShadowParallax:(_VKStickerEffectInternal *)self;
- (void)setShadowRadius:(float)a3;
- (void)setSmallShadowAlphaMultiplier:(float)a3;
- (void)setSmallShadowSizeMultiplier:(float)a3;
- (void)setSmallStrokeRadiusMultiplier:(float)a3;
- (void)setStrokeBlurRadius:(float)a3;
- (void)setStrokeRadius:(float)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation _VKStickerEffectInternal

- (unint64_t)type
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_type);
  swift_beginAccess();
  return *v2;
}

- (void)setType:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_type);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (NSString)description
{
  swift_beginAccess();
  v2 = (void *)sub_260D75650();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isStroked
{
  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isStroked;
  swift_beginAccess();
  return *v2;
}

- (void)setIsStroked:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isStroked;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (float)strokeRadius
{
  v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_strokeRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setStrokeRadius:(float)a3
{
  v4 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_strokeRadius);
  swift_beginAccess();
  float *v4 = a3;
}

- (float)strokeBlurRadius
{
  v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_strokeBlurRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setStrokeBlurRadius:(float)a3
{
  v4 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_strokeBlurRadius);
  swift_beginAccess();
  float *v4 = a3;
}

- (float)smallStrokeRadiusMultiplier
{
  v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier);
  swift_beginAccess();
  return *v2;
}

- (void)setSmallStrokeRadiusMultiplier:(float)a3
{
  v4 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_smallStrokeRadiusMultiplier);
  swift_beginAccess();
  float *v4 = a3;
}

- (BOOL)forceSmallStrokeRadiusMultiplier
{
  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_forceSmallStrokeRadiusMultiplier;
  swift_beginAccess();
  return *v2;
}

- (void)setForceSmallStrokeRadiusMultiplier:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_forceSmallStrokeRadiusMultiplier;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isPuffy
{
  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isPuffy;
  swift_beginAccess();
  return *v2;
}

- (void)setIsPuffy:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isPuffy;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (float)normalsRadius
{
  v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_normalsRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setNormalsRadius:(float)a3
{
  v4 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_normalsRadius);
  swift_beginAccess();
  float *v4 = a3;
}

- (int)iridescence
{
  v2 = (int *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_iridescence);
  swift_beginAccess();
  return *v2;
}

- (void)setIridescence:(int)a3
{
  v4 = (int *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_iridescence);
  swift_beginAccess();
  int *v4 = a3;
}

- (BOOL)applyIridescenceBeforeStroke
{
  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_applyIridescenceBeforeStroke;
  swift_beginAccess();
  return *v2;
}

- (void)setApplyIridescenceBeforeStroke:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_applyIridescenceBeforeStroke;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isBrushed
{
  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isBrushed;
  swift_beginAccess();
  return *v2;
}

- (void)setIsBrushed:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isBrushed;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)applyBrushBeforeStroke
{
  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_applyBrushBeforeStroke;
  swift_beginAccess();
  return *v2;
}

- (void)setApplyBrushBeforeStroke:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_applyBrushBeforeStroke;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (float)shadowRadius
{
  v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_shadowRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setShadowRadius:(float)a3
{
  v4 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_shadowRadius);
  swift_beginAccess();
  float *v4 = a3;
}

- (float)shadowAlpha
{
  v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_shadowAlpha);
  swift_beginAccess();
  return *v2;
}

- (void)setShadowAlpha:(float)a3
{
  v4 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_shadowAlpha);
  swift_beginAccess();
  float *v4 = a3;
}

- (double)shadowOffset
{
  uint64_t v1 = a1 + OBJC_IVAR____VKStickerEffectInternal_shadowOffset;
  swift_beginAccess();
  return *(double *)v1;
}

- (void)setShadowOffset:(_VKStickerEffectInternal *)self
{
  uint64_t v3 = v2;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____VKStickerEffectInternal_shadowOffset);
  swift_beginAccess();
  void *v4 = v3;
}

- (double)shadowParallax
{
  uint64_t v1 = a1 + OBJC_IVAR____VKStickerEffectInternal_shadowParallax;
  swift_beginAccess();
  return *(double *)v1;
}

- (void)setShadowParallax:(_VKStickerEffectInternal *)self
{
  uint64_t v3 = v2;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____VKStickerEffectInternal_shadowParallax);
  swift_beginAccess();
  void *v4 = v3;
}

- (float)smallShadowSizeMultiplier
{
  uint64_t v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier);
  swift_beginAccess();
  return *v2;
}

- (void)setSmallShadowSizeMultiplier:(float)a3
{
  v4 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_smallShadowSizeMultiplier);
  swift_beginAccess();
  float *v4 = a3;
}

- (float)smallShadowAlphaMultiplier
{
  uint64_t v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier);
  swift_beginAccess();
  return *v2;
}

- (void)setSmallShadowAlphaMultiplier:(float)a3
{
  v4 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectInternal_smallShadowAlphaMultiplier);
  swift_beginAccess();
  float *v4 = a3;
}

- (BOOL)isComicEnabled
{
  uint64_t v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isComicEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsComicEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isComicEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)requiresDeviceMotion
{
  return sub_260D5BC6C() & 1;
}

- (BOOL)isCurlEnabled
{
  uint64_t v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsCurlEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectInternal_isCurlEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)applyComicParameters
{
  uint64_t v2 = qword_26A8E48D8;
  uint64_t v3 = self;
  if (v2 != -1)
  {
    v8 = v3;
    swift_once();
    uint64_t v3 = v8;
  }
  uint64_t v4 = qword_26A8E53B8;
  v5 = (char *)v3 + OBJC_IVAR____VKStickerEffectInternal_comicParameters;
  long long v6 = unk_26A8E539C;
  uint64_t v7 = unk_26A8E53AC;
  char *v5 = byte_26A8E5398;
  *(_OWORD *)(v5 + 4) = v6;
  *(void *)(v5 + 20) = v7;
  *((void *)v5 + 4) = v4;
}

- (void)applyComicInkParameters
{
  uint64_t v2 = qword_26A8E48E0;
  uint64_t v3 = self;
  if (v2 != -1)
  {
    v8 = v3;
    swift_once();
    uint64_t v3 = v8;
  }
  uint64_t v4 = qword_26A8E53E0;
  v5 = (char *)v3 + OBJC_IVAR____VKStickerEffectInternal_comicParameters;
  long long v6 = *(_OWORD *)&algn_26A8E53C1[3];
  uint64_t v7 = *(void *)&algn_26A8E53C1[19];
  char *v5 = byte_26A8E53C0;
  *(_OWORD *)(v5 + 4) = v6;
  *(void *)(v5 + 20) = v7;
  *((void *)v5 + 4) = v4;
}

+ (_VKStickerEffectInternal)noneEffect
{
  return (_VKStickerEffectInternal *)sub_260D5CB38((uint64_t)a1, (uint64_t)a2, &qword_26A8E48E8, (void **)&qword_26A8E4B50);
}

+ (_VKStickerEffectInternal)strokeEffect
{
  return (_VKStickerEffectInternal *)sub_260D5CB38((uint64_t)a1, (uint64_t)a2, &qword_26A8E48F0, (void **)&qword_26A8E4B58);
}

+ (_VKStickerEffectInternal)comicEffect
{
  return (_VKStickerEffectInternal *)sub_260D5CB38((uint64_t)a1, (uint64_t)a2, &qword_26A8E48F8, (void **)&qword_26A8E4B60);
}

+ (_VKStickerEffectInternal)puffyEffect
{
  return (_VKStickerEffectInternal *)sub_260D5CB38((uint64_t)a1, (uint64_t)a2, &qword_26A8E4900, (void **)&qword_26A8E4B68);
}

+ (_VKStickerEffectInternal)iridescentEffect
{
  return (_VKStickerEffectInternal *)sub_260D5CB38((uint64_t)a1, (uint64_t)a2, &qword_26A8E4908, (void **)&qword_26A8E4B70);
}

- (_VKStickerEffectInternal)init
{
  return (_VKStickerEffectInternal *)StickerEffect.init()();
}

@end