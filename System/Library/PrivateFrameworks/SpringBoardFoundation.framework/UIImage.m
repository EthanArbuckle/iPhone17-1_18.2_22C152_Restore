@interface UIImage
@end

@implementation UIImage

uint64_t __79__UIImage_SBFImageColorSpaceUtilities__sbf_imageByConvertingToColorSpace_type___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

uint64_t __98__UIImage_SBFImageCGBitmapDrawing__sbf_downscaledImageByDrawingIntoContextOfType_downscaleFactor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

@end