@interface UIApplicationIsEmojiPoster
@end

@implementation UIApplicationIsEmojiPoster

void ___UIApplicationIsEmojiPoster_block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EB25B4ED = [v0 isEqualToString:@"com.apple.EmojiPoster.EmojiPosterExtension"];
}

@end