@interface NMRMediaRemoteSetStateMessage
+ (id)messageWithNowPlayingInfo:(id)a3 applicationInfo:(id)a4 supportedCommands:(id)a5 playbackQueue:(id)a6 originIdentifier:(id)a7;
- (NMRMediaRemoteSetStateMessage)initWithProtobufData:(id)a3;
- (NSData)applicationInfoData;
- (NSData)nowPlayingInfoData;
- (NSData)playbackQueueData;
- (NSData)supportedCommandsData;
- (NSDate)serializationDate;
- (NSNumber)originIdentifier;
- (id)_initWithNowPlayingInfo:(id)a3 applicationInfo:(id)a4 supportedCommands:(id)a5 playbackQueue:(id)a6 originIdentifier:(id)a7;
- (id)protobufData;
@end

@implementation NMRMediaRemoteSetStateMessage

- (id)_initWithNowPlayingInfo:(id)a3 applicationInfo:(id)a4 supportedCommands:(id)a5 playbackQueue:(id)a6 originIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NMRMediaRemoteSetStateMessage;
  v17 = [(NMRMediaRemoteSetStateMessage *)&v21 init];
  if (v17)
  {
    uint64_t v18 = objc_opt_new();
    protobuf = v17->_protobuf;
    v17->_protobuf = (_NMRMediaRemoteSetStateMessageProfobuf *)v18;

    [(_NMRMediaRemoteSetStateMessageProfobuf *)v17->_protobuf setNowPlayingInfo:v12];
    [(_NMRMediaRemoteSetStateMessageProfobuf *)v17->_protobuf setApplicationInfo:v13];
    [(_NMRMediaRemoteSetStateMessageProfobuf *)v17->_protobuf setSupportedCommands:v14];
    [(_NMRMediaRemoteSetStateMessageProfobuf *)v17->_protobuf setPlaybackQueue:v15];
    -[_NMRMediaRemoteSetStateMessageProfobuf setOriginIdentifier:](v17->_protobuf, "setOriginIdentifier:", [v16 intValue]);
  }

  return v17;
}

+ (id)messageWithNowPlayingInfo:(id)a3 applicationInfo:(id)a4 supportedCommands:(id)a5 playbackQueue:(id)a6 originIdentifier:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [objc_alloc((Class)a1) _initWithNowPlayingInfo:v16 applicationInfo:v15 supportedCommands:v14 playbackQueue:v13 originIdentifier:v12];

  return v17;
}

- (NSData)nowPlayingInfoData
{
  return [(_NMRMediaRemoteSetStateMessageProfobuf *)self->_protobuf nowPlayingInfo];
}

- (NSData)applicationInfoData
{
  return [(_NMRMediaRemoteSetStateMessageProfobuf *)self->_protobuf applicationInfo];
}

- (NSData)supportedCommandsData
{
  return [(_NMRMediaRemoteSetStateMessageProfobuf *)self->_protobuf supportedCommands];
}

- (NSData)playbackQueueData
{
  return [(_NMRMediaRemoteSetStateMessageProfobuf *)self->_protobuf playbackQueue];
}

- (NSNumber)originIdentifier
{
  if ([(_NMRMediaRemoteSetStateMessageProfobuf *)self->_protobuf hasOriginIdentifier])
  {
    v3 = +[NSNumber numberWithInt:[(_NMRMediaRemoteSetStateMessageProfobuf *)self->_protobuf originIdentifier]];
  }
  else
  {
    v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSDate)serializationDate
{
  if ([(_NMRMediaRemoteSetStateMessageProfobuf *)self->_protobuf hasTimestamp])
  {
    [(_NMRMediaRemoteSetStateMessageProfobuf *)self->_protobuf timestamp];
    v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

- (NMRMediaRemoteSetStateMessage)initWithProtobufData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NMRMediaRemoteSetStateMessage;
  v5 = [(NMRMediaRemoteSetStateMessage *)&v10 init];
  if (v5)
  {
    v6 = [[_NMRMediaRemoteSetStateMessageProfobuf alloc] initWithData:v4];
    protobuf = v5->_protobuf;
    v5->_protobuf = v6;

    v8 = v5;
  }

  return v5;
}

- (id)protobufData
{
  protobuf = self->_protobuf;
  id v4 = +[NSDate date];
  [v4 timeIntervalSinceReferenceDate];
  -[_NMRMediaRemoteSetStateMessageProfobuf setTimestamp:](protobuf, "setTimestamp:");

  v5 = self->_protobuf;

  return [(_NMRMediaRemoteSetStateMessageProfobuf *)v5 data];
}

- (void).cxx_destruct
{
}

@end