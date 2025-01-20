@interface SUSUISoftwareUpdateInstallOptions
- (BOOL)automaticInstallAttempt;
- (BOOL)installDark;
- (BOOL)rescheduleIfAuthFails;
- (SUSUISoftwareUpdateInstallOptions)init;
- (id)description;
- (unint64_t)ignorableConstraints;
- (void)setAutomaticInstallAttempt:(BOOL)a3;
- (void)setIgnorableConstraints:(unint64_t)a3;
- (void)setInstallDark:(BOOL)a3;
- (void)setRescheduleIfAuthFails:(BOOL)a3;
@end

@implementation SUSUISoftwareUpdateInstallOptions

- (SUSUISoftwareUpdateInstallOptions)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUSUISoftwareUpdateInstallOptions;
  v6 = [(SUSUISoftwareUpdateInstallOptions *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6)
  {
    v6->_automaticInstallAttempt = 0;
    v6->_installDark = 0;
    v6->_rescheduleIfAuthFails = 0;
    v6->_ignorableConstraints = 0;
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (id)description
{
  v9 = self;
  v8[1] = (id)a2;
  v8[0] = +[BSDescriptionBuilder builderWithObject:self];
  id v2 = [v8[0] appendBool:v9->_installDark withName:@"InstallDark"];
  id v3 = [v8[0] appendBool:v9->_automaticInstallAttempt withName:@"AutomaticInstallAttempt"];
  id v4 = [v8[0] appendBool:v9->_rescheduleIfAuthFails withName:@"RescheduleIfAuthFails"];
  id v5 = [v8[0] appendUnsignedInteger:v9->_ignorableConstraints withName:@"IgnorableConstraints"];
  id v7 = [v8[0] build];
  objc_storeStrong(v8, 0);

  return v7;
}

- (BOOL)automaticInstallAttempt
{
  return self->_automaticInstallAttempt;
}

- (void)setAutomaticInstallAttempt:(BOOL)a3
{
  self->_automaticInstallAttempt = a3;
}

- (BOOL)installDark
{
  return self->_installDark;
}

- (void)setInstallDark:(BOOL)a3
{
  self->_installDark = a3;
}

- (BOOL)rescheduleIfAuthFails
{
  return self->_rescheduleIfAuthFails;
}

- (void)setRescheduleIfAuthFails:(BOOL)a3
{
  self->_rescheduleIfAuthFails = a3;
}

- (unint64_t)ignorableConstraints
{
  return self->_ignorableConstraints;
}

- (void)setIgnorableConstraints:(unint64_t)a3
{
  self->_ignorableConstraints = a3;
}

@end