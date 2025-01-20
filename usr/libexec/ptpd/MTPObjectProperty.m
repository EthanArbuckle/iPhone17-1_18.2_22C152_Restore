@interface MTPObjectProperty
+ (id)objectPropertyWithPropertyCode:(unsigned int)a3 andDataType:(unsigned __int16)a4;
- (BOOL)useString;
- (MTPObjectProperty)initWithPropertyCode:(unsigned __int16)a3 andDataType:(unsigned __int16)a4;
- (NSMutableData)dataObject;
- (NSString)stringValue;
- (char)dataValue;
- (unsigned)dataType;
- (unsigned)formFlag;
- (unsigned)groupCode;
- (unsigned)propertyCode;
- (unsigned)writableSet;
- (void)dealloc;
- (void)objectPropertyDescriptionDataset:(id)a3;
- (void)objectPropertyListElement:(id)a3 withObject:(id)a4 andHandle:(unsigned int)a5;
- (void)objectValue:(id)a3 withObject:(id)a4 andHandle:(unsigned int)a5;
- (void)setDataObject:(id)a3;
- (void)setDataType:(unsigned __int16)a3;
- (void)setDataValue:(char *)a3;
- (void)setFormFlag:(unsigned __int8)a3;
- (void)setGroupCode:(unsigned int)a3;
- (void)setPropertyCode:(unsigned __int16)a3;
- (void)setStringValue:(id)a3;
- (void)setUseString:(BOOL)a3;
- (void)setWritableSet:(unsigned __int8)a3;
@end

@implementation MTPObjectProperty

- (MTPObjectProperty)initWithPropertyCode:(unsigned __int16)a3 andDataType:(unsigned __int16)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTPObjectProperty;
  result = [(MTPObjectProperty *)&v7 init];
  if (result)
  {
    result->_propertyCode = a3;
    result->_dataType = a4;
    *(_WORD *)&result->_writableSet = 0;
    result->_groupCode = 0;
  }
  return result;
}

+ (id)objectPropertyWithPropertyCode:(unsigned int)a3 andDataType:(unsigned __int16)a4
{
  v4 = [[MTPObjectProperty alloc] initWithPropertyCode:(unsigned __int16)a3 andDataType:a4];

  return v4;
}

- (void)objectValue:(id)a3 withObject:(id)a4 andHandle:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  switch(self->_propertyCode)
  {
    case 0xDC01u:
      v11 = [v9 objectInfoDataset];
      unsigned int v12 = [v11 storageID];
      goto LABEL_13;
    case 0xDC02u:
      v13 = [v9 objectInfoDataset];
      unsigned __int16 v14 = (unsigned __int16)[v13 objectFormat];

      LOWORD(v39) = v14;
      v15 = v8;
      uint64_t v16 = 2;
      goto LABEL_14;
    case 0xDC03u:
    case 0xDC05u:
    case 0xDC06u:
    case 0xDC0Au:
      goto LABEL_15;
    case 0xDC04u:
      v17 = [v9 objectInfoDataset];
      v18 = [v17 objectCompressedSize64];

      v39 = v18;
      goto LABEL_7;
    case 0xDC07u:
      v19 = [v9 objectInfoDataset];
      v20 = [v19 filename];
      id v21 = [v20 length];

      uint64_t v22 = 2 * (void)v21 + 3;
      __chkstk_darwin();
      v24 = (char *)&v37 - v23;
      v39 = (char *)&v37 - v23;
      v25 = [v10 objectInfoDataset];
      v26 = [v25 filename];
      goto LABEL_11;
    case 0xDC08u:
      v27 = [v9 objectInfoDataset];
      v28 = [v27 captureDate];
      id v29 = [v28 length];

      uint64_t v22 = 2 * (void)v29 + 3;
      __chkstk_darwin();
      v24 = (char *)&v37 - v30;
      v39 = (char *)&v37 - v30;
      v25 = [v10 objectInfoDataset];
      v26 = [v25 captureDate];
      goto LABEL_11;
    case 0xDC09u:
      v31 = [v9 objectInfoDataset];
      v32 = [v31 modificationDate];
      id v33 = [v32 length];

      uint64_t v22 = 2 * (void)v33 + 3;
      __chkstk_darwin();
      v24 = (char *)&v37 - v34;
      v39 = (char *)&v37 - v34;
      v25 = [v10 objectInfoDataset];
      v26 = [v25 modificationDate];
LABEL_11:
      v35 = v26;
      sub_10001F2B8(&v39, v26);

      [v8 appendBytes:v24 length:v22];
      goto LABEL_15;
    case 0xDC0Bu:
      v11 = [v9 objectInfoDataset];
      unsigned int v12 = [v11 parentObject];
LABEL_13:
      unsigned int v36 = v12;

      LODWORD(v39) = v36;
      v15 = v8;
      uint64_t v16 = 4;
      goto LABEL_14;
    default:
      if (self->_propertyCode != 56385) {
        goto LABEL_15;
      }
      uint64_t v38 = a5;
      v39 = (unsigned char *)a5;
      [v8 appendBytes:&v38 length:8];
LABEL_7:
      v15 = v8;
      uint64_t v16 = 8;
LABEL_14:
      [v15 appendBytes:&v39 length:v16];
LABEL_15:

      return;
  }
}

- (void)objectPropertyDescriptionDataset:(id)a3
{
  id v4 = a3;
  unsigned __int16 propertyCode = self->_propertyCode;
  [v4 appendBytes:&propertyCode length:2];
  unsigned __int16 dataType = self->_dataType;
  [v4 appendBytes:&dataType length:2];
  [v4 appendBytes:&self->_writableSet length:1];
  switch(self->_dataType)
  {
    case 4u:
      LOWORD(v7) = 0;
      v5 = v4;
      uint64_t v6 = 2;
      goto LABEL_9;
    case 5u:
    case 7u:
    case 9u:
      goto LABEL_10;
    case 6u:
      LODWORD(v7) = 0;
      v5 = v4;
      uint64_t v6 = 4;
      goto LABEL_9;
    case 8u:
      uint64_t v7 = 0;
      v5 = v4;
      uint64_t v6 = 8;
      goto LABEL_9;
    case 0xAu:
      uint64_t v7 = 0;
      [v4 appendBytes:&v7 length:8];
      [v4 appendBytes:&v7 length:8];
      goto LABEL_8;
    default:
      if (self->_dataType != 0xFFFF) {
        goto LABEL_10;
      }
LABEL_8:
      LOBYTE(v7) = 0;
      v5 = v4;
      uint64_t v6 = 1;
LABEL_9:
      [v5 appendBytes:&v7 length:v6];
LABEL_10:
      LODWORD(v7) = 0;
      [v4 appendBytes:&v7 length:4];
      [v4 appendBytes:&self->_formFlag length:1];

      return;
  }
}

- (void)objectPropertyListElement:(id)a3 withObject:(id)a4 andHandle:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  unsigned int v12 = a5;
  id v8 = a4;
  id v9 = a3;
  [v9 appendBytes:&v12 length:4];
  unsigned __int16 propertyCode = self->_propertyCode;
  [v9 appendBytes:&propertyCode length:2];
  unsigned __int16 dataType = self->_dataType;
  [v9 appendBytes:&dataType length:2];
  [(MTPObjectProperty *)self objectValue:v9 withObject:v8 andHandle:v5];
}

- (void)dealloc
{
  dataValue = self->_dataValue;
  if (dataValue) {
    free(dataValue);
  }
  v4.receiver = self;
  v4.super_class = (Class)MTPObjectProperty;
  [(MTPObjectProperty *)&v4 dealloc];
}

- (unsigned)propertyCode
{
  return self->_propertyCode;
}

- (void)setPropertyCode:(unsigned __int16)a3
{
  self->_unsigned __int16 propertyCode = a3;
}

- (unsigned)dataType
{
  return self->_dataType;
}

- (void)setDataType:(unsigned __int16)a3
{
  self->_unsigned __int16 dataType = a3;
}

- (unsigned)writableSet
{
  return self->_writableSet;
}

- (void)setWritableSet:(unsigned __int8)a3
{
  self->_writableSet = a3;
}

- (char)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(char *)a3
{
  self->_dataValue = a3;
}

- (unsigned)groupCode
{
  return self->_groupCode;
}

- (void)setGroupCode:(unsigned int)a3
{
  self->_groupCode = a3;
}

- (unsigned)formFlag
{
  return self->_formFlag;
}

- (void)setFormFlag:(unsigned __int8)a3
{
  self->_formFlag = a3;
}

- (BOOL)useString
{
  return self->_useString;
}

- (void)setUseString:(BOOL)a3
{
  self->_useString = a3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (NSMutableData)dataObject
{
  return self->_dataObject;
}

- (void)setDataObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataObject, 0);

  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end