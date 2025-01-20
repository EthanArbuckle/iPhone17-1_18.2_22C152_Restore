@interface PRMutablePosterHomeScreenConfiguration
- (PRMutablePosterHomeScreenConfiguration)initWithSelectedAppearanceType:(unint64_t)a3 lockPosterAppearance:(id)a4 solidColorAppearance:(id)a5 gradientAppearance:(id)a6 homePosterAppearance:(id)a7 customizationConfiguration:(id)a8;
- (PRPosterGradientHomeScreenAppearance)gradientAppearance;
- (PRPosterHomePosterHomeScreenAppearance)homePosterAppearance;
- (PRPosterHomeScreenCustomizationConfiguration)customizationConfiguration;
- (PRPosterLockPosterHomeScreenAppearance)lockPosterAppearance;
- (PRPosterSolidColorHomeScreenAppearance)solidColorAppearance;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)selectedAppearanceType;
- (void)setCustomizationConfiguration:(id)a3;
- (void)setGradientAppearance:(id)a3;
- (void)setHomePosterAppearance:(id)a3;
- (void)setLockPosterAppearance:(id)a3;
- (void)setSelectedAppearanceType:(unint64_t)a3;
- (void)setSolidColorAppearance:(id)a3;
@end

@implementation PRMutablePosterHomeScreenConfiguration

- (PRMutablePosterHomeScreenConfiguration)initWithSelectedAppearanceType:(unint64_t)a3 lockPosterAppearance:(id)a4 solidColorAppearance:(id)a5 gradientAppearance:(id)a6 homePosterAppearance:(id)a7 customizationConfiguration:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v32.receiver = self;
  v32.super_class = (Class)PRMutablePosterHomeScreenConfiguration;
  v19 = [(PRPosterHomeScreenConfiguration *)&v32 initWithSelectedAppearanceType:a3 lockPosterAppearance:v14 solidColorAppearance:v15 gradientAppearance:v16 homePosterAppearance:v17 customizationConfiguration:v18];
  v20 = v19;
  if (v19)
  {
    v19->_selectedAppearanceType = a3;
    uint64_t v21 = [v14 copy];
    lockPosterAppearance = v20->_lockPosterAppearance;
    v20->_lockPosterAppearance = (PRPosterLockPosterHomeScreenAppearance *)v21;

    uint64_t v23 = [v15 copy];
    solidColorAppearance = v20->_solidColorAppearance;
    v20->_solidColorAppearance = (PRPosterSolidColorHomeScreenAppearance *)v23;

    uint64_t v25 = [v16 copy];
    gradientAppearance = v20->_gradientAppearance;
    v20->_gradientAppearance = (PRPosterGradientHomeScreenAppearance *)v25;

    uint64_t v27 = [v17 copy];
    homePosterAppearance = v20->_homePosterAppearance;
    v20->_homePosterAppearance = (PRPosterHomePosterHomeScreenAppearance *)v27;

    uint64_t v29 = [v18 copy];
    customizationConfiguration = v20->_customizationConfiguration;
    v20->_customizationConfiguration = (PRPosterHomeScreenCustomizationConfiguration *)v29;
  }
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PRImmutableHomeScreenConfiguration alloc];
  return [(PRPosterHomeScreenConfiguration *)v4 initWithHomeScreenConfiguration:self];
}

- (unint64_t)selectedAppearanceType
{
  return self->_selectedAppearanceType;
}

- (void)setSelectedAppearanceType:(unint64_t)a3
{
  self->_selectedAppearanceType = a3;
}

- (PRPosterLockPosterHomeScreenAppearance)lockPosterAppearance
{
  return self->_lockPosterAppearance;
}

- (void)setLockPosterAppearance:(id)a3
{
}

- (PRPosterSolidColorHomeScreenAppearance)solidColorAppearance
{
  return self->_solidColorAppearance;
}

- (void)setSolidColorAppearance:(id)a3
{
}

- (PRPosterGradientHomeScreenAppearance)gradientAppearance
{
  return self->_gradientAppearance;
}

- (void)setGradientAppearance:(id)a3
{
}

- (PRPosterHomePosterHomeScreenAppearance)homePosterAppearance
{
  return self->_homePosterAppearance;
}

- (void)setHomePosterAppearance:(id)a3
{
}

- (PRPosterHomeScreenCustomizationConfiguration)customizationConfiguration
{
  return self->_customizationConfiguration;
}

- (void)setCustomizationConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customizationConfiguration, 0);
  objc_storeStrong((id *)&self->_homePosterAppearance, 0);
  objc_storeStrong((id *)&self->_gradientAppearance, 0);
  objc_storeStrong((id *)&self->_solidColorAppearance, 0);
  objc_storeStrong((id *)&self->_lockPosterAppearance, 0);
}

@end