@interface NMRNowPlayingApplicationInfo
+ (int)_getNextPlaceholderProcessID;
- (NMRNowPlayingApplicationInfo)init;
- (NMRNowPlayingApplicationInfo)initWithProtobufData:(id)a3;
- (NSData)iconDigest;
- (NSString)companionBundleIdentifier;
- (NSString)localizedDisplayName;
- (NSString)watchBundleIdentifier;
- (id)protobufData;
- (int)processID;
- (unsigned)playbackState;
- (void)setCompanionBundleIdentifier:(id)a3;
- (void)setIconDigest:(id)a3;
- (void)setLocalizedDisplayName:(id)a3;
- (void)setPlaybackState:(unsigned int)a3;
- (void)setProcessID:(int)a3;
- (void)setWatchBundleIdentifier:(id)a3;
@end

@implementation NMRNowPlayingApplicationInfo

- (NMRNowPlayingApplicationInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)NMRNowPlayingApplicationInfo;
  v2 = [(NMRNowPlayingApplicationInfo *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    protobuf = v2->_protobuf;
    v2->_protobuf = (_NMRNowPlayingApplicationStateProtobuf *)v3;

    v5 = v2;
  }

  return v2;
}

- (NSString)companionBundleIdentifier
{
  return [(_NMRNowPlayingApplicationStateProtobuf *)self->_protobuf companionBundleIdentifier];
}

- (void)setCompanionBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    [(_NMRNowPlayingApplicationStateProtobuf *)self->_protobuf setCompanionBundleIdentifier:v4];
  }
}

- (NSString)watchBundleIdentifier
{
  return [(_NMRNowPlayingApplicationStateProtobuf *)self->_protobuf watchBundleIdentifier];
}

- (void)setWatchBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    [(_NMRNowPlayingApplicationStateProtobuf *)self->_protobuf setWatchBundleIdentifier:v4];
  }
}

- (NSString)localizedDisplayName
{
  return [(_NMRNowPlayingApplicationStateProtobuf *)self->_protobuf localizedDisplayName];
}

- (void)setLocalizedDisplayName:(id)a3
{
  if (a3) {
    -[_NMRNowPlayingApplicationStateProtobuf setLocalizedDisplayName:](self->_protobuf, "setLocalizedDisplayName:");
  }
}

- (unsigned)playbackState
{
  return [(_NMRNowPlayingApplicationStateProtobuf *)self->_protobuf playbackState];
}

- (void)setPlaybackState:(unsigned int)a3
{
  if (a3) {
    -[_NMRNowPlayingApplicationStateProtobuf setPlaybackState:](self->_protobuf, "setPlaybackState:");
  }
}

- (NSData)iconDigest
{
  return [(_NMRNowPlayingApplicationStateProtobuf *)self->_protobuf iconDigest];
}

- (void)setIconDigest:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    [(_NMRNowPlayingApplicationStateProtobuf *)self->_protobuf setIconDigest:v4];
  }
}

- (int)processID
{
  return self->_processID;
}

- (void)setProcessID:(int)a3
{
  self->_processID = a3;
  -[_NMRNowPlayingApplicationStateProtobuf setProcessID:](self->_protobuf, "setProcessID:");
}

- (NMRNowPlayingApplicationInfo)initWithProtobufData:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NMRNowPlayingApplicationInfo;
  v5 = [(NMRNowPlayingApplicationInfo *)&v11 init];
  if (v5)
  {
    v6 = [[_NMRNowPlayingApplicationStateProtobuf alloc] initWithData:v4];
    protobuf = v5->_protobuf;
    v5->_protobuf = v6;

    if ([(_NMRNowPlayingApplicationStateProtobuf *)v5->_protobuf hasProcessID]) {
      unsigned int v8 = [(_NMRNowPlayingApplicationStateProtobuf *)v5->_protobuf processID];
    }
    else {
      unsigned int v8 = [(id)objc_opt_class() _getNextPlaceholderProcessID];
    }
    v5->_processID = v8;
    v9 = v5;
  }

  return v5;
}

- (id)protobufData
{
  return [(_NMRNowPlayingApplicationStateProtobuf *)self->_protobuf data];
}

+ (int)_getNextPlaceholderProcessID
{
  int v2 = qword_100050640++;
  return (v2 % 10) ^ 0x7FFFFFFF;
}

- (void).cxx_destruct
{
}

@end