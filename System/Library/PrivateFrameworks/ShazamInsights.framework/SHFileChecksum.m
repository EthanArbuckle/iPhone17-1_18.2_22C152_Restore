@interface SHFileChecksum
+ (id)checksumDataForFile:(id)a3 withError:(id *)a4;
+ (id)checksumForFile:(id)a3 withError:(id *)a4;
@end

@implementation SHFileChecksum

+ (id)checksumForFile:(id)a3 withError:(id *)a4
{
  v4 = [a1 checksumDataForFile:a3 withError:a4];
  v5 = [v4 base64EncodedStringWithOptions:0];

  return v5;
}

+ (id)checksumDataForFile:(id)a3 withError:(id *)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  memset(&v12, 0, sizeof(v12));
  if (CC_SHA1_Init(&v12))
  {
    v6 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:v5 error:a4];
    if (v6)
    {
      id v7 = 0;
      do
      {
        v8 = (void *)MEMORY[0x22A6583E0]();
        v9 = [v6 readDataOfLength:0x100000];

        id v7 = v9;
        LODWORD(v9) = CC_SHA1_Update(&v12, (const void *)[v7 bytes], objc_msgSend(v7, "length"));
      }
      while (v9 && [v7 length]);
      CC_SHA1_Final(md, &v12);
      [v6 closeAndReturnError:0];
      v10 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:20];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end