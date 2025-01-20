@interface SAPAStyleSymbol
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleSymbol

+ (id)classDictionaryKey
{
  return @"PASymbol";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  id v6 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleSymbol" userInfo:0];
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleSymbol" userInfo:0];
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleSymbol" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (*(void *)a3 >> 1 != 1278945817)
  {
    id v6 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Bad PASymbol magic" userInfo:0];
    objc_exception_throw(v6);
  }
  id result = objc_alloc_init(SAPAStyleSymbol);
  *((void *)result + 3) = *((void *)a3 + 3);
  *((void *)result + 2) = *((void *)a3 + 4);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v20 = a5;
  id v9 = a6;
  if (*(void *)a3 >> 1 != 1278945817)
  {
    id v19 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Bad PASymbol magic" userInfo:0];
    objc_exception_throw(v19);
  }
  v10 = v9;
  unint64_t v11 = *((void *)a3 + 1);
  v12 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v11, v20, v10, v12, 0);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v13;

  if (*(void *)a3 > 0x98765432uLL)
  {
    uint64_t v15 = *((void *)a3 + 5);
    if (v15)
    {
      v16 = objc_opt_class();
      SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 48, v15, v20, v10, v16);
      v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
      sourceInfos = self->_sourceInfos;
      self->_sourceInfos = v17;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceInfos, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end