@interface STPropertyStorage
- (STPropertyStorage)initWithPropertyStorage:(_SsrwPropertyStorage *)a3;
- (id)getDocumentPropertyWithId:(int)a3 propType:(int *)a4;
- (id)getDocumentPropertyWithName:(id)a3 propType:(int *)a4;
- (id)getStringDocumentPropertyWithId:(int)a3;
- (int)getLongDocumentPropertyWithId:(int)a3;
- (signed)getShortDocumentPropertyWithId:(int)a3;
- (void)close;
- (void)setBlobDocumentPropertyWithName:(id)a3 to:(id)a4;
- (void)setDocumentPropertyWithId:(int)a3 to:(id)a4;
- (void)setLongDocumentPropertyWithId:(int)a3 to:(int)a4;
- (void)setShortDocumentPropertyWithId:(int)a3 to:(signed __int16)a4;
- (void)setStringDocumentPropertyWithId:(int)a3 to:(id)a4;
@end

@implementation STPropertyStorage

- (STPropertyStorage)initWithPropertyStorage:(_SsrwPropertyStorage *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STPropertyStorage;
  v4 = [(STPropertyStorage *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->m_pPropertyStorage = a3;
    v6 = v4;
  }

  return v5;
}

- (void)close
{
}

- (id)getDocumentPropertyWithId:(int)a3 propType:(int *)a4
{
  uint64_t v5 = *(void *)&a3;
  if (a4) {
    *a4 = -1;
  }
  v7 = objc_alloc_init(STPropVariant);
  if (propertyStorageGetPropertyValue((uint64_t *)self->m_pPropertyStorage, v5, (uint64_t)[(STPropVariant *)v7 propVariant]))
  {
    objc_super v8 = 0;
  }
  else
  {
    objc_super v8 = [(STPropVariant *)v7 asDataOfType:a4];
  }

  return v8;
}

- (int)getLongDocumentPropertyWithId:(int)a3
{
  int v8 = 0;
  v3 = [(STPropertyStorage *)self getDocumentPropertyWithId:*(void *)&a3 propType:&v8];
  v4 = v3;
  if (v8 != 1 || v3 == 0) {
    int v6 = -1;
  }
  else {
    int v6 = *(_DWORD *)[v3 bytes];
  }

  return v6;
}

- (signed)getShortDocumentPropertyWithId:(int)a3
{
  int v8 = 0;
  v3 = [(STPropertyStorage *)self getDocumentPropertyWithId:*(void *)&a3 propType:&v8];
  v4 = v3;
  if (v8) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (v5) {
    signed __int16 v6 = -1;
  }
  else {
    signed __int16 v6 = *(_WORD *)[v3 bytes];
  }

  return v6;
}

- (id)getStringDocumentPropertyWithId:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = (unsigned __int16)[(STPropertyStorage *)self getShortDocumentPropertyWithId:1];
  if (v5 > 0x270F)
  {
    if (v5 <= 50219)
    {
      if (v5 == 10000)
      {
        uint64_t v6 = 30;
        goto LABEL_27;
      }
      if (v5 == 28591)
      {
        uint64_t v6 = 5;
        goto LABEL_27;
      }
    }
    else
    {
      switch(v5)
      {
        case 50220:
          uint64_t v6 = 21;
          goto LABEL_27;
        case 51932:
          uint64_t v6 = 3;
          goto LABEL_27;
        case 65001:
          uint64_t v6 = 4;
          goto LABEL_27;
      }
    }
  }
  else
  {
    if (v5 > 1249)
    {
      switch(v5)
      {
        case 1250:
          uint64_t v6 = 15;
          break;
        case 1251:
          uint64_t v6 = 11;
          break;
        case 1252:
          uint64_t v6 = 12;
          break;
        case 1253:
          uint64_t v6 = 13;
          break;
        case 1254:
          uint64_t v6 = 14;
          break;
        default:
          goto LABEL_26;
      }
      goto LABEL_27;
    }
    switch(v5)
    {
      case 932:
        uint64_t v6 = 8;
        goto LABEL_27;
      case 1200:
        return 0;
      case 1201:
        uint64_t v6 = 10;
        goto LABEL_27;
    }
  }
LABEL_26:
  int v8 = [NSString stringWithUTF8String:"NSStringEncoding NSStringEncodingFromCodePage(UInt16)"];
  v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/StructuredStorage/ObjcInterface/STPropertyStorage.m"];
  +[OITSUAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:51 isFatal:0 description:"Encountered unhandled code page"];

  +[OITSUAssertionHandler logBacktraceThrottled];
  uint64_t v6 = 1;
LABEL_27:
  int v15 = 0;
  uint64_t v10 = [(STPropertyStorage *)self getDocumentPropertyWithId:v3 propType:&v15];
  v11 = (void *)v10;
  v7 = 0;
  if (v15 == 2 && v10)
  {
    id v12 = [NSString alloc];
    id v13 = v11;
    v7 = objc_msgSend(v12, "initWithBytes:length:encoding:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), v6);
  }

  return v7;
}

- (id)getDocumentPropertyWithName:(id)a3 propType:(int *)a4
{
  unsigned int v8 = 0;
  if (propertyStorageGetPropertyID((uint64_t *)self->m_pPropertyStorage, (char *)[a3 UTF8String], &v8))
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(STPropertyStorage *)self getDocumentPropertyWithId:v8 propType:a4];
  }
  return v6;
}

- (void)setDocumentPropertyWithId:(int)a3 to:(id)a4
{
  uint64_t v4 = propertyStorageSetPropertyValueWithID((uint64_t *)self->m_pPropertyStorage, *(uint64_t *)&a3, (unsigned __int16 *)[a4 propVariant]);
  +[STSStgObject throwIfError:v4];
}

- (void)setLongDocumentPropertyWithId:(int)a3 to:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v7 = objc_alloc_init(STPropVariant);
  [(STPropVariant *)v7 setLongValue:v4];
  [(STPropertyStorage *)self setDocumentPropertyWithId:v5 to:v7];
}

- (void)setShortDocumentPropertyWithId:(int)a3 to:(signed __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v7 = objc_alloc_init(STPropVariant);
  [(STPropVariant *)v7 setShortValue:v4];
  [(STPropertyStorage *)self setDocumentPropertyWithId:v5 to:v7];
}

- (void)setStringDocumentPropertyWithId:(int)a3 to:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = objc_alloc_init(STPropVariant);
  [(STPropVariant *)v7 setStringValue:v6];

  [(STPropertyStorage *)self setDocumentPropertyWithId:v4 to:v7];
}

- (void)setBlobDocumentPropertyWithName:(id)a3 to:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = objc_alloc_init(STPropVariant);
  [(STPropVariant *)v8 setBlobValue:v6];

  unsigned int v12 = 0;
  m_pPropertyStorage = (uint64_t *)self->m_pPropertyStorage;
  id v10 = v7;
  v11 = (char *)[v10 UTF8String];

  propertyStorageGetPropertyID(m_pPropertyStorage, v11, &v12);
  [(STPropertyStorage *)self setDocumentPropertyWithId:v12 to:v8];
}

@end