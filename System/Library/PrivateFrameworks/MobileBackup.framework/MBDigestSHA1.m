@interface MBDigestSHA1
- (MBDigestSHA1)init;
- (id)final;
- (void)finalWithBytes:(void *)a3 length:(unint64_t)a4;
- (void)updateWithBytes:(const void *)a3 length:(unint64_t)a4;
@end

@implementation MBDigestSHA1

- (MBDigestSHA1)init
{
  v5.receiver = self;
  v5.super_class = (Class)MBDigestSHA1;
  v2 = [(MBDigestSHA1 *)&v5 init];
  v3 = v2;
  if (v2) {
    CC_SHA1_Init(&v2->_context);
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
      CC_SHA1_Update(p_context, (char *)a3 + v6, v10);
      v6 += 0x4000;
      unint64_t v8 = v9;
    }
    while (v6 < a4);
  }
}

- (void)finalWithBytes:(void *)a3 length:(unint64_t)a4
{
  if (a4 != 20) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBDigest.m", 243, @"Incorrect SHA1 digest length");
  }
  CC_SHA1_Final((unsigned __int8 *)a3, &self->_context);
}

- (id)final
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(MBDigestSHA1 *)self finalWithBytes:v3 length:20];
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:20];
}

@end