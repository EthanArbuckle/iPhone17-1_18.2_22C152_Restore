@interface MRTransitionPhaseInOut
- (BOOL)controlsLayersTime;
- (BOOL)isAlphaFriendly;
- (BOOL)isInfinite;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)isSplit;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
@end

@implementation MRTransitionPhaseInOut

- (BOOL)isNative3D
{
  unsigned int v3 = [(MRLayer *)self->super.mSourceLayer isActivated];
  uint64_t v4 = 32;
  if (v3) {
    uint64_t v4 = 24;
  }
  v5 = *(Class *)((char *)&self->super.super.isa + v4);
  return [v5 isNative3D];
}

- (BOOL)isOpaque
{
  unsigned int v3 = [(MRLayer *)self->super.mSourceLayer isActivated];
  uint64_t v4 = 32;
  if (v3) {
    uint64_t v4 = 24;
  }
  v5 = *(Class *)((char *)&self->super.super.isa + v4);
  return [v5 isOpaque];
}

- (BOOL)isAlphaFriendly
{
  unsigned int v3 = [(MRLayer *)self->super.mSourceLayer isActivated];
  uint64_t v4 = 32;
  if (v3) {
    uint64_t v4 = 24;
  }
  v5 = *(Class *)((char *)&self->super.super.isa + v4);
  return [v5 isAlphaFriendly];
}

- (BOOL)isInfinite
{
  unsigned int v3 = [(MRLayer *)self->super.mSourceLayer isActivated];
  uint64_t v4 = 32;
  if (v3) {
    uint64_t v4 = 24;
  }
  v5 = *(Class *)((char *)&self->super.super.isa + v4);
  return [v5 isInfinite];
}

- (BOOL)isSplit
{
  return 1;
}

- (BOOL)controlsLayersTime
{
  return 1;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->super._progress = a3;
  [(MRLayerClock *)[(MRLayer *)self->super.mSourceLayer clock] phaseOutDuration];
  double v10 = v9;
  [(MRLayerClock *)[(MRLayer *)self->super.mTargetLayer clock] phaseInDuration];
  double v12 = v10 + v11;
  double v13 = v10 / (v10 + v11);
  [(MRLayer *)self->super.mSourceLayer duration];
  double v15 = v10 - v12 * a3;
  if (v15 < 0.001) {
    double v15 = 0.001;
  }
  [(MRLayerClock *)[(MRLayer *)self->super.mSourceLayer clock] setContainerTime:v14 - v15];
  [(MRLayerClock *)[(MRLayer *)self->super.mTargetLayer clock] setContainerTime:-(v10 - v12 * a3)];
  mSourceLayer = self->super.mSourceLayer;
  [(MRLayerClock *)[(MRLayer *)mSourceLayer clock] externalTime];
  unsigned __int8 v17 = -[MRLayer prerenderForTime:inContext:withArguments:](mSourceLayer, "prerenderForTime:inContext:withArguments:", a4, a5);
  mTargetLayer = self->super.mTargetLayer;
  [(MRLayerClock *)[(MRLayer *)mTargetLayer clock] externalTime];
  BOOL result = -[MRLayer prerenderForTime:inContext:withArguments:](mTargetLayer, "prerenderForTime:inContext:withArguments:", a4, a5);
  if (v13 > a3) {
    return v17;
  }
  return result;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  [(MRLayerClock *)[(MRLayer *)self->super.mSourceLayer clock] phaseOutDuration];
  double v10 = v9;
  [(MRLayerClock *)[(MRLayer *)self->super.mTargetLayer clock] phaseInDuration];
  double v12 = v10 + v11;
  [(MRLayerClock *)[(MRLayer *)self->super.mSourceLayer clock] phaseOutDuration];
  uint64_t v14 = 32;
  if (v13 / v12 > a3) {
    uint64_t v14 = 24;
  }
  double v15 = *(Class *)((char *)&self->super.super.isa + v14);
  objc_msgSend(objc_msgSend(v15, "clock"), "externalTime");
  objc_msgSend(v15, "renderAtTime:inContext:withArguments:", a4, a5);
}

- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  [(MRLayerClock *)[(MRLayer *)self->super.mSourceLayer clock] phaseOutDuration];
  double v10 = v9;
  [(MRLayerClock *)[(MRLayer *)self->super.mTargetLayer clock] phaseInDuration];
  double v12 = v10 + v11;
  [(MRLayerClock *)[(MRLayer *)self->super.mSourceLayer clock] phaseOutDuration];
  uint64_t v14 = 32;
  if (v13 / v12 > a3) {
    uint64_t v14 = 24;
  }
  double v15 = *(Class *)((char *)&self->super.super.isa + v14);
  objc_msgSend(objc_msgSend(v15, "clock"), "externalTime");
  return objc_msgSend(v15, "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5);
}

@end