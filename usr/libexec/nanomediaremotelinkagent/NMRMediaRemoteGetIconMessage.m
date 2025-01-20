@interface NMRMediaRemoteGetIconMessage
+ (id)messageWithIconWidth:(double)a3 height:(double)a4 bundleID:(id)a5 originIdentifier:(id)a6;
- (NMRMediaRemoteGetIconMessage)initWithProtobufData:(id)a3;
- (NSDate)serializationDate;
- (NSNumber)height;
- (NSNumber)originIdentifier;
- (NSNumber)width;
- (NSString)bundleID;
- (id)_initWithIconWidth:(double)a3 height:(double)a4 bundleID:(id)a5 originIdentifier:(id)a6;
- (id)protobufData;
@end

@implementation NMRMediaRemoteGetIconMessage

+ (id)messageWithIconWidth:(double)a3 height:(double)a4 bundleID:(id)a5 originIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = [objc_alloc((Class)a1) _initWithIconWidth:v11 height:v10 bundleID:a3 originIdentifier:a4];

  return v12;
}

- (id)_initWithIconWidth:(double)a3 height:(double)a4 bundleID:(id)a5 originIdentifier:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NMRMediaRemoteGetIconMessage;
  id v12 = [(NMRMediaRemoteGetIconMessage *)&v16 init];
  if (v12)
  {
    uint64_t v13 = objc_opt_new();
    protobuf = v12->_protobuf;
    v12->_protobuf = (_NMRMediaRemoteGetIconMessage *)v13;

    [(_NMRMediaRemoteGetIconMessage *)v12->_protobuf setWidth:a3];
    [(_NMRMediaRemoteGetIconMessage *)v12->_protobuf setHeight:a4];
    [(_NMRMediaRemoteGetIconMessage *)v12->_protobuf setBundleID:v10];
    -[_NMRMediaRemoteGetIconMessage setOriginIdentifier:](v12->_protobuf, "setOriginIdentifier:", [v11 intValue]);
  }

  return v12;
}

- (NSNumber)width
{
  [(_NMRMediaRemoteGetIconMessage *)self->_protobuf width];

  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

- (NSNumber)height
{
  [(_NMRMediaRemoteGetIconMessage *)self->_protobuf height];

  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

- (NSString)bundleID
{
  return [(_NMRMediaRemoteGetIconMessage *)self->_protobuf bundleID];
}

- (NSNumber)originIdentifier
{
  if ([(_NMRMediaRemoteGetIconMessage *)self->_protobuf hasOriginIdentifier])
  {
    v3 = +[NSNumber numberWithInt:[(_NMRMediaRemoteGetIconMessage *)self->_protobuf originIdentifier]];
  }
  else
  {
    v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSDate)serializationDate
{
  if ([(_NMRMediaRemoteGetIconMessage *)self->_protobuf hasTimestamp])
  {
    [(_NMRMediaRemoteGetIconMessage *)self->_protobuf timestamp];
    v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

- (NMRMediaRemoteGetIconMessage)initWithProtobufData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NMRMediaRemoteGetIconMessage;
  v5 = [(NMRMediaRemoteGetIconMessage *)&v10 init];
  if (v5)
  {
    v6 = [[_NMRMediaRemoteGetIconMessage alloc] initWithData:v4];
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
  -[_NMRMediaRemoteGetIconMessage setTimestamp:](protobuf, "setTimestamp:");

  v5 = self->_protobuf;

  return [(_NMRMediaRemoteGetIconMessage *)v5 data];
}

- (void).cxx_destruct
{
}

@end