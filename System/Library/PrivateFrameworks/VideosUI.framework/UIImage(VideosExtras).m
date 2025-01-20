@interface UIImage(VideosExtras)
+ (id)imageForPlaceholderURL:()VideosExtras;
@end

@implementation UIImage(VideosExtras)

+ (id)imageForPlaceholderURL:()VideosExtras
{
  v3 = [a3 absoluteString];
  v4 = [v3 lastPathComponent];
  if (imageForPlaceholderURL__onceToken != -1) {
    dispatch_once(&imageForPlaceholderURL__onceToken, &__block_literal_global_117);
  }
  v5 = [(id)imageForPlaceholderURL____resourceNameMapping objectForKey:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4FB1818], "vui_videosUIImageNamed:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end