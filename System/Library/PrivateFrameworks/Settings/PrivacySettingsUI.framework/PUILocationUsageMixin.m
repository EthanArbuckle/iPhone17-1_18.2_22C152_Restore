@interface PUILocationUsageMixin
- (CGSize)_authLevelLabelSize:(unint64_t)a3;
- (CGSize)usageIndicatorSize;
- (NSString)authLevelString;
- (PUILocationUsageMixin)init;
- (UIImageView)usageIndicator;
- (id)_authLevelForMask:(unint64_t)a3;
- (id)iconForUsage:(int)a3;
- (int)usage;
- (unint64_t)authLevel;
- (void)setAuthLevel:(unint64_t)a3;
- (void)setUsage:(int)a3;
@end

@implementation PUILocationUsageMixin

- (PUILocationUsageMixin)init
{
  if (loadLocationFillSystemImage_onceToken != -1) {
    dispatch_once(&loadLocationFillSystemImage_onceToken, &__block_literal_global_769);
  }
  v10.receiver = self;
  v10.super_class = (Class)PUILocationUsageMixin;
  v3 = [(PUILocationUsageMixin *)&v10 init];
  v4 = v3;
  if (v3)
  {
    v3->_usage = -1;
    [(PUILocationUsageMixin *)v3 usageIndicatorSize];
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", 0.0, 0.0, v5, v6);
    usageIndicator = v4->_usageIndicator;
    v4->_usageIndicator = (UIImageView *)v7;

    [(UIImageView *)v4->_usageIndicator setHidden:1];
    [(UIImageView *)v4->_usageIndicator setContentMode:1];
  }
  return v4;
}

- (id)iconForUsage:(int)a3
{
  if ((a3 - 2) > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = (id)*off_1E6E9D7A0[a3 - 2];
  }
  return v4;
}

- (void)setUsage:(int)a3
{
  if (self->_usage != a3)
  {
    uint64_t v5 = -[PUILocationUsageMixin iconForUsage:](self, "iconForUsage:");
    self->_usage = a3;
    id v6 = (id)v5;
    if (v5)
    {
      [(UIImageView *)self->_usageIndicator setImage:v5];
      uint64_t v5 = (uint64_t)v6;
    }
    [(UIImageView *)self->_usageIndicator setHidden:v5 == 0];
  }
}

- (void)setAuthLevel:(unint64_t)a3
{
  self->_authLevel = a3;
  -[PUILocationUsageMixin _authLevelForMask:](self, "_authLevelForMask:");
  self->_authLevelString = (NSString *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1F41817F8]();
}

- (CGSize)usageIndicatorSize
{
  if (usageIndicatorSize_onceToken != -1) {
    dispatch_once(&usageIndicatorSize_onceToken, &__block_literal_global_10);
  }
  double v2 = *(double *)&usageIndicatorSize_size_0;
  double v3 = *(double *)&usageIndicatorSize_size_1;
  result.height = v3;
  result.width = v2;
  return result;
}

uint64_t __43__PUILocationUsageMixin_usageIndicatorSize__block_invoke()
{
  uint64_t result = [(id)locationFillSystemImage size];
  usageIndicatorSize_size_0 = v1;
  usageIndicatorSize_size_1 = v2;
  return result;
}

- (CGSize)_authLevelLabelSize:(unint64_t)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(PUILocationUsageMixin *)self _authLevelForMask:a3];
  uint64_t v13 = *MEMORY[0x1E4FB06F8];
  id v4 = (void *)MEMORY[0x1E4FB08E0];
  [MEMORY[0x1E4FB08E0] labelFontSize];
  uint64_t v5 = objc_msgSend(v4, "systemFontOfSize:");
  v14[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [v3 sizeWithAttributes:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)_authLevelForMask:(unint64_t)a3
{
  if (a3)
  {
    if (a3)
    {
      id v6 = @"NEVER_AUTHORIZATION";
    }
    else if ((a3 & 4) != 0)
    {
      id v6 = @"ALWAYS_AUTHORIZATION";
    }
    else
    {
      if ((a3 & 2) == 0)
      {
        id v4 = 0;
        return v4;
      }
      id v6 = @"WHEN_IN_USE_AUTHORIZATION_SHORT";
    }
  }
  else
  {
    id v6 = @"NOT_DETERMINED_AUTHORIZATION_SHORT";
  }
  id v4 = PUI_LocalizedStringForLocationServicesPrivacy(v6);
  return v4;
}

- (int)usage
{
  return self->_usage;
}

- (unint64_t)authLevel
{
  return self->_authLevel;
}

- (UIImageView)usageIndicator
{
  return self->_usageIndicator;
}

- (NSString)authLevelString
{
  return self->_authLevelString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authLevelString, 0);
  objc_storeStrong((id *)&self->_usageIndicator, 0);
}

@end