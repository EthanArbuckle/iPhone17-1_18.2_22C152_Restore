@interface PNPPreDeclare
+ (void)squeezeInteraction:(id)a3 setMiniPaletteVisible:(BOOL)a4 hoverLocation:(CGPoint)a5 inView:(id)a6;
@end

@implementation PNPPreDeclare

+ (void)squeezeInteraction:(id)a3 setMiniPaletteVisible:(BOOL)a4 hoverLocation:(CGPoint)a5 inView:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  BOOL v9 = a4;
  id v11 = a3;
  id v10 = a6;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v11, "_setMiniPaletteVisible:hoverLocation:inView:", v9, v10, x, y);
  }
}

@end