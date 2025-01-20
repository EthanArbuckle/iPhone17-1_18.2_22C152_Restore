@interface NSData(RCAdditions)
- (id)rc_gzipDeflate;
- (id)rc_gzipInflate;
@end

@implementation NSData(RCAdditions)

- (id)rc_gzipInflate
{
  if (![a1 length])
  {
    id v6 = a1;
    goto LABEL_14;
  }
  uint64_t v2 = [a1 length];
  unint64_t v3 = [a1 length];
  v4 = [MEMORY[0x1E4F1CA58] dataWithLength:v2 + (v3 >> 1)];
  id v5 = a1;
  v14.avail_in = objc_msgSend(v5, "length", objc_msgSend(v5, "bytes"), (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
  v14.zalloc = 0;
  v14.zfree = 0;
  v14.uLong total_out = 0;
  id v6 = 0;
  if (!inflateInit2_(&v14, 47, "1.2.12", 112))
  {
    unint64_t v7 = v3 >> 1;
    do
    {
      uLong total_out = v14.total_out;
      if (total_out >= [v4 length]) {
        [v4 increaseLengthBy:v7];
      }
      id v9 = v4;
      uint64_t v10 = [v9 mutableBytes];
      v14.next_out = (Bytef *)(v10 + v14.total_out);
      int v11 = [v9 length];
      v14.avail_out = v11 - LODWORD(v14.total_out);
      int v12 = inflate(&v14, 2);
    }
    while (!v12);
    if (v12 == 1)
    {
      if (!inflateEnd(&v14))
      {
        [v9 setLength:v14.total_out];
        id v6 = [MEMORY[0x1E4F1C9B8] dataWithData:v9];
        goto LABEL_13;
      }
    }
    else
    {
      inflateEnd(&v14);
    }
    id v6 = 0;
  }
LABEL_13:

LABEL_14:

  return v6;
}

- (id)rc_gzipDeflate
{
  if ([a1 length])
  {
    memset(&v10.total_out, 0, 72);
    id v2 = a1;
    v10.avail_in = objc_msgSend(v2, "length", objc_msgSend(v2, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
    id v3 = 0;
    if (!deflateInit2_(&v10, -1, 8, 31, 8, 0, "1.2.12", 112))
    {
      v4 = [MEMORY[0x1E4F1CA58] dataWithLength:0x4000];
      do
      {
        uLong total_out = v10.total_out;
        if (total_out >= [v4 length]) {
          [v4 increaseLengthBy:0x4000];
        }
        id v6 = v4;
        uint64_t v7 = [v6 mutableBytes];
        v10.next_out = (Bytef *)(v7 + v10.total_out);
        int v8 = [v6 length];
        v10.avail_out = v8 - LODWORD(v10.total_out);
        deflate(&v10, 4);
      }
      while (!v10.avail_out);
      deflateEnd(&v10);
      [v6 setLength:v10.total_out];
      id v3 = [MEMORY[0x1E4F1C9B8] dataWithData:v6];
    }
  }
  else
  {
    id v3 = a1;
  }

  return v3;
}

@end