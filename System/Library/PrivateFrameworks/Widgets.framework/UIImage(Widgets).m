@interface UIImage(Widgets)
- (id)imagesWithSpriteSize:()Widgets;
@end

@implementation UIImage(Widgets)

- (id)imagesWithSpriteSize:()Widgets
{
  v3 = (void *)MEMORY[0x263EFFA68];
  if (a2 > 0.0 && a3 > 0.0)
  {
    v7 = [MEMORY[0x263F1C920] mainScreen];
    [v7 scale];
    double v9 = v8;

    v10 = (CGImage *)[a1 CGImage];
    v11 = [MEMORY[0x263EFF980] array];
    size_t Width = CGImageGetWidth(v10);
    size_t Height = CGImageGetHeight(v10);
    if (Height)
    {
      size_t v14 = Height;
      for (unint64_t i = 0; i < v14; unint64_t i = (unint64_t)(v16 + a3 * v9))
      {
        double v16 = (double)i;
        if (Width)
        {
          unint64_t v17 = 0;
          do
          {
            double v18 = (double)v17;
            v23.origin.x = (double)v17;
            v23.origin.y = v16;
            v23.size.width = a2 * v9;
            v23.size.height = a3 * v9;
            v19 = CGImageCreateWithImageInRect(v10, v23);
            v20 = [MEMORY[0x263F1C6B0] imageWithCGImage:v19 scale:0 orientation:v9];
            [v11 addObject:v20];
            CGImageRelease(v19);
            unint64_t v17 = (unint64_t)(v18 + a2 * v9);
          }
          while (Width > v17);
        }
      }
    }
    v3 = (void *)[v11 copy];
  }
  return v3;
}

@end