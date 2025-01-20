@interface SBFLockScreenActionContext
- (BOOL)canBypassPinLock;
- (BOOL)confirmedNotInPocket;
- (BOOL)deactivateAwayController;
- (BOOL)hasCustomUnlockLabel;
- (BOOL)requiresAuthentication;
- (BOOL)requiresUIUnlock;
- (BOOL)wantsBiometricPresentation;
- (NSString)identifier;
- (NSString)lockLabel;
- (NSString)shortLockLabel;
- (NSString)unlockDestination;
- (SBFLockScreenActionContext)initWithLockLabel:(id)a3 shortLockLabel:(id)a4 action:(id)a5 identifier:(id)a6;
- (id)action;
- (int)intent;
- (int)source;
- (void)setAction:(id)a3;
- (void)setCanBypassPinLock:(BOOL)a3;
- (void)setConfirmedNotInPocket:(BOOL)a3;
- (void)setDeactivateAwayController:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIntent:(int)a3;
- (void)setLockLabel:(id)a3;
- (void)setRequiresAuthentication:(BOOL)a3;
- (void)setRequiresUIUnlock:(BOOL)a3;
- (void)setShortLockLabel:(id)a3;
- (void)setSource:(int)a3;
- (void)setUnlockDestination:(id)a3;
- (void)setWantsBiometricPresentation:(BOOL)a3;
@end

@implementation SBFLockScreenActionContext

- (SBFLockScreenActionContext)initWithLockLabel:(id)a3 shortLockLabel:(id)a4 action:(id)a5 identifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBFLockScreenActionContext;
  v15 = [(SBFLockScreenActionContext *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_lockLabel, a3);
    objc_storeStrong((id *)&v16->_shortLockLabel, a4);
    uint64_t v17 = [v13 copy];
    id action = v16->_action;
    v16->_id action = (id)v17;

    objc_storeStrong((id *)&v16->_identifier, a6);
  }

  return v16;
}

- (NSString)lockLabel
{
  if (lockLabel___once != -1) {
    dispatch_once(&lockLabel___once, &__block_literal_global_11);
  }
  if (self->_lockLabel) {
    lockLabel = self->_lockLabel;
  }
  else {
    lockLabel = (NSString *)lockLabel___defaultLockLabel;
  }
  return lockLabel;
}

void __39__SBFLockScreenActionContext_lockLabel__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v2 localizedStringForKey:@"AWAY_LOCK_LABEL" value:&stru_1ED879EF8 table:@"SpringBoard"];
  v1 = (void *)lockLabel___defaultLockLabel;
  lockLabel___defaultLockLabel = v0;
}

- (NSString)shortLockLabel
{
  if (shortLockLabel___once != -1) {
    dispatch_once(&shortLockLabel___once, &__block_literal_global_9);
  }
  if (self->_shortLockLabel) {
    shortLockLabel = self->_shortLockLabel;
  }
  else {
    shortLockLabel = (NSString *)shortLockLabel___defaultShortLockLabel;
  }
  return shortLockLabel;
}

void __44__SBFLockScreenActionContext_shortLockLabel__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v2 localizedStringForKey:@"AWAY_LOCK_LABEL_SHORT" value:&stru_1ED879EF8 table:@"SpringBoard"];
  v1 = (void *)shortLockLabel___defaultShortLockLabel;
  shortLockLabel___defaultShortLockLabel = v0;
}

- (BOOL)hasCustomUnlockLabel
{
  return [(NSString *)self->_lockLabel length] != 0;
}

- (void)setLockLabel:(id)a3
{
}

- (void)setShortLockLabel:(id)a3
{
}

- (NSString)unlockDestination
{
  return self->_unlockDestination;
}

- (void)setUnlockDestination:(id)a3
{
}

- (int)source
{
  return self->_source;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (int)intent
{
  return self->_intent;
}

- (void)setIntent:(int)a3
{
  self->_intent = a3;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)requiresUIUnlock
{
  return self->_requiresUIUnlock;
}

- (void)setRequiresUIUnlock:(BOOL)a3
{
  self->_requiresUIUnlock = a3;
}

- (BOOL)deactivateAwayController
{
  return self->_deactivateAwayController;
}

- (void)setDeactivateAwayController:(BOOL)a3
{
  self->_deactivateAwayController = a3;
}

- (BOOL)canBypassPinLock
{
  return self->_canBypassPinLock;
}

- (void)setCanBypassPinLock:(BOOL)a3
{
  self->_canBypassPinLock = a3;
}

- (BOOL)wantsBiometricPresentation
{
  return self->_wantsBiometricPresentation;
}

- (void)setWantsBiometricPresentation:(BOOL)a3
{
  self->_wantsBiometricPresentation = a3;
}

- (BOOL)confirmedNotInPocket
{
  return self->_confirmedNotInPocket;
}

- (void)setConfirmedNotInPocket:(BOOL)a3
{
  self->_confirmedNotInPocket = a3;
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  self->_requiresAuthentication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_unlockDestination, 0);
  objc_storeStrong((id *)&self->_shortLockLabel, 0);
  objc_storeStrong((id *)&self->_lockLabel, 0);
}

@end