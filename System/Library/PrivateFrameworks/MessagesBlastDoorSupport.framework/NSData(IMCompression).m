@interface NSData(IMCompression)
- (id)_imDecompressData;
- (id)_imOptionallyDecompressData;
@end

@implementation NSData(IMCompression)

- (id)_imDecompressData
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)[a1 length] > 0xC800000)
  {
    id v2 = 0;
    goto LABEL_17;
  }
  if (![a1 length])
  {
    id v2 = a1;
    goto LABEL_17;
  }
  int v3 = [a1 length];
  unsigned int v4 = [a1 length];
  v5 = [MEMORY[0x1E4F1CA58] dataWithLength:v3 + (v4 >> 1)];
  if (!v5) {
    goto LABEL_15;
  }
  memset(&strm.avail_in, 0, 104);
  id v6 = a1;
  strm.next_in = (Bytef *)[v6 bytes];
  strm.avail_in = [v6 length];
  id v2 = 0;
  if (!inflateInit2_(&strm, 47, "1.2.12", 112))
  {
    uint64_t v7 = v4 >> 1;
    do
    {
      uLong total_out = strm.total_out;
      if (total_out >= [v5 length]) {
        [v5 increaseLengthBy:v7];
      }
      id v9 = v5;
      uint64_t v10 = [v9 mutableBytes];
      strm.next_out = (Bytef *)(v10 + strm.total_out);
      int v11 = [v9 length];
      strm.avail_out = v11 - LODWORD(strm.total_out);
      int v12 = inflate(&strm, 2);
    }
    while (!v12);
    if (v12 == 1)
    {
      if (!inflateEnd(&strm))
      {
        [v9 setLength:strm.total_out];
        id v2 = [MEMORY[0x1E4F1C9B8] dataWithData:v9];
        goto LABEL_16;
      }
    }
    else
    {
      inflateEnd(&strm);
    }
LABEL_15:
    id v2 = 0;
  }
LABEL_16:

LABEL_17:

  return v2;
}

- (id)_imOptionallyDecompressData
{
  uint64_t v2 = [a1 _imDecompressData];
  int v3 = (void *)v2;
  if (v2) {
    unsigned int v4 = (void *)v2;
  }
  else {
    unsigned int v4 = a1;
  }
  id v5 = v4;

  return v5;
}

@end