@interface UIImage(TelephonyUI)
+ (BOOL)cappedSizedImagesAreValid;
+ (__CFString)customImageNameForSymbolType:()TelephonyUI;
+ (__CFString)systemImageNameForSymbolType:()TelephonyUI;
+ (id)TTYActionImage;
+ (id)actionGlyphForSymbolType:()TelephonyUI;
+ (id)currentDeviceRouteGlyphForDisplayStyle:()TelephonyUI;
+ (id)favoritesAudioGlyphImage;
+ (id)favoritesMailGlyphImage;
+ (id)favoritesMessageGlyphImage;
+ (id)favoritesTTYDirectGlyphImage;
+ (id)favoritesTTYRelayGlyphImage;
+ (id)favoritesVideoGlyphImage;
+ (id)flatImageForSymbolType:()TelephonyUI;
+ (id)genericBusinessLogo;
+ (id)hierarchicalImageForSymbolType:()TelephonyUI color:;
+ (id)mailActionImage;
+ (id)messagesActionImage;
+ (id)recentsAudioCallImage;
+ (id)recentsIncomingAudioCallGlyphImage;
+ (id)recentsIncomingVideoCallGlyphImage;
+ (id)recentsOutgoingAudioCallGlyphImage;
+ (id)recentsOutgoingVideoCallGlyphImage;
+ (id)recentsRTTChevronImage;
+ (id)recentsTTYGlyphImage;
+ (id)recentsVerifiedCheckmarkImage;
+ (id)recentsVideoCallImage;
+ (id)routeGlyphForDeviceType:()TelephonyUI displayStyle:;
+ (id)routeGlyphForDeviceType:()TelephonyUI displayStyle:color:;
+ (id)routeGlyphWithSymbolType:()TelephonyUI displayStyle:;
+ (id)routeGlyphWithSymbolType:()TelephonyUI displayStyle:color:;
+ (id)symbolNameForCurrentDevice;
+ (id)telephonyUIActionButtonGlyphImage;
+ (id)telephonyUIImageNamed:()TelephonyUI;
+ (id)telephonyUIInfoButtonGlyphImage;
+ (id)telephonyUIUnreadIndicatorGlyphImage;
+ (id)tpHierarchicalImageForSymbolType:()TelephonyUI pointSize:;
+ (id)tpHierarchicalImageForSymbolType:()TelephonyUI pointSize:scale:;
+ (id)tpImageForSymbolType:()TelephonyUI configuration:;
+ (id)tpImageForSymbolType:()TelephonyUI pointSize:;
+ (id)tpImageForSymbolType:()TelephonyUI scale:paletteColors:;
+ (id)tpImageForSymbolType:()TelephonyUI textStyle:cappedAt:;
+ (id)tpImageForSymbolType:()TelephonyUI textStyle:scale:hierarchicalColor:isStaticSize:;
+ (id)tpImageForSymbolType:()TelephonyUI textStyle:scale:isStaticSize:;
+ (id)tpImageForSymbolType:()TelephonyUI textStyle:scale:paletteColors:isStaticSize:;
+ (id)tpImageForSymbolType:()TelephonyUI textStyle:scale:symbolWeight:;
+ (id)videoMessageRecordGlyphImage;
+ (id)voicemailAudioRouteGlyphImage;
+ (id)voicemailDeleteGlyphImage;
+ (id)voicemailDialRequestGlyphImage;
+ (id)voicemailGlyphForSymbolType:()TelephonyUI;
+ (id)voicemailPauseGlyphDisabledImage;
+ (id)voicemailPauseGlyphImage;
+ (id)voicemailPlayGlyphDisabledImage;
+ (id)voicemailPlayGlyphImage;
+ (id)voicemailReportFeedbackGlyphImage;
+ (id)voicemailTTYGlyphImage;
+ (id)voicemailUndeleteGlyphImage;
+ (uint64_t)bluetoothAudioRouteGlyphForDisplayStyle:()TelephonyUI;
+ (uint64_t)carplayRouteGlyphForDisplayStyle:()TelephonyUI;
+ (uint64_t)fallbackSymbolTypeForCurrentDevice;
+ (uint64_t)favoritesGlyphForSymbolType:()TelephonyUI;
+ (uint64_t)headphonesRouteGlyphForDisplayStyle:()TelephonyUI;
+ (uint64_t)isCustomSymbol:()TelephonyUI;
+ (uint64_t)muteRouteGlyphForDisplayStyle:()TelephonyUI;
+ (uint64_t)recentsGlyphForSymbolType:()TelephonyUI;
+ (uint64_t)scaleForTPScale:()TelephonyUI;
+ (uint64_t)shouldBeHierarchicalSymbolType:()TelephonyUI;
+ (uint64_t)speakerRouteGlyphForDisplayStyle:()TelephonyUI;
+ (uint64_t)videoMessageSensitiveGlyphImage;
+ (uint64_t)videoMessageUnreadGlyphImage;
+ (void)clearCachedCappedSizeImagesIfNeeded;
- (id)imageWithEtchedBorderOfColor:()TelephonyUI radius:;
- (id)imageWithShadow:()TelephonyUI;
- (id)tpFlattenedWithColor:()TelephonyUI;
@end

@implementation UIImage(TelephonyUI)

+ (id)recentsTTYGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__UIImage_TelephonyUI__recentsTTYGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsTTYGlyphImage_onceToken != -1) {
    dispatch_once(&recentsTTYGlyphImage_onceToken, block);
  }
  v1 = (void *)recentsTTYGlyphImage___sGlyphImage;
  return v1;
}

+ (id)recentsOutgoingAudioCallGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__UIImage_TelephonyUI__recentsOutgoingAudioCallGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsOutgoingAudioCallGlyphImage_onceToken != -1) {
    dispatch_once(&recentsOutgoingAudioCallGlyphImage_onceToken, block);
  }
  v1 = (void *)recentsOutgoingAudioCallGlyphImage___sGlyphImage;
  return v1;
}

+ (id)recentsOutgoingVideoCallGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__UIImage_TelephonyUI__recentsOutgoingVideoCallGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsOutgoingVideoCallGlyphImage_onceToken != -1) {
    dispatch_once(&recentsOutgoingVideoCallGlyphImage_onceToken, block);
  }
  v1 = (void *)recentsOutgoingVideoCallGlyphImage___sGlyphImage;
  return v1;
}

+ (id)tpImageForSymbolType:()TelephonyUI textStyle:scale:isStaticSize:
{
  v10 = (void *)MEMORY[0x1E4FB1618];
  id v11 = a4;
  v12 = [v10 labelColor];
  v13 = [a1 tpImageForSymbolType:a3 textStyle:v11 scale:a5 hierarchicalColor:v12 isStaticSize:a6];

  return v13;
}

+ (id)tpImageForSymbolType:()TelephonyUI textStyle:scale:hierarchicalColor:isStaticSize:
{
  id v12 = a4;
  id v13 = a6;
  if (a7)
  {
    int v14 = [a1 shouldBeHierarchicalSymbolType:a3];
    v15 = (void *)MEMORY[0x1E4FB1830];
    uint64_t v16 = [a1 scaleForTPScale:a5];
    if (v14) {
      [v15 hierarchicalTpConfigurationWithStaticTextStyle:v12 scale:v16 color:v13];
    }
    else {
    uint64_t v17 = [v15 tpConfigurationWithStaticTextStyle:v12 scale:v16];
    }
  }
  else
  {
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithTextStyle:scale:", v12, objc_msgSend(a1, "scaleForTPScale:", a5));
  }
  v18 = (void *)v17;
  v19 = [a1 tpImageForSymbolType:a3 configuration:v17];

  return v19;
}

+ (id)tpImageForSymbolType:()TelephonyUI configuration:
{
  id v6 = a4;
  if ([a1 isCustomSymbol:a3])
  {
    v7 = [a1 customImageNameForSymbolType:a3];
    v8 = (void *)MEMORY[0x1E4FB1818];
    v9 = TelephonyUIBundle();
    [v8 imageNamed:v7 inBundle:v9 withConfiguration:v6];
  }
  else
  {
    v7 = [a1 systemImageNameForSymbolType:a3];
    v9 = [MEMORY[0x1E4FB1818] _systemImageNamed:v7];
    [v9 imageWithConfiguration:v6];
  v10 = };

  return v10;
}

+ (__CFString)systemImageNameForSymbolType:()TelephonyUI
{
  v4 = &stru_1F1E807C8;
  switch(a3)
  {
    case 0:
      break;
    case 1:
    case 83:
      v4 = @"phone.fill";
      break;
    case 2:
      v4 = @"phone.down.fill";
      break;
    case 3:
      v4 = @"phone.down.circle.fill";
      break;
    case 4:
      int v5 = _os_feature_enabled_impl();
      id v6 = @"phone.arrow.up.right.fill";
      goto LABEL_15;
    case 5:
    case 85:
      v4 = @"video.fill";
      break;
    case 6:
      int v5 = _os_feature_enabled_impl();
      id v6 = @"arrow.up.right.video.fill";
LABEL_15:
      v7 = @"arrow.up.right";
      goto LABEL_82;
    case 7:
      v4 = @"questionmark.video.fill";
      break;
    case 8:
    case 9:
    case 11:
      v4 = @"xmark";
      break;
    case 10:
      v4 = @"checkmark";
      break;
    case 12:
    case 46:
      v4 = @"speaker.wave.3.fill";
      break;
    case 13:
      v4 = @"person.crop.circle";
      break;
    case 14:
      v4 = @"message.fill";
      break;
    case 15:
      v4 = @"hand.raised.fill";
      break;
    case 16:
      v4 = @"envelope.fill";
      break;
    case 17:
      v4 = @"plus";
      break;
    case 18:
      v4 = @"person.crop.circle.badge.plus";
      break;
    case 19:
      v4 = @"circle.grid.3x3.fill";
      break;
    case 20:
      v4 = @"arrow.merge";
      break;
    case 21:
      v4 = @"arrow.swap";
      break;
    case 22:
      v4 = @"mic.slash.fill";
      break;
    case 23:
      v4 = @"delete.left.fill";
      break;
    case 24:
      v4 = @"gobackward.15";
      break;
    case 25:
    case 80:
      v4 = @"play.fill";
      break;
    case 26:
      v4 = @"pause.fill";
      break;
    case 27:
      v4 = @"square.and.arrow.up";
      break;
    case 28:
      v4 = @"info.circle";
      break;
    case 29:
      v4 = @"teletype";
      break;
    case 30:
      v4 = @"realtimetext";
      break;
    case 31:
      v4 = @"recordingtape";
      break;
    case 32:
      v4 = @"volume.2.fill";
      break;
    case 33:
      v4 = @"trash.fill";
      break;
    case 34:
      v4 = @"trash.slash.fill";
      break;
    case 35:
      v4 = @"exclamationmark.bubble";
      break;
    case 36:
      v4 = @"checkmark.square.fill";
      break;
    case 37:
      v4 = @"chevron.forward";
      break;
    case 38:
      v4 = @"staroflife.fill";
      break;
    case 39:
      v4 = @"alarm.fill";
      break;
    case 40:
      v4 = @"xmark.circle.fill";
      break;
    case 41:
      v4 = @"hourglass.tophalf.fill";
      break;
    case 42:
      v4 = @"hourglass";
      break;
    case 43:
      v4 = @"exclamationmark.triangle";
      break;
    case 44:
      v4 = @"speaker.bluetooth.fill";
      break;
    case 45:
      v4 = @"carplay";
      break;
    case 47:
      v4 = @"airpods";
      break;
    case 48:
    case 76:
      v4 = @"airpodspro";
      break;
    case 49:
      v4 = @"airpodsmax";
      break;
    case 50:
      v4 = @"beats.powerbeats";
      break;
    case 51:
      v4 = @"beats.powerbeatspro.right";
      break;
    case 52:
      v4 = @"beats.logo";
      break;
    case 53:
      v4 = @"beats.pill.fill";
      break;
    case 54:
      v4 = @"beats.earphones";
      break;
    case 55:
      v4 = @"beats.headphones";
      break;
    case 56:
      v4 = @"headphones";
      break;
    case 57:
    case 74:
      v4 = @"homepod.fill";
      break;
    case 58:
    case 75:
      v4 = @"homepod.2.fill";
      break;
    case 59:
      v4 = @"homepodmini.fill";
      break;
    case 60:
      v4 = @"homepodmini.2.fill";
      break;
    case 61:
      v4 = @"applewatch.side.right";
      break;
    case 62:
      v4 = @"desktopcomputer";
      break;
    case 63:
      v4 = @"macbook.gen2";
      break;
    case 64:
      v4 = @"ipad";
      break;
    case 65:
      v4 = @"ipad.homebutton";
      break;
    case 66:
      v4 = @"iphone";
      break;
    case 67:
      v4 = @"iphone.homebutton";
      break;
    case 68:
      v4 = @"ipodtouch";
      break;
    case 69:
      v4 = @"beats.powerbeats3";
      break;
    case 70:
      v4 = @"beats.studiobuds";
      break;
    case 71:
      v4 = @"beats.solobuds";
      break;
    case 72:
      v4 = @"beats.fit.pro";
      break;
    case 73:
      v4 = @"airpods.gen3";
      break;
    case 77:
      v4 = @"40262ECA475D4CCF9722443885EC78D8";
      break;
    case 78:
      v4 = @"95B33B9C3A4D472CBFCABF219ACA88CC";
      break;
    case 79:
      v4 = [a1 symbolNameForCurrentDevice];
      break;
    case 81:
      v4 = @"eye.slash.fill";
      break;
    case 82:
      v4 = @"circle.fill";
      break;
    case 84:
      int v5 = _os_feature_enabled_impl();
      id v6 = @"phone.arrow.down.left.fill";
      goto LABEL_81;
    case 86:
      int v5 = _os_feature_enabled_impl();
      id v6 = @"arrow.down.left.video.fill";
LABEL_81:
      v7 = @"arrow.down.left";
LABEL_82:
      if (v5) {
        v4 = v7;
      }
      else {
        v4 = v6;
      }
      break;
    case 87:
      v4 = @"person.text.rectangle.fill";
      break;
    case 88:
      v4 = @"photo.fill.on.rectangle.fill";
      break;
    case 89:
      v4 = @"rectangle.inset.filled.and.person.filled";
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

+ (uint64_t)scaleForTPScale:()TelephonyUI
{
  if ((unint64_t)(a3 + 1) >= 5) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (uint64_t)isCustomSymbol:()TelephonyUI
{
  return 0;
}

+ (uint64_t)recentsGlyphForSymbolType:()TelephonyUI
{
  return [MEMORY[0x1E4FB1818] tpImageForSymbolType:a3 textStyle:*MEMORY[0x1E4FB2950] scale:1 isStaticSize:0];
}

+ (BOOL)cappedSizedImagesAreValid
{
  v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  v1 = [v0 preferredContentSizeCategory];

  BOOL v2 = __lastCappedImageSizeContentCategory && (objc_msgSend(v1, "isEqualToString:") & 1) != 0;
  return v2;
}

+ (void)clearCachedCappedSizeImagesIfNeeded
{
  if (([MEMORY[0x1E4FB1818] cappedSizedImagesAreValid] & 1) == 0)
  {
    v0 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v1 = [v0 preferredContentSizeCategory];
    BOOL v2 = (void *)__lastCappedImageSizeContentCategory;
    __lastCappedImageSizeContentCategory = v1;

    v3 = (void *)__telephonyUIActionButtonGlyphImage;
    __telephonyUIActionButtonGlyphImage = 0;

    v4 = (void *)__telephonyUIInfoButtonGlyphImage;
    __telephonyUIInfoButtonGlyphImage = 0;
  }
}

+ (id)telephonyUIActionButtonGlyphImage
{
  [MEMORY[0x1E4FB1818] clearCachedCappedSizeImagesIfNeeded];
  v0 = (void *)__telephonyUIActionButtonGlyphImage;
  if (!__telephonyUIActionButtonGlyphImage)
  {
    uint64_t v1 = [MEMORY[0x1E4FB1818] tpImageForSymbolType:27 textStyle:*MEMORY[0x1E4FB28C8] cappedAt:*MEMORY[0x1E4FB27B0]];
    BOOL v2 = (void *)__telephonyUIActionButtonGlyphImage;
    __telephonyUIActionButtonGlyphImage = v1;

    v0 = (void *)__telephonyUIActionButtonGlyphImage;
  }
  return v0;
}

+ (id)telephonyUIInfoButtonGlyphImage
{
  [MEMORY[0x1E4FB1818] clearCachedCappedSizeImagesIfNeeded];
  v0 = (void *)__telephonyUIInfoButtonGlyphImage;
  if (!__telephonyUIInfoButtonGlyphImage)
  {
    uint64_t v1 = [MEMORY[0x1E4FB1818] tpImageForSymbolType:28 textStyle:*MEMORY[0x1E4FB28C8] cappedAt:*MEMORY[0x1E4FB27B0]];
    BOOL v2 = (void *)__telephonyUIInfoButtonGlyphImage;
    __telephonyUIInfoButtonGlyphImage = v1;

    v0 = (void *)__telephonyUIInfoButtonGlyphImage;
  }
  return v0;
}

+ (id)telephonyUIUnreadIndicatorGlyphImage
{
  if (telephonyUIUnreadIndicatorGlyphImage_onceToken != -1) {
    dispatch_once(&telephonyUIUnreadIndicatorGlyphImage_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)telephonyUIUnreadIndicatorGlyphImage___sGlyphImage;
  return v0;
}

+ (id)favoritesAudioGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__UIImage_TelephonyUI__favoritesAudioGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (favoritesAudioGlyphImage_onceToken != -1) {
    dispatch_once(&favoritesAudioGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)favoritesAudioGlyphImage___sGlyphImage;
  return v1;
}

+ (id)favoritesMailGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__UIImage_TelephonyUI__favoritesMailGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (favoritesMailGlyphImage_onceToken != -1) {
    dispatch_once(&favoritesMailGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)favoritesMailGlyphImage___sGlyphImage;
  return v1;
}

+ (id)favoritesMessageGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__UIImage_TelephonyUI__favoritesMessageGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (favoritesMessageGlyphImage_onceToken != -1) {
    dispatch_once(&favoritesMessageGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)favoritesMessageGlyphImage___sGlyphImage;
  return v1;
}

+ (id)favoritesTTYDirectGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__UIImage_TelephonyUI__favoritesTTYDirectGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (favoritesTTYDirectGlyphImage_onceToken != -1) {
    dispatch_once(&favoritesTTYDirectGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)favoritesTTYDirectGlyphImage___sGlyphImage;
  return v1;
}

+ (id)favoritesTTYRelayGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__UIImage_TelephonyUI__favoritesTTYRelayGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (favoritesTTYRelayGlyphImage_onceToken != -1) {
    dispatch_once(&favoritesTTYRelayGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)favoritesTTYRelayGlyphImage___sGlyphImage;
  return v1;
}

+ (id)favoritesVideoGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__UIImage_TelephonyUI__favoritesVideoGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (favoritesVideoGlyphImage_onceToken != -1) {
    dispatch_once(&favoritesVideoGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)favoritesVideoGlyphImage___sGlyphImage;
  return v1;
}

+ (uint64_t)favoritesGlyphForSymbolType:()TelephonyUI
{
  return [MEMORY[0x1E4FB1818] tpImageForSymbolType:a3 textStyle:*MEMORY[0x1E4FB2950] scale:1 isStaticSize:0];
}

+ (id)recentsIncomingAudioCallGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__UIImage_TelephonyUI__recentsIncomingAudioCallGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsIncomingAudioCallGlyphImage_onceToken != -1) {
    dispatch_once(&recentsIncomingAudioCallGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)recentsIncomingAudioCallGlyphImage___sGlyphImage;
  return v1;
}

+ (id)recentsIncomingVideoCallGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__UIImage_TelephonyUI__recentsIncomingVideoCallGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsIncomingVideoCallGlyphImage_onceToken != -1) {
    dispatch_once(&recentsIncomingVideoCallGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)recentsIncomingVideoCallGlyphImage___sGlyphImage;
  return v1;
}

+ (id)recentsVerifiedCheckmarkImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__UIImage_TelephonyUI__recentsVerifiedCheckmarkImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsVerifiedCheckmarkImage_onceToken != -1) {
    dispatch_once(&recentsVerifiedCheckmarkImage_onceToken, block);
  }
  uint64_t v1 = (void *)recentsVerifiedCheckmarkImage___sCheckmarkImage;
  return v1;
}

+ (id)recentsRTTChevronImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__UIImage_TelephonyUI__recentsRTTChevronImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsRTTChevronImage_onceToken != -1) {
    dispatch_once(&recentsRTTChevronImage_onceToken, block);
  }
  uint64_t v1 = (void *)recentsRTTChevronImage___sChevronImage;
  return v1;
}

+ (id)recentsAudioCallImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__UIImage_TelephonyUI__recentsAudioCallImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsAudioCallImage_onceToken != -1) {
    dispatch_once(&recentsAudioCallImage_onceToken, block);
  }
  uint64_t v1 = (void *)recentsAudioCallImage___sAudioCallImage;
  return v1;
}

+ (id)recentsVideoCallImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__UIImage_TelephonyUI__recentsVideoCallImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (recentsVideoCallImage_onceToken != -1) {
    dispatch_once(&recentsVideoCallImage_onceToken, block);
  }
  uint64_t v1 = (void *)recentsVideoCallImage___sVideoCallImage;
  return v1;
}

+ (id)mailActionImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__UIImage_TelephonyUI__mailActionImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mailActionImage_onceToken != -1) {
    dispatch_once(&mailActionImage_onceToken, block);
  }
  uint64_t v1 = (void *)mailActionImage___sMailActionImage;
  return v1;
}

+ (id)messagesActionImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__UIImage_TelephonyUI__messagesActionImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (messagesActionImage_onceToken != -1) {
    dispatch_once(&messagesActionImage_onceToken, block);
  }
  uint64_t v1 = (void *)messagesActionImage___sMessagesActionImage;
  return v1;
}

+ (id)TTYActionImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__UIImage_TelephonyUI__TTYActionImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (TTYActionImage_onceToken != -1) {
    dispatch_once(&TTYActionImage_onceToken, block);
  }
  uint64_t v1 = (void *)TTYActionImage___sTTYActionImage;
  return v1;
}

+ (id)actionGlyphForSymbolType:()TelephonyUI
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4FB1818];
  int v5 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v8 = [v4 tpImageForSymbolType:a3 scale:2 paletteColors:v7];

  return v8;
}

+ (id)voicemailAudioRouteGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__UIImage_TelephonyUI__voicemailAudioRouteGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailAudioRouteGlyphImage_onceToken != -1) {
    dispatch_once(&voicemailAudioRouteGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)voicemailAudioRouteGlyphImage___sGlyphImage;
  return v1;
}

+ (id)voicemailDialRequestGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__UIImage_TelephonyUI__voicemailDialRequestGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailDialRequestGlyphImage_onceToken != -1) {
    dispatch_once(&voicemailDialRequestGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)voicemailDialRequestGlyphImage___sGlyphImage;
  return v1;
}

+ (id)voicemailDeleteGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__UIImage_TelephonyUI__voicemailDeleteGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailDeleteGlyphImage_onceToken != -1) {
    dispatch_once(&voicemailDeleteGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)voicemailDeleteGlyphImage___sGlyphImage;
  return v1;
}

+ (id)voicemailUndeleteGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__UIImage_TelephonyUI__voicemailUndeleteGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailUndeleteGlyphImage_onceToken != -1) {
    dispatch_once(&voicemailUndeleteGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)voicemailUndeleteGlyphImage___sGlyphImage;
  return v1;
}

+ (id)voicemailPlayGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__UIImage_TelephonyUI__voicemailPlayGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailPlayGlyphImage_onceToken != -1) {
    dispatch_once(&voicemailPlayGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)voicemailPlayGlyphImage___sGlyphImage;
  return v1;
}

+ (id)voicemailPlayGlyphDisabledImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__UIImage_TelephonyUI__voicemailPlayGlyphDisabledImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailPlayGlyphDisabledImage_onceToken != -1) {
    dispatch_once(&voicemailPlayGlyphDisabledImage_onceToken, block);
  }
  uint64_t v1 = (void *)voicemailPlayGlyphDisabledImage___sGlyphImage;
  return v1;
}

+ (id)voicemailPauseGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__UIImage_TelephonyUI__voicemailPauseGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailPauseGlyphImage_onceToken != -1) {
    dispatch_once(&voicemailPauseGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)voicemailPauseGlyphImage___sGlyphImage;
  return v1;
}

+ (id)voicemailPauseGlyphDisabledImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__UIImage_TelephonyUI__voicemailPauseGlyphDisabledImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailPauseGlyphDisabledImage_onceToken != -1) {
    dispatch_once(&voicemailPauseGlyphDisabledImage_onceToken, block);
  }
  uint64_t v1 = (void *)voicemailPauseGlyphDisabledImage___sGlyphImage;
  return v1;
}

+ (id)voicemailReportFeedbackGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__UIImage_TelephonyUI__voicemailReportFeedbackGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailReportFeedbackGlyphImage_onceToken != -1) {
    dispatch_once(&voicemailReportFeedbackGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)voicemailReportFeedbackGlyphImage___sGlyphImage;
  return v1;
}

+ (id)voicemailTTYGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__UIImage_TelephonyUI__voicemailTTYGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voicemailTTYGlyphImage_onceToken != -1) {
    dispatch_once(&voicemailTTYGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)voicemailTTYGlyphImage___sGlyphImage;
  return v1;
}

+ (id)voicemailGlyphForSymbolType:()TelephonyUI
{
  v0 = objc_msgSend(MEMORY[0x1E4FB1818], "tpImageForSymbolType:textStyle:scale:isStaticSize:");
  return v0;
}

+ (id)videoMessageRecordGlyphImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__UIImage_TelephonyUI__videoMessageRecordGlyphImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (videoMessageRecordGlyphImage_onceToken != -1) {
    dispatch_once(&videoMessageRecordGlyphImage_onceToken, block);
  }
  uint64_t v1 = (void *)videoMessageRecordGlyphImage___sGlyphImage;
  return v1;
}

+ (uint64_t)videoMessageSensitiveGlyphImage
{
  return [a1 tpImageForSymbolType:81 textStyle:*MEMORY[0x1E4FB2950] scale:2 symbolWeight:4];
}

+ (uint64_t)videoMessageUnreadGlyphImage
{
  return [a1 tpImageForSymbolType:82 textStyle:*MEMORY[0x1E4FB2950] scale:2 symbolWeight:4];
}

+ (id)currentDeviceRouteGlyphForDisplayStyle:()TelephonyUI
{
  int v5 = [a1 routeGlyphWithSymbolType:79 displayStyle:a3];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [a1 fallbackSymbolTypeForCurrentDevice];
    v9 = TPDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[UIImage(TelephonyUI) currentDeviceRouteGlyphForDisplayStyle:v9];
    }

    id v7 = [a1 routeGlyphWithSymbolType:v8 displayStyle:a3];
  }
  v10 = v7;

  return v10;
}

+ (uint64_t)carplayRouteGlyphForDisplayStyle:()TelephonyUI
{
  return [a1 routeGlyphWithSymbolType:45 displayStyle:a3];
}

+ (uint64_t)muteRouteGlyphForDisplayStyle:()TelephonyUI
{
  return [a1 routeGlyphWithSymbolType:22 displayStyle:a3];
}

+ (uint64_t)headphonesRouteGlyphForDisplayStyle:()TelephonyUI
{
  return [a1 routeGlyphWithSymbolType:56 displayStyle:a3];
}

+ (uint64_t)bluetoothAudioRouteGlyphForDisplayStyle:()TelephonyUI
{
  return [a1 routeGlyphWithSymbolType:44 displayStyle:a3];
}

+ (uint64_t)speakerRouteGlyphForDisplayStyle:()TelephonyUI
{
  return [a1 routeGlyphWithSymbolType:46 displayStyle:a3];
}

+ (id)routeGlyphWithSymbolType:()TelephonyUI displayStyle:
{
  id v7 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v8 = [a1 routeGlyphWithSymbolType:a3 displayStyle:a4 color:v7];

  return v8;
}

+ (id)routeGlyphWithSymbolType:()TelephonyUI displayStyle:color:
{
  id v8 = a5;
  switch(a4)
  {
    case 0:
      if ([a1 shouldBeHierarchicalSymbolType:a3]) {
        [a1 hierarchicalImageForSymbolType:a3 color:v8];
      }
      else {
      uint64_t v9 = [a1 flatImageForSymbolType:a3];
      }
      goto LABEL_13;
    case 1:
      uint64_t v9 = [a1 tpHierarchicalImageForSymbolType:a3 pointSize:32.0];
      goto LABEL_13;
    case 2:
      v10 = (uint64_t *)MEMORY[0x1E4FB2998];
      goto LABEL_7;
    case 3:
      v10 = (uint64_t *)MEMORY[0x1E4FB28F0];
LABEL_7:
      uint64_t v11 = *v10;
      id v12 = a1;
      uint64_t v13 = a3;
      uint64_t v14 = 3;
      goto LABEL_9;
    case 4:
      uint64_t v11 = *MEMORY[0x1E4FB2998];
      id v12 = a1;
      uint64_t v13 = a3;
      uint64_t v14 = 2;
LABEL_9:
      uint64_t v9 = [v12 tpImageForSymbolType:v13 textStyle:v11 scale:v14 symbolWeight:4];
LABEL_13:
      v15 = (void *)v9;
      break;
    default:
      v15 = 0;
      break;
  }

  return v15;
}

+ (id)flatImageForSymbolType:()TelephonyUI
{
  int v5 = objc_msgSend(a1, "isCustomSymbol:");
  id v6 = (void *)MEMORY[0x1E4FB1818];
  if (v5)
  {
    id v7 = [a1 customImageNameForSymbolType:a3];
    [v6 imageNamed:v7];
  }
  else
  {
    id v7 = [a1 systemImageNameForSymbolType:a3];
    [v6 _systemImageNamed:v7];
  id v8 = };
  uint64_t v9 = [v8 imageWithRenderingMode:2];
  v10 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v11 = [v9 imageWithTintColor:v10];

  return v11;
}

+ (id)hierarchicalImageForSymbolType:()TelephonyUI color:
{
  id v6 = [MEMORY[0x1E4FB1830] configurationWithHierarchicalColor:a4];
  int v7 = [a1 isCustomSymbol:a3];
  id v8 = (void *)MEMORY[0x1E4FB1818];
  if (v7)
  {
    uint64_t v9 = [a1 customImageNameForSymbolType:a3];
    v10 = TelephonyUIBundle();
    uint64_t v11 = [v8 imageNamed:v9 inBundle:v10 withConfiguration:v6];
    id v12 = [v11 imageWithRenderingMode:2];
  }
  else
  {
    uint64_t v9 = [a1 systemImageNameForSymbolType:a3];
    v10 = [v8 _systemImageNamed:v9 withConfiguration:v6];
    id v12 = [v10 imageWithRenderingMode:2];
  }

  return v12;
}

+ (id)routeGlyphForDeviceType:()TelephonyUI displayStyle:
{
  int v7 = [MEMORY[0x1E4FB1618] labelColor];
  id v8 = [a1 routeGlyphForDeviceType:a3 displayStyle:a4 color:v7];

  return v8;
}

+ (id)routeGlyphForDeviceType:()TelephonyUI displayStyle:color:
{
  id v8 = a5;
  uint64_t v9 = a3 - 1;
  if (unint64_t)(a3 - 1) <= 0x23 && ((0xB5FFFFFFFuLL >> v9))
  {
    v10 = [a1 routeGlyphWithSymbolType:qword_1C2F72CE0[v9] displayStyle:a4 color:v8];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (uint64_t)shouldBeHierarchicalSymbolType:()TelephonyUI
{
  return ((unint64_t)(a3 - 31) < 0x31) & (0x13EFFFD9F0001uLL >> (a3 - 31));
}

+ (id)tpImageForSymbolType:()TelephonyUI textStyle:scale:paletteColors:isStaticSize:
{
  id v12 = a4;
  id v13 = a6;
  if (a7)
  {
    int v14 = [a1 shouldBeHierarchicalSymbolType:a3];
    v15 = (void *)MEMORY[0x1E4FB1830];
    uint64_t v16 = [a1 scaleForTPScale:a5];
    if (v14) {
      [v15 paletteTpConfigurationWithStaticTextStyle:v12 scale:v16 colors:v13];
    }
    else {
    uint64_t v17 = [v15 tpConfigurationWithStaticTextStyle:v12 scale:v16];
    }
  }
  else
  {
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithTextStyle:scale:", v12, objc_msgSend(a1, "scaleForTPScale:", a5));
  }
  v18 = (void *)v17;
  v19 = [a1 tpImageForSymbolType:a3 configuration:v17];

  return v19;
}

+ (id)tpImageForSymbolType:()TelephonyUI scale:paletteColors:
{
  id v8 = (void *)MEMORY[0x1E4FB1830];
  id v9 = a5;
  v10 = objc_msgSend(v8, "configurationWithScale:", objc_msgSend(a1, "scaleForTPScale:", a4));
  uint64_t v11 = [MEMORY[0x1E4FB1830] configurationWithPaletteColors:v9];

  id v12 = [v10 configurationByApplyingConfiguration:v11];

  id v13 = [a1 tpImageForSymbolType:a3 configuration:v12];

  return v13;
}

+ (id)tpImageForSymbolType:()TelephonyUI textStyle:scale:symbolWeight:
{
  v10 = (void *)MEMORY[0x1E4FB1830];
  id v11 = a4;
  uint64_t v12 = [a1 scaleForTPScale:a5];
  if (a6) {
    [v10 tpConfigurationWithStaticTextStyle:v11 scale:v12 symbolWeight:a6];
  }
  else {
  id v13 = [v10 tpConfigurationWithStaticTextStyle:v11 scale:v12];
  }

  int v14 = [a1 tpImageForSymbolType:a3 configuration:v13];

  return v14;
}

+ (id)tpImageForSymbolType:()TelephonyUI textStyle:cappedAt:
{
  int v7 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:a4 maximumContentSizeCategory:a5];
  id v8 = [v7 fontDescriptor];
  id v9 = [v8 fontAttributes];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB0950]];
  id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FB09F0]];
  [v11 floatValue];
  double v13 = v12;

  int v14 = (void *)MEMORY[0x1E4FB1830];
  v15 = [v7 fontDescriptor];
  uint64_t v16 = [v15 pointSize];
  v18 = objc_msgSend(v14, "configurationWithPointSize:weight:", MEMORY[0x1C876DD70](v16, v13), v17);

  v19 = [a1 tpImageForSymbolType:a3 configuration:v18];

  return v19;
}

+ (id)tpImageForSymbolType:()TelephonyUI pointSize:
{
  int v5 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithPointSize:");
  id v6 = [a1 tpImageForSymbolType:a3 configuration:v5];

  return v6;
}

+ (id)tpHierarchicalImageForSymbolType:()TelephonyUI pointSize:
{
  id v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((_os_feature_enabled_impl() & (v7 != 1)) != 0) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  id v9 = [MEMORY[0x1E4FB1818] tpHierarchicalImageForSymbolType:a4 pointSize:v8 scale:a1];
  return v9;
}

+ (id)tpHierarchicalImageForSymbolType:()TelephonyUI pointSize:scale:
{
  if (objc_msgSend(a1, "shouldBeHierarchicalSymbolType:"))
  {
    id v9 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:2 scale:a2];
    v10 = (void *)MEMORY[0x1E4FB1830];
    id v11 = [MEMORY[0x1E4FB1618] systemBlackColor];
    float v12 = [v10 configurationWithHierarchicalColor:v11];
    double v13 = [v12 configurationByApplyingConfiguration:v9];

    int v14 = [a1 tpImageForSymbolType:a4 configuration:v13];
  }
  else
  {
    uint64_t v15 = *MEMORY[0x1E4FB2928];
    uint64_t v16 = [MEMORY[0x1E4FB16C8] currentDevice];
    [v16 userInterfaceIdiom];

    _os_feature_enabled_impl();
    int v14 = [a1 tpImageForSymbolType:a4 textStyle:v15 scale:a5 isStaticSize:1];
  }
  return v14;
}

+ (__CFString)customImageNameForSymbolType:()TelephonyUI
{
  return &stru_1F1E807C8;
}

+ (id)symbolNameForCurrentDevice
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__UIImage_TelephonyUI__symbolNameForCurrentDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (symbolNameForCurrentDevice_onceToken != -1) {
    dispatch_once(&symbolNameForCurrentDevice_onceToken, block);
  }
  uint64_t v1 = (void *)symbolNameForCurrentDevice_symbolName;
  return v1;
}

+ (uint64_t)fallbackSymbolTypeForCurrentDevice
{
  if (fallbackSymbolTypeForCurrentDevice_onceToken != -1) {
    dispatch_once(&fallbackSymbolTypeForCurrentDevice_onceToken, &__block_literal_global_276);
  }
  return fallbackSymbolTypeForCurrentDevice_symbolType;
}

- (id)imageWithEtchedBorderOfColor:()TelephonyUI radius:
{
  id v6 = a4;
  [a1 size];
  double v9 = v8 + a2 * 2.0;
  BOOL v10 = a2 <= 0.0;
  if (a2 <= 0.0) {
    double v11 = v7;
  }
  else {
    double v11 = v7 + a2 * 2.0;
  }
  if (v10) {
    double v12 = v8;
  }
  else {
    double v12 = v9;
  }
  [a1 scale];
  double v14 = v13;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__UIImage_TelephonyUI__imageWithEtchedBorderOfColor_radius___block_invoke;
  v18[3] = &unk_1E647C130;
  v18[4] = a1;
  id v19 = v6;
  id v15 = v6;
  uint64_t v16 = TPCreateImageWithDrawing(v18, v11, v12, v14);

  return v16;
}

- (id)imageWithShadow:()TelephonyUI
{
  id v4 = a3;
  id v5 = a1;
  [v4 shadowOffset];
  uint64_t v7 = v6;
  double v9 = v8;
  double v10 = -v8;
  [v4 shadowBlurRadius];
  double v12 = v11;
  [v5 scale];
  double v14 = v13;
  [v5 size];
  double v17 = v16 + v12 * 2.0;
  double v18 = fabs(v9);
  if (v9 <= 0.0) {
    double v18 = 0.0;
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __40__UIImage_TelephonyUI__imageWithShadow___block_invoke;
  v24[3] = &unk_1E647C158;
  double v27 = v12;
  double v28 = v14;
  uint64_t v29 = v7;
  double v30 = v10;
  double v19 = v15 + v18 + v12 * 2.0;
  id v25 = v4;
  id v26 = v5;
  id v20 = v5;
  id v21 = v4;
  v22 = TPCreateImageWithDrawing(v24, v17, v19, v14);

  return v22;
}

+ (id)telephonyUIImageNamed:()TelephonyUI
{
  id v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  uint64_t v6 = [v4 bundleWithIdentifier:@"com.apple.TelephonyUI"];
  uint64_t v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  double v8 = [v7 traitCollection];
  double v9 = [a1 imageNamed:v5 inBundle:v6 compatibleWithTraitCollection:v8];

  return v9;
}

- (id)tpFlattenedWithColor:()TelephonyUI
{
  id v4 = a3;
  id v5 = [a1 imageWithRenderingMode:1];
  uint64_t v6 = [v5 imageWithTintColor:v4];

  return v6;
}

+ (id)genericBusinessLogo
{
  if (genericBusinessLogo_onceToken != -1) {
    dispatch_once(&genericBusinessLogo_onceToken, &__block_literal_global_292);
  }
  v0 = (void *)genericBusinessLogo___businessLogo;
  return v0;
}

+ (void)currentDeviceRouteGlyphForDisplayStyle:()TelephonyUI .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 symbolNameForCurrentDevice];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1C2F24000, a3, OS_LOG_TYPE_ERROR, "Failed to find current device route glyph with symbol name %@. Using fallback symbol type %zd.", (uint8_t *)&v6, 0x16u);
}

@end