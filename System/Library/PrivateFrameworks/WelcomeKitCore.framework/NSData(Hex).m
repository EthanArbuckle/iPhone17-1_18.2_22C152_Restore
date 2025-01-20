@interface NSData(Hex)
+ (id)wl_dataFromHexEncodedData:()Hex;
+ (id)wl_dataFromHexEncodedString:()Hex;
+ (id)wl_lengthPrefixedBlobSequenceFromDataArray:()Hex;
- (BOOL)wl_blobIsComplete;
- (id)wl_arrayOfDataFromLengthPrefixedBlobSequenceWithExpectedCount:()Hex;
- (id)wl_dataFromLengthPrefixedBlob;
- (id)wl_hexEncodedData;
- (id)wl_hexEncodedString;
- (id)wl_lengthPrefixedBlob;
- (id)wl_utf8String;
@end

@implementation NSData(Hex)

- (BOOL)wl_blobIsComplete
{
  if ((unint64_t)[a1 length] < 5) {
    return 0;
  }
  v2 = objc_msgSend(a1, "subdataWithRange:", 0, 4);
  v3 = (void *)[[NSString alloc] initWithData:v2 encoding:4];
  uint64_t v4 = [v3 integerValue];
  BOOL v5 = [a1 length] == v4 + 4;

  return v5;
}

+ (id)wl_lengthPrefixedBlobSequenceFromDataArray:()Hex
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "wl_lengthPrefixedBlob", (void)v14);
        [v4 appendData:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  if ((unint64_t)[v5 count] < 2)
  {
    id v11 = v4;
  }
  else
  {
    objc_msgSend(v4, "wl_lengthPrefixedBlob");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (id)wl_lengthPrefixedBlob
{
  v2 = objc_msgSend(MEMORY[0x263EFF990], "dataWithCapacity:", objc_msgSend(a1, "length") + 4);
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%.4lu", objc_msgSend(a1, "length"));
  id v4 = [v3 dataUsingEncoding:4];
  [v2 appendData:v4];

  [v2 appendData:a1];
  return v2;
}

- (id)wl_arrayOfDataFromLengthPrefixedBlobSequenceWithExpectedCount:()Hex
{
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:");
  id v6 = a1;
  uint64_t v7 = v6;
  if (a3 >= 2)
  {
    uint64_t v8 = objc_msgSend(v6, "wl_dataFromLengthPrefixedBlob");

    uint64_t v7 = (void *)v8;
  }
  if ([v5 count] < a3)
  {
    while ((unint64_t)[v7 length] >= 4)
    {
      v9 = objc_msgSend(v7, "subdataWithRange:", 0, 4);
      v10 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
      unint64_t v11 = [v10 integerValue];
      v12 = objc_msgSend(v7, "subdataWithRange:", 4, objc_msgSend(v7, "length") - 4);

      if ([v12 length] < v11)
      {

        uint64_t v7 = v12;
        break;
      }
      v13 = objc_msgSend(v12, "subdataWithRange:", 0, v11);
      [v5 addObject:v13];
      uint64_t v7 = objc_msgSend(v12, "subdataWithRange:", v11, objc_msgSend(v12, "length") - v11);

      if ([v5 count] >= a3) {
        break;
      }
    }
  }
  if ([v7 length])
  {

    id v5 = 0;
  }
  if ([v5 count] != a3)
  {

    id v5 = 0;
  }

  return v5;
}

- (id)wl_dataFromLengthPrefixedBlob
{
  v1 = objc_msgSend(a1, "wl_arrayOfDataFromLengthPrefixedBlobSequenceWithExpectedCount:", 1);
  v2 = [v1 firstObject];

  return v2;
}

- (id)wl_hexEncodedData
{
  v1 = objc_msgSend(a1, "wl_hexEncodedString");
  v2 = [v1 dataUsingEncoding:4];

  return v2;
}

+ (id)wl_dataFromHexEncodedData:()Hex
{
  id v4 = objc_msgSend(a3, "wl_utf8String");
  id v5 = objc_msgSend(a1, "wl_dataFromHexEncodedString:", v4);

  return v5;
}

- (id)wl_hexEncodedString
{
  size_t v2 = 2 * [a1 length];
  id v3 = malloc_type_malloc(v2, 0xA72B8D6DuLL);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__NSData_Hex__wl_hexEncodedString__block_invoke;
  v6[3] = &__block_descriptor_40_e29_v40__0r_v8__NSRange_QQ_16_B32l;
  v6[4] = v3;
  [a1 enumerateByteRangesUsingBlock:v6];
  id v4 = (void *)[[NSString alloc] initWithBytes:v3 length:v2 encoding:4];
  free(v3);
  return v4;
}

+ (id)wl_dataFromHexEncodedString:()Hex
{
  id v3 = a3;
  if ([v3 length])
  {
    _WLLog();
    v12 = 0;
    goto LABEL_17;
  }
  size_t v4 = (unint64_t)[v3 length] >> 1;
  id v5 = malloc_type_malloc(v4, 0xD885B27EuLL);
  if (![v3 length])
  {
LABEL_14:
    v12 = [MEMORY[0x263EFF8F8] dataWithBytes:v5 length:v4];
    goto LABEL_15;
  }
  unint64_t v6 = 0;
  while (1)
  {
    int v7 = [v3 characterAtIndex:v6];
    __int16 v16 = v7;
    if ((v7 - 48) >= 0xA) {
      break;
    }
    char v8 = -48;
LABEL_10:
    char v9 = v8 + v7;
    unint64_t v10 = v6 >> 1;
    if (v6) {
      char v11 = v5[v10] | v9;
    }
    else {
      char v11 = 16 * v9;
    }
    v5[v10] = v11;
    if (++v6 >= [v3 length]) {
      goto LABEL_14;
    }
  }
  if ((v7 - 97) < 6)
  {
    char v8 = -87;
    goto LABEL_10;
  }
  if ((v7 - 65) <= 5)
  {
    char v8 = -55;
    goto LABEL_10;
  }
  long long v14 = [NSString stringWithCharacters:&v16 length:1];
  long long v15 = [NSNumber numberWithUnsignedInteger:v6];
  _WLLog();

  v12 = 0;
LABEL_15:
  free(v5);
LABEL_17:

  return v12;
}

- (id)wl_utf8String
{
  v1 = (void *)[[NSString alloc] initWithData:a1 encoding:4];
  return v1;
}

@end