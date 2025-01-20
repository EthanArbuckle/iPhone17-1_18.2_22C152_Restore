@interface VFXJSImage
+ (id)VFXJSExportProtocol;
+ (id)imageWithPath:(id)a3;
+ (id)imageWithURL:(id)a3;
@end

@implementation VFXJSImage

+ (id)imageWithURL:(id)a3
{
  return (id)((uint64_t (*)(void, char *, id))MEMORY[0x1F4181798])(MEMORY[0x1E4FB1818], sel_imageWithContentsOfFile_, a3);
}

+ (id)imageWithPath:(id)a3
{
  return (id)((uint64_t (*)(void, char *, id))MEMORY[0x1F4181798])(MEMORY[0x1E4FB1818], sel_imageWithContentsOfFile_, a3);
}

+ (id)VFXJSExportProtocol
{
  return &unk_1F108B5C0;
}

@end