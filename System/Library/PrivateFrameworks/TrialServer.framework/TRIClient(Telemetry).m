@interface TRIClient(Telemetry)
- (BOOL)shouldLogAtLevel:()Telemetry;
- (uint64_t)shouldLogAtLevel:()Telemetry withPrivacyRadar:;
@end

@implementation TRIClient(Telemetry)

- (BOOL)shouldLogAtLevel:()Telemetry
{
  return a3 > 19;
}

- (uint64_t)shouldLogAtLevel:()Telemetry withPrivacyRadar:
{
  LODWORD(result) = objc_msgSend(a1, "shouldLogAtLevel:");
  if (a4 == 54260918) {
    return result;
  }
  else {
    return 0;
  }
}

@end