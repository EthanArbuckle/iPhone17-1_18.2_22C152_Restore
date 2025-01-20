@interface SCRDHIMSBrailleSenseAppendEventsFromKeyPacket
@end

@implementation SCRDHIMSBrailleSenseAppendEventsFromKeyPacket

BOOL ___SCRDHIMSBrailleSenseAppendEventsFromKeyPacket_block_invoke(uint64_t a1, void *a2)
{
  return ([a2 unsignedIntValue] & 0xFF00) == 2048;
}

@end