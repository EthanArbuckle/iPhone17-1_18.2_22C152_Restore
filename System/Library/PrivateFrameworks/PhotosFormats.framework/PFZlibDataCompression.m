@interface PFZlibDataCompression
+ (id)compressData:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)decompressData:(id)a3 options:(id)a4 error:(id *)a5;
- (PFZlibDataCompression)init;
@end

@implementation PFZlibDataCompression

+ (id)decompressData:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v8 = +[PFZlibDataDecompressionOptions defaultOptions];
  }
  if (![v7 length])
  {
LABEL_7:
    v11 = 0;
    goto LABEL_27;
  }
  memset(&v26.total_out, 0, 72);
  id v9 = v7;
  v26.avail_in = objc_msgSend(v9, "length", objc_msgSend(v9, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
  unsigned int v10 = inflateInit2_(&v26, [v8 windowBits], "1.2.12", 112);
  if (v10)
  {
    if (a5)
    {
      ErrorForCode((uint64_t)&v26, v10, 0);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    goto LABEL_7;
  }
  v12 = [v8 createBuffer];
  v13 = ((void (**)(void, id))v12)[2](v12, v9);

  do
  {
    uLong total_out = v26.total_out;
    if (total_out >= [v13 length])
    {
      v15 = [v8 growData];
      ((void (**)(void, id, void *))v15)[2](v15, v9, v13);
    }
    id v16 = v13;
    uint64_t v17 = [v16 mutableBytes];
    v26.next_out = (Bytef *)(v17 + v26.total_out);
    int v18 = [v16 length];
    v26.avail_out = v18 - LODWORD(v26.total_out);
    if ([v8 decompressAllAtOnce]) {
      int v19 = 4;
    }
    else {
      int v19 = 2;
    }
    unsigned int v20 = inflate(&v26, v19);
  }
  while (!v20);
  if (v20 != 1)
  {
    if (a5)
    {
      ErrorForCode((uint64_t)&v26, v20, 0);
      id v23 = objc_claimAutoreleasedReturnValue();
      *a5 = v23;
      int v24 = inflateEnd(&v26);
      if (v24)
      {
        unsigned int v22 = v24;
        goto LABEL_22;
      }
    }
    else
    {
      inflateEnd(&v26);
      id v23 = 0;
    }
    v11 = 0;
    goto LABEL_26;
  }
  int v21 = inflateEnd(&v26);
  if (!v21)
  {
    [v16 setLength:v26.total_out];
    v11 = [MEMORY[0x1E4F1C9B8] dataWithData:v16];
    id v23 = 0;
    goto LABEL_26;
  }
  unsigned int v22 = v21;
  id v23 = 0;
  v11 = 0;
  if (!a5) {
    goto LABEL_26;
  }
LABEL_22:
  ErrorForCode((uint64_t)&v26, v22, v23);
  v11 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

LABEL_27:

  return v11;
}

+ (id)compressData:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v8 = +[PFZlibDataCompressionOptions defaultOptions];
  }
  id v9 = v7;
  unsigned int v10 = v9;
  if ([v9 length])
  {
    memset(&v22.total_out, 0, 72);
    id v11 = v9;
    v22.avail_in = objc_msgSend(v11, "length", objc_msgSend(v11, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
    unsigned int v12 = deflateInit2_(&v22, [v8 compressionLevel], 8, objc_msgSend(v8, "windowBits"), objc_msgSend(v8, "memoryLevel"), objc_msgSend(v8, "strategy"), "1.2.12", 112);
    if (v12)
    {
      if (a5)
      {
        ErrorForCode((uint64_t)&v22, v12, 0);
        unsigned int v10 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unsigned int v10 = 0;
      }
      id v19 = v11;
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", (int)objc_msgSend(v8, "chunkSize"));
      while (1)
      {
        uLong total_out = v22.total_out;
        if (total_out >= [v13 length]) {
          objc_msgSend(v13, "increaseLengthBy:", (int)objc_msgSend(v8, "chunkSize"));
        }
        id v15 = v13;
        uint64_t v16 = [v15 mutableBytes];
        v22.next_out = (Bytef *)(v16 + v22.total_out);
        int v17 = [v15 length];
        v22.avail_out = v17 - LODWORD(v22.total_out);
        unsigned int v18 = deflate(&v22, 4);
        if (v18 >= 2) {
          break;
        }
        if (v22.avail_out) {
          goto LABEL_17;
        }
      }
      if (a5)
      {
        ErrorForCode((uint64_t)&v22, v18, 0);
        id v19 = objc_claimAutoreleasedReturnValue();
        *a5 = v19;
        goto LABEL_18;
      }
LABEL_17:
      id v19 = 0;
LABEL_18:
      unsigned int v20 = deflateEnd(&v22);
      if (a5 && v20)
      {
        ErrorForCode((uint64_t)&v22, v20, v19);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      [v15 setLength:v22.total_out];
      unsigned int v10 = [MEMORY[0x1E4F1C9B8] dataWithData:v15];
    }
  }

  return v10;
}

- (PFZlibDataCompression)init
{
  return 0;
}

@end