@interface NPKProtoPassSettingsChangedRequest
- (BOOL)hasPassSettings;
- (BOOL)hasUniqueID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)uniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)passSettings;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPassSettings:(BOOL)a3;
- (void)setPassSettings:(unint64_t)a3;
- (void)setUniqueID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPassSettingsChangedRequest

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (void)setPassSettings:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_passSettings = a3;
}

- (void)setHasPassSettings:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPassSettings
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPassSettingsChangedRequest;
  v4 = [(NPKProtoPassSettingsChangedRequest *)&v8 description];
  v5 = [(NPKProtoPassSettingsChangedRequest *)self dictionaryRepresentation];
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
    v6 = [NSNumber numberWithUnsignedLongLong:self->_passSettings];
    [v4 setObject:v6 forKey:@"passSettings"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPassSettingsChangedRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteUint64Field();
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
    *((void *)v4 + 1) = self->_passSettings;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueID copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_passSettings;
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
  uniqueID = self->_uniqueID;
  if ((unint64_t)uniqueID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](uniqueID, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_passSettings == *((void *)v4 + 1))
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
  NSUInteger v3 = [(NSString *)self->_uniqueID hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_passSettings;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unint64_t *)a3;
  if (v4[2])
  {
    uint64_t v5 = v4;
    -[NPKProtoPassSettingsChangedRequest setUniqueID:](self, "setUniqueID:");
    unint64_t v4 = v5;
  }
  if (v4[3])
  {
    self->_passSettings = v4[1];
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

- (unint64_t)passSettings
{
  return self->_passSettings;
}

- (void).cxx_destruct
{
}

@end