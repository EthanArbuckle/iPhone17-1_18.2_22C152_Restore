@interface NMSMediaSyncServiceModelObject
- (BOOL)hasContainerType;
- (BOOL)hasDataMultiverseID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)dataMultiverseID;
- (id)containerTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsContainerType:(id)a3;
- (int)containerType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContainerType:(int)a3;
- (void)setDataMultiverseID:(id)a3;
- (void)setHasContainerType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NMSMediaSyncServiceModelObject

- (BOOL)hasDataMultiverseID
{
  return self->_dataMultiverseID != 0;
}

- (int)containerType
{
  if (*(unsigned char *)&self->_has) {
    return self->_containerType;
  }
  else {
    return 0;
  }
}

- (void)setContainerType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_containerType = a3;
}

- (void)setHasContainerType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContainerType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)containerTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"Playlist";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"Album";
  }
  return v4;
}

- (int)StringAsContainerType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Album"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Playlist"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NMSMediaSyncServiceModelObject;
  int v4 = [(NMSMediaSyncServiceModelObject *)&v8 description];
  v5 = [(NMSMediaSyncServiceModelObject *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  dataMultiverseID = self->_dataMultiverseID;
  if (dataMultiverseID) {
    [v3 setObject:dataMultiverseID forKey:@"dataMultiverseID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int containerType = self->_containerType;
    if (containerType)
    {
      if (containerType == 1)
      {
        v7 = @"Playlist";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_containerType);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = @"Album";
    }
    [v4 setObject:v7 forKey:@"containerType"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NMSMediaSyncServiceModelObjectReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_dataMultiverseID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_dataMultiverseID)
  {
    id v5 = v4;
    objc_msgSend(v4, "setDataMultiverseID:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_containerType;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_dataMultiverseID copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_containerType;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  dataMultiverseID = self->_dataMultiverseID;
  if ((unint64_t)dataMultiverseID | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](dataMultiverseID, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_containerType == *((_DWORD *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_dataMultiverseID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_containerType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[NMSMediaSyncServiceModelObject setDataMultiverseID:](self, "setDataMultiverseID:");
    uint64_t v4 = v5;
  }
  if (v4[6])
  {
    self->_int containerType = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)dataMultiverseID
{
  return self->_dataMultiverseID;
}

- (void)setDataMultiverseID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end