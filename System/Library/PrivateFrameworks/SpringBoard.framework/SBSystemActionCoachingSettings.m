@interface SBSystemActionCoachingSettings
+ (id)settingsControllerModule;
- (NSString)policyClassName;
- (SBFFluidBehaviorSettings)contractionSettings;
- (SBFFluidBehaviorSettings)dismissalSettings;
- (SBFFluidBehaviorSettings)expansionSettings;
- (SBFFluidBehaviorSettings)presentationSettings;
- (SBSystemActionPressWithinTimeIntervalCoachingPolicySettings)pressWithinTimeIntervalPolicySettings;
- (SBSystemActionTrackPreviewsCoachingPolicySettings)trackPreviewsPolicySettings;
- (double)coachingButtonShadowOpacity;
- (double)coachingButtonShadowRadius;
- (double)coachingLabelShadowOpacity;
- (double)coachingLabelShadowRadius;
- (double)dimmingAlpha;
- (void)setCoachingButtonShadowOpacity:(double)a3;
- (void)setCoachingButtonShadowRadius:(double)a3;
- (void)setCoachingLabelShadowOpacity:(double)a3;
- (void)setCoachingLabelShadowRadius:(double)a3;
- (void)setContractionSettings:(id)a3;
- (void)setDefaultValues;
- (void)setDimmingAlpha:(double)a3;
- (void)setDismissalSettings:(id)a3;
- (void)setExpansionSettings:(id)a3;
- (void)setPolicyClassName:(id)a3;
- (void)setPresentationSettings:(id)a3;
- (void)setPressWithinTimeIntervalPolicySettings:(id)a3;
- (void)setTrackPreviewsPolicySettings:(id)a3;
@end

@implementation SBSystemActionCoachingSettings

- (void)setDefaultValues
{
  v11.receiver = self;
  v11.super_class = (Class)SBSystemActionCoachingSettings;
  [(PTSettings *)&v11 setDefaultValues];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [(SBSystemActionCoachingSettings *)self setPolicyClassName:v4];

  v5 = [(SBSystemActionCoachingSettings *)self trackPreviewsPolicySettings];
  [v5 setDefaultValues];

  v6 = [(SBSystemActionCoachingSettings *)self pressWithinTimeIntervalPolicySettings];
  [v6 setDefaultValues];

  [(SBSystemActionCoachingSettings *)self setDimmingAlpha:0.35];
  [(SBSystemActionCoachingSettings *)self setCoachingButtonShadowOpacity:0.25];
  [(SBSystemActionCoachingSettings *)self setCoachingButtonShadowRadius:15.0];
  [(SBSystemActionCoachingSettings *)self setCoachingLabelShadowOpacity:0.25];
  [(SBSystemActionCoachingSettings *)self setCoachingLabelShadowRadius:6.0];
  v7 = [(SBSystemActionCoachingSettings *)self presentationSettings];
  [v7 setDefaultValues];
  [v7 setDampingRatio:1.0];
  [v7 setDampingRatioSmoothing:0.0];
  [v7 setResponse:0.5];
  [v7 setResponseSmoothing:0.0];
  v8 = [(SBSystemActionCoachingSettings *)self expansionSettings];
  [v8 setDefaultValues];
  [v8 setDampingRatio:1.0];
  [v8 setDampingRatioSmoothing:0.0];
  [v8 setResponse:0.8];
  [v8 setResponseSmoothing:0.0];
  v9 = [(SBSystemActionCoachingSettings *)self contractionSettings];
  [v9 setDefaultValues];
  [v9 setDampingRatio:1.0];
  [v9 setDampingRatioSmoothing:0.0];
  [v9 setResponse:0.5];
  [v9 setResponseSmoothing:0.0];
  v10 = [(SBSystemActionCoachingSettings *)self dismissalSettings];
  [v10 setDefaultValues];
  [v10 setDampingRatio:1.0];
  [v10 setDampingRatioSmoothing:0.0];
  [v10 setResponse:0.5];
  [v10 setResponseSmoothing:0.0];
}

+ (id)settingsControllerModule
{
  v67[2] = *MEMORY[0x1E4F143B8];
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v67[0] = v3;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v67[1] = v5;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];

  v58 = (void *)MEMORY[0x1E4F94168];
  v54 = [MEMORY[0x1E4F94110] rowWithTitle:@"Presentation Policy" valueKeyPath:@"policyClassName"];
  v6 = [v54 possibleValues:v56 titles:&unk_1F33483D8];
  v66[0] = v6;
  v7 = [MEMORY[0x1E4F94138] rowWithTitle:@"Settings" childSettingsKeyPath:@"trackPreviewsPolicySettings"];
  v8 = (void *)MEMORY[0x1E4F28F60];
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  objc_super v11 = [v8 predicateWithFormat:@"policyClassName == %@", v10];
  v12 = [v7 condition:v11];
  v66[1] = v12;
  v13 = [MEMORY[0x1E4F94138] rowWithTitle:@"Settings" childSettingsKeyPath:@"pressWithinTimeIntervalPolicySettings"];
  v14 = (void *)MEMORY[0x1E4F28F60];
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v17 = [v14 predicateWithFormat:@"policyClassName == %@", v16];
  v18 = [v13 condition:v17];
  v66[2] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:3];
  v59 = [v58 sectionWithRows:v19 title:@"Policy"];

  v20 = (void *)MEMORY[0x1E4F94168];
  v21 = [MEMORY[0x1E4F94140] rowWithTitle:@"Opacity" valueKeyPath:@"dimmingAlpha"];
  v22 = [v21 between:1.0 and:5.0];
  v65 = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
  v57 = [v20 sectionWithRows:v23 title:@"Dimming"];

  v24 = (void *)MEMORY[0x1E4F94168];
  v25 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shadow Opacity" valueKeyPath:@"coachingButtonShadowOpacity"];
  v26 = [v25 between:0.0 and:1.0];
  v64[0] = v26;
  v27 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shadow Radius" valueKeyPath:@"coachingButtonShadowRadius"];
  v28 = [v27 between:0.0 and:20.0];
  v64[1] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
  v55 = [v24 sectionWithRows:v29 title:@"Coaching Button"];

  v30 = (void *)MEMORY[0x1E4F94168];
  v31 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shadow Opacity" valueKeyPath:@"coachingLabelShadowOpacity"];
  v32 = [v31 between:0.0 and:1.0];
  v63[0] = v32;
  v33 = [MEMORY[0x1E4F94140] rowWithTitle:@"Shadow Radius" valueKeyPath:@"coachingLabelShadowRadius"];
  v34 = [v33 between:0.0 and:20.0];
  v63[1] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
  v36 = [v30 sectionWithRows:v35 title:@"Coaching Label"];

  v37 = (void *)MEMORY[0x1E4F94168];
  v38 = [MEMORY[0x1E4F94138] rowWithTitle:@"Presentation" childSettingsKeyPath:@"presentationSettings"];
  v62[0] = v38;
  v39 = [MEMORY[0x1E4F94138] rowWithTitle:@"Expansion" childSettingsKeyPath:@"expansionSettings"];
  v62[1] = v39;
  v40 = [MEMORY[0x1E4F94138] rowWithTitle:@"Contraction" childSettingsKeyPath:@"contractionSettings"];
  v62[2] = v40;
  v41 = [MEMORY[0x1E4F94138] rowWithTitle:@"Dismissal" childSettingsKeyPath:@"dismissalSettings"];
  v62[3] = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:4];
  v43 = [v37 sectionWithRows:v42 title:@"Animations"];

  v44 = (void *)MEMORY[0x1E4F94168];
  v45 = (void *)MEMORY[0x1E4F94100];
  v46 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v47 = [v45 rowWithTitle:@"Restore Defaults" action:v46];
  v61 = v47;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
  v49 = [v44 sectionWithRows:v48];

  v50 = (void *)MEMORY[0x1E4F94168];
  v60[0] = v59;
  v60[1] = v57;
  v60[2] = v55;
  v60[3] = v36;
  v60[4] = v43;
  v60[5] = v49;
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:6];
  v52 = [v50 moduleWithTitle:@"Coaching" contents:v51];

  return v52;
}

- (NSString)policyClassName
{
  return self->_policyClassName;
}

- (void)setPolicyClassName:(id)a3
{
}

- (SBSystemActionTrackPreviewsCoachingPolicySettings)trackPreviewsPolicySettings
{
  return self->_trackPreviewsPolicySettings;
}

- (void)setTrackPreviewsPolicySettings:(id)a3
{
}

- (SBSystemActionPressWithinTimeIntervalCoachingPolicySettings)pressWithinTimeIntervalPolicySettings
{
  return self->_pressWithinTimeIntervalPolicySettings;
}

- (void)setPressWithinTimeIntervalPolicySettings:(id)a3
{
}

- (double)dimmingAlpha
{
  return self->_dimmingAlpha;
}

- (void)setDimmingAlpha:(double)a3
{
  self->_dimmingAlpha = a3;
}

- (double)coachingButtonShadowOpacity
{
  return self->_coachingButtonShadowOpacity;
}

- (void)setCoachingButtonShadowOpacity:(double)a3
{
  self->_coachingButtonShadowOpacity = a3;
}

- (double)coachingButtonShadowRadius
{
  return self->_coachingButtonShadowRadius;
}

- (void)setCoachingButtonShadowRadius:(double)a3
{
  self->_coachingButtonShadowRadius = a3;
}

- (double)coachingLabelShadowOpacity
{
  return self->_coachingLabelShadowOpacity;
}

- (void)setCoachingLabelShadowOpacity:(double)a3
{
  self->_coachingLabelShadowOpacity = a3;
}

- (double)coachingLabelShadowRadius
{
  return self->_coachingLabelShadowRadius;
}

- (void)setCoachingLabelShadowRadius:(double)a3
{
  self->_coachingLabelShadowRadius = a3;
}

- (SBFFluidBehaviorSettings)presentationSettings
{
  return self->_presentationSettings;
}

- (void)setPresentationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)expansionSettings
{
  return self->_expansionSettings;
}

- (void)setExpansionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)contractionSettings
{
  return self->_contractionSettings;
}

- (void)setContractionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)dismissalSettings
{
  return self->_dismissalSettings;
}

- (void)setDismissalSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalSettings, 0);
  objc_storeStrong((id *)&self->_contractionSettings, 0);
  objc_storeStrong((id *)&self->_expansionSettings, 0);
  objc_storeStrong((id *)&self->_presentationSettings, 0);
  objc_storeStrong((id *)&self->_pressWithinTimeIntervalPolicySettings, 0);
  objc_storeStrong((id *)&self->_trackPreviewsPolicySettings, 0);
  objc_storeStrong((id *)&self->_policyClassName, 0);
}

@end