@interface NCImageBrandingBadge
- (BOOL)isEqual:(id)a3;
- (NCBadgedIconView)badgedIconView;
- (NCImageBrandingBadge)initWithFrame:(CGRect)a3;
- (NCImageBrandingBadge)initWithImage:(id)a3;
- (int64_t)badgeType;
- (unint64_t)badgeLocation;
- (void)setBadgeLocation:(unint64_t)a3;
- (void)setBadgedIconView:(id)a3;
@end

@implementation NCImageBrandingBadge

- (NCImageBrandingBadge)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCImageBrandingBadge;
  result = -[NCImageBrandingBadge initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_badgeLocation = 12;
  }
  return result;
}

- (NCImageBrandingBadge)initWithImage:(id)a3
{
  id v4 = a3;
  v5 = -[NCImageBrandingBadge initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  v6 = v5;
  if (v5) {
    [(NCImageBrandingBadge *)v5 setImage:v4];
  }

  return v6;
}

- (int64_t)badgeType
{
  return 1;
}

- (void)setBadgeLocation:(unint64_t)a3
{
  if (self->_badgeLocation != a3)
  {
    self->_badgeLocation = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_badgedIconView);
    [WeakRetained setNeedsLayout];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NCImageBrandingBadge *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    char v6 = 0;
    if (v4 && (isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = [(NCImageBrandingBadge *)self image];
      v9 = [(NCImageBrandingBadge *)v7 image];

      char v6 = BSEqualObjects();
    }
  }

  return v6;
}

- (unint64_t)badgeLocation
{
  return self->_badgeLocation;
}

- (NCBadgedIconView)badgedIconView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_badgedIconView);

  return (NCBadgedIconView *)WeakRetained;
}

- (void)setBadgedIconView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end