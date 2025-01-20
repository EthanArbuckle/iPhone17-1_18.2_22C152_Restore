@interface NPKProtoEnableServiceModeRequest
- (BOOL)cancelOutstandingRequests;
- (BOOL)hasCancelOutstandingRequests;
- (BOOL)hasUniqueID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)uniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCancelOutstandingRequests:(BOOL)a3;
- (void)setHasCancelOutstandingRequests:(BOOL)a3;
- (void)setUniqueID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoEnableServiceModeRequest

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (void)setCancelOutstandingRequests:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cancelOutstandingRequests = a3;
}

- (void)setHasCancelOutstandingRequests:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCancelOutstandingRequests
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoEnableServiceModeRequest;
  v4 = [(NPKProtoEnableServiceModeRequest *)&v8 description];
  v5 = [(NPKProtoEnableServiceModeRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  uniqueID = self->_uniqueID;
  if (uniqueID) {
    [v3 setObject:uniqueID forKey:@"uniqueID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_cancelOutstandingRequests];
    [v4 setObject:v6 forKey:@"cancelOutstandingRequests"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoEnableServiceModeRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uniqueID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_uniqueID)
  {
    id v5 = v4;
    objc_msgSend(v4, "setUniqueID:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_cancelOutstandingRequests;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueID copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_cancelOutstandingRequests;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  uniqueID = self->_uniqueID;
  if ((unint64_t)uniqueID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](uniqueID, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_cancelOutstandingRequests)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_cancelOutstandingRequests;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[NPKProtoEnableServiceModeRequest setUniqueID:](self, "setUniqueID:");
    uint64_t v4 = v5;
  }
  if (v4[20])
  {
    self->_cancelOutstandingRequests = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (BOOL)cancelOutstandingRequests
{
  return self->_cancelOutstandingRequests;
}

- (void).cxx_destruct
{
}

@end