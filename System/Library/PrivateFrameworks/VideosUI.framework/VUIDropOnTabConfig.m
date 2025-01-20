@interface VUIDropOnTabConfig
- (NSNumber)daysWithoutOpeningThreshold;
- (NSNumber)daysWithoutPlaybackThreshold;
- (NSString)dropOnTabIdentifier;
- (VUIDropOnTabConfig)init;
- (void)setDaysWithoutOpeningThreshold:(id)a3;
- (void)setDaysWithoutPlaybackThreshold:(id)a3;
- (void)setDropOnTabIdentifier:(id)a3;
@end

@implementation VUIDropOnTabConfig

- (void)setDropOnTabIdentifier:(id)a3
{
}

- (void)setDaysWithoutPlaybackThreshold:(id)a3
{
}

- (void)setDaysWithoutOpeningThreshold:(id)a3
{
}

- (NSString)dropOnTabIdentifier
{
  return self->_dropOnTabIdentifier;
}

- (NSNumber)daysWithoutPlaybackThreshold
{
  v3 = +[VUIFeaturesConfiguration defaultsNumberValueForKey:@"daysWithoutPlaybackThreshold"];
  daysWithoutPlaybackThreshold = v3;
  if (!v3) {
    daysWithoutPlaybackThreshold = self->_daysWithoutPlaybackThreshold;
  }
  v5 = daysWithoutPlaybackThreshold;

  return v5;
}

- (NSNumber)daysWithoutOpeningThreshold
{
  v3 = +[VUIFeaturesConfiguration defaultsNumberValueForKey:@"daysWithoutOpeningThreshold"];
  daysWithoutOpeningThreshold = v3;
  if (!v3) {
    daysWithoutOpeningThreshold = self->_daysWithoutOpeningThreshold;
  }
  v5 = daysWithoutOpeningThreshold;

  return v5;
}

- (VUIDropOnTabConfig)init
{
  v8.receiver = self;
  v8.super_class = (Class)VUIDropOnTabConfig;
  v2 = [(VUIDropOnTabConfig *)&v8 init];
  v3 = v2;
  if (v2)
  {
    dropOnTabIdentifier = v2->_dropOnTabIdentifier;
    v2->_dropOnTabIdentifier = (NSString *)@"watchnow";

    daysWithoutOpeningThreshold = v3->_daysWithoutOpeningThreshold;
    v3->_daysWithoutOpeningThreshold = (NSNumber *)&unk_1F3F3D1F0;

    daysWithoutPlaybackThreshold = v3->_daysWithoutPlaybackThreshold;
    v3->_daysWithoutPlaybackThreshold = (NSNumber *)&unk_1F3F3D1D8;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropOnTabIdentifier, 0);
  objc_storeStrong((id *)&self->_daysWithoutPlaybackThreshold, 0);
  objc_storeStrong((id *)&self->_daysWithoutOpeningThreshold, 0);
}

@end