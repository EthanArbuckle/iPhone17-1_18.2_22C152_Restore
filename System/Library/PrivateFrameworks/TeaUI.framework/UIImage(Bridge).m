@interface UIImage(Bridge)
+ (id)ts_bookmark;
+ (id)ts_bookmarkFill;
+ (id)ts_bookmarkFillForHUD;
+ (id)ts_checkmark;
+ (id)ts_checkmarkCircleFill;
+ (id)ts_checkmarkCircleFillWhite;
+ (id)ts_checkmarkCircleOnGrayFill;
+ (id)ts_checkmarkCircleOpaqueFillOnPink;
+ (id)ts_checkmarkCircleTertiaryFillOnPink;
+ (id)ts_checkmarkForHUD;
+ (id)ts_chevronRight;
+ (id)ts_circleFill;
+ (id)ts_disclosureIndicator;
+ (id)ts_ellipsis;
+ (id)ts_ellipsisCircle;
+ (id)ts_ellipsisCircleFill;
+ (id)ts_ellipsisCircleFillWhite;
+ (id)ts_ellipsisCirclePinkOnTertiaryFill;
+ (id)ts_ellipsisCircleTertiaryFillOnPink;
+ (id)ts_ellipsisCircleWhite;
+ (id)ts_exclamationMarkCircle;
+ (id)ts_filledSystemImageNamed:()Bridge fillColor:symbolColor:;
+ (id)ts_filledSystemImageNamed:()Bridge fillColor:symbolColor:symbolConfig:;
+ (id)ts_handRaised;
+ (id)ts_handRaisedFill;
+ (id)ts_handRaisedFillForHUD;
+ (id)ts_handRaisedSlash;
+ (id)ts_handRaisedSlashFill;
+ (id)ts_handThumbsDown;
+ (id)ts_handThumbsDownFill;
+ (id)ts_handThumbsDownFillForHUD;
+ (id)ts_handThumbsUp;
+ (id)ts_handThumbsUpFill;
+ (id)ts_handThumbsUpFillForHUD;
+ (id)ts_heartCircle;
+ (id)ts_heartCircleFill;
+ (id)ts_heartCirclePinkOnTertiaryFill;
+ (id)ts_heartCircleTertiaryFillOnPink;
+ (id)ts_heartFill;
+ (id)ts_iCloudAndArrowDown;
+ (id)ts_link;
+ (id)ts_minusCircle;
+ (id)ts_minusCircleFill;
+ (id)ts_minusCircleFillWhite;
+ (id)ts_minusCircleOpaqueFillOnRed;
+ (id)ts_minusCircleTertiaryFillOnPink;
+ (id)ts_navigationVerticalColumnShadow;
+ (id)ts_noSign;
+ (id)ts_plus;
+ (id)ts_plusCircle;
+ (id)ts_plusCircleFill;
+ (id)ts_plusCirclePinkOnGrayFill;
+ (id)ts_plusCirclePinkOnOpaqueFill;
+ (id)ts_plusCirclePinkOnTertiaryFill;
+ (id)ts_plusCircleWhite;
+ (id)ts_rightArrow;
+ (id)ts_safari;
+ (id)ts_sidebarLeft;
+ (id)ts_squareAndArrowUp;
+ (id)ts_textFormatSize;
+ (id)ts_trash;
+ (id)ts_xmark;
+ (id)ts_xmarkCircle;
+ (id)ts_xmarkForHUD;
+ (uint64_t)ts_internalSystemImageNamed:()Bridge;
+ (uint64_t)ts_internalSystemImageNamed:()Bridge withConfiguration:;
+ (uint64_t)ts_macSidebar;
@end

@implementation UIImage(Bridge)

+ (uint64_t)ts_internalSystemImageNamed:()Bridge
{
  return objc_msgSend(MEMORY[0x1E4FB1818], "_systemImageNamed:");
}

+ (id)ts_bookmark
{
  if (ts_bookmark_onceToken != -1) {
    dispatch_once(&ts_bookmark_onceToken, &__block_literal_global);
  }
  v0 = (void *)ts_bookmark_image;
  return v0;
}

+ (id)ts_bookmarkFill
{
  if (ts_bookmarkFill_onceToken != -1) {
    dispatch_once(&ts_bookmarkFill_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)ts_bookmarkFill_image;
  return v0;
}

+ (id)ts_bookmarkFillForHUD
{
  if (ts_bookmarkFillForHUD_onceToken != -1) {
    dispatch_once(&ts_bookmarkFillForHUD_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)ts_bookmarkFillForHUD_image;
  return v0;
}

+ (id)ts_checkmark
{
  if (ts_checkmark_onceToken != -1) {
    dispatch_once(&ts_checkmark_onceToken, &__block_literal_global_11);
  }
  v0 = (void *)ts_checkmark_image;
  return v0;
}

+ (id)ts_checkmarkCircleFill
{
  if (ts_checkmarkCircleFill_onceToken != -1) {
    dispatch_once(&ts_checkmarkCircleFill_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)ts_checkmarkCircleFill_image;
  return v0;
}

+ (id)ts_checkmarkCircleFillWhite
{
  if (ts_checkmarkCircleFillWhite_onceToken != -1) {
    dispatch_once(&ts_checkmarkCircleFillWhite_onceToken, &__block_literal_global_21);
  }
  v0 = (void *)ts_checkmarkCircleFillWhite_image;
  return v0;
}

+ (id)ts_checkmarkCircleTertiaryFillOnPink
{
  if (ts_checkmarkCircleTertiaryFillOnPink_onceToken != -1) {
    dispatch_once(&ts_checkmarkCircleTertiaryFillOnPink_onceToken, &__block_literal_global_23);
  }
  v0 = (void *)ts_checkmarkCircleTertiaryFillOnPink_image;
  return v0;
}

+ (id)ts_checkmarkCircleOpaqueFillOnPink
{
  if (ts_checkmarkCircleOpaqueFillOnPink_onceToken != -1) {
    dispatch_once(&ts_checkmarkCircleOpaqueFillOnPink_onceToken, &__block_literal_global_27);
  }
  v0 = (void *)ts_checkmarkCircleOpaqueFillOnPink_image;
  return v0;
}

+ (id)ts_minusCircleOpaqueFillOnRed
{
  if (ts_minusCircleOpaqueFillOnRed_onceToken != -1) {
    dispatch_once(&ts_minusCircleOpaqueFillOnRed_onceToken, &__block_literal_global_29);
  }
  v0 = (void *)ts_minusCircleOpaqueFillOnRed_image;
  return v0;
}

+ (id)ts_checkmarkCircleOnGrayFill
{
  if (ts_checkmarkCircleOnGrayFill_onceToken != -1) {
    dispatch_once(&ts_checkmarkCircleOnGrayFill_onceToken, &__block_literal_global_34);
  }
  v0 = (void *)ts_checkmarkCircleOnGrayFill_image;
  return v0;
}

+ (id)ts_checkmarkForHUD
{
  if (ts_checkmarkForHUD_onceToken != -1) {
    dispatch_once(&ts_checkmarkForHUD_onceToken, &__block_literal_global_36);
  }
  v0 = (void *)ts_checkmarkForHUD_image;
  return v0;
}

+ (id)ts_chevronRight
{
  if (ts_chevronRight_onceToken != -1) {
    dispatch_once(&ts_chevronRight_onceToken, &__block_literal_global_38);
  }
  v0 = (void *)ts_chevronRight_image;
  return v0;
}

+ (id)ts_circleFill
{
  if (ts_circleFill_onceToken != -1) {
    dispatch_once(&ts_circleFill_onceToken, &__block_literal_global_43);
  }
  v0 = (void *)ts_circleFill_image;
  return v0;
}

+ (id)ts_disclosureIndicator
{
  if (ts_disclosureIndicator_onceToken != -1) {
    dispatch_once(&ts_disclosureIndicator_onceToken, &__block_literal_global_48);
  }
  v0 = (void *)ts_disclosureIndicator_disclosureIndicator;
  return v0;
}

+ (id)ts_ellipsis
{
  if (ts_ellipsis_onceToken != -1) {
    dispatch_once(&ts_ellipsis_onceToken, &__block_literal_global_53);
  }
  v0 = (void *)ts_ellipsis_image;
  return v0;
}

+ (id)ts_ellipsisCircle
{
  if (ts_ellipsisCircle_onceToken != -1) {
    dispatch_once(&ts_ellipsisCircle_onceToken, &__block_literal_global_58);
  }
  v0 = (void *)ts_ellipsisCircle_image;
  return v0;
}

+ (id)ts_ellipsisCircleWhite
{
  if (ts_ellipsisCircleWhite_onceToken != -1) {
    dispatch_once(&ts_ellipsisCircleWhite_onceToken, &__block_literal_global_63);
  }
  v0 = (void *)ts_ellipsisCircleWhite_image;
  return v0;
}

+ (id)ts_ellipsisCirclePinkOnTertiaryFill
{
  if (ts_ellipsisCirclePinkOnTertiaryFill_onceToken != -1) {
    dispatch_once(&ts_ellipsisCirclePinkOnTertiaryFill_onceToken, &__block_literal_global_65);
  }
  v0 = (void *)ts_ellipsisCirclePinkOnTertiaryFill_image;
  return v0;
}

+ (id)ts_ellipsisCircleFill
{
  if (ts_ellipsisCircleFill_onceToken != -1) {
    dispatch_once(&ts_ellipsisCircleFill_onceToken, &__block_literal_global_70);
  }
  v0 = (void *)ts_ellipsisCircleFill_image;
  return v0;
}

+ (id)ts_ellipsisCircleFillWhite
{
  if (ts_ellipsisCircleFillWhite_onceToken != -1) {
    dispatch_once(&ts_ellipsisCircleFillWhite_onceToken, &__block_literal_global_72);
  }
  v0 = (void *)ts_ellipsisCircleFillWhite_image;
  return v0;
}

+ (id)ts_ellipsisCircleTertiaryFillOnPink
{
  if (ts_ellipsisCircleTertiaryFillOnPink_onceToken != -1) {
    dispatch_once(&ts_ellipsisCircleTertiaryFillOnPink_onceToken, &__block_literal_global_74);
  }
  v0 = (void *)ts_ellipsisCircleTertiaryFillOnPink_image;
  return v0;
}

+ (id)ts_exclamationMarkCircle
{
  if (ts_exclamationMarkCircle_onceToken != -1) {
    dispatch_once(&ts_exclamationMarkCircle_onceToken, &__block_literal_global_76);
  }
  v0 = (void *)ts_exclamationMarkCircle_image;
  return v0;
}

+ (id)ts_filledSystemImageNamed:()Bridge fillColor:symbolColor:
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4FB1830];
  v16[0] = a4;
  v16[1] = a5;
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 arrayWithObjects:v16 count:2];
  v13 = [v7 configurationWithPaletteColors:v12];

  v14 = [MEMORY[0x1E4FB1818] _systemImageNamed:v11 withConfiguration:v13];

  return v14;
}

+ (id)ts_filledSystemImageNamed:()Bridge fillColor:symbolColor:symbolConfig:
{
  id v9 = a6;
  id v10 = objc_msgSend(MEMORY[0x1E4FB1818], "ts_filledSystemImageNamed:fillColor:symbolColor:", a3, a4, a5);
  id v11 = v10;
  if (v9)
  {
    uint64_t v12 = [v10 imageByApplyingSymbolConfiguration:v9];

    id v11 = (void *)v12;
  }

  return v11;
}

+ (id)ts_handRaised
{
  if (ts_handRaised_onceToken != -1) {
    dispatch_once(&ts_handRaised_onceToken, &__block_literal_global_81);
  }
  v0 = (void *)ts_handRaised_image;
  return v0;
}

+ (id)ts_handRaisedFill
{
  if (ts_handRaisedFill_onceToken != -1) {
    dispatch_once(&ts_handRaisedFill_onceToken, &__block_literal_global_86);
  }
  v0 = (void *)ts_handRaisedFill_image;
  return v0;
}

+ (id)ts_handRaisedFillForHUD
{
  if (ts_handRaisedFillForHUD_onceToken != -1) {
    dispatch_once(&ts_handRaisedFillForHUD_onceToken, &__block_literal_global_91);
  }
  v0 = (void *)ts_handRaisedFillForHUD_image;
  return v0;
}

+ (id)ts_handRaisedSlash
{
  if (ts_handRaisedSlash_onceToken != -1) {
    dispatch_once(&ts_handRaisedSlash_onceToken, &__block_literal_global_93);
  }
  v0 = (void *)ts_handRaisedSlash_image;
  return v0;
}

+ (id)ts_handRaisedSlashFill
{
  if (ts_handRaisedSlashFill_onceToken != -1) {
    dispatch_once(&ts_handRaisedSlashFill_onceToken, &__block_literal_global_98);
  }
  v0 = (void *)ts_handRaisedSlashFill_image;
  return v0;
}

+ (id)ts_handThumbsDown
{
  if (ts_handThumbsDown_onceToken != -1) {
    dispatch_once(&ts_handThumbsDown_onceToken, &__block_literal_global_103);
  }
  v0 = (void *)ts_handThumbsDown_image;
  return v0;
}

+ (id)ts_handThumbsDownFill
{
  if (ts_handThumbsDownFill_onceToken != -1) {
    dispatch_once(&ts_handThumbsDownFill_onceToken, &__block_literal_global_108);
  }
  v0 = (void *)ts_handThumbsDownFill_image;
  return v0;
}

+ (id)ts_handThumbsDownFillForHUD
{
  if (ts_handThumbsDownFillForHUD_onceToken != -1) {
    dispatch_once(&ts_handThumbsDownFillForHUD_onceToken, &__block_literal_global_113);
  }
  v0 = (void *)ts_handThumbsDownFillForHUD_image;
  return v0;
}

+ (id)ts_handThumbsUp
{
  if (ts_handThumbsUp_onceToken != -1) {
    dispatch_once(&ts_handThumbsUp_onceToken, &__block_literal_global_115);
  }
  v0 = (void *)ts_handThumbsUp_image;
  return v0;
}

+ (id)ts_handThumbsUpFill
{
  if (ts_handThumbsUpFill_onceToken != -1) {
    dispatch_once(&ts_handThumbsUpFill_onceToken, &__block_literal_global_120);
  }
  v0 = (void *)ts_handThumbsUpFill_image;
  return v0;
}

+ (id)ts_handThumbsUpFillForHUD
{
  if (ts_handThumbsUpFillForHUD_onceToken != -1) {
    dispatch_once(&ts_handThumbsUpFillForHUD_onceToken, &__block_literal_global_125);
  }
  v0 = (void *)ts_handThumbsUpFillForHUD_image;
  return v0;
}

+ (id)ts_heartCircle
{
  if (ts_heartCircle_onceToken != -1) {
    dispatch_once(&ts_heartCircle_onceToken, &__block_literal_global_127);
  }
  v0 = (void *)ts_heartCircle_image;
  return v0;
}

+ (id)ts_heartCirclePinkOnTertiaryFill
{
  if (ts_heartCirclePinkOnTertiaryFill_onceToken != -1) {
    dispatch_once(&ts_heartCirclePinkOnTertiaryFill_onceToken, &__block_literal_global_132);
  }
  v0 = (void *)ts_heartCirclePinkOnTertiaryFill_image;
  return v0;
}

+ (id)ts_heartCircleFill
{
  if (ts_heartCircleFill_onceToken != -1) {
    dispatch_once(&ts_heartCircleFill_onceToken, &__block_literal_global_137);
  }
  v0 = (void *)ts_heartCircleFill_image;
  return v0;
}

+ (id)ts_heartCircleTertiaryFillOnPink
{
  if (ts_heartCircleTertiaryFillOnPink_onceToken != -1) {
    dispatch_once(&ts_heartCircleTertiaryFillOnPink_onceToken, &__block_literal_global_139);
  }
  v0 = (void *)ts_heartCircleTertiaryFillOnPink_image;
  return v0;
}

+ (id)ts_heartFill
{
  if (ts_heartFill_onceToken != -1) {
    dispatch_once(&ts_heartFill_onceToken, &__block_literal_global_141);
  }
  v0 = (void *)ts_heartFill_image;
  return v0;
}

+ (id)ts_iCloudAndArrowDown
{
  if (ts_iCloudAndArrowDown_onceToken != -1) {
    dispatch_once(&ts_iCloudAndArrowDown_onceToken, &__block_literal_global_146);
  }
  v0 = (void *)ts_iCloudAndArrowDown_image;
  return v0;
}

+ (id)ts_link
{
  if (ts_link_onceToken[0] != -1) {
    dispatch_once(ts_link_onceToken, &__block_literal_global_151);
  }
  v0 = (void *)ts_link_image;
  return v0;
}

+ (uint64_t)ts_macSidebar
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"sidebar.left"];
}

+ (id)ts_minusCircle
{
  if (ts_minusCircle_onceToken != -1) {
    dispatch_once(&ts_minusCircle_onceToken, &__block_literal_global_159);
  }
  v0 = (void *)ts_minusCircle_image;
  return v0;
}

+ (id)ts_minusCircleFill
{
  if (ts_minusCircleFill_onceToken != -1) {
    dispatch_once(&ts_minusCircleFill_onceToken, &__block_literal_global_164);
  }
  v0 = (void *)ts_minusCircleFill_image;
  return v0;
}

+ (id)ts_minusCircleFillWhite
{
  if (ts_minusCircleFillWhite_onceToken != -1) {
    dispatch_once(&ts_minusCircleFillWhite_onceToken, &__block_literal_global_166);
  }
  v0 = (void *)ts_minusCircleFillWhite_image;
  return v0;
}

+ (id)ts_minusCircleTertiaryFillOnPink
{
  if (ts_minusCircleTertiaryFillOnPink_onceToken != -1) {
    dispatch_once(&ts_minusCircleTertiaryFillOnPink_onceToken, &__block_literal_global_168);
  }
  v0 = (void *)ts_minusCircleTertiaryFillOnPink_image;
  return v0;
}

+ (id)ts_navigationVerticalColumnShadow
{
  if (ts_navigationVerticalColumnShadow_onceToken != -1) {
    dispatch_once(&ts_navigationVerticalColumnShadow_onceToken, &__block_literal_global_170);
  }
  v0 = (void *)ts_navigationVerticalColumnShadow_navigationVerticalColumnShadow;
  return v0;
}

+ (id)ts_noSign
{
  if (ts_noSign_onceToken != -1) {
    dispatch_once(&ts_noSign_onceToken, &__block_literal_global_175);
  }
  v0 = (void *)ts_noSign_image;
  return v0;
}

+ (id)ts_plus
{
  if (ts_plus_onceToken[0] != -1) {
    dispatch_once(ts_plus_onceToken, &__block_literal_global_180);
  }
  v0 = (void *)ts_plus_image;
  return v0;
}

+ (id)ts_plusCircle
{
  if (ts_plusCircle_onceToken != -1) {
    dispatch_once(&ts_plusCircle_onceToken, &__block_literal_global_185);
  }
  v0 = (void *)ts_plusCircle_image;
  return v0;
}

+ (id)ts_plusCircleWhite
{
  if (ts_plusCircleWhite_onceToken != -1) {
    dispatch_once(&ts_plusCircleWhite_onceToken, &__block_literal_global_190);
  }
  v0 = (void *)ts_plusCircleWhite_image;
  return v0;
}

+ (id)ts_plusCircleFill
{
  if (ts_plusCircleFill_onceToken != -1) {
    dispatch_once(&ts_plusCircleFill_onceToken, &__block_literal_global_192);
  }
  v0 = (void *)ts_plusCircleFill_image;
  return v0;
}

+ (id)ts_plusCirclePinkOnTertiaryFill
{
  if (ts_plusCirclePinkOnTertiaryFill_onceToken != -1) {
    dispatch_once(&ts_plusCirclePinkOnTertiaryFill_onceToken, &__block_literal_global_197);
  }
  v0 = (void *)ts_plusCirclePinkOnTertiaryFill_image;
  return v0;
}

+ (id)ts_plusCirclePinkOnOpaqueFill
{
  if (ts_plusCirclePinkOnOpaqueFill_onceToken != -1) {
    dispatch_once(&ts_plusCirclePinkOnOpaqueFill_onceToken, &__block_literal_global_199);
  }
  v0 = (void *)ts_plusCirclePinkOnOpaqueFill_image;
  return v0;
}

+ (id)ts_plusCirclePinkOnGrayFill
{
  if (ts_plusCirclePinkOnGrayFill_onceToken != -1) {
    dispatch_once(&ts_plusCirclePinkOnGrayFill_onceToken, &__block_literal_global_201);
  }
  v0 = (void *)ts_plusCirclePinkOnGrayFill_image;
  return v0;
}

+ (id)ts_rightArrow
{
  if (ts_rightArrow_onceToken != -1) {
    dispatch_once(&ts_rightArrow_onceToken, &__block_literal_global_203);
  }
  v0 = (void *)ts_rightArrow_image;
  return v0;
}

+ (id)ts_safari
{
  if (ts_safari_onceToken != -1) {
    dispatch_once(&ts_safari_onceToken, &__block_literal_global_208);
  }
  v0 = (void *)ts_safari_image;
  return v0;
}

+ (id)ts_sidebarLeft
{
  if (ts_sidebarLeft_onceToken != -1) {
    dispatch_once(&ts_sidebarLeft_onceToken, &__block_literal_global_213);
  }
  v0 = (void *)ts_sidebarLeft_image;
  return v0;
}

+ (id)ts_squareAndArrowUp
{
  if (ts_squareAndArrowUp_onceToken != -1) {
    dispatch_once(&ts_squareAndArrowUp_onceToken, &__block_literal_global_215);
  }
  v0 = (void *)ts_squareAndArrowUp_image;
  return v0;
}

+ (id)ts_textFormatSize
{
  if (ts_textFormatSize_onceToken != -1) {
    dispatch_once(&ts_textFormatSize_onceToken, &__block_literal_global_220);
  }
  v0 = (void *)ts_textFormatSize_image;
  return v0;
}

+ (id)ts_trash
{
  if (ts_trash_onceToken != -1) {
    dispatch_once(&ts_trash_onceToken, &__block_literal_global_225);
  }
  v0 = (void *)ts_trash_image;
  return v0;
}

+ (id)ts_xmark
{
  if (ts_xmark_onceToken != -1) {
    dispatch_once(&ts_xmark_onceToken, &__block_literal_global_230);
  }
  v0 = (void *)ts_xmark_image;
  return v0;
}

+ (id)ts_xmarkCircle
{
  if (ts_xmarkCircle_onceToken != -1) {
    dispatch_once(&ts_xmarkCircle_onceToken, &__block_literal_global_235);
  }
  v0 = (void *)ts_xmarkCircle_image;
  return v0;
}

+ (id)ts_xmarkForHUD
{
  if (ts_xmarkForHUD_onceToken != -1) {
    dispatch_once(&ts_xmarkForHUD_onceToken, &__block_literal_global_240);
  }
  v0 = (void *)ts_xmarkForHUD_image;
  return v0;
}

+ (uint64_t)ts_internalSystemImageNamed:()Bridge withConfiguration:
{
  return objc_msgSend(MEMORY[0x1E4FB1818], "_systemImageNamed:withConfiguration:");
}

@end