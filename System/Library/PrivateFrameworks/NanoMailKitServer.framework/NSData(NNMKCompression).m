@interface NSData(NNMKCompression)
- (id)compressedData;
- (id)decompressedData;
@end

@implementation NSData(NNMKCompression)

- (id)compressedData
{
  if ([a1 length])
  {
    memset(&v9.total_out, 0, 72);
    id v2 = a1;
    v9.avail_in = objc_msgSend(v2, "length", objc_msgSend(v2, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
    id v3 = 0;
    if (!deflateInit2_(&v9, -1, 8, 31, 8, 0, "1.2.12", 112))
    {
      v4 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:0x4000];
      do
      {
        uLong total_out = v9.total_out;
        if (total_out >= [v4 length]) {
          [v4 increaseLengthBy:0x4000];
        }
        id v3 = v4;
        uint64_t v6 = [v3 mutableBytes];
        v9.next_out = (Bytef *)(v6 + v9.total_out);
        int v7 = [v3 length];
        v9.avail_out = v7 - LODWORD(v9.total_out);
        deflate(&v9, 4);
      }
      while (!v9.avail_out);
      deflateEnd(&v9);
      [v3 setLength:v9.total_out];
    }
  }
  else
  {
    id v3 = a1;
  }
  return v3;
}

- (id)decompressedData
{
  if (![a1 length])
  {
    id v7 = a1;
    goto LABEL_17;
  }
  int v2 = [a1 length];
  int v3 = [a1 length];
  if (v3 >= 0) {
    int v4 = v3;
  }
  else {
    int v4 = v3 + 1;
  }
  v5 = [MEMORY[0x263EFF990] dataWithLength:(v2 + (v4 >> 1))];
  id v6 = a1;
  v15.avail_in = objc_msgSend(v6, "length", objc_msgSend(v6, "bytes"), (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
  v15.zalloc = 0;
  v15.zfree = 0;
  v15.uLong total_out = 0;
  id v7 = 0;
  if (!inflateInit2_(&v15, 47, "1.2.12", 112))
  {
    uint64_t v8 = (v4 >> 1);
    do
    {
      uLong total_out = v15.total_out;
      if (total_out >= [v5 length]) {
        [v5 increaseLengthBy:v8];
      }
      id v10 = v5;
      uint64_t v11 = [v10 mutableBytes];
      v15.next_out = (Bytef *)(v11 + v15.total_out);
      int v12 = [v10 length];
      v15.avail_out = v12 - LODWORD(v15.total_out);
      int v13 = inflate(&v15, 2);
    }
    while (!v13);
    if (v13 == 1)
    {
      if (!inflateEnd(&v15))
      {
        [v10 setLength:v15.total_out];
        id v7 = [MEMORY[0x263EFF8F8] dataWithData:v10];
        goto LABEL_16;
      }
    }
    else
    {
      inflateEnd(&v15);
    }
    id v7 = 0;
  }
LABEL_16:

LABEL_17:
  return v7;
}

@end