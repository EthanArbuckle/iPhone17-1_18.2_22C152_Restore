@interface SCRDKGSPacket
- (NSData)data;
- (unsigned)command;
- (unsigned)subCommand;
- (void)setCommand:(unsigned __int8)a3;
- (void)setData:(id)a3;
- (void)setSubCommand:(unsigned __int8)a3;
@end

@implementation SCRDKGSPacket

- (unsigned)command
{
  return self->_command;
}

- (void)setCommand:(unsigned __int8)a3
{
  self->_command = a3;
}

- (unsigned)subCommand
{
  return self->_subCommand;
}

- (void)setSubCommand:(unsigned __int8)a3
{
  self->_subCommand = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end