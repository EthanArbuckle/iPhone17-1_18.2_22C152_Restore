@interface NSData
+ (id)MZStringByMD5HashingString:(id)a3;
+ (id)MZStringFromDigestData:(id)a3;
- (id)MZDataByDeflatingWithGZip;
- (id)MZDataByDeflatingWithNoZipHeader;
- (id)MZDataByInflatingWithGZip;
- (id)MZDataByInflatingWithNoZipHeader;
- (id)_MZDataByDeflatingWithCompression:(unint64_t)a3;
- (id)_MZDataByInflating;
@end

@implementation NSData

- (id)_MZDataByInflating
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

- (id)_MZDataByDeflatingWithCompression:(unint64_t)a3
{
  unsigned int v4 = self;
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

+ (id)MZStringFromDigestData:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 length];
  id v5 = v3;
  v6 = (unsigned __int8 *)[v5 bytes];
  v7 = +[NSMutableString stringWithCapacity:2 * v4];
  if (v4)
  {
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      [v7 appendFormat:@"%02x" v6[v8]];
      uint64_t v8 = v9;
    }
    while (v4 > v9++);
  }

  return v7;
}

+ (id)MZStringByMD5HashingString:(id)a3
{
  unint64_t v4 = [a3 dataUsingEncoding:4];
  if ([v4 length])
  {
    memset(&v13, 0, sizeof(v13));
    if (CC_MD5_Init(&v13))
    {
      id v5 = v4;
      v6 = (char *)[v5 bytes];
      unint64_t v7 = 0;
      while (1)
      {
        uint64_t v8 = (char *)[v5 length];
        uint64_t v9 = (unint64_t)&v8[-v7] >= 0xFFFF ? 0xFFFFLL : (uint64_t)&v8[-v7];
        if (!CC_MD5_Update(&v13, &v6[v7], v9)) {
          break;
        }
        v7 += v9;
        if (v7 >= (unint64_t)[v5 length])
        {
          if (!CC_MD5_Final(md, &v13)) {
            break;
          }
          int v10 = +[NSData dataWithBytes:md length:16];
          int v11 = [a1 MZStringFromDigestData:v10];

          goto LABEL_12;
        }
      }
    }
  }
  int v11 = 0;
LABEL_12:

  return v11;
}

- (id)MZDataByInflatingWithNoZipHeader
{
  return [(NSData *)self _MZDataByInflating];
}

- (id)MZDataByDeflatingWithNoZipHeader
{
  return [(NSData *)self _MZDataByDeflatingWithCompression:2];
}

- (id)MZDataByInflatingWithGZip
{
  return [(NSData *)self _MZDataByInflating];
}

- (id)MZDataByDeflatingWithGZip
{
  return [(NSData *)self _MZDataByDeflatingWithCompression:2];
}

@end