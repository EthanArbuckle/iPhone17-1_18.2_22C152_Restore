@interface UIApplicationIsFirstPartyStickers
@end

@implementation UIApplicationIsFirstPartyStickers

void ___UIApplicationIsFirstPartyStickers_block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EB25B4EC = [v0 isEqualToString:@"com.apple.Stickers.UserGenerated.MessagesExtension"];
}

@end