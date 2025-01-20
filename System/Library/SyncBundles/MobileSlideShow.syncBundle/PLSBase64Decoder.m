@interface PLSBase64Decoder
+ (id)decoder;
+ (id)decoderForPhotoUUID;
- (PLSBase64Decoder)init;
- (id)decodeString:(id)a3;
- (id)initForPhotoUUID;
@end

@implementation PLSBase64Decoder

- (id)decodeString:(id)a3
{
  id v4 = a3;
  v5 = (char *)[v4 lengthOfBytesUsingEncoding:1];
  id v6 = [v4 dataUsingEncoding:1];
  id v7 = [v6 bytes];
  v8 = (char *)malloc_type_malloc((size_t)v5, 0x44B4CAFEuLL);
  v9 = v8;
  if (!v5)
  {
    uint64_t v17 = 0;
    goto LABEL_28;
  }
  uint64_t v10 = 0;
  v11 = 0;
  int v12 = 0;
  unsigned int v13 = 0;
  while (1)
  {
    v13 <<= 6;
    uint64_t v14 = v11[(void)v7];
    if (v14 == 61) {
      break;
    }
    v13 |= self->_decoder[v14];
    if (++v12 == 4)
    {
      int v12 = 0;
      v15 = &v8[v10];
      char *v15 = BYTE2(v13);
      v15[1] = BYTE1(v13);
      v10 += 3;
      v15[2] = v13;
      unsigned int v13 = 0;
    }
    if (v5 == ++v11)
    {
      unsigned int v16 = 0;
      v11 = v5;
      goto LABEL_13;
    }
  }
  unsigned int v16 = 1;
  if (v11 + 1 < v5)
  {
    if (v11[(void)v7 + 1] == 61) {
      unsigned int v16 = 2;
    }
    else {
      unsigned int v16 = 1;
    }
  }
LABEL_13:
  if (v12 != 1)
  {
    unint64_t v18 = (unint64_t)&v11[v16];
    if (v12 == 3)
    {
      if (self->_photoUUID) {
        v13 <<= 6;
      }
      v20 = &v8[v10];
      char *v20 = BYTE2(v13);
      uint64_t v17 = v10 + 2;
      v20[1] = BYTE1(v13);
      if (v16 != 2) {
        goto LABEL_28;
      }
    }
    else
    {
      if (v12 != 2)
      {
        uint64_t v17 = v10;
        goto LABEL_28;
      }
      if (self->_photoUUID) {
        v13 <<= 6;
      }
      uint64_t v17 = v10 + 1;
      v8[v10] = v13 >> 10;
      if (v16 != 1)
      {
LABEL_28:
        v19 = +[NSData dataWithBytes:v8 length:v17];
        if (!v9) {
          goto LABEL_30;
        }
        goto LABEL_29;
      }
    }
    if (v18 < (unint64_t)v5) {
      goto LABEL_28;
    }
    v19 = 0;
LABEL_29:
    free(v9);
    goto LABEL_30;
  }
  v19 = 0;
  if (v8) {
    goto LABEL_29;
  }
LABEL_30:

  return v19;
}

- (id)initForPhotoUUID
{
  v4.receiver = self;
  v4.super_class = (Class)PLSBase64Decoder;
  id result = [(PLSBase64Decoder *)&v4 init];
  if (result)
  {
    uint64_t v3 = 0;
    *((unsigned char *)result + 136) = 1;
    do
    {
      *((unsigned char *)result + aAbcdefghijklmn[v3] + 8) = v3;
      ++v3;
    }
    while (v3 != 64);
  }
  return result;
}

- (PLSBase64Decoder)init
{
  v4.receiver = self;
  v4.super_class = (Class)PLSBase64Decoder;
  id result = [(PLSBase64Decoder *)&v4 init];
  if (result)
  {
    uint64_t v3 = 0;
    result->_photoUUID = 0;
    do
    {
      result->_decoder[aAbcdefghijklmn[v3]] = v3;
      ++v3;
    }
    while (v3 != 64);
  }
  return result;
}

+ (id)decoderForPhotoUUID
{
  id v2 = [[PLSBase64Decoder alloc] initForPhotoUUID];

  return v2;
}

+ (id)decoder
{
  id v2 = objc_alloc_init(PLSBase64Decoder);

  return v2;
}

@end