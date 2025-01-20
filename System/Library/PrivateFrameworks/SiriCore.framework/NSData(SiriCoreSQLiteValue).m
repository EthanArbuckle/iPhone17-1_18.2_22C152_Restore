@interface NSData(SiriCoreSQLiteValue)
- (id)siriCoreSQLiteValue_escapedString:()SiriCoreSQLiteValue;
- (id)siriCoreSQLiteValue_toNumber;
- (id)siriCoreSQLiteValue_toString;
- (uint64_t)siriCoreSQLiteValue_blobRepresentationWithLength:()SiriCoreSQLiteValue;
- (uint64_t)siriCoreSQLiteValue_type;
@end

@implementation NSData(SiriCoreSQLiteValue)

- (uint64_t)siriCoreSQLiteValue_blobRepresentationWithLength:()SiriCoreSQLiteValue
{
  if (a3) {
    *a3 = [a1 length];
  }
  id v4 = a1;

  return [v4 bytes];
}

- (uint64_t)siriCoreSQLiteValue_type
{
  return 1;
}

- (id)siriCoreSQLiteValue_toNumber
{
  v1 = objc_msgSend(a1, "siriCoreSQLiteValue_toString");
  v2 = objc_msgSend(v1, "siriCoreSQLiteValue_toNumber");

  return v2;
}

- (id)siriCoreSQLiteValue_toString
{
  v1 = (void *)[[NSString alloc] initWithData:a1 encoding:4];

  return v1;
}

- (id)siriCoreSQLiteValue_escapedString:()SiriCoreSQLiteValue
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = *MEMORY[0x263F28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28360], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[NSData(SiriCoreSQLiteValue) siriCoreSQLiteValue_escapedString:]";
      __int16 v11 = 2112;
      uint64_t v12 = a1;
      _os_log_error_impl(&dword_21CBF7000, v4, OS_LOG_TYPE_ERROR, "%s Using %@ as identifier is NOT supported.", buf, 0x16u);
    }
    v5 = 0;
  }
  else
  {
    id v6 = [NSString alloc];
    v7 = [NSString hexStringFromData:a1];
    v5 = (void *)[v6 initWithFormat:@"X'%@'", v7];
  }

  return v5;
}

@end