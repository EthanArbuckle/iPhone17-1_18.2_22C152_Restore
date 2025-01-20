@interface ATXMPBBlendingClientModelEngagementClientCacheAgeTracker
- (BOOL)hasClientModelABGroup;
- (BOOL)hasClientModelId;
- (BOOL)hasConsumerSubType;
- (BOOL)hasOutcomeType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)clientModelABGroup;
- (NSString)clientModelId;
- (NSString)consumerSubType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)outcomeTypeAsString:(int)a3;
- (int)StringAsOutcomeType:(id)a3;
- (int)outcomeType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientModelABGroup:(id)a3;
- (void)setClientModelId:(id)a3;
- (void)setConsumerSubType:(id)a3;
- (void)setHasOutcomeType:(BOOL)a3;
- (void)setOutcomeType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBBlendingClientModelEngagementClientCacheAgeTracker

- (int)outcomeType
{
  if (*(unsigned char *)&self->_has) {
    return self->_outcomeType;
  }
  else {
    return 1;
  }
}

- (void)setOutcomeType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_outcomeType = a3;
}

- (void)setHasOutcomeType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOutcomeType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)outcomeTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5F01800[a3 - 1];
  }
  return v3;
}

- (int)StringAsOutcomeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Conversion"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Rejection"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Abandon"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (BOOL)hasClientModelABGroup
{
  return self->_clientModelABGroup != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBBlendingClientModelEngagementClientCacheAgeTracker;
  int v4 = [(ATXMPBBlendingClientModelEngagementClientCacheAgeTracker *)&v8 description];
  v5 = [(ATXMPBBlendingClientModelEngagementClientCacheAgeTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = self->_outcomeType - 1;
    if (v4 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_outcomeType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5F01800[v4];
    }
    [v3 setObject:v5 forKey:@"outcomeType"];
  }
  clientModelId = self->_clientModelId;
  if (clientModelId) {
    [v3 setObject:clientModelId forKey:@"clientModelId"];
  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType) {
    [v3 setObject:consumerSubType forKey:@"consumerSubType"];
  }
  clientModelABGroup = self->_clientModelABGroup;
  if (clientModelABGroup) {
    [v3 setObject:clientModelABGroup forKey:@"clientModelABGroup"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBBlendingClientModelEngagementClientCacheAgeTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientModelABGroup)
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
    v4[8] = self->_outcomeType;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  id v5 = v4;
  if (self->_clientModelId)
  {
    objc_msgSend(v4, "setClientModelId:");
    id v4 = v5;
  }
  if (self->_consumerSubType)
  {
    objc_msgSend(v5, "setConsumerSubType:");
    id v4 = v5;
  }
  if (self->_clientModelABGroup)
  {
    objc_msgSend(v5, "setClientModelABGroup:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_outcomeType;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_clientModelId copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSString *)self->_consumerSubType copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  uint64_t v11 = [(NSString *)self->_clientModelABGroup copyWithZone:a3];
  v12 = (void *)v6[1];
  v6[1] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_outcomeType != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((void *)v4 + 2)
    && !-[NSString isEqual:](clientModelId, "isEqual:"))
  {
    goto LABEL_13;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](consumerSubType, "isEqual:")) {
      goto LABEL_13;
    }
  }
  clientModelABGroup = self->_clientModelABGroup;
  if ((unint64_t)clientModelABGroup | *((void *)v4 + 1)) {
    char v8 = -[NSString isEqual:](clientModelABGroup, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_outcomeType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_clientModelId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_consumerSubType hash];
  return v4 ^ v5 ^ [(NSString *)self->_clientModelABGroup hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[9])
  {
    self->_outcomeType = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[ATXMPBBlendingClientModelEngagementClientCacheAgeTracker setClientModelId:](self, "setClientModelId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[ATXMPBBlendingClientModelEngagementClientCacheAgeTracker setConsumerSubType:](self, "setConsumerSubType:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[ATXMPBBlendingClientModelEngagementClientCacheAgeTracker setClientModelABGroup:](self, "setClientModelABGroup:");
    NSUInteger v4 = v5;
  }
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
}

- (NSString)clientModelABGroup
{
  return self->_clientModelABGroup;
}

- (void)setClientModelABGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_clientModelABGroup, 0);
}

@end