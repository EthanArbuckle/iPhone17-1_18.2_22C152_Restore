@interface _UIStatusBarDynamicSplitAvoidanceData
- (NSMutableDictionary)avoidanceFrameAbsoluteFrames;
- (_UIStatusBarDynamicSplitAvoidanceData)init;
- (_UIStatusBarDynamicSplitAvoidanceData)initWithLeadingDelta:(double)a3 trailingDelta:(double)a4;
- (double)leadingDelta;
- (double)trailingDelta;
- (void)setAvoidanceFrameAbsoluteFrames:(id)a3;
- (void)setLeadingDelta:(double)a3;
- (void)setTrailingDelta:(double)a3;
@end

@implementation _UIStatusBarDynamicSplitAvoidanceData

- (_UIStatusBarDynamicSplitAvoidanceData)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDynamicSplitAvoidanceData;
  v2 = [(_UIStatusBarDynamicSplitAvoidanceData *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
    [(_UIStatusBarDynamicSplitAvoidanceData *)v2 setAvoidanceFrameAbsoluteFrames:v3];
  }
  return v2;
}

- (_UIStatusBarDynamicSplitAvoidanceData)initWithLeadingDelta:(double)a3 trailingDelta:(double)a4
{
  v6 = [(_UIStatusBarDynamicSplitAvoidanceData *)self init];
  v7 = v6;
  if (v6)
  {
    [(_UIStatusBarDynamicSplitAvoidanceData *)v6 setLeadingDelta:a3];
    [(_UIStatusBarDynamicSplitAvoidanceData *)v7 setTrailingDelta:a4];
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