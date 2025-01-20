@interface SDAutoUnlockDeviceRegistrationStep
- (BOOL)hasErrorCode;
- (BOOL)hasStepData;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)stepData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setStepData:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockDeviceRegistrationStep

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasStepData
{
  return self->_stepData != 0;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDAutoUnlockDeviceRegistrationStep;
  char v3 = [(SDAutoUnlockDeviceRegistrationStep *)&v7 description];
  v4 = [(SDAutoUnlockDeviceRegistrationStep *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  stepData = self->_stepData;
  if (stepData) {
    [v3 setObject:stepData forKey:@"stepData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_errorCode];
    [v3 setObject:v6 forKey:@"errorCode"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockDeviceRegistrationStepReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_stepData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[6] = self->_version;
    *((unsigned char *)v4 + 28) |= 2u;
  }
  if (self->_stepData)
  {
    id v5 = v4;
    [v4 setStepData:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_errorCode;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[6] = self->_version;
    *((unsigned char *)v5 + 28) |= 2u;
  }
  id v7 = [(NSData *)self->_stepData copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v6 + 2) = self->_errorCode;
    *((unsigned char *)v6 + 28) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  stepData = self->_stepData;
  if ((unint64_t)stepData | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](stepData, "isEqual:"))
    {
LABEL_14:
      BOOL v7 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_14;
    }
    BOOL v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSData *)self->_stepData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if ((v4[7] & 2) != 0)
  {
    self->_version = v4[6];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[SDAutoUnlockDeviceRegistrationStep setStepData:](self, "setStepData:");
    unint64_t v4 = v5;
  }
  if (v4[7])
  {
    self->_errorCode = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)stepData
{
  return self->_stepData;
}

- (void)setStepData:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
}

@end