@interface NMRSendCommandResultMessage
+ (id)messageWithErrorCode:(unsigned int)a3 handlerReturnStatuses:(id)a4 originIdentifier:(id)a5;
- (NMRSendCommandResultMessage)initWithProtobufData:(id)a3;
- (NSArray)handlerReturnStatuses;
- (NSDate)serializationDate;
- (NSNumber)originIdentifier;
- (id)_initWithErrorCode:(unsigned int)a3 handlerReturnStatuses:(id)a4 originIdentifier:(id)a5;
- (id)protobufData;
- (unsigned)errorCode;
@end

@implementation NMRSendCommandResultMessage

+ (id)messageWithErrorCode:(unsigned int)a3 handlerReturnStatuses:(id)a4 originIdentifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [objc_alloc((Class)a1) _initWithErrorCode:v6 handlerReturnStatuses:v9 originIdentifier:v8];

  return v10;
}

- (id)_initWithErrorCode:(unsigned int)a3 handlerReturnStatuses:(id)a4 originIdentifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)NMRSendCommandResultMessage;
  id v10 = [(NMRSendCommandResultMessage *)&v24 init];
  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    protobuf = v10->_protobuf;
    v10->_protobuf = (_NMRSendCommandResultMessageProtobuf *)v11;

    [(_NMRSendCommandResultMessageProtobuf *)v10->_protobuf setErrorCode:v6];
    -[_NMRSendCommandResultMessageProtobuf setOriginIdentifier:](v10->_protobuf, "setOriginIdentifier:", [v9 intValue]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = v8;
    id v14 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          -[v10->_protobuf addHandlerReturnStatus:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v17) unsignedIntValue]];
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v15);
    }

    v18 = v10;
  }

  return v10;
}

- (NMRSendCommandResultMessage)initWithProtobufData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NMRSendCommandResultMessage;
  v5 = [(NMRSendCommandResultMessage *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [[_NMRSendCommandResultMessageProtobuf alloc] initWithData:v4];
    protobuf = v5->_protobuf;
    v5->_protobuf = v6;

    id v8 = v5;
  }

  return v5;
}

- (unsigned)errorCode
{
  return [(_NMRSendCommandResultMessageProtobuf *)self->_protobuf errorCode];
}

- (NSArray)handlerReturnStatuses
{
  v3 = +[NSMutableArray array];
  if ([(_NMRSendCommandResultMessageProtobuf *)self->_protobuf handlerReturnStatusCount])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = +[NSNumber numberWithUnsignedInt:[(_NMRSendCommandResultMessageProtobuf *)self->_protobuf handlerReturnStatusAtIndex:v4]];
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [(_NMRSendCommandResultMessageProtobuf *)self->_protobuf handlerReturnStatusCount]);
  }

  return (NSArray *)v3;
}

- (NSNumber)originIdentifier
{
  if ([(_NMRSendCommandResultMessageProtobuf *)self->_protobuf hasOriginIdentifier])
  {
    v3 = +[NSNumber numberWithInt:[(_NMRSendCommandResultMessageProtobuf *)self->_protobuf originIdentifier]];
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
  unint64_t v4 = +[NSDate date];
  [v4 timeIntervalSinceReferenceDate];
  -[_NMRSendCommandResultMessageProtobuf setTimestamp:](protobuf, "setTimestamp:");

  v5 = self->_protobuf;

  return [(_NMRSendCommandResultMessageProtobuf *)v5 data];
}

- (NSDate)serializationDate
{
  if ([(_NMRSendCommandResultMessageProtobuf *)self->_protobuf hasTimestamp])
  {
    [(_NMRSendCommandResultMessageProtobuf *)self->_protobuf timestamp];
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