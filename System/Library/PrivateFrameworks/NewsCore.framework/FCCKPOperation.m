@interface FCCKPOperation
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setOperationUUID:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPOperation

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_operationUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_7:
}

- (void)setOperationUUID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPOperation;
  id v4 = [(FCCKPOperation *)&v8 description];
  v5 = [(FCCKPOperation *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  operationUUID = self->_operationUUID;
  if (operationUUID) {
    [v3 setObject:operationUUID forKey:@"operationUUID"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v9 = [NSNumber numberWithInt:self->_type];
    [v4 setObject:v9 forKey:@"type"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  v10 = [NSNumber numberWithBool:self->_synchronousMode];
  [v4 setObject:v10 forKey:@"synchronousMode"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    v7 = [NSNumber numberWithBool:self->_last];
    [v4 setObject:v7 forKey:@"last"];
  }
LABEL_7:
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPOperationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_operationUUID copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v5 + 21) = self->_synchronousMode;
    *(unsigned char *)(v5 + 24) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 16) = self->_type;
  *(unsigned char *)(v5 + 24) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 20) = self->_last;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  operationUUID = self->_operationUUID;
  if ((unint64_t)operationUUID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](operationUUID, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0) {
      goto LABEL_19;
    }
    if (self->_synchronousMode)
    {
      if (!*((unsigned char *)v4 + 21)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)v4 + 21))
    {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_19;
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) != 0)
    {
      if (self->_last)
      {
        if (!*((unsigned char *)v4 + 20)) {
          goto LABEL_19;
        }
      }
      else if (*((unsigned char *)v4 + 20))
      {
        goto LABEL_19;
      }
      BOOL v6 = 1;
      goto LABEL_20;
    }
LABEL_19:
    BOOL v6 = 0;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_operationUUID hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_synchronousMode;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_last;
  return v4 ^ v3 ^ v5 ^ v6;
}

@end