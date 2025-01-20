@interface NMRMediaRemoteSetIconMessage
+ (id)messageWithIcon:(id)a3 originalDigest:(id)a4 bundleID:(id)a5 originIdentifier:(id)a6;
- (NMRMediaRemoteSetIconMessage)initWithProtobufData:(id)a3;
- (NSData)icon;
- (NSData)originalDigest;
- (NSDate)serializationDate;
- (NSNumber)originIdentifier;
- (NSString)bundleID;
- (id)_initWithIcon:(id)a3 originalDigest:(id)a4 bundleID:(id)a5 originIdentifier:(id)a6;
- (id)protobufData;
@end

@implementation NMRMediaRemoteSetIconMessage

+ (id)messageWithIcon:(id)a3 originalDigest:(id)a4 bundleID:(id)a5 originIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) _initWithIcon:v13 originalDigest:v12 bundleID:v11 originIdentifier:v10];

  return v14;
}

- (id)_initWithIcon:(id)a3 originalDigest:(id)a4 bundleID:(id)a5 originIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NMRMediaRemoteSetIconMessage;
  id v14 = [(NMRMediaRemoteSetIconMessage *)&v18 init];
  if (v14)
  {
    uint64_t v15 = objc_opt_new();
    protobuf = v14->_protobuf;
    v14->_protobuf = (_NMRMediaRemoteSetIconMessage *)v15;

    [(_NMRMediaRemoteSetIconMessage *)v14->_protobuf setIconData:v10];
    [(_NMRMediaRemoteSetIconMessage *)v14->_protobuf setOriginalDigest:v11];
    [(_NMRMediaRemoteSetIconMessage *)v14->_protobuf setBundleID:v12];
    -[_NMRMediaRemoteSetIconMessage setOriginIdentifier:](v14->_protobuf, "setOriginIdentifier:", [v13 intValue]);
  }

  return v14;
}

- (NSData)icon
{
  return [(_NMRMediaRemoteSetIconMessage *)self->_protobuf iconData];
}

- (NSData)originalDigest
{
  return [(_NMRMediaRemoteSetIconMessage *)self->_protobuf originalDigest];
}

- (NSString)bundleID
{
  return [(_NMRMediaRemoteSetIconMessage *)self->_protobuf bundleID];
}

- (NSNumber)originIdentifier
{
  if ([(_NMRMediaRemoteSetIconMessage *)self->_protobuf hasOriginIdentifier])
  {
    v3 = +[NSNumber numberWithInt:[(_NMRMediaRemoteSetIconMessage *)self->_protobuf originIdentifier]];
  }
  else
  {
    v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSDate)serializationDate
{
  if ([(_NMRMediaRemoteSetIconMessage *)self->_protobuf hasTimestamp])
  {
    [(_NMRMediaRemoteSetIconMessage *)self->_protobuf timestamp];
    v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

- (NMRMediaRemoteSetIconMessage)initWithProtobufData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NMRMediaRemoteSetIconMessage;
  v5 = [(NMRMediaRemoteSetIconMessage *)&v10 init];
  if (v5)
  {
    v6 = [[_NMRMediaRemoteSetIconMessage alloc] initWithData:v4];
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
  -[_NMRMediaRemoteSetIconMessage setTimestamp:](protobuf, "setTimestamp:");

  v5 = self->_protobuf;

  return [(_NMRMediaRemoteSetIconMessage *)v5 data];
}

- (void).cxx_destruct
{
}

@end