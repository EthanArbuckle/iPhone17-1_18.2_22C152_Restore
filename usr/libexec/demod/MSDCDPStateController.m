@interface MSDCDPStateController
- (BOOL)isCDPEnabled;
- (BOOL)isCDPManateeAvailable;
- (BOOL)isRecoveryKeyAvailable:(id *)a3;
- (CDPStateController)cdpController;
- (MSDCDPStateController)initWithAuthenticationResults:(id)a3;
- (MSDCDPStateController)initWithCDPContext:(id)a3;
- (id)generateRecoveryKeyWithError:(id *)a3;
- (id)initForPrimaryiCloudAccount;
- (void)dealloc;
- (void)setCdpController:(id)a3;
@end

@implementation MSDCDPStateController

- (id)initForPrimaryiCloudAccount
{
  v3 = +[CDPContext contextForPrimaryAccount];
  if (v3)
  {
    self = [(MSDCDPStateController *)self initWithCDPContext:v3];
    v4 = self;
  }
  else
  {
    v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000DAA28(v5);
    }

    v4 = 0;
  }

  return v4;
}

- (MSDCDPStateController)initWithAuthenticationResults:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)CDPContext) initWithAuthenticationResults:v4];

  v6 = [(MSDCDPStateController *)self initWithCDPContext:v5];
  return v6;
}

- (MSDCDPStateController)initWithCDPContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSDCDPStateController;
  id v5 = [(MSDCDPStateController *)&v8 init];
  if (v5)
  {
    id v6 = [objc_alloc((Class)CDPStateController) initWithContext:v4];
    [(MSDCDPStateController *)v5 setCdpController:v6];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [(MSDCDPStateController *)self cdpController];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)MSDCDPStateController;
  [(MSDCDPStateController *)&v4 dealloc];
}

- (BOOL)isCDPEnabled
{
  v2 = [(MSDCDPStateController *)self cdpController];
  v3 = [v2 context];
  objc_super v4 = [v3 dsid];
  id v5 = [v4 stringValue];

  if (v5)
  {
    unsigned __int8 v6 = +[CDPAccount isICDPEnabledForDSID:v5];
  }
  else
  {
    v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000DAA6C(v7);
    }

    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isCDPManateeAvailable
{
  v2 = [(MSDCDPStateController *)self cdpController];
  id v8 = 0;
  unsigned __int8 v3 = [v2 isManateeAvailable:&v8];
  id v4 = v8;

  if ((v3 & 1) == 0)
  {
    id v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v6 = [v4 localizedDescription];
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CDP manatee is NOT available because: %{public}@", buf, 0xCu);
    }
  }

  return v3;
}

- (BOOL)isRecoveryKeyAvailable:(id *)a3
{
  id v4 = [(MSDCDPStateController *)self cdpController];
  id v9 = 0;
  unsigned __int8 v5 = [v4 isRecoveryKeyAvailableWithError:&v9];
  id v6 = v9;

  if (v6)
  {
    v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000DAAB0(v6);
    }
  }
  if (a3) {
    *a3 = v6;
  }

  return v5;
}

- (id)generateRecoveryKeyWithError:(id *)a3
{
  id v4 = [(MSDCDPStateController *)self cdpController];
  id v9 = 0;
  unsigned __int8 v5 = [v4 generateRandomRecoveryKey:&v9];
  id v6 = v9;

  if (!v5)
  {
    v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000DAB38(v6);
    }
  }
  if (a3) {
    *a3 = v6;
  }

  return v5;
}

- (CDPStateController)cdpController
{
  return self->_cdpController;
}

- (void)setCdpController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end