@interface NMRMediaRemoteGetStateMessage
+ (id)messageWithNowPlayingInfoDigest:(id)a3 applicationInfoDigest:(id)a4 supportedCommandsDigest:(id)a5 playbackQueueDigest:(id)a6 originIdentifier:(id)a7;
- (NMRMediaRemoteGetStateMessage)initWithProtobufData:(id)a3;
- (NSData)applicationInfoDigest;
- (NSData)nowPlayingInfoDigest;
- (NSData)playbackQueueDigest;
- (NSData)supportedCommandsDigest;
- (NSDate)serializationDate;
- (NSNumber)originIdentifier;
- (id)_initWithNowPlayingInfoDigest:(id)a3 applicationInfoDigest:(id)a4 supportedCommandsDigest:(id)a5 playbackQueueDigest:(id)a6 originIdentifier:(id)a7;
- (id)protobufData;
@end

@implementation NMRMediaRemoteGetStateMessage

+ (id)messageWithNowPlayingInfoDigest:(id)a3 applicationInfoDigest:(id)a4 supportedCommandsDigest:(id)a5 playbackQueueDigest:(id)a6 originIdentifier:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [objc_alloc((Class)a1) _initWithNowPlayingInfoDigest:v16 applicationInfoDigest:v15 supportedCommandsDigest:v14 playbackQueueDigest:v13 originIdentifier:v12];

  return v17;
}

- (id)_initWithNowPlayingInfoDigest:(id)a3 applicationInfoDigest:(id)a4 supportedCommandsDigest:(id)a5 playbackQueueDigest:(id)a6 originIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NMRMediaRemoteGetStateMessage;
  id v17 = [(NMRMediaRemoteGetStateMessage *)&v21 init];
  if (v17)
  {
    uint64_t v18 = objc_opt_new();
    protobuf = v17->_protobuf;
    v17->_protobuf = (_NMRMediaRemoteGetStateMessageProfobuf *)v18;

    [(_NMRMediaRemoteGetStateMessageProfobuf *)v17->_protobuf setNowPlayingInfoDigest:v12];
    [(_NMRMediaRemoteGetStateMessageProfobuf *)v17->_protobuf setApplicationInfoDigest:v13];
    [(_NMRMediaRemoteGetStateMessageProfobuf *)v17->_protobuf setSupportedCommandsDigest:v14];
    [(_NMRMediaRemoteGetStateMessageProfobuf *)v17->_protobuf setPlaybackQueueDigest:v15];
    -[_NMRMediaRemoteGetStateMessageProfobuf setOriginIdentifier:](v17->_protobuf, "setOriginIdentifier:", [v16 intValue]);
  }

  return v17;
}

- (NSData)nowPlayingInfoDigest
{
  return [(_NMRMediaRemoteGetStateMessageProfobuf *)self->_protobuf nowPlayingInfoDigest];
}

- (NSData)applicationInfoDigest
{
  return [(_NMRMediaRemoteGetStateMessageProfobuf *)self->_protobuf applicationInfoDigest];
}

- (NSData)supportedCommandsDigest
{
  return [(_NMRMediaRemoteGetStateMessageProfobuf *)self->_protobuf supportedCommandsDigest];
}

- (NSData)playbackQueueDigest
{
  return [(_NMRMediaRemoteGetStateMessageProfobuf *)self->_protobuf playbackQueueDigest];
}

- (NSNumber)originIdentifier
{
  if ([(_NMRMediaRemoteGetStateMessageProfobuf *)self->_protobuf hasOriginIdentifier])
  {
    v3 = +[NSNumber numberWithInt:[(_NMRMediaRemoteGetStateMessageProfobuf *)self->_protobuf originIdentifier]];
  }
  else
  {
    v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSDate)serializationDate
{
  if ([(_NMRMediaRemoteGetStateMessageProfobuf *)self->_protobuf hasTimestamp])
  {
    [(_NMRMediaRemoteGetStateMessageProfobuf *)self->_protobuf timestamp];
    v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

- (NMRMediaRemoteGetStateMessage)initWithProtobufData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NMRMediaRemoteGetStateMessage;
  v5 = [(NMRMediaRemoteGetStateMessage *)&v10 init];
  if (v5)
  {
    v6 = [[_NMRMediaRemoteGetStateMessageProfobuf alloc] initWithData:v4];
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
  -[_NMRMediaRemoteGetStateMessageProfobuf setTimestamp:](protobuf, "setTimestamp:");

  v5 = self->_protobuf;

  return [(_NMRMediaRemoteGetStateMessageProfobuf *)v5 data];
}

- (void).cxx_destruct
{
}

@end