@interface PXStoryDummyStyle
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration;
- ($D9ACF32088E97DD3D62E5CBFAE4B0A27)transitionInfo;
- (BOOL)isCustomized;
- (CGPoint)kenBurnsRelativeTransformOrigin;
- (NSArray)allowedClipCompositionsInLandscape;
- (NSArray)allowedClipCompositionsInPortrait;
- (NSString)originalColorGradeCategory;
- (PXAudioCueSource)cueSource;
- (PXStoryDummyStyle)init;
- (PXStoryDummyStyle)initWithConfiguration:(id)a3;
- (PXStorySongResource)songResource;
- (double)defaultSegmentDuration;
- (double)kenBurnsDistance;
- (double)kenBurnsRotationInDegrees;
- (double)kenBurnsScale;
- (double)separatorPanDistance;
- (double)separatorRotationAngle;
- (id)createRandomNumberGenerators;
- (id)timelineStyleWithSpec:(id)a3 resourcesDataSource:(id)a4 randomNumberGenerators:(id)a5 errorReporter:(id)a6;
- (int64_t)cropMode;
- (int64_t)cropVerticalContentMode;
- (int64_t)customColorGradeKind;
- (int64_t)oneUpKenBurnsKind;
- (int64_t)threeUpKenBurnsKind;
- (int64_t)threeUpSeparatorEffectKind;
- (int64_t)twoUpKenBurnsKind;
- (int64_t)twoUpSeparatorEffectKind;
- (unsigned)kenBurnsPanDirection;
- (void)setAllowedClipCompositionsInLandscape:(id)a3;
- (void)setAllowedClipCompositionsInPortrait:(id)a3;
- (void)setCropMode:(int64_t)a3;
- (void)setCropVerticalContentMode:(int64_t)a3;
- (void)setDefaultSegmentDuration:(double)a3;
- (void)setKenBurnsDistance:(double)a3;
- (void)setKenBurnsPanDirection:(unsigned int)a3;
- (void)setKenBurnsRelativeTransformOrigin:(CGPoint)a3;
- (void)setKenBurnsRotationInDegrees:(double)a3;
- (void)setKenBurnsScale:(double)a3;
- (void)setOneUpKenBurnsKind:(int64_t)a3;
- (void)setOutroDuration:(id *)a3;
- (void)setSeparatorPanDistance:(double)a3;
- (void)setSeparatorRotationAngle:(double)a3;
- (void)setThreeUpKenBurnsKind:(int64_t)a3;
- (void)setThreeUpSeparatorEffectKind:(int64_t)a3;
- (void)setTransitionInfo:(id *)a3;
- (void)setTwoUpKenBurnsKind:(int64_t)a3;
- (void)setTwoUpSeparatorEffectKind:(int64_t)a3;
@end

@implementation PXStoryDummyStyle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songResource, 0);
  objc_storeStrong((id *)&self->_originalColorGradeCategory, 0);
  objc_storeStrong((id *)&self->_allowedClipCompositionsInLandscape, 0);
  objc_storeStrong((id *)&self->_allowedClipCompositionsInPortrait, 0);
  objc_storeStrong((id *)&self->_cueSource, 0);
}

- (PXStorySongResource)songResource
{
  return self->_songResource;
}

- (int64_t)customColorGradeKind
{
  return self->_customColorGradeKind;
}

- (NSString)originalColorGradeCategory
{
  return self->_originalColorGradeCategory;
}

- (BOOL)isCustomized
{
  return self->_isCustomized;
}

- (void)setTransitionInfo:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2.var1;
  *(void *)&self->_transitionInfo.fallbackFromTransitionKind = *(void *)&a3->var3;
  *(_OWORD *)&self->_transitionInfo.orderOutTransition = v3;
  *(_OWORD *)&self->_transitionInfo.duration.timescale = v4;
}

- ($D9ACF32088E97DD3D62E5CBFAE4B0A27)transitionInfo
{
  long long v3 = *(_OWORD *)&self[4].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[4].var2.var1;
  *(_OWORD *)&retstr->var2.var1 = v3;
  *(void *)&retstr->var3 = *(void *)&self[5].var0;
  return self;
}

- (void)setSeparatorRotationAngle:(double)a3
{
  self->_separatorRotationAngle = a3;
}

- (double)separatorRotationAngle
{
  return self->_separatorRotationAngle;
}

- (void)setSeparatorPanDistance:(double)a3
{
  self->_separatorPanDistance = a3;
}

- (double)separatorPanDistance
{
  return self->_separatorPanDistance;
}

- (void)setThreeUpSeparatorEffectKind:(int64_t)a3
{
  self->_threeUpSeparatorEffectKind = a3;
}

- (int64_t)threeUpSeparatorEffectKind
{
  return self->_threeUpSeparatorEffectKind;
}

- (void)setTwoUpSeparatorEffectKind:(int64_t)a3
{
  self->_twoUpSeparatorEffectKind = a3;
}

- (int64_t)twoUpSeparatorEffectKind
{
  return self->_twoUpSeparatorEffectKind;
}

- (void)setKenBurnsRotationInDegrees:(double)a3
{
  self->_kenBurnsRotationInDegrees = a3;
}

- (double)kenBurnsRotationInDegrees
{
  return self->_kenBurnsRotationInDegrees;
}

- (void)setKenBurnsRelativeTransformOrigin:(CGPoint)a3
{
  self->_kenBurnsRelativeTransformOrigin = a3;
}

- (CGPoint)kenBurnsRelativeTransformOrigin
{
  double x = self->_kenBurnsRelativeTransformOrigin.x;
  double y = self->_kenBurnsRelativeTransformOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setKenBurnsDistance:(double)a3
{
  self->_kenBurnsDistance = a3;
}

- (double)kenBurnsDistance
{
  return self->_kenBurnsDistance;
}

- (void)setKenBurnsPanDirection:(unsigned int)a3
{
  self->_kenBurnsPanDirection = a3;
}

- (unsigned)kenBurnsPanDirection
{
  return self->_kenBurnsPanDirection;
}

- (void)setKenBurnsScale:(double)a3
{
  self->_kenBurnsScale = a3;
}

- (double)kenBurnsScale
{
  return self->_kenBurnsScale;
}

- (void)setThreeUpKenBurnsKind:(int64_t)a3
{
  self->_threeUpKenBurnsKind = a3;
}

- (int64_t)threeUpKenBurnsKind
{
  return self->_threeUpKenBurnsKind;
}

- (void)setTwoUpKenBurnsKind:(int64_t)a3
{
  self->_twoUpKenBurnsKind = a3;
}

- (int64_t)twoUpKenBurnsKind
{
  return self->_twoUpKenBurnsKind;
}

- (void)setOneUpKenBurnsKind:(int64_t)a3
{
  self->_oneUpKenBurnsKind = a3;
}

- (int64_t)oneUpKenBurnsKind
{
  return self->_oneUpKenBurnsKind;
}

- (void)setAllowedClipCompositionsInLandscape:(id)a3
{
}

- (NSArray)allowedClipCompositionsInLandscape
{
  return self->_allowedClipCompositionsInLandscape;
}

- (void)setAllowedClipCompositionsInPortrait:(id)a3
{
}

- (NSArray)allowedClipCompositionsInPortrait
{
  return self->_allowedClipCompositionsInPortrait;
}

- (void)setOutroDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_outroDuration.epoch = a3->var3;
  *(_OWORD *)&self->_outroDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 184);
  return self;
}

- (PXAudioCueSource)cueSource
{
  return self->_cueSource;
}

- (void)setCropMode:(int64_t)a3
{
  self->_cropMode = a3;
}

- (int64_t)cropMode
{
  return self->_cropMode;
}

- (void)setCropVerticalContentMode:(int64_t)a3
{
  self->_cropVerticalContentMode = a3;
}

- (int64_t)cropVerticalContentMode
{
  return self->_cropVerticalContentMode;
}

- (void)setDefaultSegmentDuration:(double)a3
{
  self->_defaultSegmentDuration = a3;
}

- (double)defaultSegmentDuration
{
  return self->_defaultSegmentDuration;
}

- (id)timelineStyleWithSpec:(id)a3 resourcesDataSource:(id)a4 randomNumberGenerators:(id)a5 errorReporter:(id)a6
{
}

- (id)createRandomNumberGenerators
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (PXStoryDummyStyle)initWithConfiguration:(id)a3
{
  long long v4 = (void (**)(id, void))a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryDummyStyle;
  v5 = [(PXStoryDummyStyle *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v5->_cropVerticalContentMode = 0;
    v5->_cropMode = 0;
    v5->_defaultSegmentDuration = 3.0;
    CMTimeMakeWithSeconds(&v8, 1.5, 600);
    v6->_outroDuration = ($95D729B680665BEAEFA1D6FCA8238556)v8;
    ((void (**)(id, PXStoryDummyStyle *))v4)[2](v4, v6);
  }

  return v6;
}

- (PXStoryDummyStyle)init
{
  return [(PXStoryDummyStyle *)self initWithConfiguration:&__block_literal_global_298622];
}

@end