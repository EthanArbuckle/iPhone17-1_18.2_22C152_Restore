@interface SBCenterWindowSizingSettings
+ (id)settingsControllerModule;
- (BOOL)useCustomSizingForNewWindows;
- (double)bottomInset;
- (double)fullHeightScaleFactor;
- (double)fullWidthScaleFactor;
- (double)leftInset;
- (double)rightInset;
- (double)topInset;
- (void)setBottomInset:(double)a3;
- (void)setDefaultValues;
- (void)setFullHeightScaleFactor:(double)a3;
- (void)setFullWidthScaleFactor:(double)a3;
- (void)setLeftInset:(double)a3;
- (void)setRightInset:(double)a3;
- (void)setTopInset:(double)a3;
- (void)setUseCustomSizingForNewWindows:(BOOL)a3;
@end

@implementation SBCenterWindowSizingSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBCenterWindowSizingSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBCenterWindowSizingSettings *)self setUseCustomSizingForNewWindows:1];
  [(SBCenterWindowSizingSettings *)self setFullWidthScaleFactor:1.0];
  [(SBCenterWindowSizingSettings *)self setFullHeightScaleFactor:1.0];
  [(SBCenterWindowSizingSettings *)self setTopInset:0.0];
  [(SBCenterWindowSizingSettings *)self setBottomInset:0.0];
  [(SBCenterWindowSizingSettings *)self setLeftInset:0.0];
  [(SBCenterWindowSizingSettings *)self setRightInset:0.0];
}

+ (id)settingsControllerModule
{
  v55[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Custom Window Sizing Override" valueKeyPath:@"useCustomSizingForNewWindows"];
  v55[0] = v2;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];

  v49 = [MEMORY[0x1E4F94168] sectionWithRows:v50 title:@"Open Window Sizing Settings [* scaleFactor - inset]"];
  objc_super v3 = (void *)MEMORY[0x1E4F94140];
  v4 = NSStringFromSelector(sel_fullWidthScaleFactor);
  v5 = [v3 rowWithTitle:@"Full Screen Width Scale Factor" valueKeyPath:v4];
  v6 = [v5 between:0.0 and:1.0];
  v7 = [v6 precision:2];
  v54[0] = v7;
  v8 = (void *)MEMORY[0x1E4F94140];
  v9 = NSStringFromSelector(sel_fullHeightScaleFactor);
  v10 = [v8 rowWithTitle:@"Full Screen Height Scale Factor" valueKeyPath:v9];
  v11 = [v10 between:0.0 and:1.0];
  v12 = [v11 precision:2];
  v54[1] = v12;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];

  v47 = [MEMORY[0x1E4F94168] sectionWithRows:v48 title:@"Scale Factor"];
  v13 = (void *)MEMORY[0x1E4F94140];
  v46 = NSStringFromSelector(sel_topInset);
  v45 = [v13 rowWithTitle:@"Top Inset" valueKeyPath:v46];
  v44 = [v45 between:-5000.0 and:5000.0];
  v43 = [v44 precision:2];
  v53[0] = v43;
  v14 = (void *)MEMORY[0x1E4F94140];
  v42 = NSStringFromSelector(sel_bottomInset);
  v41 = [v14 rowWithTitle:@"Bottom Inset" valueKeyPath:v42];
  v40 = [v41 between:-5000.0 and:5000.0];
  v15 = [v40 precision:2];
  v53[1] = v15;
  v16 = (void *)MEMORY[0x1E4F94140];
  v17 = NSStringFromSelector(sel_leftInset);
  v18 = [v16 rowWithTitle:@"Left Inset" valueKeyPath:v17];
  v19 = [v18 between:-5000.0 and:5000.0];
  v20 = [v19 precision:2];
  v53[2] = v20;
  v21 = (void *)MEMORY[0x1E4F94140];
  v22 = NSStringFromSelector(sel_rightInset);
  v23 = [v21 rowWithTitle:@"Right Inset" valueKeyPath:v22];
  v24 = [v23 between:-5000.0 and:5000.0];
  v25 = [v24 precision:2];
  v53[3] = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:4];

  v27 = (void *)v26;
  v28 = [MEMORY[0x1E4F94168] sectionWithRows:v26 title:@"Inset"];
  v29 = (void *)MEMORY[0x1E4F94100];
  v30 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v31 = [v29 rowWithTitle:@"Restore Defaults" action:v30];

  v32 = (void *)MEMORY[0x1E4F94168];
  v52 = v31;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  v34 = [v32 sectionWithRows:v33];

  v35 = (void *)MEMORY[0x1E4F1CA48];
  v51[0] = v49;
  v51[1] = v47;
  v51[2] = v28;
  v51[3] = v34;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:4];
  v37 = [v35 arrayWithArray:v36];

  v38 = [MEMORY[0x1E4F94168] moduleWithTitle:@"Open New Window Sizing Override" contents:v37];

  return v38;
}

- (BOOL)useCustomSizingForNewWindows
{
  return self->_useCustomSizingForNewWindows;
}

- (void)setUseCustomSizingForNewWindows:(BOOL)a3
{
  self->_useCustomSizingForNewWindows = a3;
}

- (double)fullWidthScaleFactor
{
  return self->_fullWidthScaleFactor;
}

- (void)setFullWidthScaleFactor:(double)a3
{
  self->_fullWidthScaleFactor = a3;
}

- (double)fullHeightScaleFactor
{
  return self->_fullHeightScaleFactor;
}

- (void)setFullHeightScaleFactor:(double)a3
{
  self->_fullHeightScaleFactor = a3;
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (void)setBottomInset:(double)a3
{
  self->_bottomInset = a3;
}

- (double)leftInset
{
  return self->_leftInset;
}

- (void)setLeftInset:(double)a3
{
  self->_leftInset = a3;
}

- (double)rightInset
{
  return self->_rightInset;
}

- (void)setRightInset:(double)a3
{
  self->_rightInset = a3;
}

@end