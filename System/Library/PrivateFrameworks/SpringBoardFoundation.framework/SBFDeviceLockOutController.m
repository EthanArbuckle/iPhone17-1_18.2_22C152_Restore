@interface SBFDeviceLockOutController
- (BOOL)_isLockedOutCached;
- (BOOL)isBlocked;
- (BOOL)isLiquidDetectionCriticalUIBlocked;
- (BOOL)isLockedOut;
- (BOOL)isPermanentlyBlocked;
- (BOOL)isProximityReaderBlocked;
- (BOOL)isTemporarilyBlocked;
- (BOOL)isThermallyBlocked;
- (BOOL)isUserRequestedEraseEnabled;
- (NSString)description;
- (SBFDeviceLockOutController)initWithThermalController:(id)a3 authenticationController:(id)a4;
- (SBFLiquidDetectionBlockProvider)liquidDetectionBlockProvider;
- (SBFProximityReaderBlockProvider)proximityReaderBlockProvider;
- (SBFThermalBlockProvider)_thermalProvider;
- (SBFUserAuthenticationController)_authenticationController;
- (double)timeIntervalUntilUnblockedSinceReferenceDate;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)deviceBlockStatus;
- (void)_noteLockedOutReasonsMayHaveChanged;
- (void)_noteLockedOutStateMayHaveChanged:(BOOL)a3;
- (void)_setAuthenticationController:(id)a3;
- (void)_setLockedOutCached:(BOOL)a3;
- (void)_setThermalProvider:(id)a3;
- (void)dealloc;
- (void)setLiquidDetectionBlockProvider:(id)a3;
- (void)setProximityReaderBlockProvider:(id)a3;
@end

@implementation SBFDeviceLockOutController

- (BOOL)isLockedOut
{
  if ([(SBFDeviceLockOutController *)self isBlocked]) {
    return 1;
  }
  else {
    return ![(SBFUserAuthenticationController *)self->_authenticationController isAuthenticated];
  }
}

- (BOOL)isBlocked
{
  return [(SBFDeviceLockOutController *)self deviceBlockStatus] != 0;
}

- (unint64_t)deviceBlockStatus
{
  unint64_t v3 = [(SBFDeviceLockOutController *)self isPermanentlyBlocked];
  if ([(SBFDeviceLockOutController *)self isTemporarilyBlocked]) {
    v3 |= 2uLL;
  }
  if ([(SBFDeviceLockOutController *)self isThermallyBlocked]) {
    v3 |= 4uLL;
  }
  if ([(SBFDeviceLockOutController *)self isLiquidDetectionCriticalUIBlocked]) {
    return v3 | 8;
  }
  else {
    return v3;
  }
}

- (BOOL)isThermallyBlocked
{
  return [(SBFThermalBlockProvider *)self->_thermalProvider isThermalBlocked];
}

- (BOOL)isTemporarilyBlocked
{
  return [(SBFUserAuthenticationController *)self->_authenticationController _isTemporarilyBlocked];
}

- (BOOL)isPermanentlyBlocked
{
  return [(SBFUserAuthenticationController *)self->_authenticationController _isPermanentlyBlocked];
}

- (BOOL)isLiquidDetectionCriticalUIBlocked
{
  return [(SBFLiquidDetectionBlockProvider *)self->_liquidDetectionBlockProvider isLiquidDetectionBlocked];
}

- (SBFDeviceLockOutController)initWithThermalController:(id)a3 authenticationController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBFDeviceLockOutController;
  v9 = [(SBFDeviceLockOutController *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_thermalProvider, a3);
    thermalProvider = v10->_thermalProvider;
    if (thermalProvider) {
      [(SBFThermalBlockProvider *)thermalProvider addThermalObserver:v10];
    }
    objc_storeStrong((id *)&v10->_authenticationController, a4);
    [(SBFUserAuthenticationController *)v10->_authenticationController _addPrivateAuthenticationObserver:v10];
    liquidDetectionBlockProvider = v10->_liquidDetectionBlockProvider;
    v10->_liquidDetectionBlockProvider = 0;

    proximityReaderBlockProvider = v10->_proximityReaderBlockProvider;
    v10->_proximityReaderBlockProvider = 0;

    v10->_lastBlockedStatus = 0;
    [(SBFDeviceLockOutController *)v10 _noteLockedOutStateMayHaveChanged:1];
  }

  return v10;
}

- (void)dealloc
{
  [(SBFThermalBlockProvider *)self->_thermalProvider removeThermalObserver:self];
  [(SBFLiquidDetectionBlockProvider *)self->_liquidDetectionBlockProvider removeLiquidDetectionObserver:self];
  [(SBFProximityReaderBlockProvider *)self->_proximityReaderBlockProvider removeProximityReaderObserver:self];
  [(SBFUserAuthenticationController *)self->_authenticationController _removePrivateAuthenticationObserver:self];
  unint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBFDeviceLockOutController;
  [(SBFDeviceLockOutController *)&v4 dealloc];
}

- (void)setLiquidDetectionBlockProvider:(id)a3
{
  v5 = (SBFLiquidDetectionBlockProvider *)a3;
  liquidDetectionBlockProvider = self->_liquidDetectionBlockProvider;
  if (liquidDetectionBlockProvider != v5)
  {
    id v7 = v5;
    if (liquidDetectionBlockProvider) {
      [(SBFLiquidDetectionBlockProvider *)liquidDetectionBlockProvider removeLiquidDetectionObserver:self];
    }
    objc_storeStrong((id *)&self->_liquidDetectionBlockProvider, a3);
    liquidDetectionBlockProvider = (SBFLiquidDetectionBlockProvider *)[(SBFLiquidDetectionBlockProvider *)self->_liquidDetectionBlockProvider addLiquidDetectionObserver:self];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](liquidDetectionBlockProvider, v5);
}

- (void)setProximityReaderBlockProvider:(id)a3
{
  v5 = (SBFProximityReaderBlockProvider *)a3;
  proximityReaderBlockProvider = self->_proximityReaderBlockProvider;
  if (proximityReaderBlockProvider != v5)
  {
    id v7 = v5;
    if (proximityReaderBlockProvider) {
      [(SBFProximityReaderBlockProvider *)proximityReaderBlockProvider removeProximityReaderObserver:self];
    }
    objc_storeStrong((id *)&self->_proximityReaderBlockProvider, a3);
    proximityReaderBlockProvider = (SBFProximityReaderBlockProvider *)[(SBFProximityReaderBlockProvider *)self->_proximityReaderBlockProvider addProximityReaderObserver:self];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](proximityReaderBlockProvider, v5);
}

- (NSString)description
{
  return (NSString *)[(SBFDeviceLockOutController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBFDeviceLockOutController *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  unint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBFDeviceLockOutController isLockedOut](self, "isLockedOut"), @"lockedOut");
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBFDeviceLockOutController isBlocked](self, "isBlocked"), @"blocked", 1);
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBFDeviceLockOutController isPermanentlyBlocked](self, "isPermanentlyBlocked"), @"permanentlyBlocked", 1);
  id v7 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBFDeviceLockOutController isTemporarilyBlocked](self, "isTemporarilyBlocked"), @"temporarilyBlocked", 1);
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBFDeviceLockOutController isThermallyBlocked](self, "isThermallyBlocked"), @"thermallyBlocked", 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(SBFDeviceLockOutController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBFDeviceLockOutController *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_thermalProvider withName:@"thermalProvider"];
  return v4;
}

- (BOOL)isProximityReaderBlocked
{
  return [(SBFProximityReaderBlockProvider *)self->_proximityReaderBlockProvider isProximityReaderBlocked];
}

- (BOOL)isUserRequestedEraseEnabled
{
  return [(SBFUserAuthenticationController *)self->_authenticationController _isUserRequestedEraseEnabled];
}

- (double)timeIntervalUntilUnblockedSinceReferenceDate
{
  [(SBFUserAuthenticationController *)self->_authenticationController _timeUntilUnblockedSinceReferenceDate];
  double v3 = v2;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  if (v3 < v4)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v5 timeIntervalSinceReferenceDate];
    double v3 = v6;
  }
  return v3;
}

- (void)_noteLockedOutStateMayHaveChanged:(BOOL)a3
{
  BOOL lockedOutCached = [(SBFDeviceLockOutController *)self isLockedOut];
  unint64_t v6 = [(SBFDeviceLockOutController *)self deviceBlockStatus];
  if (a3 || self->_lockedOutCached != lockedOutCached || v6 != self->_lastBlockedStatus)
  {
    self->_BOOL lockedOutCached = lockedOutCached;
    self->_lastBlockedStatus = v6;
    int v7 = _noteLockedOutStateMayHaveChanged__token;
    if (_noteLockedOutStateMayHaveChanged__token == -1)
    {
      notify_register_check("com.apple.springboard.passcodeLockedOrBlocked", &_noteLockedOutStateMayHaveChanged__token);
      int v7 = _noteLockedOutStateMayHaveChanged__token;
      if (_noteLockedOutStateMayHaveChanged__token == -1) {
        return;
      }
      BOOL lockedOutCached = self->_lockedOutCached;
    }
    notify_set_state(v7, lockedOutCached);
    notify_post("com.apple.springboard.passcodeLockedOrBlocked");
  }
}

- (void)_noteLockedOutReasonsMayHaveChanged
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SBFDeviceBlockStateDidChangeNotification" object:0];

  [(SBFDeviceLockOutController *)self _noteLockedOutStateMayHaveChanged:0];
}

- (SBFLiquidDetectionBlockProvider)liquidDetectionBlockProvider
{
  return self->_liquidDetectionBlockProvider;
}

- (SBFProximityReaderBlockProvider)proximityReaderBlockProvider
{
  return self->_proximityReaderBlockProvider;
}

- (SBFUserAuthenticationController)_authenticationController
{
  return self->_authenticationController;
}

- (void)_setAuthenticationController:(id)a3
{
}

- (SBFThermalBlockProvider)_thermalProvider
{
  return self->_thermalProvider;
}

- (void)_setThermalProvider:(id)a3
{
}

- (BOOL)_isLockedOutCached
{
  return self->_lockedOutCached;
}

- (void)_setLockedOutCached:(BOOL)a3
{
  self->_BOOL lockedOutCached = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_proximityReaderBlockProvider, 0);
  objc_storeStrong((id *)&self->_liquidDetectionBlockProvider, 0);
  objc_storeStrong((id *)&self->_thermalProvider, 0);
}

@end