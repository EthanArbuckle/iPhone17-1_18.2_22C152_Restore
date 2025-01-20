@interface COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagExpiration
- (BOOL)hasExpireUtcTime;
- (BOOL)hasTagId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)tagId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)expireUtcTime;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExpireUtcTime:(int64_t)a3;
- (void)setHasExpireUtcTime:(BOOL)a3;
- (void)setTagId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagExpiration

- (BOOL)hasTagId
{
  return self->_tagId != 0;
}

- (void)setExpireUtcTime:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_expireUtcTime = a3;
}

- (void)setHasExpireUtcTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpireUtcTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagExpiration;
  v4 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagExpiration *)&v8 description];
  v5 = [(COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagExpiration *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  tagId = self->_tagId;
  if (tagId) {
    [v3 setObject:tagId forKey:@"tag_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_expireUtcTime];
    [v4 setObject:v6 forKey:@"expire_utc_time"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagExpirationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_tagId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_tagId)
  {
    id v5 = v4;
    objc_msgSend(v4, "setTagId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_expireUtcTime;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_tagId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_expireUtcTime;
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
  tagId = self->_tagId;
  if ((unint64_t)tagId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](tagId, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_expireUtcTime == *((void *)v4 + 1))
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
  NSUInteger v3 = [(NSString *)self->_tagId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_expireUtcTime;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int64_t *)a3;
  if (v4[2])
  {
    uint64_t v5 = v4;
    -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagExpiration setTagId:](self, "setTagId:");
    uint64_t v4 = v5;
  }
  if (v4[3])
  {
    self->_expireUtcTime = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)tagId
{
  return self->_tagId;
}

- (void)setTagId:(id)a3
{
}

- (int64_t)expireUtcTime
{
  return self->_expireUtcTime;
}

- (void).cxx_destruct
{
}

@end