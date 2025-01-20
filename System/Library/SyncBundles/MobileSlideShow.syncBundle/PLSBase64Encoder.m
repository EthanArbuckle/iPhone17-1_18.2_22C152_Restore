@interface PLSBase64Encoder
+ (id)encoder;
+ (id)encoderForPhotoUUID;
- (PLSBase64Encoder)init;
- (id)encodeData:(id)a3;
- (id)initForPhotoUUID;
@end

@implementation PLSBase64Encoder

- (id)encodeData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 length];
  id v6 = +[NSMutableData dataWithLength:4 * (uint64_t)v5 / 3uLL + 3];
  v7 = [v6 mutableBytes];
  id v8 = v4;
  v9 = (unsigned __int8 *)[v8 bytes];
  if (v5)
  {
    int v10 = 0;
    LODWORD(v11) = 0;
    int v12 = 0;
    do
    {
      unsigned __int8 v14 = *v9++;
      unsigned __int8 v13 = v14;
      unint64_t v15 = v14 | (v11 << 8);
      if (++v12 == 3)
      {
        int v12 = 0;
        unint64_t v16 = (v11 << 8);
        v17 = &v7[v10];
        unsigned char *v17 = aAbcdefghijklmn[(v16 >> 18) & 0x3F];
        v17[1] = aAbcdefghijklmn[(v16 >> 12) & 0x3F];
        v17[2] = aAbcdefghijklmn[(v15 >> 6) & 0x3F];
        v10 += 4;
        v17[3] = aAbcdefghijklmn[v13 & 0x3F];
        unint64_t v11 = 0;
      }
      else
      {
        unint64_t v11 = v15;
      }
      id v5 = (char *)v5 - 1;
    }
    while (v5);
    if (v12 == 2)
    {
      v19 = &v7[v10];
      unsigned char *v19 = aAbcdefghijklmn[(unsigned __int16)v11 >> 10];
      v19[1] = aAbcdefghijklmn[(v11 >> 4) & 0x3F];
      LODWORD(v5) = v10 + 3;
      v19[2] = aAbcdefghijklmn[4 * (v11 & 0xF)];
      if (self->_photoUUID) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
    if (v12 == 1)
    {
      v18 = &v7[v10];
      unsigned char *v18 = aAbcdefghijklmn[v11 >> 2];
      v18[1] = aAbcdefghijklmn[16 * (v11 & 3)];
      LODWORD(v5) = v10 + 2;
      if (self->_photoUUID) {
        goto LABEL_14;
      }
      LODWORD(v5) = v10 + 3;
      v7[v10 + 2] = 61;
LABEL_12:
      v7[(int)v5] = 61;
      LODWORD(v5) = v10 + 4;
      goto LABEL_14;
    }
    LODWORD(v5) = v10;
  }
LABEL_14:
  id v20 = [objc_alloc((Class)NSString) initWithBytes:v7 length:(int)v5 encoding:1];

  return v20;
}

- (id)initForPhotoUUID
{
  v3.receiver = self;
  v3.super_class = (Class)PLSBase64Encoder;
  id result = [(PLSBase64Encoder *)&v3 init];
  if (result) {
    *((unsigned char *)result + 8) = 1;
  }
  return result;
}

- (PLSBase64Encoder)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLSBase64Encoder;
  id result = [(PLSBase64Encoder *)&v3 init];
  if (result) {
    result->_photoUUID = 0;
  }
  return result;
}

+ (id)encoderForPhotoUUID
{
  id v2 = [[PLSBase64Encoder alloc] initForPhotoUUID];

  return v2;
}

+ (id)encoder
{
  id v2 = objc_alloc_init(PLSBase64Encoder);

  return v2;
}

@end