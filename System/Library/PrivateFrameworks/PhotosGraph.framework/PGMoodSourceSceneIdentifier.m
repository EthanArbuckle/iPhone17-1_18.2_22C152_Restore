@interface PGMoodSourceSceneIdentifier
- (BOOL)isDistributed;
- (BOOL)isHighConfidence;
- (NSString)moodIdentifier;
- (void)setIsDistributed:(BOOL)a3;
- (void)setIsHighConfidence:(BOOL)a3;
- (void)setMoodIdentifier:(id)a3;
@end

@implementation PGMoodSourceSceneIdentifier

- (void).cxx_destruct
{
}

- (void)setIsHighConfidence:(BOOL)a3
{
  self->_isHighConfidence = a3;
}

- (BOOL)isHighConfidence
{
  return self->_isHighConfidence;
}

- (void)setIsDistributed:(BOOL)a3
{
  self->_isDistributed = a3;
}

- (BOOL)isDistributed
{
  return self->_isDistributed;
}

- (void)setMoodIdentifier:(id)a3
{
}

- (NSString)moodIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

@end