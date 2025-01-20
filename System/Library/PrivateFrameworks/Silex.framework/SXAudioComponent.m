@interface SXAudioComponent
+ (id)typeString;
- (unint64_t)traits;
@end

@implementation SXAudioComponent

+ (id)typeString
{
  return @"audio";
}

- (unint64_t)traits
{
  v2 = [(SXAudioComponent *)self stillImageIdentifier];

  if (v2) {
    return 12;
  }
  else {
    return 8;
  }
}

@end