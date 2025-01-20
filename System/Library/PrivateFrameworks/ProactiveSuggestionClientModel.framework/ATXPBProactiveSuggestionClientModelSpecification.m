@interface ATXPBProactiveSuggestionClientModelSpecification
- (BOOL)hasClientModelId;
- (BOOL)hasClientModelVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (__CFString)engagementResetPolicyAsString:(__CFString *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)StringAsEngagementResetPolicy:(uint64_t)a1;
- (uint64_t)clientModelId;
- (uint64_t)clientModelVersion;
- (uint64_t)engagementResetPolicy;
- (uint64_t)hasEngagementResetPolicy;
- (uint64_t)setEngagementResetPolicy:(uint64_t)result;
- (uint64_t)setHasEngagementResetPolicy:(uint64_t)result;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setClientModelId:(uint64_t)a1;
- (void)setClientModelVersion:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBProactiveSuggestionClientModelSpecification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelVersion, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
}

- (uint64_t)engagementResetPolicy
{
  if (result)
  {
    if (*(unsigned char *)(result + 28)) {
      return *(unsigned int *)(result + 24);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)clientModelVersion
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)clientModelId
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (BOOL)hasClientModelId
{
  if (result) {
    return *(void *)(result + 8) != 0;
  }
  return result;
}

- (BOOL)hasClientModelVersion
{
  if (result) {
    return *(void *)(result + 16) != 0;
  }
  return result;
}

- (uint64_t)setEngagementResetPolicy:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 28) |= 1u;
    *(_DWORD *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)setHasEngagementResetPolicy:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 28) = *(unsigned char *)(result + 28) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasEngagementResetPolicy
{
  if (result) {
    return *(unsigned char *)(result + 28) & 1;
  }
  return result;
}

- (__CFString)engagementResetPolicyAsString:(__CFString *)a1
{
  if (!a1)
  {
LABEL_11:
    return a1;
  }
  if (a2)
  {
    if (a2 == 1)
    {
      a1 = @"WhenNotPredicted";
      return a1;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
    a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  a1 = @"OnCacheUpdate";
  return a1;
}

- (uint64_t)StringAsEngagementResetPolicy:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ([v3 isEqualToString:@"OnCacheUpdate"]) {
      a1 = 0;
    }
    else {
      a1 = [v4 isEqualToString:@"WhenNotPredicted"];
    }
  }

  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBProactiveSuggestionClientModelSpecification;
  v4 = [(ATXPBProactiveSuggestionClientModelSpecification *)&v8 description];
  v5 = [(ATXPBProactiveSuggestionClientModelSpecification *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  clientModelId = self->_clientModelId;
  if (clientModelId) {
    [v3 setObject:clientModelId forKey:@"clientModelId"];
  }
  clientModelVersion = self->_clientModelVersion;
  if (clientModelVersion) {
    [v4 setObject:clientModelVersion forKey:@"clientModelVersion"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int engagementResetPolicy = self->_engagementResetPolicy;
    if (engagementResetPolicy)
    {
      if (engagementResetPolicy == 1)
      {
        objc_super v8 = @"WhenNotPredicted";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_engagementResetPolicy);
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_super v8 = @"OnCacheUpdate";
    }
    [v4 setObject:v8 forKey:@"engagementResetPolicy"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBProactiveSuggestionClientModelSpecificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientModelVersion)
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

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 8);
    id v6 = v3;
    if (v4)
    {
      -[ATXPBProactiveSuggestionClientModelSpecification setClientModelId:]((uint64_t)v3, v4);
      id v3 = v6;
    }
    id v5 = *(void **)(a1 + 16);
    if (v5)
    {
      -[ATXPBProactiveSuggestionClientModelSpecification setClientModelVersion:]((uint64_t)v6, v5);
      id v3 = v6;
    }
    if (*(unsigned char *)(a1 + 28))
    {
      *((_DWORD *)v3 + 6) = *(_DWORD *)(a1 + 24);
      *((unsigned char *)v3 + 28) |= 1u;
    }
  }
}

- (void)setClientModelId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)setClientModelVersion:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_clientModelId copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_clientModelVersion copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_engagementResetPolicy;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:")) {
      goto LABEL_10;
    }
  }
  clientModelVersion = self->_clientModelVersion;
  if ((unint64_t)clientModelVersion | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientModelVersion, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_engagementResetPolicy == *((_DWORD *)v4 + 6))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientModelId hash];
  NSUInteger v4 = [(NSString *)self->_clientModelVersion hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_engagementResetPolicy;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(uint64_t)a1
{
  NSUInteger v3 = a2;
  if (a1)
  {
    NSUInteger v4 = (void *)v3[1];
    uint64_t v6 = v3;
    if (v4)
    {
      objc_storeStrong((id *)(a1 + 8), v4);
      NSUInteger v3 = v6;
    }
    uint64_t v5 = (void *)v3[2];
    if (v5)
    {
      objc_storeStrong((id *)(a1 + 16), v5);
      NSUInteger v3 = v6;
    }
    if (*((unsigned char *)v3 + 28))
    {
      *(_DWORD *)(a1 + 24) = *((_DWORD *)v3 + 6);
      *(unsigned char *)(a1 + 28) |= 1u;
    }
  }
}

@end