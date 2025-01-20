@interface ATXPBRequestForInteractionSuggestions
- (BOOL)hasConsumerSubTypeString;
- (BOOL)hasOriginatorId;
- (BOOL)hasPsPredictionContext;
- (BOOL)hasTimeout;
- (BOOL)hasUuidString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)psPredictionContext;
- (NSString)consumerSubTypeString;
- (NSString)originatorId;
- (NSString)uuidString;
- (double)timeout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConsumerSubTypeString:(id)a3;
- (void)setHasTimeout:(BOOL)a3;
- (void)setOriginatorId:(id)a3;
- (void)setPsPredictionContext:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setUuidString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBRequestForInteractionSuggestions

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

- (BOOL)hasPsPredictionContext
{
  return self->_psPredictionContext != 0;
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
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBRequestForInteractionSuggestions;
  v4 = [(ATXPBRequestForInteractionSuggestions *)&v8 description];
  v5 = [(ATXPBRequestForInteractionSuggestions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
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
  psPredictionContext = self->_psPredictionContext;
  if (psPredictionContext) {
    [v4 setObject:psPredictionContext forKey:@"psPredictionContext"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithDouble:self->_timeout];
    [v4 setObject:v9 forKey:@"timeout"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBRequestForInteractionSuggestionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuidString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_originatorId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_consumerSubTypeString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_psPredictionContext)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuidString)
  {
    objc_msgSend(v4, "setUuidString:");
    id v4 = v5;
  }
  if (self->_originatorId)
  {
    objc_msgSend(v5, "setOriginatorId:");
    id v4 = v5;
  }
  if (self->_consumerSubTypeString)
  {
    objc_msgSend(v5, "setConsumerSubTypeString:");
    id v4 = v5;
  }
  if (self->_psPredictionContext)
  {
    objc_msgSend(v5, "setPsPredictionContext:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timeout;
    *((unsigned char *)v4 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuidString copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_originatorId copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_consumerSubTypeString copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  uint64_t v12 = [(NSData *)self->_psPredictionContext copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_timeout;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:")) {
      goto LABEL_14;
    }
  }
  originatorId = self->_originatorId;
  if ((unint64_t)originatorId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](originatorId, "isEqual:")) {
      goto LABEL_14;
    }
  }
  consumerSubTypeString = self->_consumerSubTypeString;
  if ((unint64_t)consumerSubTypeString | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](consumerSubTypeString, "isEqual:")) {
      goto LABEL_14;
    }
  }
  psPredictionContext = self->_psPredictionContext;
  if ((unint64_t)psPredictionContext | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](psPredictionContext, "isEqual:")) {
      goto LABEL_14;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) != 0 && self->_timeout == *((double *)v4 + 1))
    {
      BOOL v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuidString hash];
  NSUInteger v4 = [(NSString *)self->_originatorId hash];
  NSUInteger v5 = [(NSString *)self->_consumerSubTypeString hash];
  uint64_t v6 = [(NSData *)self->_psPredictionContext hash];
  if (*(unsigned char *)&self->_has)
  {
    double timeout = self->_timeout;
    double v9 = -timeout;
    if (timeout >= 0.0) {
      double v9 = self->_timeout;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (double *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 5))
  {
    -[ATXPBRequestForInteractionSuggestions setUuidString:](self, "setUuidString:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[ATXPBRequestForInteractionSuggestions setOriginatorId:](self, "setOriginatorId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[ATXPBRequestForInteractionSuggestions setConsumerSubTypeString:](self, "setConsumerSubTypeString:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[ATXPBRequestForInteractionSuggestions setPsPredictionContext:](self, "setPsPredictionContext:");
    NSUInteger v4 = v5;
  }
  if ((_BYTE)v4[6])
  {
    self->_double timeout = v4[1];
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

- (NSData)psPredictionContext
{
  return self->_psPredictionContext;
}

- (void)setPsPredictionContext:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_psPredictionContext, 0);
  objc_storeStrong((id *)&self->_originatorId, 0);
  objc_storeStrong((id *)&self->_consumerSubTypeString, 0);
}

@end