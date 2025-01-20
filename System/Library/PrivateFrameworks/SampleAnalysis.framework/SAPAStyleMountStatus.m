@interface SAPAStyleMountStatus
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleMountStatus

+ (id)classDictionaryKey
{
  return @"PASerializedMountStatus";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  id v6 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleMountStatus" userInfo:0];
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleMountStatus" userInfo:0];
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleMountStatus" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (*(void *)a3 != 3735928559)
  {
    id v8 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Bad PAMountStatus magic" userInfo:0];
    objc_exception_throw(v8);
  }
  id v4 = objc_alloc_init(SAPAStyleMountStatus);
  id v5 = objc_alloc_init(SAMountStatus);
  mountStatus = v4->_mountStatus;
  v4->_mountStatus = v5;

  return v4;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v12 = a5;
  id v9 = a6;
  if (*(void *)a3 != 3735928559)
  {
    id v11 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Bad PAMountStatus magic" userInfo:0];
    objc_exception_throw(v11);
  }
  v10 = v9;
  -[SAMountStatus populateReferencesUsingPAStyleSerializedMountStatus:andDeserializationDictionary:andDataBufferDictionary:](&self->_mountStatus->super.isa, (uint64_t)a3, v12, v9);
}

- (void).cxx_destruct
{
}

@end