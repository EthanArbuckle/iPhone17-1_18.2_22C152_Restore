@interface UIImage
@end

@implementation UIImage

uint64_t __46__UIImage_PKUIUtilities__pkui_imageWithAlpha___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:blendMode:alpha:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), *(double *)(a1 + 40));
}

void __52__UIImage_PKUIUtilities__pkui_imageWithColor_scale___block_invoke(uint64_t a1, void *a2)
{
  v3 = (CGContext *)[a2 CGContext];
  CGContextSaveGState(v3);
  CGContextSetFillColorWithColor(v3, (CGColorRef)[*(id *)(a1 + 32) CGColor]);
  CGContextFillRect(v3, *(CGRect *)(a1 + 40));

  CGContextRestoreGState(v3);
}

@end