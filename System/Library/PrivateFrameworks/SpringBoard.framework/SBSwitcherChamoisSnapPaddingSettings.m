@interface SBSwitcherChamoisSnapPaddingSettings
+ (id)settingsControllerModule;
- (BOOL)isEqual:(id)a3;
- (SBSwitcherChamoisSnapPaddingSettings)initWithDefaultValues;
- (double)edgePadding;
- (double)multiAppCenterPadding;
- (double)singleAppCenterPadding;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setEdgePadding:(double)a3;
- (void)setMultiAppCenterPadding:(double)a3;
- (void)setSingleAppCenterPadding:(double)a3;
@end

@implementation SBSwitcherChamoisSnapPaddingSettings

- (SBSwitcherChamoisSnapPaddingSettings)initWithDefaultValues
{
  v7.receiver = self;
  v7.super_class = (Class)SBSwitcherChamoisSnapPaddingSettings;
  v2 = [(PTSettings *)&v7 initWithDefaultValues];
  v3 = v2;
  if (v2)
  {
    [(SBSwitcherChamoisSnapPaddingSettings *)v2 setEdgePadding:45.0];
    [(SBSwitcherChamoisSnapPaddingSettings *)v3 edgePadding];
    [(SBSwitcherChamoisSnapPaddingSettings *)v3 setSingleAppCenterPadding:v4 + v4];
    [(SBSwitcherChamoisSnapPaddingSettings *)v3 edgePadding];
    [(SBSwitcherChamoisSnapPaddingSettings *)v3 setMultiAppCenterPadding:v5 * 0.5];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (SBSwitcherChamoisSnapPaddingSettings *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      [(SBSwitcherChamoisSnapPaddingSettings *)v5 edgePadding];
      if (BSFloatEqualToFloat()
        && ([(SBSwitcherChamoisSnapPaddingSettings *)v5 multiAppCenterPadding],
            BSFloatEqualToFloat()))
      {
        [(SBSwitcherChamoisSnapPaddingSettings *)v5 singleAppCenterPadding];
        char v6 = BSFloatEqualToFloat();
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  [(SBSwitcherChamoisSnapPaddingSettings *)self edgePadding];
  double v4 = v3;
  [(SBSwitcherChamoisSnapPaddingSettings *)self multiAppCenterPadding];
  double v6 = v5 * 1000000.0 + v4 * 1000.0;
  [(SBSwitcherChamoisSnapPaddingSettings *)self singleAppCenterPadding];
  return (unint64_t)(v6 + v7 * 1000000000.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_opt_new();
  [v4 setEdgePadding:self->_edgePadding];
  [v4 setMultiAppCenterPadding:self->_multiAppCenterPadding];
  [v4 setSingleAppCenterPadding:self->_singleAppCenterPadding];
  return v4;
}

+ (id)settingsControllerModule
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94168];
  double v3 = (void *)MEMORY[0x1E4F94140];
  v22 = NSStringFromSelector(sel_edgePadding);
  v21 = [v3 rowWithTitle:@"Edge Padding" valueKeyPath:v22];
  v20 = [v21 between:0.0 and:300.0];
  v19 = [v20 precision:2];
  v23[0] = v19;
  double v4 = (void *)MEMORY[0x1E4F94140];
  v18 = NSStringFromSelector(sel_singleAppCenterPadding);
  v17 = [v4 rowWithTitle:@"Single App Center Padding" valueKeyPath:v18];
  double v5 = [v17 between:0.0 and:300.0];
  double v6 = [v5 precision:2];
  v23[1] = v6;
  double v7 = (void *)MEMORY[0x1E4F94140];
  v8 = NSStringFromSelector(sel_multiAppCenterPadding);
  v9 = [v7 rowWithTitle:@"Multi App Center Padding" valueKeyPath:v8];
  v10 = [v9 between:0.0 and:300.0];
  v11 = [v10 precision:2];
  v23[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  v13 = [v2 sectionWithRows:v12];
  v24[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v15 = [v2 moduleWithTitle:@"Snap Padding Settings" contents:v14];

  return v15;
}

- (double)multiAppCenterPadding
{
  return self->_multiAppCenterPadding;
}

- (void)setMultiAppCenterPadding:(double)a3
{
  self->_multiAppCenterPadding = a3;
}

- (double)singleAppCenterPadding
{
  return self->_singleAppCenterPadding;
}

- (void)setSingleAppCenterPadding:(double)a3
{
  self->_singleAppCenterPadding = a3;
}

- (double)edgePadding
{
  return self->_edgePadding;
}

- (void)setEdgePadding:(double)a3
{
  self->_edgePadding = a3;
}

@end