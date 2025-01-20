@interface MRSendCommandMessage
- (MRPlayerPath)playerPath;
- (MRSendCommandMessage)initWithCommand:(unsigned int)a3 options:(id)a4 playerPath:(id)a5;
- (NSDate)serializationDate;
- (NSDictionary)options;
- (unint64_t)type;
- (unsigned)appOptions;
- (unsigned)command;
@end

@implementation MRSendCommandMessage

- (MRSendCommandMessage)initWithCommand:(unsigned int)a3 options:(id)a4 playerPath:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MRSendCommandMessage;
  v11 = [(MRProtocolMessage *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_options, a4);
    v13 = objc_alloc_init(_MRSendCommandMessageProtobuf);
    [(_MRSendCommandMessageProtobuf *)v13 setCommand:MRMediaRemoteCommandToProtobuf(v7)];
    v14 = MRMediaRemoteCommandOptionsToProtobuf(v9);
    [(_MRSendCommandMessageProtobuf *)v13 setOptions:v14];

    v15 = [v10 protobuf];
    [(_MRSendCommandMessageProtobuf *)v13 setPlayerPath:v15];

    [(MRProtocolMessage *)v12 setUnderlyingCodableMessage:v13];
  }

  return v12;
}

- (unint64_t)type
{
  return 1;
}

- (unsigned)command
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unsigned int v3 = MRMediaRemoteCommandFromProtobuf([v2 command]);

  return v3;
}

- (NSDictionary)options
{
  options = self->_options;
  if (!options)
  {
    v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
    v5 = [v4 options];
    MRMediaRemoteCommandOptionsFromProtobuf(v5);
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_options;
    self->_options = v6;

    options = self->_options;
  }

  return options;
}

- (MRPlayerPath)playerPath
{
  unsigned int v3 = [MRPlayerPath alloc];
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 playerPath];
  v6 = [(MRPlayerPath *)v3 initWithProtobuf:v5];

  return v6;
}

- (unsigned)appOptions
{
  v2 = [(NSDictionary *)self->_options objectForKey:@"kMRMediaRemoteOptionSendOptionsNumber"];
  unsigned int v3 = [v2 intValue];

  return v3;
}

- (NSDate)serializationDate
{
  return self->_serializationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializationDate, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end