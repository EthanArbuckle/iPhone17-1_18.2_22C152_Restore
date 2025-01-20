@interface MRTransactionMessage
- (MRPlayerPath)playerPath;
- (MRTransactionMessage)initWithContentItems:(id)a3 forPlayerPath:(id)a4;
- (MRTransactionMessage)initWithName:(unint64_t)a3 packets:(id)a4 playerPath:(id)a5;
- (MRTransactionMessage)initWithPlaybackQueue:(id)a3 forPlayerPath:(id)a4;
- (NSArray)packets;
- (unint64_t)name;
- (unint64_t)type;
@end

@implementation MRTransactionMessage

- (MRTransactionMessage)initWithName:(unint64_t)a3 packets:(id)a4 playerPath:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)MRTransactionMessage;
  v10 = [(MRProtocolMessage *)&v26 init];
  if (v10)
  {
    v11 = objc_alloc_init(_MRTransactionMessageProtobuf);
    context = (void *)MEMORY[0x199718E70]([(_MRTransactionMessageProtobuf *)v11 setName:a3]);
    v12 = objc_alloc_init(_MRTransactionPacketsProtobuf);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v22 + 1) + 8 * v17) protobuf];
          [(_MRTransactionPacketsProtobuf *)v12 addPackets:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v15);
    }

    [(_MRTransactionMessageProtobuf *)v11 setPackets:v12];
    v19 = [v9 protobuf];
    [(_MRTransactionMessageProtobuf *)v11 setPlayerPath:v19];

    [(MRProtocolMessage *)v10 setUnderlyingCodableMessage:v11];
  }

  return v10;
}

- (MRTransactionMessage)initWithPlaybackQueue:(id)a3 forPlayerPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 contentItems];
  id v8 = [(MRTransactionMessage *)self initWithContentItems:v7 forPlayerPath:v6];

  return v8;
}

- (MRTransactionMessage)initWithContentItems:(id)a3 forPlayerPath:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)MRTransactionMessage;
  id v8 = [(MRProtocolMessage *)&v33 init];
  id v9 = v8;
  if (v8)
  {
    long long v25 = v8;
    objc_super v26 = v7;
    v10 = objc_alloc_init(_MRTransactionMessageProtobuf);
    v11 = objc_alloc_init(_MRTransactionPacketsProtobuf);
    [(_MRTransactionMessageProtobuf *)v10 setPackets:v11];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v27 = v6;
    id obj = v6;
    uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      uint64_t v15 = *MEMORY[0x1E4F1CF80];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          ExternalRepresentation = (void *)MRContentItemCreateExternalRepresentation(v15, v17);
          v19 = objc_alloc_init(_MRTransactionKeyProtobuf);
          [(_MRTransactionKeyProtobuf *)v19 setIdentifier:MRContentItemGetAncestorIdentifier(v17)];
          v20 = [[MRTransactionPacket alloc] initWithData:ExternalRepresentation forKey:v19];
          v21 = [(_MRTransactionMessageProtobuf *)v10 packets];
          long long v22 = [(MRTransactionPacket *)v20 protobuf];
          [v21 addPackets:v22];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v13);
    }

    [(_MRTransactionMessageProtobuf *)v10 setName:2];
    id v7 = v26;
    long long v23 = [v26 protobuf];
    [(_MRTransactionMessageProtobuf *)v10 setPlayerPath:v23];

    id v9 = v25;
    [(MRProtocolMessage *)v25 setUnderlyingCodableMessage:v10];

    id v6 = v27;
  }

  return v9;
}

- (NSArray)packets
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  packets = self->_packets;
  if (!packets)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = self->_packets;
    self->_packets = v4;

    id v6 = [(MRProtocolMessage *)self underlyingCodableMessage];
    id v7 = [v6 packets];
    id v8 = [v7 packets];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
          uint64_t v15 = [MRTransactionPacket alloc];
          uint64_t v16 = -[MRTransactionPacket initWithProtobuf:](v15, "initWithProtobuf:", v14, (void)v18);
          [(NSMutableArray *)self->_packets addObject:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    packets = self->_packets;
  }

  return (NSArray *)packets;
}

- (MRPlayerPath)playerPath
{
  v3 = [MRPlayerPath alloc];
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 playerPath];
  id v6 = [(MRPlayerPath *)v3 initWithProtobuf:v5];

  return v6;
}

- (unint64_t)name
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unint64_t v3 = [v2 name];

  return v3;
}

- (unint64_t)type
{
  return 33;
}

- (void).cxx_destruct
{
}

@end