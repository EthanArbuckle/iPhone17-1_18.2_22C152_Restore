@interface PDAnimationInfoData
- (PDAnimationInfoData)initWithTarget:(id)a3 presetClass:(int)a4 presetId:(int)a5 triggerType:(int)a6 iterateType:(int)a7 delay:(double)a8 direction:(double)a9 order:(unsigned int)a10 groupId:(id)a11 build:(id)a12;
- (id)build;
- (id)data;
- (id)drawable;
- (unsigned)order;
@end

@implementation PDAnimationInfoData

- (PDAnimationInfoData)initWithTarget:(id)a3 presetClass:(int)a4 presetId:(int)a5 triggerType:(int)a6 iterateType:(int)a7 delay:(double)a8 direction:(double)a9 order:(unsigned int)a10 groupId:(id)a11 build:(id)a12
{
  uint64_t v15 = *(void *)&a7;
  uint64_t v16 = *(void *)&a6;
  uint64_t v17 = *(void *)&a5;
  uint64_t v18 = *(void *)&a4;
  id v20 = a3;
  id v21 = a11;
  id v22 = a12;
  v30.receiver = self;
  v30.super_class = (Class)PDAnimationInfoData;
  v23 = [(PDAnimationInfoData *)&v30 init];
  v24 = v23;
  if (v23)
  {
    v23->mOrder = a10;
    objc_storeStrong((id *)&v23->mBuild, a12);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v25 = [v20 drawable];
      mDrawable = v24->mDrawable;
      v24->mDrawable = (OADDrawable *)v25;
    }
    v27 = +[PDSequentialTimeNode newSequentialTimeNodeGroupForAnimationInfoWithClass:objc_opt_class() target:v20];
    mSequentialTimeNodeData = v24->mSequentialTimeNodeData;
    v24->mSequentialTimeNodeData = v27;

    [(PDSequentialTimeNode *)v24->mSequentialTimeNodeData setPresetClass:v18];
    [(PDSequentialTimeNode *)v24->mSequentialTimeNodeData setPresetId:v17];
    [(PDSequentialTimeNode *)v24->mSequentialTimeNodeData setTriggerType:v16];
    [(PDSequentialTimeNode *)v24->mSequentialTimeNodeData setIterateType:v15];
    [(PDSequentialTimeNode *)v24->mSequentialTimeNodeData setDirection:a9];
    [(PDSequentialTimeNode *)v24->mSequentialTimeNodeData setTarget:v20];
    [(PDSequentialTimeNode *)v24->mSequentialTimeNodeData setGroupId:v21];
    if (v16 != 1) {
      [(PDSequentialTimeNode *)v24->mSequentialTimeNodeData setDelay:a8];
    }
  }

  return v24;
}

- (unsigned)order
{
  return self->mOrder;
}

- (id)build
{
  return self->mBuild;
}

- (id)data
{
  return self->mSequentialTimeNodeData;
}

- (id)drawable
{
  return self->mDrawable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDrawable, 0);
  objc_storeStrong((id *)&self->mSequentialTimeNodeData, 0);
  objc_storeStrong((id *)&self->mBuild, 0);
}

@end