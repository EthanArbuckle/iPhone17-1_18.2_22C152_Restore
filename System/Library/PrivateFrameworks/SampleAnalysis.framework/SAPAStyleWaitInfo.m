@interface SAPAStyleWaitInfo
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (id)_initWithSerializedWaitInfo:(id *)a3;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
@end

@implementation SAPAStyleWaitInfo

+ (id)classDictionaryKey
{
  return @"PASampleWaitInfo";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  id v6 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleWaitInfo" userInfo:0];
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleWaitInfo" userInfo:0];
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleWaitInfo" userInfo:0];
  objc_exception_throw(v2);
}

- (id)_initWithSerializedWaitInfo:(id *)a3
{
  if (!a3 || a3->var0 != 233811181)
  {
    id v8 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Tried to initialize with bad waitinfo" userInfo:0];
    objc_exception_throw(v8);
  }
  v9.receiver = self;
  v9.super_class = (Class)SAPAStyleWaitInfo;
  id v4 = [(SAPAStyleWaitInfo *)&v9 init];
  if (v4)
  {
    uint64_t v5 = +[SAWaitInfo stateWithPAStyleSerializedWaitInfo:]((uint64_t)SAWaitInfo, (uint64_t)a3);
    waitInfo = v4->_waitInfo;
    v4->_waitInfo = (SAWaitInfo *)v5;
  }
  return v4;
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (!a3)
  {
    id v7 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Passed in NULL buffer" userInfo:0];
    objc_exception_throw(v7);
  }
  uint64_t v5 = [SAPAStyleWaitInfo alloc];
  return [(SAPAStyleWaitInfo *)v5 _initWithSerializedWaitInfo:a3];
}

- (void).cxx_destruct
{
}

@end