@interface POConcatKDF
+ (id)concatKDFWithKey:(id)a3 algorithm:(id)a4 partyUInfo:(id)a5 partyVInfo:(id)a6;
@end

@implementation POConcatKDF

+ (id)concatKDFWithKey:(id)a3 algorithm:(id)a4 partyUInfo:(id)a5 partyVInfo:(id)a6
{
  v9 = (objc_class *)MEMORY[0x263EFF990];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v9);
  int v24 = 0x1000000;
  [v14 appendBytes:&v24 length:4];
  [v14 appendData:v13];

  unsigned int v23 = bswap32([v12 length]);
  [v14 appendBytes:&v23 length:4];
  [v14 appendData:v12];

  unsigned int v22 = bswap32([v11 length]);
  [v14 appendBytes:&v22 length:4];
  [v14 appendData:v11];

  unsigned int v21 = bswap32([v10 length]);
  [v14 appendBytes:&v21 length:4];
  [v14 appendData:v10];

  int v20 = 0x10000;
  [v14 appendBytes:&v20 length:4];
  v15 = [MEMORY[0x263EFF990] dataWithLength:32];
  id v16 = v14;
  v17 = (const void *)[v16 bytes];
  LODWORD(v12) = [v16 length];
  id v18 = v15;
  CC_SHA256(v17, (CC_LONG)v12, (unsigned __int8 *)[v18 mutableBytes]);

  return v18;
}

@end