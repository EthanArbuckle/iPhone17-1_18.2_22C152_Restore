@interface TVImageElement
- (CGSize)imageScaleToSize;
- (NSDictionary)srcset;
- (NSURL)URL;
- (int64_t)imageType;
@end

@implementation TVImageElement

- (NSURL)URL
{
  v2 = [(TVViewElement *)self element];
  v3 = [v2 url];

  return (NSURL *)v3;
}

- (NSDictionary)srcset
{
  v2 = [(TVViewElement *)self element];
  v3 = [v2 srcset];

  return (NSDictionary *)v3;
}

- (CGSize)imageScaleToSize
{
  v2 = [(TVViewElement *)self element];
  objc_msgSend(v2, "tv_imageScaleToSize");
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)imageType
{
  v2 = [(TVViewElement *)self element];
  int64_t v3 = objc_msgSend(v2, "tv_imageType");

  return v3;
}

@end