@interface KNBuildWipe
+ (BOOL)isTransition;
+ (BOOL)requiresSingleTexturePerStage;
+ (id)supportedTypes;
- (CGRect)frameOfEffectWithFrame:(CGRect)result context:(id)a4;
- (void)animationWillBeginWithContext:(id)a3;
- (void)metalAnimationWillBeginWithContext:(id)a3;
- (void)metalPrepareAnimationWithContext:(id)a3;
- (void)renderFrameWithContext:(id)a3;
@end

@implementation KNBuildWipe

+ (BOOL)isTransition
{
  return 0;
}

+ (id)supportedTypes
{
  return &off_4998D8;
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

- (CGRect)frameOfEffectWithFrame:(CGRect)result context:(id)a4
{
  self->super._frameRect = result;
  return result;
}

- (void)animationWillBeginWithContext:(id)a3
{
  self->super._isBuildOut = objc_msgSend(objc_msgSend(a3, "animatedBuild"), "isBuildIn") ^ 1;
  v5.receiver = self;
  v5.super_class = (Class)KNBuildWipe;
  [(KNWipeBase *)&v5 animationWillBeginWithContext:a3];
}

- (void)renderFrameWithContext:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)KNBuildWipe;
  [(KNWipeBase *)&v3 renderFrameWithContext:a3];
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  self->super._isBuildOut = objc_msgSend(objc_msgSend(a3, "animatedBuild"), "isBuildIn") ^ 1;

  [(KNBuildWipe *)self animationWillBeginWithContext:a3];
}

- (void)metalAnimationWillBeginWithContext:(id)a3
{
  if (self)
  {
    [(KNAnimationEffect *)self mvpMatrixWithContext:a3];
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
  }
  mWipeDataBuffer = self->super.mWipeDataBuffer;
  v5[4] = v10;
  v5[5] = v11;
  v5[6] = v12;
  v5[7] = v13;
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  v5[3] = v9;
  [(KNWipeDataBuffer *)mWipeDataBuffer setMVPMatrix:v5];
}

@end