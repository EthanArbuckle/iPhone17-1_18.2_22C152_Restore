@interface UniFakeImage
+ (id)imageWithCIImage:(id)a3 format:(unint64_t)a4;
- (NSNumber)fakeFormat;
- (UniFakeImage)initWithCIImage:(id)a3 format:(unint64_t)a4;
- (void)setFakeFormat:(id)a3;
@end

@implementation UniFakeImage

- (UniFakeImage)initWithCIImage:(id)a3 format:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)UniFakeImage;
  v6 = [(UniImage *)&v10 initWithCIImage:a3];
  if (v6)
  {
    v7 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v5, a4);
    objc_msgSend_setFakeFormat_(v6, v8, (uint64_t)v7);
  }
  return v6;
}

+ (id)imageWithCIImage:(id)a3 format:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend_initWithCIImage_format_(v6, v7, (uint64_t)v5, a4);

  return v8;
}

- (NSNumber)fakeFormat
{
  return self->fakeFormat;
}

- (void)setFakeFormat:(id)a3
{
}

- (void).cxx_destruct
{
}

@end