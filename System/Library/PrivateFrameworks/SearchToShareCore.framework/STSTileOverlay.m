@interface STSTileOverlay
- (STSTileOverlay)initWithFrame:(CGRect)a3;
@end

@implementation STSTileOverlay

- (STSTileOverlay)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STSTileOverlay;
  v3 = -[STSTileOverlay initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.3];
    [(STSTileOverlay *)v3 setBackgroundColor:v4];
  }
  return v3;
}

@end