@interface PNPhotosChallengeUtils
+ (id)titleWithoutFormattingForTitle:(id)a3;
@end

@implementation PNPhotosChallengeUtils

+ (id)titleWithoutFormattingForTitle:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@" " withString:@" "];
  v4 = [v3 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_270753580];

  return v4;
}

@end