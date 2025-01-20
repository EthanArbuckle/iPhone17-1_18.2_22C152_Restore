@interface NSError(SHCoreError)
- (uint64_t)sh_isCoreCompressionError;
- (uint64_t)sh_isCoreDaemonExit;
- (uint64_t)sh_isCoreDecompressionError;
- (uint64_t)sh_isCoreFailedToStartAudioRecording;
- (uint64_t)sh_isCoreJSONLFileParsingError;
- (uint64_t)sh_isCoreMatchAttemptRejectedError;
- (uint64_t)sh_isCoreMediaItemMissingRequiredProperties;
- (uint64_t)sh_isCoreMissingEntitlementsError;
- (uint64_t)sh_isCoreServerResponseMissingRequiredProperties;
- (uint64_t)sh_isCoreServerResponseWorkerAlreadyRegistered;
- (uint64_t)sh_isCoreToldNotToResumeAudioRecordingAfterInterruption;
- (uint64_t)sh_isShazamCoreError;
@end

@implementation NSError(SHCoreError)

- (uint64_t)sh_isShazamCoreError
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.ShazamCore"];

  return v2;
}

- (uint64_t)sh_isCoreJSONLFileParsingError
{
  uint64_t result = objc_msgSend(a1, "sh_isShazamCoreError");
  if (result) {
    return [a1 code] == 300;
  }
  return result;
}

- (uint64_t)sh_isCoreCompressionError
{
  uint64_t result = objc_msgSend(a1, "sh_isShazamCoreError");
  if (result) {
    return [a1 code] == 301;
  }
  return result;
}

- (uint64_t)sh_isCoreDecompressionError
{
  uint64_t result = objc_msgSend(a1, "sh_isShazamCoreError");
  if (result) {
    return [a1 code] == 302;
  }
  return result;
}

- (uint64_t)sh_isCoreDaemonExit
{
  uint64_t result = objc_msgSend(a1, "sh_isShazamCoreError");
  if (result) {
    return [a1 code] == 100;
  }
  return result;
}

- (uint64_t)sh_isCoreMatchAttemptRejectedError
{
  uint64_t result = objc_msgSend(a1, "sh_isShazamCoreError");
  if (result) {
    return [a1 code] == 101;
  }
  return result;
}

- (uint64_t)sh_isCoreMissingEntitlementsError
{
  uint64_t result = objc_msgSend(a1, "sh_isShazamCoreError");
  if (result) {
    return [a1 code] == 102;
  }
  return result;
}

- (uint64_t)sh_isCoreMediaItemMissingRequiredProperties
{
  uint64_t result = objc_msgSend(a1, "sh_isShazamCoreError");
  if (result) {
    return [a1 code] == 400;
  }
  return result;
}

- (uint64_t)sh_isCoreServerResponseMissingRequiredProperties
{
  uint64_t result = objc_msgSend(a1, "sh_isShazamCoreError");
  if (result) {
    return [a1 code] == 401;
  }
  return result;
}

- (uint64_t)sh_isCoreFailedToStartAudioRecording
{
  uint64_t result = objc_msgSend(a1, "sh_isShazamCoreError");
  if (result) {
    return [a1 code] == 104;
  }
  return result;
}

- (uint64_t)sh_isCoreToldNotToResumeAudioRecordingAfterInterruption
{
  uint64_t result = objc_msgSend(a1, "sh_isShazamCoreError");
  if (result) {
    return [a1 code] == 105;
  }
  return result;
}

- (uint64_t)sh_isCoreServerResponseWorkerAlreadyRegistered
{
  uint64_t result = objc_msgSend(a1, "sh_isShazamCoreError");
  if (result) {
    return [a1 code] == 106;
  }
  return result;
}

@end