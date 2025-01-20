@interface PackagePowerCC
- (PackagePowerCC)initWithParams:(__CFDictionary *)a3;
- (void)defaultAction;
- (void)defaultCPMSAction;
- (void)updatePowerTarget;
@end

@implementation PackagePowerCC

- (PackagePowerCC)initWithParams:(__CFDictionary *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PackagePowerCC;
  v4 = [(ComponentControl *)&v8 initWithCC:13 :0];
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, @"%d PackagePower ", 13);
    v5->super.previousValue = v5->super.currentLoadingIndex;
    *(&v5->super.currentPower + 1) = [(id)qword_1000AB158 requestListID];
    [(ComponentControl *)v5 updatePowerParameters:a3];
    if (LOBYTE(v5->super._minPower))
    {
      [(id)qword_1000AB158 setMaxPackagePower:v5->super._nominalPowerTarget];
      [(ComponentControl *)v5 setPowerTarget:v5->super.releaseRate];
    }
    else
    {
      v6 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100056940(v6);
      }
    }
    if (sub_100037D8C(a3, @"expectsCPMSSupport", 0))
    {
      [(id)qword_1000AB158 setCPMSMitigationsEnabled:1];
      [(ComponentControl *)v5 setCPMSMitigationState:1];
    }
    [objc_msgSend((id)qword_1000AB158, "setPackagePowerCeiling:fromDecisionSource:", -[ComponentControl powerTarget](v5, "powerTarget"), *(&v5->super.currentPower + 1));
    [(id)qword_1000AB158 updatePackage];
  }
  return v5;
}

- (void)defaultAction
{
}

- (void)defaultCPMSAction
{
}

- (void)updatePowerTarget
{
  [(ComponentControl *)self setPowerTarget:[(ComponentControl *)self computePowerTarget]];
  if (byte_1000AA7A0)
  {
    v3 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = [(ComponentControl *)self powerTarget];
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<Notice> Updating PackagePower target: %u", (uint8_t *)v4, 8u);
    }
  }
  [objc_msgSend((id)qword_1000AB158, "setPackagePowerCeiling:fromDecisionSource:", -[ComponentControl powerTarget](self, "powerTarget"), *(&self->super.currentPower + 1));
  [(id)qword_1000AB158 updatePackage];
}

@end