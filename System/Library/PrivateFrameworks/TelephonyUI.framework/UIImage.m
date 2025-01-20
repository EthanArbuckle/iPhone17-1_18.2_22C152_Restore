@interface UIImage
@end

@implementation UIImage

uint64_t __44__UIImage_TelephonyUI__recentsTTYGlyphImage__block_invoke(uint64_t a1)
{
  recentsTTYGlyphImage___sGlyphImage = [*(id *)(a1 + 32) recentsGlyphForSymbolType:29];
  return MEMORY[0x1F41817F8]();
}

uint64_t __58__UIImage_TelephonyUI__recentsOutgoingAudioCallGlyphImage__block_invoke(uint64_t a1)
{
  recentsOutgoingAudioCallGlyphImage___sGlyphImage = [*(id *)(a1 + 32) recentsGlyphForSymbolType:4];
  return MEMORY[0x1F41817F8]();
}

uint64_t __58__UIImage_TelephonyUI__recentsOutgoingVideoCallGlyphImage__block_invoke(uint64_t a1)
{
  recentsOutgoingVideoCallGlyphImage___sGlyphImage = [*(id *)(a1 + 32) recentsGlyphForSymbolType:6];
  return MEMORY[0x1F41817F8]();
}

void __60__UIImage_TelephonyUI__telephonyUIUnreadIndicatorGlyphImage__block_invoke()
{
  UIImageGetUnreadIndicator();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 imageWithRenderingMode:2];
  v1 = (void *)telephonyUIUnreadIndicatorGlyphImage___sGlyphImage;
  telephonyUIUnreadIndicatorGlyphImage___sGlyphImage = v0;
}

uint64_t __48__UIImage_TelephonyUI__favoritesAudioGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) favoritesGlyphForSymbolType:1];
  uint64_t v2 = favoritesAudioGlyphImage___sGlyphImage;
  favoritesAudioGlyphImage___sGlyphImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __47__UIImage_TelephonyUI__favoritesMailGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) favoritesGlyphForSymbolType:16];
  uint64_t v2 = favoritesMailGlyphImage___sGlyphImage;
  favoritesMailGlyphImage___sGlyphImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __50__UIImage_TelephonyUI__favoritesMessageGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) favoritesGlyphForSymbolType:14];
  uint64_t v2 = favoritesMessageGlyphImage___sGlyphImage;
  favoritesMessageGlyphImage___sGlyphImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __52__UIImage_TelephonyUI__favoritesTTYDirectGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) favoritesGlyphForSymbolType:29];
  uint64_t v2 = favoritesTTYDirectGlyphImage___sGlyphImage;
  favoritesTTYDirectGlyphImage___sGlyphImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __51__UIImage_TelephonyUI__favoritesTTYRelayGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) favoritesGlyphForSymbolType:29];
  uint64_t v2 = favoritesTTYRelayGlyphImage___sGlyphImage;
  favoritesTTYRelayGlyphImage___sGlyphImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __48__UIImage_TelephonyUI__favoritesVideoGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) favoritesGlyphForSymbolType:5];
  uint64_t v2 = favoritesVideoGlyphImage___sGlyphImage;
  favoritesVideoGlyphImage___sGlyphImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __58__UIImage_TelephonyUI__recentsIncomingAudioCallGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) recentsGlyphForSymbolType:84];
  uint64_t v2 = recentsIncomingAudioCallGlyphImage___sGlyphImage;
  recentsIncomingAudioCallGlyphImage___sGlyphImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __58__UIImage_TelephonyUI__recentsIncomingVideoCallGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) recentsGlyphForSymbolType:86];
  uint64_t v2 = recentsIncomingVideoCallGlyphImage___sGlyphImage;
  recentsIncomingVideoCallGlyphImage___sGlyphImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __53__UIImage_TelephonyUI__recentsVerifiedCheckmarkImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) recentsGlyphForSymbolType:36];
  uint64_t v2 = recentsVerifiedCheckmarkImage___sCheckmarkImage;
  recentsVerifiedCheckmarkImage___sCheckmarkImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __46__UIImage_TelephonyUI__recentsRTTChevronImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) recentsGlyphForSymbolType:37];
  uint64_t v2 = recentsRTTChevronImage___sChevronImage;
  recentsRTTChevronImage___sChevronImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __45__UIImage_TelephonyUI__recentsAudioCallImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) actionGlyphForSymbolType:83];
  uint64_t v2 = recentsAudioCallImage___sAudioCallImage;
  recentsAudioCallImage___sAudioCallImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __45__UIImage_TelephonyUI__recentsVideoCallImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) actionGlyphForSymbolType:85];
  uint64_t v2 = recentsVideoCallImage___sVideoCallImage;
  recentsVideoCallImage___sVideoCallImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __39__UIImage_TelephonyUI__mailActionImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) actionGlyphForSymbolType:16];
  uint64_t v2 = mailActionImage___sMailActionImage;
  mailActionImage___sMailActionImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __43__UIImage_TelephonyUI__messagesActionImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) actionGlyphForSymbolType:14];
  uint64_t v2 = messagesActionImage___sMessagesActionImage;
  messagesActionImage___sMessagesActionImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __38__UIImage_TelephonyUI__TTYActionImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) actionGlyphForSymbolType:29];
  uint64_t v2 = TTYActionImage___sTTYActionImage;
  TTYActionImage___sTTYActionImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __53__UIImage_TelephonyUI__voicemailAudioRouteGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) voicemailGlyphForSymbolType:32];
  uint64_t v2 = voicemailAudioRouteGlyphImage___sGlyphImage;
  voicemailAudioRouteGlyphImage___sGlyphImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __54__UIImage_TelephonyUI__voicemailDialRequestGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) voicemailGlyphForSymbolType:1];
  uint64_t v2 = voicemailDialRequestGlyphImage___sGlyphImage;
  voicemailDialRequestGlyphImage___sGlyphImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __49__UIImage_TelephonyUI__voicemailDeleteGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) voicemailGlyphForSymbolType:33];
  uint64_t v2 = voicemailDeleteGlyphImage___sGlyphImage;
  voicemailDeleteGlyphImage___sGlyphImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __51__UIImage_TelephonyUI__voicemailUndeleteGlyphImage__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) telephonyUIImageNamed:@"trash.slash.fill_37x37"];
  uint64_t v1 = [v3 imageWithRenderingMode:2];
  uint64_t v2 = (void *)voicemailUndeleteGlyphImage___sGlyphImage;
  voicemailUndeleteGlyphImage___sGlyphImage = v1;
}

uint64_t __47__UIImage_TelephonyUI__voicemailPlayGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) voicemailGlyphForSymbolType:25];
  uint64_t v2 = voicemailPlayGlyphImage___sGlyphImage;
  voicemailPlayGlyphImage___sGlyphImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __55__UIImage_TelephonyUI__voicemailPlayGlyphDisabledImage__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) voicemailPlayGlyphImage];
  uint64_t v1 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
  uint64_t v2 = [v4 tpFlattenedWithColor:v1];
  id v3 = (void *)voicemailPlayGlyphDisabledImage___sGlyphImage;
  voicemailPlayGlyphDisabledImage___sGlyphImage = v2;
}

uint64_t __48__UIImage_TelephonyUI__voicemailPauseGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) voicemailGlyphForSymbolType:26];
  uint64_t v2 = voicemailPauseGlyphImage___sGlyphImage;
  voicemailPauseGlyphImage___sGlyphImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __56__UIImage_TelephonyUI__voicemailPauseGlyphDisabledImage__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) voicemailPauseGlyphImage];
  uint64_t v1 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
  uint64_t v2 = [v4 tpFlattenedWithColor:v1];
  id v3 = (void *)voicemailPauseGlyphDisabledImage___sGlyphImage;
  voicemailPauseGlyphDisabledImage___sGlyphImage = v2;
}

uint64_t __57__UIImage_TelephonyUI__voicemailReportFeedbackGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) voicemailGlyphForSymbolType:35];
  uint64_t v2 = voicemailReportFeedbackGlyphImage___sGlyphImage;
  voicemailReportFeedbackGlyphImage___sGlyphImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __46__UIImage_TelephonyUI__voicemailTTYGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) voicemailGlyphForSymbolType:29];
  uint64_t v2 = voicemailTTYGlyphImage___sGlyphImage;
  voicemailTTYGlyphImage___sGlyphImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __52__UIImage_TelephonyUI__videoMessageRecordGlyphImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) tpImageForSymbolType:80 textStyle:*MEMORY[0x1E4FB2950] scale:2 symbolWeight:4];
  uint64_t v2 = videoMessageRecordGlyphImage___sGlyphImage;
  videoMessageRecordGlyphImage___sGlyphImage = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __50__UIImage_TelephonyUI__symbolNameForCurrentDevice__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F6F260];
  id v3 = [MEMORY[0x1E4F442D8] _typeOfCurrentDevice];
  id v4 = [v3 identifier];
  id v11 = 0;
  v5 = [v2 symbolForTypeIdentifier:v4 withResolutionStrategy:1 variantOptions:1 error:&v11];
  id v6 = v11;

  if (v6)
  {
    v7 = TPDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __50__UIImage_TelephonyUI__symbolNameForCurrentDevice__block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  if (v5) {
    [v5 name];
  }
  else {
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "systemImageNameForSymbolType:", objc_msgSend(*(id *)(a1 + 32), "fallbackSymbolTypeForCurrentDevice"));
  }
  v9 = (void *)symbolNameForCurrentDevice_symbolName;
  symbolNameForCurrentDevice_symbolName = v8;

  v10 = TPDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = symbolNameForCurrentDevice_symbolName;
    _os_log_impl(&dword_1C2F24000, v10, OS_LOG_TYPE_DEFAULT, "Initialized symbol name for current device: %@", buf, 0xCu);
  }
}

void __58__UIImage_TelephonyUI__fallbackSymbolTypeForCurrentDevice__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v0 = MGGetSInt32Answer();
  uint64_t v1 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v2 = [v1 model];

  if ([v2 isEqualToString:@"iPod"])
  {
    uint64_t v3 = 68;
  }
  else
  {
    int v4 = [v2 isEqualToString:@"iPad"];
    uint64_t v3 = 66;
    if (v0 != 2) {
      uint64_t v3 = 67;
    }
    uint64_t v5 = 64;
    if (v0 != 2) {
      uint64_t v5 = 65;
    }
    if (v4) {
      uint64_t v3 = v5;
    }
  }
  fallbackSymbolTypeForCurrentDevice_symbolType = v3;
  id v6 = TPDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = fallbackSymbolTypeForCurrentDevice_symbolType;
    _os_log_impl(&dword_1C2F24000, v6, OS_LOG_TYPE_DEFAULT, "Initialized fallback symbol type for current device: %zd", (uint8_t *)&v7, 0xCu);
  }
}

void __60__UIImage_TelephonyUI__imageWithEtchedBorderOfColor_radius___block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v12 = (CGImage *)[*(id *)(a1 + 32) CGImage];
  CGImageGetWidth(v12);
  CGImageGetHeight(v12);
  UIRectCenteredIntegralRect();
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGContextSaveGState(a2);
  v23.origin.x = a3;
  v23.origin.y = a4;
  v23.size.width = a5;
  v23.size.height = a6;
  CGContextDrawImage(a2, v23, v12);
  v24.origin.x = v14;
  v24.origin.y = v16;
  v24.size.width = v18;
  v24.size.height = v20;
  CGContextClipToMask(a2, v24, v12);
  v25.origin.x = a3;
  v25.origin.y = a4;
  v25.size.width = a5;
  v25.size.height = a6;
  CGContextClearRect(a2, v25);
  CGContextRestoreGState(a2);
  Image = CGBitmapContextCreateImage(a2);
  v26.origin.x = a3;
  v26.origin.y = a4;
  v26.size.width = a5;
  v26.size.height = a6;
  CGContextClearRect(a2, v26);
  v27.origin.x = v14;
  v27.origin.y = v16;
  v27.size.width = v18;
  v27.size.height = v20;
  CGContextDrawImage(a2, v27, v12);
  v28.origin.x = a3;
  v28.origin.y = a4;
  v28.size.width = a5;
  v28.size.height = a6;
  CGContextClipToMask(a2, v28, Image);
  CGContextSetFillColorWithColor(a2, (CGColorRef)[*(id *)(a1 + 40) CGColor]);
  v29.origin.x = a3;
  v29.origin.y = a4;
  v29.size.width = a5;
  v29.size.height = a6;
  CGContextFillRect(a2, v29);
  CGImageRelease(Image);
}

void __40__UIImage_TelephonyUI__imageWithShadow___block_invoke(uint64_t a1, CGContext *a2)
{
  int v4 = [*(id *)(a1 + 32) shadowColor];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] clearColor];
    char v6 = [v4 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      double v7 = *(double *)(a1 + 56);
      CGFloat v8 = *(double *)(a1 + 48) * v7;
      CGAffineTransformMakeScale(&v24, v7, v7);
      double v9 = *(double *)(a1 + 64);
      double v10 = *(double *)(a1 + 72);
      CGFloat v11 = v10 * v24.c + v24.a * v9;
      CGFloat v12 = v10 * v24.d + v24.b * v9;
      double v13 = (CGColor *)[v4 CGColor];
      v25.width = v11;
      v25.height = v12;
      CGContextSetShadowWithColor(a2, v25, v8, v13);
    }
  }
  CGFloat v14 = (CGImage *)[*(id *)(a1 + 40) CGImage];
  CGImageGetWidth(v14);
  CGImageGetHeight(v14);
  UIRectCenteredIntegralRect();
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGRect v23 = (CGImage *)[*(id *)(a1 + 40) CGImage];
  v26.origin.x = v16;
  v26.origin.y = v18;
  v26.size.width = v20;
  v26.size.height = v22;
  CGContextDrawImage(a2, v26, v23);
}

void __43__UIImage_TelephonyUI__genericBusinessLogo__block_invoke()
{
  int v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"building.2.fill"];
  uint64_t v1 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v2 = [MEMORY[0x1E4FB08E0] systemFontOfSize:24.0];
  uint64_t v3 = [v1 configurationWithFont:v2];

  int v4 = [v0 imageByApplyingSymbolConfiguration:v3];

  id v5 = objc_alloc(MEMORY[0x1E4FB17D8]);
  [v4 size];
  double v7 = v6 * 2.0 + 12.0;
  [v4 size];
  double v9 = objc_msgSend(v5, "initWithSize:", v7, v8 * 2.0 + 12.0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__UIImage_TelephonyUI__genericBusinessLogo__block_invoke_2;
  v13[3] = &unk_1E647C180;
  id v14 = v4;
  id v10 = v4;
  uint64_t v11 = [v9 imageWithActions:v13];
  CGFloat v12 = (void *)genericBusinessLogo___businessLogo;
  genericBusinessLogo___businessLogo = v11;
}

void __43__UIImage_TelephonyUI__genericBusinessLogo__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a2;
  id v5 = [v3 lightGrayColor];
  [v5 setFill];

  double v6 = [v4 format];
  [v6 bounds];
  objc_msgSend(v4, "fillRect:");

  [*(id *)(a1 + 32) size];
  double v8 = v7 + v7;
  [*(id *)(a1 + 32) size];
  double v10 = v9 + v9;
  uint64_t v11 = *(void **)(a1 + 32);
  id v13 = [MEMORY[0x1E4FB1618] whiteColor];
  CGFloat v12 = [v11 imageWithTintColor:v13];
  objc_msgSend(v12, "drawInRect:", 6.0, 6.0, v8, v10);
}

void __50__UIImage_TelephonyUI__symbolNameForCurrentDevice__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2F24000, a2, OS_LOG_TYPE_ERROR, "Error finding symbol for current device: %@", (uint8_t *)&v2, 0xCu);
}

@end