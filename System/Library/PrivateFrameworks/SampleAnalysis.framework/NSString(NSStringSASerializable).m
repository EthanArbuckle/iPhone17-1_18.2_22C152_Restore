@interface NSString(NSStringSASerializable)
+ (__CFString)classDictionaryKey;
+ (uint64_t)newInstanceWithoutReferencesFromSerializedBuffer:()NSStringSASerializable bufferLength:;
- (uint64_t)addSelfToBuffer:()NSStringSASerializable bufferLength:withCompletedSerializationDictionary:;
- (uint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:()NSStringSASerializable;
@end

@implementation NSString(NSStringSASerializable)

+ (__CFString)classDictionaryKey
{
  return @"NSStringPASeriablizable";
}

- (uint64_t)addSelfToBuffer:()NSStringSASerializable bufferLength:withCompletedSerializationDictionary:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (!a3) {
    goto LABEL_11;
  }
  v9 = v8;
  if (!v8) {
    goto LABEL_11;
  }
  *(void *)a3 = 4277001901;
  v10 = [a1 dataUsingEncoding:4 allowLossyConversion:1];
  v11 = v10;
  if (!v10)
  {
    *(void *)(a3 + 8) = 1;
    *(unsigned char *)(a3 + 16) = 0;
    goto LABEL_7;
  }
  if ([v10 length] + 1 > (unint64_t)(a4 - 16))
  {
    int v14 = *__error();
    v15 = _sa_logt();
    uint64_t v16 = a4 - 17;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v26 = [a1 UTF8String];
      __int16 v27 = 2048;
      uint64_t v28 = v16;
      __int16 v29 = 2048;
      uint64_t v30 = [v11 length];
      _os_log_error_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_ERROR, "%s claimed it was %lu UTF8 characters, but ended up being %lu", buf, 0x20u);
    }

    *__error() = v14;
    char v17 = [a1 UTF8String];
    [v11 length];
    _SASetCrashLogMessage(768, "%s claimed it was %lu UTF8 characters, but ended up being %lu", v18, v19, v20, v21, v22, v23, v17);
    _os_crash();
    __break(1u);
LABEL_11:
    id v24 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Invalid args" userInfo:0];
    objc_exception_throw(v24);
  }
  id v12 = v11;
  memmove((void *)(a3 + 16), (const void *)[v12 bytes], objc_msgSend(v12, "length"));
  *(unsigned char *)(a3 + 16 + [v12 length]) = 0;
  *(void *)(a3 + 8) = [v12 length] + 1;
LABEL_7:

  return 1;
}

- (void)addSelfToSerializationDictionary:()NSStringSASerializable
{
  v4 = NSString;
  id v5 = a3;
  id v6 = [v4 classDictionaryKey];
  SASerializableAddInstanceToSerializationDictionaryWithClassKey(v5, a1, v6);
}

- (uint64_t)sizeInBytesForSerializedVersion
{
  return [a1 lengthOfBytesUsingEncoding:4] + 17;
}

+ (uint64_t)newInstanceWithoutReferencesFromSerializedBuffer:()NSStringSASerializable bufferLength:
{
  if (!a3)
  {
    id v5 = @"Invalid buffer";
    goto LABEL_12;
  }
  if (*a3 != 4277001901)
  {
    id v5 = @"Bad SANSString magic";
    goto LABEL_12;
  }
  uint64_t v3 = a3[1];
  if (!v3)
  {
    id v5 = @"0-length SANSString";
    goto LABEL_12;
  }
  if (*((unsigned char *)a3 + v3 + 15))
  {
    id v5 = @"Non-nul terminated SANSString";
    goto LABEL_12;
  }
  uint64_t result = SANSStringForCString(a3 + 2);
  if (!result)
  {
    id v5 = @"Got a nil string";
LABEL_12:
    id v6 = +[SAException exceptionWithName:@"Decoding failure" reason:v5 userInfo:0];
    objc_exception_throw(v6);
  }
  return result;
}

@end