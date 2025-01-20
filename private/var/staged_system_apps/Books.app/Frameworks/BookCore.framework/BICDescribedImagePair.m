@interface BICDescribedImagePair
- (BICDescribedImage)destinationImage;
- (BICDescribedImage)request;
- (BICDescribedImage)sourceImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDescribedImagePair:(id)a3;
- (void)setDestinationImage:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSourceImage:(id)a3;
@end

@implementation BICDescribedImagePair

- (BOOL)isEqualToDescribedImagePair:(id)a3
{
  id v4 = a3;
  v5 = [v4 sourceImage];
  v6 = [(BICDescribedImagePair *)self sourceImage];
  if ([v5 isEqual:v6])
  {
    v7 = [v4 destinationImage];
    v8 = [(BICDescribedImagePair *)self destinationImage];
    unsigned __int8 v9 = [v7 isEqual:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BICDescribedImagePair *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(BICDescribedImagePair *)self isEqualToDescribedImagePair:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BICDescribedImage)sourceImage
{
  return self->_sourceImage;
}

- (void)setSourceImage:(id)a3
{
}

- (BICDescribedImage)destinationImage
{
  return self->_destinationImage;
}

- (void)setDestinationImage:(id)a3
{
}

- (BICDescribedImage)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_destinationImage, 0);

  objc_storeStrong((id *)&self->_sourceImage, 0);
}

@end