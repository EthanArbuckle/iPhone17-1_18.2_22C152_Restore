@interface PMMMusicContainer
+ (BOOL)supportsSecureCoding;
- (NSDate)pauseTime;
- (NSDate)playTime;
- (NSString)bundleId;
- (NSString)trackIdentifier;
- (PMMMusicContainer)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPauseIfUnset;
- (void)setPlayingWithBundleId:(id)a3 trackIdentifier:(id)a4 playTime:(id)a5;
@end

@implementation PMMMusicContainer

- (PMMMusicContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PMMMusicContainer;
  v5 = [(PMMMusicContainer *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackIdentifier"];
    trackIdentifier = v5->_trackIdentifier;
    v5->_trackIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playTime"];
    playTime = v5->_playTime;
    v5->_playTime = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pauseTime"];
    pauseTime = v5->_pauseTime;
    v5->_pauseTime = (NSDate *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  bundleId = self->_bundleId;
  id v5 = a3;
  [v5 encodeObject:bundleId forKey:@"bundleId"];
  [v5 encodeObject:self->_trackIdentifier forKey:@"trackIdentifier"];
  [v5 encodeObject:self->_playTime forKey:@"playTime"];
  [v5 encodeObject:self->_pauseTime forKey:@"pauseTime"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPlayingWithBundleId:(id)a3 trackIdentifier:(id)a4 playTime:(id)a5
{
  uint64_t v8 = (NSString *)a3;
  v9 = (NSString *)a4;
  uint64_t v10 = (NSDate *)a5;
  bundleId = self->_bundleId;
  self->_bundleId = v8;
  v17 = v8;

  trackIdentifier = self->_trackIdentifier;
  self->_trackIdentifier = v9;
  v13 = v9;

  playTime = self->_playTime;
  self->_playTime = v10;
  objc_super v15 = v10;

  pauseTime = self->_pauseTime;
  self->_pauseTime = 0;
}

- (void)setPauseIfUnset
{
  if (!self->_pauseTime)
  {
    self->_pauseTime = [MEMORY[0x263EFF910] date];
    MEMORY[0x270F9A758]();
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"MusicContainer bundleId: %@, trackIdentifier: %@, playTime: %@, pauseTime: %@", self->_bundleId, self->_trackIdentifier, self->_playTime, self->_pauseTime];
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)trackIdentifier
{
  return self->_trackIdentifier;
}

- (NSDate)playTime
{
  return self->_playTime;
}

- (NSDate)pauseTime
{
  return self->_pauseTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseTime, 0);
  objc_storeStrong((id *)&self->_playTime, 0);
  objc_storeStrong((id *)&self->_trackIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end