@interface ATXPBRequestForSuggestions
- (BOOL)hasConsumerSubTypeString;
- (BOOL)hasOriginatorId;
- (BOOL)hasTimeout;
- (BOOL)hasUuidString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
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
- (void)setTimeout:(double)a3;
- (void)setUuidString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBRequestForSuggestions

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
  v8.super_class = (Class)ATXPBRequestForSuggestions;
  v4 = [(ATXPBRequestForSuggestions *)&v8 description];
  v5 = [(ATXPBRequestForSuggestions *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_timeout];
    [v4 setObject:v8 forKey:@"timeout"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBRequestForSuggestionsReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timeout;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuidString copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_originatorId copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_consumerSubTypeString copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_timeout;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uuidString = self->_uuidString;
  if ((unint64_t)uuidString | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](uuidString, "isEqual:")) {
      goto LABEL_12;
    }
  }
  originatorId = self->_originatorId;
  if ((unint64_t)originatorId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](originatorId, "isEqual:")) {
      goto LABEL_12;
    }
  }
  consumerSubTypeString = self->_consumerSubTypeString;
  if ((unint64_t)consumerSubTypeString | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](consumerSubTypeString, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_timeout == *((double *)v4 + 1))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuidString hash];
  NSUInteger v4 = [(NSString *)self->_originatorId hash];
  NSUInteger v5 = [(NSString *)self->_consumerSubTypeString hash];
  if (*(unsigned char *)&self->_has)
  {
    double timeout = self->_timeout;
    double v8 = -timeout;
    if (timeout >= 0.0) {
      double v8 = self->_timeout;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (double *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[ATXPBRequestForSuggestions setUuidString:](self, "setUuidString:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[ATXPBRequestForSuggestions setOriginatorId:](self, "setOriginatorId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[ATXPBRequestForSuggestions setConsumerSubTypeString:](self, "setConsumerSubTypeString:");
    NSUInteger v4 = v5;
  }
  if ((_BYTE)v4[5])
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

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_originatorId, 0);
  objc_storeStrong((id *)&self->_consumerSubTypeString, 0);
}

@end