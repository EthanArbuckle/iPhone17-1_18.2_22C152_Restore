@interface VUITimedMetadataPlaybackInfo
- (NSData)rawTimedMetadata;
- (NSDate)timeStamp;
- (NSString)adamId;
- (NSString)audioLanguage;
- (NSString)programId;
- (double)currentTime;
- (double)featureStartTime;
- (double)playbackRate;
- (id)description;
- (void)setAdamId:(id)a3;
- (void)setAudioLanguage:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)setFeatureStartTime:(double)a3;
- (void)setPlaybackRate:(double)a3;
- (void)setProgramId:(id)a3;
- (void)setRawTimedMetadata:(id)a3;
- (void)setTimeStamp:(id)a3;
@end

@implementation VUITimedMetadataPlaybackInfo

- (id)description
{
  v3 = NSString;
  v4 = [(VUITimedMetadataPlaybackInfo *)self programId];
  [(VUITimedMetadataPlaybackInfo *)self currentTime];
  uint64_t v6 = v5;
  v7 = [(VUITimedMetadataPlaybackInfo *)self timeStamp];
  [(VUITimedMetadataPlaybackInfo *)self playbackRate];
  uint64_t v9 = v8;
  [(VUITimedMetadataPlaybackInfo *)self featureStartTime];
  uint64_t v11 = v10;
  v12 = [(VUITimedMetadataPlaybackInfo *)self audioLanguage];
  v13 = [(VUITimedMetadataPlaybackInfo *)self adamId];
  v14 = [(VUITimedMetadataPlaybackInfo *)self rawTimedMetadata];
  v15 = [v3 stringWithFormat:@"<TimedMetadataPlaybackInfo(%p) programId: %@, currentTime: %f, timeStamp: %@, playbackRate: %f, featureStartTime: %f, audioLanguage: %@, adamId: %@, hasRawTimedMetadata: %d>", self, v4, v6, v7, v9, v11, v12, v13, v14 != 0];

  return v15;
}

- (NSString)programId
{
  return self->_programId;
}

- (void)setProgramId:(id)a3
{
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
}

- (double)playbackRate
{
  return self->_playbackRate;
}

- (void)setPlaybackRate:(double)a3
{
  self->_playbackRate = a3;
}

- (double)featureStartTime
{
  return self->_featureStartTime;
}

- (void)setFeatureStartTime:(double)a3
{
  self->_featureStartTime = a3;
}

- (NSString)audioLanguage
{
  return self->_audioLanguage;
}

- (void)setAudioLanguage:(id)a3
{
}

- (NSString)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(id)a3
{
}

- (NSData)rawTimedMetadata
{
  return self->_rawTimedMetadata;
}

- (void)setRawTimedMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawTimedMetadata, 0);
  objc_storeStrong((id *)&self->_adamId, 0);
  objc_storeStrong((id *)&self->_audioLanguage, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_programId, 0);
}

@end