@interface _UIKBFeedbackGeneratorPartner
+ (BOOL)_isVisceralEnabled;
+ (BOOL)_shouldPreheatAndCoolSystemSounds;
+ (id)feedbackGeneratorWithCoordinateSpace:(id)a3;
+ (id)feedbackGeneratorWithView:(id)a3;
+ (void)cooldownSystemSoundsForObject:(id)a3;
+ (void)preheatSystemSoundsForObject:(id)a3;
@end

@implementation _UIKBFeedbackGeneratorPartner

+ (void)preheatSystemSoundsForObject:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() _shouldPreheatAndCoolSystemSounds])
  {
    v3 = +[UIDevice currentDevice];
    [v3 _registerForSystemSounds:v4];
  }
}

+ (BOOL)_shouldPreheatAndCoolSystemSounds
{
  return !+[_UIKBFeedbackGeneratorPartner _isVisceralEnabled];
}

+ (BOOL)_isVisceralEnabled
{
  int v2 = _os_feature_enabled_impl();
  int v3 = MGGetBoolAnswer();
  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return v2;
  }
  return _os_feature_enabled_impl();
}

+ (id)feedbackGeneratorWithView:(id)a3
{
  id v3 = a3;
  if (+[_UIKBFeedbackGeneratorPartner _isVisceralEnabled])
  {
    BOOL v4 = objc_alloc_init(_UIKBFeedbackGenerator);
  }
  else
  {
    BOOL v4 = [(UIFeedbackGenerator *)[_UIKeyboardFeedbackGenerator alloc] initWithView:v3];
  }
  v5 = v4;

  return v5;
}

+ (id)feedbackGeneratorWithCoordinateSpace:(id)a3
{
  BOOL v4 = _viewFromCoordinateSpace(a3);
  v5 = [a1 feedbackGeneratorWithView:v4];

  return v5;
}

+ (void)cooldownSystemSoundsForObject:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() _shouldPreheatAndCoolSystemSounds])
  {
    id v3 = +[UIDevice currentDevice];
    [v3 _unregisterForSystemSounds:v4];
  }
}

@end