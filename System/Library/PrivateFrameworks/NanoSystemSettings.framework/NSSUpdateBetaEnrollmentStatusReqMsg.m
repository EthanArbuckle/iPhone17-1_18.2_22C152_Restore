@interface NSSUpdateBetaEnrollmentStatusReqMsg
- (BOOL)hasBetaProgramInfo;
- (BOOL)hasUnenroll;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)unenroll;
- (NSData)betaProgramInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBetaProgramInfo:(id)a3;
- (void)setHasUnenroll:(BOOL)a3;
- (void)setUnenroll:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSUpdateBetaEnrollmentStatusReqMsg

- (BOOL)hasBetaProgramInfo
{
  return self->_betaProgramInfo != 0;
}

- (void)setUnenroll:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unenroll = a3;
}

- (void)setHasUnenroll:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUnenroll
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSUpdateBetaEnrollmentStatusReqMsg;
  v4 = [(NSSUpdateBetaEnrollmentStatusReqMsg *)&v8 description];
  v5 = [(NSSUpdateBetaEnrollmentStatusReqMsg *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  betaProgramInfo = self->_betaProgramInfo;
  if (betaProgramInfo) {
    [v3 setObject:betaProgramInfo forKey:@"betaProgramInfo"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_unenroll];
    [v4 setObject:v6 forKey:@"unenroll"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSUpdateBetaEnrollmentStatusReqMsgReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_betaProgramInfo)
  {
    PBDataWriterWriteDataField();
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
  if (self->_betaProgramInfo)
  {
    id v5 = v4;
    objc_msgSend(v4, "setBetaProgramInfo:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_unenroll;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_betaProgramInfo copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_unenroll;
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
  betaProgramInfo = self->_betaProgramInfo;
  if ((unint64_t)betaProgramInfo | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](betaProgramInfo, "isEqual:")) {
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
    if (self->_unenroll)
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
  uint64_t v3 = [(NSData *)self->_betaProgramInfo hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_unenroll;
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
    -[NSSUpdateBetaEnrollmentStatusReqMsg setBetaProgramInfo:](self, "setBetaProgramInfo:");
    uint64_t v4 = v5;
  }
  if (v4[20])
  {
    self->_unenroll = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)betaProgramInfo
{
  return self->_betaProgramInfo;
}

- (void)setBetaProgramInfo:(id)a3
{
}

- (BOOL)unenroll
{
  return self->_unenroll;
}

- (void).cxx_destruct
{
}

@end