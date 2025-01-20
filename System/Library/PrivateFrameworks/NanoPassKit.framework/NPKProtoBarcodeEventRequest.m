@interface NPKProtoBarcodeEventRequest
+ (Class)associatedApplicationIdentifiersType;
- (BOOL)hasRequestData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)requestData;
- (NSMutableArray)associatedApplicationIdentifiers;
- (id)associatedApplicationIdentifiersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)associatedApplicationIdentifiersCount;
- (unint64_t)hash;
- (void)addAssociatedApplicationIdentifiers:(id)a3;
- (void)clearAssociatedApplicationIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociatedApplicationIdentifiers:(id)a3;
- (void)setRequestData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoBarcodeEventRequest

- (BOOL)hasRequestData
{
  return self->_requestData != 0;
}

- (void)clearAssociatedApplicationIdentifiers
{
}

- (void)addAssociatedApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  associatedApplicationIdentifiers = self->_associatedApplicationIdentifiers;
  id v8 = v4;
  if (!associatedApplicationIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_associatedApplicationIdentifiers;
    self->_associatedApplicationIdentifiers = v6;

    id v4 = v8;
    associatedApplicationIdentifiers = self->_associatedApplicationIdentifiers;
  }
  [(NSMutableArray *)associatedApplicationIdentifiers addObject:v4];
}

- (unint64_t)associatedApplicationIdentifiersCount
{
  return [(NSMutableArray *)self->_associatedApplicationIdentifiers count];
}

- (id)associatedApplicationIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_associatedApplicationIdentifiers objectAtIndex:a3];
}

+ (Class)associatedApplicationIdentifiersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoBarcodeEventRequest;
  id v4 = [(NPKProtoBarcodeEventRequest *)&v8 description];
  v5 = [(NPKProtoBarcodeEventRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  requestData = self->_requestData;
  if (requestData) {
    [v3 setObject:requestData forKey:@"requestData"];
  }
  associatedApplicationIdentifiers = self->_associatedApplicationIdentifiers;
  if (associatedApplicationIdentifiers) {
    [v4 setObject:associatedApplicationIdentifiers forKey:@"associatedApplicationIdentifiers"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoBarcodeEventRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_requestData) {
    PBDataWriterWriteDataField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_associatedApplicationIdentifiers;
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
  if (self->_requestData) {
    objc_msgSend(v8, "setRequestData:");
  }
  if ([(NPKProtoBarcodeEventRequest *)self associatedApplicationIdentifiersCount])
  {
    [v8 clearAssociatedApplicationIdentifiers];
    unint64_t v4 = [(NPKProtoBarcodeEventRequest *)self associatedApplicationIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoBarcodeEventRequest *)self associatedApplicationIdentifiersAtIndex:i];
        [v8 addAssociatedApplicationIdentifiers:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_requestData copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_associatedApplicationIdentifiers;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addAssociatedApplicationIdentifiers:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestData = self->_requestData, !((unint64_t)requestData | v4[2]))
     || -[NSData isEqual:](requestData, "isEqual:")))
  {
    associatedApplicationIdentifiers = self->_associatedApplicationIdentifiers;
    if ((unint64_t)associatedApplicationIdentifiers | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](associatedApplicationIdentifiers, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_requestData hash];
  return [(NSMutableArray *)self->_associatedApplicationIdentifiers hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NPKProtoBarcodeEventRequest setRequestData:](self, "setRequestData:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NPKProtoBarcodeEventRequest addAssociatedApplicationIdentifiers:](self, "addAssociatedApplicationIdentifiers:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
}

- (NSMutableArray)associatedApplicationIdentifiers
{
  return self->_associatedApplicationIdentifiers;
}

- (void)setAssociatedApplicationIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_associatedApplicationIdentifiers, 0);
}

@end