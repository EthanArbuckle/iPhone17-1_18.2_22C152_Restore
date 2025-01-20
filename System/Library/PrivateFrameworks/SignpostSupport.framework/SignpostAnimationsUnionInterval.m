@interface SignpostAnimationsUnionInterval
- (NSMutableArray)animationIntervals;
- (SignpostAnimationsUnionInterval)initWithAnimation:(id)a3;
- (_NSRange)animationTimeRange;
- (void)setAnimationIntervals:(id)a3;
- (void)setAnimationTimeRange:(_NSRange)a3;
@end

@implementation SignpostAnimationsUnionInterval

- (SignpostAnimationsUnionInterval)initWithAnimation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SignpostAnimationsUnionInterval;
  v5 = [(SignpostAnimationsUnionInterval *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 startMachContinuousTime];
    uint64_t v7 = [v4 durationMachContinuousTime];
    v5->_animationTimeRange.location = v6;
    v5->_animationTimeRange.length = v7;
    uint64_t v8 = objc_opt_new();
    animationIntervals = v5->_animationIntervals;
    v5->_animationIntervals = (NSMutableArray *)v8;

    [(NSMutableArray *)v5->_animationIntervals addObject:v4];
  }

  return v5;
}

- (_NSRange)animationTimeRange
{
  NSUInteger length = self->_animationTimeRange.length;
  NSUInteger location = self->_animationTimeRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setAnimationTimeRange:(_NSRange)a3
{
  self->_animationTimeRange = a3;
}

- (NSMutableArray)animationIntervals
{
  return self->_animationIntervals;
}

- (void)setAnimationIntervals:(id)a3
{
}

- (void).cxx_destruct
{
}

@end