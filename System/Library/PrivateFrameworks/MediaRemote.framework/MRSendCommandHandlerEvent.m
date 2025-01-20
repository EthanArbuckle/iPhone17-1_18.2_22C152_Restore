@interface MRSendCommandHandlerEvent
+ (id)eventWithCommand:(unsigned int)a3 options:(id)a4;
- (MRSendCommandHandlerEvent)initWithCommand:(unsigned int)a3 options:(id)a4;
- (MRSendCommandHandlerEvent)initWithProtobuf:(id)a3;
- (NSDictionary)options;
- (NSString)commandDescription;
- (_MRSendCommandMessageProtobuf)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)command;
@end

@implementation MRSendCommandHandlerEvent

+ (id)eventWithCommand:(unsigned int)a3 options:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithCommand:v4 options:v6];

  return v7;
}

- (MRSendCommandHandlerEvent)initWithCommand:(unsigned int)a3 options:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MRSendCommandHandlerEvent;
  v8 = [(MRSendCommandHandlerEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_command = a3;
    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v9;
}

- (MRSendCommandHandlerEvent)initWithProtobuf:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = MRMediaRemoteCommandFromProtobuf([v4 command]);
    id v6 = [v4 options];

    id v7 = MRMediaRemoteCommandOptionsFromProtobuf(v6);
    self = [(MRSendCommandHandlerEvent *)self initWithCommand:v5 options:v7];

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)commandDescription
{
  v2 = MRMediaRemoteCopyCommandDescription([(MRSendCommandHandlerEvent *)self command]);

  return (NSString *)v2;
}

- (_MRSendCommandMessageProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRSendCommandMessageProtobuf);
  [(_MRSendCommandMessageProtobuf *)v3 setCommand:MRMediaRemoteCommandToProtobuf([(MRSendCommandHandlerEvent *)self command])];
  id v4 = [(MRSendCommandHandlerEvent *)self options];
  uint64_t v5 = MRMediaRemoteCommandOptionsToProtobuf(v4);
  [(_MRSendCommandMessageProtobuf *)v3 setOptions:v5];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(MRSendCommandHandlerEvent *)self command];
  id v7 = [(MRSendCommandHandlerEvent *)self options];
  v8 = (void *)[v7 copyWithZone:a3];
  v9 = (void *)[v5 initWithCommand:v6 options:v8];

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(MRSendCommandHandlerEvent *)self commandDescription];
  uint64_t v6 = [(MRSendCommandHandlerEvent *)self options];
  id v7 = MRCreateIndentedDebugDescriptionFromObject(v6);
  v8 = [v3 stringWithFormat:@"<%@ : %p {\n   command= %@\n   options= %@\n}>\n", v4, self, v5, v7];

  return v8;
}

- (unsigned)command
{
  return self->_command;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end