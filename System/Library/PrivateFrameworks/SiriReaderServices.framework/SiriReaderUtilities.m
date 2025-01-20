@interface SiriReaderUtilities
+ (id)readerStartingToneAudioAssetURL;
@end

@implementation SiriReaderUtilities

+ (id)readerStartingToneAudioAssetURL
{
  v2 = NSURL;
  v3 = [MEMORY[0x263F086E0] bundleForClass:a1];
  v4 = [v3 pathForResource:@"ReadThisSound" ofType:@"wav"];
  v5 = [v2 fileURLWithPath:v4];

  return v5;
}

@end