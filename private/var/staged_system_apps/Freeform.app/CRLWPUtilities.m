@interface CRLWPUtilities
+ (BOOL)anyInputIsNonRoman;
+ (BOOL)inputIsOnlyRoman;
@end

@implementation CRLWPUtilities

+ (BOOL)anyInputIsNonRoman
{
  if (qword_1016A9220 != -1) {
    dispatch_once(&qword_1016A9220, &stru_1014DF4E0);
  }
  return byte_1016A9218;
}

+ (BOOL)inputIsOnlyRoman
{
  return [a1 anyInputIsNonRoman] ^ 1;
}

@end