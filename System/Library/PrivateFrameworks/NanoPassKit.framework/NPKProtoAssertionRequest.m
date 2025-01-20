@interface NPKProtoAssertionRequest
- (BOOL)hasAssertionType;
- (BOOL)hasPending;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (NSString)requestUUIDString;
- (id)assertionTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAssertionType:(id)a3;
- (int)assertionType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssertionType:(int)a3;
- (void)setHasAssertionType:(BOOL)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)setRequestUUIDString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoAssertionRequest

- (int)assertionType
{
  if (*(unsigned char *)&self->_has) {
    return self->_assertionType;
  }
  else {
    return 0;
  }
}

- (void)setAssertionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_assertionType = a3;
}

- (void)setHasAssertionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAssertionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)assertionTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2644D2808[a3];
  }
  return v3;
}

- (int)StringAsAssertionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Provisioning"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ProvisioningRequiringUpgradedPasscode"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPending:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPending
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoAssertionRequest;
  int v4 = [(NPKProtoAssertionRequest *)&v8 description];
  v5 = [(NPKProtoAssertionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  requestUUIDString = self->_requestUUIDString;
  if (requestUUIDString) {
    [v3 setObject:requestUUIDString forKey:@"requestUUIDString"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t assertionType = self->_assertionType;
    if (assertionType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_assertionType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_2644D2808[assertionType];
    }
    [v4 setObject:v8 forKey:@"assertionType"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_pending];
    [v4 setObject:v9 forKey:@"pending"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoAssertionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_requestUUIDString) {
    -[NPKProtoAssertionRequest writeTo:]();
  }
  id v6 = v4;
  PBDataWriterWriteStringField();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setRequestUUIDString:self->_requestUUIDString];
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 2) = self->_assertionType;
    *((unsigned char *)v5 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 24) = self->_pending;
    *((unsigned char *)v5 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestUUIDString copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_assertionType;
    *(unsigned char *)(v5 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 24) = self->_pending;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  requestUUIDString = self->_requestUUIDString;
  if ((unint64_t)requestUUIDString | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](requestUUIDString, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_assertionType != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_11;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0)
    {
LABEL_11:
      BOOL v6 = 0;
      goto LABEL_12;
    }
    if (self->_pending)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_11;
    }
    BOOL v6 = 1;
  }
LABEL_12:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestUUIDString hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_assertionType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_pending;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[NPKProtoAssertionRequest setRequestUUIDString:](self, "setRequestUUIDString:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if (v5)
  {
    self->_uint64_t assertionType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if ((v5 & 2) != 0)
  {
    self->_pending = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)requestUUIDString
{
  return self->_requestUUIDString;
}

- (void)setRequestUUIDString:(id)a3
{
}

- (BOOL)pending
{
  return self->_pending;
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoAssertionRequest writeTo:]", "NPKProtoAssertionRequest.m", 132, "nil != self->_requestUUIDString");
}

@end