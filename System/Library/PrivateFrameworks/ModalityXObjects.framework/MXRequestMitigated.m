@interface MXRequestMitigated
- (BOOL)hasMitigationType;
- (BOOL)hasRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)requestId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mitigationTypeAsString:(int)a3;
- (int)StringAsMitigationType:(id)a3;
- (int)mitigationType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMitigationType:(BOOL)a3;
- (void)setMitigationType:(int)a3;
- (void)setRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXRequestMitigated

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (int)mitigationType
{
  if (*(unsigned char *)&self->_has) {
    return self->_mitigationType;
  }
  else {
    return 0;
  }
}

- (void)setMitigationType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_mitigationType = a3;
}

- (void)setHasMitigationType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMitigationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)mitigationTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_265420D80[a3];
  }

  return v3;
}

- (int)StringAsMitigationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_MITIGATION_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ACOUSTIC_ID_DETECTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WATERMARK_DETECTED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FINGERPRINT_DETECTED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FALSE_TRIGGER_DETECTED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LENIENT_PROMPT_SILENCE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NON_PROMPT_SILENCE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"NON_VOX_SILENCE"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXRequestMitigated;
  int v4 = [(MXRequestMitigated *)&v8 description];
  v5 = [(MXRequestMitigated *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  requestId = self->_requestId;
  if (requestId) {
    [v3 setObject:requestId forKey:@"request_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t mitigationType = self->_mitigationType;
    if (mitigationType >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mitigationType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_265420D80[mitigationType];
    }
    [v4 setObject:v7 forKey:@"mitigation_type"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXRequestMitigatedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestId)
  {
    PBDataWriterWriteStringField();
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
  if (self->_requestId)
  {
    id v5 = v4;
    objc_msgSend(v4, "setRequestId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_mitigationType;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_mitigationType;
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
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](requestId, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_mitigationType == *((_DWORD *)v4 + 2))
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
  NSUInteger v3 = [(NSString *)self->_requestId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_mitigationType;
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
    -[MXRequestMitigated setRequestId:](self, "setRequestId:");
    uint64_t v4 = v5;
  }
  if (v4[6])
  {
    self->_uint64_t mitigationType = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
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
}

@end