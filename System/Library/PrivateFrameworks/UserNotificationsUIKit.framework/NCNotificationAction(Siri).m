@interface NCNotificationAction(Siri)
- (uint64_t)_isSiriAction;
- (uint64_t)isDrivingFocusEnabled;
- (uint64_t)isSiriAction;
- (uint64_t)isSiriAvailable;
- (uint64_t)isSiriEnabled;
- (uint64_t)isSiriRestricted;
- (uint64_t)isSiriSupported;
- (uint64_t)isUserConnectedToBluetoothDevice;
- (uint64_t)isUserConnectedToCarPlay;
@end

@implementation NCNotificationAction(Siri)

- (uint64_t)isSiriAction
{
  uint64_t result = _os_feature_enabled_impl();
  if (result)
  {
    return [a1 _isSiriAction];
  }
  return result;
}

- (uint64_t)_isSiriAction
{
  int v2 = [a1 isSiriActionCandidate];
  int v3 = [a1 isSiriAvailable];
  int v4 = [a1 isDrivingFocusEnabled];
  unsigned int v5 = v4 & ([a1 isUserConnectedToCarPlay] ^ 1);
  if (!v3) {
    unsigned int v5 = 0;
  }
  if (v2) {
    return v5;
  }
  else {
    return 0;
  }
}

- (uint64_t)isSiriAvailable
{
  uint64_t result = [a1 isSiriEnabled];
  if (result)
  {
    uint64_t result = [a1 isSiriSupported];
    if (result) {
      return [a1 isSiriRestricted] ^ 1;
    }
  }
  return result;
}

- (uint64_t)isSiriEnabled
{
  v0 = [MEMORY[0x1E4F9F930] sharedSystemState];
  uint64_t v1 = [v0 siriIsEnabled];

  return v1;
}

- (uint64_t)isSiriRestricted
{
  v0 = [MEMORY[0x1E4F9F930] sharedSystemState];
  uint64_t v1 = [v0 siriIsRestricted];

  return v1;
}

- (uint64_t)isSiriSupported
{
  v0 = [MEMORY[0x1E4F9F930] sharedSystemState];
  uint64_t v1 = [v0 siriIsSupported];

  return v1;
}

- (uint64_t)isDrivingFocusEnabled
{
  v0 = [MEMORY[0x1E4F9F930] sharedSystemState];
  uint64_t v1 = [v0 carDNDActive];

  return v1;
}

- (uint64_t)isUserConnectedToBluetoothDevice
{
  v0 = [MEMORY[0x1E4F9F930] sharedSystemState];
  uint64_t v1 = [v0 isConnectedToEyesFreeDevice];

  return v1;
}

- (uint64_t)isUserConnectedToCarPlay
{
  v0 = [MEMORY[0x1E4F9F930] sharedSystemState];
  uint64_t v1 = [v0 isConnectedToCarPlay];

  return v1;
}

@end