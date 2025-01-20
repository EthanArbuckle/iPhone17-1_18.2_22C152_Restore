@interface NSString(TRITreatmentId)
- (BOOL)triIsValidTreatmentId;
@end

@implementation NSString(TRITreatmentId)

- (BOOL)triIsValidTreatmentId
{
  if (![a1 length]) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  v3 = (void *)[v2 mutableCopy];

  [v3 addCharactersInString:@"-"];
  v4 = [v3 invertedSet];
  BOOL v5 = [a1 rangeOfCharacterFromSet:v4] == 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

@end