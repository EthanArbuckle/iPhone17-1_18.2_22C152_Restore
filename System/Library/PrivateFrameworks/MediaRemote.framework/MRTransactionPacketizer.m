@interface MRTransactionPacketizer
- (BOOL)isEmpty;
- (void)packetize:(id)a3 packageSize:(unint64_t)a4 completion:(id)a5;
- (void)unpacketize:(id)a3 completion:(id)a4;
@end

@implementation MRTransactionPacketizer

- (BOOL)isEmpty
{
  return ![(NSMutableArray *)self->_outgoingPackets count]
      && [(NSMutableDictionary *)self->_incomingPackets count] == 0;
}

- (void)packetize:(id)a3 packageSize:(unint64_t)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void (**)(id, void *, BOOL))a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  outgoingPackets = self->_outgoingPackets;
  if (!outgoingPackets)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v13 = self->_outgoingPackets;
    self->_outgoingPackets = v12;

    outgoingPackets = self->_outgoingPackets;
  }
  [(NSMutableArray *)outgoingPackets addObjectsFromArray:v8];
  while (a4)
  {
    if (![(NSMutableArray *)self->_outgoingPackets count]) {
      break;
    }
    v14 = [(NSMutableArray *)self->_outgoingPackets firstObject];
    uint64_t v15 = [v14 actualLength];
    unint64_t v16 = v15 - [v14 writePosition];
    unint64_t v17 = a4;
    if (a4 >= v16)
    {
      uint64_t v18 = [v14 actualLength];
      unint64_t v17 = v18 - [v14 writePosition];
    }
    [v14 setWriteLength:v17];
    [v10 addObject:v14];
    if ([v14 isWriteComplete]) {
      [(NSMutableArray *)self->_outgoingPackets removeObject:v14];
    }
    a4 -= v17;
  }
  v19 = MRTransactionPacketsGetShallowCopy(v10);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v20 = v10;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v24++), "writeComplete", (void)v25);
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v22);
  }

  v9[2](v9, v19, [(NSMutableArray *)self->_outgoingPackets count] != 0);
}

- (void)unpacketize:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v25 = (void (**)(id, void *))a4;
  if (!self->_incomingPackets)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    incomingPackets = self->_incomingPackets;
    self->_incomingPackets = v7;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        unint64_t v16 = self->_incomingPackets;
        unint64_t v17 = [v15 identifier];
        uint64_t v18 = [(NSMutableDictionary *)v16 objectForKey:v17];

        if (!v18)
        {
          uint64_t v18 = objc_alloc_init(MRTransactionPacketAccumulator);
          v19 = self->_incomingPackets;
          id v20 = [v15 identifier];
          [(NSMutableDictionary *)v19 setObject:v18 forKey:v20];
        }
        uint64_t v21 = [(MRTransactionPacketAccumulator *)v18 mergePacket:v15];
        if (v21)
        {
          if (!v12) {
            id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v12 addObject:v21];
          uint64_t v22 = self->_incomingPackets;
          uint64_t v23 = [v15 identifier];
          [(NSMutableDictionary *)v22 removeObjectForKey:v23];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }
  else
  {
    id v12 = 0;
  }

  uint64_t v24 = MRTransactionPacketsGetShallowCopy(v12);
  v25[2](v25, v24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingPackets, 0);

  objc_storeStrong((id *)&self->_outgoingPackets, 0);
}

@end