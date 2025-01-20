@interface SAPAStyleThreadData
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleThreadData

+ (id)classDictionaryKey
{
  return @"PASampleThreadData";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  id v6 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleThreadData" userInfo:0];
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleThreadData" userInfo:0];
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleThreadData" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (!a3)
  {
    v10 = @"NULL buffer";
    goto LABEL_21;
  }
  if ((unint64_t)(*(void *)a3 - 287528979) >= 7)
  {
    v10 = @"Bad magic";
LABEL_21:
    id v11 = +[SAException exceptionWithName:@"Decoding failure" reason:v10 userInfo:0];
    objc_exception_throw(v11);
  }
  id v5 = objc_alloc_init(SAPAStyleThreadData);
  uint64_t v6 = +[SAThreadState stateWithoutReferencesFromPAStyleSerializedThread:]((uint64_t)SAThreadState, (uint64_t)a3);
  threadState = v5->_threadState;
  v5->_threadState = (SAThreadState *)v6;

  unint64_t v8 = *(void *)a3;
  if (*(void *)a3 > 0x11235818uLL)
  {
    v5->_dispatchQueueId = *((void *)a3 + 6);
    v5->_threadId = *((void *)a3 + 5);
    if ((*((unsigned char *)a3 + 115) & 8) == 0) {
      return v5;
    }
    goto LABEL_11;
  }
  if (*(void *)a3 == 287528984)
  {
    v5->_dispatchQueueId = *((void *)a3 + 6);
    v5->_threadId = *((void *)a3 + 5);
    if ((*((unsigned char *)a3 + 99) & 8) == 0) {
      return v5;
    }
    goto LABEL_11;
  }
  if (v8 <= 0x11235816)
  {
    switch(v8)
    {
      case 0x11235813uLL:
      case 0x11235814uLL:
        v5->_dispatchQueueId = *((void *)a3 + 2);
        v5->_threadId = *((void *)a3 + 7);
        break;
      case 0x11235815uLL:
        v5->_dispatchQueueId = *((void *)a3 + 4);
        v5->_threadId = *((void *)a3 + 3);
        if ((*((unsigned char *)a3 + 80) & 8) != 0) {
          goto LABEL_11;
        }
        break;
      case 0x11235816uLL:
        v5->_dispatchQueueId = *((void *)a3 + 5);
        v5->_threadId = *((void *)a3 + 4);
        if ((*((unsigned char *)a3 + 88) & 8) != 0) {
          goto LABEL_11;
        }
        break;
      default:
        return v5;
    }
  }
  else
  {
    v5->_dispatchQueueId = *((void *)a3 + 6);
    v5->_threadId = *((void *)a3 + 5);
    if ((*((unsigned char *)a3 + 96) & 8) != 0) {
LABEL_11:
    }
      v5->_isGlobalForcedIdle = 1;
  }
  return v5;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v13 = a5;
  id v9 = a6;
  if (!a3)
  {
    id v11 = @"NULL buffer";
    goto LABEL_8;
  }
  if ((unint64_t)(*(void *)a3 - 287528979) >= 7)
  {
    id v11 = @"Bad magic";
LABEL_8:
    id v12 = +[SAException exceptionWithName:@"Decoding failure" reason:v11 userInfo:0];
    objc_exception_throw(v12);
  }
  v10 = v9;
  -[SAThreadState populateReferencesUsingPAStyleSerializedThread:andDeserializationDictionary:andDataBufferDictionary:]((uint64_t)self->_threadState, a3, v13, v9);
}

- (void).cxx_destruct
{
}

@end