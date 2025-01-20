@interface SAPAStyleSourceInfo
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleSourceInfo

+ (id)classDictionaryKey
{
  return @"PASymbolSourceInfo";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  id v6 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleSourceInfo" userInfo:0];
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleSourceInfo" userInfo:0];
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleSourceInfo" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (*(void *)a3 != 1126258297)
  {
    id v6 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Bad PASymbolSourceInfo magic" userInfo:0];
    objc_exception_throw(v6);
  }
  id result = objc_alloc_init(SAPAStyleSourceInfo);
  *((void *)result + 2) = *((void *)a3 + 1);
  *((void *)result + 3) = *((void *)a3 + 2);
  *((_DWORD *)result + 2) = *((_DWORD *)a3 + 8);
  *((_DWORD *)result + 3) = *((_DWORD *)a3 + 9);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v16 = a5;
  id v9 = a6;
  if (*(void *)a3 != 1126258297)
  {
    id v15 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Bad PASymbolSourceInfo magic" userInfo:0];
    objc_exception_throw(v15);
  }
  v10 = v9;
  unint64_t v11 = *((void *)a3 + 3);
  v12 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v11, v16, v10, v12, 0);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  filePath = self->_filePath;
  self->_filePath = v13;
}

- (void).cxx_destruct
{
}

@end