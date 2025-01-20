@interface _SBCameraLaunchCondition
+ (id)conditionWithConditions:(id)a3;
+ (id)conditionWithValue:(BOOL)a3;
- (BOOL)isMet;
- (void)setMet:(BOOL)a3;
@end

@implementation _SBCameraLaunchCondition

+ (id)conditionWithConditions:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_SBAggregateCameraLaunchCondition);
  [(_SBAggregateCameraLaunchCondition *)v4 setConditions:v3];

  return v4;
}

+ (id)conditionWithValue:(BOOL)a3
{
  v4 = objc_alloc_init(_SBCameraLaunchCondition);
  v4->_met = a3;
  return v4;
}

- (BOOL)isMet
{
  return self->_met;
}

- (void)setMet:(BOOL)a3
{
  self->_met = a3;
}

@end