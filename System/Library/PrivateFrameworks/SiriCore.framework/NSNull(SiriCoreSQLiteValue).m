@interface NSNull(SiriCoreSQLiteValue)
- (__CFString)siriCoreSQLiteValue_escapedString:()SiriCoreSQLiteValue;
- (uint64_t)siriCoreSQLiteValue_toData;
- (uint64_t)siriCoreSQLiteValue_toNumber;
- (uint64_t)siriCoreSQLiteValue_toString;
- (uint64_t)siriCoreSQLiteValue_type;
@end

@implementation NSNull(SiriCoreSQLiteValue)

- (uint64_t)siriCoreSQLiteValue_type
{
  return 4;
}

- (uint64_t)siriCoreSQLiteValue_toData
{
  return 0;
}

- (uint64_t)siriCoreSQLiteValue_toNumber
{
  return 0;
}

- (uint64_t)siriCoreSQLiteValue_toString
{
  return 0;
}

- (__CFString)siriCoreSQLiteValue_escapedString:()SiriCoreSQLiteValue
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!a3) {
    return @"null";
  }
  v4 = *MEMORY[0x263F28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28360], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    v7 = "-[NSNull(SiriCoreSQLiteValue) siriCoreSQLiteValue_escapedString:]";
    __int16 v8 = 2112;
    uint64_t v9 = a1;
    _os_log_error_impl(&dword_21CBF7000, v4, OS_LOG_TYPE_ERROR, "%s Using %@ as identifier is NOT supported.", (uint8_t *)&v6, 0x16u);
  }
  return 0;
}

@end