@interface NSNumber(SiriCoreSQLiteValue)
- (id)siriCoreSQLiteValue_escapedString:()SiriCoreSQLiteValue;
- (id)siriCoreSQLiteValue_toData;
- (uint64_t)siriCoreSQLiteValue_type;
@end

@implementation NSNumber(SiriCoreSQLiteValue)

- (uint64_t)siriCoreSQLiteValue_type
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v1 = a1;
  unsigned int v2 = *(char *)[v1 objCType] - 66;
  if (v2 > 0x31) {
    goto LABEL_6;
  }
  if (((1 << v2) & 0x2848200028483) != 0) {
    return 3;
  }
  if (((1 << v2) & 0x1400000000) != 0) {
    return 2;
  }
LABEL_6:
  v4 = (void *)*MEMORY[0x263F28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28360], OS_LOG_TYPE_ERROR))
  {
    id v5 = v1;
    v6 = v4;
    int v7 = 136315650;
    v8 = "-[NSNumber(SiriCoreSQLiteValue) siriCoreSQLiteValue_type]";
    __int16 v9 = 2112;
    id v10 = v1;
    __int16 v11 = 2080;
    uint64_t v12 = [v5 objCType];
    _os_log_error_impl(&dword_21CBF7000, v6, OS_LOG_TYPE_ERROR, "%s %@ (objCType = %s)", (uint8_t *)&v7, 0x20u);
  }
  return 0;
}

- (id)siriCoreSQLiteValue_toData
{
  id v1 = objc_msgSend(a1, "siriCoreSQLiteValue_toString");
  unsigned int v2 = objc_msgSend(v1, "siriCoreSQLiteValue_toData");

  return v2;
}

- (id)siriCoreSQLiteValue_escapedString:()SiriCoreSQLiteValue
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v4 = *MEMORY[0x263F28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28360], OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      v8 = "-[NSNumber(SiriCoreSQLiteValue) siriCoreSQLiteValue_escapedString:]";
      __int16 v9 = 2112;
      id v10 = a1;
      _os_log_error_impl(&dword_21CBF7000, v4, OS_LOG_TYPE_ERROR, "%s Using %@ as identifier is NOT supported.", (uint8_t *)&v7, 0x16u);
    }
    id v5 = 0;
  }
  else
  {
    id v5 = [a1 stringValue];
  }

  return v5;
}

@end