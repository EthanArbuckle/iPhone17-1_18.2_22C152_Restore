@interface NSString(QRCode)
- (id)darkQRCode;
- (id)lightQRCode;
@end

@implementation NSString(QRCode)

- (id)lightQRCode
{
  v1 = [a1 dataUsingEncoding:4];
  v2 = [MEMORY[0x263F00640] filterWithName:@"CIQRCodeGenerator"];
  [v2 setValue:v1 forKey:@"inputMessage"];
  v3 = [v2 outputImage];
  [v3 extent];
  CGFloat Width = CGRectGetWidth(v9);
  CGAffineTransformMakeScale(&v7, 256.0 / Width, 256.0 / Width);
  v5 = [v3 imageByApplyingTransform:&v7];

  return v5;
}

- (id)darkQRCode
{
  v1 = [a1 lightQRCode];
  if (v1)
  {
    v2 = [MEMORY[0x263F00640] filterWithName:@"CIColorInvert"];
    uint64_t v3 = *MEMORY[0x263F00968];
    [v2 setValue:v1 forKey:*MEMORY[0x263F00968]];
    if (objc_opt_respondsToSelector()) {
      [v2 outputImage];
    }
    else {
    v5 = [0 valueForKey:*MEMORY[0x263F009D0]];
    }
    if (v5)
    {
      v6 = [MEMORY[0x263F00640] filterWithName:@"CIMaskToAlpha"];
      [v6 setValue:v5 forKey:v3];
      if (objc_opt_respondsToSelector()) {
        [v6 outputImage];
      }
      else {
      uint64_t v7 = [v6 valueForKey:*MEMORY[0x263F009D0]];
      }
      v8 = (void *)v7;
      if (v7) {
        CGRect v9 = (void *)v7;
      }
      else {
        CGRect v9 = v1;
      }
      id v4 = v9;
    }
    else
    {
      id v4 = v1;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end