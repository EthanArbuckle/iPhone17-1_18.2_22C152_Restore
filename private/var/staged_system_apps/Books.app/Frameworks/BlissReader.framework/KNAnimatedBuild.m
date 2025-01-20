@interface KNAnimatedBuild
+ (id)createWithBuildType:(int)a3 attributes:(id)a4 direction:(unint64_t)a5 effect:(id)a6 deliveryStyle:(unint64_t)a7 stageCount:(unint64_t)a8 eventIndex:(int64_t)a9 stageIndex:(int64_t)a10 startTime:(double)a11 eventStartTime:(double)a12 duration:(double)a13 automatic:(BOOL)a14 renderer:(id)a15 animateAtEndOfPreviousBuild:(BOOL)a16 isEmphasisBuild:(BOOL)a17;
- (BOOL)animateAtEndOfPreviousBuild;
- (BOOL)automatic;
- (BOOL)hasBounce;
- (BOOL)isActionBuild;
- (BOOL)isBuildIn;
- (BOOL)isBuildOut;
- (BOOL)isDriftBuild;
- (BOOL)isEmphasisBuild;
- (BOOL)isMagicChartBuild;
- (BOOL)isMovieStartBuild;
- (BOOL)isVerticalText;
- (BOOL)isVisibleAtBeginning;
- (BOOL)isVisibleAtEnd;
- (KNAnimatedBuild)initWithBuildType:(int)a3 attributes:(id)a4 direction:(unint64_t)a5 effect:(id)a6 deliveryStyle:(unint64_t)a7 stageCount:(unint64_t)a8 eventIndex:(int64_t)a9 stageIndex:(int64_t)a10 startTime:(double)a11 eventStartTime:(double)a12 duration:(double)a13 automatic:(BOOL)a14 renderer:(id)a15 animateAtEndOfPreviousBuild:(BOOL)a16 isEmphasisBuild:(BOOL)a17;
- (KNBuildRenderer)renderer;
- (NSDictionary)attributes;
- (NSString)effect;
- (double)duration;
- (double)endTime;
- (double)eventEndTime;
- (double)eventStartTime;
- (double)startTime;
- (id)applyActionEffectToAttributes:(id)a3;
- (id)description;
- (int)buildType;
- (int64_t)eventIndex;
- (int64_t)stageIndex;
- (unint64_t)deliveryOption;
- (unint64_t)deliveryStyle;
- (unint64_t)direction;
- (unint64_t)stageCount;
- (void)dealloc;
- (void)setAnimateAtEndOfPreviousBuild:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setEventIndex:(int64_t)a3;
- (void)setIsVisibleAtBeginning:(BOOL)a3;
- (void)setIsVisibleAtEnd:(BOOL)a3;
@end

@implementation KNAnimatedBuild

- (KNAnimatedBuild)initWithBuildType:(int)a3 attributes:(id)a4 direction:(unint64_t)a5 effect:(id)a6 deliveryStyle:(unint64_t)a7 stageCount:(unint64_t)a8 eventIndex:(int64_t)a9 stageIndex:(int64_t)a10 startTime:(double)a11 eventStartTime:(double)a12 duration:(double)a13 automatic:(BOOL)a14 renderer:(id)a15 animateAtEndOfPreviousBuild:(BOOL)a16 isEmphasisBuild:(BOOL)a17
{
  v29.receiver = self;
  v29.super_class = (Class)KNAnimatedBuild;
  v26 = [(KNAnimatedBuild *)&v29 init];
  v27 = v26;
  if (v26)
  {
    v26->mEventIndex = a9;
    v26->mStageIndex = a10;
    v26->mStartTime = a11;
    v26->mEventStartTime = a12;
    v26->mDuration = a13;
    v26->mEndTime = a11 + a13;
    v26->mEventEndTime = a12 + a13;
    v26->mAutomatic = a14;
    v26->mRenderer = (KNBuildRenderer *)a15;
    v27->mAnimateAtEndOfPreviousBuild = a16;
    v27->mBuildType = a3;
    v27->mEffect = (NSString *)a6;
    v27->mAttributes = (NSDictionary *)a4;
    v27->mStageCount = a8;
    v27->mDeliveryStyle = a7;
    v27->mDirection = a5;
    v27->mIsEmphasisBuild = a17;
  }
  return v27;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)KNAnimatedBuild;
  [(KNAnimatedBuild *)&v3 dealloc];
}

+ (id)createWithBuildType:(int)a3 attributes:(id)a4 direction:(unint64_t)a5 effect:(id)a6 deliveryStyle:(unint64_t)a7 stageCount:(unint64_t)a8 eventIndex:(int64_t)a9 stageIndex:(int64_t)a10 startTime:(double)a11 eventStartTime:(double)a12 duration:(double)a13 automatic:(BOOL)a14 renderer:(id)a15 animateAtEndOfPreviousBuild:(BOOL)a16 isEmphasisBuild:(BOOL)a17
{
  LOWORD(v20) = __PAIR16__(a17, a16);
  LOBYTE(v19) = a14;
  v17 = -[KNAnimatedBuild initWithBuildType:attributes:direction:effect:deliveryStyle:stageCount:eventIndex:stageIndex:startTime:eventStartTime:duration:automatic:renderer:animateAtEndOfPreviousBuild:isEmphasisBuild:]([KNAnimatedBuild alloc], "initWithBuildType:attributes:direction:effect:deliveryStyle:stageCount:eventIndex:stageIndex:startTime:eventStartTime:duration:automatic:renderer:animateAtEndOfPreviousBuild:isEmphasisBuild:", *(void *)&a3, a4, a5, a6, a7, a8, a11, a12, a13, a9, a10, v19, a15, v20);

  return v17;
}

- (void)setDuration:(double)a3
{
  self->mDuration = a3;
  *(float64x2_t *)&self->mEndTime = vaddq_f64(*(float64x2_t *)&self->mStartTime, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0));
}

- (unint64_t)deliveryOption
{
  id v2 = [(NSDictionary *)[(KNAnimatedBuild *)self attributes] objectForKey:@"KNBuildCustomAttributesDeliveryOption"];

  return (unint64_t)[v2 unsignedIntegerValue];
}

- (BOOL)hasBounce
{
  id v2 = [(NSDictionary *)[(KNAnimatedBuild *)self attributes] objectForKey:@"KNBuildCustomAttributesBounce"];

  return [v2 BOOLValue];
}

- (BOOL)isBuildIn
{
  return [(KNAnimatedBuild *)self buildType] == 1;
}

- (BOOL)isBuildOut
{
  return [(KNAnimatedBuild *)self buildType] == 2;
}

- (BOOL)isActionBuild
{
  return [(KNAnimatedBuild *)self buildType] == 4;
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)KNAnimatedBuild;
  id v3 = [(KNAnimatedBuild *)&v5 description];
  return +[NSString stringWithFormat:@"<%@: %@ event(%ld), stage(%ld) start(%.1f) eventStart(%.1f) duration(%.1f) end(%.1f) eventEnd(%.1f) automatic(%d) animateAtEndOfPrevious(%d) isVisibleAtBeginning(%d) isVisibleAtEnd(%d) renderer:(%@)>", v3, KNAnimationTypeAsString(), self->mEventIndex, self->mStageIndex, *(void *)&self->mStartTime, *(void *)&self->mEventStartTime, *(void *)&self->mDuration, *(void *)&self->mEndTime, *(void *)&self->mEventEndTime, self->mAutomatic, self->mAnimateAtEndOfPreviousBuild, self->mIsVisibleAtBeginning, self->mIsVisibleAtEnd, self->mRenderer];
}

- (id)applyActionEffectToAttributes:(id)a3
{
  return a3;
}

- (BOOL)automatic
{
  return self->mAutomatic;
}

- (BOOL)animateAtEndOfPreviousBuild
{
  return self->mAnimateAtEndOfPreviousBuild;
}

- (void)setAnimateAtEndOfPreviousBuild:(BOOL)a3
{
  self->mAnimateAtEndOfPreviousBuild = a3;
}

- (double)endTime
{
  return self->mEndTime;
}

- (double)eventEndTime
{
  return self->mEventEndTime;
}

- (int64_t)eventIndex
{
  return self->mEventIndex;
}

- (void)setEventIndex:(int64_t)a3
{
  self->mEventIndex = a3;
}

- (double)eventStartTime
{
  return self->mEventStartTime;
}

- (KNBuildRenderer)renderer
{
  return self->mRenderer;
}

- (int64_t)stageIndex
{
  return self->mStageIndex;
}

- (double)startTime
{
  return self->mStartTime;
}

- (double)duration
{
  return self->mDuration;
}

- (BOOL)isVisibleAtBeginning
{
  return self->mIsVisibleAtBeginning;
}

- (void)setIsVisibleAtBeginning:(BOOL)a3
{
  self->mIsVisibleAtBeginning = a3;
}

- (BOOL)isVisibleAtEnd
{
  return self->mIsVisibleAtEnd;
}

- (void)setIsVisibleAtEnd:(BOOL)a3
{
  self->mIsVisibleAtEnd = a3;
}

- (int)buildType
{
  return self->mBuildType;
}

- (unint64_t)stageCount
{
  return self->mStageCount;
}

- (unint64_t)deliveryStyle
{
  return self->mDeliveryStyle;
}

- (NSString)effect
{
  return self->mEffect;
}

- (NSDictionary)attributes
{
  return self->mAttributes;
}

- (unint64_t)direction
{
  return self->mDirection;
}

- (BOOL)isEmphasisBuild
{
  return self->mIsEmphasisBuild;
}

- (BOOL)isDriftBuild
{
  return self->_isDriftBuild;
}

- (BOOL)isMovieStartBuild
{
  return self->_isMovieStartBuild;
}

- (BOOL)isMagicChartBuild
{
  return self->_isMagicChartBuild;
}

- (BOOL)isVerticalText
{
  return self->_isVerticalText;
}

@end