@interface NSData
+ (id)crl_dataFromDispatchData:(id)a3;
+ (id)crl_dataWithInputStream:(id)a3 error:(id *)a4;
+ (id)crl_decodeFromHexidecimalString:(id)a3;
- (id)crl_compressWithAlgorithm:(int)a3 operation:(int)a4;
- (id)crl_dispatchData;
- (id)crl_dispatchDataWithApplier:(id)a3;
- (id)crl_encodeToHexidecimalString;
@end

@implementation NSData

- (id)crl_compressWithAlgorithm:(int)a3 operation:(int)a4
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_1002D6B9C;
  v12 = &unk_1014EAB70;
  v14 = &v15;
  v5 = [[CRLStreamDataCompression alloc] initWithAlgorithm:*(void *)&a3 operation:*(void *)&a4];
  v13 = v5;
  [(NSData *)self enumerateByteRangesUsingBlock:&v9];
  if (*((unsigned char *)v16 + 24))
  {
    unsigned int v6 = [(CRLStreamCompression *)v5 didFinishProcessing];
    *((unsigned char *)v16 + 24) = v6;
    if (v6)
    {
      v7 = [(CRLStreamDataCompression *)v5 outputData];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
    *((unsigned char *)v16 + 24) = 0;
  }

  _Block_object_dispose(&v15, 8);

  return v7;
}

- (id)crl_encodeToHexidecimalString
{
  v3 = [(NSData *)self length];
  if (v3)
  {
    NSUInteger v4 = [(NSData *)self length];
    v5 = [(NSData *)self bytes];
    uint64_t v6 = 2 * v4;
    v3 = (char *)malloc_type_calloc(2 * v4, 1uLL, 0x100004077774924uLL);
    if (v3)
    {
      if (v4)
      {
        v7 = v3 + 1;
        do
        {
          unsigned int v9 = *v5++;
          char v8 = v9;
          int v10 = (v9 >> 4) + 55;
          int v11 = (v9 >> 4) | 0x30;
          if (v9 > 0x9F) {
            LOBYTE(v11) = v10;
          }
          *(v7 - 1) = v11;
          if ((v8 & 0xFu) <= 9) {
            char v12 = v8 & 0xF | 0x30;
          }
          else {
            char v12 = (v8 & 0xF) + 55;
          }
          unsigned char *v7 = v12;
          v7 += 2;
          --v4;
        }
        while (v4);
      }
      v3 = (char *)[objc_alloc((Class)NSString) initWithBytesNoCopy:v3 length:v6 encoding:1 freeWhenDone:1];
    }
  }

  return v3;
}

+ (id)crl_decodeFromHexidecimalString:(id)a3
{
  id v3 = a3;
  if (![v3 length] || (objc_msgSend(v3, "length") & 1) != 0)
  {
    id v16 = 0;
  }
  else
  {
    unint64_t v4 = (unint64_t)[v3 length];
    v5 = malloc_type_calloc(2 * v4, 1uLL, 0x100004077774924uLL);
    uint64_t v6 = v5;
    unint64_t v7 = v4 >> 1;
    if (v4 >= 2)
    {
      if (v7 <= 1) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = v4 >> 1;
      }
      uint64_t v9 = 1;
      int v10 = v5;
      do
      {
        unsigned int v11 = [v3 characterAtIndex:v9 - 1];
        if (v11 <= 0x39) {
          char v12 = 0;
        }
        else {
          char v12 = 57;
        }
        char v13 = v12 + v11;
        unsigned int v14 = [v3 characterAtIndex:v9];
        if (v14 <= 0x39) {
          char v15 = -48;
        }
        else {
          char v15 = -55;
        }
        *v10++ = v15 + v14 + 16 * v13;
        v9 += 2;
        --v8;
      }
      while (v8);
    }
    id v16 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v6 length:v7 freeWhenDone:1];
  }

  return v16;
}

+ (id)crl_dataWithInputStream:(id)a3 error:(id *)a4
{
  id v4 = a3;
  [v4 open];
  id v5 = objc_alloc_init((Class)NSMutableData);
  uint64_t v6 = (uint64_t)[v4 read:v9 maxLength:1024];
  if (v6 >= 1)
  {
    for (id i = (id)v6; (uint64_t)i > 0; id i = [v4 read:v9 maxLength:1024])
      [v5 appendBytes:v9 length:i];
  }

  return v5;
}

- (id)crl_dispatchData
{
  return [(NSData *)self crl_dispatchDataWithApplier:0];
}

- (id)crl_dispatchDataWithApplier:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_1004A4C88;
  char v18 = sub_1004A4C98;
  id v5 = &_dispatch_data_empty;
  id v19 = &_dispatch_data_empty;
  dispatch_get_global_queue(0, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1004A4CA0;
  v10[3] = &unk_1014FE598;
  v10[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v6;
  char v13 = &v14;
  id v7 = v4;
  id v12 = v7;
  [(NSData *)self enumerateByteRangesUsingBlock:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

+ (id)crl_dataFromDispatchData:(id)a3
{
  id v3 = a3;

  return v3;
}

@end