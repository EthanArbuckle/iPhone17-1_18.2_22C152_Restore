@interface STSReaderCryptarch
- (NSData)privateKey;
- (STSReaderCryptarch)initWithCurve:(unint64_t)a3 variant:(unint64_t)a4 privateKey:(id)a5;
- (unint64_t)curve;
- (unint64_t)variant;
@end

@implementation STSReaderCryptarch

- (STSReaderCryptarch)initWithCurve:(unint64_t)a3 variant:(unint64_t)a4 privateKey:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)STSReaderCryptarch;
  v10 = [(STSReaderCryptarch *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_curve = a3;
    v10->_variant = a4;
    objc_storeStrong((id *)&v10->_privateKey, a5);
  }

  return v11;
}

- (unint64_t)curve
{
  return self->_curve;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (NSData)privateKey
{
  return self->_privateKey;
}

- (void).cxx_destruct
{
}

@end