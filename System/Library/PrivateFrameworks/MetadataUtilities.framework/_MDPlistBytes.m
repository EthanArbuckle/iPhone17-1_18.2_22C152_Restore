@interface _MDPlistBytes
+ (__MDPlistBytes)createArrayPlistBytesUsingBlock:(id)a3;
+ (__MDPlistBytes)createDictionaryPlistBytesUsingBlock:(id)a3;
+ (__MDPlistBytes)createPlistBytes:(id)a3;
+ (__MDPlistBytes)emptyArrayPlistBytes;
+ (__MDPlistBytes)emptyDictionaryPlistBytes;
+ (__MDPlistBytes)nullObjectPlistBytes;
+ (void)enumerateObjectsFromPlistBytes:(char *)a3 count:(unsigned int)a4 shouldDeallocate:(BOOL)a5 usingBlock:(id)a6;
- (BOOL)enumerateQueryResults:(unint64_t)a3 attributeSize:(unint64_t)a4 stringCache:(id *)a5 usingBlock:(id)a6;
- (BOOL)isEqual:(id)a3;
- (_MDPlistBytes)initWithByteVector:(char *)a3 count:(unsigned int)a4 deallocator:(id)a5;
- (_MDPlistBytes)initWithByteVector:(char *)a3 count:(unsigned int)a4 shouldDeallocate:(BOOL)a5;
- (_MDPlistBytes)initWithByteVector:(char *)a3 count:(unsigned int)a4 trusted:(unsigned __int8)a5 deallocator:(id)a6;
- (__CFData)copyData;
- (__CFData)copyDataWithBytesNoCopy;
- (id)description;
- (unint64_t)_cfTypeID;
- (void)dealloc;
- (void)dumpUIDs;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)enumerateQueryResults:(unint64_t)a3 stringCache:(id *)a4 usingBlock:(id)a5;
@end

@implementation _MDPlistBytes

- (void)dealloc
{
}

- (void)enumerateQueryResults:(unint64_t)a3 stringCache:(id *)a4 usingBlock:(id)a5
{
  uint64_t v6 = 0;
  do
  {
    uint64_t v7 = v6 + 1;
    BOOL v8 = -[_MDPlistBytes enumerateQueryResults:attributeSize:stringCache:usingBlock:](self, "enumerateQueryResults:attributeSize:stringCache:usingBlock:");
    uint64_t v6 = v7;
  }
  while (v8);
}

- (BOOL)enumerateQueryResults:(unint64_t)a3 attributeSize:(unint64_t)a4 stringCache:(id *)a5 usingBlock:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v17[0] = 0;
  uint64_t v19 = 0;
  v17[1] = a6;
  v17[2] = a4;
  v18 = malloc_type_calloc(a4, 8uLL, 0x80040B8603338uLL);
  memset(v12, 0, sizeof(v12));
  v13 = _QueryResultsBeginArray;
  v14 = _QueryResultsValue;
  v15 = _QueryResultsEndArray;
  v16 = a5;
  v9 = _MDPlistBytesCopyPlistAtIndexWithCallbacksAndAllocator(*MEMORY[0x1E4F1CF80], (uint64_t)self, a3, (uint64_t)v12, (char *)v17);
  if (v9) {
    CFRelease(v9);
  }
  free(v18);
  return BYTE1(v19) && v19 == 0;
}

- (_MDPlistBytes)initWithByteVector:(char *)a3 count:(unsigned int)a4 trusted:(unsigned __int8)a5 deallocator:(id)a6
{
  int v7 = a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)_MDPlistBytes;
  v10 = [(_MDPlistBytes *)&v15 init];
  v11 = v10;
  if (v10)
  {
    if (a3)
    {
      if (a4 - 16 > 0x6FFFFFF0)
      {
        *((_WORD *)v10 + 16) = 617;
      }
      else
      {
        v10->_byteVector = (unint64_t)a3;
        v10->_byteVectorCnt = a4;
        v10->_byteVectorCapacity = a4;
        if (a6) {
          v12 = _Block_copy(a6);
        }
        else {
          v12 = 0;
        }
        v11->_deallocator = v12;
        _maybeSwapPlistBytes((uint64_t)v11, v7 != 0);
      }
    }
    else
    {

      if (qword_1E95CA390 != -1) {
        dispatch_once(&qword_1E95CA390, &__block_literal_global_128);
      }
      CFTypeRef v13 = CFRetain((CFTypeRef)qword_1E95CA388);
      return (_MDPlistBytes *)CFMakeCollectable(v13);
    }
  }
  return v11;
}

+ (__MDPlistBytes)createArrayPlistBytesUsingBlock:(id)a3
{
  result = +[_MDMutablePlistBytes createArrayPlistBytesUsingBlock:a3];
  if (result) {
    *((unsigned char *)result + 34) &= ~1u;
  }
  return result;
}

+ (__MDPlistBytes)createDictionaryPlistBytesUsingBlock:(id)a3
{
  result = +[_MDMutablePlistBytes createDictionaryPlistBytesUsingBlock:a3];
  if (result) {
    *((unsigned char *)result + 34) &= ~1u;
  }
  return result;
}

+ (__MDPlistBytes)createPlistBytes:(id)a3
{
  v4 = [[_MDMutablePlistBytes alloc] initWithCapacity:0 useMalloc:0];
  if (!v4) {
    +[_MDPlistBytes createPlistBytes:]();
  }
  uint64_t v5 = (uint64_t)v4;
  CFRetain(v4);

  if (_MDPlistBytesBeginPlist(v5) && __MDPlistBytesAddObject(v5, (const __CFString *)a3)) {
    _MDPlistBytesEndPlist(v5);
  }
  *(unsigned char *)(v5 + 34) &= ~1u;
  return (__MDPlistBytes *)v5;
}

+ (__MDPlistBytes)emptyArrayPlistBytes
{
  if (qword_1E95CA2E8 != -1) {
    dispatch_once(&qword_1E95CA2E8, &__block_literal_global_10);
  }
  return (__MDPlistBytes *)_MergedGlobals;
}

+ (__MDPlistBytes)emptyDictionaryPlistBytes
{
  if (qword_1E95CA2F8 != -1) {
    dispatch_once(&qword_1E95CA2F8, &__block_literal_global_6);
  }
  return (__MDPlistBytes *)qword_1E95CA2F0;
}

+ (void)enumerateObjectsFromPlistBytes:(char *)a3 count:(unsigned int)a4 shouldDeallocate:(BOOL)a5 usingBlock:(id)a6
{
  if (!a3)
  {
    if (qword_1E95CA390 == -1)
    {
      CFTypeRef v13 = (void *)CFRetain((CFTypeRef)qword_1E95CA388);
      if (!v13) {
        return;
      }
    }
    else
    {
      dispatch_once(&qword_1E95CA390, &__block_literal_global_128);
      CFTypeRef v13 = (void *)CFRetain((CFTypeRef)qword_1E95CA388);
      if (!v13) {
        return;
      }
    }
    goto LABEL_8;
  }
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  v10 = [_MDPlistBytes alloc];
  if (v7) {
    v11 = &__block_literal_global_108;
  }
  else {
    v11 = 0;
  }
  v12 = [(_MDPlistBytes *)v10 initWithByteVector:a3 count:v8 trusted:0 deallocator:v11];
  CFTypeRef v13 = v12;
  if (v12) {
    CFRetain(v12);
  }

  if (v13)
  {
LABEL_8:
    [v13 enumerateObjectsUsingBlock:a6];
    CFRelease(v13);
  }
}

+ (__MDPlistBytes)nullObjectPlistBytes
{
  if (qword_1E95CA308 != -1) {
    dispatch_once(&qword_1E95CA308, &__block_literal_global_10);
  }
  return (__MDPlistBytes *)qword_1E95CA300;
}

- (_MDPlistBytes)initWithByteVector:(char *)a3 count:(unsigned int)a4 shouldDeallocate:(BOOL)a5
{
  if (a5) {
    uint64_t v5 = &__block_literal_global_108;
  }
  else {
    uint64_t v5 = 0;
  }

  return [(_MDPlistBytes *)self initWithByteVector:a3 count:*(void *)&a4 deallocator:v5];
}

- (_MDPlistBytes)initWithByteVector:(char *)a3 count:(unsigned int)a4 deallocator:(id)a5
{
  return [(_MDPlistBytes *)self initWithByteVector:a3 count:*(void *)&a4 trusted:0 deallocator:a5];
}

- (unint64_t)_cfTypeID
{
  if (qword_1E95CA310 != -1) {
    dispatch_once(&qword_1E95CA310, &__block_literal_global_12);
  }
  return qword_1E95CA318;
}

- (id)description
{
  v2 = __MDPlistBytesCopyDebugDescription((uint64_t)self);
  v3 = (void *)CFMakeCollectable(v2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = [a3 _cfTypeID];
  uint64_t v6 = v5;
  if (qword_1E95CA310 == -1)
  {
    if (v5 != qword_1E95CA318) {
      return 0;
    }
  }
  else
  {
    dispatch_once(&qword_1E95CA310, &__block_literal_global_12);
    if (v6 != qword_1E95CA318) {
      return 0;
    }
  }
  size_t byteVectorCnt = self->_byteVectorCnt;
  if (a3 && !*((_WORD *)a3 + 16))
  {
    if (byteVectorCnt != *((_DWORD *)a3 + 4)) {
      return 0;
    }
    v9 = (const void *)*((void *)a3 + 1);
  }
  else
  {
    if (byteVectorCnt) {
      return 0;
    }
    v9 = 0;
  }
  return memcmp((const void *)self->_byteVector, v9, byteVectorCnt) == 0;
}

- (__CFData)copyData
{
  byteVector = (const UInt8 *)self->_byteVector;
  CFIndex byteVectorCnt = self->_byteVectorCnt;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];

  return CFDataCreate(v4, byteVector, byteVectorCnt);
}

- (__CFData)copyDataWithBytesNoCopy
{
  byteVector = (const UInt8 *)self->_byteVector;
  CFIndex byteVectorCnt = self->_byteVectorCnt;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];

  return CFDataCreateWithBytesNoCopy(v4, byteVector, byteVectorCnt, v5);
}

- (void)dumpUIDs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = _MDLogForCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int uidCount = self->_uidCount;
    *(_DWORD *)buf = 134218240;
    *(void *)v10 = self;
    *(_WORD *)&v10[8] = 1024;
    *(_DWORD *)&v10[10] = uidCount;
    _os_log_impl(&dword_1A334F000, v3, OS_LOG_TYPE_DEFAULT, "_MDPlistBytes:%p UID Count: %d", buf, 0x12u);
  }
  if (self->_uidCount >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      unint64_t v6 = self->_uidVector[v5];
      unint64_t v7 = self->_wrapperPtr[v6 & 0xFFFFFF];
      uint64_t v8 = _MDLogForCategoryDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110400;
        *(_DWORD *)v10 = v5;
        *(_WORD *)&v10[4] = 2048;
        *(void *)&v10[6] = v6;
        __int16 v11 = 1024;
        int v12 = BYTE3(v6);
        __int16 v13 = 1024;
        int v14 = HIDWORD(v6);
        __int16 v15 = 1024;
        int v16 = v6 & 0xFFFFFF;
        __int16 v17 = 2048;
        unint64_t v18 = v7;
        _os_log_impl(&dword_1A334F000, v8, OS_LOG_TYPE_DEFAULT, "   desc[%d]: 0x%16.16llx tag: %2.2x var: 0x%4.4x qc: 0x%4.4x 0x%16.16llx", buf, 0x2Eu);
      }
      ++v5;
    }
    while (v5 < self->_uidCount);
  }
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v5 = 0;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v9 = 0;
  uint64_t v6 = *MEMORY[0x1E4F1CF80];
  do
  {
    unint64_t v7 = _MDPlistBytesCopyPlistAtIndexWithCallbacksAndAllocator(v6, (uint64_t)self, v5, (uint64_t)&_kMDPlistBytesDeserializationCallbacks, sel_enumerateObjectsUsingBlock_);
    if (!v7) {
      break;
    }
    uint64_t v8 = v7;
    (*((void (**)(id, __CFString *, uint64_t, char *))a3 + 2))(a3, v7, v5, &v9);
    CFRelease(v8);
    ++v5;
  }
  while (!v9);
}

+ (void)createPlistBytes:.cold.1()
{
}

@end