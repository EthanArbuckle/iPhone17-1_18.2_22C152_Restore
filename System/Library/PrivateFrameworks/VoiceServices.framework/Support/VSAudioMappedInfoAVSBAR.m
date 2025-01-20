@interface VSAudioMappedInfoAVSBAR
- (BOOL)endOfSiriTTSUtterance;
- (_NSRange)audioBytesRange;
- (_NSRange)packetDescriptionsRange;
- (unint64_t)packetCount;
- (void)setAudioBytesRange:(_NSRange)a3;
- (void)setEndOfSiriTTSUtterance:(BOOL)a3;
- (void)setPacketCount:(unint64_t)a3;
- (void)setPacketDescriptionsRange:(_NSRange)a3;
@end

@implementation VSAudioMappedInfoAVSBAR

- (void)setEndOfSiriTTSUtterance:(BOOL)a3
{
  self->_endOfSiriTTSUtterance = a3;
}

- (BOOL)endOfSiriTTSUtterance
{
  return self->_endOfSiriTTSUtterance;
}

- (void)setPacketDescriptionsRange:(_NSRange)a3
{
  self->_packetDescriptionsRange = a3;
}

- (_NSRange)packetDescriptionsRange
{
  NSUInteger length = self->_packetDescriptionsRange.length;
  NSUInteger location = self->_packetDescriptionsRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setPacketCount:(unint64_t)a3
{
  self->_packetCount = a3;
}

- (unint64_t)packetCount
{
  return self->_packetCount;
}

- (void)setAudioBytesRange:(_NSRange)a3
{
  self->_audioBytesRange = a3;
}

- (_NSRange)audioBytesRange
{
  NSUInteger length = self->_audioBytesRange.length;
  NSUInteger location = self->_audioBytesRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end