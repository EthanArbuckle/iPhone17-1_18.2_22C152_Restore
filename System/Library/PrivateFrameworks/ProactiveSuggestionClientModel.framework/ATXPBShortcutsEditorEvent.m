@interface ATXPBShortcutsEditorEvent
+ (Class)suggestionUUIDsType;
- (ATXPBShortcutsEditorEventMetadata)metadata;
- (BOOL)hasBlendingCacheId;
- (BOOL)hasDate;
- (BOOL)hasEventType;
- (BOOL)hasMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)suggestionUUIDs;
- (NSString)blendingCacheId;
- (double)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)suggestionUUIDsAtIndex:(unint64_t)a3;
- (unint64_t)eventType;
- (unint64_t)hash;
- (unint64_t)suggestionUUIDsCount;
- (void)addSuggestionUUIDs:(id)a3;
- (void)clearSuggestionUUIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBlendingCacheId:(id)a3;
- (void)setDate:(double)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setSuggestionUUIDs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBShortcutsEditorEvent

- (void)setDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEventType:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasBlendingCacheId
{
  return self->_blendingCacheId != 0;
}

- (void)clearSuggestionUUIDs
{
}

- (void)addSuggestionUUIDs:(id)a3
{
  id v4 = a3;
  suggestionUUIDs = self->_suggestionUUIDs;
  id v8 = v4;
  if (!suggestionUUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_suggestionUUIDs;
    self->_suggestionUUIDs = v6;

    id v4 = v8;
    suggestionUUIDs = self->_suggestionUUIDs;
  }
  [(NSMutableArray *)suggestionUUIDs addObject:v4];
}

- (unint64_t)suggestionUUIDsCount
{
  return [(NSMutableArray *)self->_suggestionUUIDs count];
}

- (id)suggestionUUIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_suggestionUUIDs objectAtIndex:a3];
}

+ (Class)suggestionUUIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBShortcutsEditorEvent;
  id v4 = [(ATXPBShortcutsEditorEvent *)&v8 description];
  v5 = [(ATXPBShortcutsEditorEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithDouble:self->_date];
    [v3 setObject:v5 forKey:@"date"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:self->_eventType];
    [v3 setObject:v6 forKey:@"eventType"];
  }
  blendingCacheId = self->_blendingCacheId;
  if (blendingCacheId) {
    [v3 setObject:blendingCacheId forKey:@"blendingCacheId"];
  }
  suggestionUUIDs = self->_suggestionUUIDs;
  if (suggestionUUIDs) {
    [v3 setObject:suggestionUUIDs forKey:@"suggestionUUIDs"];
  }
  metadata = self->_metadata;
  if (metadata)
  {
    v10 = [(ATXPBShortcutsEditorEventMetadata *)metadata dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"metadata"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBShortcutsEditorEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_blendingCacheId) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_suggestionUUIDs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_metadata) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = *(void *)&self->_date;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = self->_eventType;
    *((unsigned char *)v4 + 48) |= 2u;
  }
  id v10 = v4;
  if (self->_blendingCacheId) {
    objc_msgSend(v4, "setBlendingCacheId:");
  }
  if ([(ATXPBShortcutsEditorEvent *)self suggestionUUIDsCount])
  {
    [v10 clearSuggestionUUIDs];
    unint64_t v6 = [(ATXPBShortcutsEditorEvent *)self suggestionUUIDsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(ATXPBShortcutsEditorEvent *)self suggestionUUIDsAtIndex:i];
        [v10 addSuggestionUUIDs:v9];
      }
    }
  }
  if (self->_metadata) {
    objc_msgSend(v10, "setMetadata:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_date;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_eventType;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_blendingCacheId copyWithZone:a3];
  uint64_t v9 = (void *)v6[3];
  v6[3] = v8;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = self->_suggestionUUIDs;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (void)v19);
        [v6 addSuggestionUUIDs:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  id v16 = [(ATXPBShortcutsEditorEventMetadata *)self->_metadata copyWithZone:a3];
  v17 = (void *)v6[4];
  v6[4] = v16;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_eventType != *((void *)v4 + 2)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_18;
  }
  blendingCacheId = self->_blendingCacheId;
  if ((unint64_t)blendingCacheId | *((void *)v4 + 3)
    && !-[NSString isEqual:](blendingCacheId, "isEqual:"))
  {
    goto LABEL_18;
  }
  suggestionUUIDs = self->_suggestionUUIDs;
  if ((unint64_t)suggestionUUIDs | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](suggestionUUIDs, "isEqual:")) {
      goto LABEL_18;
    }
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 4)) {
    char v8 = -[ATXPBShortcutsEditorEventMetadata isEqual:](metadata, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double date = self->_date;
    double v6 = -date;
    if (date >= 0.0) {
      double v6 = self->_date;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0) {
    unint64_t v9 = 2654435761u * self->_eventType;
  }
  else {
    unint64_t v9 = 0;
  }
  NSUInteger v10 = v9 ^ v4 ^ [(NSString *)self->_blendingCacheId hash];
  uint64_t v11 = [(NSMutableArray *)self->_suggestionUUIDs hash];
  return v10 ^ v11 ^ [(ATXPBShortcutsEditorEventMetadata *)self->_metadata hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  char v6 = *((unsigned char *)v4 + 48);
  if (v6)
  {
    self->_double date = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 48);
  }
  if ((v6 & 2) != 0)
  {
    self->_eventType = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3)) {
    -[ATXPBShortcutsEditorEvent setBlendingCacheId:](self, "setBlendingCacheId:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        -[ATXPBShortcutsEditorEvent addSuggestionUUIDs:](self, "addSuggestionUUIDs:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  metadata = self->_metadata;
  id v13 = v5[4];
  if (metadata)
  {
    if (v13) {
      -[ATXPBShortcutsEditorEventMetadata mergeFrom:](metadata, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[ATXPBShortcutsEditorEvent setMetadata:](self, "setMetadata:");
  }
}

- (double)date
{
  return self->_date;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (NSString)blendingCacheId
{
  return self->_blendingCacheId;
}

- (void)setBlendingCacheId:(id)a3
{
}

- (NSMutableArray)suggestionUUIDs
{
  return self->_suggestionUUIDs;
}

- (void)setSuggestionUUIDs:(id)a3
{
}

- (ATXPBShortcutsEditorEventMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionUUIDs, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_blendingCacheId, 0);
}

@end