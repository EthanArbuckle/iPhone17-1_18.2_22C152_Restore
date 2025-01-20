@interface MBDigestSHA256
- (MBDigestSHA256)init;
- (id)final;
- (void)finalWithBytes:(void *)a3 length:(unint64_t)a4;
- (void)updateWithBytes:(const void *)a3 length:(unint64_t)a4;
@end

@implementation MBDigestSHA256

- (MBDigestSHA256)init
{
  v5.receiver = self;
  v5.super_class = (Class)MBDigestSHA256;
  v2 = [(MBDigestSHA256 *)&v5 init];
  v3 = v2;
  if (v2) {
    CC_SHA256_Init(&v2->_context);
  }
  return v3;
}

- (void)updateWithBytes:(const void *)a3 length:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v6 = 0;
    p_context = &self->_context;
    unint64_t v8 = a4;
    do
    {
      unint64_t v9 = v8 - 0x4000;
      if (v8 >= 0x4000) {
        CC_LONG v10 = 0x4000;
      }
      else {
        CC_LONG v10 = v8;
      }
      CC_SHA256_Update(p_context, (char *)a3 + v6, v10);
      v6 += 0x4000;
      unint64_t v8 = v9;
    }
    while (v6 < a4);
  }
}

- (void)finalWithBytes:(void *)a3 length:(unint64_t)a4
{
  if (a4 != 32) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBDigest.m", 327, @"Incorrect SHA256 digest length");
  }
  CC_SHA256_Final((unsigned __int8 *)a3, &self->_context);
}

- (id)final
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(MBDigestSHA256 *)self finalWithBytes:v3 length:32];
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:32];
}

@end