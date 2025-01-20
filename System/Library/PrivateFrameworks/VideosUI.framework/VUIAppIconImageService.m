@interface VUIAppIconImageService
+ (double)iconCornerRadiusForSize:(CGSize)a3;
+ (id)_MD5StringForString:(id)a3;
+ (id)_cachePath;
+ (id)_cachedImageForKey:(id)a3;
+ (id)_imageURLForInstallable:(id)a3 size:(CGSize)a4;
+ (id)_keyForInstallable:(id)a3 size:(CGSize)a4;
+ (void)_cacheImage:(id)a3 forKey:(id)a4;
+ (void)fetchIconForInstallable:(id)a3 size:(CGSize)a4 completion:(id)a5;
@end

@implementation VUIAppIconImageService

+ (void)fetchIconForInstallable:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  v10 = (void (**)(id, void *))a5;
  v11 = objc_msgSend(a1, "_keyForInstallable:size:", v9, width, height);
  if ([v11 length])
  {
    v12 = [a1 _cachedImageForKey:v11];
    if (v12)
    {
      v10[2](v10, v12);
    }
    else
    {
      v13 = (void *)MEMORY[0x1E4F28B48];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __66__VUIAppIconImageService_fetchIconForInstallable_size_completion___block_invoke;
      v19 = &unk_1E6DFA768;
      id v23 = a1;
      id v20 = v9;
      double v24 = width;
      double v25 = height;
      id v21 = v11;
      v22 = v10;
      v14 = [v13 blockOperationWithBlock:&v16];
      v15 = objc_msgSend(MEMORY[0x1E4F28F08], "wlkDefaultQueue", v16, v17, v18, v19);
      [v15 addOperation:v14];
    }
  }
  else
  {
    v10[2](v10, 0);
  }
}

void __66__VUIAppIconImageService_fetchIconForInstallable_size_completion___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 scale];
  double v4 = v3;

  v5 = objc_msgSend(*(id *)(a1 + 56), "_imageURLForInstallable:size:", *(void *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72));
  NSLog(&cfstr_Vuiappiconimag.isa, *(void *)(a1 + 40), v5);
  id v11 = 0;
  v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:0 error:&v11];
  id v7 = v11;
  v8 = v7;
  id v9 = @"YES";
  if (!v6) {
    id v9 = @"NO";
  }
  NSLog(&cfstr_Vuiappiconimag_0.isa, v9, v7);
  v10 = 0;
  if ([v6 length] && !v8)
  {
    v10 = [MEMORY[0x1E4FB1818] imageWithData:v6 scale:v4];
    [*(id *)(a1 + 56) _cacheImage:v10 forKey:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (double)iconCornerRadiusForSize:(CGSize)a3
{
  if (a3.width == 60.0 && a3.height == 60.0)
  {
    v5 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F298]];
    [v5 continuousCornerRadius];
    double v7 = v6;

    return v7;
  }
  else
  {
    VUIRoundValue();
  }
  return result;
}

+ (id)_imageURLForInstallable:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = (void *)MEMORY[0x1E4FB1BA8];
  id v7 = a3;
  v8 = [v6 mainScreen];
  [v8 scale];
  CGFloat v10 = v9;

  CGAffineTransformMakeScale(&v13, v10, v10);
  id v11 = objc_msgSend(v7, "appIconURLForSize:", height * v13.c + v13.a * width, height * v13.d + v13.b * width);

  return v11;
}

+ (id)_keyForInstallable:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v8 = objc_msgSend(a1, "_imageURLForInstallable:size:", v7, width, height);
  double v9 = [v8 absoluteString];

  if ([v9 length])
  {
    CGFloat v10 = NSString;
    id v11 = [a1 _MD5StringForString:v9];
    v12 = [v10 stringWithFormat:@"%@.png", v11];
  }
  else
  {
    NSLog(&cfstr_Vuiappiconimag_1.isa, v7);
    v12 = 0;
  }

  return v12;
}

+ (id)_MD5StringForString:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v3 = (const char *)[a3 UTF8String];
  double v4 = (void *)v3;
  if (v3)
  {
    CC_LONG v5 = strlen(v3);
    CC_MD5(v4, v5, md);
    double v4 = [MEMORY[0x1E4F28E78] stringWithCapacity:16];
    for (uint64_t i = 0; i != 16; ++i)
      objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);
  }
  return v4;
}

+ (void)_cacheImage:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = (UIImage *)a3;
  v8 = [a1 _cachePath];
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v10 = [v9 fileExistsAtPath:v8];

  if ((v10 & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v11 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];
  }
  v12 = [v8 stringByAppendingPathComponent:v6];

  CGAffineTransform v13 = [v12 stringByExpandingTildeInPath];

  v14 = UIImagePNGRepresentation(v7);

  id v18 = 0;
  char v15 = [v14 writeToFile:v13 options:1 error:&v18];
  id v16 = v18;
  uint64_t v17 = v16;
  if ((v15 & 1) == 0) {
    NSLog(&cfstr_Vuiappiconimag_2.isa, v6, v16);
  }
}

+ (id)_cachedImageForKey:(id)a3
{
  id v4 = a3;
  CC_LONG v5 = [a1 _cachePath];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  id v7 = [v6 stringByExpandingTildeInPath];

  v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v7];
  id v9 = objc_alloc(MEMORY[0x1E4FB1818]);
  char v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 scale];
  id v11 = objc_msgSend(v9, "initWithData:scale:", v8);

  return v11;
}

+ (id)_cachePath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  double v3 = [v2 firstObject];

  id v4 = [v3 stringByAppendingPathComponent:@"com.apple.WatchListKit"];

  CC_LONG v5 = [v4 stringByAppendingPathComponent:@"channel-icons"];

  return v5;
}

@end