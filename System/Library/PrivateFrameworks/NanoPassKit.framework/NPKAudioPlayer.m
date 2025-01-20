@interface NPKAudioPlayer
+ (void)_playSoundsWithFallbackHapticIfNecessaryForSoundIdentifier:(unsigned int)a3;
+ (void)_playSoundsWithIdentifier:(unsigned int)a3;
+ (void)playAccessScanCompleteHaptic;
+ (void)playIdentityReaderConnectionCompleteHaptic;
+ (void)playIdentityReaderConnectionStartHaptic;
+ (void)playInAppPaymentFailureHaptic;
+ (void)playInAppPaymentSuccessHaptic;
+ (void)playProvisioningFailureHaptic;
+ (void)playProvisioningSuccessHaptic;
+ (void)playReadyToReorderHaptic;
+ (void)playSessionStartFailureHaptic;
+ (void)playSessionTimeoutHaptic;
+ (void)playTerminalRequestedAuthenticationHaptic;
+ (void)playTransactionAuthenticationHaptic;
+ (void)playTransactionFailureHaptic;
+ (void)playTransactionSuccessHaptic;
+ (void)playWarsawHaptic;
@end

@implementation NPKAudioPlayer

+ (void)playProvisioningSuccessHaptic
{
}

+ (void)playProvisioningFailureHaptic
{
}

+ (void)playTransactionSuccessHaptic
{
}

+ (void)playTransactionFailureHaptic
{
}

+ (void)playAccessScanCompleteHaptic
{
}

+ (void)playSessionStartFailureHaptic
{
}

+ (void)playSessionTimeoutHaptic
{
}

+ (void)playWarsawHaptic
{
}

+ (void)playTerminalRequestedAuthenticationHaptic
{
}

+ (void)playInAppPaymentSuccessHaptic
{
}

+ (void)playInAppPaymentFailureHaptic
{
}

+ (void)playTransactionAuthenticationHaptic
{
}

+ (void)playIdentityReaderConnectionStartHaptic
{
}

+ (void)playIdentityReaderConnectionCompleteHaptic
{
}

+ (void)_playSoundsWithIdentifier:(unsigned int)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = a3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Audio player playing sound %u", (uint8_t *)v7, 8u);
    }
  }
  AudioServicesPlaySystemSoundWithCompletion(a3, 0);
}

+ (void)_playSoundsWithFallbackHapticIfNecessaryForSoundIdentifier:(unsigned int)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (ringerStateIsSilent_onceToken != -1) {
    dispatch_once(&ringerStateIsSilent_onceToken, &__block_literal_global_7);
  }
  uint64_t v5 = ringerStateIsSilent_ringerState;
  v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    uint64_t v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = @"NO";
      if (!v5) {
        v9 = @"YES";
      }
      v10[0] = 67109378;
      v10[1] = a3;
      __int16 v11 = 2112;
      v12 = v9;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Audio player playing sound %u; should fall back to haptic: %@",
        (uint8_t *)v10,
        0x12u);
    }
  }
  if (v5) {
    AudioServicesPlaySystemSoundWithCompletion(a3, 0);
  }
  else {
    [a1 _playSoundsWithIdentifier:1400];
  }
}

+ (void)playReadyToReorderHaptic
{
}

@end