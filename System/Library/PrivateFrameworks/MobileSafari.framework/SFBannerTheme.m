@interface SFBannerTheme
- (SFBannerTheme)initWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5;
- (UIColor)separatorColor;
@end

@implementation SFBannerTheme

- (void).cxx_destruct
{
}

- (SFBannerTheme)initWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)SFBannerTheme;
  v6 = [(SFThemeColorBarTheme *)&v11 initWithBarTintStyle:a3 preferredBarTintColor:a4 controlsTintColor:a5];
  if (v6)
  {
    if (a4)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_transparentBarHairlineColor");
      separatorColor = v6->_separatorColor;
      v6->_separatorColor = (UIColor *)v7;
    }
    v9 = v6;
  }

  return v6;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

@end