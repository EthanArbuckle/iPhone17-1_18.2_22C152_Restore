@interface REMCursor
+ (id)REMCursorWithRoundRect:(CGRect)a3 andCornerRadius:(double)a4;
@end

@implementation REMCursor

+ (id)REMCursorWithRoundRect:(CGRect)a3 andCornerRadius:(double)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:cornerRadius:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

@end