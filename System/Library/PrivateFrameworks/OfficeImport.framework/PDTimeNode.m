@interface PDTimeNode
- (BOOL)display;
- (BOOL)hasAcceleration;
- (BOOL)hasDeceleration;
- (BOOL)hasDisplay;
- (BOOL)hasDuration;
- (BOOL)hasFillType;
- (BOOL)hasPresetClass;
- (BOOL)hasPresetId;
- (BOOL)hasPresetSubType;
- (BOOL)hasRepeatCount;
- (BOOL)hasRepeatDuration;
- (BOOL)hasRestartType;
- (BOOL)hasSpeed;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)attributeMap;
- (PDTimeNode)init;
- (double)acceleration;
- (double)deceleration;
- (double)duration;
- (double)speed;
- (id)childTimeNodeList;
- (id)description;
- (id)endTimeConditions;
- (id)groupId;
- (id)iterate;
- (id)startTimeConditions;
- (id)subTimeNodeList;
- (int)animationPresetClass;
- (int)fillType;
- (int)presetId;
- (int)presetSubType;
- (int)repeatCount;
- (int)repeatDuration;
- (int)restartType;
- (int)type;
- (int64_t)writeDuration;
- (int64_t)writeRepeatCount;
- (unint64_t)hash;
- (void)setAcceleration:(double)a3;
- (void)setAnimationPresetClass:(int)a3;
- (void)setAttributeMap:(id)a3;
- (void)setChildTimeNodeList:(id)a3;
- (void)setDeceleration:(double)a3;
- (void)setDisplay:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setEndTimeConditions:(id)a3;
- (void)setFillType:(int)a3;
- (void)setGroupId:(id)a3;
- (void)setGroupIdValue:(int)a3;
- (void)setIterate:(id)a3;
- (void)setPresetId:(int)a3;
- (void)setPresetSubType:(int)a3;
- (void)setRepeatCount:(int)a3;
- (void)setRepeatDuration:(int)a3;
- (void)setRestartType:(int)a3;
- (void)setSpeed:(double)a3;
- (void)setStartTimeConditions:(id)a3;
- (void)setSubTimeNodeList:(id)a3;
- (void)setType:(int)a3;
@end

@implementation PDTimeNode

- (PDTimeNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDTimeNode;
  return [(PDTimeNode *)&v3 init];
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setRestartType:(int)a3
{
  self->mRestartType = a3;
}

- (void)setStartTimeConditions:(id)a3
{
}

- (void)setAnimationPresetClass:(int)a3
{
  self->mAnimationPresetClass = a3;
}

- (void)setPresetSubType:(int)a3
{
  self->mHasPresetSubType = 1;
  self->mPresetSubType = a3;
}

- (void)setPresetId:(int)a3
{
  self->mHasPresetId = 1;
  self->mPresetId = a3;
}

- (void)setAcceleration:(double)a3
{
  self->mHasAcceleration = 1;
  self->mAcceleration = a3;
}

- (void)setDeceleration:(double)a3
{
  self->mHasDeceleration = 1;
  self->mDeceleration = a3;
}

- (void)setDuration:(double)a3
{
  self->mDuration = a3;
  self->mHasDuration = 1;
}

- (void)setChildTimeNodeList:(id)a3
{
}

- (void)setGroupId:(id)a3
{
}

- (void)setIterate:(id)a3
{
}

- (void)setRepeatCount:(int)a3
{
  self->mHasRepeatCount = 1;
  self->mRepeatCount = a3;
}

- (id)startTimeConditions
{
  return self->mStartTimeConditions;
}

- (id)endTimeConditions
{
  return self->mEndTimeConditions;
}

- (void)setEndTimeConditions:(id)a3
{
}

- (id)childTimeNodeList
{
  return self->mChildTimeNodeList;
}

- (id)subTimeNodeList
{
  return self->mSubTimeNodeList;
}

- (void)setSubTimeNodeList:(id)a3
{
}

- (id)iterate
{
  return self->mIterate;
}

- (BOOL)hasType
{
  return [(PDTimeNode *)self type] != 0;
}

- (int)type
{
  return self->mType;
}

- (BOOL)hasPresetClass
{
  return [(PDTimeNode *)self animationPresetClass] != 0;
}

- (int)animationPresetClass
{
  return self->mAnimationPresetClass;
}

- (BOOL)hasPresetSubType
{
  return self->mHasPresetSubType;
}

- (int)presetSubType
{
  return self->mPresetSubType;
}

- (BOOL)hasPresetId
{
  return self->mHasPresetId;
}

- (int)presetId
{
  return self->mPresetId;
}

- (BOOL)hasRepeatCount
{
  return self->mHasRepeatCount;
}

- (int)repeatCount
{
  return self->mRepeatCount;
}

- (BOOL)hasRepeatDuration
{
  return self->mHasRepeatDuration;
}

- (int)repeatDuration
{
  if (self->mRepeatDuration == -1) {
    return 0;
  }
  else {
    return self->mRepeatDuration;
  }
}

- (void)setRepeatDuration:(int)a3
{
  self->mHasRepeatDuration = 1;
  self->mRepeatDuration = a3;
}

- (BOOL)hasRestartType
{
  return [(PDTimeNode *)self restartType] != 0;
}

- (int)restartType
{
  return self->mRestartType;
}

- (BOOL)hasDuration
{
  return self->mHasDuration;
}

- (double)duration
{
  double result = self->mDuration;
  if (result == -1.0) {
    return 0.0;
  }
  return result;
}

- (BOOL)hasSpeed
{
  return self->mHasSpeed;
}

- (double)speed
{
  return self->mSpeed;
}

- (void)setSpeed:(double)a3
{
  self->mHasSpeed = 1;
  self->mSpeed = a3;
}

- (BOOL)hasAcceleration
{
  return self->mHasAcceleration;
}

- (double)acceleration
{
  return self->mAcceleration;
}

- (BOOL)hasDeceleration
{
  return self->mHasDeceleration;
}

- (double)deceleration
{
  return self->mDeceleration;
}

- (BOOL)hasFillType
{
  return self->mHasFillType;
}

- (int)fillType
{
  return self->mFillType;
}

- (void)setFillType:(int)a3
{
  self->mHasFillType = 1;
  self->mFillType = a3;
}

- (id)groupId
{
  return self->mGroupId;
}

- (void)setGroupIdValue:(int)a3
{
  v4 = [NSNumber numberWithInt:*(void *)&a3];
  id v5 = [v4 stringValue];

  [(PDTimeNode *)self setGroupId:v5];
}

- (BOOL)hasDisplay
{
  return self->mHasDisplay;
}

- (BOOL)display
{
  return self->mDisplay;
}

- (void)setDisplay:(BOOL)a3
{
  self->mHasDisplay = 1;
  self->mDisplay = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TSUDynamicCast(v5, (uint64_t)v4);
  v7 = v6;
  if (!v6) {
    goto LABEL_34;
  }
  int mType = self->mType;
  if (mType != [v6 type]) {
    goto LABEL_34;
  }
  int mAnimationPresetClass = self->mAnimationPresetClass;
  if (mAnimationPresetClass != [v7 animationPresetClass]) {
    goto LABEL_34;
  }
  int mPresetId = self->mPresetId;
  if (mPresetId != [v7 presetId]) {
    goto LABEL_34;
  }
  int mPresetSubType = self->mPresetSubType;
  if (mPresetSubType != [v7 presetSubType]) {
    goto LABEL_34;
  }
  int mRepeatCount = self->mRepeatCount;
  if (mRepeatCount != [v7 repeatCount]) {
    goto LABEL_34;
  }
  int mRepeatDuration = self->mRepeatDuration;
  if (mRepeatDuration != [v7 repeatDuration]) {
    goto LABEL_34;
  }
  int mRestartType = self->mRestartType;
  if (mRestartType != [v7 restartType]) {
    goto LABEL_34;
  }
  double mSpeed = self->mSpeed;
  [v7 speed];
  if (mSpeed != v16) {
    goto LABEL_34;
  }
  double mAcceleration = self->mAcceleration;
  [v7 acceleration];
  if (mAcceleration != v18) {
    goto LABEL_34;
  }
  double mDeceleration = self->mDeceleration;
  [v7 deceleration];
  if (mDeceleration != v20) {
    goto LABEL_34;
  }
  int mDisplay = self->mDisplay;
  if (mDisplay != [v7 display]) {
    goto LABEL_34;
  }
  mStartTimeConditions = self->mStartTimeConditions;
  v23 = [v7 startTimeConditions];
  LOBYTE(mStartTimeConditions) = (mStartTimeConditions != 0) ^ (v23 == 0);

  if ((mStartTimeConditions & 1) == 0) {
    goto LABEL_34;
  }
  v24 = self->mStartTimeConditions;
  if (v24)
  {
    v25 = [v7 startTimeConditions];
    char v26 = [(NSMutableArray *)v24 isEqual:v25];

    if ((v26 & 1) == 0) {
      goto LABEL_34;
    }
  }
  mEndTimeConditions = self->mEndTimeConditions;
  v28 = [v7 endTimeConditions];
  BOOL v29 = v28 == 0;

  if ((mEndTimeConditions != 0) == v29) {
    goto LABEL_34;
  }
  v30 = self->mEndTimeConditions;
  if (v30)
  {
    v31 = [v7 endTimeConditions];
    char v32 = [(NSMutableArray *)v30 isEqual:v31];

    if ((v32 & 1) == 0) {
      goto LABEL_34;
    }
  }
  mChildTimeNodeList = self->mChildTimeNodeList;
  v34 = [v7 childTimeNodeList];
  BOOL v35 = v34 == 0;

  if ((mChildTimeNodeList != 0) == v35) {
    goto LABEL_34;
  }
  v36 = self->mChildTimeNodeList;
  if (v36)
  {
    v37 = [v7 childTimeNodeList];
    char v38 = [(NSMutableArray *)v36 isEqual:v37];

    if ((v38 & 1) == 0) {
      goto LABEL_34;
    }
  }
  mSubTimeNodeList = self->mSubTimeNodeList;
  v40 = [v7 subTimeNodeList];
  BOOL v41 = v40 == 0;

  if ((mSubTimeNodeList != 0) == v41) {
    goto LABEL_34;
  }
  v42 = self->mSubTimeNodeList;
  if (v42)
  {
    v43 = [v7 subTimeNodeList];
    char v44 = [(NSMutableArray *)v42 isEqual:v43];

    if ((v44 & 1) == 0) {
      goto LABEL_34;
    }
  }
  mGroupId = self->mGroupId;
  v46 = [v7 groupId];
  BOOL v47 = v46 == 0;

  if ((mGroupId != 0) == v47) {
    goto LABEL_34;
  }
  v48 = self->mGroupId;
  if (v48)
  {
    v49 = [v7 groupId];
    BOOL v50 = [(NSString *)v48 isEqualToString:v49];

    if (!v50) {
      goto LABEL_34;
    }
  }
  int mHasDuration = self->mHasDuration;
  if (mHasDuration != [v7 hasDuration]) {
    goto LABEL_34;
  }
  if (self->mHasDuration)
  {
    double mDuration = self->mDuration;
    [v7 duration];
    if (mDuration != v53) {
      goto LABEL_34;
    }
  }
  mIterate = self->mIterate;
  v55 = [v7 iterate];
  BOOL v56 = v55 == 0;

  if ((mIterate != 0) != v56)
  {
    v57 = self->mIterate;
    if (v57)
    {
      v58 = [v7 iterate];
      char v59 = [(PDIterate *)v57 isEqual:v58];
    }
    else
    {
      char v59 = 1;
    }
  }
  else
  {
LABEL_34:
    char v59 = 0;
  }

  return v59;
}

- (unint64_t)hash
{
  int v3 = (self->mPresetId << 8) + (self->mType << 16);
  uint64_t v4 = [(NSMutableArray *)self->mStartTimeConditions count];
  uint64_t v5 = [(NSMutableArray *)self->mEndTimeConditions count] ^ v4;
  uint64_t v6 = [(NSMutableArray *)self->mChildTimeNodeList count];
  return (v5 ^ v6 ^ [(NSMutableArray *)self->mSubTimeNodeList count]) + v3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDTimeNode;
  v2 = [(PDTimeNode *)&v4 description];
  return v2;
}

- (NSDictionary)attributeMap
{
  return self->attributeMap;
}

- (void)setAttributeMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->attributeMap, 0);
  objc_storeStrong((id *)&self->mGroupId, 0);
  objc_storeStrong((id *)&self->mIterate, 0);
  objc_storeStrong((id *)&self->mSubTimeNodeList, 0);
  objc_storeStrong((id *)&self->mChildTimeNodeList, 0);
  objc_storeStrong((id *)&self->mEndTimeConditions, 0);
  objc_storeStrong((id *)&self->mStartTimeConditions, 0);
}

- (int64_t)writeDuration
{
  return (uint64_t)self->mDuration;
}

- (int64_t)writeRepeatCount
{
  return self->mRepeatCount;
}

@end