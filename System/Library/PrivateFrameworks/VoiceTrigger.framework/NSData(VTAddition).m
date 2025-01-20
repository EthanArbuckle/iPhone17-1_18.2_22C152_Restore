@interface NSData(VTAddition)
- (id)MD5HashString;
@end

@implementation NSData(VTAddition)

- (id)MD5HashString
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v1 = a1;
  CC_MD5((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", md[0]);
  [v2 appendString:v3];

  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", md[1]);
  [v2 appendString:v4];

  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", md[2]);
  [v2 appendString:v5];

  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", md[3]);
  [v2 appendString:v6];

  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", md[4]);
  [v2 appendString:v7];

  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", md[5]);
  [v2 appendString:v8];

  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", md[6]);
  [v2 appendString:v9];

  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", md[7]);
  [v2 appendString:v10];

  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", md[8]);
  [v2 appendString:v11];

  v12 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", md[9]);
  [v2 appendString:v12];

  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", md[10]);
  [v2 appendString:v13];

  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", md[11]);
  [v2 appendString:v14];

  v15 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", md[12]);
  [v2 appendString:v15];

  v16 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", md[13]);
  [v2 appendString:v16];

  v17 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", md[14]);
  [v2 appendString:v17];

  v18 = objc_msgSend(NSString, "stringWithFormat:", @"%02X", md[15]);
  [v2 appendString:v18];

  return v2;
}

@end