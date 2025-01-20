@interface _MLNetworkPacket
- (NSMutableData)buffer;
- (NSMutableData)doubleBuffer;
- (_MLNetworkPacket)init;
- (unint64_t)command;
- (unint64_t)sizeOfPacket;
- (void)cleanupDoubleBuffer;
- (void)reset;
- (void)resetDoubleBuffer;
- (void)resetMetadata;
- (void)setBuffer:(id)a3;
- (void)setCommand:(unint64_t)a3;
- (void)setDoubleBuffer:(id)a3;
- (void)setSizeOfPacket:(unint64_t)a3;
@end

@implementation _MLNetworkPacket

- (_MLNetworkPacket)init
{
  v8.receiver = self;
  v8.super_class = (Class)_MLNetworkPacket;
  v2 = [(_MLNetworkPacket *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    buffer = v2->_buffer;
    v2->_buffer = (NSMutableData *)v3;

    uint64_t v5 = objc_opt_new();
    doubleBuffer = v2->_doubleBuffer;
    v2->_doubleBuffer = (NSMutableData *)v5;

    v2->_sizeOfPacket = 0;
    v2->_command = 0;
  }
  return v2;
}

- (void)reset
{
  [(_MLNetworkPacket *)self setBuffer:0];
  [(_MLNetworkPacket *)self setDoubleBuffer:0];
  [(_MLNetworkPacket *)self resetMetadata];
}

- (void)resetMetadata
{
  [(_MLNetworkPacket *)self setCommand:0];
  [(_MLNetworkPacket *)self setSizeOfPacket:0];
}

- (void)cleanupDoubleBuffer
{
  [(_MLNetworkPacket *)self resetMetadata];
  [(_MLNetworkPacket *)self setDoubleBuffer:0];
}

- (void)resetDoubleBuffer
{
  uint64_t v3 = [(_MLNetworkPacket *)self doubleBuffer];
  [(_MLNetworkPacket *)self setBuffer:v3];

  v4 = objc_opt_new();
  [(_MLNetworkPacket *)self setDoubleBuffer:v4];

  [(_MLNetworkPacket *)self resetMetadata];
}

- (NSMutableData)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
}

- (NSMutableData)doubleBuffer
{
  return self->_doubleBuffer;
}

- (void)setDoubleBuffer:(id)a3
{
}

- (unint64_t)sizeOfPacket
{
  return self->_sizeOfPacket;
}

- (void)setSizeOfPacket:(unint64_t)a3
{
  self->_sizeOfPacket = a3;
}

- (unint64_t)command
{
  return self->_command;
}

- (void)setCommand:(unint64_t)a3
{
  self->_command = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleBuffer, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end