@interface CSLUIPBPropertyValue
- (BOOL)hasDataValue;
- (BOOL)hasDictionaryKey;
- (BOOL)hasNumberValue;
- (BOOL)hasSizeValue;
- (BOOL)hasStringValue;
- (BOOL)hasUUIDValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSLUIPBNumber)numberValue;
- (CSLUIPBPropertyValue)dictionaryKey;
- (CSLUIPBSize)sizeValue;
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
- (void)setNumberValue:(id)a3;
- (void)setSizeValue:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setUUIDValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSLUIPBPropertyValue

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
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
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

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CSLUIPBPropertyValue;
  id v4 = [(CSLUIPBPropertyValue *)&v8 description];
  v5 = [(CSLUIPBPropertyValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"stringValue"];
  }
  numberValue = self->_numberValue;
  if (numberValue)
  {
    v7 = [(CSLUIPBNumber *)numberValue dictionaryRepresentation];
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
    v11 = [(CSLUIPBSize *)sizeValue dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"sizeValue"];
  }
  dictionaryKey = self->_dictionaryKey;
  if (dictionaryKey)
  {
    v13 = [(CSLUIPBPropertyValue *)dictionaryKey dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"dictionaryKey"];
  }
  if ([(NSMutableArray *)self->_arrayValues count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_arrayValues, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = self->_arrayValues;
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

    [v4 setObject:v14 forKey:@"arrayValues"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CSLUIPBPropertyValueReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
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
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_arrayValues;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_stringValue) {
    objc_msgSend(v8, "setStringValue:");
  }
  if (self->_numberValue) {
    objc_msgSend(v8, "setNumberValue:");
  }
  if (self->_uUIDValue) {
    objc_msgSend(v8, "setUUIDValue:");
  }
  if (self->_dataValue) {
    objc_msgSend(v8, "setDataValue:");
  }
  if (self->_sizeValue) {
    objc_msgSend(v8, "setSizeValue:");
  }
  if (self->_dictionaryKey) {
    objc_msgSend(v8, "setDictionaryKey:");
  }
  if ([(CSLUIPBPropertyValue *)self arrayValuesCount])
  {
    [v8 clearArrayValues];
    unint64_t v4 = [(CSLUIPBPropertyValue *)self arrayValuesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(CSLUIPBPropertyValue *)self arrayValuesAtIndex:i];
        [v8 addArrayValues:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_stringValue copyWithZone:a3];
  uint64_t v7 = (void *)v5[6];
  v5[6] = v6;

  id v8 = [(CSLUIPBNumber *)self->_numberValue copyWithZone:a3];
  uint64_t v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSData *)self->_uUIDValue copyWithZone:a3];
  long long v11 = (void *)v5[7];
  v5[7] = v10;

  uint64_t v12 = [(NSData *)self->_dataValue copyWithZone:a3];
  long long v13 = (void *)v5[2];
  v5[2] = v12;

  id v14 = [(CSLUIPBSize *)self->_sizeValue copyWithZone:a3];
  uint64_t v15 = (void *)v5[5];
  v5[5] = v14;

  id v16 = [(CSLUIPBPropertyValue *)self->_dictionaryKey copyWithZone:a3];
  uint64_t v17 = (void *)v5[3];
  v5[3] = v16;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v18 = self->_arrayValues;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (void)v25);
        [v5 addArrayValues:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((stringValue = self->_stringValue, !((unint64_t)stringValue | v4[6]))
     || -[NSString isEqual:](stringValue, "isEqual:"))
    && ((numberValue = self->_numberValue, !((unint64_t)numberValue | v4[4]))
     || -[CSLUIPBNumber isEqual:](numberValue, "isEqual:"))
    && ((uUIDValue = self->_uUIDValue, !((unint64_t)uUIDValue | v4[7]))
     || -[NSData isEqual:](uUIDValue, "isEqual:"))
    && ((dataValue = self->_dataValue, !((unint64_t)dataValue | v4[2]))
     || -[NSData isEqual:](dataValue, "isEqual:"))
    && ((sizeValue = self->_sizeValue, !((unint64_t)sizeValue | v4[5]))
     || -[CSLUIPBSize isEqual:](sizeValue, "isEqual:"))
    && ((dictionaryKey = self->_dictionaryKey, !((unint64_t)dictionaryKey | v4[3]))
     || -[CSLUIPBPropertyValue isEqual:](dictionaryKey, "isEqual:")))
  {
    arrayValues = self->_arrayValues;
    if ((unint64_t)arrayValues | v4[1]) {
      char v12 = -[NSMutableArray isEqual:](arrayValues, "isEqual:");
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_stringValue hash];
  unint64_t v4 = [(CSLUIPBNumber *)self->_numberValue hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_uUIDValue hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_dataValue hash];
  unint64_t v7 = [(CSLUIPBSize *)self->_sizeValue hash];
  unint64_t v8 = v7 ^ [(CSLUIPBPropertyValue *)self->_dictionaryKey hash];
  return v6 ^ v8 ^ [(NSMutableArray *)self->_arrayValues hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 6)) {
    -[CSLUIPBPropertyValue setStringValue:](self, "setStringValue:");
  }
  numberValue = self->_numberValue;
  uint64_t v6 = *((void *)v4 + 4);
  if (numberValue)
  {
    if (v6) {
      -[CSLUIPBNumber mergeFrom:](numberValue, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[CSLUIPBPropertyValue setNumberValue:](self, "setNumberValue:");
  }
  if (*((void *)v4 + 7)) {
    -[CSLUIPBPropertyValue setUUIDValue:](self, "setUUIDValue:");
  }
  if (*((void *)v4 + 2)) {
    -[CSLUIPBPropertyValue setDataValue:](self, "setDataValue:");
  }
  sizeValue = self->_sizeValue;
  uint64_t v8 = *((void *)v4 + 5);
  if (sizeValue)
  {
    if (v8) {
      -[CSLUIPBSize mergeFrom:](sizeValue, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[CSLUIPBPropertyValue setSizeValue:](self, "setSizeValue:");
  }
  dictionaryKey = self->_dictionaryKey;
  uint64_t v10 = *((void *)v4 + 3);
  if (dictionaryKey)
  {
    if (v10) {
      -[CSLUIPBPropertyValue mergeFrom:](dictionaryKey, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[CSLUIPBPropertyValue setDictionaryKey:](self, "setDictionaryKey:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v4 + 1);
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
        -[CSLUIPBPropertyValue addArrayValues:](self, "addArrayValues:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (CSLUIPBNumber)numberValue
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

- (CSLUIPBSize)sizeValue
{
  return self->_sizeValue;
}

- (void)setSizeValue:(id)a3
{
}

- (CSLUIPBPropertyValue)dictionaryKey
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