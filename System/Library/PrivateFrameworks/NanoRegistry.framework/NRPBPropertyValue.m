@interface NRPBPropertyValue
+ (Class)arrayValuesType;
- (BOOL)hasDataValue;
- (BOOL)hasDictionaryKey;
- (BOOL)hasIsDate;
- (BOOL)hasIsError;
- (BOOL)hasIsMiniUUIDSet;
- (BOOL)hasIsSecurePropertyValue;
- (BOOL)hasIsSet;
- (BOOL)hasNumberValue;
- (BOOL)hasSizeValue;
- (BOOL)hasStringValue;
- (BOOL)hasUUIDValue;
- (BOOL)isDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isError;
- (BOOL)isMiniUUIDSet;
- (BOOL)isSecurePropertyValue;
- (BOOL)isSet;
- (BOOL)readFrom:(id)a3;
- (NRPBNumber)numberValue;
- (NRPBPropertyValue)dictionaryKey;
- (NRPBSize)sizeValue;
- (NSData)dataValue;
- (NSData)uUIDValue;
- (NSMutableArray)arrayValues;
- (NSString)stringValue;
- (id)arrayValuesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)arrayValuesCount;
- (unint64_t)hash;
- (void)addArrayValues:(id)a3;
- (void)clearArrayValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArrayValues:(id)a3;
- (void)setDataValue:(id)a3;
- (void)setDictionaryKey:(id)a3;
- (void)setHasIsDate:(BOOL)a3;
- (void)setHasIsError:(BOOL)a3;
- (void)setHasIsMiniUUIDSet:(BOOL)a3;
- (void)setHasIsSecurePropertyValue:(BOOL)a3;
- (void)setHasIsSet:(BOOL)a3;
- (void)setIsDate:(BOOL)a3;
- (void)setIsError:(BOOL)a3;
- (void)setIsMiniUUIDSet:(BOOL)a3;
- (void)setIsSecurePropertyValue:(BOOL)a3;
- (void)setIsSet:(BOOL)a3;
- (void)setNumberValue:(id)a3;
- (void)setSizeValue:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setUUIDValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NRPBPropertyValue

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasNumberValue
{
  return self->_numberValue != 0;
}

- (BOOL)hasUUIDValue
{
  return self->_uUIDValue != 0;
}

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (BOOL)hasSizeValue
{
  return self->_sizeValue != 0;
}

- (BOOL)hasDictionaryKey
{
  return self->_dictionaryKey != 0;
}

- (void)clearArrayValues
{
}

- (void)addArrayValues:(id)a3
{
  id v4 = a3;
  arrayValues = self->_arrayValues;
  id v8 = v4;
  if (!arrayValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_arrayValues;
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

- (id)arrayValuesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_arrayValues objectAtIndex:a3];
}

+ (Class)arrayValuesType
{
  return (Class)objc_opt_class();
}

- (void)setIsSet:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isSet = a3;
}

- (void)setHasIsSet:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsSet
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsSecurePropertyValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isSecurePropertyValue = a3;
}

- (void)setHasIsSecurePropertyValue:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsSecurePropertyValue
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsDate:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isDate = a3;
}

- (void)setHasIsDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsError:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isError = a3;
}

- (void)setHasIsError:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsError
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsMiniUUIDSet:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isMiniUUIDSet = a3;
}

- (void)setHasIsMiniUUIDSet:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsMiniUUIDSet
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NRPBPropertyValue;
  id v4 = [(NRPBPropertyValue *)&v8 description];
  v5 = [(NRPBPropertyValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"stringValue"];
  }
  numberValue = self->_numberValue;
  if (numberValue)
  {
    v7 = [(NRPBNumber *)numberValue dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"numberValue"];
  }
  uUIDValue = self->_uUIDValue;
  if (uUIDValue) {
    [v4 setObject:uUIDValue forKey:@"UUIDValue"];
  }
  dataValue = self->_dataValue;
  if (dataValue) {
    [v4 setObject:dataValue forKey:@"dataValue"];
  }
  sizeValue = self->_sizeValue;
  if (sizeValue)
  {
    v11 = [(NRPBSize *)sizeValue dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"sizeValue"];
  }
  dictionaryKey = self->_dictionaryKey;
  if (dictionaryKey)
  {
    v13 = [(NRPBPropertyValue *)dictionaryKey dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"dictionaryKey"];
  }
  if ([(NSMutableArray *)self->_arrayValues count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_arrayValues, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v15 = self->_arrayValues;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "dictionaryRepresentation", (void)v28);
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"arrayValues"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v24 = [NSNumber numberWithBool:self->_isSet];
    [v4 setObject:v24 forKey:@"isSet"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_24:
      if ((has & 1) == 0) {
        goto LABEL_25;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_24;
  }
  v25 = objc_msgSend(NSNumber, "numberWithBool:", self->_isSecurePropertyValue, (void)v28);
  [v4 setObject:v25 forKey:@"isSecurePropertyValue"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_25:
    if ((has & 2) == 0) {
      goto LABEL_26;
    }
    goto LABEL_34;
  }
LABEL_33:
  v26 = objc_msgSend(NSNumber, "numberWithBool:", self->_isDate, (void)v28);
  [v4 setObject:v26 forKey:@"isDate"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_26:
    if ((has & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_34:
  v27 = objc_msgSend(NSNumber, "numberWithBool:", self->_isError, (void)v28);
  [v4 setObject:v27 forKey:@"isError"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_27:
    v22 = objc_msgSend(NSNumber, "numberWithBool:", self->_isMiniUUIDSet, (void)v28);
    [v4 setObject:v22 forKey:@"isMiniUUIDSet"];
  }
LABEL_28:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBPropertyValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  if (self->_numberValue) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_uUIDValue) {
    PBDataWriterWriteDataField();
  }
  if (self->_dataValue) {
    PBDataWriterWriteDataField();
  }
  if (self->_sizeValue) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dictionaryKey) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_arrayValues;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_22:
      if ((has & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_29;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_22;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_23:
    if ((has & 2) == 0) {
      goto LABEL_24;
    }
LABEL_30:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_30;
  }
LABEL_24:
  if ((has & 4) != 0) {
LABEL_25:
  }
    PBDataWriterWriteBOOLField();
LABEL_26:
}

- (void)copyTo:(id)a3
{
  v9 = a3;
  if (self->_stringValue) {
    objc_msgSend(v9, "setStringValue:");
  }
  if (self->_numberValue) {
    objc_msgSend(v9, "setNumberValue:");
  }
  if (self->_uUIDValue) {
    objc_msgSend(v9, "setUUIDValue:");
  }
  if (self->_dataValue) {
    objc_msgSend(v9, "setDataValue:");
  }
  if (self->_sizeValue) {
    objc_msgSend(v9, "setSizeValue:");
  }
  if (self->_dictionaryKey) {
    objc_msgSend(v9, "setDictionaryKey:");
  }
  if ([(NRPBPropertyValue *)self arrayValuesCount])
  {
    [v9 clearArrayValues];
    unint64_t v4 = [(NRPBPropertyValue *)self arrayValuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NRPBPropertyValue *)self arrayValuesAtIndex:i];
        [v9 addArrayValues:v7];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v9[68] = self->_isSet;
    v9[72] |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_19:
      if ((has & 1) == 0) {
        goto LABEL_20;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_19;
  }
  v9[67] = self->_isSecurePropertyValue;
  v9[72] |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_20:
    if ((has & 2) == 0) {
      goto LABEL_21;
    }
    goto LABEL_29;
  }
LABEL_28:
  v9[64] = self->_isDate;
  v9[72] |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_21:
    if ((has & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_29:
  v9[65] = self->_isError;
  v9[72] |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_22:
    v9[66] = self->_isMiniUUIDSet;
    v9[72] |= 4u;
  }
LABEL_23:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_stringValue copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  id v8 = [(NRPBNumber *)self->_numberValue copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSData *)self->_uUIDValue copyWithZone:a3];
  long long v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  uint64_t v12 = [(NSData *)self->_dataValue copyWithZone:a3];
  long long v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  id v14 = [(NRPBSize *)self->_sizeValue copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  id v16 = [(NRPBPropertyValue *)self->_dictionaryKey copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v18 = self->_arrayValues;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "copyWithZone:", a3, (void)v26);
        [(id)v5 addArrayValues:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v20);
  }

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 68) = self->_isSet;
    *(unsigned char *)(v5 + 72) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_10:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_10;
  }
  *(unsigned char *)(v5 + 67) = self->_isSecurePropertyValue;
  *(unsigned char *)(v5 + 72) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
LABEL_18:
    *(unsigned char *)(v5 + 65) = self->_isError;
    *(unsigned char *)(v5 + 72) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_13;
  }
LABEL_17:
  *(unsigned char *)(v5 + 64) = self->_isDate;
  *(unsigned char *)(v5 + 72) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_18;
  }
LABEL_12:
  if ((has & 4) != 0)
  {
LABEL_13:
    *(unsigned char *)(v5 + 66) = self->_isMiniUUIDSet;
    *(unsigned char *)(v5 + 72) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_50;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_50;
    }
  }
  numberValue = self->_numberValue;
  if ((unint64_t)numberValue | *((void *)v4 + 4))
  {
    if (!-[NRPBNumber isEqual:](numberValue, "isEqual:")) {
      goto LABEL_50;
    }
  }
  uUIDValue = self->_uUIDValue;
  if ((unint64_t)uUIDValue | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](uUIDValue, "isEqual:")) {
      goto LABEL_50;
    }
  }
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](dataValue, "isEqual:")) {
      goto LABEL_50;
    }
  }
  sizeValue = self->_sizeValue;
  if ((unint64_t)sizeValue | *((void *)v4 + 5))
  {
    if (!-[NRPBSize isEqual:](sizeValue, "isEqual:")) {
      goto LABEL_50;
    }
  }
  dictionaryKey = self->_dictionaryKey;
  if ((unint64_t)dictionaryKey | *((void *)v4 + 3))
  {
    if (!-[NRPBPropertyValue isEqual:](dictionaryKey, "isEqual:")) {
      goto LABEL_50;
    }
  }
  arrayValues = self->_arrayValues;
  if ((unint64_t)arrayValues | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](arrayValues, "isEqual:")) {
      goto LABEL_50;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 0x10) == 0) {
      goto LABEL_50;
    }
    if (self->_isSet)
    {
      if (!*((unsigned char *)v4 + 68)) {
        goto LABEL_50;
      }
    }
    else if (*((unsigned char *)v4 + 68))
    {
      goto LABEL_50;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_50;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 8) == 0) {
      goto LABEL_50;
    }
    if (self->_isSecurePropertyValue)
    {
      if (!*((unsigned char *)v4 + 67)) {
        goto LABEL_50;
      }
    }
    else if (*((unsigned char *)v4 + 67))
    {
      goto LABEL_50;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 8) != 0)
  {
    goto LABEL_50;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0) {
      goto LABEL_50;
    }
    if (self->_isDate)
    {
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_50;
      }
    }
    else if (*((unsigned char *)v4 + 64))
    {
      goto LABEL_50;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_50;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0) {
      goto LABEL_50;
    }
    if (self->_isError)
    {
      if (!*((unsigned char *)v4 + 65)) {
        goto LABEL_50;
      }
    }
    else if (*((unsigned char *)v4 + 65))
    {
      goto LABEL_50;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_50;
  }
  BOOL v12 = (*((unsigned char *)v4 + 72) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) != 0)
    {
      if (self->_isMiniUUIDSet)
      {
        if (!*((unsigned char *)v4 + 66)) {
          goto LABEL_50;
        }
      }
      else if (*((unsigned char *)v4 + 66))
      {
        goto LABEL_50;
      }
      BOOL v12 = 1;
      goto LABEL_51;
    }
LABEL_50:
    BOOL v12 = 0;
  }
LABEL_51:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_stringValue hash];
  unint64_t v4 = [(NRPBNumber *)self->_numberValue hash];
  uint64_t v5 = [(NSData *)self->_uUIDValue hash];
  uint64_t v6 = [(NSData *)self->_dataValue hash];
  unint64_t v7 = [(NRPBSize *)self->_sizeValue hash];
  unint64_t v8 = [(NRPBPropertyValue *)self->_dictionaryKey hash];
  uint64_t v9 = [(NSMutableArray *)self->_arrayValues hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v10 = 2654435761 * self->_isSet;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v11 = 2654435761 * self->_isSecurePropertyValue;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    uint64_t v12 = 2654435761 * self->_isDate;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v13 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_9:
  uint64_t v12 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v13 = 2654435761 * self->_isError;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v14 = 2654435761 * self->_isMiniUUIDSet;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 6)) {
    -[NRPBPropertyValue setStringValue:](self, "setStringValue:");
  }
  numberValue = self->_numberValue;
  uint64_t v6 = *((void *)v4 + 4);
  if (numberValue)
  {
    if (v6) {
      -[NRPBNumber mergeFrom:](numberValue, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NRPBPropertyValue setNumberValue:](self, "setNumberValue:");
  }
  if (*((void *)v4 + 7)) {
    -[NRPBPropertyValue setUUIDValue:](self, "setUUIDValue:");
  }
  if (*((void *)v4 + 2)) {
    -[NRPBPropertyValue setDataValue:](self, "setDataValue:");
  }
  sizeValue = self->_sizeValue;
  uint64_t v8 = *((void *)v4 + 5);
  if (sizeValue)
  {
    if (v8) {
      -[NRPBSize mergeFrom:](sizeValue, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NRPBPropertyValue setSizeValue:](self, "setSizeValue:");
  }
  dictionaryKey = self->_dictionaryKey;
  uint64_t v10 = *((void *)v4 + 3);
  if (dictionaryKey)
  {
    if (v10) {
      -[NRPBPropertyValue mergeFrom:](dictionaryKey, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[NRPBPropertyValue setDictionaryKey:](self, "setDictionaryKey:");
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = *((id *)v4 + 1);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        -[NRPBPropertyValue addArrayValues:](self, "addArrayValues:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  char v16 = *((unsigned char *)v4 + 72);
  if ((v16 & 0x10) != 0)
  {
    self->_isSet = *((unsigned char *)v4 + 68);
    *(unsigned char *)&self->_has |= 0x10u;
    char v16 = *((unsigned char *)v4 + 72);
    if ((v16 & 8) == 0)
    {
LABEL_31:
      if ((v16 & 1) == 0) {
        goto LABEL_32;
      }
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 8) == 0)
  {
    goto LABEL_31;
  }
  self->_isSecurePropertyValue = *((unsigned char *)v4 + 67);
  *(unsigned char *)&self->_has |= 8u;
  char v16 = *((unsigned char *)v4 + 72);
  if ((v16 & 1) == 0)
  {
LABEL_32:
    if ((v16 & 2) == 0) {
      goto LABEL_33;
    }
LABEL_39:
    self->_isError = *((unsigned char *)v4 + 65);
    *(unsigned char *)&self->_has |= 2u;
    if ((*((unsigned char *)v4 + 72) & 4) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_38:
  self->_isDate = *((unsigned char *)v4 + 64);
  *(unsigned char *)&self->_has |= 1u;
  char v16 = *((unsigned char *)v4 + 72);
  if ((v16 & 2) != 0) {
    goto LABEL_39;
  }
LABEL_33:
  if ((v16 & 4) != 0)
  {
LABEL_34:
    self->_isMiniUUIDSet = *((unsigned char *)v4 + 66);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_35:
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (NRPBNumber)numberValue
{
  return self->_numberValue;
}

- (void)setNumberValue:(id)a3
{
}

- (NSData)uUIDValue
{
  return self->_uUIDValue;
}

- (void)setUUIDValue:(id)a3
{
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
}

- (NRPBSize)sizeValue
{
  return self->_sizeValue;
}

- (void)setSizeValue:(id)a3
{
}

- (NRPBPropertyValue)dictionaryKey
{
  return self->_dictionaryKey;
}

- (void)setDictionaryKey:(id)a3
{
}

- (NSMutableArray)arrayValues
{
  return self->_arrayValues;
}

- (void)setArrayValues:(id)a3
{
}

- (BOOL)isSet
{
  return self->_isSet;
}

- (BOOL)isSecurePropertyValue
{
  return self->_isSecurePropertyValue;
}

- (BOOL)isDate
{
  return self->_isDate;
}

- (BOOL)isError
{
  return self->_isError;
}

- (BOOL)isMiniUUIDSet
{
  return self->_isMiniUUIDSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uUIDValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_sizeValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_dictionaryKey, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);

  objc_storeStrong((id *)&self->_arrayValues, 0);
}

@end