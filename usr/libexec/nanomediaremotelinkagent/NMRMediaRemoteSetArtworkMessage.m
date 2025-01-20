@interface NMRMediaRemoteSetArtworkMessage
+ (id)messageWithJPEGArtwork:(id)a3 originalDigest:(id)a4 originIdentifier:(id)a5;
- (NMRMediaRemoteSetArtworkMessage)initWithProtobufData:(id)a3;
- (NSData)jpegArtwork;
- (NSData)originalDigest;
- (NSDate)serializationDate;
- (NSNumber)originIdentifier;
- (id)_initWithJPEGArtwork:(id)a3 originalDigest:(id)a4 originIdentifier:(id)a5;
- (id)protobufData;
@end

@implementation NMRMediaRemoteSetArtworkMessage

+ (id)messageWithJPEGArtwork:(id)a3 originalDigest:(id)a4 originIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) _initWithJPEGArtwork:v10 originalDigest:v9 originIdentifier:v8];

  return v11;
}

- (id)_initWithJPEGArtwork:(id)a3 originalDigest:(id)a4 originIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NMRMediaRemoteSetArtworkMessage;
  id v11 = [(NMRMediaRemoteSetArtworkMessage *)&v15 init];
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    protobuf = v11->_protobuf;
    v11->_protobuf = (_NMRMediaRemoteSetArtworkMessage *)v12;

    [(_NMRMediaRemoteSetArtworkMessage *)v11->_protobuf setJpegData:v8];
    [(_NMRMediaRemoteSetArtworkMessage *)v11->_protobuf setOriginalDigest:v9];
    -[_NMRMediaRemoteSetArtworkMessage setOriginIdentifier:](v11->_protobuf, "setOriginIdentifier:", [v10 intValue]);
  }

  return v11;
}

- (NSData)jpegArtwork
{
  return [(_NMRMediaRemoteSetArtworkMessage *)self->_protobuf jpegData];
}

- (NSData)originalDigest
{
  return [(_NMRMediaRemoteSetArtworkMessage *)self->_protobuf originalDigest];
}

- (NSNumber)originIdentifier
{
  if ([(_NMRMediaRemoteSetArtworkMessage *)self->_protobuf hasOriginIdentifier])
  {
    v3 = +[NSNumber numberWithInt:[(_NMRMediaRemoteSetArtworkMessage *)self->_protobuf originIdentifier]];
  }
  else
  {
    v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSDate)serializationDate
{
  if ([(_NMRMediaRemoteSetArtworkMessage *)self->_protobuf hasTimestamp])
  {
    [(_NMRMediaRemoteSetArtworkMessage *)self->_protobuf timestamp];
    v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

- (NMRMediaRemoteSetArtworkMessage)initWithProtobufData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NMRMediaRemoteSetArtworkMessage;
  v5 = [(NMRMediaRemoteSetArtworkMessage *)&v10 init];
  if (v5)
  {
    v6 = [[_NMRMediaRemoteSetArtworkMessage alloc] initWithData:v4];
    protobuf = v5->_protobuf;
    v5->_protobuf = v6;

    id v8 = v5;
  }

  return v5;
}

- (id)protobufData
{
  protobuf = self->_protobuf;
  id v4 = +[NSDate date];
  [v4 timeIntervalSinceReferenceDate];
  -[_NMRMediaRemoteSetArtworkMessage setTimestamp:](protobuf, "setTimestamp:");

  v5 = self->_protobuf;

  return [(_NMRMediaRemoteSetArtworkMessage *)v5 data];
}

- (void).cxx_destruct
{
}

@end