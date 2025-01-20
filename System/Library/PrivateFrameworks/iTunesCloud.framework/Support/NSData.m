@interface NSData
+ (id)mappedDataWithContentsOfTemporaryFileURL:(id)a3 error:(id *)a4;
+ (id)stringByMD5HashingString:(id)a3;
+ (id)stringFromDigestData:(id)a3;
- (id)_dataByDeflatingWithNoZipHeaderWithCompression:(unint64_t)a3;
- (id)_dataByInflatingWithNoZipHeader;
- (id)dataByDeflatingWithNoZipHeader;
- (id)dataByInflatingWithNoZipHeader;
@end

@implementation NSData

- (id)_dataByDeflatingWithNoZipHeaderWithCompression:(unint64_t)a3
{
  v4 = self;
  if ([(NSData *)v4 length] >= 0xFFFFFFFF)
  {
    NSLog(@"ERROR: unable to zip large data of size ~%.3f GB", (double)[(NSData *)v4 length] / 1000000000.0);
    id v5 = 0;
    goto LABEL_23;
  }
  v6 = v4;
  v7 = [(NSData *)v6 bytes];
  uInt v8 = [(NSData *)v6 length];
  id v9 = [objc_alloc((Class)NSMutableData) initWithCapacity:(v8 >> 1) + 1];
  id v5 = 0;
  if (v7 && v8)
  {
    memset(&strm, 0, sizeof(strm));
    if (a3 == 1) {
      int v10 = 1;
    }
    else {
      int v10 = -1;
    }
    strm.avail_out = 0x4000;
    if (a3 == 2) {
      int v11 = 9;
    }
    else {
      int v11 = v10;
    }
    strm.next_out = v19;
    if (deflateInit2_(&strm, v11, 8, -15, 9, 0, "1.2.12", 112))
    {
      NSLog(@"deflateInit2() failed: %s", strm.msg);
    }
    else
    {
      strm.avail_in = v8;
      strm.next_in = v7;
      do
      {
        if (!strm.avail_out)
        {
          [v9 appendBytes:v19 length:0x4000];
          strm.avail_out = 0x4000;
          strm.next_out = v19;
        }
        int v12 = deflate(&strm, 0);
      }
      while (!v12 && strm.avail_in);
      if (!v12)
      {
        if (strm.next_out)
        {
          do
          {
            int v14 = deflate(&strm, 4);
            next_out = strm.next_out;
            [v9 appendBytes:v19 length:strm.next_out - v19];
            BOOL v16 = next_out > v19 && v14 == -5;
            strm.avail_out = 0x4000;
            strm.next_out = v19;
          }
          while (v16 || v14 == 0);
          strm.avail_out = 0;
          strm.next_out = 0;
          deflateEnd(&strm);
          if (v14 != -5 && v14 != 1)
          {
            NSLog(@"deflate() failed: %s", strm.msg);
            goto LABEL_21;
          }
        }
        else
        {
          deflateEnd(&strm);
        }
        id v5 = v9;
        goto LABEL_22;
      }
      NSLog(@"deflate() failed: %s", strm.msg);
    }
    deflateEnd(&strm);
LABEL_21:
    id v5 = 0;
  }
LABEL_22:

LABEL_23:

  return v5;
}

- (id)_dataByInflatingWithNoZipHeader
{
  v2 = self;
  if ([(NSData *)v2 length] >> 32)
  {
    NSLog(@"ERROR: unable to zip large data of size ~%.3f GB", (double)[(NSData *)v2 length] / 1000000000.0);
LABEL_3:
    id v3 = 0;
    goto LABEL_11;
  }
  memset(&strm.avail_in, 0, 104);
  strm.avail_in = [(NSData *)v2 length];
  strm.next_in = (Bytef *)[(NSData *)v2 bytes];
  id v3 = 0;
  if (!inflateInit2_(&strm, -15, "1.2.12", 112))
  {
    id v3 = objc_alloc_init((Class)NSMutableData);
    while (1)
    {
      strm.avail_out = 0x4000;
      strm.next_out = v8;
      unsigned int v4 = inflate(&strm, 0);
      if (v4 > 1) {
        break;
      }
      unsigned int v5 = v4;
      if (strm.avail_out != 0x4000) {
        [v3 appendBytes:v8 length:0x4000 - strm.avail_out];
      }
      if (v5)
      {
        inflateEnd(&strm);
        goto LABEL_11;
      }
    }
    inflateEnd(&strm);

    goto LABEL_3;
  }
LABEL_11:

  return v3;
}

- (id)dataByDeflatingWithNoZipHeader
{
  return [(NSData *)self _dataByDeflatingWithNoZipHeaderWithCompression:2];
}

- (id)dataByInflatingWithNoZipHeader
{
  return [(NSData *)self _dataByInflatingWithNoZipHeader];
}

+ (id)stringByMD5HashingString:(id)a3
{
  id v3 = a3;
  memset(v56, 0, sizeof(v56));
  CC_MD5_Init((CC_MD5_CTX *)v56);
  id v4 = v3;
  CC_MD5_Update((CC_MD5_CTX *)v56, [v4 UTF8String], (CC_LONG)objc_msgSend(v4, "length"));

  memset(&v57[8], 0, 64);
  *(void *)v57 = 4000;
  CC_MD5_Final(&v57[8], (CC_MD5_CTX *)v56);
  v58[0] = *(_OWORD *)v57;
  v58[1] = *(_OWORD *)&v57[16];
  v58[2] = *(_OWORD *)&v57[32];
  v58[3] = *(_OWORD *)&v57[48];
  uint64_t v59 = *(void *)&v57[64];
  if (*(uint64_t *)v57 > 3999)
  {
    if (*(uint64_t *)v57 > 4255)
    {
      if (*(void *)v57 == 4256)
      {
        v46 = (unsigned __int8 *)v58 + 8;
        v47 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v48 = v47;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v50 = *v46++;
          v51 = &v47[i];
          char *v51 = a0123456789abcd[(unint64_t)v50 >> 4];
          v51[1] = a0123456789abcd[v50 & 0xF];
        }
        id v17 = objc_alloc((Class)NSString);
        v18 = v48;
        uint64_t v19 = 64;
      }
      else
      {
        if (*(void *)v57 != 4512) {
          goto LABEL_50;
        }
        v24 = (unsigned __int8 *)v58 + 8;
        v25 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v26 = v25;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v28 = *v24++;
          v29 = &v25[j];
          char *v29 = a0123456789abcd[(unint64_t)v28 >> 4];
          v29[1] = a0123456789abcd[v28 & 0xF];
        }
        id v17 = objc_alloc((Class)NSString);
        v18 = v26;
        uint64_t v19 = 128;
      }
    }
    else if (*(void *)v57 == 4000)
    {
      v36 = (unsigned __int8 *)v58 + 8;
      v37 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v38 = v37;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v40 = *v36++;
        v41 = &v37[k];
        char *v41 = a0123456789abcd[(unint64_t)v40 >> 4];
        v41[1] = a0123456789abcd[v40 & 0xF];
      }
      id v17 = objc_alloc((Class)NSString);
      v18 = v38;
      uint64_t v19 = 32;
    }
    else
    {
      if (*(void *)v57 != 4001) {
        goto LABEL_50;
      }
      int v11 = (unsigned __int8 *)v58 + 8;
      int v12 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v13 = v12;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v15 = *v11++;
        BOOL v16 = &v12[m];
        *BOOL v16 = a0123456789abcd[(unint64_t)v15 >> 4];
        v16[1] = a0123456789abcd[v15 & 0xF];
      }
      id v17 = objc_alloc((Class)NSString);
      v18 = v13;
      uint64_t v19 = 40;
    }
LABEL_45:
    CFStringRef v35 = (CFStringRef)objc_msgSend(v17, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v18, v19, 4, 1, 4000, *(void *)v56);
    goto LABEL_46;
  }
  if (*(uint64_t *)v57 > 2999)
  {
    if (*(void *)v57 == 3000)
    {
      LODWORD(v60[0]) = bswap32(DWORD2(v58[0]));
      v42 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v43 = 0;
      v44 = v42 + 1;
      do
      {
        unint64_t v45 = *((unsigned __int8 *)v60 + v43);
        *(v44 - 1) = a0123456789abcd[v45 >> 4];
        unsigned char *v44 = a0123456789abcd[v45 & 0xF];
        v44 += 2;
        ++v43;
      }
      while (v43 != 4);
      id v17 = objc_alloc((Class)NSString);
      v18 = v42;
      uint64_t v19 = 8;
    }
    else
    {
      if (*(void *)v57 != 3001) {
        goto LABEL_50;
      }
      v60[0] = bswap64(*((unint64_t *)&v58[0] + 1));
      v20 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v21 = 0;
      v22 = v20 + 1;
      do
      {
        unint64_t v23 = *((unsigned __int8 *)v60 + v21);
        *(v22 - 1) = a0123456789abcd[v23 >> 4];
        unsigned char *v22 = a0123456789abcd[v23 & 0xF];
        v22 += 2;
        ++v21;
      }
      while (v21 != 8);
      id v17 = objc_alloc((Class)NSString);
      v18 = v20;
      uint64_t v19 = 16;
    }
    goto LABEL_45;
  }
  if (*(void *)v57 == 1000)
  {
    uint64_t v30 = *((void *)&v58[0] + 1);
    v31 = (char *)&v61 + 1;
    uint64_t quot = *((void *)&v58[0] + 1);
    do
    {
      lldiv_t v33 = lldiv(quot, 10);
      uint64_t quot = v33.quot;
      if (v33.rem >= 0) {
        LOBYTE(v34) = v33.rem;
      }
      else {
        uint64_t v34 = -v33.rem;
      }
      *(v31 - 2) = v34 + 48;
      int v10 = (const UInt8 *)(v31 - 2);
      --v31;
    }
    while (v33.quot);
    if (v30 < 0)
    {
      *(v31 - 2) = 45;
      int v10 = (const UInt8 *)(v31 - 2);
    }
    id v9 = (char *)((char *)&v61 - (char *)v10);
    goto LABEL_35;
  }
  if (*(void *)v57 == 2000)
  {
    uint64_t v5 = DWORD2(v58[0]);
    v6 = &v61;
    do
    {
      ldiv_t v7 = ldiv(v5, 10);
      uint64_t v5 = v7.quot;
      if (v7.rem >= 0) {
        LOBYTE(v8) = v7.rem;
      }
      else {
        uint64_t v8 = -v7.rem;
      }
      *((unsigned char *)v6 - 1) = v8 + 48;
      v6 = (uint64_t *)((char *)v6 - 1);
    }
    while (v7.quot);
    id v9 = (char *)((char *)&v61 - (char *)v6);
    int v10 = (const UInt8 *)v6;
LABEL_35:
    CFStringRef v35 = CFStringCreateWithBytes(0, v10, (CFIndex)v9, 0x8000100u, 0);
LABEL_46:
    v52 = (__CFString *)v35;
    goto LABEL_47;
  }
LABEL_50:
  v54 = +[NSAssertionHandler currentHandler];
  v55 = +[NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
  [v54 handleFailureInFunction:v55 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

  v52 = &stru_1001BF9F0;
LABEL_47:

  return v52;
}

+ (id)stringFromDigestData:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 bytes];
  uint64_t v5 = (uint64_t)[v3 length];
  uint64_t v6 = 2 * v5;
  ldiv_t v7 = (char *)malloc_type_calloc(2 * v5, 1uLL, 0x100004077774924uLL);
  if (v5 >= 1)
  {
    uint64_t v8 = v7 + 1;
    do
    {
      *(v8 - 1) = a0123456789abcd[(unint64_t)*v4 >> 4];
      char v9 = *v4++;
      *uint64_t v8 = a0123456789abcd[v9 & 0xF];
      v8 += 2;
      --v5;
    }
    while (v5);
  }
  id v10 = [objc_alloc((Class)NSString) initWithBytesNoCopy:v7 length:v6 encoding:4 freeWhenDone:1];

  return v10;
}

+ (id)mappedDataWithContentsOfTemporaryFileURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = +[NSData dataWithContentsOfURL:v5 options:1 error:a4];
  ldiv_t v7 = [[ICDDeleteOnDeallocTemporaryFile alloc] initWithTemporaryFileURL:v5];

  if (v7) {
    objc_setAssociatedObject(v6, @"_NSDataCloudAdditionsTemporaryFileKey", v7, (void *)1);
  }

  return v6;
}

@end