@interface BFFProgressView
- (BFFProgressView)init;
@end

@implementation BFFProgressView

- (BFFProgressView)init
{
  v6.receiver = self;
  v6.super_class = (Class)BFFProgressView;
  v2 = [(BFFProgressView *)&v6 initWithProgressViewStyle:0];
  if (v2)
  {
    v3 = [MEMORY[0x263F825C8] systemBlueColor];
    [(BFFProgressView *)v2 setProgressTintColor:v3];

    v4 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.15];
    [(BFFProgressView *)v2 setTrackTintColor:v4];
  }
  return v2;
}

@end