@interface PDAnimationCache
+ (id)createAnimationInfoDataForCacheItem:(id)a3 order:(unsigned int)a4;
+ (void)loadAnimationCache:(id)a3 pdAnimation:(id)a4 state:(id)a5;
+ (void)mapAnimationInfo:(id)a3 cacheData:(id)a4 state:(id)a5;
+ (void)mapCommonData:(id)a3 cacheData:(id)a4 state:(id)a5;
- (BOOL)hasDelay;
- (BOOL)hasDirection;
- (BOOL)hasDuration;
- (BOOL)hasPartCount;
- (BOOL)hasValue;
- (BOOL)isHead;
- (NSString)groupId;
- (PDAnimateMotionBehavior)motionPath;
- (PDAnimationCache)initWithAnimationInfo:(id)a3;
- (PDAnimationTarget)target;
- (PDBuild)build;
- (double)delay;
- (double)direction;
- (double)duration;
- (double)value;
- (int)iterateType;
- (int)level;
- (int)nodeType;
- (int)partCount;
- (int)presetClass;
- (int)presetId;
- (int)presetSubType;
- (void)setBuild:(id)a3;
- (void)setDelay:(double)a3;
- (void)setDirection:(double)a3;
- (void)setDuration:(double)a3;
- (void)setGroupId:(id)a3;
- (void)setHasDelay:(BOOL)a3;
- (void)setHasDirection:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasPartCount:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setIsHead:(BOOL)a3;
- (void)setIterateType:(int)a3;
- (void)setLevel:(int)a3;
- (void)setMotionPath:(id)a3;
- (void)setNodeType:(int)a3;
- (void)setPartCount:(int)a3;
- (void)setPresetClass:(int)a3;
- (void)setPresetId:(int)a3;
- (void)setPresetSubType:(int)a3;
- (void)setTarget:(id)a3;
- (void)setValue:(double)a3;
@end

@implementation PDAnimationCache

- (PDAnimationCache)initWithAnimationInfo:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDAnimationCache;
  v5 = [(PDAnimationCache *)&v13 init];
  if (v5)
  {
    v6 = [v4 target];
    [(PDAnimationCache *)v5 setTarget:v6];

    v7 = [v4 motionPath];
    [(PDAnimationCache *)v5 setMotionPath:v7];

    v8 = [v4 groupId];
    [(PDAnimationCache *)v5 setGroupId:v8];

    v9 = [v4 build];
    [(PDAnimationCache *)v5 setBuild:v9];

    v5->mNodeType = [v4 nodeType];
    v5->mPresetId = [v4 presetId];
    v5->mPresetSubType = [v4 presetSubType];
    v5->mPresetClass = [v4 presetClass];
    v5->mIterateType = [v4 iterateType];
    if ([v4 hasDelay])
    {
      [v4 delay];
      -[PDAnimationCache setDelay:](v5, "setDelay:");
    }
    if ([v4 hasDirection])
    {
      [v4 direction];
      -[PDAnimationCache setDirection:](v5, "setDirection:");
    }
    if ([v4 hasDuration])
    {
      [v4 duration];
      -[PDAnimationCache setDuration:](v5, "setDuration:");
    }
    if ([v4 hasPartCount]) {
      -[PDAnimationCache setPartCount:](v5, "setPartCount:", [v4 partCount]);
    }
    if ([v4 hasValue])
    {
      [v4 value];
      -[PDAnimationCache setValue:](v5, "setValue:");
    }
    v5->mIsHead = [v4 isHead];
    v5->mLevel = [v4 level];
    uint64_t v10 = [v4 groupId];
    mGroupId = v5->mGroupId;
    v5->mGroupId = (NSString *)v10;
  }
  return v5;
}

- (void)setDelay:(double)a3
{
  self->mDelay = a3;
  self->mHasDelay = 1;
}

- (void)setDuration:(double)a3
{
  self->mDuration = a3;
  self->mHasDuration = 1;
}

- (void)setDirection:(double)a3
{
  self->mDirection = a3;
  self->mHasDirection = 1;
}

- (void)setPartCount:(int)a3
{
  self->mPartCount = a3;
  self->mHasPartCount = 1;
}

- (void)setValue:(double)a3
{
  self->mValue = a3;
  self->mHasValue = 1;
}

+ (void)loadAnimationCache:(id)a3 pdAnimation:(id)a4 state:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v21 = a5;
  v9 = [v8 rootTimeNode];
  if (v9) {
    [a1 mapCommonData:v9 cacheData:v22 state:v21];
  }
  uint64_t v10 = [v8 buildMap];
  if (v10)
  {
    for (unsigned int i = 0; ; unsigned int i = v12 + 1)
    {
      unsigned int v12 = i;
      if ([v22 count] <= (unint64_t)i) {
        break;
      }
      objc_super v13 = [v22 objectAtIndex:i];
      v14 = [v13 target];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [v13 target];
        v16 = [v15 drawable];

        if (!v16) {
          goto LABEL_13;
        }
        v17 = [PDBuildMapKey alloc];
        v18 = [v13 groupId];
        v19 = [(PDBuildMapKey *)v17 initWithDrawable:v16 groupId:v18];

        v20 = [v10 objectForKey:v19];
        if (v20) {
          [v13 setBuild:v20];
        }
      }
      else
      {
        v16 = v14;
      }

LABEL_13:
    }
  }
}

+ (id)createAnimationInfoDataForCacheItem:(id)a3 order:(unsigned int)a4
{
  id v4 = a3;
  v5 = [v4 target];

  if (v5)
  {
    v6 = [PDAnimationInfoData alloc];
    v7 = [v4 target];
    uint64_t v8 = [v4 presetClass];
    uint64_t v9 = [v4 presetId];
    uint64_t v10 = [v4 nodeType];
    uint64_t v11 = [v4 iterateType];
    [v4 delay];
    double v13 = v12;
    int v14 = [v4 presetSubType];
    v15 = [v4 groupId];
    v16 = [v4 build];
    v17 = [(PDAnimationInfoData *)v6 initWithTarget:v7 presetClass:v8 presetId:v9 triggerType:v10 iterateType:v11 delay:a4 direction:v13 order:(double)v14 groupId:v15 build:v16];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (PDAnimationTarget)target
{
  return self->mTarget;
}

- (void)setTarget:(id)a3
{
}

- (int)nodeType
{
  return self->mNodeType;
}

- (void)setNodeType:(int)a3
{
  self->mNodeType = a3;
}

- (int)presetId
{
  return self->mPresetId;
}

- (void)setPresetId:(int)a3
{
  self->mPresetId = a3;
}

- (int)presetSubType
{
  return self->mPresetSubType;
}

- (void)setPresetSubType:(int)a3
{
  self->mPresetSubType = a3;
}

- (int)presetClass
{
  return self->mPresetClass;
}

- (void)setPresetClass:(int)a3
{
  self->mPresetClass = a3;
}

- (int)iterateType
{
  return self->mIterateType;
}

- (void)setIterateType:(int)a3
{
  self->mIterateType = a3;
}

- (BOOL)hasDelay
{
  return self->mHasDelay;
}

- (void)setHasDelay:(BOOL)a3
{
  self->mHasDelay = a3;
}

- (double)delay
{
  return self->mDelay;
}

- (BOOL)hasDuration
{
  return self->mHasDuration;
}

- (void)setHasDuration:(BOOL)a3
{
  self->mHasDuration = a3;
}

- (double)duration
{
  return self->mDuration;
}

- (BOOL)hasDirection
{
  return self->mHasDirection;
}

- (void)setHasDirection:(BOOL)a3
{
  self->mHasDirection = a3;
}

- (double)direction
{
  return self->mDirection;
}

- (BOOL)hasPartCount
{
  return self->mHasPartCount;
}

- (void)setHasPartCount:(BOOL)a3
{
  self->mHasPartCount = a3;
}

- (int)partCount
{
  return self->mPartCount;
}

- (PDAnimateMotionBehavior)motionPath
{
  return self->mMotionPath;
}

- (void)setMotionPath:(id)a3
{
}

- (BOOL)hasValue
{
  return self->mHasValue;
}

- (void)setHasValue:(BOOL)a3
{
  self->mHasValue = a3;
}

- (double)value
{
  return self->mValue;
}

- (NSString)groupId
{
  return self->mGroupId;
}

- (void)setGroupId:(id)a3
{
}

- (BOOL)isHead
{
  return self->mIsHead;
}

- (void)setIsHead:(BOOL)a3
{
  self->mIsHead = a3;
}

- (int)level
{
  return self->mLevel;
}

- (void)setLevel:(int)a3
{
  self->mLevel = a3;
}

- (PDBuild)build
{
  return self->mBuild;
}

- (void)setBuild:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mGroupId, 0);
  objc_storeStrong((id *)&self->mBuild, 0);
  objc_storeStrong((id *)&self->mMotionPath, 0);
  objc_storeStrong((id *)&self->mTarget, 0);
}

+ (void)mapCommonData:(id)a3 cacheData:(id)a4 state:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v23 hasPresetClass]
    && ([v23 animationPresetClass] == 1
     || [v23 animationPresetClass] == 2
     || [v23 animationPresetClass] == 6
     || [v23 animationPresetClass] == 3
     || [v23 animationPresetClass] == 4))
  {
    [a1 mapAnimationInfo:v23 cacheData:v8 state:v9];
    goto LABEL_25;
  }
  uint64_t v10 = [v23 childTimeNodeList];

  if (v10)
  {
    uint64_t v11 = [v23 childTimeNodeList];
    for (unsigned int i = 0; ; unsigned int i = v13 + 1)
    {
      unsigned int v13 = i;
      if ([v11 count] <= (unint64_t)i)
      {

        break;
      }
      int v14 = [v11 objectAtIndex:i];
      v15 = [v14 parallel];

      if (v15)
      {
        v16 = [v14 parallel];
        [a1 mapCommonData:v16 cacheData:v8 state:v9];
      }
      else
      {
        v17 = [v14 sequential];

        if (v17)
        {
          v16 = [v14 sequential];
          [a1 mapCommonData:v16 cacheData:v8 state:v9];
        }
        else
        {
          v18 = [v14 audio];
          if (v18)
          {
          }
          else
          {
            v19 = [v14 video];

            if (!v19) {
              goto LABEL_23;
            }
          }
          v16 = [v14 audio];
          if (v16 || ([v14 video], (v16 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v20 = [v16 target];

            if (v20)
            {
              id v21 = [v9 mediaNodeMap];
              id v22 = [v16 target];
              [v21 setObject:v16 forUncopiedKey:v22];
            }
          }
        }
      }

LABEL_23:
    }
  }
LABEL_25:
}

+ (void)mapAnimationInfo:(id)a3 cacheData:(id)a4 state:(id)a5
{
  id v19 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v19 animationPresetClass];
  uint64_t v10 = [v19 type];
  uint64_t v11 = [v19 presetSubType];
  uint64_t v12 = [v19 presetId];
  unsigned int v13 = [v19 groupId];
  uint64_t v14 = objc_opt_class();
  v15 = TSUDynamicCast(v14, (uint64_t)v19);
  v16 = [v15 buildInfo];
  if (v16)
  {
    v17 = objc_alloc_init(PDAnimationCache);
    [(PDAnimationCache *)v17 setPresetClass:v9];
    [(PDAnimationCache *)v17 setNodeType:v10];
    [(PDAnimationCache *)v17 setPresetSubType:v11];
    [(PDAnimationCache *)v17 setPresetId:v12];
    v18 = [v16 target];
    [(PDAnimationCache *)v17 setTarget:v18];

    -[PDAnimationCache setIterateType:](v17, "setIterateType:", [v16 iterateType]);
    [(PDAnimationCache *)v17 setGroupId:v13];
    [v16 duration];
    -[PDAnimationCache setDuration:](v17, "setDuration:");
    [v16 delay];
    -[PDAnimationCache setDelay:](v17, "setDelay:");
    if ([v8 isValid:v17]) {
      [v7 addObject:v17];
    }
  }
}

@end