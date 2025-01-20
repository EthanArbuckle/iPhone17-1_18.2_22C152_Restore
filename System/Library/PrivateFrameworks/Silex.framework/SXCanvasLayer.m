@interface SXCanvasLayer
- (void)layoutSublayers;
@end

@implementation SXCanvasLayer

- (void)layoutSublayers
{
  v5.receiver = self;
  v5.super_class = (Class)objc_msgSend((id)-[SXCanvasLayer superclass](self, "superclass"), "superclass");
  objc_msgSendSuper(&v5, a2);
  v4.receiver = self;
  v4.super_class = (Class)SXCanvasLayer;
  [(TSDCanvasLayer *)&v4 layoutSublayers];
}

@end