@interface STRootStorage
- (STRootStorage)initWithMutableData:(id)a3 andMode:(int)a4;
- (STRootStorage)initWithName:(id)a3 andMode:(int)a4;
- (id)getDocumentProperty:(int)a3 withId:(int)a4 PropType:(int *)a5;
- (id)getDocumentProperty:(int)a3 withId:(int)a4 PropType:(int *)a5 throwOnError:(BOOL)a6;
- (id)getStringDocumentPropertyWithId:(int)a3 givenPropStream:(int)a4;
- (int)getLongDocumentPropertyWithId:(int)a3 givenPropStream:(int)a4;
- (signed)getShortDocumentPropertyWithId:(int)a3 givenPropStream:(int)a4;
- (void)dealloc;
- (void)resizeStorageBuffer:(unint64_t)a3;
- (void)setBlobDocumentPropertyWithId:(int)a3 to:(void *)a4 givenPropStream:(int)a5;
- (void)setDefaultDocumentProperties;
- (void)setDocumentProperty:(int)a3 withId:(int)a4 AndType:(int)a5 AndValue:(void *)a6;
- (void)setLongDocumentPropertyWithId:(int)a3 to:(int)a4 givenPropStream:(int)a5;
- (void)setShortDocumentPropertyWithId:(int)a3 to:(signed __int16)a4 givenPropStream:(int)a5;
- (void)setStringDocumentPropertyWithId:(int)a3 to:(id)a4 givenPropStream:(int)a5;
@end

@implementation STRootStorage

- (STRootStorage)initWithName:(id)a3 andMode:(int)a4
{
  uint64_t v12 = 0;
  self->m_pvBuf = 0;
  self->m_StorageData = 0;
  int v6 = StgModeFromSTStgMode(*(uint64_t *)&a4);
  if (v6 == 1)
  {
    uint64_t StructuredStorage = createStructuredStorage((const char *)[a3 fileSystemRepresentation], 1, (uint64_t *)&self->m_pCRoot);
  }
  else
  {
    if ((v6 & 0xFFFFFFFD) != 0)
    {
      uint64_t v8 = 0;
      goto LABEL_8;
    }
    uint64_t StructuredStorage = openStructuredStorage((const char *)[a3 fileSystemRepresentation], v6, (uint64_t *)&self->m_pCRoot);
  }
  uint64_t v8 = StructuredStorage;
  if (StructuredStorage) {

  }
LABEL_8:
  +[STSStgObject throwIfError:v8];
  uint64_t StorageFromRoot = getStorageFromRoot((uint64_t)self->m_pCRoot, &v12);
  if (StorageFromRoot) {

  }
  +[STSStgObject throwIfError:StorageFromRoot];
  v11.receiver = self;
  v11.super_class = (Class)STRootStorage;
  return [(STStorage *)&v11 initWithCStorage:v12];
}

- (STRootStorage)initWithMutableData:(id)a3 andMode:(int)a4
{
  uint64_t v12 = 0;
  self->m_StorageData = 0;
  if (StgModeFromSTStgMode(*(uint64_t *)&a4) == 1)
  {
    self->m_StorageData = (NSMutableData *)a3;
    id v6 = a3;
    if ([(NSMutableData *)self->m_StorageData length] <= 7) {
      [(NSMutableData *)self->m_StorageData setLength:8];
    }
    *(void *)[(NSMutableData *)self->m_StorageData mutableBytes] = self;
    self->m_pvBuf = [(NSMutableData *)self->m_StorageData mutableBytes] + 8;
    int v7 = [(NSMutableData *)self->m_StorageData length];
    uint64_t StructuredStorageInBuf = createStructuredStorageInBuf(&self->m_pvBuf, v7 - 8, (uint64_t)storageBufferReallocFunction, 1, (uint64_t *)&self->m_pCRoot, v8);
  }
  else
  {
    self->m_pvBuf = (void *)[a3 mutableBytes];
    uint64_t StructuredStorageInBuf = openStructuredStorageInBuf(&self->m_pvBuf, [a3 length], 0, (uint64_t *)&self->m_pCRoot);
  }
  +[STSStgObject throwIfError:StructuredStorageInBuf];
  +[STSStgObject throwIfError:getStorageFromRoot((uint64_t)self->m_pCRoot, &v12)];
  v11.receiver = self;
  v11.super_class = (Class)STRootStorage;
  return [(STStorage *)&v11 initWithCStorage:v12];
}

- (void)dealloc
{
  self->super.m_pCStorage = 0;
  p_m_pCRoot = (uint64_t **)&self->m_pCRoot;
  if (*p_m_pCRoot) {
    closeStructuredStorage(p_m_pCRoot);
  }
  m_StorageData = self->m_StorageData;
  if (m_StorageData)
  {
    memmove([(NSMutableData *)m_StorageData mutableBytes], [(NSMutableData *)self->m_StorageData mutableBytes] + 8, [(NSMutableData *)self->m_StorageData length] - 8);
    [(NSMutableData *)self->m_StorageData setLength:[(NSMutableData *)self->m_StorageData length] - 4];

    self->m_StorageData = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)STRootStorage;
  [(STStorage *)&v5 dealloc];
}

- (void)resizeStorageBuffer:(unint64_t)a3
{
  [(NSMutableData *)self->m_StorageData setLength:a3 + 8];
  result = [(NSMutableData *)self->m_StorageData mutableBytes] + 8;
  self->m_pvBuf = result;
  return result;
}

- (id)getDocumentProperty:(int)a3 withId:(int)a4 PropType:(int *)a5
{
  return [(STRootStorage *)self getDocumentProperty:*(void *)&a3 withId:*(void *)&a4 PropType:a5 throwOnError:1];
}

- (id)getDocumentProperty:(int)a3 withId:(int)a4 PropType:(int *)a5 throwOnError:(BOOL)a6
{
  BOOL v6 = a6;
  __s = 0;
  *a5 = -1;
  unsigned int v20 = 1;
  uint64_t DocumentProperty = getDocumentProperty((uint64_t)self->m_pCRoot, a3, *(uint64_t *)&a4, (int *)&v20, (void **)&__s);
  v9 = __s;
  if (DocumentProperty) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = __s == 0;
  }
  if (!v10)
  {
    unsigned int v12 = v20;
    int v13 = 1;
    size_t v14 = 4;
    uint64_t v15 = 2;
    switch(v20)
    {
      case 0u:
        goto LABEL_10;
      case 1u:
        goto LABEL_20;
      case 2u:
        goto LABEL_18;
      case 3u:
        uint64_t v15 = 8;
LABEL_10:
        size_t v14 = v15;
        goto LABEL_20;
      case 4u:
      case 6u:
        goto LABEL_12;
      default:
        uint64_t v16 = objc_msgSend(NSString, "stringWithUTF8String:", "long TypeLength(TypeTag)", 4);
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/StructuredStorage/ObjcInterface/STRootStorage.m"], 56, 0, "Unsupported type tag encountered in structured storage library.");
        +[OITSUAssertionHandler logBacktraceThrottled];
        int v13 = 0;
        unsigned int v12 = v20;
        v9 = __s;
LABEL_12:
        if (v12 == 1)
        {
          size_t v14 = 4;
        }
        else if (v12 == 6 || v12 == 4)
        {
          size_t v14 = *(void *)v9;
          v9 += 4 * (v12 == 6);
        }
        else if (v13)
        {
LABEL_18:
          size_t v14 = strlen(v9) + 1;
        }
        else
        {
          size_t v14 = 0;
        }
LABEL_20:
        objc_super v11 = (void *)[MEMORY[0x263EFF8F8] dataWithBytes:v9 length:v14];
        if (__s) {
          goto LABEL_21;
        }
        goto LABEL_22;
    }
  }
  objc_super v11 = 0;
  if (__s) {
LABEL_21:
  }
    freeDocumentProperty((void **)&__s);
LABEL_22:
  if (DocumentProperty)
  {
    if (v6) {
LABEL_24:
    }
      +[STSStgObject throwIfError:DocumentProperty];
  }
  else
  {
    if (v20 < 7 && ((0x5Fu >> v20) & 1) != 0)
    {
      int v19 = dword_238EDE638[v20];
    }
    else
    {
      uint64_t v18 = [NSString stringWithUTF8String:"STTypeTag STTypeTagFromTypeTag(TypeTag)"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/StructuredStorage/ObjcInterface/STRootStorage.m"], 76, 0, "Unsupported type tag encountered in structured storage library.");
      +[OITSUAssertionHandler logBacktraceThrottled];
      int v19 = -1;
    }
    *a5 = v19;
    if (v6) {
      goto LABEL_24;
    }
  }
  return v11;
}

- (id)getStringDocumentPropertyWithId:(int)a3 givenPropStream:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  size_t v14 = 0;
  unsigned __int16 v7 = -[STRootStorage getShortDocumentPropertyWithId:givenPropStream:](self, "getShortDocumentPropertyWithId:givenPropStream:", 1);
  if (v7 <= 0x270Fu)
  {
    if (v7 > 0x4E1u)
    {
      switch(v7)
      {
        case 0x4E2u:
          unint64_t v8 = 15;
          break;
        case 0x4E3u:
          unint64_t v8 = 11;
          break;
        case 0x4E4u:
          unint64_t v8 = 12;
          break;
        case 0x4E5u:
          unint64_t v8 = 13;
          break;
        case 0x4E6u:
          unint64_t v8 = 14;
          break;
        default:
          goto LABEL_25;
      }
      goto LABEL_27;
    }
    if (v7 == 932)
    {
      unint64_t v8 = 8;
      goto LABEL_27;
    }
    v9 = 0;
    if (v7 == 1200) {
      return v9;
    }
    if (v7 == 1201)
    {
      unint64_t v8 = 10;
      goto LABEL_27;
    }
LABEL_25:
    unint64_t v8 = CFStringConvertEncodingToNSStringEncoding(v7);
    if (v8 == 0xFFFFFFFF)
    {
      uint64_t v10 = [NSString stringWithUTF8String:"NSStringEncoding NSStringEncodingFromCodePage(UInt16)"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/StructuredStorage/ObjcInterface/STRootStorage.m"], 117, 0, "Encountered unhandled code page");
      +[OITSUAssertionHandler logBacktraceThrottled];
      unint64_t v8 = 1;
    }
    goto LABEL_27;
  }
  if (v7 <= 0xC42Bu)
  {
    if (v7 == 10000)
    {
      unint64_t v8 = 30;
      goto LABEL_27;
    }
    if (v7 == 28591)
    {
      unint64_t v8 = 5;
      goto LABEL_27;
    }
    goto LABEL_25;
  }
  if (v7 == 50220)
  {
    unint64_t v8 = 21;
    goto LABEL_27;
  }
  if (v7 == 51932)
  {
    unint64_t v8 = 3;
    goto LABEL_27;
  }
  if (v7 != 65001) {
    goto LABEL_25;
  }
  unint64_t v8 = 4;
LABEL_27:
  int v13 = -1;
  id v11 = [(STRootStorage *)self getDocumentProperty:v4 withId:v5 PropType:&v13 throwOnError:0];
  if (v13 == 2)
  {
    if (v11) {
      return (id)objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), v8);
    }
    else {
      return 0;
    }
  }
  return v14;
}

- (int)getLongDocumentPropertyWithId:(int)a3 givenPropStream:(int)a4
{
  int v7 = -1;
  int v6 = -1;
  id v4 = [(STRootStorage *)self getDocumentProperty:*(void *)&a4 withId:*(void *)&a3 PropType:&v6 throwOnError:0];
  if (v6 == 1) {
    return *(_DWORD *)[v4 bytes];
  }
  return v7;
}

- (signed)getShortDocumentPropertyWithId:(int)a3 givenPropStream:(int)a4
{
  signed __int16 v7 = -1;
  int v6 = -1;
  id v4 = [(STRootStorage *)self getDocumentProperty:*(void *)&a4 withId:*(void *)&a3 PropType:&v6 throwOnError:0];
  if (!v6) {
    return *(_WORD *)[v4 bytes];
  }
  return v7;
}

- (void)setDocumentProperty:(int)a3 withId:(int)a4 AndType:(int)a5 AndValue:(void *)a6
{
  uint64_t v7 = *(void *)&a4;
  if (a5 >= 6)
  {
    uint64_t v11 = [NSString stringWithUTF8String:"TypeTag TypeTagFromSTTypeTag(STTypeTag)"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/StructuredStorage/ObjcInterface/STRootStorage.m"], 37, 0, "Unsupported type tag encountered in structured storage library.");
    +[OITSUAssertionHandler logBacktraceThrottled];
    int v10 = -1;
  }
  else
  {
    int v10 = dword_238EDE654[a5];
  }
  uint64_t v12 = setDocumentProperty((uint64_t)self->m_pCRoot, a3, v7, v10, (char *)a6);
  +[STSStgObject throwIfError:v12];
}

- (void)setStringDocumentPropertyWithId:(int)a3 to:(id)a4 givenPropStream:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  if ([(STRootStorage *)self getShortDocumentPropertyWithId:1 givenPropStream:*(void *)&a5] == -535)
  {
    uint64_t v9 = [a4 UTF8String];
    [(STRootStorage *)self setDocumentProperty:v5 withId:v7 AndType:2 AndValue:v9];
  }
}

- (void)setLongDocumentPropertyWithId:(int)a3 to:(int)a4 givenPropStream:(int)a5
{
  int v5 = a4;
  [(STRootStorage *)self setDocumentProperty:*(void *)&a5 withId:*(void *)&a3 AndType:1 AndValue:&v5];
}

- (void)setShortDocumentPropertyWithId:(int)a3 to:(signed __int16)a4 givenPropStream:(int)a5
{
  signed __int16 v5 = a4;
  [(STRootStorage *)self setDocumentProperty:*(void *)&a5 withId:*(void *)&a3 AndType:0 AndValue:&v5];
}

- (void)setBlobDocumentPropertyWithId:(int)a3 to:(void *)a4 givenPropStream:(int)a5
{
}

- (void)setDefaultDocumentProperties
{
  uint64_t v2 = setDefaultDocumentProperties((uint64_t)self->m_pCRoot);
  +[STSStgObject throwIfError:v2];
}

@end