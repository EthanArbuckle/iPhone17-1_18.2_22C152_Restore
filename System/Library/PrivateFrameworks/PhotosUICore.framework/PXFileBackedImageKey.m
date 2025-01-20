@interface PXFileBackedImageKey
- (BOOL)isEqual:(id)a3;
- (BOOL)preferHDR;
- (CGSize)size;
- (NSURL)url;
- (PXFileBackedImageKey)initWithUrl:(id)a3 size:(CGSize)a4 preferHDR:(BOOL)a5;
- (unint64_t)hash;
@end

@implementation PXFileBackedImageKey

- (void).cxx_destruct
{
}

- (BOOL)preferHDR
{
  return self->_preferHDR;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  if ([(NSURL *)self->_url isEqual:*((void *)v4 + 2)]) {
    BOOL v5 = self->_size.height == v4[4] && self->_size.width == v4[3];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
}

- (PXFileBackedImageKey)initWithUrl:(id)a3 size:(CGSize)a4 preferHDR:(BOOL)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXFileBackedImageKey;
  v10 = [(PXFileBackedImageKey *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    url = v10->_url;
    v10->_url = (NSURL *)v11;

    v10->_size.CGFloat width = width;
    v10->_size.CGFloat height = height;
    v10->_preferHDR = a5;
  }

  return v10;
}

@end