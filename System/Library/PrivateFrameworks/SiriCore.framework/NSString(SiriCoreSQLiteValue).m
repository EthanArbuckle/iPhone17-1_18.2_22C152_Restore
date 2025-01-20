@interface NSString(SiriCoreSQLiteValue)
- (id)siriCoreSQLiteValue_escapedString:()SiriCoreSQLiteValue;
- (id)siriCoreSQLiteValue_toNumber;
- (uint64_t)siriCoreSQLiteValue_textRepresentation;
- (uint64_t)siriCoreSQLiteValue_toData;
- (uint64_t)siriCoreSQLiteValue_type;
@end

@implementation NSString(SiriCoreSQLiteValue)

- (id)siriCoreSQLiteValue_escapedString:()SiriCoreSQLiteValue
{
  id v5 = [NSString alloc];
  if (a3)
  {
    v6 = [a1 stringByReplacingOccurrencesOfString:@"\" withString:@"\"\"];
    uint64_t v7 = [v5 initWithFormat:@"\"%@\"", v6];
  }
  else
  {
    v6 = [a1 stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    uint64_t v7 = [v5 initWithFormat:@"'%@'", v6];
  }
  v8 = (void *)v7;

  return v8;
}

- (uint64_t)siriCoreSQLiteValue_textRepresentation
{
  id v1 = a1;

  return [v1 UTF8String];
}

- (uint64_t)siriCoreSQLiteValue_type
{
  return 5;
}

- (uint64_t)siriCoreSQLiteValue_toData
{
  return [a1 dataUsingEncoding:4];
}

- (id)siriCoreSQLiteValue_toNumber
{
  uint64_t v2 = [a1 length];
  v3 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:a1];
  uint64_t v15 = 0;
  if ([v3 scanUnsignedLongLong:&v15] && objc_msgSend(v3, "scanLocation") == v2)
  {
    uint64_t v4 = v15;
    if (v15 != -1)
    {
LABEL_6:
      uint64_t v5 = [NSNumber numberWithUnsignedLongLong:v4];
      goto LABEL_25;
    }
    if ([a1 isEqualToString:@"18446744073709551615"])
    {
      uint64_t v4 = v15;
      goto LABEL_6;
    }
LABEL_23:
    uint64_t v5 = [objc_alloc(MEMORY[0x263F087B0]) initWithString:a1];
    goto LABEL_25;
  }
  [v3 setScanLocation:0];
  uint64_t v14 = 0;
  if ([v3 scanLongLong:&v14] && objc_msgSend(v3, "scanLocation") == v2)
  {
    uint64_t v6 = v14;
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (([a1 isEqualToString:@"+9223372036854775807"] & 1) == 0) {
        goto LABEL_23;
      }
      uint64_t v6 = v14;
    }
    if (v6 == 0x8000000000000000)
    {
      if (![a1 isEqualToString:@"-9223372036854775808"]) {
        goto LABEL_23;
      }
      uint64_t v6 = v14;
    }
    uint64_t v5 = [NSNumber numberWithLongLong:v6];
    goto LABEL_25;
  }
  [v3 setScanLocation:0];
  long long v12 = 0uLL;
  int v13 = 0;
  uint64_t v7 = 0;
  if (![v3 scanDecimal:&v12]) {
    goto LABEL_26;
  }
  if ([v3 scanLocation] != v2)
  {
    uint64_t v7 = 0;
    goto LABEL_26;
  }
  if ((BYTE1(v12) & 0xC) == 0
    && ([v3 setScanLocation:0],
        *(void *)&long long v10 = 0,
        [v3 scanDouble:&v10])
    && [v3 scanLocation] == v2)
  {
    uint64_t v5 = [NSNumber numberWithDouble:*(double *)&v10];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F087B0]);
    long long v10 = v12;
    int v11 = v13;
    uint64_t v5 = [v8 initWithDecimal:&v10];
  }
LABEL_25:
  uint64_t v7 = (void *)v5;
LABEL_26:

  return v7;
}

@end