@interface NSData
+ (NSData)dataWithSTSNDEFRecord:(id)a3;
+ (NSData)dataWithSTSNDEFRecords:(id)a3;
+ (id)STS_dataFromHexString:(id)a3;
- (id)STS_asHexString;
- (id)STS_reverseBytes;
- (id)cborEncodeToBstrCbor;
- (id)encodeToBstrCbor;
@end

@implementation NSData

+ (NSData)dataWithSTSNDEFRecord:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableData data];
  unsigned __int8 v28 = 0;
  unsigned __int8 v27 = [v3 header];
  [v4 appendBytes:&v27 length:1];
  v5 = [v3 type];
  if (v5)
  {
  }
  else if (![v3 typeNameFormat])
  {
    unsigned __int8 v28 = 0;
    [v4 appendBytes:&v28 length:1];
    unsigned __int8 v28 = 0;
    [v4 appendBytes:&v28 length:1];
    goto LABEL_22;
  }
  v6 = [v3 type];
  unsigned __int8 v28 = [v6 length];

  [v4 appendBytes:&v28 length:1];
  if ([v3 shortRecord])
  {
    unsigned __int8 v28 = 0;
    v7 = [v3 payload];
    id v8 = [v7 length];

    if (v8)
    {
      v9 = [v3 payload];
      unsigned __int8 v28 = [v9 length];
    }
  }
  else
  {
    v10 = [v3 payload];
    id v11 = [v10 length];

    if (v11)
    {
      v12 = [v3 payload];
      unsigned int v13 = [v12 length];
    }
    else
    {
      unsigned int v13 = 0;
    }
    unsigned __int8 v28 = HIBYTE(v13);
    [v4 appendBytes:&v28 length:1];
    unsigned __int8 v28 = BYTE2(v13);
    [v4 appendBytes:&v28 length:1];
    unsigned __int8 v28 = BYTE1(v13);
    [v4 appendBytes:&v28 length:1];
    unsigned __int8 v28 = v13;
  }
  [v4 appendBytes:&v28 length:1];
  if ([v3 _idLengthPresent])
  {
    v14 = [v3 identifier];
    id v15 = [v14 length];

    if (v15)
    {
      v16 = [v3 identifier];
      unsigned __int8 v28 = [v16 length];

      [v4 appendBytes:&v28 length:1];
    }
  }
  v17 = [v3 type];
  id v18 = [v17 length];

  if (v18)
  {
    v19 = [v3 type];
    [v4 appendData:v19];
  }
  if ([v3 _idLengthPresent])
  {
    v20 = [v3 identifier];
    id v21 = [v20 length];

    if (v21)
    {
      v22 = [v3 identifier];
      [v4 appendData:v22];
    }
  }
  v23 = [v3 payload];
  id v24 = [v23 length];

  if (v24)
  {
    v25 = [v3 payload];
    [v4 appendData:v25];
  }
LABEL_22:

  return (NSData *)v4;
}

+ (NSData)dataWithSTSNDEFRecords:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  if ([v3 count])
  {
    v5 = 0;
    do
    {
      if (!v5)
      {
        v6 = [v3 objectAtIndexedSubscript:0];
        [v6 setMessageBegin:1];
      }
      if (v5 == (char *)[v3 count] - 1)
      {
        v7 = [v3 objectAtIndexedSubscript:v5];
        [v7 setMessageEnd:1];
      }
      id v8 = [v3 objectAtIndexedSubscript:v5];
      v9 = +[NSData dataWithSTSNDEFRecord:v8];
      [v4 appendData:v9];

      ++v5;
    }
    while (v5 < [v3 count]);
  }
  id v10 = [v4 copy];

  return (NSData *)v10;
}

- (id)cborEncodeToBstrCbor
{
  v2 = +[CBOR cborWithData:self];
  id v3 = +[CBOR cborWithInteger:24];
  [v2 setTag:v3];

  return v2;
}

- (id)encodeToBstrCbor
{
  v2 = [(NSData *)self cborEncodeToBstrCbor];
  id v3 = +[NSData dataWithCBOR:v2];

  return v3;
}

+ (id)STS_dataFromHexString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (uint64_t)[v3 length];
  uint64_t v8 = v4;
  if (!v4 || (v4 & 1) != 0)
  {
    sub_100026000(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[NSData(STSExtension) STS_dataFromHexString:]", 25, @"String is of invalid length=%ld", v5, v6, v7, v4);
    id v21 = 0;
    goto LABEL_19;
  }
  id v9 = objc_alloc((Class)NSMutableData);
  if (v8 >= 0) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v8 + 1;
  }
  id v11 = [v9 initWithLength:v10 >> 1];
  id v15 = v11;
  if (!v11)
  {
    sub_100026000(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[NSData(STSExtension) STS_dataFromHexString:]", 31, @"Memory allocation request failed.", v12, v13, v14, v25);
LABEL_17:
    id v21 = 0;
    goto LABEL_18;
  }
  id v16 = v11;
  v17 = [v16 mutableBytes];
  id v18 = [v3 UTF8String];
  __str[2] = 0;
  int v19 = *v18;
  if (*v18)
  {
    v20 = v18 + 2;
    id v21 = 0;
    do
    {
      __str[0] = v19;
      uint64_t v22 = *(v20 - 1);
      __str[1] = *(v20 - 1);
      if ((v19 & 0x80) != 0) {
        goto LABEL_17;
      }
      if ((_DefaultRuneLocale.__runetype[v19] & 0x10000) == 0 || (char)v22 < 0) {
        goto LABEL_18;
      }
      if ((_DefaultRuneLocale.__runetype[v22] & 0x10000) == 0) {
        goto LABEL_17;
      }
      *v17++ = strtoul(__str, 0, 16);
      int v23 = *v20;
      v20 += 2;
      int v19 = v23;
    }
    while (v23);
  }
  id v21 = [v16 copy];
LABEL_18:

LABEL_19:

  return v21;
}

- (id)STS_asHexString
{
  NSUInteger v3 = [(NSData *)self length];
  if (!v3) {
    goto LABEL_7;
  }
  NSUInteger v4 = v3;
  NSUInteger v5 = [(NSData *)self length];
  uint64_t v6 = (char *)malloc_type_malloc((2 * v5) | 1, 0xDE05561AuLL);
  if (!v6)
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[NSData(STSExtension) STS_asHexString]", 65, self, @"Memory allocation request failed.", v7, v8, v15);
LABEL_7:
    uint64_t v13 = &stru_100055900;
    goto LABEL_8;
  }
  id v9 = v6;
  v6[2 * v5] = 0;
  uint64_t v10 = [(NSData *)self bytes];
  id v11 = v9;
  do
  {
    int v12 = *v10++;
    sprintf(v11, "%02X", v12);
    v11 += 2;
    --v4;
  }
  while (v4);
  uint64_t v13 = +[NSString stringWithUTF8String:v9];
  free(v9);
LABEL_8:

  return v13;
}

- (id)STS_reverseBytes
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", -[NSData length](self, "length"));
  NSUInteger v4 = [v3 mutableBytes];
  NSUInteger v5 = (char *)[(NSData *)self length] - 1;
  if ((uint64_t)v5 >= 0)
  {
    do
      *v4++ = (v5--)[(void)[(NSData *)self bytes]];
    while (v5 != (char *)-1);
  }

  return v3;
}

@end