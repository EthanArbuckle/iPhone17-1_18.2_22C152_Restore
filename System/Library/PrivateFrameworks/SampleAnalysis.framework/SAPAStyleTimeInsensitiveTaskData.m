@interface SAPAStyleTimeInsensitiveTaskData
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleTimeInsensitiveTaskData

+ (id)classDictionaryKey
{
  return @"PASampleTimeInsensitiveTaskData";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  id v6 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleTimeInsensitiveTaskData" userInfo:0];
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleTimeInsensitiveTaskData" userInfo:0];
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleTimeInsensitiveTaskData" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (!a3)
  {
    v9 = @"Trying to init with nil serializedTimeInsensitiveTask_v5";
    goto LABEL_6;
  }
  if ((unint64_t)(*(void *)a3 - 4080925381) >= 3)
  {
    v9 = @"Bad SAPAStyleTimeInsensitiveTaskData magic";
LABEL_6:
    id v10 = +[SAException exceptionWithName:@"Decoding failure" reason:v9 userInfo:0];
    objc_exception_throw(v10);
  }
  id v5 = objc_alloc_init(SAPAStyleTimeInsensitiveTaskData);
  uint64_t v6 = +[SATask taskWithoutReferencesFromPAStyleSerializedTask:]((uint64_t)SATask, (uint64_t)a3);
  task = v5->_task;
  v5->_task = (SATask *)v6;

  return v5;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v12 = a5;
  id v9 = a6;
  if (!v12 || !v9)
  {
    id v10 = @"Invalid args";
    goto LABEL_11;
  }
  if (!a3)
  {
    id v10 = @"Passed NULL serializedTimeInsensitiveTask_v5";
    goto LABEL_11;
  }
  if ((unint64_t)(*(void *)a3 - 4080925381) >= 3)
  {
    id v10 = @"Bad SAPAStyleTimeInsensitiveTaskData magic";
LABEL_11:
    id v11 = +[SAException exceptionWithName:@"Decoding failure" reason:v10 userInfo:0];
    objc_exception_throw(v11);
  }
  -[SATask populateReferencesUsingPAStyleSerializedTask:andDeserializationDictionary:andDataBufferDictionary:](&self->_task->super.isa, a3, v12, v9);
}

- (void).cxx_destruct
{
}

@end