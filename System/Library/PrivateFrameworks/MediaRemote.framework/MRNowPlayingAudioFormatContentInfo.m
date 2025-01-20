@interface MRNowPlayingAudioFormatContentInfo
- (BOOL)isEligibleForSpatialization;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMultichannel;
- (BOOL)isSpatialized;
- (MRNowPlayingAudioFormatContentInfo)initWithData:(id)a3;
- (MRNowPlayingAudioFormatContentInfo)initWithPid:(int)a3 bundleID:(id)a4 audioSessionID:(id)a5 audioFormat:(id)a6 channelCount:(id)a7 bestAvailableContent:(id)a8 isEligibleForSpatialization:(id)a9 isSpatialized:(id)a10;
- (MRNowPlayingAudioFormatContentInfo)initWithProtobuf:(id)a3;
- (NSData)data;
- (NSNumber)audioFormat;
- (NSNumber)audioSessionID;
- (NSNumber)channelCount;
- (NSString)audioFormatDescription;
- (NSString)bestAvailableAudioFormatDescription;
- (NSString)bestAvailableContent;
- (NSString)bundleID;
- (_MRMRNowPlayingAudioFormatContentInfoProtobuf)protobuf;
- (id)description;
- (int)pid;
- (int64_t)bestAvailableAudioFormat;
- (int64_t)intendedSpatialExperience;
- (int64_t)renderingMode;
- (int64_t)resolvedSpatialExperience;
- (void)setBundleID:(id)a3;
- (void)setIntendedSpatialExperience:(int64_t)a3;
- (void)setRenderingMode:(int64_t)a3;
- (void)setResolvedSpatialExperience:(int64_t)a3;
@end

@implementation MRNowPlayingAudioFormatContentInfo

- (MRNowPlayingAudioFormatContentInfo)initWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[_MRMRNowPlayingAudioFormatContentInfoProtobuf alloc] initWithData:v4];

    self = [(MRNowPlayingAudioFormatContentInfo *)self initWithProtobuf:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)bundleID
{
  bundleID = self->_bundleID;
  if (!bundleID)
  {
    BSBundleIDForPID();
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bundleID;
    self->_bundleID = v4;

    bundleID = self->_bundleID;
  }

  return bundleID;
}

- (MRNowPlayingAudioFormatContentInfo)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v18.receiver = self;
    v18.super_class = (Class)MRNowPlayingAudioFormatContentInfo;
    v5 = [(MRNowPlayingAudioFormatContentInfo *)&v18 init];
    if (v5)
    {
      uint64_t v6 = [v4 bundleID];
      bundleID = v5->_bundleID;
      v5->_bundleID = (NSString *)v6;

      if ([v4 hasAudioSessionID])
      {
        uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "audioSessionID"));
        audioSessionID = v5->_audioSessionID;
        v5->_audioSessionID = (NSNumber *)v8;
      }
      if ([v4 hasAudioFormat])
      {
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "audioFormat"));
        audioFormat = v5->_audioFormat;
        v5->_audioFormat = (NSNumber *)v10;
      }
      if ([v4 hasChannelCount])
      {
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "channelCount"));
        channelCount = v5->_channelCount;
        v5->_channelCount = (NSNumber *)v12;
      }
      uint64_t v14 = [v4 bestAvailableContent];
      bestAvailableContent = v5->_bestAvailableContent;
      v5->_bestAvailableContent = (NSString *)v14;

      v5->_eligibleForSpatialization = [v4 eligibleForSpatialization];
      v5->_spatialized = [v4 spatialized];
      v5->_intendedSpatialExperience = [v4 intendedSpatialExperience];
      v5->_resolvedSpatialExperience = [v4 resolvedSpatialExperience];
      v5->_pid = [v4 pid];
      v5->_renderingMode = [v4 renderingMode];
    }
    self = v5;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRNowPlayingAudioFormatContentInfo *)a3;
  if (self == v4)
  {
    BOOL v23 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int v6 = [(MRNowPlayingAudioFormatContentInfo *)v5 pid];
      int pid = self->_pid;
      uint64_t v8 = [(MRNowPlayingAudioFormatContentInfo *)v5 bundleID];
      int v9 = [v8 isEqualToString:self->_bundleID];
      if (v6 == pid) {
        int v10 = v9;
      }
      else {
        int v10 = 0;
      }

      v11 = [(MRNowPlayingAudioFormatContentInfo *)v5 audioSessionID];
      int v12 = [v11 unsignedIntValue];
      if (v12 != [(NSNumber *)self->_audioSessionID unsignedIntValue]) {
        int v10 = 0;
      }

      v13 = [(MRNowPlayingAudioFormatContentInfo *)v5 audioFormat];
      int v14 = [v13 unsignedIntValue];
      if (v14 != [(NSNumber *)self->_audioFormat unsignedIntValue]) {
        int v10 = 0;
      }

      v15 = [(MRNowPlayingAudioFormatContentInfo *)v5 channelCount];
      int v16 = [v15 unsignedIntValue];
      if (v16 == [(NSNumber *)self->_channelCount unsignedIntValue]) {
        int v17 = v10;
      }
      else {
        int v17 = 0;
      }

      objc_super v18 = [(MRNowPlayingAudioFormatContentInfo *)v5 bestAvailableContent];
      int v19 = v17 & [v18 isEqualToString:self->_bestAvailableContent];

      if (self->_eligibleForSpatialization == [(MRNowPlayingAudioFormatContentInfo *)v5 isEligibleForSpatialization])BOOL v20 = v19; {
      else
      }
        BOOL v20 = 0;
      if (self->_spatialized != [(MRNowPlayingAudioFormatContentInfo *)v5 isSpatialized]) {
        BOOL v20 = 0;
      }
      if ([(MRNowPlayingAudioFormatContentInfo *)v5 intendedSpatialExperience] != self->_intendedSpatialExperience) {
        BOOL v20 = 0;
      }
      BOOL v21 = [(MRNowPlayingAudioFormatContentInfo *)v5 resolvedSpatialExperience] == self->_resolvedSpatialExperience
         && v20;
      uint64_t v22 = [(MRNowPlayingAudioFormatContentInfo *)v5 renderingMode];

      BOOL v23 = v22 == self->_renderingMode && v21;
    }
    else
    {
      BOOL v23 = 0;
    }
  }

  return v23;
}

- (BOOL)isEligibleForSpatialization
{
  return self->_eligibleForSpatialization;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (BOOL)isSpatialized
{
  return self->_spatialized;
}

- (NSString)bestAvailableAudioFormatDescription
{
  int64_t v3 = [(MRNowPlayingAudioFormatContentInfo *)self bestAvailableAudioFormat];
  if (v3 == 1)
  {
    id v4 = @"MULTICHANNEL_AVAILABLE";
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    id v4 = @"SPATIAL_ATMOS_AVAILABLE";
LABEL_5:
    v5 = MRLocalizedString(v4);
    goto LABEL_7;
  }
  v5 = [(MRNowPlayingAudioFormatContentInfo *)self audioFormatDescription];
LABEL_7:

  return (NSString *)v5;
}

- (id)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  audioSessionID = self->_audioSessionID;
  uint64_t v6 = [(MRNowPlayingAudioFormatContentInfo *)self audioFormatDescription];
  v7 = (void *)v6;
  uint64_t v8 = @"Yes";
  if (self->_eligibleForSpatialization) {
    int v9 = @"Yes";
  }
  else {
    int v9 = @"No";
  }
  if (!self->_spatialized) {
    uint64_t v8 = @"No";
  }
  int v10 = [v3 stringWithFormat:@"<%@: %p | session id: %@ | audio format: %@ - %@ | channel #: %@ | available: %@ | eligible: %@ | active: %@ | intended :%ld | resolved :%ld | pid: %i | bundleID: %@>", v4, self, audioSessionID, v6, *(_OWORD *)&self->_audioFormat, self->_bestAvailableContent, v9, v8, self->_intendedSpatialExperience, self->_resolvedSpatialExperience, self->_pid, self->_bundleID];

  return v10;
}

- (BOOL)isMultichannel
{
  return [(NSNumber *)self->_channelCount unsignedIntValue] > 2;
}

- (NSString)audioFormatDescription
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  DWORD2(v8) = [(NSNumber *)self->_audioFormat unsignedIntValue];
  HIDWORD(v9) = [(NSNumber *)self->_channelCount unsignedIntValue];
  id v7 = 0;
  int v6 = 8;
  int v3 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkAudioFormatGetProperty[0])(1634100078, 40, (uint64_t)&v8, (uint64_t)&v6, (uint64_t)&v7);
  uint64_t v4 = 0;
  if (!v3) {
    uint64_t v4 = (void *)[v7 copy];
  }

  return (NSString *)v4;
}

- (int64_t)bestAvailableAudioFormat
{
  bestAvailableContent = self->_bestAvailableContent;
  uint64_t v4 = getkMXSession_SourceFormatInfoKey_BestAvailableContentType_Multichannel[0]();
  LOBYTE(bestAvailableContent) = [(NSString *)bestAvailableContent isEqualToString:v4];

  if (bestAvailableContent) {
    return 1;
  }
  int v6 = self->_bestAvailableContent;
  id v7 = getkMXSession_SourceFormatInfoKey_BestAvailableContentType_Atmos[0]();
  LODWORD(v6) = [(NSString *)v6 isEqualToString:v7];

  if (v6) {
    return 2;
  }
  else {
    return 0;
  }
}

- (int64_t)resolvedSpatialExperience
{
  return self->_resolvedSpatialExperience;
}

- (int)pid
{
  return self->_pid;
}

- (int64_t)intendedSpatialExperience
{
  return self->_intendedSpatialExperience;
}

- (NSNumber)channelCount
{
  return self->_channelCount;
}

- (NSString)bestAvailableContent
{
  return self->_bestAvailableContent;
}

- (NSNumber)audioSessionID
{
  return self->_audioSessionID;
}

- (NSNumber)audioFormat
{
  return self->_audioFormat;
}

- (NSData)data
{
  v2 = [(MRNowPlayingAudioFormatContentInfo *)self protobuf];
  int v3 = [v2 data];

  return (NSData *)v3;
}

- (_MRMRNowPlayingAudioFormatContentInfoProtobuf)protobuf
{
  int v3 = objc_alloc_init(_MRMRNowPlayingAudioFormatContentInfoProtobuf);
  [(_MRMRNowPlayingAudioFormatContentInfoProtobuf *)v3 setBundleID:self->_bundleID];
  audioSessionID = self->_audioSessionID;
  if (audioSessionID) {
    [(_MRMRNowPlayingAudioFormatContentInfoProtobuf *)v3 setAudioSessionID:[(NSNumber *)audioSessionID unsignedIntValue]];
  }
  audioFormat = self->_audioFormat;
  if (audioFormat) {
    [(_MRMRNowPlayingAudioFormatContentInfoProtobuf *)v3 setAudioFormat:[(NSNumber *)audioFormat unsignedIntValue]];
  }
  channelCount = self->_channelCount;
  if (channelCount) {
    [(_MRMRNowPlayingAudioFormatContentInfoProtobuf *)v3 setChannelCount:[(NSNumber *)channelCount unsignedIntValue]];
  }
  [(_MRMRNowPlayingAudioFormatContentInfoProtobuf *)v3 setBestAvailableContent:self->_bestAvailableContent];
  [(_MRMRNowPlayingAudioFormatContentInfoProtobuf *)v3 setEligibleForSpatialization:self->_eligibleForSpatialization];
  [(_MRMRNowPlayingAudioFormatContentInfoProtobuf *)v3 setSpatialized:self->_spatialized];
  [(_MRMRNowPlayingAudioFormatContentInfoProtobuf *)v3 setIntendedSpatialExperience:self->_intendedSpatialExperience];
  [(_MRMRNowPlayingAudioFormatContentInfoProtobuf *)v3 setResolvedSpatialExperience:self->_resolvedSpatialExperience];
  [(_MRMRNowPlayingAudioFormatContentInfoProtobuf *)v3 setPid:self->_pid];
  [(_MRMRNowPlayingAudioFormatContentInfoProtobuf *)v3 setRenderingMode:self->_renderingMode];

  return v3;
}

- (void)setRenderingMode:(int64_t)a3
{
  self->_renderingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestAvailableContent, 0);
  objc_storeStrong((id *)&self->_channelCount, 0);
  objc_storeStrong((id *)&self->_audioFormat, 0);
  objc_storeStrong((id *)&self->_audioSessionID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (MRNowPlayingAudioFormatContentInfo)initWithPid:(int)a3 bundleID:(id)a4 audioSessionID:(id)a5 audioFormat:(id)a6 channelCount:(id)a7 bestAvailableContent:(id)a8 isEligibleForSpatialization:(id)a9 isSpatialized:(id)a10
{
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  v27.receiver = self;
  v27.super_class = (Class)MRNowPlayingAudioFormatContentInfo;
  BOOL v20 = [(MRNowPlayingAudioFormatContentInfo *)&v27 init];
  BOOL v21 = v20;
  if (v20)
  {
    v20->_int pid = a3;
    objc_storeStrong((id *)&v20->_bundleID, a4);
    objc_storeStrong((id *)&v21->_audioSessionID, a5);
    objc_storeStrong((id *)&v21->_audioFormat, a6);
    objc_storeStrong((id *)&v21->_channelCount, a7);
    objc_storeStrong((id *)&v21->_bestAvailableContent, a8);
    v21->_spatialized = objc_msgSend(v19, "BOOLValue", v23, v24, v25, v26);
    v21->_eligibleForSpatialization = [v18 BOOLValue];
  }

  return v21;
}

- (void)setBundleID:(id)a3
{
}

- (void)setIntendedSpatialExperience:(int64_t)a3
{
  self->_intendedSpatialExperience = a3;
}

- (void)setResolvedSpatialExperience:(int64_t)a3
{
  self->_resolvedSpatialExperience = a3;
}

@end