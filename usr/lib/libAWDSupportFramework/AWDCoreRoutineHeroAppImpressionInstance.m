@interface AWDCoreRoutineHeroAppImpressionInstance
- (BOOL)hasSuggestionId;
- (BOOL)hasTimestamp;
- (BOOL)hasUiPlacement;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)suggestionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)uiPlacement;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUiPlacement:(BOOL)a3;
- (void)setSuggestionId:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUiPlacement:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineHeroAppImpressionInstance

- (void)dealloc
{
  [(AWDCoreRoutineHeroAppImpressionInstance *)self setSuggestionId:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineHeroAppImpressionInstance;
  [(AWDCoreRoutineHeroAppImpressionInstance *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

- (void)setUiPlacement:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uiPlacement = a3;
}

- (void)setHasUiPlacement:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUiPlacement
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineHeroAppImpressionInstance;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineHeroAppImpressionInstance description](&v3, sel_description), -[AWDCoreRoutineHeroAppImpressionInstance dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  suggestionId = self->_suggestionId;
  if (suggestionId) {
    [v3 setObject:suggestionId forKey:@"suggestionId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_uiPlacement] forKey:@"uiPlacement"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineHeroAppImpressionInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_suggestionId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 28) |= 1u;
  }
  if (self->_suggestionId) {
    [a3 setSuggestionId:];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_uiPlacement;
    *((unsigned char *)a3 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 28) |= 1u;
  }

  *(void *)(v6 + 16) = [(NSString *)self->_suggestionId copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_uiPlacement;
    *(unsigned char *)(v6 + 28) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if (has)
    {
      if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    suggestionId = self->_suggestionId;
    if ((unint64_t)suggestionId | *((void *)a3 + 2))
    {
      int v5 = -[NSString isEqual:](suggestionId, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_uiPlacement != *((_DWORD *)a3 + 6)) {
        goto LABEL_14;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_suggestionId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_uiPlacement;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 28))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDCoreRoutineHeroAppImpressionInstance setSuggestionId:](self, "setSuggestionId:");
  }
  if ((*((unsigned char *)a3 + 28) & 2) != 0)
  {
    self->_uiPlacement = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)suggestionId
{
  return self->_suggestionId;
}

- (void)setSuggestionId:(id)a3
{
}

- (int)uiPlacement
{
  return self->_uiPlacement;
}

@end