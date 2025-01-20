@interface SiriUIClearBackgroundCell
+ (double)defaultHeight;
+ (id)elementKind;
+ (id)reuseIdentifier;
- (SiriUIClearBackgroundCell)initWithFrame:(CGRect)a3;
@end

@implementation SiriUIClearBackgroundCell

- (SiriUIClearBackgroundCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SiriUIClearBackgroundCell;
  v3 = -[SiriUIClearBackgroundCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(SiriUIClearBackgroundCell *)v3 setBackgroundColor:v4];
  }
  return v3;
}

+ (id)reuseIdentifier
{
  return 0;
}

+ (double)defaultHeight
{
  return 0.0;
}

+ (id)elementKind
{
  return 0;
}

@end