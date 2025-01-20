@interface COMAPPLEPROACTIVEGMSGMSError
- (BOOL)hasErrorCode;
- (BOOL)hasErrorType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorTypeAsString:(int)a3;
- (int)StringAsErrorType:(id)a3;
- (int)errorType;
- (unint64_t)errorCode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(unint64_t)a3;
- (void)setErrorType:(int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEPROACTIVEGMSGMSError

- (unint64_t)errorCode
{
  return self->_errorCode;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 2) != 0)
  {
    self->_errorType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 20);
  }
  if (v5)
  {
    self->_errorCode = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_errorType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_errorCode;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_errorType != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_errorCode != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_errorType;
    *((unsigned char *)result + 20) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)result + 1) = self->_errorCode;
    *((unsigned char *)result + 20) |= 1u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = self->_errorType;
    *((unsigned char *)v4 + 20) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_errorCode;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEPROACTIVEGMSGMSErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t errorType = self->_errorType;
    if (errorType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_errorType);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = off_1E56C44A0[errorType];
    }
    [v3 setObject:v6 forKey:@"errorType"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_errorCode];
    [v3 setObject:v7 forKey:@"errorCode"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEPROACTIVEGMSGMSError;
  id v4 = [(COMAPPLEPROACTIVEGMSGMSError *)&v8 description];
  BOOL v5 = [(COMAPPLEPROACTIVEGMSGMSError *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setErrorCode:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (int)StringAsErrorType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GMS_ERROR_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GMS_ERROR_TYPE_GENERIC_ERROR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GMS_ERROR_TYPE_MODEL_MANAGER_SESSION_ERROR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GMS_ERROR_TYPE_GENERATIVE_FUNCTION_ERROR"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)errorTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E56C44A0[a3];
  }

  return v3;
}

- (BOOL)hasErrorType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasErrorType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setErrorType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t errorType = a3;
}

- (int)errorType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_errorType;
  }
  else {
    return 0;
  }
}

@end