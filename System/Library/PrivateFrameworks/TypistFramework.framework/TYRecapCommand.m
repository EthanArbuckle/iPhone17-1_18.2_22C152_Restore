@interface TYRecapCommand
- (NSString)commandDescription;
- (NSString)commandString;
- (RCPSyntheticEventStream)eventStream;
- (TYRecapCommand)initWithCommandType:(int)a3 commandString:(id)a4 commandDescription:(id)a5;
- (double)recapWaitOverrideInterval;
- (id)description;
- (int)commandType;
- (void)setCommandDescription:(id)a3;
- (void)setCommandString:(id)a3;
- (void)setCommandType:(int)a3;
- (void)setEventStream:(id)a3;
- (void)setRecapWaitOverrideInterval:(double)a3;
- (void)updateCommand:(int)a3 commandString:(id)a4 commandDescription:(id)a5;
@end

@implementation TYRecapCommand

- (TYRecapCommand)initWithCommandType:(int)a3 commandString:(id)a4 commandDescription:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TYRecapCommand;
  v10 = [(TYRecapCommand *)&v13 init];
  v11 = v10;
  if (v10) {
    [(TYRecapCommand *)v10 updateCommand:v6 commandString:v8 commandDescription:v9];
  }

  return v11;
}

- (void)updateCommand:(int)a3 commandString:(id)a4 commandDescription:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  [(TYRecapCommand *)self setRecapWaitOverrideInterval:0.0];
  [(TYRecapCommand *)self setCommandType:v6];
  v10 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v11 = [v9 stringByTrimmingCharactersInSet:v10];

  [(TYRecapCommand *)self setCommandString:v11];
  [(TYRecapCommand *)self setCommandDescription:v8];

  v12 = [(TYRecapCommand *)self commandString];
  objc_super v13 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v14 = [v12 stringByTrimmingCharactersInSet:v13];
  id v16 = [v14 componentsSeparatedByString:@" "];

  if (v6 == 1)
  {
    v15 = [MEMORY[0x263F62CF8] eventStreamWithCLIArguments:v16];
    [(TYRecapCommand *)self setEventStream:v15];
  }
  else
  {
    [(TYRecapCommand *)self setEventStream:0];
  }
}

- (id)description
{
  v3 = NSString;
  v4 = [(TYRecapCommand *)self commandDescription];
  v5 = [(TYRecapCommand *)self commandString];
  uint64_t v6 = [v3 stringWithFormat:@"%@\n(%@)", v4, v5];

  return v6;
}

- (int)commandType
{
  return self->_commandType;
}

- (void)setCommandType:(int)a3
{
  self->_commandType = a3;
}

- (NSString)commandString
{
  return self->_commandString;
}

- (void)setCommandString:(id)a3
{
}

- (NSString)commandDescription
{
  return self->_commandDescription;
}

- (void)setCommandDescription:(id)a3
{
}

- (RCPSyntheticEventStream)eventStream
{
  return self->_eventStream;
}

- (void)setEventStream:(id)a3
{
}

- (double)recapWaitOverrideInterval
{
  return self->_recapWaitOverrideInterval;
}

- (void)setRecapWaitOverrideInterval:(double)a3
{
  self->_recapWaitOverrideInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStream, 0);
  objc_storeStrong((id *)&self->_commandDescription, 0);
  objc_storeStrong((id *)&self->_commandString, 0);
}

@end