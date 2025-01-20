@interface SBHarmonySettings
- (BOOL)whitePointAdaptationInteractiveUpdateEnabled;
- (NSString)whitePointAdaptationInteractiveUpdateTimingFunctionName;
- (float)whitePointAdaptationStrengthGame;
- (float)whitePointAdaptationStrengthPhoto;
- (float)whitePointAdaptationStrengthReading;
- (float)whitePointAdaptationStrengthStandard;
- (float)whitePointAdaptationStrengthVideo;
- (float)whitePointAdaptationUpdateDefaultDuration;
- (void)setDefaultValues;
- (void)setWhitePointAdaptationInteractiveUpdateEnabled:(BOOL)a3;
- (void)setWhitePointAdaptationInteractiveUpdateTimingFunctionName:(id)a3;
- (void)setWhitePointAdaptationStrengthGame:(float)a3;
- (void)setWhitePointAdaptationStrengthPhoto:(float)a3;
- (void)setWhitePointAdaptationStrengthReading:(float)a3;
- (void)setWhitePointAdaptationStrengthStandard:(float)a3;
- (void)setWhitePointAdaptationStrengthVideo:(float)a3;
- (void)setWhitePointAdaptationUpdateDefaultDuration:(float)a3;
@end

@implementation SBHarmonySettings

- (NSString)whitePointAdaptationInteractiveUpdateTimingFunctionName
{
  return self->_whitePointAdaptationInteractiveUpdateTimingFunctionName;
}

- (float)whitePointAdaptationUpdateDefaultDuration
{
  return self->_whitePointAdaptationUpdateDefaultDuration;
}

- (void)setDefaultValues
{
  id v4 = +[SBHarmonyController sharedInstance];
  [v4 whitePointAdaptationStrengthForWhitePointAdaptivityStyle:0];
  -[SBHarmonySettings setWhitePointAdaptationStrengthStandard:](self, "setWhitePointAdaptationStrengthStandard:");
  [v4 whitePointAdaptationStrengthForWhitePointAdaptivityStyle:1];
  -[SBHarmonySettings setWhitePointAdaptationStrengthReading:](self, "setWhitePointAdaptationStrengthReading:");
  [v4 whitePointAdaptationStrengthForWhitePointAdaptivityStyle:2];
  -[SBHarmonySettings setWhitePointAdaptationStrengthPhoto:](self, "setWhitePointAdaptationStrengthPhoto:");
  [v4 whitePointAdaptationStrengthForWhitePointAdaptivityStyle:3];
  -[SBHarmonySettings setWhitePointAdaptationStrengthVideo:](self, "setWhitePointAdaptationStrengthVideo:");
  [v4 whitePointAdaptationStrengthForWhitePointAdaptivityStyle:4];
  -[SBHarmonySettings setWhitePointAdaptationStrengthGame:](self, "setWhitePointAdaptationStrengthGame:");
  LODWORD(v3) = 2.0;
  [(SBHarmonySettings *)self setWhitePointAdaptationUpdateDefaultDuration:v3];
  [(SBHarmonySettings *)self setWhitePointAdaptationInteractiveUpdateEnabled:1];
  [(SBHarmonySettings *)self setWhitePointAdaptationInteractiveUpdateTimingFunctionName:*MEMORY[0x1E4F3A490]];
}

- (float)whitePointAdaptationStrengthStandard
{
  return self->_whitePointAdaptationStrengthStandard;
}

- (void)setWhitePointAdaptationStrengthStandard:(float)a3
{
  self->_whitePointAdaptationStrengthStandard = a3;
}

- (float)whitePointAdaptationStrengthReading
{
  return self->_whitePointAdaptationStrengthReading;
}

- (void)setWhitePointAdaptationStrengthReading:(float)a3
{
  self->_whitePointAdaptationStrengthReading = a3;
}

- (float)whitePointAdaptationStrengthPhoto
{
  return self->_whitePointAdaptationStrengthPhoto;
}

- (void)setWhitePointAdaptationStrengthPhoto:(float)a3
{
  self->_whitePointAdaptationStrengthPhoto = a3;
}

- (float)whitePointAdaptationStrengthVideo
{
  return self->_whitePointAdaptationStrengthVideo;
}

- (void)setWhitePointAdaptationStrengthVideo:(float)a3
{
  self->_whitePointAdaptationStrengthVideo = a3;
}

- (float)whitePointAdaptationStrengthGame
{
  return self->_whitePointAdaptationStrengthGame;
}

- (void)setWhitePointAdaptationStrengthGame:(float)a3
{
  self->_whitePointAdaptationStrengthGame = a3;
}

- (void)setWhitePointAdaptationUpdateDefaultDuration:(float)a3
{
  self->_whitePointAdaptationUpdateDefaultDuration = a3;
}

- (BOOL)whitePointAdaptationInteractiveUpdateEnabled
{
  return self->_whitePointAdaptationInteractiveUpdateEnabled;
}

- (void)setWhitePointAdaptationInteractiveUpdateEnabled:(BOOL)a3
{
  self->_whitePointAdaptationInteractiveUpdateEnabled = a3;
}

- (void)setWhitePointAdaptationInteractiveUpdateTimingFunctionName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end