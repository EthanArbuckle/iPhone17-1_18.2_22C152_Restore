@interface NUANFImageResolver
+ (id)imageResourceResponseForFileURL:(id)a3 perserveColorSpace:(BOOL)a4 withSize:(CGSize)a5 andQuality:(unint64_t)a6;
@end

@implementation NUANFImageResolver

+ (id)imageResourceResponseForFileURL:(id)a3 perserveColorSpace:(BOOL)a4 withSize:(CGSize)a5 andQuality:(unint64_t)a6
{
  double height = a5.height;
  double width = a5.width;
  v9 = (void *)MEMORY[0x263EFF8F8];
  id v10 = a3;
  v11 = [v9 dataWithContentsOfURL:v10];
  v12 = [MEMORY[0x263F6C610] sharedInstance];
  int v13 = [v12 dataIsAnimatedImage:v11];

  v14 = [MEMORY[0x263F6C610] sharedInstance];
  v15 = v14;
  if (v13)
  {
    v16 = objc_msgSend(v14, "loadAnimatedImageFromImageData:size:", v11, width, height);

    id v17 = objc_alloc_init(MEMORY[0x263F6C5E0]);
    [v17 setAnimatedImage:v16];
  }
  else
  {
    v16 = objc_msgSend(v14, "imageFromData:size:", v11, width, height);

    id v17 = objc_alloc_init(MEMORY[0x263F6C618]);
    [v17 setImage:v16];
  }
  [v17 setFileURL:v10];

  [v17 setImageQuality:a6];

  return v17;
}

@end