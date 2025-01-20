@interface UCFilePackagerPacket
- (NSData)packetData;
- (int64_t)packetNumber;
- (void)setPacketData:(id)a3;
- (void)setPacketNumber:(int64_t)a3;
@end

@implementation UCFilePackagerPacket

- (NSData)packetData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPacketData:(id)a3
{
}

- (int64_t)packetNumber
{
  return self->_packetNumber;
}

- (void)setPacketNumber:(int64_t)a3
{
  self->_packetNumber = a3;
}

- (void).cxx_destruct
{
}

@end