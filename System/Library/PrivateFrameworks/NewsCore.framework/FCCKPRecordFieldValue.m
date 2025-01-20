@interface FCCKPRecordFieldValue
+ (Class)listValueType;
- (BOOL)hasBytesValue;
- (BOOL)hasDateValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasReferenceValue;
- (BOOL)hasSignedValue;
- (BOOL)hasStringValue;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FCCKPDate)dateValue;
- (FCCKPRecordReference)referenceValue;
- (NSData)bytesValue;
- (NSMutableArray)listValues;
- (NSString)stringValue;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)listValueAtIndex:(unint64_t)a3;
- (int)type;
- (int64_t)signedValue;
- (unint64_t)hash;
- (unint64_t)listValuesCount;
- (void)addListValue:(id)a3;
- (void)clearListValues;
- (void)mergeFrom:(id)a3;
- (void)setBytesValue:(id)a3;
- (void)setDateValue:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasSignedValue:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setListValues:(id)a3;
- (void)setReferenceValue:(id)a3;
- (void)setSignedValue:(int64_t)a3;
- (void)setStringValue:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPRecordFieldValue

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (NSMutableArray)listValues
{
  return self->_listValues;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)addListValue:(id)a3
{
  id v4 = a3;
  listValues = self->_listValues;
  id v8 = v4;
  if (!listValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_listValues;
    self->_listValues = v6;

    id v4 = v8;
    listValues = self->_listValues;
  }
  [(NSMutableArray *)listValues addObject:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_referenceValue, 0);
  objc_storeStrong((id *)&self->_listValues, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_bytesValue, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_bytesValue) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_dateValue) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  if (self->_referenceValue) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_listValues;
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
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setStringValue:(id)a3
{
}

- (void)setSignedValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_signedValue = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasBytesValue
{
  return self->_bytesValue != 0;
}

- (void)setHasSignedValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSignedValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDoubleValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoubleValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDateValue
{
  return self->_dateValue != 0;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasReferenceValue
{
  return self->_referenceValue != 0;
}

- (void)clearListValues
{
}

- (unint64_t)listValuesCount
{
  return [(NSMutableArray *)self->_listValues count];
}

- (id)listValueAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_listValues objectAtIndex:a3];
}

+ (Class)listValueType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPRecordFieldValue;
  id v4 = [(FCCKPRecordFieldValue *)&v8 description];
  v5 = [(FCCKPRecordFieldValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    id v4 = [NSNumber numberWithInt:self->_type];
    [v3 setObject:v4 forKey:@"type"];
  }
  bytesValue = self->_bytesValue;
  if (bytesValue) {
    [v3 setObject:bytesValue forKey:@"bytesValue"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v7 = [NSNumber numberWithLongLong:self->_signedValue];
    [v3 setObject:v7 forKey:@"signedValue"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_doubleValue];
    [v3 setObject:v8 forKey:@"doubleValue"];
  }
  dateValue = self->_dateValue;
  if (dateValue)
  {
    v10 = [(FCCKPDate *)dateValue dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"dateValue"];
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"stringValue"];
  }
  referenceValue = self->_referenceValue;
  if (referenceValue)
  {
    long long v13 = [(FCCKPRecordReference *)referenceValue dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"referenceValue"];
  }
  if ([(NSMutableArray *)self->_listValues count])
  {
    long long v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_listValues, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = self->_listValues;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (void)v22);
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"listValue"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPRecordFieldValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_type;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
  uint64_t v7 = [(NSData *)self->_bytesValue copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_signedValue;
    *(unsigned char *)(v6 + 68) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v6 + 8) = self->_doubleValue;
    *(unsigned char *)(v6 + 68) |= 1u;
  }
  id v10 = [(FCCKPDate *)self->_dateValue copyWithZone:a3];
  long long v11 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_stringValue copyWithZone:a3];
  long long v13 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v12;

  id v14 = [(FCCKPRecordReference *)self->_referenceValue copyWithZone:a3];
  v15 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v14;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v16 = self->_listValues;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (void)v23);
        [(id)v6 addListValue:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 68);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_type != *((_DWORD *)v4 + 16)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_28;
  }
  bytesValue = self->_bytesValue;
  if ((unint64_t)bytesValue | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](bytesValue, "isEqual:"))
    {
LABEL_28:
      char v12 = 0;
      goto LABEL_29;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 68);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_signedValue != *((void *)v4 + 2)) {
      goto LABEL_28;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_28;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_doubleValue != *((double *)v4 + 1)) {
      goto LABEL_28;
    }
  }
  else if (v6)
  {
    goto LABEL_28;
  }
  dateValue = self->_dateValue;
  if ((unint64_t)dateValue | *((void *)v4 + 4) && !-[FCCKPDate isEqual:](dateValue, "isEqual:")) {
    goto LABEL_28;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_28;
    }
  }
  referenceValue = self->_referenceValue;
  if ((unint64_t)referenceValue | *((void *)v4 + 6))
  {
    if (!-[FCCKPRecordReference isEqual:](referenceValue, "isEqual:")) {
      goto LABEL_28;
    }
  }
  listValues = self->_listValues;
  if ((unint64_t)listValues | *((void *)v4 + 5)) {
    char v12 = -[NSMutableArray isEqual:](listValues, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_29:

  return v12;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_bytesValue hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_signedValue;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v10 = 0;
    goto LABEL_14;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  double doubleValue = self->_doubleValue;
  double v7 = -doubleValue;
  if (doubleValue >= 0.0) {
    double v7 = self->_doubleValue;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_14:
  unint64_t v11 = v4 ^ v3 ^ v5 ^ v10 ^ [(FCCKPDate *)self->_dateValue hash];
  NSUInteger v12 = [(NSString *)self->_stringValue hash];
  unint64_t v13 = v12 ^ [(FCCKPRecordReference *)self->_referenceValue hash];
  return v11 ^ v13 ^ [(NSMutableArray *)self->_listValues hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  id v5 = v4;
  if ((v4[17] & 4) != 0)
  {
    self->_type = v4[16];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 3)) {
    -[FCCKPRecordFieldValue setBytesValue:](self, "setBytesValue:");
  }
  char v6 = *((unsigned char *)v5 + 68);
  if ((v6 & 2) != 0)
  {
    self->_signedValue = *((void *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v5 + 68);
  }
  if (v6)
  {
    self->_double doubleValue = *((double *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  dateValue = self->_dateValue;
  long double v8 = (void *)*((void *)v5 + 4);
  if (dateValue)
  {
    if (v8) {
      -[FCCKPDate mergeFrom:]((uint64_t)dateValue, v8);
    }
  }
  else if (v8)
  {
    [(FCCKPRecordFieldValue *)self setDateValue:*((void *)v5 + 4)];
  }
  if (*((void *)v5 + 7)) {
    -[FCCKPRecordFieldValue setStringValue:](self, "setStringValue:");
  }
  referenceValue = self->_referenceValue;
  uint64_t v10 = *((void *)v5 + 6);
  if (referenceValue)
  {
    if (v10) {
      -[FCCKPRecordReference mergeFrom:](referenceValue, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[FCCKPRecordFieldValue setReferenceValue:](self, "setReferenceValue:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v5 + 5);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[FCCKPRecordFieldValue addListValue:](self, "addListValue:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (NSData)bytesValue
{
  return self->_bytesValue;
}

- (void)setBytesValue:(id)a3
{
}

- (int64_t)signedValue
{
  return self->_signedValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (FCCKPDate)dateValue
{
  return self->_dateValue;
}

- (void)setDateValue:(id)a3
{
}

- (FCCKPRecordReference)referenceValue
{
  return self->_referenceValue;
}

- (void)setReferenceValue:(id)a3
{
}

- (void)setListValues:(id)a3
{
}

@end