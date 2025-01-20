@interface SBDashBoardThermalStatusProvider
+ (id)thermometerGlyphForThermalStatus:(int64_t)a3;
- (SBDashBoardThermalStatusProvider)init;
- (SBDashBoardThermalStatusProvider)initWithThermalController:(id)a3;
- (int64_t)thermalStatus;
@end

@implementation SBDashBoardThermalStatusProvider

- (SBDashBoardThermalStatusProvider)init
{
  v3 = +[SBThermalController sharedInstance];
  v4 = [(SBDashBoardThermalStatusProvider *)self initWithThermalController:v3];

  return v4;
}

- (SBDashBoardThermalStatusProvider)initWithThermalController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardThermalStatusProvider;
  v6 = [(SBDashBoardThermalStatusProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_thermalController, a3);
  }

  return v7;
}

- (int64_t)thermalStatus
{
  unint64_t v2 = [(SBThermalController *)self->_thermalController level];
  if (v2 > 3) {
    return -1;
  }
  else {
    return qword_1D8FD0E48[v2];
  }
}

+ (id)thermometerGlyphForThermalStatus:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 2)
  {
    objc_super v9 = 0;
  }
  else
  {
    v4 = off_1E6AFB5D8[a3 + 1];
    id v5 = (void *)MEMORY[0x1E4F42A98];
    int v6 = __sb__runningInSpringBoard();
    char v7 = v6;
    if (v6)
    {
      BOOL v8 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      v3 = [MEMORY[0x1E4F42948] currentDevice];
      BOOL v8 = [v3 userInterfaceIdiom] == 1;
    }
    double v10 = 58.0;
    if (v8) {
      double v10 = 80.0;
    }
    v11 = [v5 configurationWithPointSize:3 weight:v10];
    v12 = [MEMORY[0x1E4F42A98] configurationPreferringMulticolor];
    v13 = [v11 configurationByApplyingConfiguration:v12];

    if ((v7 & 1) == 0) {
    objc_super v9 = [MEMORY[0x1E4F42A80] systemImageNamed:v4 withConfiguration:v13];
    }
  }
  return v9;
}

- (void).cxx_destruct
{
}

@end