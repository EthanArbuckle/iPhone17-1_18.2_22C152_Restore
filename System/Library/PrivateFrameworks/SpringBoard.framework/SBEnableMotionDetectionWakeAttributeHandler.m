@interface SBEnableMotionDetectionWakeAttributeHandler
+ (Class)attributeBaseClass;
+ (id)attributeClasses;
- (void)activateWithFirstEntry:(id)a3;
- (void)deactivateWithFinalEntry:(id)a3;
@end

@implementation SBEnableMotionDetectionWakeAttributeHandler

+ (id)attributeClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (Class)attributeBaseClass
{
  return (Class)objc_opt_class();
}

- (void)activateWithFirstEntry:(id)a3
{
}

void __70__SBEnableMotionDetectionWakeAttributeHandler_activateWithFirstEntry___block_invoke()
{
  id v0 = +[SBAmbientMotionDetectionWakeAttributeMonitor sharedInstance];
  [v0 _setShouldEnableMotionDetectionWake:1];
}

- (void)deactivateWithFinalEntry:(id)a3
{
}

void __72__SBEnableMotionDetectionWakeAttributeHandler_deactivateWithFinalEntry___block_invoke()
{
  id v0 = +[SBAmbientMotionDetectionWakeAttributeMonitor sharedInstance];
  [v0 _setShouldEnableMotionDetectionWake:0];
}

@end