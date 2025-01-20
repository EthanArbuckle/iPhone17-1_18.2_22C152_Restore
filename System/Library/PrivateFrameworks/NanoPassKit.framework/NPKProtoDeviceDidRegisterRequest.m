@interface NPKProtoDeviceDidRegisterRequest
+ (Class)brokerRegionPushTopicsType;
+ (Class)tsmRegionPushTopicsType;
+ (Class)tsmRegionURLsType;
- (BOOL)hasPrimaryRegionTopic;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)brokerRegionPushTopics;
- (NSMutableArray)tsmRegionPushTopics;
- (NSMutableArray)tsmRegionURLs;
- (NSString)primaryRegionTopic;
- (id)brokerRegionPushTopicsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tsmRegionPushTopicsAtIndex:(unint64_t)a3;
- (id)tsmRegionURLsAtIndex:(unint64_t)a3;
- (unint64_t)brokerRegionPushTopicsCount;
- (unint64_t)hash;
- (unint64_t)tsmRegionPushTopicsCount;
- (unint64_t)tsmRegionURLsCount;
- (void)addBrokerRegionPushTopics:(id)a3;
- (void)addTsmRegionPushTopics:(id)a3;
- (void)addTsmRegionURLs:(id)a3;
- (void)clearBrokerRegionPushTopics;
- (void)clearTsmRegionPushTopics;
- (void)clearTsmRegionURLs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBrokerRegionPushTopics:(id)a3;
- (void)setPrimaryRegionTopic:(id)a3;
- (void)setTsmRegionPushTopics:(id)a3;
- (void)setTsmRegionURLs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoDeviceDidRegisterRequest

- (void)clearTsmRegionPushTopics
{
}

- (void)addTsmRegionPushTopics:(id)a3
{
  id v4 = a3;
  tsmRegionPushTopics = self->_tsmRegionPushTopics;
  id v8 = v4;
  if (!tsmRegionPushTopics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_tsmRegionPushTopics;
    self->_tsmRegionPushTopics = v6;

    id v4 = v8;
    tsmRegionPushTopics = self->_tsmRegionPushTopics;
  }
  [(NSMutableArray *)tsmRegionPushTopics addObject:v4];
}

- (unint64_t)tsmRegionPushTopicsCount
{
  return [(NSMutableArray *)self->_tsmRegionPushTopics count];
}

- (id)tsmRegionPushTopicsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_tsmRegionPushTopics objectAtIndex:a3];
}

+ (Class)tsmRegionPushTopicsType
{
  return (Class)objc_opt_class();
}

- (void)clearTsmRegionURLs
{
}

- (void)addTsmRegionURLs:(id)a3
{
  id v4 = a3;
  tsmRegionURLs = self->_tsmRegionURLs;
  id v8 = v4;
  if (!tsmRegionURLs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_tsmRegionURLs;
    self->_tsmRegionURLs = v6;

    id v4 = v8;
    tsmRegionURLs = self->_tsmRegionURLs;
  }
  [(NSMutableArray *)tsmRegionURLs addObject:v4];
}

- (unint64_t)tsmRegionURLsCount
{
  return [(NSMutableArray *)self->_tsmRegionURLs count];
}

- (id)tsmRegionURLsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_tsmRegionURLs objectAtIndex:a3];
}

+ (Class)tsmRegionURLsType
{
  return (Class)objc_opt_class();
}

- (void)clearBrokerRegionPushTopics
{
}

- (void)addBrokerRegionPushTopics:(id)a3
{
  id v4 = a3;
  brokerRegionPushTopics = self->_brokerRegionPushTopics;
  id v8 = v4;
  if (!brokerRegionPushTopics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_brokerRegionPushTopics;
    self->_brokerRegionPushTopics = v6;

    id v4 = v8;
    brokerRegionPushTopics = self->_brokerRegionPushTopics;
  }
  [(NSMutableArray *)brokerRegionPushTopics addObject:v4];
}

- (unint64_t)brokerRegionPushTopicsCount
{
  return [(NSMutableArray *)self->_brokerRegionPushTopics count];
}

- (id)brokerRegionPushTopicsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_brokerRegionPushTopics objectAtIndex:a3];
}

+ (Class)brokerRegionPushTopicsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPrimaryRegionTopic
{
  return self->_primaryRegionTopic != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoDeviceDidRegisterRequest;
  id v4 = [(NPKProtoDeviceDidRegisterRequest *)&v8 description];
  v5 = [(NPKProtoDeviceDidRegisterRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  tsmRegionPushTopics = self->_tsmRegionPushTopics;
  if (tsmRegionPushTopics) {
    [v3 setObject:tsmRegionPushTopics forKey:@"tsmRegionPushTopics"];
  }
  tsmRegionURLs = self->_tsmRegionURLs;
  if (tsmRegionURLs) {
    [v4 setObject:tsmRegionURLs forKey:@"tsmRegionURLs"];
  }
  brokerRegionPushTopics = self->_brokerRegionPushTopics;
  if (brokerRegionPushTopics) {
    [v4 setObject:brokerRegionPushTopics forKey:@"brokerRegionPushTopics"];
  }
  primaryRegionTopic = self->_primaryRegionTopic;
  if (primaryRegionTopic) {
    [v4 setObject:primaryRegionTopic forKey:@"primaryRegionTopic"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoDeviceDidRegisterRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = self->_tsmRegionPushTopics;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = self->_tsmRegionURLs;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v15 = self->_brokerRegionPushTopics;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }

  if (self->_primaryRegionTopic) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  if ([(NPKProtoDeviceDidRegisterRequest *)self tsmRegionPushTopicsCount])
  {
    [v16 clearTsmRegionPushTopics];
    unint64_t v4 = [(NPKProtoDeviceDidRegisterRequest *)self tsmRegionPushTopicsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoDeviceDidRegisterRequest *)self tsmRegionPushTopicsAtIndex:i];
        [v16 addTsmRegionPushTopics:v7];
      }
    }
  }
  if ([(NPKProtoDeviceDidRegisterRequest *)self tsmRegionURLsCount])
  {
    [v16 clearTsmRegionURLs];
    unint64_t v8 = [(NPKProtoDeviceDidRegisterRequest *)self tsmRegionURLsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NPKProtoDeviceDidRegisterRequest *)self tsmRegionURLsAtIndex:j];
        [v16 addTsmRegionURLs:v11];
      }
    }
  }
  if ([(NPKProtoDeviceDidRegisterRequest *)self brokerRegionPushTopicsCount])
  {
    [v16 clearBrokerRegionPushTopics];
    unint64_t v12 = [(NPKProtoDeviceDidRegisterRequest *)self brokerRegionPushTopicsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        v15 = [(NPKProtoDeviceDidRegisterRequest *)self brokerRegionPushTopicsAtIndex:k];
        [v16 addBrokerRegionPushTopics:v15];
      }
    }
  }
  if (self->_primaryRegionTopic) {
    objc_msgSend(v16, "setPrimaryRegionTopic:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v6 = self->_tsmRegionPushTopics;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addTsmRegionPushTopics:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v8);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unint64_t v12 = self->_tsmRegionURLs;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addTsmRegionURLs:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v14);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v18 = self->_brokerRegionPushTopics;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v22), "copyWithZone:", a3, (void)v27);
        [v5 addBrokerRegionPushTopics:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v20);
  }

  uint64_t v24 = [(NSString *)self->_primaryRegionTopic copyWithZone:a3];
  long long v25 = (void *)v5[2];
  v5[2] = v24;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((tsmRegionPushTopics = self->_tsmRegionPushTopics, !((unint64_t)tsmRegionPushTopics | v4[3]))
     || -[NSMutableArray isEqual:](tsmRegionPushTopics, "isEqual:"))
    && ((tsmRegionURLs = self->_tsmRegionURLs, !((unint64_t)tsmRegionURLs | v4[4]))
     || -[NSMutableArray isEqual:](tsmRegionURLs, "isEqual:"))
    && ((brokerRegionPushTopics = self->_brokerRegionPushTopics, !((unint64_t)brokerRegionPushTopics | v4[1]))
     || -[NSMutableArray isEqual:](brokerRegionPushTopics, "isEqual:")))
  {
    primaryRegionTopic = self->_primaryRegionTopic;
    if ((unint64_t)primaryRegionTopic | v4[2]) {
      char v9 = -[NSString isEqual:](primaryRegionTopic, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_tsmRegionPushTopics hash];
  uint64_t v4 = [(NSMutableArray *)self->_tsmRegionURLs hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_brokerRegionPushTopics hash];
  return v4 ^ v5 ^ [(NSString *)self->_primaryRegionTopic hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v4 = (id *)a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4[3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NPKProtoDeviceDidRegisterRequest *)self addTsmRegionPushTopics:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4[4];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NPKProtoDeviceDidRegisterRequest *)self addTsmRegionURLs:*(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v4[1];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[NPKProtoDeviceDidRegisterRequest addBrokerRegionPushTopics:](self, "addBrokerRegionPushTopics:", *(void *)(*((void *)&v20 + 1) + 8 * k), (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }

  if (v4[2]) {
    -[NPKProtoDeviceDidRegisterRequest setPrimaryRegionTopic:](self, "setPrimaryRegionTopic:");
  }
}

- (NSMutableArray)tsmRegionPushTopics
{
  return self->_tsmRegionPushTopics;
}

- (void)setTsmRegionPushTopics:(id)a3
{
}

- (NSMutableArray)tsmRegionURLs
{
  return self->_tsmRegionURLs;
}

- (void)setTsmRegionURLs:(id)a3
{
}

- (NSMutableArray)brokerRegionPushTopics
{
  return self->_brokerRegionPushTopics;
}

- (void)setBrokerRegionPushTopics:(id)a3
{
}

- (NSString)primaryRegionTopic
{
  return self->_primaryRegionTopic;
}

- (void)setPrimaryRegionTopic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tsmRegionURLs, 0);
  objc_storeStrong((id *)&self->_tsmRegionPushTopics, 0);
  objc_storeStrong((id *)&self->_primaryRegionTopic, 0);
  objc_storeStrong((id *)&self->_brokerRegionPushTopics, 0);
}

@end