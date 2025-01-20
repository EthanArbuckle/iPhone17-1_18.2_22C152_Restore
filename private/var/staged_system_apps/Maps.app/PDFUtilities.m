@interface PDFUtilities
+ (id)imageForType:(unsigned int)a3;
+ (void)renderDocumentForType:(unsigned int)a3 inRect:(CGRect)a4;
@end

@implementation PDFUtilities

+ (id)imageForType:(unsigned int)a3
{
  if (a3 > 0xB)
  {
    v5 = 0;
  }
  else
  {
    v5 = +[UIImage imageNamed:](UIImage, "imageNamed:", *(&off_1012F1648 + (int)a3), v3);
  }
  return v5;
}

+ (void)renderDocumentForType:(unsigned int)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = [a1 imageForType:*(void *)&a3];
  [v8 drawInRect:x, y, width, height];
}

@end