@interface MFPHatchBrush
+ (id)bitmapNameForHatchStyle:(int)a3;
- (MFPHatchBrush)initWithHatchStyle:(int)a3 foreColor:(id)a4 backColor:(id)a5;
@end

@implementation MFPHatchBrush

+ (id)bitmapNameForHatchStyle:(int)a3
{
  if (a3 > 0x34) {
    return 0;
  }
  else {
    return (id)*((void *)&off_264D67228 + a3);
  }
}

- (MFPHatchBrush)initWithHatchStyle:(int)a3 foreColor:(id)a4 backColor:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[MFPHatchBrush bitmapNameForHatchStyle:v6];
  if (v10)
  {
    v11 = +[TCBundleResourceManager instance];
    v12 = [v11 dataForResource:v10 ofType:@"bmp" inPackage:@"OAPatterns" cacheResult:1];
  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)[v12 mutableCopy];
  if (v13)
  {
    v14 = [[OITSUImage alloc] initWithData:v13];
    if (v14)
    {
      v16.receiver = self;
      v16.super_class = (Class)MFPHatchBrush;
      self = [(MFPImageBrush *)&v16 initWithPhoneImage:v14];
    }
  }
  return self;
}

@end