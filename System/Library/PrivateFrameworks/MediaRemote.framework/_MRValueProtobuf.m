@interface _MRValueProtobuf
+ (Class)arrayValueType;
- (BOOL)BOOLValue;
- (BOOL)hasBoolValue;
- (BOOL)hasDataValue;
- (BOOL)hasDateValue;
- (BOOL)hasDictionaryValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasFloatValue;
- (BOOL)hasInt64Value;
- (BOOL)hasStringValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)dataValue;
- (NSMutableArray)arrayValues;
- (NSString)dateValue;
- (NSString)stringValue;
- (_MRDictionaryProtobuf)dictionaryValue;
- (double)doubleValue;
- (float)floatValue;
- (id)arrayValueAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)int64Value;
- (unint64_t)arrayValuesCount;
- (unint64_t)hash;
- (void)addArrayValue:(id)a3;
- (void)clearArrayValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArrayValues:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setDataValue:(id)a3;
- (void)setDateValue:(id)a3;
- (void)setDictionaryValue:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setFloatValue:(float)a3;
- (void)setHasBoolValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasFloatValue:(BOOL)a3;
- (void)setHasInt64Value:(BOOL)a3;
- (void)setInt64Value:(int64_t)a3;
- (void)setStringValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRValueProtobuf

- (void)setInt64Value:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int64Value = a3;
}

- (void)setDoubleValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_doubleValue = a3;
}

- (void)setFloatValue:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_floatValue = a3;
}

- (void)setBoolValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_BOOLValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_dictionaryValue, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);

  objc_storeStrong((id *)&self->_arrayValues, 0);
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasInt64Value
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int64_t)int64Value
{
  return self->_int64Value;
}

- (BOOL)hasFloatValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasDoubleValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (BOOL)hasBoolValue
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteFloatField();
  if (*(unsigned char *)&self->_has) {
LABEL_6:
  }
    PBDataWriterWriteDoubleField();
LABEL_7:
  if (self->_dataValue) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_dateValue) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_arrayValues;
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

  if (self->_dictionaryValue) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)setHasInt64Value:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setHasFloatValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDateValue
{
  return self->_dateValue != 0;
}

- (void)clearArrayValues
{
}

- (void)addArrayValue:(id)a3
{
  id v4 = a3;
  arrayValues = self->_arrayValues;
  id v8 = v4;
  if (!arrayValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_arrayValues;
    self->_arrayValues = v6;

    id v4 = v8;
    arrayValues = self->_arrayValues;
  }
  [(NSMutableArray *)arrayValues addObject:v4];
}

- (unint64_t)arrayValuesCount
{
  return [(NSMutableArray *)self->_arrayValues count];
}

- (id)arrayValueAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_arrayValues objectAtIndex:a3];
}

+ (Class)arrayValueType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDictionaryValue
{
  return self->_dictionaryValue != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRValueProtobuf;
  id v4 = [(_MRValueProtobuf *)&v8 description];
  v5 = [(_MRValueProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v3;
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"stringValue"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v22 = [NSNumber numberWithLongLong:self->_int64Value];
    [v5 setObject:v22 forKey:@"int64Value"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(float *)&double v4 = self->_floatValue;
  v23 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v23 forKey:@"floatValue"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    objc_super v8 = [NSNumber numberWithDouble:self->_doubleValue];
    [v5 setObject:v8 forKey:@"doubleValue"];
  }
LABEL_7:
  dataValue = self->_dataValue;
  if (dataValue) {
    [v5 setObject:dataValue forKey:@"dataValue"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_BOOLValue];
    [v5 setObject:v10 forKey:@"BOOLValue"];
  }
  dateValue = self->_dateValue;
  if (dateValue) {
    [v5 setObject:dateValue forKey:@"dateValue"];
  }
  if ([(NSMutableArray *)self->_arrayValues count])
  {
    long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_arrayValues, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v13 = self->_arrayValues;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "dictionaryRepresentation", (void)v24);
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v15);
    }

    [v5 setObject:v12 forKey:@"arrayValue"];
  }
  dictionaryValue = self->_dictionaryValue;
  if (dictionaryValue)
  {
    v20 = [(_MRDictionaryProtobuf *)dictionaryValue dictionaryRepresentation];
    [v5 setObject:v20 forKey:@"dictionaryValue"];
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return _MRValueProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_stringValue)
  {
    objc_msgSend(v4, "setStringValue:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_int64Value;
    *((unsigned char *)v4 + 76) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 14) = LODWORD(self->_floatValue);
  *((unsigned char *)v4 + 76) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    *((void *)v4 + 1) = *(void *)&self->_doubleValue;
    *((unsigned char *)v4 + 76) |= 1u;
  }
LABEL_7:
  if (self->_dataValue)
  {
    objc_msgSend(v10, "setDataValue:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v4 + 72) = self->_BOOLValue;
    *((unsigned char *)v4 + 76) |= 8u;
  }
  if (self->_dateValue) {
    objc_msgSend(v10, "setDateValue:");
  }
  if ([(_MRValueProtobuf *)self arrayValuesCount])
  {
    [v10 clearArrayValues];
    unint64_t v6 = [(_MRValueProtobuf *)self arrayValuesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(_MRValueProtobuf *)self arrayValueAtIndex:i];
        [v10 addArrayValue:v9];
      }
    }
  }
  if (self->_dictionaryValue) {
    objc_msgSend(v10, "setDictionaryValue:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_stringValue copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_int64Value;
    *(unsigned char *)(v5 + 76) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v5 + 56) = self->_floatValue;
  *(unsigned char *)(v5 + 76) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_doubleValue;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
LABEL_5:
  uint64_t v9 = [(NSData *)self->_dataValue copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v5 + 72) = self->_BOOLValue;
    *(unsigned char *)(v5 + 76) |= 8u;
  }
  uint64_t v11 = [(NSString *)self->_dateValue copyWithZone:a3];
  long long v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v13 = self->_arrayValues;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
        [(id)v5 addArrayValue:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  id v19 = [(_MRDictionaryProtobuf *)self->_dictionaryValue copyWithZone:a3];
  v20 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v19;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_36;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_int64Value != *((void *)v4 + 2)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) == 0 || self->_floatValue != *((float *)v4 + 14)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
    goto LABEL_36;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_doubleValue != *((double *)v4 + 1)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_36;
  }
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](dataValue, "isEqual:")) {
      goto LABEL_36;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 8) != 0)
    {
      if (self->_BOOLValue)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_36;
        }
        goto LABEL_30;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_30;
      }
    }
LABEL_36:
    char v11 = 0;
    goto LABEL_37;
  }
  if ((*((unsigned char *)v4 + 76) & 8) != 0) {
    goto LABEL_36;
  }
LABEL_30:
  dateValue = self->_dateValue;
  if ((unint64_t)dateValue | *((void *)v4 + 5) && !-[NSString isEqual:](dateValue, "isEqual:")) {
    goto LABEL_36;
  }
  arrayValues = self->_arrayValues;
  if ((unint64_t)arrayValues | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](arrayValues, "isEqual:")) {
      goto LABEL_36;
    }
  }
  dictionaryValue = self->_dictionaryValue;
  if ((unint64_t)dictionaryValue | *((void *)v4 + 6)) {
    char v11 = -[_MRDictionaryProtobuf isEqual:](dictionaryValue, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_37:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_stringValue hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_int64Value;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float floatValue = self->_floatValue;
  float v7 = -floatValue;
  if (floatValue >= 0.0) {
    float v7 = self->_floatValue;
  }
  float v8 = floorf(v7 + 0.5);
  float v9 = (float)(v7 - v8) * 1.8447e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabsf(v9);
  }
LABEL_11:
  if (has)
  {
    double doubleValue = self->_doubleValue;
    double v13 = -doubleValue;
    if (doubleValue >= 0.0) {
      double v13 = self->_doubleValue;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  uint64_t v16 = [(NSData *)self->_dataValue hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v17 = 2654435761 * self->_BOOLValue;
  }
  else {
    uint64_t v17 = 0;
  }
  NSUInteger v18 = v5 ^ v3 ^ v10 ^ v11 ^ v16;
  NSUInteger v19 = v17 ^ [(NSString *)self->_dateValue hash];
  uint64_t v20 = v18 ^ v19 ^ [(NSMutableArray *)self->_arrayValues hash];
  return v20 ^ [(_MRDictionaryProtobuf *)self->_dictionaryValue hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 8)) {
    -[_MRValueProtobuf setStringValue:](self, "setStringValue:");
  }
  char v5 = *((unsigned char *)v4 + 76);
  if ((v5 & 2) != 0)
  {
    self->_int64Value = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 76);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_float floatValue = *((float *)v4 + 14);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 76))
  {
LABEL_6:
    self->_double doubleValue = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_7:
  if (*((void *)v4 + 4)) {
    -[_MRValueProtobuf setDataValue:](self, "setDataValue:");
  }
  if ((*((unsigned char *)v4 + 76) & 8) != 0)
  {
    self->_BOOLValue = *((unsigned char *)v4 + 72);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 5)) {
    -[_MRValueProtobuf setDateValue:](self, "setDateValue:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *((id *)v4 + 3);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        -[_MRValueProtobuf addArrayValue:](self, "addArrayValue:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  dictionaryValue = self->_dictionaryValue;
  uint64_t v12 = *((void *)v4 + 6);
  if (dictionaryValue)
  {
    if (v12) {
      -[_MRDictionaryProtobuf mergeFrom:](dictionaryValue, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[_MRValueProtobuf setDictionaryValue:](self, "setDictionaryValue:");
  }
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (float)floatValue
{
  return self->_floatValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
}

- (NSString)dateValue
{
  return self->_dateValue;
}

- (void)setDateValue:(id)a3
{
}

- (NSMutableArray)arrayValues
{
  return self->_arrayValues;
}

- (void)setArrayValues:(id)a3
{
}

- (_MRDictionaryProtobuf)dictionaryValue
{
  return self->_dictionaryValue;
}

- (void)setDictionaryValue:(id)a3
{
}

@end