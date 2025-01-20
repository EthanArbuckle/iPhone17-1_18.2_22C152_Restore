@interface NPKProtoReserveStorageForAppletTypesResponse
+ (Class)reservationIDType;
- (BOOL)hasErrorData;
- (BOOL)hasIsFull;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFull;
- (BOOL)readFrom:(id)a3;
- (NSData)errorData;
- (NSMutableArray)reservationIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)reservationIDAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)reservationIDsCount;
- (void)addReservationID:(id)a3;
- (void)clearReservationIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setHasIsFull:(BOOL)a3;
- (void)setIsFull:(BOOL)a3;
- (void)setReservationIDs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoReserveStorageForAppletTypesResponse

- (void)clearReservationIDs
{
}

- (void)addReservationID:(id)a3
{
  id v4 = a3;
  reservationIDs = self->_reservationIDs;
  id v8 = v4;
  if (!reservationIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_reservationIDs;
    self->_reservationIDs = v6;

    id v4 = v8;
    reservationIDs = self->_reservationIDs;
  }
  [(NSMutableArray *)reservationIDs addObject:v4];
}

- (unint64_t)reservationIDsCount
{
  return [(NSMutableArray *)self->_reservationIDs count];
}

- (id)reservationIDAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_reservationIDs objectAtIndex:a3];
}

+ (Class)reservationIDType
{
  return (Class)objc_opt_class();
}

- (void)setIsFull:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isFull = a3;
}

- (void)setHasIsFull:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsFull
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoReserveStorageForAppletTypesResponse;
  id v4 = [(NPKProtoReserveStorageForAppletTypesResponse *)&v8 description];
  v5 = [(NPKProtoReserveStorageForAppletTypesResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  reservationIDs = self->_reservationIDs;
  if (reservationIDs) {
    [v3 setObject:reservationIDs forKey:@"reservationID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_isFull];
    [v4 setObject:v6 forKey:@"isFull"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v4 setObject:errorData forKey:@"errorData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoReserveStorageForAppletTypesResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_reservationIDs;
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
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_errorData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = a3;
  if ([(NPKProtoReserveStorageForAppletTypesResponse *)self reservationIDsCount])
  {
    [v9 clearReservationIDs];
    unint64_t v4 = [(NPKProtoReserveStorageForAppletTypesResponse *)self reservationIDsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoReserveStorageForAppletTypesResponse *)self reservationIDAtIndex:i];
        [v9 addReservationID:v7];
      }
    }
  }
  uint64_t v8 = v9;
  if (*(unsigned char *)&self->_has)
  {
    v9[24] = self->_isFull;
    v9[28] |= 1u;
  }
  if (self->_errorData)
  {
    objc_msgSend(v9, "setErrorData:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_reservationIDs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (void)v15);
        [(id)v5 addReservationID:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_isFull;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v12 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3, (void)v15);
  long long v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  reservationIDs = self->_reservationIDs;
  if ((unint64_t)reservationIDs | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](reservationIDs, "isEqual:")) {
      goto LABEL_8;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_isFull)
      {
        if (*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
      }
      else if (!*((unsigned char *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    char v6 = 0;
    goto LABEL_9;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_8;
  }
LABEL_14:
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((void *)v4 + 1)) {
    char v6 = -[NSData isEqual:](errorData, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_reservationIDs hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_isFull;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSData *)self->_errorData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 2);
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
        -[NPKProtoReserveStorageForAppletTypesResponse addReservationID:](self, "addReservationID:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 28))
  {
    self->_isFull = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1)) {
    -[NPKProtoReserveStorageForAppletTypesResponse setErrorData:](self, "setErrorData:");
  }
}

- (NSMutableArray)reservationIDs
{
  return self->_reservationIDs;
}

- (void)setReservationIDs:(id)a3
{
}

- (BOOL)isFull
{
  return self->_isFull;
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservationIDs, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end