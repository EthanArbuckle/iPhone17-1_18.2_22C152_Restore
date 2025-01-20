@interface SAUISayIt(CommandUserInfo)
- (void)_siriui_applyUserInfoDictionary:()CommandUserInfo;
@end

@implementation SAUISayIt(CommandUserInfo)

- (void)_siriui_applyUserInfoDictionary:()CommandUserInfo
{
  id v4 = [a3 objectForKeyedSubscript:@"CRKAudioPlaybackCardSectionIgnoresMuteSwitch"];
  objc_msgSend(a1, "sruif_setIgnoresMuteSwitch:", objc_msgSend(v4, "BOOLValue"));
}

@end