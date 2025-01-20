@interface NMRSendCommandMessage
+ (id)messageWithCommand:(unsigned int)a3 bundleID:(id)a4 options:(id)a5 originIdentifier:(id)a6;
- (NMRSendCommandMessage)initWithCommand:(unsigned int)a3 bundleID:(id)a4 options:(id)a5 originIdentifier:(id)a6;
- (NMRSendCommandMessage)initWithProtobufData:(id)a3;
- (NSDate)serializationDate;
- (NSDictionary)options;
- (NSNumber)originIdentifier;
- (NSString)bundleID;
- (id)protobufData;
- (unsigned)command;
@end

@implementation NMRSendCommandMessage

+ (id)messageWithCommand:(unsigned int)a3 bundleID:(id)a4 options:(id)a5 originIdentifier:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [objc_alloc((Class)a1) initWithCommand:v8 bundleID:v12 options:v11 originIdentifier:v10];

  return v13;
}

- (NMRSendCommandMessage)initWithCommand:(unsigned int)a3 bundleID:(id)a4 options:(id)a5 originIdentifier:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)NMRSendCommandMessage;
  id v13 = [(NMRSendCommandMessage *)&v20 init];
  if (v13)
  {
    uint64_t v14 = objc_opt_new();
    protobuf = v13->_protobuf;
    v13->_protobuf = (_NMRSendCommandMessageProtobuf *)v14;

    [(_NMRSendCommandMessageProtobuf *)v13->_protobuf setCommand:sub_100007760(a3)];
    [(_NMRSendCommandMessageProtobuf *)v13->_protobuf setBundleID:v10];
    v16 = v13->_protobuf;
    v17 = sub_100007CA0(v11);
    [(_NMRSendCommandMessageProtobuf *)v16 setOptions:v17];

    -[_NMRSendCommandMessageProtobuf setOriginIdentifier:](v13->_protobuf, "setOriginIdentifier:", [v12 intValue]);
    v18 = v13;
  }

  return v13;
}

- (NMRSendCommandMessage)initWithProtobufData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NMRSendCommandMessage;
  v5 = [(NMRSendCommandMessage *)&v10 init];
  if (v5)
  {
    v6 = [[_NMRSendCommandMessageProtobuf alloc] initWithData:v4];
    protobuf = v5->_protobuf;
    v5->_protobuf = v6;

    uint64_t v8 = v5;
  }

  return v5;
}

- (unsigned)command
{
  int v2 = [(_NMRSendCommandMessageProtobuf *)self->_protobuf command];

  return sub_100007A24(v2);
}

- (NSString)bundleID
{
  return [(_NMRSendCommandMessageProtobuf *)self->_protobuf bundleID];
}

- (NSDictionary)options
{
  int v2 = [(_NMRSendCommandMessageProtobuf *)self->_protobuf options];
  v3 = sub_100007D58(v2);

  return (NSDictionary *)v3;
}

- (NSNumber)originIdentifier
{
  if ([(_NMRSendCommandMessageProtobuf *)self->_protobuf hasOriginIdentifier])
  {
    v3 = +[NSNumber numberWithInt:[(_NMRSendCommandMessageProtobuf *)self->_protobuf originIdentifier]];
  }
  else
  {
    v3 = 0;
  }

  return (NSNumber *)v3;
}

- (id)protobufData
{
  protobuf = self->_protobuf;
  id v4 = +[NSDate date];
  [v4 timeIntervalSinceReferenceDate];
  -[_NMRSendCommandMessageProtobuf setTimestamp:](protobuf, "setTimestamp:");

  v5 = self->_protobuf;

  return [(_NMRSendCommandMessageProtobuf *)v5 data];
}

- (NSDate)serializationDate
{
  if ([(_NMRSendCommandMessageProtobuf *)self->_protobuf hasTimestamp])
  {
    [(_NMRSendCommandMessageProtobuf *)self->_protobuf timestamp];
    v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

- (void).cxx_destruct
{
}

@end