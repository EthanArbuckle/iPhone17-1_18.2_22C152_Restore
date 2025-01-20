@interface SBHIconSettings
+ (id)settingsControllerModule;
- (BOOL)alwaysHitTestNearestIcon;
- (BOOL)suppressJitter;
- (SBFParallaxSettings)badgeParallaxSettings;
- (SBFParallaxSettings)iconParallaxSettings;
- (double)iconHitboxPaddingX;
- (double)iconHitboxPaddingY;
- (void)setAlwaysHitTestNearestIcon:(BOOL)a3;
- (void)setBadgeParallaxSettings:(id)a3;
- (void)setDefaultValues;
- (void)setIconHitboxPaddingX:(double)a3;
- (void)setIconHitboxPaddingY:(double)a3;
- (void)setIconParallaxSettings:(id)a3;
- (void)setSuppressJitter:(BOOL)a3;
@end

@implementation SBHIconSettings

- (SBFParallaxSettings)badgeParallaxSettings
{
  return self->_badgeParallaxSettings;
}

- (double)iconHitboxPaddingY
{
  return self->_iconHitboxPaddingY;
}

- (double)iconHitboxPaddingX
{
  return self->_iconHitboxPaddingX;
}

- (BOOL)alwaysHitTestNearestIcon
{
  return self->_alwaysHitTestNearestIcon;
}

- (void)setDefaultValues
{
  [(SBHIconSettings *)self setSuppressJitter:0];
  [(SBHIconSettings *)self setAlwaysHitTestNearestIcon:0];
  [(SBHIconSettings *)self setIconHitboxPaddingX:10.0];
  [(SBHIconSettings *)self setIconHitboxPaddingY:10.0];
  v3 = [(SBHIconSettings *)self badgeParallaxSettings];
  [v3 setSlideEnabled:1];

  v4 = [(SBHIconSettings *)self badgeParallaxSettings];
  [v4 setSlideDirectionX:1];

  v5 = [(SBHIconSettings *)self badgeParallaxSettings];
  [v5 setSlideDirectionY:1];

  v6 = [(SBHIconSettings *)self badgeParallaxSettings];
  [v6 setSlidePixelsX:8.0];

  v7 = [(SBHIconSettings *)self badgeParallaxSettings];
  [v7 setSlidePixelsY:8.0];

  v8 = [(SBHIconSettings *)self iconParallaxSettings];
  [v8 setSlideEnabled:1];

  v9 = [(SBHIconSettings *)self iconParallaxSettings];
  [v9 setSlideDirectionX:1];

  v10 = [(SBHIconSettings *)self iconParallaxSettings];
  [v10 setSlideDirectionY:1];

  double v11 = *MEMORY[0x1E4FB3320];
  v12 = [(SBHIconSettings *)self iconParallaxSettings];
  [v12 setSlidePixelsX:v11];

  id v13 = [(SBHIconSettings *)self iconParallaxSettings];
  [v13 setSlidePixelsY:v11];
}

+ (id)settingsControllerModule
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Suppress Icon Jitter" valueKeyPath:@"suppressJitter"];
  v29[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];

  v24 = [MEMORY[0x1E4F94160] sectionWithRows:v3 title:@"Close-Box Debug"];
  v4 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Always Hit-test nearest icon" valueKeyPath:@"alwaysHitTestNearestIcon"];
  v28[0] = v4;
  v5 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Hitbox Padding (horizontal)" valueKeyPath:@"iconHitboxPaddingX"];
  v6 = [v5 minValue:0.0 maxValue:200.0];
  v28[1] = v6;
  v7 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Hitbox Padding (vertical)" valueKeyPath:@"iconHitboxPaddingY"];
  v8 = [v7 minValue:0.0 maxValue:200.0];
  v28[2] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];

  v10 = [MEMORY[0x1E4F94160] sectionWithRows:v9 title:@"Close-Box Debug"];
  double v11 = [MEMORY[0x1E4F94130] rowWithTitle:@"Icon Parallax" childSettingsKeyPath:@"iconParallaxSettings"];
  v27[0] = v11;
  v12 = [MEMORY[0x1E4F94130] rowWithTitle:@"Badge Parallax" childSettingsKeyPath:@"badgeParallaxSettings"];
  v27[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

  v14 = [MEMORY[0x1E4F94160] sectionWithRows:v13];
  v15 = (void *)MEMORY[0x1E4F940F8];
  v16 = [MEMORY[0x1E4F94170] action];
  v17 = [v15 rowWithTitle:@"Restore Defaults" action:v16];
  v26 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];

  v19 = [MEMORY[0x1E4F94160] sectionWithRows:v18];
  v20 = (void *)MEMORY[0x1E4F94160];
  v25[0] = v24;
  v25[1] = v10;
  v25[2] = v14;
  v25[3] = v19;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  v22 = [v20 moduleWithTitle:@"Icons" contents:v21];

  return v22;
}

- (BOOL)suppressJitter
{
  return self->_suppressJitter;
}

- (void)setSuppressJitter:(BOOL)a3
{
  self->_suppressJitter = a3;
}

- (void)setAlwaysHitTestNearestIcon:(BOOL)a3
{
  self->_alwaysHitTestNearestIcon = a3;
}

- (void)setIconHitboxPaddingX:(double)a3
{
  self->_iconHitboxPaddingX = a3;
}

- (void)setIconHitboxPaddingY:(double)a3
{
  self->_iconHitboxPaddingY = a3;
}

- (SBFParallaxSettings)iconParallaxSettings
{
  return self->_iconParallaxSettings;
}

- (void)setIconParallaxSettings:(id)a3
{
}

- (void)setBadgeParallaxSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeParallaxSettings, 0);
  objc_storeStrong((id *)&self->_iconParallaxSettings, 0);
}

@end