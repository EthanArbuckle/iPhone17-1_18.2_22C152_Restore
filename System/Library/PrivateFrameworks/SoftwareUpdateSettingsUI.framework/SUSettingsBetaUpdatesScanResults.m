@interface SUSettingsBetaUpdatesScanResults
- (NSArray)betaPrograms;
- (NSString)scanUUID;
- (SDBetaProgram)enrolledBetaProgram;
- (SDDevice)currentSeedingDevice;
- (id)description;
- (id)initFromScanParam:(id)a3 withUUID:(id)a4;
- (void)setBetaPrograms:(id)a3;
- (void)setCurrentSeedingDevice:(id)a3;
- (void)setEnrolledBetaProgram:(id)a3;
- (void)setScanUUID:(id)a3;
@end

@implementation SUSettingsBetaUpdatesScanResults

- (id)initFromScanParam:(id)a3 withUUID:(id)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  v4 = v15;
  v15 = 0;
  v12.receiver = v4;
  v12.super_class = (Class)SUSettingsBetaUpdatesScanResults;
  v11 = [(SUSettingsBetaUpdatesScanResults *)&v12 init];
  v15 = v11;
  objc_storeStrong((id *)&v15, v11);
  if (v11)
  {
    [(SUSettingsBetaUpdatesScanResults *)v15 setScanUUID:v13];
    id v7 = (id)[location[0] enrolledBetaProgram];
    -[SUSettingsBetaUpdatesScanResults setEnrolledBetaProgram:](v15, "setEnrolledBetaProgram:");

    id v8 = (id)[location[0] betaPrograms];
    -[SUSettingsBetaUpdatesScanResults setBetaPrograms:](v15, "setBetaPrograms:");

    id v9 = (id)[location[0] currentSeedingDevice];
    -[SUSettingsBetaUpdatesScanResults setCurrentSeedingDevice:](v15, "setCurrentSeedingDevice:");
  }
  v6 = v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v6;
}

- (id)description
{
  v4 = NSString;
  v2 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v2);
  id v8 = [(SUSettingsBetaUpdatesScanResults *)self scanUUID];
  id v7 = [(SUSettingsBetaUpdatesScanResults *)self enrolledBetaProgram];
  v6 = [(SUSettingsBetaUpdatesScanResults *)self betaPrograms];
  v5 = [(SUSettingsBetaUpdatesScanResults *)self currentSeedingDevice];
  id v10 = (id)[v4 stringWithFormat:@"<%@: %p, \n\tscanUUID: %@, \n\tenrolledBetaProgram: %@, \n\tbetaPrograms: %@, \n\tcurrentSeedingDevice: %@ >", v9, self, v8, v7, v6, v5];

  return v10;
}

- (NSString)scanUUID
{
  return self->_scanUUID;
}

- (void)setScanUUID:(id)a3
{
}

- (SDDevice)currentSeedingDevice
{
  return self->_currentSeedingDevice;
}

- (void)setCurrentSeedingDevice:(id)a3
{
}

- (NSArray)betaPrograms
{
  return self->_betaPrograms;
}

- (void)setBetaPrograms:(id)a3
{
}

- (SDBetaProgram)enrolledBetaProgram
{
  return self->_enrolledBetaProgram;
}

- (void)setEnrolledBetaProgram:(id)a3
{
}

- (void).cxx_destruct
{
}

@end