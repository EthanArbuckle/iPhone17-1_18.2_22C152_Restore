@interface SAPAStyleFanSpeed
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
@end

@implementation SAPAStyleFanSpeed

+ (id)classDictionaryKey
{
  return @"PASerializedFanSpeed";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  id v6 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleFanSpeed" userInfo:0];
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleFanSpeed" userInfo:0];
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleFanSpeed" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (!a3)
  {
    v9 = @"NULL serializedFanSpeed";
    goto LABEL_6;
  }
  if (*(void *)a3 != 4205488804)
  {
    v9 = @"Bad PAFanSpeed magic";
LABEL_6:
    id v10 = +[SAException exceptionWithName:@"Decoding failure" reason:v9 userInfo:0];
    objc_exception_throw(v10);
  }
  id v5 = objc_alloc_init(SAPAStyleFanSpeed);
  uint64_t v6 = +[SAFanSpeed fanSpeedWithPAStyleSerializedFanSpeed:]((uint64_t)SAFanSpeed, (uint64_t)a3);
  fanSpeed = v5->_fanSpeed;
  v5->_fanSpeed = (SAFanSpeed *)v6;

  return v5;
}

- (void).cxx_destruct
{
}

@end