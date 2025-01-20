@interface MXProcessingError
- (BOOL)hasCode;
- (BOOL)hasErrorDescription;
- (BOOL)hasErrorSource;
- (BOOL)hasRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorDescription;
- (NSString)requestId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorSourceAsString:(int)a3;
- (int)StringAsErrorSource:(id)a3;
- (int)code;
- (int)errorSource;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(int)a3;
- (void)setErrorDescription:(id)a3;
- (void)setErrorSource:(int)a3;
- (void)setHasCode:(BOOL)a3;
- (void)setHasErrorSource:(BOOL)a3;
- (void)setRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXProcessingError

- (void)setCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (int)errorSource
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_errorSource;
  }
  else {
    return 0;
  }
}

- (void)setErrorSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_errorSource = a3;
}

- (void)setHasErrorSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasErrorSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)errorSourceAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_2654209C0[a3];
  }

  return v3;
}

- (int)StringAsErrorSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"QSS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MODALITY_X"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXProcessingError;
  int v4 = [(MXProcessingError *)&v8 description];
  v5 = [(MXProcessingError *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int v4 = [NSNumber numberWithInt:self->_code];
    [v3 setObject:v4 forKey:@"code"];
  }
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v3 setObject:errorDescription forKey:@"error_description"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t errorSource = self->_errorSource;
    if (errorSource >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_errorSource);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_2654209C0[errorSource];
    }
    [v3 setObject:v7 forKey:@"error_source"];
  }
  requestId = self->_requestId;
  if (requestId) {
    [v3 setObject:requestId forKey:@"request_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXProcessingErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_requestId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_code;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v5 = v4;
  if (self->_errorDescription)
  {
    objc_msgSend(v4, "setErrorDescription:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[6] = self->_errorSource;
    *((unsigned char *)v4 + 40) |= 2u;
  }
  if (self->_requestId)
  {
    objc_msgSend(v5, "setRequestId:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_code;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_errorDescription copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_errorSource;
    *(unsigned char *)(v6 + 40) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_requestId copyWithZone:a3];
  v10 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v9;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_code != *((_DWORD *)v4 + 2)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_17;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](errorDescription, "isEqual:"))
    {
LABEL_17:
      char v8 = 0;
      goto LABEL_18;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_errorSource != *((_DWORD *)v4 + 6)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_17;
  }
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](requestId, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_code;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_errorDescription hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_errorSource;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_requestId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[10])
  {
    self->_code = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[MXProcessingError setErrorDescription:](self, "setErrorDescription:");
    NSUInteger v4 = v5;
  }
  if ((v4[10] & 2) != 0)
  {
    self->_uint64_t errorSource = v4[6];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 4))
  {
    -[MXProcessingError setRequestId:](self, "setRequestId:");
    NSUInteger v4 = v5;
  }
}

- (int)code
{
  return self->_code;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);

  objc_storeStrong((id *)&self->_errorDescription, 0);
}

@end