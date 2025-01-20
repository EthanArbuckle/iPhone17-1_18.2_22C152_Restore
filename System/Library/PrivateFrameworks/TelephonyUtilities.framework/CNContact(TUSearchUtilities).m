@interface CNContact(TUSearchUtilities)
+ (id)keysToFetchForFaceTime;
- (id)anyDestinationID;
- (id)emailAddressStrings;
- (id)faceTimeQuicklookURL;
- (id)phoneNumberLastFourDigitStrings;
- (id)phoneNumberStrings;
@end

@implementation CNContact(TUSearchUtilities)

+ (id)keysToFetchForFaceTime
{
  if (keysToFetchForFaceTime_onceToken != -1) {
    dispatch_once(&keysToFetchForFaceTime_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)keysToFetchForFaceTime_keysToFetchForFaceTime;

  return v0;
}

- (id)anyDestinationID
{
  v2 = [a1 phoneNumberStrings];
  v3 = [a1 emailAddressStrings];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];
  v5 = [v4 firstObject];

  return v5;
}

- (id)faceTimeQuicklookURL
{
  v1 = (void *)MEMORY[0x1E4F1CB10];
  v2 = NSString;
  v3 = [a1 identifier];
  v4 = [v2 stringWithFormat:@"addressbook://%@", v3];
  v5 = [v1 URLWithString:v4];

  return v5;
}

- (id)phoneNumberStrings
{
  v1 = [a1 phoneNumbers];
  v2 = [v1 arrayByApplyingSelector:sel_value];
  v3 = [v2 arrayByApplyingSelector:sel_stringValue];

  return v3;
}

- (id)phoneNumberLastFourDigitStrings
{
  v1 = [a1 phoneNumbers];
  v2 = [v1 arrayByApplyingSelector:sel_value];
  v3 = [v2 arrayByApplyingSelector:sel_lastFourDigits];

  return v3;
}

- (id)emailAddressStrings
{
  v1 = [a1 emailAddresses];
  v2 = [v1 arrayByApplyingSelector:sel_value];

  return v2;
}

@end