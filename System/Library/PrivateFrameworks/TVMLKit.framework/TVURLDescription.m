@interface TVURLDescription
- (BOOL)centerGrowth;
- (CGSize)imageSize;
- (NSString)cropCode;
- (NSString)url;
- (NSString)urlFormat;
- (double)focusSizeIncrease;
- (id)initUrlWithProperties:(id)a3 imageSize:(CGSize)a4 focusSizeIncrease:(double)a5 cropCode:(id)a6 urlFormat:(id)a7;
- (void)setCenterGrowth:(BOOL)a3;
- (void)setCropCode:(id)a3;
- (void)setFocusSizeIncrease:(double)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setUrl:(id)a3;
- (void)setUrlFormat:(id)a3;
@end

@implementation TVURLDescription

- (id)initUrlWithProperties:(id)a3 imageSize:(CGSize)a4 focusSizeIncrease:(double)a5 cropCode:(id)a6 urlFormat:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)TVURLDescription;
  v16 = [(TVURLDescription *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(TVURLDescription *)v16 setUrl:v13];
    -[TVURLDescription setImageSize:](v17, "setImageSize:", width, height);
    [(TVURLDescription *)v17 setFocusSizeIncrease:a5];
    [(TVURLDescription *)v17 setCropCode:v14];
    [(TVURLDescription *)v17 setUrlFormat:v15];
  }

  return v17;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (double)focusSizeIncrease
{
  return self->_focusSizeIncrease;
}

- (void)setFocusSizeIncrease:(double)a3
{
  self->_focusSizeIncrease = a3;
}

- (NSString)cropCode
{
  return self->_cropCode;
}

- (void)setCropCode:(id)a3
{
}

- (NSString)urlFormat
{
  return self->_urlFormat;
}

- (void)setUrlFormat:(id)a3
{
}

- (BOOL)centerGrowth
{
  return self->_centerGrowth;
}

- (void)setCenterGrowth:(BOOL)a3
{
  self->_centerGrowth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlFormat, 0);
  objc_storeStrong((id *)&self->_cropCode, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end