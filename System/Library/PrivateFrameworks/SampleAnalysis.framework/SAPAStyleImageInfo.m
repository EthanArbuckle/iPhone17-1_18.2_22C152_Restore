@interface SAPAStyleImageInfo
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleImageInfo

+ (id)classDictionaryKey
{
  return @"PAStackshotImageInfo";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  id v6 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleImageInfo" userInfo:0];
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleImageInfo" userInfo:0];
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleImageInfo" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (!a3)
  {
    v9 = @"NULL buffer for SAPAStyleImageInfo";
    goto LABEL_6;
  }
  if (*(void *)a3 != 2271560481)
  {
    v9 = @"Bad magic for SAPAStyleImageInfo";
LABEL_6:
    id v10 = +[SAException exceptionWithName:@"Decoding failure" reason:v9 userInfo:0];
    objc_exception_throw(v10);
  }
  id v5 = objc_alloc_init(SAPAStyleImageInfo);
  uint64_t v6 = +[SABinaryLoadInfo binaryLoadInfoWithoutReferencesFromPAStyleSerializedImageInfo:]((uint64_t)SABinaryLoadInfo, (uint64_t)a3);
  binaryLoadInfo = v5->_binaryLoadInfo;
  v5->_binaryLoadInfo = (SABinaryLoadInfo *)v6;

  return v5;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  v11 = v10;
  if (!v9 || !v10)
  {
    int v12 = *__error();
    v13 = _sa_logt();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BF22B000, v13, OS_LOG_TYPE_ERROR, "Invalid args", buf, 2u);
    }
    goto LABEL_13;
  }
  if (!a3)
  {
    int v12 = *__error();
    v13 = _sa_logt();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      v14 = "WARNING: Passed NULL serializedImageInfo";
      v15 = (uint8_t *)&v17;
LABEL_12:
      _os_log_impl(&dword_1BF22B000, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
    }
LABEL_13:

    *__error() = v12;
    goto LABEL_14;
  }
  if (*(void *)a3 != 2271560481)
  {
    int v12 = *__error();
    v13 = _sa_logt();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      v14 = "WARNING: Bad magic value";
      v15 = (uint8_t *)&v16;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  -[SABinaryLoadInfo populateReferencesUsingPAStyleSerializedImageInfo:andDeserializationDictionary:andDataBufferDictionary:]((uint64_t)self->_binaryLoadInfo, (uint64_t)a3, v9, v10);
LABEL_14:
}

- (void).cxx_destruct
{
}

@end