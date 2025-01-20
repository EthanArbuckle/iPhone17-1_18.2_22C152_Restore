@interface SAPAStyleFrame
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleFrame

+ (id)classDictionaryKey
{
  return @"PASampleFrame";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  id v6 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleFrame" userInfo:0];
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleFrame" userInfo:0];
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleFrame" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (!a3)
  {
    id v9 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Passed in NULL buffer" userInfo:0];
    objc_exception_throw(v9);
  }
  id v5 = objc_alloc_init(SAPAStyleFrame);
  uint64_t v6 = +[SAFrame frameWithPAStyleSerializedFrame:]((uint64_t)SAFrame, (uint64_t)a3);
  frame = v5->_frame;
  v5->_frame = (SAFrame *)v6;

  return v5;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v13 = a5;
  id v9 = a6;
  if (!a3)
  {
    v11 = @"Passed NULL buffer";
    goto LABEL_8;
  }
  if (*(void *)a3 != 826366246)
  {
    v11 = @"Bad PASampleFrame magic";
LABEL_8:
    id v12 = +[SAException exceptionWithName:@"Decoding failure" reason:v11 userInfo:0];
    objc_exception_throw(v12);
  }
  v10 = v9;
  -[SAFrame populateReferencesUsingPAStyleSerializedFrame:andDeserializationDictionary:andDataBufferDictionary:]((uint64_t)self->_frame, (uint64_t)a3, v13, v9);
}

- (void).cxx_destruct
{
}

@end