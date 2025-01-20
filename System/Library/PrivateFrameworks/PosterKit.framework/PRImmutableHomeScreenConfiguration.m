@interface PRImmutableHomeScreenConfiguration
- (PRImmutableHomeScreenConfiguration)initWithSelectedAppearanceType:(unint64_t)a3 lockPosterAppearance:(id)a4 solidColorAppearance:(id)a5 gradientAppearance:(id)a6 homePosterAppearance:(id)a7 customizationConfiguration:(id)a8;
- (id)customizationConfiguration;
- (id)gradientAppearance;
- (id)homePosterAppearance;
- (id)lockPosterAppearance;
- (id)solidColorAppearance;
- (unint64_t)selectedAppearanceType;
@end

@implementation PRImmutableHomeScreenConfiguration

- (unint64_t)selectedAppearanceType
{
  return self->_selectedAppearanceType;
}

- (id)lockPosterAppearance
{
  return self->_lockPosterAppearance;
}

- (PRImmutableHomeScreenConfiguration)initWithSelectedAppearanceType:(unint64_t)a3 lockPosterAppearance:(id)a4 solidColorAppearance:(id)a5 gradientAppearance:(id)a6 homePosterAppearance:(id)a7 customizationConfiguration:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v18) {
    id v18 = (id)objc_opt_new();
  }
  v32.receiver = self;
  v32.super_class = (Class)PRImmutableHomeScreenConfiguration;
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

- (id)solidColorAppearance
{
  return self->_solidColorAppearance;
}

- (id)gradientAppearance
{
  return self->_gradientAppearance;
}

- (id)homePosterAppearance
{
  return self->_homePosterAppearance;
}

- (id)customizationConfiguration
{
  return self->_customizationConfiguration;
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