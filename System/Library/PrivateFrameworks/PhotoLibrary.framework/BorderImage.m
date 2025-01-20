@interface BorderImage
@end

@implementation BorderImage

void ____BorderImage_block_invoke()
{
  v0 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  PLPhysicalScreenScale();
  if (v1 == 2.0) {
    v2 = @"PLImageBorder@2x";
  }
  else {
    v2 = @"PLImageBorder";
  }
  v3 = CGDataProviderCreateWithURL((CFURLRef)[v0 URLForResource:v2 withExtension:@"png"]);
  __BorderImage___borderImage = (uint64_t)CGImageCreateWithPNGDataProvider(v3, 0, 1, kCGRenderingIntentDefault);

  CGDataProviderRelease(v3);
}

@end