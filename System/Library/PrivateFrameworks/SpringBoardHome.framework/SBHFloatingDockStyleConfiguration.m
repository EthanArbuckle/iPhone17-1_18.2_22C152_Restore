@interface SBHFloatingDockStyleConfiguration
+ (SBHFloatingDockStyleConfiguration)defaultConfiguration;
- (BOOL)wantsPlatterShadow;
- (SBHFloatingDockStyleConfiguration)configurationWithWantsPlatterShadow:(BOOL)a3;
- (SBHFloatingDockStyleConfiguration)init;
- (SBHFloatingDockStyleConfiguration)initWithBackgroundEffect:(unint64_t)a3 platterEffect:(unint64_t)a4 wantsPlatterShadow:(BOOL)a5 folderIconBackgroundStyle:(unint64_t)a6;
- (id)description;
- (unint64_t)backgroundEffect;
- (unint64_t)folderIconBackgroundStyle;
- (unint64_t)platterEffect;
@end

@implementation SBHFloatingDockStyleConfiguration

+ (SBHFloatingDockStyleConfiguration)defaultConfiguration
{
  if (defaultConfiguration_onceToken != -1) {
    dispatch_once(&defaultConfiguration_onceToken, &__block_literal_global_47);
  }
  v2 = (void *)defaultConfiguration_defaultConfiguration;
  return (SBHFloatingDockStyleConfiguration *)v2;
}

void __57__SBHFloatingDockStyleConfiguration_defaultConfiguration__block_invoke()
{
  v0 = [[SBHFloatingDockStyleConfiguration alloc] initWithBackgroundEffect:1 platterEffect:1 wantsPlatterShadow:0 folderIconBackgroundStyle:0];
  v1 = (void *)defaultConfiguration_defaultConfiguration;
  defaultConfiguration_defaultConfiguration = (uint64_t)v0;
}

- (SBHFloatingDockStyleConfiguration)init
{
  return 0;
}

- (SBHFloatingDockStyleConfiguration)initWithBackgroundEffect:(unint64_t)a3 platterEffect:(unint64_t)a4 wantsPlatterShadow:(BOOL)a5 folderIconBackgroundStyle:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)SBHFloatingDockStyleConfiguration;
  result = [(SBHFloatingDockStyleConfiguration *)&v11 init];
  if (result)
  {
    result->_backgroundEffect = a3;
    result->_platterEffect = a4;
    result->_folderIconBackgroundStyle = a6;
    result->_wantsPlatterShadow = a5;
  }
  return result;
}

- (unint64_t)backgroundEffect
{
  unint64_t backgroundEffect = self->_backgroundEffect;
  if (UIAccessibilityIsReduceTransparencyEnabled() && backgroundEffect - 1 < 2) {
    return 0;
  }
  else {
    return backgroundEffect;
  }
}

- (unint64_t)platterEffect
{
  unint64_t platterEffect = self->_platterEffect;
  if (UIAccessibilityIsReduceTransparencyEnabled() && platterEffect == 1) {
    return 0;
  }
  else {
    return platterEffect;
  }
}

- (SBHFloatingDockStyleConfiguration)configurationWithWantsPlatterShadow:(BOOL)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBackgroundEffect:self->_backgroundEffect platterEffect:self->_platterEffect wantsPlatterShadow:a3 folderIconBackgroundStyle:self->_folderIconBackgroundStyle];
  return (SBHFloatingDockStyleConfiguration *)v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  unint64_t v4 = [(SBHFloatingDockStyleConfiguration *)self platterEffect];
  if (v4 > 2) {
    v5 = @"SBFolderBackgroundViewEffectNone";
  }
  else {
    v5 = off_1E6AB1200[v4];
  }
  [v3 appendString:v5 withName:@"platterEffect"];
  unint64_t v6 = [(SBHFloatingDockStyleConfiguration *)self backgroundEffect];
  if (v6 > 5) {
    v7 = @"SBFolderControllerBackgroundViewEffectBlur";
  }
  else {
    v7 = off_1E6AB1218[v6];
  }
  [v3 appendString:v7 withName:@"backgroundEffect"];
  unint64_t v8 = [(SBHFloatingDockStyleConfiguration *)self folderIconBackgroundStyle];
  if (v8 > 2) {
    v9 = @"SBFolderIconBackgroundStyleOpaqueWhite";
  }
  else {
    v9 = off_1E6AB1248[v8];
  }
  [v3 appendString:v9 withName:@"folderIconBackgroundStyle"];
  id v10 = (id)[v3 appendBool:UIAccessibilityIsReduceTransparencyEnabled() withName:@"UIAccessibilityIsReduceTransparencyEnabled()"];
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    unint64_t v11 = [(SBHFloatingDockStyleConfiguration *)self platterEffect];
    unint64_t platterEffect = self->_platterEffect;
    if (v11 != platterEffect)
    {
      if (platterEffect > 2) {
        v13 = @"SBFolderBackgroundViewEffectNone";
      }
      else {
        v13 = off_1E6AB1200[platterEffect];
      }
      [v3 appendString:v13 withName:@"orig platterEffect"];
    }
    unint64_t v14 = [(SBHFloatingDockStyleConfiguration *)self backgroundEffect];
    unint64_t backgroundEffect = self->_backgroundEffect;
    if (v14 != backgroundEffect)
    {
      if (backgroundEffect > 5) {
        v16 = @"SBFolderControllerBackgroundViewEffectBlur";
      }
      else {
        v16 = off_1E6AB1218[backgroundEffect];
      }
      [v3 appendString:v16 withName:@"orig backgroundEffect"];
    }
    unint64_t v17 = [(SBHFloatingDockStyleConfiguration *)self folderIconBackgroundStyle];
    unint64_t folderIconBackgroundStyle = self->_folderIconBackgroundStyle;
    if (v17 != folderIconBackgroundStyle)
    {
      if (folderIconBackgroundStyle > 2) {
        v19 = @"SBFolderIconBackgroundStyleOpaqueWhite";
      }
      else {
        v19 = off_1E6AB1248[folderIconBackgroundStyle];
      }
      [v3 appendString:v19 withName:@"orig folderIconBackgroundStyle"];
    }
  }
  id v20 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBHFloatingDockStyleConfiguration wantsPlatterShadow](self, "wantsPlatterShadow"), @"wantsPlatterShadow");
  v21 = [v3 build];

  return v21;
}

- (unint64_t)folderIconBackgroundStyle
{
  return self->_folderIconBackgroundStyle;
}

- (BOOL)wantsPlatterShadow
{
  return self->_wantsPlatterShadow;
}

@end