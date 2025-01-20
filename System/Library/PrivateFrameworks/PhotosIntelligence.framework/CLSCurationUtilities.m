@interface CLSCurationUtilities
+ (BOOL)isBlocklistedImportedByBundleIdentifier:(id)a3;
+ (BOOL)isRiskyFileFormatWithAsset:(id)a3;
+ (id)blockedImportedByBundleIdentifiers;
@end

@implementation CLSCurationUtilities

+ (BOOL)isRiskyFileFormatWithAsset:(id)a3
{
  id v3 = a3;
  if (([v3 isAnimatedGIF] & 1) != 0
    || ([v3 isPDF] & 1) != 0
    || ([v3 isPNG] & 1) != 0
    || ([v3 isPSD] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isHEICSequence];
  }

  return v4;
}

+ (BOOL)isBlocklistedImportedByBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [a1 blockedImportedByBundleIdentifiers];
    v6 = [v4 lowercaseString];
    char v7 = [v5 containsObject:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)blockedImportedByBundleIdentifiers
{
  if (blockedImportedByBundleIdentifiers_onceToken[0] != -1) {
    dispatch_once(blockedImportedByBundleIdentifiers_onceToken, &__block_literal_global_1975);
  }
  v2 = (void *)blockedImportedByBundleIdentifiers_blocklist;
  return v2;
}

uint64_t __58__CLSCurationUtilities_blockedImportedByBundleIdentifiers__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"com.baidu.baidumobile", @"com.google.chrome.ios", @"com.douban.frodo", @"com.facebook.facebook", @"com.facebook.messenger", @"org.mozilla.ios.firefox", @"com.google.gmail", @"com.burbn.instagram", @"com.iwilab.kakaotalk", @"jp.naver.line", @"com.apple.mobilemail", @"com.microsoft.office.outlook", @"com.tencent.mqq", @"com.reddit.reddit", @"com.apple.mobilesafari", @"com.toyopagroup.picaboo", @"ph.telegra.telegraph",
         @"com.zhiliaoapp.musically",
         @"com.atebits.tweetie2",
         @"com.viber",
         @"com.vk.vkclient",
         @"com.vk.vkhd",
         @"com.tencent.xin",
         @"com.sina.weibo",
         @"net.whatsapp.whatsapp",
         0);
  uint64_t v2 = blockedImportedByBundleIdentifiers_blocklist;
  blockedImportedByBundleIdentifiers_blocklist = v0;
  return MEMORY[0x270F9A758](v0, v2, v1);
}

@end