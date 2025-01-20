@interface NSUUID(NSUUIDSASerializable)
+ (__CFString)classDictionaryKey;
+ (uint64_t)newInstanceWithoutReferencesFromSerializedBuffer:()NSUUIDSASerializable bufferLength:;
- (uint64_t)addSelfToBuffer:()NSUUIDSASerializable bufferLength:withCompletedSerializationDictionary:;
- (uint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:()NSUUIDSASerializable;
@end

@implementation NSUUID(NSUUIDSASerializable)

+ (__CFString)classDictionaryKey
{
  return @"NSUUIDPASeriablizable";
}

- (uint64_t)addSelfToBuffer:()NSUUIDSASerializable bufferLength:withCompletedSerializationDictionary:
{
  id v7 = a5;
  if (!a3 || (v8 = v7) == 0)
  {
    id v10 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Invalid args" userInfo:0];
    objc_exception_throw(v10);
  }
  *a3 = 4277006349;
  [a1 getUUIDBytes:a3 + 1];

  return 1;
}

- (void)addSelfToSerializationDictionary:()NSUUIDSASerializable
{
  v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 classDictionaryKey];
  SASerializableAddInstanceToSerializationDictionaryWithClassKey(v5, a1, v6);
}

- (uint64_t)sizeInBytesForSerializedVersion
{
  return 24;
}

+ (uint64_t)newInstanceWithoutReferencesFromSerializedBuffer:()NSUUIDSASerializable bufferLength:
{
  if (!a3)
  {
    v4 = @"Invalid buffer";
    goto LABEL_8;
  }
  if (*a3 != 4277006349)
  {
    v4 = @"Bad SANSUUID magic";
    goto LABEL_8;
  }
  uint64_t result = uuidForBytes((uint64_t)(a3 + 1));
  if (!result)
  {
    v4 = @"Got a nil UUID";
LABEL_8:
    id v5 = +[SAException exceptionWithName:@"Decoding failure" reason:v4 userInfo:0];
    objc_exception_throw(v5);
  }
  return result;
}

@end