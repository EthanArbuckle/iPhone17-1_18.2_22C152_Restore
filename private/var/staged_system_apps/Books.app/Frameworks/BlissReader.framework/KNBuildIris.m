@interface KNBuildIris
+ (BOOL)isTransition;
+ (BOOL)requiresSingleTexturePerStage;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
- (CGRect)frameOfEffectWithContext:(id)a3;
- (void)animationWillBeginWithContext:(id)a3;
- (void)metalAnimationWillBeginWithContext:(id)a3;
- (void)metalPrepareAnimationWithContext:(id)a3;
- (void)renderFrameWithContext:(id)a3;
@end

@implementation KNBuildIris

+ (BOOL)isTransition
{
  return 0;
}

+ (id)supportedTypes
{
  return &off_4999F8;
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"anim-icons-builds-iris";
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  [a3 drawableFrame];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4 = a3;
  double v5 = [v4 animatedBuild];
  self->super._isBuildOut = [v5 isBuildIn] ^ 1;

  v6.receiver = self;
  v6.super_class = (Class)KNBuildIris;
  [(KNIrisBase *)&v6 animationWillBeginWithContext:v4];
  [(KNBuildIris *)self metalAnimationWillBeginWithContext:v4];
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  id v4 = a3;
  double v5 = [v4 animatedBuild];
  self->super._isBuildOut = [v5 isBuildIn] ^ 1;

  v6.receiver = self;
  v6.super_class = (Class)KNBuildIris;
  [(KNIrisBase *)&v6 animationWillBeginWithContext:v4];
}

- (void)metalAnimationWillBeginWithContext:(id)a3
{
  [(KNAnimationEffect *)self mvpMatrixWithContext:a3];
  uint64_t v4 = 0;
  float32x4_t v5 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)0), (float64x2_t)0);
  do
  {
    objc_super v6 = &self->super._anon_40[v4];
    *(float32x4_t *)objc_super v6 = v5;
    *((float32x4_t *)v6 + 1) = v5;
    *((float32x4_t *)v6 + 2) = v5;
    *((float32x4_t *)v6 + 3) = v5;
    v7 = &self->super._anon_130[v4 + 32];
    *((float32x4_t *)v7 - 2) = v5;
    *((float32x4_t *)v7 - 1) = v5;
    v4 += 80;
    *(float32x4_t *)v7 = v5;
    *((float32x4_t *)v7 + 1) = v5;
  }
  while (v4 != 240);
  *(float32x4_t *)self->super._anon_280 = v5;
  *(float32x4_t *)&self->super._anon_280[16] = v5;
  *(float32x4_t *)&self->super._anon_280[32] = v5;
  *(float32x4_t *)&self->super._anon_280[48] = v5;
}

- (void)renderFrameWithContext:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)KNBuildIris;
  [(KNIrisBase *)&v3 renderFrameWithContext:a3];
}

@end