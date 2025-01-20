@interface ADFeature
+ (Class)stringValueType;
- (BOOL)hasName;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)stringValues;
- (NSString)name;
- (NSString)version;
- (double)doubleValueAtIndex:(unint64_t)a3;
- (double)doubleValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stringValueAtIndex:(unint64_t)a3;
- (unint64_t)doubleValuesCount;
- (unint64_t)hash;
- (unint64_t)stringValuesCount;
- (void)addDoubleValue:(double)a3;
- (void)addStringValue:(id)a3;
- (void)clearDoubleValues;
- (void)clearStringValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDoubleValues:(double *)a3 count:(unint64_t)a4;
- (void)setName:(id)a3;
- (void)setStringValues:(id)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ADFeature

- (void)dealloc
{
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)ADFeature;
  [(ADFeature *)&v3 dealloc];
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (unint64_t)doubleValuesCount
{
  return self->_doubleValues.count;
}

- (double)doubleValues
{
  return self->_doubleValues.list;
}

- (void)clearDoubleValues
{
}

- (void)addDoubleValue:(double)a3
{
}

- (double)doubleValueAtIndex:(unint64_t)a3
{
  p_doubleValues = &self->_doubleValues;
  unint64_t count = self->_doubleValues.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = objc_msgSend_exceptionWithName_reason_userInfo_(v6, v9, v7, v8, 0);
    objc_msgSend_raise(v10, v11, v12);
  }
  return p_doubleValues->list[a3];
}

- (void)setDoubleValues:(double *)a3 count:(unint64_t)a4
{
}

- (void)clearStringValues
{
  objc_msgSend_removeAllObjects(self->_stringValues, a2, v2);
}

- (void)addStringValue:(id)a3
{
  v4 = (const char *)a3;
  stringValues = self->_stringValues;
  v8 = (char *)v4;
  if (!stringValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_stringValues;
    self->_stringValues = v6;

    v4 = v8;
    stringValues = self->_stringValues;
  }
  objc_msgSend_addObject_(stringValues, v4, (uint64_t)v4);
}

- (unint64_t)stringValuesCount
{
  return objc_msgSend_count(self->_stringValues, a2, v2);
}

- (id)stringValueAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_stringValues, a2, a3);
}

+ (Class)stringValueType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (id)description
{
  objc_super v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)ADFeature;
  v4 = [(ADFeature *)&v11 description];
  uint64_t v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  version = self->_version;
  if (version) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)version, @"version");
  }
  v8 = PBRepeatedDoubleNSArray();
  objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"doubleValue");

  stringValues = self->_stringValues;
  if (stringValues) {
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)stringValues, @"stringValue");
  }
  name = self->_name;
  if (name) {
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)name, @"name");
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return ADFeatureReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_version) {
    PBDataWriterWriteStringField();
  }
  if (self->_doubleValues.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      ++v5;
    }
    while (v5 < self->_doubleValues.count);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_stringValues;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v13, v17, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v13, v17, 16);
    }
    while (v9);
  }

  if (self->_name) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v25 = a3;
  version = self->_version;
  if (version) {
    objc_msgSend_setVersion_(v25, v4, (uint64_t)version);
  }
  if (objc_msgSend_doubleValuesCount(self, v4, (uint64_t)version))
  {
    objc_msgSend_clearDoubleValues(v25, v6, v7);
    uint64_t v10 = objc_msgSend_doubleValuesCount(self, v8, v9);
    if (v10)
    {
      uint64_t v11 = v10;
      for (uint64_t i = 0; i != v11; ++i)
      {
        objc_msgSend_doubleValueAtIndex_(self, v6, i);
        objc_msgSend_addDoubleValue_(v25, v13, v14);
      }
    }
  }
  if (objc_msgSend_stringValuesCount(self, v6, v7))
  {
    objc_msgSend_clearStringValues(v25, v15, v16);
    uint64_t v19 = objc_msgSend_stringValuesCount(self, v17, v18);
    if (v19)
    {
      uint64_t v20 = v19;
      for (uint64_t j = 0; j != v20; ++j)
      {
        v22 = objc_msgSend_stringValueAtIndex_(self, v15, j);
        objc_msgSend_addStringValue_(v25, v23, (uint64_t)v22);
      }
    }
  }
  name = self->_name;
  if (name) {
    objc_msgSend_setName_(v25, v15, (uint64_t)name);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_version, v11, (uint64_t)a3);
  long long v13 = (void *)v10[6];
  v10[6] = v12;

  PBRepeatedDoubleCopy();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v14 = self->_stringValues;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v27, v31, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v28;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v14);
        }
        v21 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v27 + 1) + 8 * v20), v17, (uint64_t)a3, (void)v27);
        objc_msgSend_addStringValue_(v10, v22, (uint64_t)v21);

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v27, v31, 16);
    }
    while (v18);
  }

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_name, v23, (uint64_t)a3);
  id v25 = (void *)v10[4];
  v10[4] = v24;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((version = self->_version, uint64_t v9 = v4[6], !((unint64_t)version | v9))
     || objc_msgSend_isEqual_(version, v7, v9))
    && PBRepeatedDoubleIsEqual()
    && ((stringValues = self->_stringValues, uint64_t v12 = v4[5], !((unint64_t)stringValues | v12))
     || objc_msgSend_isEqual_(stringValues, v10, v12)))
  {
    name = self->_name;
    uint64_t v14 = v4[4];
    if ((unint64_t)name | v14) {
      char isEqual = objc_msgSend_isEqual_(name, v10, v14);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_version, a2, v2);
  uint64_t v5 = PBRepeatedDoubleHash() ^ v4;
  uint64_t v8 = objc_msgSend_hash(self->_stringValues, v6, v7);
  return v5 ^ v8 ^ objc_msgSend_hash(self->_name, v9, v10);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *((void *)v5 + 6);
  if (v6) {
    objc_msgSend_setVersion_(self, v4, v6);
  }
  uint64_t v7 = objc_msgSend_doubleValuesCount(v5, v4, v6);
  if (v7)
  {
    uint64_t v9 = v7;
    for (uint64_t i = 0; i != v9; ++i)
    {
      objc_msgSend_doubleValueAtIndex_(v5, v8, i);
      objc_msgSend_addDoubleValue_(self, v11, v12);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = *((id *)v5 + 5);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v22, v26, 16);
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend_addStringValue_(self, v16, *(void *)(*((void *)&v22 + 1) + 8 * j), (void)v22);
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v22, v26, 16);
    }
    while (v17);
  }

  uint64_t v21 = *((void *)v5 + 4);
  if (v21) {
    objc_msgSend_setName_(self, v20, v21);
  }
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSMutableArray)stringValues
{
  return self->_stringValues;
}

- (void)setStringValues:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_stringValues, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end