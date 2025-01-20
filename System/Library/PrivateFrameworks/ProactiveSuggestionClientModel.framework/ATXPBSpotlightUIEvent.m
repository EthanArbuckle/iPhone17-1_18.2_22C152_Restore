@interface ATXPBSpotlightUIEvent
- (BOOL)hasEventType;
- (BOOL)hasSuggestionContext;
- (BOOL)hasSuggestionSubtype;
- (BOOL)hasSuggestionType;
- (BOOL)hasSuggestionUniqueId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)suggestionContext;
- (NSString)suggestionSubtype;
- (NSString)suggestionType;
- (NSString)suggestionUniqueId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)eventType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEventType:(int64_t)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setSuggestionContext:(id)a3;
- (void)setSuggestionSubtype:(id)a3;
- (void)setSuggestionType:(id)a3;
- (void)setSuggestionUniqueId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBSpotlightUIEvent

- (BOOL)hasSuggestionUniqueId
{
  return self->_suggestionUniqueId != 0;
}

- (BOOL)hasSuggestionType
{
  return self->_suggestionType != 0;
}

- (BOOL)hasSuggestionSubtype
{
  return self->_suggestionSubtype != 0;
}

- (BOOL)hasSuggestionContext
{
  return self->_suggestionContext != 0;
}

- (void)setEventType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBSpotlightUIEvent;
  v4 = [(ATXPBSpotlightUIEvent *)&v8 description];
  v5 = [(ATXPBSpotlightUIEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  suggestionUniqueId = self->_suggestionUniqueId;
  if (suggestionUniqueId) {
    [v3 setObject:suggestionUniqueId forKey:@"suggestionUniqueId"];
  }
  suggestionType = self->_suggestionType;
  if (suggestionType) {
    [v4 setObject:suggestionType forKey:@"suggestionType"];
  }
  suggestionSubtype = self->_suggestionSubtype;
  if (suggestionSubtype) {
    [v4 setObject:suggestionSubtype forKey:@"suggestionSubtype"];
  }
  suggestionContext = self->_suggestionContext;
  if (suggestionContext) {
    [v4 setObject:suggestionContext forKey:@"suggestionContext"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithLongLong:self->_eventType];
    [v4 setObject:v9 forKey:@"eventType"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBSpotlightUIEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_suggestionUniqueId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_suggestionType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_suggestionSubtype)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_suggestionContext)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_suggestionUniqueId)
  {
    objc_msgSend(v4, "setSuggestionUniqueId:");
    id v4 = v5;
  }
  if (self->_suggestionType)
  {
    objc_msgSend(v5, "setSuggestionType:");
    id v4 = v5;
  }
  if (self->_suggestionSubtype)
  {
    objc_msgSend(v5, "setSuggestionSubtype:");
    id v4 = v5;
  }
  if (self->_suggestionContext)
  {
    objc_msgSend(v5, "setSuggestionContext:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_eventType;
    *((unsigned char *)v4 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_suggestionUniqueId copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_suggestionType copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_suggestionSubtype copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_suggestionContext copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_eventType;
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
  suggestionUniqueId = self->_suggestionUniqueId;
  if ((unint64_t)suggestionUniqueId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](suggestionUniqueId, "isEqual:")) {
      goto LABEL_14;
    }
  }
  suggestionType = self->_suggestionType;
  if ((unint64_t)suggestionType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](suggestionType, "isEqual:")) {
      goto LABEL_14;
    }
  }
  suggestionSubtype = self->_suggestionSubtype;
  if ((unint64_t)suggestionSubtype | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](suggestionSubtype, "isEqual:")) {
      goto LABEL_14;
    }
  }
  suggestionContext = self->_suggestionContext;
  if ((unint64_t)suggestionContext | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](suggestionContext, "isEqual:")) {
      goto LABEL_14;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) != 0 && self->_eventType == *((void *)v4 + 1))
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
  NSUInteger v3 = [(NSString *)self->_suggestionUniqueId hash];
  NSUInteger v4 = [(NSString *)self->_suggestionType hash];
  NSUInteger v5 = [(NSString *)self->_suggestionSubtype hash];
  NSUInteger v6 = [(NSString *)self->_suggestionContext hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_eventType;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int64_t *)a3;
  NSUInteger v5 = v4;
  if (v4[5])
  {
    -[ATXPBSpotlightUIEvent setSuggestionUniqueId:](self, "setSuggestionUniqueId:");
    NSUInteger v4 = v5;
  }
  if (v4[4])
  {
    -[ATXPBSpotlightUIEvent setSuggestionType:](self, "setSuggestionType:");
    NSUInteger v4 = v5;
  }
  if (v4[3])
  {
    -[ATXPBSpotlightUIEvent setSuggestionSubtype:](self, "setSuggestionSubtype:");
    NSUInteger v4 = v5;
  }
  if (v4[2])
  {
    -[ATXPBSpotlightUIEvent setSuggestionContext:](self, "setSuggestionContext:");
    NSUInteger v4 = v5;
  }
  if (v4[6])
  {
    self->_eventType = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)suggestionUniqueId
{
  return self->_suggestionUniqueId;
}

- (void)setSuggestionUniqueId:(id)a3
{
}

- (NSString)suggestionType
{
  return self->_suggestionType;
}

- (void)setSuggestionType:(id)a3
{
}

- (NSString)suggestionSubtype
{
  return self->_suggestionSubtype;
}

- (void)setSuggestionSubtype:(id)a3
{
}

- (NSString)suggestionContext
{
  return self->_suggestionContext;
}

- (void)setSuggestionContext:(id)a3
{
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionUniqueId, 0);
  objc_storeStrong((id *)&self->_suggestionType, 0);
  objc_storeStrong((id *)&self->_suggestionSubtype, 0);
  objc_storeStrong((id *)&self->_suggestionContext, 0);
}

@end