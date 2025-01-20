@interface NTPBNotificationItemListRecord
+ (Class)notificationItemIDsType;
- (BOOL)hasAlgoID;
- (BOOL)hasBase;
- (BOOL)hasNotificationSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)notificationItemIDs;
- (NSString)algoID;
- (NTPBRecordBase)base;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)notificationItemIDsAtIndex:(unint64_t)a3;
- (int)notificationSource;
- (unint64_t)hash;
- (unint64_t)notificationItemIDsCount;
- (void)addNotificationItemIDs:(id)a3;
- (void)clearNotificationItemIDs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAlgoID:(id)a3;
- (void)setBase:(id)a3;
- (void)setHasNotificationSource:(BOOL)a3;
- (void)setNotificationItemIDs:(id)a3;
- (void)setNotificationSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBNotificationItemListRecord

- (void)dealloc
{
  [(NTPBNotificationItemListRecord *)self setBase:0];
  [(NTPBNotificationItemListRecord *)self setNotificationItemIDs:0];
  [(NTPBNotificationItemListRecord *)self setAlgoID:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBNotificationItemListRecord;
  [(NTPBNotificationItemListRecord *)&v3 dealloc];
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (void)clearNotificationItemIDs
{
}

- (void)addNotificationItemIDs:(id)a3
{
  notificationItemIDs = self->_notificationItemIDs;
  if (!notificationItemIDs)
  {
    notificationItemIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_notificationItemIDs = notificationItemIDs;
  }

  [(NSMutableArray *)notificationItemIDs addObject:a3];
}

- (unint64_t)notificationItemIDsCount
{
  return [(NSMutableArray *)self->_notificationItemIDs count];
}

- (id)notificationItemIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_notificationItemIDs objectAtIndex:a3];
}

+ (Class)notificationItemIDsType
{
  return (Class)objc_opt_class();
}

- (int)notificationSource
{
  if (*(unsigned char *)&self->_has) {
    return self->_notificationSource;
  }
  else {
    return 0;
  }
}

- (void)setNotificationSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_notificationSource = a3;
}

- (void)setHasNotificationSource:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNotificationSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAlgoID
{
  return self->_algoID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBNotificationItemListRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBNotificationItemListRecord description](&v3, sel_description), -[NTPBNotificationItemListRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  notificationItemIDs = self->_notificationItemIDs;
  if (notificationItemIDs) {
    [v3 setObject:notificationItemIDs forKey:@"notification_item_IDs"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_notificationSource), @"notification_source");
  }
  algoID = self->_algoID;
  if (algoID) {
    [v3 setObject:algoID forKey:@"algo_ID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNotificationItemListRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  notificationItemIDs = self->_notificationItemIDs;
  uint64_t v5 = [(NSMutableArray *)notificationItemIDs countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(notificationItemIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v6 = [(NSMutableArray *)notificationItemIDs countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_algoID) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 16) = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  notificationItemIDs = self->_notificationItemIDs;
  uint64_t v7 = [(NSMutableArray *)notificationItemIDs countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(notificationItemIDs);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addNotificationItemIDs:v11];
      }
      uint64_t v8 = [(NSMutableArray *)notificationItemIDs countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_notificationSource;
    *(unsigned char *)(v5 + 36) |= 1u;
  }

  *(void *)(v5 + 8) = [(NSString *)self->_algoID copyWithZone:a3];
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((void *)a3 + 2)) || (int v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      notificationItemIDs = self->_notificationItemIDs;
      if (!((unint64_t)notificationItemIDs | *((void *)a3 + 3))
        || (int v5 = -[NSMutableArray isEqual:](notificationItemIDs, "isEqual:")) != 0)
      {
        if (*(unsigned char *)&self->_has)
        {
          if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_notificationSource != *((_DWORD *)a3 + 8)) {
            goto LABEL_13;
          }
        }
        else if (*((unsigned char *)a3 + 36))
        {
LABEL_13:
          LOBYTE(v5) = 0;
          return v5;
        }
        algoID = self->_algoID;
        if ((unint64_t)algoID | *((void *)a3 + 1))
        {
          LOBYTE(v5) = -[NSString isEqual:](algoID, "isEqual:");
        }
        else
        {
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTPBRecordBase *)self->_base hash];
  uint64_t v4 = [(NSMutableArray *)self->_notificationItemIDs hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_notificationSource;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_algoID hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  base = self->_base;
  uint64_t v6 = *((void *)a3 + 2);
  if (base)
  {
    if (v6) {
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBNotificationItemListRecord setBase:](self, "setBase:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = (void *)*((void *)a3 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NTPBNotificationItemListRecord *)self addNotificationItemIDs:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
  if (*((unsigned char *)a3 + 36))
  {
    self->_notificationSource = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 1)) {
    -[NTPBNotificationItemListRecord setAlgoID:](self, "setAlgoID:");
  }
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
}

- (NSMutableArray)notificationItemIDs
{
  return self->_notificationItemIDs;
}

- (void)setNotificationItemIDs:(id)a3
{
}

- (NSString)algoID
{
  return self->_algoID;
}

- (void)setAlgoID:(id)a3
{
}

@end