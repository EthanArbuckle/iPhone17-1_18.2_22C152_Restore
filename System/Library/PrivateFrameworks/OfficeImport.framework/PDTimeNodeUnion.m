@interface PDTimeNodeUnion
- (PDTimeNodeUnion)init;
- (id)audio;
- (id)behavior;
- (id)cmdBehavior;
- (id)colorBehavior;
- (id)commonBehavior;
- (id)description;
- (id)effectBehavior;
- (id)motionBehavior;
- (id)parallel;
- (id)rotateBehavior;
- (id)scaleBehavior;
- (id)sequential;
- (id)timeBehavior;
- (id)video;
- (void)setAudio:(id)a3;
- (void)setBehavior:(id)a3;
- (void)setCmdBehavior:(id)a3;
- (void)setColorBehavior:(id)a3;
- (void)setEffectBehavior:(id)a3;
- (void)setMotionBehavior:(id)a3;
- (void)setParallel:(id)a3;
- (void)setRotateBehavior:(id)a3;
- (void)setScaleBehavior:(id)a3;
- (void)setSequential:(id)a3;
- (void)setTimeBehavior:(id)a3;
- (void)setVideo:(id)a3;
@end

@implementation PDTimeNodeUnion

- (PDTimeNodeUnion)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDTimeNodeUnion;
  return [(PDTimeNodeUnion *)&v3 init];
}

- (void)setMotionBehavior:(id)a3
{
}

- (void)setParallel:(id)a3
{
}

- (void)setSequential:(id)a3
{
}

- (void)setBehavior:(id)a3
{
}

- (void)setEffectBehavior:(id)a3
{
}

- (void)setTimeBehavior:(id)a3
{
}

- (void)setScaleBehavior:(id)a3
{
}

- (void)setRotateBehavior:(id)a3
{
}

- (void)setCmdBehavior:(id)a3
{
}

- (void)setAudio:(id)a3
{
}

- (void)setVideo:(id)a3
{
}

- (id)commonBehavior
{
  mTimeBehavior = self->mTimeBehavior;
  if (mTimeBehavior
    || (mTimeBehavior = self->mEffectBehavior) != 0
    || (mTimeBehavior = self->mMotionBehavior) != 0
    || (mTimeBehavior = self->mRotateBehavior) != 0
    || (mTimeBehavior = self->mScaleBehavior) != 0
    || (mTimeBehavior = self->mSetBehavior) != 0
    || (mTimeBehavior = self->mCmdBehavior) != 0)
  {
    id v3 = mTimeBehavior;
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)timeBehavior
{
  return self->mTimeBehavior;
}

- (id)effectBehavior
{
  return self->mEffectBehavior;
}

- (id)motionBehavior
{
  return self->mMotionBehavior;
}

- (id)rotateBehavior
{
  return self->mRotateBehavior;
}

- (id)scaleBehavior
{
  return self->mScaleBehavior;
}

- (id)colorBehavior
{
  return self->mColorBehavior;
}

- (void)setColorBehavior:(id)a3
{
}

- (id)audio
{
  return self->mAudio;
}

- (id)video
{
  return self->mVideo;
}

- (id)parallel
{
  return self->mParallelTimeNodeGroup;
}

- (id)sequential
{
  return self->mSequentialTimeNodeGroup;
}

- (id)behavior
{
  return self->mSetBehavior;
}

- (id)cmdBehavior
{
  return self->mCmdBehavior;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDTimeNodeUnion;
  v2 = [(PDTimeNodeUnion *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCmdBehavior, 0);
  objc_storeStrong((id *)&self->mSetBehavior, 0);
  objc_storeStrong((id *)&self->mSequentialTimeNodeGroup, 0);
  objc_storeStrong((id *)&self->mParallelTimeNodeGroup, 0);
  objc_storeStrong((id *)&self->mVideo, 0);
  objc_storeStrong((id *)&self->mAudio, 0);
  objc_storeStrong((id *)&self->mColorBehavior, 0);
  objc_storeStrong((id *)&self->mScaleBehavior, 0);
  objc_storeStrong((id *)&self->mRotateBehavior, 0);
  objc_storeStrong((id *)&self->mMotionBehavior, 0);
  objc_storeStrong((id *)&self->mEffectBehavior, 0);
  objc_storeStrong((id *)&self->mTimeBehavior, 0);
}

@end