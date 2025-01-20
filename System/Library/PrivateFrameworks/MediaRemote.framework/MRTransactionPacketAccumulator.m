@interface MRTransactionPacketAccumulator
- (MRTransactionPacketAccumulator)init;
- (id)mergePacket:(id)a3;
@end

@implementation MRTransactionPacketAccumulator

- (MRTransactionPacketAccumulator)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRTransactionPacketAccumulator;
  v2 = [(MRTransactionPacketAccumulator *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    packets = v2->_packets;
    v2->_packets = v3;
  }
  return v2;
}

- (id)mergePacket:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 actualLength];
  packets = self->_packets;
  self->_currentLength += v6;
  [(NSMutableOrderedSet *)packets addObject:v5];
  unint64_t currentLength = self->_currentLength;
  if (currentLength > [v5 totalLength])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MRTransaction.m" lineNumber:196 description:@"Current Length greater than total length"];
  }
  if ([v5 totalLength] == self->_currentLength)
  {
    v9 = self->_packets;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__MRTransactionPacketAccumulator_mergePacket___block_invoke;
    v13[3] = &unk_1E57D7210;
    v13[4] = self;
    v13[5] = a2;
    [(NSMutableOrderedSet *)v9 sortUsingComparator:v13];
    v10 = [[MRTransactionPacket alloc] initWithPackets:self->_packets];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __46__MRTransactionPacketAccumulator_mergePacket___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 totalWritePosition];
  if (v7 == [v6 totalWritePosition])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"MRTransaction.m", 201, @"Duplicate total write positions %ld", objc_msgSend(v5, "totalWritePosition"));
  }
  unint64_t v8 = [v5 totalWritePosition];
  if (v8 > [v6 totalWritePosition]) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = -1;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end