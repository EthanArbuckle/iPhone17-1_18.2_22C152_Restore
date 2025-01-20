@interface ATXPBRequestForContextualActionSuggestions
- (BOOL)hasCaxPredictionContext;
- (BOOL)hasConsumerSubTypeString;
- (BOOL)hasMaxSuggestions;
- (BOOL)hasOriginatorId;
- (BOOL)hasTimeout;
- (BOOL)hasUuidString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)caxPredictionContext;
- (NSString)consumerSubTypeString;
- (NSString)originatorId;
- (NSString)uuidString;
- (double)timeout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)maxSuggestions;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCaxPredictionContext:(id)a3;
- (void)setConsumerSubTypeString:(id)a3;
- (void)setHasMaxSuggestions:(BOOL)a3;
- (void)setHasTimeout:(BOOL)a3;
- (void)setMaxSuggestions:(int)a3;
- (void)setOriginatorId:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setUuidString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBRequestForContextualActionSuggestions

- (BOOL)hasUuidString
{
  return self->_uuidString != 0;
}

- (BOOL)hasOriginatorId
{
  return self->_originatorId != 0;
}

- (BOOL)hasConsumerSubTypeString
{
  return self->_consumerSubTypeString != 0;
}

- (BOOL)hasCaxPredictionContext
{
  return self->_caxPredictionContext != 0;
}

- (void)setMaxSuggestions:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_maxSuggestions = a3;
}

- (void)setHasMaxSuggestions:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxSuggestions
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimeout:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeout = a3;
}

- (void)setHasTimeout:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeout
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBRequestForContextualActionSuggestions;
  v4 = [(ATXPBRequestForContextualActionSuggestions *)&v8 description];
  v5 = [(ATXPBRequestForContextualActionSuggestions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  uuidString = self->_uuidString;
  if (uuidString) {
    [v3 setObject:uuidString forKey:@"uuidString"];
  }
  originatorId = self->_originatorId;
  if (originatorId) {
    [v4 setObject:originatorId forKey:@"originatorId"];
  }
  consumerSubTypeString = self->_consumerSubTypeString;
  if (consumerSubTypeString) {
    [v4 setObject:consumerSubTypeString forKey:@"consumerSubTypeString"];
  }
  caxPredictionContext = self->_caxPredictionContext;
  if (caxPredictionContext) {
    [v4 setObject:caxPredictionContext forKey:@"caxPredictionContext"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v10 = [NSNumber numberWithInt:self->_maxSuggestions];
    [v4 setObject:v10 forKey:@"maxSuggestions"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v11 = [NSNumber numberWithDouble:self->_timeout];
    [v4 setObject:v11 forKey:@"timeout"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBRequestForContextualActionSuggestionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uuidString)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_originatorId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_consumerSubTypeString)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_caxPredictionContext)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uuidString)
  {
    objc_msgSend(v4, "setUuidString:");
    id v4 = v6;
  }
  if (self->_originatorId)
  {
    objc_msgSend(v6, "setOriginatorId:");
    id v4 = v6;
  }
  if (self->_consumerSubTypeString)
  {
    objc_msgSend(v6, "setConsumerSubTypeString:");
    id v4 = v6;
  }
  if (self->_caxPredictionContext)
  {
    objc_msgSend(v6, "setCaxPredictionContext:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_maxSuggestions;
    *((unsigned char *)v4 + 56) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timeout;
    *((unsigned char *)v4 + 56) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuidString copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_originatorId copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_consumerSubTypeString copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSData *)self->_caxPredictionContext copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_maxSuggestions;
    *(unsigned char *)(v5 + 56) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_timeout;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:")) {
      goto LABEL_19;
    }
  }
  originatorId = self->_originatorId;
  if ((unint64_t)originatorId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](originatorId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  consumerSubTypeString = self->_consumerSubTypeString;
  if ((unint64_t)consumerSubTypeString | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](consumerSubTypeString, "isEqual:")) {
      goto LABEL_19;
    }
  }
  caxPredictionContext = self->_caxPredictionContext;
  if ((unint64_t)caxPredictionContext | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](caxPredictionContext, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_maxSuggestions != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }
  BOOL v9 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_timeout != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuidString hash];
  NSUInteger v4 = [(NSString *)self->_originatorId hash];
  NSUInteger v5 = [(NSString *)self->_consumerSubTypeString hash];
  uint64_t v6 = [(NSData *)self->_caxPredictionContext hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_maxSuggestions;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double timeout = self->_timeout;
  double v9 = -timeout;
  if (timeout >= 0.0) {
    double v9 = self->_timeout;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 6))
  {
    -[ATXPBRequestForContextualActionSuggestions setUuidString:](self, "setUuidString:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[ATXPBRequestForContextualActionSuggestions setOriginatorId:](self, "setOriginatorId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[ATXPBRequestForContextualActionSuggestions setConsumerSubTypeString:](self, "setConsumerSubTypeString:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[ATXPBRequestForContextualActionSuggestions setCaxPredictionContext:](self, "setCaxPredictionContext:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 2) != 0)
  {
    self->_maxSuggestions = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 56);
  }
  if (v5)
  {
    self->_double timeout = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
}

- (NSString)originatorId
{
  return self->_originatorId;
}

- (void)setOriginatorId:(id)a3
{
}

- (NSString)consumerSubTypeString
{
  return self->_consumerSubTypeString;
}

- (void)setConsumerSubTypeString:(id)a3
{
}

- (NSData)caxPredictionContext
{
  return self->_caxPredictionContext;
}

- (void)setCaxPredictionContext:(id)a3
{
}

- (int)maxSuggestions
{
  return self->_maxSuggestions;
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_originatorId, 0);
  objc_storeStrong((id *)&self->_consumerSubTypeString, 0);
  objc_storeStrong((id *)&self->_caxPredictionContext, 0);
}

@end