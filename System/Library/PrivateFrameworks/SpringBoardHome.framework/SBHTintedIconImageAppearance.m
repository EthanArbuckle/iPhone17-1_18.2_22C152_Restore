@interface SBHTintedIconImageAppearance
- (SBHTintedIconImageAppearance)initWithAppearanceType:(int64_t)a3 tintColor:(id)a4;
- (id)tintColor;
- (int64_t)appearanceType;
@end

@implementation SBHTintedIconImageAppearance

- (SBHTintedIconImageAppearance)initWithAppearanceType:(int64_t)a3 tintColor:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBHTintedIconImageAppearance;
  v7 = [(SBHIconImageAppearance *)&v11 initWithAppearanceType:a3 tintColor:v6];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    tintColor = v7->_tintColor;
    v7->_tintColor = (UIColor *)v8;
  }
  return v7;
}

- (int64_t)appearanceType
{
  return 2;
}

- (id)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
}

@end