@interface STUIStatusBarDynamicSplitAvoidanceData
- (NSMutableDictionary)avoidanceFrameAbsoluteFrames;
- (STUIStatusBarDynamicSplitAvoidanceData)init;
- (STUIStatusBarDynamicSplitAvoidanceData)initWithLeadingDelta:(double)a3 trailingDelta:(double)a4;
- (double)leadingDelta;
- (double)trailingDelta;
- (void)setAvoidanceFrameAbsoluteFrames:(id)a3;
- (void)setLeadingDelta:(double)a3;
- (void)setTrailingDelta:(double)a3;
@end

@implementation STUIStatusBarDynamicSplitAvoidanceData

- (STUIStatusBarDynamicSplitAvoidanceData)init
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarDynamicSplitAvoidanceData;
  v2 = [(STUIStatusBarDynamicSplitAvoidanceData *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
    [(STUIStatusBarDynamicSplitAvoidanceData *)v2 setAvoidanceFrameAbsoluteFrames:v3];
  }
  return v2;
}

- (STUIStatusBarDynamicSplitAvoidanceData)initWithLeadingDelta:(double)a3 trailingDelta:(double)a4
{
  v6 = [(STUIStatusBarDynamicSplitAvoidanceData *)self init];
  v7 = v6;
  if (v6)
  {
    [(STUIStatusBarDynamicSplitAvoidanceData *)v6 setLeadingDelta:a3];
    [(STUIStatusBarDynamicSplitAvoidanceData *)v7 setTrailingDelta:a4];
  }
  return v7;
}

- (double)leadingDelta
{
  return self->_leadingDelta;
}

- (void)setLeadingDelta:(double)a3
{
  self->_leadingDelta = a3;
}

- (double)trailingDelta
{
  return self->_trailingDelta;
}

- (void)setTrailingDelta:(double)a3
{
  self->_trailingDelta = a3;
}

- (NSMutableDictionary)avoidanceFrameAbsoluteFrames
{
  return self->_avoidanceFrameAbsoluteFrames;
}

- (void)setAvoidanceFrameAbsoluteFrames:(id)a3
{
}

- (void).cxx_destruct
{
}

@end