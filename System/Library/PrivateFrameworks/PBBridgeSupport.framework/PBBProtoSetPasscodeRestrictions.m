@interface PBBProtoSetPasscodeRestrictions
- (BOOL)hasWristDetectionDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wristDetectionDisabled;
- (NSData)restrictions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasWristDetectionDisabled:(BOOL)a3;
- (void)setRestrictions:(id)a3;
- (void)setWristDetectionDisabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoSetPasscodeRestrictions

- (void)setWristDetectionDisabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_wristDetectionDisabled = a3;
}

- (void)setHasWristDetectionDisabled:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWristDetectionDisabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoSetPasscodeRestrictions;
  v4 = [(PBBProtoSetPasscodeRestrictions *)&v8 description];
  v5 = [(PBBProtoSetPasscodeRestrictions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  restrictions = self->_restrictions;
  if (restrictions) {
    [v3 setObject:restrictions forKey:@"restrictions"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_wristDetectionDisabled];
    [v4 setObject:v6 forKey:@"wristDetectionDisabled"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoSetPasscodeRestrictionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteDataField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setRestrictions:self->_restrictions];
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_wristDetectionDisabled;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_restrictions copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_wristDetectionDisabled;
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
  restrictions = self->_restrictions;
  if ((unint64_t)restrictions | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](restrictions, "isEqual:")) {
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
    if (self->_wristDetectionDisabled)
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
  uint64_t v3 = [(NSData *)self->_restrictions hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_wristDetectionDisabled;
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
    -[PBBProtoSetPasscodeRestrictions setRestrictions:](self, "setRestrictions:");
    uint64_t v4 = v5;
  }
  if (v4[20])
  {
    self->_wristDetectionDisabled = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)restrictions
{
  return self->_restrictions;
}

- (void)setRestrictions:(id)a3
{
}

- (BOOL)wristDetectionDisabled
{
  return self->_wristDetectionDisabled;
}

- (void).cxx_destruct
{
}

@end