@interface SiriContextOverride
+ (BOOL)supportsSecureCoding;
- (BOOL)accessibilityShortcutEnabledForSystemState:(id)a3;
- (BOOL)carDNDActiveForSystemState:(id)a3;
- (BOOL)deviceIsBlockedForSystemState:(id)a3;
- (BOOL)deviceIsPasscodeLockedForSystemState:(id)a3;
- (BOOL)hasUnlockedSinceBootForSystemState:(id)a3;
- (BOOL)isConnectedToCarPlayForSystemState:(id)a3;
- (BOOL)isConnectedToTrustedCarPlayForSystemState:(id)a3;
- (BOOL)isPadForSystemState:(id)a3;
- (BOOL)pocketStateShouldPreventVoiceTriggerForSystemState:(id)a3;
- (BOOL)siriIsEnabledForSystemState:(id)a3;
- (BOOL)siriIsRestrictedForSystemState:(id)a3;
- (BOOL)siriIsSupportedForSystemState:(id)a3;
- (BOOL)smartCoverClosedForSystemState:(id)a3;
- (NSNumber)accessibilityShortcutEnabled;
- (NSNumber)carDNDActive;
- (NSNumber)connectedToCarPlay;
- (NSNumber)connectedToTrustedCarPlay;
- (NSNumber)deviceIsBlocked;
- (NSNumber)deviceIsPasscodeLocked;
- (NSNumber)pad;
- (NSNumber)pocketStateShouldPreventVoiceTrigger;
- (NSNumber)siriIsEnabled;
- (NSNumber)siriIsRestricted;
- (NSNumber)siriIsSupported;
- (NSNumber)smartCoverClosed;
- (NSNumber)unlockedSinceBoot;
- (NSString)currentSpokenLanguageCode;
- (SiriContextOverride)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentSpokenLanguageCodeForSystemState:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)overrideAccessibilityShortcutEnabled:(BOOL)a3;
- (void)overrideCarDNDActive:(BOOL)a3;
- (void)overrideConnectedToCarPlay:(BOOL)a3;
- (void)overrideConnectedToTrustedCarPlay:(BOOL)a3;
- (void)overrideDeviceIsBlocked:(BOOL)a3;
- (void)overrideDeviceIsPasscodeLocked:(BOOL)a3;
- (void)overrideHasUnlockedSinceBoot:(BOOL)a3;
- (void)overrideIsPad:(BOOL)a3;
- (void)overridePocketStateShouldPreventVoiceTrigger:(BOOL)a3;
- (void)overrideSiriIsEnabled:(BOOL)a3;
- (void)overrideSiriIsRestricted:(BOOL)a3;
- (void)overrideSiriIsSupported:(BOOL)a3;
- (void)overrideSmartCoverClosed:(BOOL)a3;
- (void)setAccessibilityShortcutEnabled:(id)a3;
- (void)setCarDNDActive:(id)a3;
- (void)setConnectedToCarPlay:(id)a3;
- (void)setConnectedToTrustedCarPlay:(id)a3;
- (void)setCurrentSpokenLanguageCode:(id)a3;
- (void)setDeviceIsBlocked:(id)a3;
- (void)setDeviceIsPasscodeLocked:(id)a3;
- (void)setPad:(id)a3;
- (void)setPocketStateShouldPreventVoiceTrigger:(id)a3;
- (void)setSiriIsEnabled:(id)a3;
- (void)setSiriIsRestricted:(id)a3;
- (void)setSiriIsSupported:(id)a3;
- (void)setSmartCoverClosed:(id)a3;
- (void)setUnlockedSinceBoot:(id)a3;
@end

@implementation SiriContextOverride

- (void)overrideHasUnlockedSinceBoot:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(SiriContextOverride *)self setUnlockedSinceBoot:v4];
}

- (void)overrideDeviceIsBlocked:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(SiriContextOverride *)self setDeviceIsBlocked:v4];
}

- (void)overrideDeviceIsPasscodeLocked:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(SiriContextOverride *)self setDeviceIsPasscodeLocked:v4];
}

- (void)overridePocketStateShouldPreventVoiceTrigger:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(SiriContextOverride *)self setPocketStateShouldPreventVoiceTrigger:v4];
}

- (void)overrideIsPad:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(SiriContextOverride *)self setPad:v4];
}

- (void)overrideSmartCoverClosed:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(SiriContextOverride *)self setSmartCoverClosed:v4];
}

- (void)overrideAccessibilityShortcutEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(SiriContextOverride *)self setAccessibilityShortcutEnabled:v4];
}

- (void)overrideCarDNDActive:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(SiriContextOverride *)self setCarDNDActive:v4];
}

- (void)overrideConnectedToTrustedCarPlay:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(SiriContextOverride *)self setConnectedToTrustedCarPlay:v4];
}

- (void)overrideConnectedToCarPlay:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(SiriContextOverride *)self setConnectedToCarPlay:v4];
}

- (void)overrideSiriIsEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(SiriContextOverride *)self setSiriIsEnabled:v4];
}

- (void)overrideSiriIsRestricted:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(SiriContextOverride *)self setSiriIsRestricted:v4];
}

- (void)overrideSiriIsSupported:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(SiriContextOverride *)self setSiriIsSupported:v4];
}

- (id)currentSpokenLanguageCodeForSystemState:(id)a3
{
  id v4 = (SiriContextOverride *)a3;
  v5 = [(SiriContextOverride *)self currentSpokenLanguageCode];
  if (v5) {
    v6 = self;
  }
  else {
    v6 = v4;
  }
  v7 = [(SiriContextOverride *)v6 currentSpokenLanguageCode];

  return v7;
}

- (BOOL)hasUnlockedSinceBootForSystemState:(id)a3
{
  id v4 = a3;
  v5 = [(SiriContextOverride *)self unlockedSinceBoot];
  if (v5)
  {
    v6 = [(SiriContextOverride *)self unlockedSinceBoot];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = [v4 hasUnlockedSinceBoot];
  }

  return v7;
}

- (BOOL)deviceIsBlockedForSystemState:(id)a3
{
  id v4 = a3;
  v5 = [(SiriContextOverride *)self deviceIsBlocked];
  if (v5)
  {
    v6 = [(SiriContextOverride *)self deviceIsBlocked];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = [v4 deviceIsBlocked];
  }

  return v7;
}

- (BOOL)deviceIsPasscodeLockedForSystemState:(id)a3
{
  id v4 = a3;
  v5 = [(SiriContextOverride *)self deviceIsPasscodeLocked];
  if (v5)
  {
    v6 = [(SiriContextOverride *)self deviceIsPasscodeLocked];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = [v4 deviceIsPasscodeLocked];
  }

  return v7;
}

- (BOOL)pocketStateShouldPreventVoiceTriggerForSystemState:(id)a3
{
  id v4 = [(SiriContextOverride *)self pocketStateShouldPreventVoiceTrigger];
  if (v4)
  {
    v5 = [(SiriContextOverride *)self pocketStateShouldPreventVoiceTrigger];
    char v6 = [v5 BOOLValue];
  }
  else
  {
    v5 = +[SASSiriPocketStateManager sharedManager];
    char v6 = [v5 pocketStateShouldPreventVoiceTrigger];
  }
  BOOL v7 = v6;

  return v7;
}

- (BOOL)isPadForSystemState:(id)a3
{
  id v4 = a3;
  v5 = [(SiriContextOverride *)self pad];
  if (v5)
  {
    char v6 = [(SiriContextOverride *)self pad];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = [v4 isPad];
  }

  return v7;
}

- (BOOL)smartCoverClosedForSystemState:(id)a3
{
  id v4 = a3;
  v5 = [(SiriContextOverride *)self smartCoverClosed];
  if (v5)
  {
    char v6 = [(SiriContextOverride *)self smartCoverClosed];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = [v4 smartCoverClosed];
  }

  return v7;
}

- (BOOL)accessibilityShortcutEnabledForSystemState:(id)a3
{
  id v4 = a3;
  v5 = [(SiriContextOverride *)self accessibilityShortcutEnabled];
  if (v5)
  {
    char v6 = [(SiriContextOverride *)self accessibilityShortcutEnabled];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = [v4 accessibilityShortcutEnabled];
  }

  return v7;
}

- (BOOL)carDNDActiveForSystemState:(id)a3
{
  id v4 = a3;
  v5 = [(SiriContextOverride *)self carDNDActive];
  if (v5)
  {
    char v6 = [(SiriContextOverride *)self carDNDActive];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = [v4 carDNDActive];
  }

  return v7;
}

- (BOOL)isConnectedToCarPlayForSystemState:(id)a3
{
  id v4 = a3;
  v5 = [(SiriContextOverride *)self connectedToCarPlay];
  if (v5)
  {
    char v6 = [(SiriContextOverride *)self connectedToCarPlay];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = [v4 isConnectedToCarPlay];
  }

  return v7;
}

- (BOOL)isConnectedToTrustedCarPlayForSystemState:(id)a3
{
  id v4 = a3;
  v5 = [(SiriContextOverride *)self connectedToTrustedCarPlay];
  if (v5)
  {
    char v6 = [(SiriContextOverride *)self connectedToTrustedCarPlay];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = [v4 isConnectedToTrustedCarPlay];
  }

  return v7;
}

- (BOOL)siriIsEnabledForSystemState:(id)a3
{
  id v4 = a3;
  v5 = [(SiriContextOverride *)self siriIsEnabled];
  if (v5)
  {
    char v6 = [(SiriContextOverride *)self siriIsEnabled];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = [v4 siriIsEnabled];
  }

  return v7;
}

- (BOOL)siriIsRestrictedForSystemState:(id)a3
{
  id v4 = a3;
  v5 = [(SiriContextOverride *)self siriIsRestricted];
  if (v5)
  {
    char v6 = [(SiriContextOverride *)self siriIsRestricted];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = [v4 siriIsRestricted];
  }

  return v7;
}

- (BOOL)siriIsSupportedForSystemState:(id)a3
{
  id v4 = a3;
  v5 = [(SiriContextOverride *)self siriIsSupported];
  if (v5)
  {
    char v6 = [(SiriContextOverride *)self siriIsSupported];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = [v4 siriIsSupported];
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriContextOverride)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SiriContextOverride;
  v5 = [(SiriContextOverride *)&v21 init];
  if (v5)
  {
    char v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentSpokenLanguageCode"];
    [(SiriContextOverride *)v5 setCurrentSpokenLanguageCode:v6];

    char v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unlockedSinceBoot"];
    [(SiriContextOverride *)v5 setUnlockedSinceBoot:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIsBlocked"];
    [(SiriContextOverride *)v5 setDeviceIsBlocked:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIsPasscodeLocked"];
    [(SiriContextOverride *)v5 setDeviceIsPasscodeLocked:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pocketStateShouldPreventVoiceTrigger"];
    [(SiriContextOverride *)v5 setPocketStateShouldPreventVoiceTrigger:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pad"];
    [(SiriContextOverride *)v5 setPad:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"smartCoverClosed"];
    [(SiriContextOverride *)v5 setSmartCoverClosed:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityShortcutEnabled"];
    [(SiriContextOverride *)v5 setAccessibilityShortcutEnabled:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carDNDActive"];
    [(SiriContextOverride *)v5 setCarDNDActive:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectedToCarPlay"];
    [(SiriContextOverride *)v5 setConnectedToCarPlay:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectedToTrustedCarPlay"];
    [(SiriContextOverride *)v5 setConnectedToTrustedCarPlay:v16];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"siriIsEnabled"];
    [(SiriContextOverride *)v5 setSiriIsEnabled:v17];

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"siriIsRestricted"];
    [(SiriContextOverride *)v5 setSiriIsRestricted:v18];

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"siriIsSupported"];
    [(SiriContextOverride *)v5 setSiriIsSupported:v19];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SiriContextOverride *)self currentSpokenLanguageCode];
  [v4 encodeObject:v5 forKey:@"currentSpokenLanguageCode"];

  char v6 = [(SiriContextOverride *)self unlockedSinceBoot];
  [v4 encodeObject:v6 forKey:@"unlockedSinceBoot"];

  char v7 = [(SiriContextOverride *)self deviceIsBlocked];
  [v4 encodeObject:v7 forKey:@"deviceIsBlocked"];

  v8 = [(SiriContextOverride *)self deviceIsPasscodeLocked];
  [v4 encodeObject:v8 forKey:@"deviceIsPasscodeLocked"];

  v9 = [(SiriContextOverride *)self pocketStateShouldPreventVoiceTrigger];
  [v4 encodeObject:v9 forKey:@"pocketStateShouldPreventVoiceTrigger"];

  v10 = [(SiriContextOverride *)self pad];
  [v4 encodeObject:v10 forKey:@"pad"];

  v11 = [(SiriContextOverride *)self smartCoverClosed];
  [v4 encodeObject:v11 forKey:@"smartCoverClosed"];

  v12 = [(SiriContextOverride *)self accessibilityShortcutEnabled];
  [v4 encodeObject:v12 forKey:@"accessibilityShortcutEnabled"];

  v13 = [(SiriContextOverride *)self carDNDActive];
  [v4 encodeObject:v13 forKey:@"carDNDActive"];

  v14 = [(SiriContextOverride *)self connectedToCarPlay];
  [v4 encodeObject:v14 forKey:@"connectedToCarPlay"];

  v15 = [(SiriContextOverride *)self connectedToTrustedCarPlay];
  [v4 encodeObject:v15 forKey:@"connectedToTrustedCarPlay"];

  v16 = [(SiriContextOverride *)self siriIsEnabled];
  [v4 encodeObject:v16 forKey:@"siriIsEnabled"];

  v17 = [(SiriContextOverride *)self siriIsRestricted];
  [v4 encodeObject:v17 forKey:@"siriIsRestricted"];

  id v18 = [(SiriContextOverride *)self siriIsSupported];
  [v4 encodeObject:v18 forKey:@"siriIsSupported"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SiriContextOverride);
  v5 = [(SiriContextOverride *)self currentSpokenLanguageCode];
  [(SiriContextOverride *)v4 setCurrentSpokenLanguageCode:v5];

  char v6 = [(SiriContextOverride *)self unlockedSinceBoot];
  [(SiriContextOverride *)v4 setUnlockedSinceBoot:v6];

  char v7 = [(SiriContextOverride *)self deviceIsBlocked];
  [(SiriContextOverride *)v4 setDeviceIsBlocked:v7];

  v8 = [(SiriContextOverride *)self deviceIsPasscodeLocked];
  [(SiriContextOverride *)v4 setDeviceIsPasscodeLocked:v8];

  v9 = [(SiriContextOverride *)self pocketStateShouldPreventVoiceTrigger];
  [(SiriContextOverride *)v4 setPocketStateShouldPreventVoiceTrigger:v9];

  v10 = [(SiriContextOverride *)self pad];
  [(SiriContextOverride *)v4 setPad:v10];

  v11 = [(SiriContextOverride *)self smartCoverClosed];
  [(SiriContextOverride *)v4 setSmartCoverClosed:v11];

  v12 = [(SiriContextOverride *)self accessibilityShortcutEnabled];
  [(SiriContextOverride *)v4 setAccessibilityShortcutEnabled:v12];

  v13 = [(SiriContextOverride *)self carDNDActive];
  [(SiriContextOverride *)v4 setCarDNDActive:v13];

  v14 = [(SiriContextOverride *)self connectedToCarPlay];
  [(SiriContextOverride *)v4 setConnectedToCarPlay:v14];

  v15 = [(SiriContextOverride *)self connectedToTrustedCarPlay];
  [(SiriContextOverride *)v4 setConnectedToTrustedCarPlay:v15];

  v16 = [(SiriContextOverride *)self siriIsEnabled];
  [(SiriContextOverride *)v4 setSiriIsEnabled:v16];

  v17 = [(SiriContextOverride *)self siriIsRestricted];
  [(SiriContextOverride *)v4 setSiriIsRestricted:v17];

  id v18 = [(SiriContextOverride *)self siriIsSupported];
  [(SiriContextOverride *)v4 setSiriIsSupported:v18];

  return v4;
}

- (NSString)currentSpokenLanguageCode
{
  return self->_currentSpokenLanguageCode;
}

- (void)setCurrentSpokenLanguageCode:(id)a3
{
}

- (NSNumber)unlockedSinceBoot
{
  return self->_unlockedSinceBoot;
}

- (void)setUnlockedSinceBoot:(id)a3
{
}

- (NSNumber)deviceIsBlocked
{
  return self->_deviceIsBlocked;
}

- (void)setDeviceIsBlocked:(id)a3
{
}

- (NSNumber)deviceIsPasscodeLocked
{
  return self->_deviceIsPasscodeLocked;
}

- (void)setDeviceIsPasscodeLocked:(id)a3
{
}

- (NSNumber)pocketStateShouldPreventVoiceTrigger
{
  return self->_pocketStateShouldPreventVoiceTrigger;
}

- (void)setPocketStateShouldPreventVoiceTrigger:(id)a3
{
}

- (NSNumber)pad
{
  return self->_pad;
}

- (void)setPad:(id)a3
{
}

- (NSNumber)smartCoverClosed
{
  return self->_smartCoverClosed;
}

- (void)setSmartCoverClosed:(id)a3
{
}

- (NSNumber)accessibilityShortcutEnabled
{
  return self->_accessibilityShortcutEnabled;
}

- (void)setAccessibilityShortcutEnabled:(id)a3
{
}

- (NSNumber)carDNDActive
{
  return self->_carDNDActive;
}

- (void)setCarDNDActive:(id)a3
{
}

- (NSNumber)connectedToCarPlay
{
  return self->_connectedToCarPlay;
}

- (void)setConnectedToCarPlay:(id)a3
{
}

- (NSNumber)connectedToTrustedCarPlay
{
  return self->_connectedToTrustedCarPlay;
}

- (void)setConnectedToTrustedCarPlay:(id)a3
{
}

- (NSNumber)siriIsEnabled
{
  return self->_siriIsEnabled;
}

- (void)setSiriIsEnabled:(id)a3
{
}

- (NSNumber)siriIsRestricted
{
  return self->_siriIsRestricted;
}

- (void)setSiriIsRestricted:(id)a3
{
}

- (NSNumber)siriIsSupported
{
  return self->_siriIsSupported;
}

- (void)setSiriIsSupported:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriIsSupported, 0);
  objc_storeStrong((id *)&self->_siriIsRestricted, 0);
  objc_storeStrong((id *)&self->_siriIsEnabled, 0);
  objc_storeStrong((id *)&self->_connectedToTrustedCarPlay, 0);
  objc_storeStrong((id *)&self->_connectedToCarPlay, 0);
  objc_storeStrong((id *)&self->_carDNDActive, 0);
  objc_storeStrong((id *)&self->_accessibilityShortcutEnabled, 0);
  objc_storeStrong((id *)&self->_smartCoverClosed, 0);
  objc_storeStrong((id *)&self->_pad, 0);
  objc_storeStrong((id *)&self->_pocketStateShouldPreventVoiceTrigger, 0);
  objc_storeStrong((id *)&self->_deviceIsPasscodeLocked, 0);
  objc_storeStrong((id *)&self->_deviceIsBlocked, 0);
  objc_storeStrong((id *)&self->_unlockedSinceBoot, 0);
  objc_storeStrong((id *)&self->_currentSpokenLanguageCode, 0);
}

@end