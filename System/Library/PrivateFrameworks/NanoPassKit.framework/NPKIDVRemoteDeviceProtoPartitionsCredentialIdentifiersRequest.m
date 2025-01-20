@interface NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersRequest
+ (Class)partitionsIdentifiersType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)partitionsIdentifiers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)partitionsIdentifiersAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)partitionsIdentifiersCount;
- (void)addPartitionsIdentifiers:(id)a3;
- (void)clearPartitionsIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPartitionsIdentifiers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersRequest

- (void)clearPartitionsIdentifiers
{
}

- (void)addPartitionsIdentifiers:(id)a3
{
  id v4 = a3;
  partitionsIdentifiers = self->_partitionsIdentifiers;
  id v8 = v4;
  if (!partitionsIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_partitionsIdentifiers;
    self->_partitionsIdentifiers = v6;

    id v4 = v8;
    partitionsIdentifiers = self->_partitionsIdentifiers;
  }
  [(NSMutableArray *)partitionsIdentifiers addObject:v4];
}

- (unint64_t)partitionsIdentifiersCount
{
  return [(NSMutableArray *)self->_partitionsIdentifiers count];
}

- (id)partitionsIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_partitionsIdentifiers objectAtIndex:a3];
}

+ (Class)partitionsIdentifiersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersRequest;
  id v4 = [(NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersRequest *)&v8 description];
  v5 = [(NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  partitionsIdentifiers = self->_partitionsIdentifiers;
  if (partitionsIdentifiers) {
    [v3 setObject:partitionsIdentifiers forKey:@"PartitionsIdentifiers"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_partitionsIdentifiers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersRequest *)self partitionsIdentifiersCount])
  {
    [v8 clearPartitionsIdentifiers];
    unint64_t v4 = [(NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersRequest *)self partitionsIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersRequest *)self partitionsIdentifiersAtIndex:i];
        [v8 addPartitionsIdentifiers:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_partitionsIdentifiers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addPartitionsIdentifiers:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    partitionsIdentifiers = self->_partitionsIdentifiers;
    if ((unint64_t)partitionsIdentifiers | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](partitionsIdentifiers, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_partitionsIdentifiers hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersRequest addPartitionsIdentifiers:](self, "addPartitionsIdentifiers:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)partitionsIdentifiers
{
  return self->_partitionsIdentifiers;
}

- (void)setPartitionsIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end