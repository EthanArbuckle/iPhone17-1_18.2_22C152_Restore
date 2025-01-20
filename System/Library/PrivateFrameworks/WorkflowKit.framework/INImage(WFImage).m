@interface INImage(WFImage)
+ (id)imageWithWFImage:()WFImage;
- (id)wf_image;
@end

@implementation INImage(WFImage)

- (id)wf_image
{
  if ([a1 _isSystem])
  {
    v2 = (void *)MEMORY[0x1E4FB4770];
    v3 = [a1 _name];
    v4 = [v2 glyphNamed:v3 pointSize:17.0];

    v5 = [MEMORY[0x1E4F5A7A0] sharedContext];
    uint64_t v6 = [v5 userInterfaceStyle];

    if (v6 == 2)
    {
      v7 = [MEMORY[0x1E4FB45E0] colorWithWhite:1.0 alpha:1.0];
      uint64_t v8 = [v4 imageWithTintColor:v7];

      v4 = (void *)v8;
    }
  }
  else
  {
    uint64_t v9 = [a1 _imageData];
    if (!v9)
    {
      v4 = 0;
      goto LABEL_12;
    }
    v10 = (void *)v9;
    v4 = [MEMORY[0x1E4FB4770] imageWithDeviceScreenScaleImageData:v9];

    if (!v4) {
      goto LABEL_12;
    }
  }
  uint64_t v11 = [a1 _renderingMode];
  if (v11 == 2) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = v11 == 1;
  }
  if (v12 != [v4 renderingMode])
  {
    uint64_t v13 = [v4 imageWithRenderingMode:v12];

    v4 = (void *)v13;
  }
LABEL_12:
  return v4;
}

+ (id)imageWithWFImage:()WFImage
{
  id v4 = a3;
  v5 = [v4 PNGRepresentation];
  uint64_t v6 = [a1 imageWithImageData:v5];

  [v4 sizeInPoints];
  double v8 = v7;
  [v4 sizeInPoints];
  [v6 _setImageSize:v8];
  uint64_t v9 = [v4 renderingMode];

  if (v9 == 2) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = v9 == 1;
  }
  [v6 _setRenderingMode:v10];
  return v6;
}

@end