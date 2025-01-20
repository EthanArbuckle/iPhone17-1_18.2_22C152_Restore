@interface CLCompanionSyncAuthObject
+ (Class)interestZonesType;
+ (Class)vectorClocksType;
- (BOOL)clearClient;
- (BOOL)hasAuthMask;
- (BOOL)hasClearClient;
- (BOOL)hasCorrectiveCompensationMask;
- (BOOL)hasNotification;
- (BOOL)hasSuppressShowingInSettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)suppressShowingInSettings;
- (NSMutableArray)interestZones;
- (NSMutableArray)vectorClocks;
- (NSString)clientKey;
- (NSString)description;
- (NSString)objectIdentifier;
- (NSString)sequencer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)interestZonesAtIndex:(unint64_t)a3;
- (id)notificationAsString:(int)a3;
- (id)operationTypeAsString:(int)a3;
- (id)syncId;
- (id)vectorClocksAtIndex:(unint64_t)a3;
- (int)StringAsNotification:(id)a3;
- (int)StringAsOperationType:(id)a3;
- (int)notification;
- (int)operationType;
- (int64_t)changeType;
- (unint64_t)hash;
- (unint64_t)interestZonesCount;
- (unint64_t)vectorClocksCount;
- (unsigned)authMask;
- (unsigned)correctiveCompensationMask;
- (void)addInterestZones:(id)a3;
- (void)addVectorClocks:(id)a3;
- (void)clearInterestZones;
- (void)clearVectorClocks;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAuthMask:(unsigned int)a3;
- (void)setChangeType:(int64_t)a3;
- (void)setClearClient:(BOOL)a3;
- (void)setClientKey:(id)a3;
- (void)setCorrectiveCompensationMask:(unsigned int)a3;
- (void)setHasAuthMask:(BOOL)a3;
- (void)setHasClearClient:(BOOL)a3;
- (void)setHasCorrectiveCompensationMask:(BOOL)a3;
- (void)setHasNotification:(BOOL)a3;
- (void)setHasSuppressShowingInSettings:(BOOL)a3;
- (void)setInterestZones:(id)a3;
- (void)setNotification:(int)a3;
- (void)setObjectIdentifier:(id)a3;
- (void)setOperationType:(int)a3;
- (void)setSuppressShowingInSettings:(BOOL)a3;
- (void)setSyncId:(id)a3;
- (void)setVectorClocks:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLCompanionSyncAuthObject

- (void)dealloc
{
  [(CLCompanionSyncAuthObject *)self setClientKey:0];
  [(CLCompanionSyncAuthObject *)self setVectorClocks:0];
  [(CLCompanionSyncAuthObject *)self setInterestZones:0];
  v3.receiver = self;
  v3.super_class = (Class)CLCompanionSyncAuthObject;
  [(CLCompanionSyncAuthObject *)&v3 dealloc];
}

- (unsigned)authMask
{
  if (*(unsigned char *)&self->_has) {
    return self->_authMask;
  }
  else {
    return 0;
  }
}

- (void)setAuthMask:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_authMask = a3;
}

- (void)setHasAuthMask:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAuthMask
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCorrectiveCompensationMask:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_correctiveCompensationMask = a3;
}

- (void)setHasCorrectiveCompensationMask:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCorrectiveCompensationMask
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)clearClient
{
  return (*(unsigned char *)&self->_has & 8) != 0 && self->_clearClient;
}

- (void)setClearClient:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_clearClient = a3;
}

- (void)setHasClearClient:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasClearClient
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)notification
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_notification;
  }
  else {
    return 0;
  }
}

- (void)setNotification:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_notification = a3;
}

- (void)setHasNotification:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNotification
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)notificationAsString:(int)a3
{
  if (a3 >= 3) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_1022F0D98 + a3);
  }
}

- (int)StringAsNotification:(id)a3
{
  if ([a3 isEqualToString:@"RESET"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"TOGGLE"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"MIGRATION_SYNC_RESET_VERSION_NUMBERS"]) {
    return 2;
  }
  return 0;
}

- (id)operationTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3) {
    return +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return *(&off_1022F0DB0 + a3 - 1);
  }
}

- (int)StringAsOperationType:(id)a3
{
  if ([a3 isEqualToString:@"ADD"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"UPDATE"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"DELETE"]) {
    return 3;
  }
  return 1;
}

- (void)clearVectorClocks
{
}

- (void)addVectorClocks:(id)a3
{
  vectorClocks = self->_vectorClocks;
  if (!vectorClocks)
  {
    vectorClocks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_vectorClocks = vectorClocks;
  }

  [(NSMutableArray *)vectorClocks addObject:a3];
}

- (unint64_t)vectorClocksCount
{
  return (unint64_t)[(NSMutableArray *)self->_vectorClocks count];
}

- (id)vectorClocksAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_vectorClocks objectAtIndex:a3];
}

+ (Class)vectorClocksType
{
  return (Class)objc_opt_class();
}

- (void)clearInterestZones
{
}

- (void)addInterestZones:(id)a3
{
  interestZones = self->_interestZones;
  if (!interestZones)
  {
    interestZones = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_interestZones = interestZones;
  }

  [(NSMutableArray *)interestZones addObject:a3];
}

- (unint64_t)interestZonesCount
{
  return (unint64_t)[(NSMutableArray *)self->_interestZones count];
}

- (id)interestZonesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_interestZones objectAtIndex:a3];
}

+ (Class)interestZonesType
{
  return (Class)objc_opt_class();
}

- (BOOL)suppressShowingInSettings
{
  return (*(unsigned char *)&self->_has & 0x10) != 0 && self->_suppressShowingInSettings;
}

- (void)setSuppressShowingInSettings:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_suppressShowingInSettings = a3;
}

- (void)setHasSuppressShowingInSettings:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSuppressShowingInSettings
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  clientKey = self->_clientKey;
  if (clientKey) {
    [v3 setObject:clientKey forKey:@"clientKey"];
  }
  char has = (char)self->_has;
  if (has)
  {
    [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_authMask)] forKey:@"authMask"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_correctiveCompensationMask)] forKey:@"correctiveCompensationMask"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_11;
  }
LABEL_10:
  [v4 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_clearClient)] forKey:@"clearClient"];
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_15;
  }
LABEL_11:
  uint64_t notification = self->_notification;
  if (notification >= 3) {
    v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_notification];
  }
  else {
    v8 = (NSString *)*(&off_1022F0D98 + notification);
  }
  [v4 setObject:v8 forKey:@"notification"];
LABEL_15:
  int v9 = self->_operationType - 1;
  if (v9 >= 3) {
    v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_operationType];
  }
  else {
    v10 = (NSString *)*(&off_1022F0DB0 + v9);
  }
  [v4 setObject:v10 forKey:@"operationType"];
  if ([(NSMutableArray *)self->_vectorClocks count])
  {
    id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_vectorClocks, "count")];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    vectorClocks = self->_vectorClocks;
    id v13 = [(NSMutableArray *)vectorClocks countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(vectorClocks);
          }
          [v11 addObject:[*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation]];
        }
        id v14 = [(NSMutableArray *)vectorClocks countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v14);
    }
    [v4 setObject:v11 forKey:@"vectorClocks"];
  }
  if ([(NSMutableArray *)self->_interestZones count])
  {
    id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_interestZones, "count")];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    interestZones = self->_interestZones;
    id v19 = [(NSMutableArray *)interestZones countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v25;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(interestZones);
          }
          [v17 addObject:[*(id *)(*((void *)&v24 + 1) + 8 * (void)j) dictionaryRepresentation]];
        }
        id v20 = [(NSMutableArray *)interestZones countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v20);
    }
    [v4 setObject:v17 forKey:@"interestZones"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    [v4 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_suppressShowingInSettings)] forKey:@"suppressShowingInSettings"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100CA19E0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (!self->_clientKey) {
    sub_101A895EC();
  }
  PBDataWriterWriteStringField();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_4:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  PBDataWriterWriteInt32Field();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  vectorClocks = self->_vectorClocks;
  v6 = (char *)[(NSMutableArray *)vectorClocks countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(vectorClocks);
        }
        PBDataWriterWriteSubmessage();
      }
      v7 = (char *)[(NSMutableArray *)vectorClocks countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  interestZones = self->_interestZones;
  id v11 = (char *)[(NSMutableArray *)interestZones countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(interestZones);
        }
        PBDataWriterWriteSubmessage();
      }
      v12 = (char *)[(NSMutableArray *)interestZones countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }
  char v15 = (char)self->_has;
  if ((v15 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v15 = (char)self->_has;
  }
  if ((v15 & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  [a3 setClientKey:self->_clientKey];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_3;
    }
LABEL_19:
    *((unsigned char *)a3 + 56) = self->_clearClient;
    *((unsigned char *)a3 + 60) |= 8u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)a3 + 2) = self->_authMask;
  *((unsigned char *)a3 + 60) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_19;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 9) = self->_notification;
    *((unsigned char *)a3 + 60) |= 4u;
  }
LABEL_5:
  *((_DWORD *)a3 + 10) = self->_operationType;
  if ([(CLCompanionSyncAuthObject *)self vectorClocksCount])
  {
    [a3 clearVectorClocks];
    unint64_t v6 = [(CLCompanionSyncAuthObject *)self vectorClocksCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addVectorClocks:-[CLCompanionSyncAuthObject vectorClocksAtIndex:](self, "vectorClocksAtIndex:", i)];
    }
  }
  if ([(CLCompanionSyncAuthObject *)self interestZonesCount])
  {
    [a3 clearInterestZones];
    unint64_t v9 = [(CLCompanionSyncAuthObject *)self interestZonesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [a3 addInterestZones:-[CLCompanionSyncAuthObject interestZonesAtIndex:](self, "interestZonesAtIndex:", j)];
    }
  }
  char v12 = (char)self->_has;
  if ((v12 & 2) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_correctiveCompensationMask;
    *((unsigned char *)a3 + 60) |= 2u;
    char v12 = (char)self->_has;
  }
  if ((v12 & 0x10) != 0)
  {
    *((unsigned char *)a3 + 57) = self->_suppressShowingInSettings;
    *((unsigned char *)a3 + 60) |= 0x10u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];

  v5[3] = [(NSString *)self->_clientKey copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 2) = self->_authMask;
    *((unsigned char *)v5 + 60) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v5 + 56) = self->_clearClient;
  *((unsigned char *)v5 + 60) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 9) = self->_notification;
    *((unsigned char *)v5 + 60) |= 4u;
  }
LABEL_5:
  *((_DWORD *)v5 + 10) = self->_operationType;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  vectorClocks = self->_vectorClocks;
  id v8 = [(NSMutableArray *)vectorClocks countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(vectorClocks);
        }
        id v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [v5 addVectorClocks:v12];
      }
      id v9 = [(NSMutableArray *)vectorClocks countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  interestZones = self->_interestZones;
  id v14 = [(NSMutableArray *)interestZones countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(interestZones);
        }
        id v18 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)j) copyWithZone:a3];
        [v5 addInterestZones:v18];
      }
      id v15 = [(NSMutableArray *)interestZones countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }
  char v19 = (char)self->_has;
  if ((v19 & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_correctiveCompensationMask;
    *((unsigned char *)v5 + 60) |= 2u;
    char v19 = (char)self->_has;
  }
  if ((v19 & 0x10) != 0)
  {
    *((unsigned char *)v5 + 57) = self->_suppressShowingInSettings;
    *((unsigned char *)v5 + 60) |= 0x10u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  clientKey = self->_clientKey;
  if ((unint64_t)clientKey | *((void *)a3 + 3))
  {
    unsigned int v5 = -[NSString isEqual:](clientKey, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 60) & 1) == 0 || self->_authMask != *((_DWORD *)a3 + 2)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)a3 + 60))
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 60) & 8) == 0) {
      goto LABEL_34;
    }
    if (self->_clearClient)
    {
      if (!*((unsigned char *)a3 + 56)) {
        goto LABEL_34;
      }
    }
    else if (*((unsigned char *)a3 + 56))
    {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)a3 + 60) & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 60) & 4) == 0 || self->_notification != *((_DWORD *)a3 + 9)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)a3 + 60) & 4) != 0)
  {
    goto LABEL_34;
  }
  if (self->_operationType != *((_DWORD *)a3 + 10))
  {
LABEL_34:
    LOBYTE(v5) = 0;
    return v5;
  }
  vectorClocks = self->_vectorClocks;
  if (!((unint64_t)vectorClocks | *((void *)a3 + 6))
    || (unsigned int v5 = -[NSMutableArray isEqual:](vectorClocks, "isEqual:")) != 0)
  {
    interestZones = self->_interestZones;
    if (!((unint64_t)interestZones | *((void *)a3 + 2))
      || (unsigned int v5 = -[NSMutableArray isEqual:](interestZones, "isEqual:")) != 0)
    {
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 60) & 2) == 0 || self->_correctiveCompensationMask != *((_DWORD *)a3 + 8)) {
          goto LABEL_34;
        }
      }
      else if ((*((unsigned char *)a3 + 60) & 2) != 0)
      {
        goto LABEL_34;
      }
      LOBYTE(v5) = (*((unsigned char *)a3 + 60) & 0x10) == 0;
      if ((*(unsigned char *)&self->_has & 0x10) != 0)
      {
        if ((*((unsigned char *)a3 + 60) & 0x10) == 0) {
          goto LABEL_34;
        }
        if (self->_suppressShowingInSettings)
        {
          if (!*((unsigned char *)a3 + 57)) {
            goto LABEL_34;
          }
        }
        else if (*((unsigned char *)a3 + 57))
        {
          goto LABEL_34;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientKey hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v4 = 2654435761 * self->_authMask;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_clearClient;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_notification;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v6 = 0;
LABEL_8:
  uint64_t operationType = self->_operationType;
  unint64_t v8 = (unint64_t)[(NSMutableArray *)self->_vectorClocks hash];
  unint64_t v9 = (unint64_t)[(NSMutableArray *)self->_interestZones hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v10 = 2654435761 * self->_correctiveCompensationMask;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_10;
    }
LABEL_12:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ (2654435761 * operationType) ^ v10 ^ v11;
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_suppressShowingInSettings;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ (2654435761 * operationType) ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[CLCompanionSyncAuthObject setClientKey:](self, "setClientKey:");
  }
  char v5 = *((unsigned char *)a3 + 60);
  if (v5)
  {
    self->_authMask = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 60);
    if ((v5 & 8) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)a3 + 60) & 8) == 0)
  {
    goto LABEL_5;
  }
  self->_clearClient = *((unsigned char *)a3 + 56);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 60) & 4) != 0)
  {
LABEL_6:
    self->_uint64_t notification = *((_DWORD *)a3 + 9);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_7:
  self->_uint64_t operationType = *((_DWORD *)a3 + 10);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 6);
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [(CLCompanionSyncAuthObject *)self addVectorClocks:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = (void *)*((void *)a3 + 2);
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        [(CLCompanionSyncAuthObject *)self addInterestZones:*(void *)(*((void *)&v17 + 1) + 8 * (void)j)];
      }
      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
  char v16 = *((unsigned char *)a3 + 60);
  if ((v16 & 2) != 0)
  {
    self->_correctiveCompensationMask = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v16 = *((unsigned char *)a3 + 60);
  }
  if ((v16 & 0x10) != 0)
  {
    self->_suppressShowingInSettings = *((unsigned char *)a3 + 57);
    *(unsigned char *)&self->_has |= 0x10u;
  }
}

- (NSString)clientKey
{
  return self->_clientKey;
}

- (void)setClientKey:(id)a3
{
}

- (unsigned)correctiveCompensationMask
{
  return self->_correctiveCompensationMask;
}

- (int)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(int)a3
{
  self->_uint64_t operationType = a3;
}

- (NSMutableArray)vectorClocks
{
  return self->_vectorClocks;
}

- (void)setVectorClocks:(id)a3
{
}

- (NSMutableArray)interestZones
{
  return self->_interestZones;
}

- (void)setInterestZones:(id)a3
{
}

- (id)syncId
{
  return self->_clientKey;
}

- (void)setSyncId:(id)a3
{
  self->_clientKey = (NSString *)a3;
}

- (NSString)objectIdentifier
{
  return self->_clientKey;
}

- (void)setObjectIdentifier:(id)a3
{
  self->_clientKey = (NSString *)a3;
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  uint64_t v2 = (self->_operationType - 1);
  if (v2 < 3) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

- (void)setChangeType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 2) {
    self->_uint64_t operationType = a3;
  }
}

- (NSString)description
{
  if ([(CLCompanionSyncAuthObject *)self hasNotification]) {
    return +[NSString stringWithFormat:@"[notification: %d, globalAuth: %d]", self->_notification, self->_authMask, v4];
  }
  else {
    return +[NSString stringWithFormat:@"[clientKey: %@, auth: %d, clear: %d]", self->_clientKey, self->_authMask, self->_clearClient];
  }
}

@end