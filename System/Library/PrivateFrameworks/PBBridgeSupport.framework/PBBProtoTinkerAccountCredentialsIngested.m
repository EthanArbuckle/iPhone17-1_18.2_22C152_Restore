@interface PBBProtoTinkerAccountCredentialsIngested
- (BOOL)hasCdpStatus;
- (BOOL)hasDetailedError;
- (BOOL)hasErrorDescription;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSData)detailedError;
- (NSString)errorDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)cdpStatus;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCdpStatus:(unsigned int)a3;
- (void)setDetailedError:(id)a3;
- (void)setErrorDescription:(id)a3;
- (void)setHasCdpStatus:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoTinkerAccountCredentialsIngested

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSuccess
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (void)setCdpStatus:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cdpStatus = a3;
}

- (void)setHasCdpStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCdpStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDetailedError
{
  return self->_detailedError != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoTinkerAccountCredentialsIngested;
  v4 = [(PBBProtoTinkerAccountCredentialsIngested *)&v8 description];
  v5 = [(PBBProtoTinkerAccountCredentialsIngested *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithBool:self->_success];
    [v3 setObject:v4 forKey:@"success"];
  }
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v3 setObject:errorDescription forKey:@"errorDescription"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_cdpStatus];
    [v3 setObject:v6 forKey:@"cdpStatus"];
  }
  detailedError = self->_detailedError;
  if (detailedError) {
    [v3 setObject:detailedError forKey:@"detailedError"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoTinkerAccountCredentialsIngestedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_detailedError)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[32] = self->_success;
    v4[36] |= 2u;
  }
  id v5 = v4;
  if (self->_errorDescription)
  {
    objc_msgSend(v4, "setErrorDescription:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_cdpStatus;
    v4[36] |= 1u;
  }
  if (self->_detailedError)
  {
    objc_msgSend(v5, "setDetailedError:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_success;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_errorDescription copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 8) = self->_cdpStatus;
    *(unsigned char *)(v6 + 36) |= 1u;
  }
  uint64_t v9 = [(NSData *)self->_detailedError copyWithZone:a3];
  v10 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v9;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0) {
      goto LABEL_20;
    }
    if (self->_success)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_20;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_20;
  }
  errorDescription = self->_errorDescription;
  if (!((unint64_t)errorDescription | *((void *)v4 + 3))) {
    goto LABEL_13;
  }
  if (!-[NSString isEqual:](errorDescription, "isEqual:"))
  {
LABEL_20:
    char v8 = 0;
    goto LABEL_21;
  }
  char has = (char)self->_has;
LABEL_13:
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_cdpStatus != *((_DWORD *)v4 + 2)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_20;
  }
  detailedError = self->_detailedError;
  if ((unint64_t)detailedError | *((void *)v4 + 2)) {
    char v8 = -[NSData isEqual:](detailedError, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_success;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_errorDescription hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_cdpStatus;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSData *)self->_detailedError hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    self->_success = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[PBBProtoTinkerAccountCredentialsIngested setErrorDescription:](self, "setErrorDescription:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 36))
  {
    self->_cdpStatus = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[PBBProtoTinkerAccountCredentialsIngested setDetailedError:](self, "setDetailedError:");
    id v4 = v5;
  }
}

- (BOOL)success
{
  return self->_success;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (unsigned)cdpStatus
{
  return self->_cdpStatus;
}

- (NSData)detailedError
{
  return self->_detailedError;
}

- (void)setDetailedError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_detailedError, 0);
}

@end