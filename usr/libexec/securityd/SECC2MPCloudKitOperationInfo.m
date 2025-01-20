@interface SECC2MPCloudKitOperationInfo
- (BOOL)hasOperationGroupIndex;
- (BOOL)hasOperationId;
- (BOOL)hasOperationTriggered;
- (BOOL)hasOperationType;
- (BOOL)isEqual:(id)a3;
- (BOOL)operationTriggered;
- (BOOL)readFrom:(id)a3;
- (NSString)operationId;
- (NSString)operationType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)operationGroupIndex;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasOperationGroupIndex:(BOOL)a3;
- (void)setHasOperationTriggered:(BOOL)a3;
- (void)setOperationGroupIndex:(unsigned int)a3;
- (void)setOperationId:(id)a3;
- (void)setOperationTriggered:(BOOL)a3;
- (void)setOperationType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPCloudKitOperationInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationType, 0);

  objc_storeStrong((id *)&self->_operationId, 0);
}

- (unsigned)operationGroupIndex
{
  return self->_operationGroupIndex;
}

- (BOOL)operationTriggered
{
  return self->_operationTriggered;
}

- (void)setOperationType:(id)a3
{
}

- (NSString)operationType
{
  return self->_operationType;
}

- (void)setOperationId:(id)a3
{
}

- (NSString)operationId
{
  return self->_operationId;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[SECC2MPCloudKitOperationInfo setOperationId:](self, "setOperationId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[SECC2MPCloudKitOperationInfo setOperationType:](self, "setOperationType:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_operationTriggered = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if (v5)
  {
    self->_operationGroupIndex = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_operationId hash];
  NSUInteger v4 = [(NSString *)self->_operationType hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_operationTriggered;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_operationGroupIndex;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  operationId = self->_operationId;
  if ((unint64_t)operationId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](operationId, "isEqual:")) {
      goto LABEL_18;
    }
  }
  operationType = self->_operationType;
  if ((unint64_t)operationType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](operationType, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) != 0)
    {
      if (self->_operationTriggered)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_18;
        }
        goto LABEL_14;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_14;
      }
    }
LABEL_18:
    BOOL v7 = 0;
    goto LABEL_19;
  }
  if ((*((unsigned char *)v4 + 36) & 2) != 0) {
    goto LABEL_18;
  }
LABEL_14:
  BOOL v7 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_operationGroupIndex != *((_DWORD *)v4 + 2)) {
      goto LABEL_18;
    }
    BOOL v7 = 1;
  }
LABEL_19:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_operationId copyWithZone:a3];
  BOOL v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_operationType copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 32) = self->_operationTriggered;
    *((unsigned char *)v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 2) = self->_operationGroupIndex;
    *((unsigned char *)v5 + 36) |= 1u;
  }
  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_operationId)
  {
    [v4 setOperationId:];
    id v4 = v6;
  }
  if (self->_operationType)
  {
    [v6 setOperationType:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 32) = self->_operationTriggered;
    *((unsigned char *)v4 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_operationGroupIndex;
    *((unsigned char *)v4 + 36) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_operationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_operationType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_10015CDE4((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  operationId = self->_operationId;
  if (operationId) {
    [v3 setObject:operationId forKey:@"operation_id"];
  }
  operationType = self->_operationType;
  if (operationType) {
    [v4 setObject:operationType forKey:@"operation_type"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    id v8 = +[NSNumber numberWithBool:self->_operationTriggered];
    [v4 setObject:v8 forKey:@"operation_triggered"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_operationGroupIndex];
    [v4 setObject:v9 forKey:@"operation_group_index"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SECC2MPCloudKitOperationInfo;
  NSUInteger v3 = [(SECC2MPCloudKitOperationInfo *)&v7 description];
  id v4 = [(SECC2MPCloudKitOperationInfo *)self dictionaryRepresentation];
  uint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasOperationGroupIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasOperationGroupIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setOperationGroupIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_operationGroupIndex = a3;
}

- (BOOL)hasOperationTriggered
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasOperationTriggered:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setOperationTriggered:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_operationTriggered = a3;
}

- (BOOL)hasOperationType
{
  return self->_operationType != 0;
}

- (BOOL)hasOperationId
{
  return self->_operationId != 0;
}

@end