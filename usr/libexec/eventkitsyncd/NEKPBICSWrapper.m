@interface NEKPBICSWrapper
+ (Class)metadataKeysType;
+ (Class)metadataValuesType;
- (BOOL)hasCalendarIdentifier;
- (BOOL)hasCalendarItemCount;
- (BOOL)hasDisplayOrder;
- (BOOL)hasICSData;
- (BOOL)hasLzfseICSData;
- (BOOL)hasNuevoIdentifier;
- (BOOL)hasOldCalendarIdentifier;
- (BOOL)hasOldIdentifier;
- (BOOL)hasSyncID;
- (BOOL)hasTaskCompletionDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NEKPBCalendarIdentifier)calendarIdentifier;
- (NSData)iCSData;
- (NSData)lzfseICSData;
- (NSMutableArray)metadataKeys;
- (NSMutableArray)metadataValues;
- (NSString)nuevoIdentifier;
- (NSString)oldCalendarIdentifier;
- (NSString)oldIdentifier;
- (NSString)syncID;
- (double)taskCompletionDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)metadataKeysAtIndex:(unint64_t)a3;
- (id)metadataValuesAtIndex:(unint64_t)a3;
- (unint64_t)displayOrder;
- (unint64_t)hash;
- (unint64_t)metadataKeysCount;
- (unint64_t)metadataValuesCount;
- (unsigned)calendarItemCount;
- (void)addMetadataKeys:(id)a3;
- (void)addMetadataValues:(id)a3;
- (void)clearMetadataKeys;
- (void)clearMetadataValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCalendarIdentifier:(id)a3;
- (void)setCalendarItemCount:(unsigned int)a3;
- (void)setDisplayOrder:(unint64_t)a3;
- (void)setHasCalendarItemCount:(BOOL)a3;
- (void)setHasDisplayOrder:(BOOL)a3;
- (void)setHasTaskCompletionDate:(BOOL)a3;
- (void)setICSData:(id)a3;
- (void)setLzfseICSData:(id)a3;
- (void)setMetadataKeys:(id)a3;
- (void)setMetadataValues:(id)a3;
- (void)setNuevoIdentifier:(id)a3;
- (void)setOldCalendarIdentifier:(id)a3;
- (void)setOldIdentifier:(id)a3;
- (void)setSyncID:(id)a3;
- (void)setTaskCompletionDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NEKPBICSWrapper

- (BOOL)hasICSData
{
  return self->_iCSData != 0;
}

- (BOOL)hasCalendarIdentifier
{
  return self->_calendarIdentifier != 0;
}

- (void)setCalendarItemCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_calendarItemCount = a3;
}

- (void)setHasCalendarItemCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCalendarItemCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)clearMetadataKeys
{
}

- (void)addMetadataKeys:(id)a3
{
  id v4 = a3;
  metadataKeys = self->_metadataKeys;
  id v8 = v4;
  if (!metadataKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_metadataKeys;
    self->_metadataKeys = v6;

    id v4 = v8;
    metadataKeys = self->_metadataKeys;
  }
  [(NSMutableArray *)metadataKeys addObject:v4];
}

- (unint64_t)metadataKeysCount
{
  return (unint64_t)[(NSMutableArray *)self->_metadataKeys count];
}

- (id)metadataKeysAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_metadataKeys objectAtIndex:a3];
}

+ (Class)metadataKeysType
{
  return (Class)objc_opt_class();
}

- (void)clearMetadataValues
{
}

- (void)addMetadataValues:(id)a3
{
  id v4 = a3;
  metadataValues = self->_metadataValues;
  id v8 = v4;
  if (!metadataValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_metadataValues;
    self->_metadataValues = v6;

    id v4 = v8;
    metadataValues = self->_metadataValues;
  }
  [(NSMutableArray *)metadataValues addObject:v4];
}

- (unint64_t)metadataValuesCount
{
  return (unint64_t)[(NSMutableArray *)self->_metadataValues count];
}

- (id)metadataValuesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_metadataValues objectAtIndex:a3];
}

+ (Class)metadataValuesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSyncID
{
  return self->_syncID != 0;
}

- (BOOL)hasOldCalendarIdentifier
{
  return self->_oldCalendarIdentifier != 0;
}

- (void)setTaskCompletionDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_taskCompletionDate = a3;
}

- (void)setHasTaskCompletionDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTaskCompletionDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasOldIdentifier
{
  return self->_oldIdentifier != 0;
}

- (BOOL)hasNuevoIdentifier
{
  return self->_nuevoIdentifier != 0;
}

- (void)setDisplayOrder:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_displayOrder = a3;
}

- (void)setHasDisplayOrder:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisplayOrder
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLzfseICSData
{
  return self->_lzfseICSData != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NEKPBICSWrapper;
  char v3 = [(NEKPBICSWrapper *)&v7 description];
  id v4 = [(NEKPBICSWrapper *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  iCSData = self->_iCSData;
  if (iCSData) {
    [v3 setObject:iCSData forKey:@"ICSData"];
  }
  calendarIdentifier = self->_calendarIdentifier;
  if (calendarIdentifier)
  {
    objc_super v7 = [(NEKPBCalendarIdentifier *)calendarIdentifier dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"calendarIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    id v8 = +[NSNumber numberWithUnsignedInt:self->_calendarItemCount];
    [v4 setObject:v8 forKey:@"calendarItemCount"];
  }
  metadataKeys = self->_metadataKeys;
  if (metadataKeys) {
    [v4 setObject:metadataKeys forKey:@"metadataKeys"];
  }
  if ([(NSMutableArray *)self->_metadataValues count])
  {
    id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_metadataValues, "count")];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v11 = self->_metadataValues;
    id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation:v25];
          [v10 addObject:v16];
        }
        id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"metadataValues"];
  }
  syncID = self->_syncID;
  if (syncID) {
    [v4 setObject:syncID forKey:@"syncID"];
  }
  oldCalendarIdentifier = self->_oldCalendarIdentifier;
  if (oldCalendarIdentifier) {
    [v4 setObject:oldCalendarIdentifier forKey:@"oldCalendarIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v19 = +[NSNumber numberWithDouble:self->_taskCompletionDate];
    [v4 setObject:v19 forKey:@"taskCompletionDate"];
  }
  oldIdentifier = self->_oldIdentifier;
  if (oldIdentifier) {
    [v4 setObject:oldIdentifier forKey:@"oldIdentifier"];
  }
  nuevoIdentifier = self->_nuevoIdentifier;
  if (nuevoIdentifier) {
    [v4 setObject:nuevoIdentifier forKey:@"nuevoIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v22 = +[NSNumber numberWithUnsignedLongLong:self->_displayOrder];
    [v4 setObject:v22 forKey:@"displayOrder"];
  }
  lzfseICSData = self->_lzfseICSData;
  if (lzfseICSData) {
    [v4 setObject:lzfseICSData forKey:@"lzfseICSData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10005E510((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_iCSData) {
    PBDataWriterWriteDataField();
  }
  if (self->_calendarIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_metadataKeys;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = self->_metadataValues;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      id v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_syncID) {
    PBDataWriterWriteStringField();
  }
  if (self->_oldCalendarIdentifier) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_oldIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_nuevoIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteFixed64Field();
  }
  if (self->_lzfseICSData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (self->_iCSData)
  {
    [v4 setICSData:];
    id v4 = v14;
  }
  if (self->_calendarIdentifier)
  {
    [v14 setCalendarIdentifier:];
    id v4 = v14;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_calendarItemCount;
    *((unsigned char *)v4 + 104) |= 4u;
  }
  if ([(NEKPBICSWrapper *)self metadataKeysCount])
  {
    [v14 clearMetadataKeys];
    unint64_t v5 = [(NEKPBICSWrapper *)self metadataKeysCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NEKPBICSWrapper *)self metadataKeysAtIndex:i];
        [v14 addMetadataKeys:v8];
      }
    }
  }
  if ([(NEKPBICSWrapper *)self metadataValuesCount])
  {
    [v14 clearMetadataValues];
    unint64_t v9 = [(NEKPBICSWrapper *)self metadataValuesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        id v12 = [(NEKPBICSWrapper *)self metadataValuesAtIndex:j];
        [v14 addMetadataValues:v12];
      }
    }
  }
  if (self->_syncID) {
    [v14 setSyncID:];
  }
  uint64_t v13 = v14;
  if (self->_oldCalendarIdentifier)
  {
    [v14 setOldCalendarIdentifier:];
    uint64_t v13 = v14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v13[2] = *(void *)&self->_taskCompletionDate;
    *((unsigned char *)v13 + 104) |= 2u;
  }
  if (self->_oldIdentifier)
  {
    [v14 setOldIdentifier:];
    uint64_t v13 = v14;
  }
  if (self->_nuevoIdentifier)
  {
    [v14 setNuevoIdentifier:];
    uint64_t v13 = v14;
  }
  if (*(unsigned char *)&self->_has)
  {
    v13[1] = self->_displayOrder;
    *((unsigned char *)v13 + 104) |= 1u;
  }
  if (self->_lzfseICSData)
  {
    [v14 setLzfseICSData:];
    uint64_t v13 = v14;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_iCSData copyWithZone:a3];
  objc_super v7 = (void *)v5[5];
  v5[5] = v6;

  id v8 = [(NEKPBCalendarIdentifier *)self->_calendarIdentifier copyWithZone:a3];
  unint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_calendarItemCount;
    *((unsigned char *)v5 + 104) |= 4u;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  unint64_t v10 = self->_metadataKeys;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v37 + 1) + 8 * (void)v14) copyWithZone:a3];
        [v5 addMetadataKeys:v15];

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v12);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v16 = self->_metadataValues;
  id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v34;
    do
    {
      long long v20 = 0;
      do
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v33 + 1) + 8 * (void)v20) copyWithZone:a3];
        [v5 addMetadataValues:v21];

        long long v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v18);
  }

  id v22 = [(NSString *)self->_syncID copyWithZone:a3];
  v23 = (void *)v5[12];
  v5[12] = v22;

  id v24 = [(NSString *)self->_oldCalendarIdentifier copyWithZone:a3];
  long long v25 = (void *)v5[10];
  v5[10] = v24;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[2] = *(void *)&self->_taskCompletionDate;
    *((unsigned char *)v5 + 104) |= 2u;
  }
  id v26 = -[NSString copyWithZone:](self->_oldIdentifier, "copyWithZone:", a3, (void)v33);
  long long v27 = (void *)v5[11];
  v5[11] = v26;

  id v28 = [(NSString *)self->_nuevoIdentifier copyWithZone:a3];
  v29 = (void *)v5[9];
  v5[9] = v28;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_displayOrder;
    *((unsigned char *)v5 + 104) |= 1u;
  }
  id v30 = [(NSData *)self->_lzfseICSData copyWithZone:a3];
  v31 = (void *)v5[6];
  v5[6] = v30;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  iCSData = self->_iCSData;
  if ((unint64_t)iCSData | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](iCSData, "isEqual:")) {
      goto LABEL_35;
    }
  }
  calendarIdentifier = self->_calendarIdentifier;
  if ((unint64_t)calendarIdentifier | *((void *)v4 + 3))
  {
    if (!-[NEKPBCalendarIdentifier isEqual:](calendarIdentifier, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 4) == 0 || self->_calendarItemCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 4) != 0)
  {
LABEL_35:
    unsigned __int8 v14 = 0;
    goto LABEL_36;
  }
  metadataKeys = self->_metadataKeys;
  if ((unint64_t)metadataKeys | *((void *)v4 + 7)
    && !-[NSMutableArray isEqual:](metadataKeys, "isEqual:"))
  {
    goto LABEL_35;
  }
  metadataValues = self->_metadataValues;
  if ((unint64_t)metadataValues | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](metadataValues, "isEqual:")) {
      goto LABEL_35;
    }
  }
  syncID = self->_syncID;
  if ((unint64_t)syncID | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](syncID, "isEqual:")) {
      goto LABEL_35;
    }
  }
  oldCalendarIdentifier = self->_oldCalendarIdentifier;
  if ((unint64_t)oldCalendarIdentifier | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](oldCalendarIdentifier, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 2) == 0 || self->_taskCompletionDate != *((double *)v4 + 2)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 2) != 0)
  {
    goto LABEL_35;
  }
  oldIdentifier = self->_oldIdentifier;
  if ((unint64_t)oldIdentifier | *((void *)v4 + 11)
    && !-[NSString isEqual:](oldIdentifier, "isEqual:"))
  {
    goto LABEL_35;
  }
  nuevoIdentifier = self->_nuevoIdentifier;
  if ((unint64_t)nuevoIdentifier | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](nuevoIdentifier, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 104) & 1) == 0 || self->_displayOrder != *((void *)v4 + 1)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 104))
  {
    goto LABEL_35;
  }
  lzfseICSData = self->_lzfseICSData;
  if ((unint64_t)lzfseICSData | *((void *)v4 + 6)) {
    unsigned __int8 v14 = -[NSData isEqual:](lzfseICSData, "isEqual:");
  }
  else {
    unsigned __int8 v14 = 1;
  }
LABEL_36:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v19 = (unint64_t)[(NSData *)self->_iCSData hash];
  unint64_t v17 = [(NEKPBCalendarIdentifier *)self->_calendarIdentifier hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_calendarItemCount;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_metadataKeys hash];
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_metadataValues hash];
  NSUInteger v6 = [(NSString *)self->_syncID hash];
  NSUInteger v7 = [(NSString *)self->_oldCalendarIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double taskCompletionDate = self->_taskCompletionDate;
    double v10 = -taskCompletionDate;
    if (taskCompletionDate >= 0.0) {
      double v10 = self->_taskCompletionDate;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  NSUInteger v13 = [(NSString *)self->_oldIdentifier hash];
  NSUInteger v14 = [(NSString *)self->_nuevoIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v15 = 2654435761u * self->_displayOrder;
  }
  else {
    unint64_t v15 = 0;
  }
  return v18 ^ v19 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14 ^ v15 ^ (unint64_t)[(NSData *)self->_lzfseICSData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[NEKPBICSWrapper setICSData:](self, "setICSData:");
  }
  calendarIdentifier = self->_calendarIdentifier;
  uint64_t v6 = *((void *)v4 + 3);
  if (calendarIdentifier)
  {
    if (v6) {
      -[NEKPBCalendarIdentifier mergeFrom:](calendarIdentifier, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NEKPBICSWrapper setCalendarIdentifier:](self, "setCalendarIdentifier:");
  }
  if ((*((unsigned char *)v4 + 104) & 4) != 0)
  {
    self->_calendarItemCount = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v4 + 7);
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NEKPBICSWrapper *)self addMetadataKeys:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 8);
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[NEKPBICSWrapper addMetadataValues:](self, "addMetadataValues:", *(void *)(*((void *)&v17 + 1) + 8 * (void)j), (void)v17);
      }
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  if (*((void *)v4 + 12)) {
    -[NEKPBICSWrapper setSyncID:](self, "setSyncID:");
  }
  if (*((void *)v4 + 10)) {
    -[NEKPBICSWrapper setOldCalendarIdentifier:](self, "setOldCalendarIdentifier:");
  }
  if ((*((unsigned char *)v4 + 104) & 2) != 0)
  {
    self->_double taskCompletionDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 11)) {
    -[NEKPBICSWrapper setOldIdentifier:](self, "setOldIdentifier:");
  }
  if (*((void *)v4 + 9)) {
    -[NEKPBICSWrapper setNuevoIdentifier:](self, "setNuevoIdentifier:");
  }
  if (*((unsigned char *)v4 + 104))
  {
    self->_displayOrder = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6)) {
    -[NEKPBICSWrapper setLzfseICSData:](self, "setLzfseICSData:");
  }
}

- (NSData)iCSData
{
  return self->_iCSData;
}

- (void)setICSData:(id)a3
{
}

- (NEKPBCalendarIdentifier)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
}

- (unsigned)calendarItemCount
{
  return self->_calendarItemCount;
}

- (NSMutableArray)metadataKeys
{
  return self->_metadataKeys;
}

- (void)setMetadataKeys:(id)a3
{
}

- (NSMutableArray)metadataValues
{
  return self->_metadataValues;
}

- (void)setMetadataValues:(id)a3
{
}

- (NSString)syncID
{
  return self->_syncID;
}

- (void)setSyncID:(id)a3
{
}

- (NSString)oldCalendarIdentifier
{
  return self->_oldCalendarIdentifier;
}

- (void)setOldCalendarIdentifier:(id)a3
{
}

- (double)taskCompletionDate
{
  return self->_taskCompletionDate;
}

- (NSString)oldIdentifier
{
  return self->_oldIdentifier;
}

- (void)setOldIdentifier:(id)a3
{
}

- (NSString)nuevoIdentifier
{
  return self->_nuevoIdentifier;
}

- (void)setNuevoIdentifier:(id)a3
{
}

- (unint64_t)displayOrder
{
  return self->_displayOrder;
}

- (NSData)lzfseICSData
{
  return self->_lzfseICSData;
}

- (void)setLzfseICSData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncID, 0);
  objc_storeStrong((id *)&self->_oldIdentifier, 0);
  objc_storeStrong((id *)&self->_oldCalendarIdentifier, 0);
  objc_storeStrong((id *)&self->_nuevoIdentifier, 0);
  objc_storeStrong((id *)&self->_metadataValues, 0);
  objc_storeStrong((id *)&self->_metadataKeys, 0);
  objc_storeStrong((id *)&self->_lzfseICSData, 0);
  objc_storeStrong((id *)&self->_iCSData, 0);

  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
}

@end