@interface WatchControlSettings(GreySupportFeatures)
- (void)disableAllGreySupportFeatures;
@end

@implementation WatchControlSettings(GreySupportFeatures)

- (void)setWatchControlHandGeturesEnabled:()GreySupportFeatures .cold.1()
{
  v0 = NSStringFromBOOL();
  OUTLINED_FUNCTION_2(&dword_23C230000, v1, v2, "Set AssistiveTouch hand gestures: %@", v3, v4, v5, v6, 2u);
}

- (void)setVoiceOverHandGestures:()GreySupportFeatures .cold.1()
{
  v0 = NSStringFromBOOL();
  OUTLINED_FUNCTION_2(&dword_23C230000, v1, v2, "Set VoiceOver hand gestures: %@", v3, v4, v5, v6, 2u);
}

- (void)setZoomHandGestures:()GreySupportFeatures .cold.1()
{
  v0 = NSStringFromBOOL();
  OUTLINED_FUNCTION_2(&dword_23C230000, v1, v2, "Set zoom hand gestures: %@", v3, v4, v5, v6, 2u);
}

- (void)disableAllGreySupportFeatures
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C230000, v0, v1, "Disable AssistiveTouch since it is an active grey source.", v2, v3, v4, v5, v6);
}

@end