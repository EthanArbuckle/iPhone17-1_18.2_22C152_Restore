@interface CLSAssetScoringContext
- (BOOL)shouldEmphasizeAdjusted;
- (BOOL)shouldEmphasizeBurst;
- (BOOL)shouldEmphasizeLive;
- (BOOL)shouldEmphasizePanorama;
- (BOOL)shouldEmphasizeSDOF;
- (BOOL)shouldEmphasizeShared;
- (double)aestheticScoreThresholdToBeAwesome;
- (double)playCountThreshold;
- (double)viewCountThreshold;
- (signed)audioClassificationsToEmphasize;
- (void)setAestheticScoreThresholdToBeAwesome:(double)a3;
- (void)setAudioClassificationsToEmphasize:(signed __int16)a3;
- (void)setPlayCountThreshold:(double)a3;
- (void)setShouldEmphasizeAdjusted:(BOOL)a3;
- (void)setShouldEmphasizeBurst:(BOOL)a3;
- (void)setShouldEmphasizeLive:(BOOL)a3;
- (void)setShouldEmphasizePanorama:(BOOL)a3;
- (void)setShouldEmphasizeSDOF:(BOOL)a3;
- (void)setShouldEmphasizeShared:(BOOL)a3;
- (void)setViewCountThreshold:(double)a3;
@end

@implementation CLSAssetScoringContext

- (void)setAestheticScoreThresholdToBeAwesome:(double)a3
{
  self->_aestheticScoreThresholdToBeAwesome = a3;
}

- (double)aestheticScoreThresholdToBeAwesome
{
  return self->_aestheticScoreThresholdToBeAwesome;
}

- (void)setAudioClassificationsToEmphasize:(signed __int16)a3
{
  self->_audioClassificationsToEmphasize = a3;
}

- (signed)audioClassificationsToEmphasize
{
  return self->_audioClassificationsToEmphasize;
}

- (void)setShouldEmphasizeSDOF:(BOOL)a3
{
  self->_shouldEmphasizeSDOF = a3;
}

- (BOOL)shouldEmphasizeSDOF
{
  return self->_shouldEmphasizeSDOF;
}

- (void)setShouldEmphasizeBurst:(BOOL)a3
{
  self->_shouldEmphasizeBurst = a3;
}

- (BOOL)shouldEmphasizeBurst
{
  return self->_shouldEmphasizeBurst;
}

- (void)setShouldEmphasizeLive:(BOOL)a3
{
  self->_shouldEmphasizeLive = a3;
}

- (BOOL)shouldEmphasizeLive
{
  return self->_shouldEmphasizeLive;
}

- (void)setShouldEmphasizePanorama:(BOOL)a3
{
  self->_shouldEmphasizePanorama = a3;
}

- (BOOL)shouldEmphasizePanorama
{
  return self->_shouldEmphasizePanorama;
}

- (void)setShouldEmphasizeAdjusted:(BOOL)a3
{
  self->_shouldEmphasizeAdjusted = a3;
}

- (BOOL)shouldEmphasizeAdjusted
{
  return self->_shouldEmphasizeAdjusted;
}

- (void)setShouldEmphasizeShared:(BOOL)a3
{
  self->_shouldEmphasizeShared = a3;
}

- (BOOL)shouldEmphasizeShared
{
  return self->_shouldEmphasizeShared;
}

- (void)setPlayCountThreshold:(double)a3
{
  self->_playCountThreshold = a3;
}

- (double)playCountThreshold
{
  return self->_playCountThreshold;
}

- (void)setViewCountThreshold:(double)a3
{
  self->_viewCountThreshold = a3;
}

- (double)viewCountThreshold
{
  return self->_viewCountThreshold;
}

@end