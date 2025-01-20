@interface PUBlackOneUpWhiteTintInterfaceTheme
- (id)tintColorForBarStyle:(int64_t)a3;
@end

@implementation PUBlackOneUpWhiteTintInterfaceTheme

- (id)tintColorForBarStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUBlackOneUpWhiteTintInterfaceTheme;
  v4 = -[PUFlatWhiteInterfaceTheme tintColorForBarStyle:](&v7, sel_tintColorForBarStyle_);
  if (a3 == 1)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] whiteColor];

    v4 = (void *)v5;
  }
  return v4;
}

@end