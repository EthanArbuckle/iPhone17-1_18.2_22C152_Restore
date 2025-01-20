@interface SAPAStyleHIDEvent
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
@end

@implementation SAPAStyleHIDEvent

+ (id)classDictionaryKey
{
  return @"PASerializedHIDEvent";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  id v6 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleHIDEvent" userInfo:0];
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleHIDEvent" userInfo:0];
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleHIDEvent" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (!a3)
  {
    v9 = @"NULL serializedHIDEvent";
    goto LABEL_6;
  }
  if (*(void *)a3 != 1105100401)
  {
    v9 = @"Bad SAPAStyleHIDEvent magic";
LABEL_6:
    id v10 = +[SAException exceptionWithName:@"Decoding failure" reason:v9 userInfo:0];
    objc_exception_throw(v10);
  }
  id v5 = objc_alloc_init(SAPAStyleHIDEvent);
  uint64_t v6 = +[SAHIDEvent hidEventWithoutReferencesFromPAStyleSerializedHIDEvent:]((uint64_t)SAHIDEvent, (uint64_t)a3);
  hidEvent = v5->_hidEvent;
  v5->_hidEvent = (SAHIDEvent *)v6;

  return v5;
}

- (void).cxx_destruct
{
}

@end