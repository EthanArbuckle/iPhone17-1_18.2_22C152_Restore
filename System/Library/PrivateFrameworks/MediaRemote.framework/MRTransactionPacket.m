@interface MRTransactionPacket
- (BOOL)isReadComplete;
- (BOOL)isWriteComplete;
- (MRTransactionPacket)initWithData:(id)a3 forKey:(id)a4;
- (MRTransactionPacket)initWithPackets:(id)a3;
- (MRTransactionPacket)initWithProtobuf:(id)a3;
- (NSData)data;
- (NSString)identifier;
- (_MRTransactionKeyProtobuf)key;
- (_MRTransactionPacketProtobuf)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)actualLength;
- (unint64_t)totalLength;
- (unint64_t)totalWritePosition;
- (unint64_t)writeLength;
- (unint64_t)writePosition;
- (void)setWriteLength:(unint64_t)a3;
- (void)writeComplete;
@end

@implementation MRTransactionPacket

- (MRTransactionPacket)initWithData:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MRTransactionPacket;
  v9 = [(MRTransactionPacket *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a4);
    uint64_t v11 = [v7 mutableCopy];
    data = v10->_data;
    v10->_data = (NSMutableData *)v11;

    v13 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [v13 UUIDString];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v14;

    uint64_t v16 = [(NSMutableData *)v10->_data length];
    v10->_totalLength = v16;
    v10->_writeLength = v16;
    if (!v10->_key || !v10->_identifier || !v10->_data)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:v10 file:@"MRTransaction.m" lineNumber:33 description:@"Required Info for Transaction Packet Not Available"];
    }
  }

  return v10;
}

- (MRTransactionPacket)initWithPackets:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)MRTransactionPacket;
  v6 = [(MRTransactionPacket *)&v34 init];
  if (v6)
  {
    SEL v29 = a2;
    id v7 = [v5 firstObject];
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 key];
      key = v6->_key;
      v6->_key = (_MRTransactionKeyProtobuf *)v9;

      uint64_t v11 = [v8 identifier];
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v11;

      uint64_t v13 = [v8 totalLength];
      v6->_totalLength = v13;
      v6->_writeLength = v13;
    }
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v6->_totalLength];
    data = v6->_data;
    v6->_data = (NSMutableData *)v14;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v16 = v5;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v22 = [v21 identifier];
          char v23 = [v22 isEqualToString:v6->_identifier];

          if ((v23 & 1) == 0)
          {
            v26 = [MEMORY[0x1E4F28B00] currentHandler];
            [v26 handleFailureInMethod:v29 object:v6 file:@"MRTransaction.m" lineNumber:53 description:@"Appending packets with different properties"];
          }
          v24 = v6->_data;
          v25 = [v21 data];
          [(NSMutableData *)v24 appendData:v25];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v18);
    }

    if (!v6->_key || !v6->_identifier || !v6->_data)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:v29 object:v6 file:@"MRTransaction.m" lineNumber:57 description:@"Required Info for Transaction Packet Not Available"];
    }
  }

  return v6;
}

- (MRTransactionPacket)initWithProtobuf:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MRTransactionPacket;
  v6 = [(MRTransactionPacket *)&v17 init];
  if (v6)
  {
    uint64_t v7 = [v5 key];
    key = v6->_key;
    v6->_key = (_MRTransactionKeyProtobuf *)v7;

    uint64_t v9 = [v5 packetData];
    uint64_t v10 = [v9 mutableCopy];
    data = v6->_data;
    v6->_data = (NSMutableData *)v10;

    v12 = [v5 identifier];
    uint64_t v13 = [v12 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v13;

    v6->_totalLength = [v5 totalLength];
    v6->_writeLength = [(NSMutableData *)v6->_data length];
    v6->_totalWritePosition = [v5 totalWritePosition];
    if (!v6->_key || !v6->_identifier || !v6->_data)
    {
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:v6 file:@"MRTransaction.m" lineNumber:74 description:@"Required Info for Transaction Packet Not Available"];
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_data);
    objc_storeStrong((id *)(v5 + 16), self->_key);
    objc_storeStrong((id *)(v5 + 40), self->_identifier);
    *(void *)(v5 + 48) = self->_totalLength;
    *(void *)(v5 + 32) = self->_writePosition;
    *(void *)(v5 + 24) = self->_writeLength;
    *(void *)(v5 + 56) = self->_totalWritePosition;
  }
  return (id)v5;
}

- (_MRTransactionPacketProtobuf)protobuf
{
  uint64_t v4 = objc_alloc_init(_MRTransactionPacketProtobuf);
  unint64_t writePosition = self->_writePosition;
  if (writePosition > [(MRTransactionPacket *)self actualLength])
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MRTransaction.m", 101, @"Write Position: %lu greater than data length %lu", self->_writePosition, -[MRTransactionPacket actualLength](self, "actualLength"));
  }
  unint64_t v6 = self->_writeLength + self->_writePosition;
  if (v6 > [(MRTransactionPacket *)self actualLength])
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MRTransaction.m", 103, @"Next Write Pos: %lu greater than data length %lu", self->_writePosition, -[MRTransactionPacket actualLength](self, "actualLength"));
  }
  unint64_t v7 = [(NSMutableData *)self->_data bytes] + self->_writePosition;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v7 length:self->_writeLength];
  [(_MRTransactionPacketProtobuf *)v4 setPacketData:v8];
  [(_MRTransactionPacketProtobuf *)v4 setKey:self->_key];
  [(_MRTransactionPacketProtobuf *)v4 setIdentifier:self->_identifier];
  [(_MRTransactionPacketProtobuf *)v4 setTotalLength:self->_totalLength];
  [(_MRTransactionPacketProtobuf *)v4 setTotalWritePosition:self->_totalWritePosition];

  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Key = %@, Identifier = %@, TotalLength = %lu, ActualLength = %lu,", self->_key, self->_identifier, self->_totalLength, -[NSMutableData length](self->_data, "length")];
}

- (void)writeComplete
{
  unint64_t writeLength = self->_writeLength;
  unint64_t v5 = self->_writePosition + writeLength;
  self->_unint64_t writePosition = v5;
  self->_totalWritePosition += writeLength;
  if (v5 > [(NSMutableData *)self->_data length])
  {
    unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MRTransaction.m", 128, @"Write Position: %lu greater than data length %lu", self->_writePosition, -[NSMutableData length](self->_data, "length"));
  }
  if (self->_totalWritePosition > self->_totalLength)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MRTransaction.m", 130, @"Total Write Position: %lu greater than total length %lu", self->_totalWritePosition, self->_totalLength);
  }
}

- (void)setWriteLength:(unint64_t)a3
{
  self->_unint64_t writeLength = a3;
  unint64_t v5 = self->_writePosition + a3;
  if (v5 > [(NSMutableData *)self->_data length])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MRTransaction.m", 137, @"Write Position %lu + Write Length %lu greater than data length %lu", self->_writePosition, self->_writeLength, -[NSMutableData length](self->_data, "length"));
  }
}

- (unint64_t)actualLength
{
  return [(NSMutableData *)self->_data length];
}

- (BOOL)isReadComplete
{
  unint64_t totalLength = self->_totalLength;
  return totalLength == [(MRTransactionPacket *)self actualLength];
}

- (BOOL)isWriteComplete
{
  unint64_t v4 = self->_writeLength + self->_writePosition;
  if (v4 > [(MRTransactionPacket *)self actualLength])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MRTransaction.m" lineNumber:152 description:@"Length and Postion will cause overflow"];
  }
  unint64_t v5 = self->_writeLength + self->_writePosition;
  return v5 == [(MRTransactionPacket *)self actualLength];
}

- (NSData)data
{
  return &self->_data->super;
}

- (_MRTransactionKeyProtobuf)key
{
  return self->_key;
}

- (unint64_t)writeLength
{
  return self->_writeLength;
}

- (unint64_t)writePosition
{
  return self->_writePosition;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)totalLength
{
  return self->_totalLength;
}

- (unint64_t)totalWritePosition
{
  return self->_totalWritePosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end