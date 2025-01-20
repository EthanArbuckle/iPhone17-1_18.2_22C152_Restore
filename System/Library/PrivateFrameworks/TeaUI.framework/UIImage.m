@interface UIImage
@end

@implementation UIImage

void __30__UIImage_Bridge__ts_bookmark__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"bookmark"];
  v1 = (void *)ts_bookmark_image;
  ts_bookmark_image = v0;
}

void __34__UIImage_Bridge__ts_bookmarkFill__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"bookmark.fill"];
  v1 = (void *)ts_bookmarkFill_image;
  ts_bookmarkFill_image = v0;
}

void __40__UIImage_Bridge__ts_bookmarkFillForHUD__block_invoke()
{
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"bookmark.fill"];
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.309803922 green:0.309803922 blue:0.309803922 alpha:1.0];
  uint64_t v1 = [v3 _flatImageWithColor:v0];
  v2 = (void *)ts_bookmarkFillForHUD_image;
  ts_bookmarkFillForHUD_image = v1;
}

void __31__UIImage_Bridge__ts_checkmark__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
  uint64_t v1 = (void *)ts_checkmark_image;
  ts_checkmark_image = v0;
}

void __41__UIImage_Bridge__ts_checkmarkCircleFill__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
  uint64_t v1 = (void *)ts_checkmarkCircleFill_image;
  ts_checkmarkCircleFill_image = v0;
}

void __46__UIImage_Bridge__ts_checkmarkCircleFillWhite__block_invoke()
{
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
  uint64_t v0 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v1 = [v3 imageWithTintColor:v0];
  v2 = (void *)ts_checkmarkCircleFillWhite_image;
  ts_checkmarkCircleFillWhite_image = v1;
}

void __55__UIImage_Bridge__ts_checkmarkCircleTertiaryFillOnPink__block_invoke()
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  uint64_t v1 = [MEMORY[0x1E4FB1830] configurationWithWeight:5];
  v2 = [v0 configurationByApplyingConfiguration:v1];

  id v3 = (void *)MEMORY[0x1E4FB1830];
  v4 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  v11[0] = v4;
  v5 = [MEMORY[0x1E4FB1618] systemPinkColor];
  v11[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v7 = [v3 configurationWithPaletteColors:v6];
  v8 = [v2 configurationByApplyingConfiguration:v7];

  uint64_t v9 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"checkmark.circle.fill" withConfiguration:v8];
  v10 = (void *)ts_checkmarkCircleTertiaryFillOnPink_image;
  ts_checkmarkCircleTertiaryFillOnPink_image = v9;
}

void __53__UIImage_Bridge__ts_checkmarkCircleOpaqueFillOnPink__block_invoke()
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  uint64_t v1 = [MEMORY[0x1E4FB1830] configurationWithWeight:5];
  v2 = [v0 configurationByApplyingConfiguration:v1];

  id v3 = (void *)MEMORY[0x1E4FB1830];
  v4 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  v11[0] = v4;
  v5 = [MEMORY[0x1E4FB1618] systemPinkColor];
  v11[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v7 = [v3 configurationWithPaletteColors:v6];
  v8 = [v2 configurationByApplyingConfiguration:v7];

  uint64_t v9 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"checkmark.circle.fill" withConfiguration:v8];
  v10 = (void *)ts_checkmarkCircleOpaqueFillOnPink_image;
  ts_checkmarkCircleOpaqueFillOnPink_image = v9;
}

void __48__UIImage_Bridge__ts_minusCircleOpaqueFillOnRed__block_invoke()
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  uint64_t v1 = [MEMORY[0x1E4FB1830] configurationWithWeight:5];
  v2 = [v0 configurationByApplyingConfiguration:v1];

  id v3 = (void *)MEMORY[0x1E4FB1830];
  v4 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  v11[0] = v4;
  v5 = [MEMORY[0x1E4FB1618] systemRedColor];
  v11[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v7 = [v3 configurationWithPaletteColors:v6];
  v8 = [v2 configurationByApplyingConfiguration:v7];

  uint64_t v9 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"minus.circle.fill" withConfiguration:v8];
  v10 = (void *)ts_minusCircleOpaqueFillOnRed_image;
  ts_minusCircleOpaqueFillOnRed_image = v9;
}

void __47__UIImage_Bridge__ts_checkmarkCircleOnGrayFill__block_invoke()
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  uint64_t v1 = [MEMORY[0x1E4FB1830] configurationWithWeight:5];
  v2 = [v0 configurationByApplyingConfiguration:v1];

  id v3 = (void *)MEMORY[0x1E4FB1830];
  v4 = [MEMORY[0x1E4FB1618] systemPinkColor];
  v11[0] = v4;
  v5 = [MEMORY[0x1E4FB1618] systemFillColor];
  v11[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v7 = [v3 configurationWithPaletteColors:v6];
  v8 = [v2 configurationByApplyingConfiguration:v7];

  uint64_t v9 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"checkmark.circle.fill" withConfiguration:v8];
  v10 = (void *)ts_checkmarkCircleOnGrayFill_image;
  ts_checkmarkCircleOnGrayFill_image = v9;
}

void __37__UIImage_Bridge__ts_checkmarkForHUD__block_invoke()
{
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.309803922 green:0.309803922 blue:0.309803922 alpha:1.0];
  uint64_t v1 = [v3 _flatImageWithColor:v0];
  v2 = (void *)ts_checkmarkForHUD_image;
  ts_checkmarkForHUD_image = v1;
}

void __34__UIImage_Bridge__ts_chevronRight__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:1];
  uint64_t v1 = [MEMORY[0x1E4FB1830] configurationWithWeight:6];
  id v4 = [v0 configurationByApplyingConfiguration:v1];

  uint64_t v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.right" withConfiguration:v4];
  id v3 = (void *)ts_chevronRight_image;
  ts_chevronRight_image = v2;
}

void __32__UIImage_Bridge__ts_circleFill__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle.fill"];
  uint64_t v1 = (void *)ts_circleFill_image;
  ts_circleFill_image = v0;
}

void __41__UIImage_Bridge__ts_disclosureIndicator__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] kitImageNamed:@"UITableNext"];
  uint64_t v1 = (void *)ts_disclosureIndicator_disclosureIndicator;
  ts_disclosureIndicator_disclosureIndicator = v0;
}

void __30__UIImage_Bridge__ts_ellipsis__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis"];
  uint64_t v1 = (void *)ts_ellipsis_image;
  ts_ellipsis_image = v0;
}

void __36__UIImage_Bridge__ts_ellipsisCircle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis.circle"];
  uint64_t v1 = (void *)ts_ellipsisCircle_image;
  ts_ellipsisCircle_image = v0;
}

void __41__UIImage_Bridge__ts_ellipsisCircleWhite__block_invoke()
{
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis.circle"];
  uint64_t v0 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v1 = [v3 imageWithTintColor:v0];
  uint64_t v2 = (void *)ts_ellipsisCircleWhite_image;
  ts_ellipsisCircleWhite_image = v1;
}

void __54__UIImage_Bridge__ts_ellipsisCirclePinkOnTertiaryFill__block_invoke()
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  uint64_t v1 = [MEMORY[0x1E4FB1830] configurationWithWeight:5];
  uint64_t v2 = [v0 configurationByApplyingConfiguration:v1];

  uint64_t v3 = [(id)ts_ellipsisCirclePinkOnTertiaryFill_image imageWithConfiguration:v2];
  id v4 = (void *)ts_ellipsisCirclePinkOnTertiaryFill_image;
  ts_ellipsisCirclePinkOnTertiaryFill_image = v3;

  v5 = (void *)MEMORY[0x1E4FB1830];
  v6 = [MEMORY[0x1E4FB1618] systemPinkColor];
  v13[0] = v6;
  v7 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  v13[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v9 = [v5 configurationWithPaletteColors:v8];
  v10 = [v2 configurationByApplyingConfiguration:v9];

  uint64_t v11 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"ellipsis.circle.fill" withConfiguration:v10];
  v12 = (void *)ts_ellipsisCirclePinkOnTertiaryFill_image;
  ts_ellipsisCirclePinkOnTertiaryFill_image = v11;
}

void __40__UIImage_Bridge__ts_ellipsisCircleFill__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis.circle.fill"];
  uint64_t v1 = (void *)ts_ellipsisCircleFill_image;
  ts_ellipsisCircleFill_image = v0;
}

void __45__UIImage_Bridge__ts_ellipsisCircleFillWhite__block_invoke()
{
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis.circle.fill"];
  uint64_t v0 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v1 = [v3 imageWithTintColor:v0];
  uint64_t v2 = (void *)ts_ellipsisCircleFillWhite_image;
  ts_ellipsisCircleFillWhite_image = v1;
}

void __54__UIImage_Bridge__ts_ellipsisCircleTertiaryFillOnPink__block_invoke()
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  uint64_t v1 = [MEMORY[0x1E4FB1830] configurationWithWeight:5];
  uint64_t v2 = [v0 configurationByApplyingConfiguration:v1];

  id v3 = (void *)MEMORY[0x1E4FB1830];
  id v4 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  v11[0] = v4;
  v5 = [MEMORY[0x1E4FB1618] systemPinkColor];
  v11[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v7 = [v3 configurationWithPaletteColors:v6];
  v8 = [v2 configurationByApplyingConfiguration:v7];

  uint64_t v9 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"ellipsis.circle.fill" withConfiguration:v8];
  v10 = (void *)ts_ellipsisCircleTertiaryFillOnPink_image;
  ts_ellipsisCircleTertiaryFillOnPink_image = v9;
}

void __43__UIImage_Bridge__ts_exclamationMarkCircle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.circle"];
  uint64_t v1 = (void *)ts_exclamationMarkCircle_image;
  ts_exclamationMarkCircle_image = v0;
}

void __32__UIImage_Bridge__ts_handRaised__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hand.raised"];
  uint64_t v1 = (void *)ts_handRaised_image;
  ts_handRaised_image = v0;
}

void __36__UIImage_Bridge__ts_handRaisedFill__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hand.raised.fill"];
  uint64_t v1 = (void *)ts_handRaisedFill_image;
  ts_handRaisedFill_image = v0;
}

void __42__UIImage_Bridge__ts_handRaisedFillForHUD__block_invoke()
{
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hand.raised.fill"];
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.309803922 green:0.309803922 blue:0.309803922 alpha:1.0];
  uint64_t v1 = [v3 _flatImageWithColor:v0];
  uint64_t v2 = (void *)ts_handRaisedFillForHUD_image;
  ts_handRaisedFillForHUD_image = v1;
}

void __37__UIImage_Bridge__ts_handRaisedSlash__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hand.raised.slash"];
  uint64_t v1 = (void *)ts_handRaisedSlash_image;
  ts_handRaisedSlash_image = v0;
}

void __41__UIImage_Bridge__ts_handRaisedSlashFill__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hand.raised.slash.fill"];
  uint64_t v1 = (void *)ts_handRaisedSlashFill_image;
  ts_handRaisedSlashFill_image = v0;
}

void __36__UIImage_Bridge__ts_handThumbsDown__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hand.thumbsdown"];
  uint64_t v1 = (void *)ts_handThumbsDown_image;
  ts_handThumbsDown_image = v0;
}

void __40__UIImage_Bridge__ts_handThumbsDownFill__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hand.thumbsdown.fill"];
  uint64_t v1 = (void *)ts_handThumbsDownFill_image;
  ts_handThumbsDownFill_image = v0;
}

void __46__UIImage_Bridge__ts_handThumbsDownFillForHUD__block_invoke()
{
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hand.thumbsdown.fill"];
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.309803922 green:0.309803922 blue:0.309803922 alpha:1.0];
  uint64_t v1 = [v3 _flatImageWithColor:v0];
  uint64_t v2 = (void *)ts_handThumbsDownFillForHUD_image;
  ts_handThumbsDownFillForHUD_image = v1;
}

void __34__UIImage_Bridge__ts_handThumbsUp__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hand.thumbsup"];
  uint64_t v1 = (void *)ts_handThumbsUp_image;
  ts_handThumbsUp_image = v0;
}

void __38__UIImage_Bridge__ts_handThumbsUpFill__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hand.thumbsup.fill"];
  uint64_t v1 = (void *)ts_handThumbsUpFill_image;
  ts_handThumbsUpFill_image = v0;
}

void __44__UIImage_Bridge__ts_handThumbsUpFillForHUD__block_invoke()
{
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hand.thumbsup.fill"];
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.309803922 green:0.309803922 blue:0.309803922 alpha:1.0];
  uint64_t v1 = [v3 _flatImageWithColor:v0];
  uint64_t v2 = (void *)ts_handThumbsUpFillForHUD_image;
  ts_handThumbsUpFillForHUD_image = v1;
}

void __33__UIImage_Bridge__ts_heartCircle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"heart.circle"];
  uint64_t v1 = (void *)ts_heartCircle_image;
  ts_heartCircle_image = v0;
}

void __51__UIImage_Bridge__ts_heartCirclePinkOnTertiaryFill__block_invoke()
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v1 = [MEMORY[0x1E4FB1618] systemPinkColor];
  v7[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  v7[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v4 = [v0 configurationWithPaletteColors:v3];

  uint64_t v5 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"heart.circle.fill" withConfiguration:v4];
  v6 = (void *)ts_heartCirclePinkOnTertiaryFill_image;
  ts_heartCirclePinkOnTertiaryFill_image = v5;
}

void __37__UIImage_Bridge__ts_heartCircleFill__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"heart.circle.fill"];
  uint64_t v1 = (void *)ts_heartCircleFill_image;
  ts_heartCircleFill_image = v0;
}

void __51__UIImage_Bridge__ts_heartCircleTertiaryFillOnPink__block_invoke()
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v1 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  v7[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4FB1618] systemPinkColor];
  v7[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v4 = [v0 configurationWithPaletteColors:v3];

  uint64_t v5 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"heart.circle.fill" withConfiguration:v4];
  v6 = (void *)ts_heartCircleTertiaryFillOnPink_image;
  ts_heartCircleTertiaryFillOnPink_image = v5;
}

void __31__UIImage_Bridge__ts_heartFill__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"heart.fill"];
  uint64_t v1 = (void *)ts_heartFill_image;
  ts_heartFill_image = v0;
}

void __40__UIImage_Bridge__ts_iCloudAndArrowDown__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"icloud.and.arrow.down"];
  uint64_t v1 = (void *)ts_iCloudAndArrowDown_image;
  ts_iCloudAndArrowDown_image = v0;
}

void __26__UIImage_Bridge__ts_link__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"link"];
  uint64_t v1 = (void *)ts_link_image;
  ts_link_image = v0;
}

void __33__UIImage_Bridge__ts_minusCircle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"minus.circle"];
  uint64_t v1 = (void *)ts_minusCircle_image;
  ts_minusCircle_image = v0;
}

void __37__UIImage_Bridge__ts_minusCircleFill__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"minus.circle.fill"];
  uint64_t v1 = (void *)ts_minusCircleFill_image;
  ts_minusCircleFill_image = v0;
}

void __42__UIImage_Bridge__ts_minusCircleFillWhite__block_invoke()
{
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"minus.circle.fill"];
  uint64_t v0 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v1 = [v3 imageWithTintColor:v0];
  uint64_t v2 = (void *)ts_minusCircleFillWhite_image;
  ts_minusCircleFillWhite_image = v1;
}

void __51__UIImage_Bridge__ts_minusCircleTertiaryFillOnPink__block_invoke()
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v1 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  v7[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4FB1618] systemPinkColor];
  v7[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v4 = [v0 configurationWithPaletteColors:v3];

  uint64_t v5 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"minus.circle.fill" withConfiguration:v4];
  v6 = (void *)ts_minusCircleTertiaryFillOnPink_image;
  ts_minusCircleTertiaryFillOnPink_image = v5;
}

void __52__UIImage_Bridge__ts_navigationVerticalColumnShadow__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] kitImageNamed:@"UINavigationVerticalColumnShadow.png"];
  uint64_t v1 = (void *)ts_navigationVerticalColumnShadow_navigationVerticalColumnShadow;
  ts_navigationVerticalColumnShadow_navigationVerticalColumnShadow = v0;
}

void __28__UIImage_Bridge__ts_noSign__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"nosign"];
  uint64_t v1 = (void *)ts_noSign_image;
  ts_noSign_image = v0;
}

void __26__UIImage_Bridge__ts_plus__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus"];
  uint64_t v1 = (void *)ts_plus_image;
  ts_plus_image = v0;
}

void __32__UIImage_Bridge__ts_plusCircle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.circle"];
  uint64_t v1 = (void *)ts_plusCircle_image;
  ts_plusCircle_image = v0;
}

void __37__UIImage_Bridge__ts_plusCircleWhite__block_invoke()
{
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.circle"];
  uint64_t v0 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v1 = [v3 imageWithTintColor:v0];
  uint64_t v2 = (void *)ts_plusCircleWhite_image;
  ts_plusCircleWhite_image = v1;
}

void __36__UIImage_Bridge__ts_plusCircleFill__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.circle.fill"];
  uint64_t v1 = (void *)ts_plusCircleFill_image;
  ts_plusCircleFill_image = v0;
}

void __50__UIImage_Bridge__ts_plusCirclePinkOnTertiaryFill__block_invoke()
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  uint64_t v1 = [MEMORY[0x1E4FB1830] configurationWithWeight:5];
  uint64_t v2 = [v0 configurationByApplyingConfiguration:v1];

  id v3 = (void *)MEMORY[0x1E4FB1830];
  id v4 = [MEMORY[0x1E4FB1618] systemPinkColor];
  v11[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4FB1618] systemGray5Color];
  v11[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v7 = [v3 configurationWithPaletteColors:v6];
  v8 = [v2 configurationByApplyingConfiguration:v7];

  uint64_t v9 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"plus.circle.fill" withConfiguration:v8];
  v10 = (void *)ts_plusCirclePinkOnTertiaryFill_image;
  ts_plusCirclePinkOnTertiaryFill_image = v9;
}

void __48__UIImage_Bridge__ts_plusCirclePinkOnOpaqueFill__block_invoke()
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  uint64_t v1 = [MEMORY[0x1E4FB1830] configurationWithWeight:5];
  uint64_t v2 = [v0 configurationByApplyingConfiguration:v1];

  id v3 = (void *)MEMORY[0x1E4FB1830];
  id v4 = [MEMORY[0x1E4FB1618] systemPinkColor];
  v11[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4FB1618] systemGray5Color];
  v11[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v7 = [v3 configurationWithPaletteColors:v6];
  v8 = [v2 configurationByApplyingConfiguration:v7];

  uint64_t v9 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"plus.circle.fill" withConfiguration:v8];
  v10 = (void *)ts_plusCirclePinkOnOpaqueFill_image;
  ts_plusCirclePinkOnOpaqueFill_image = v9;
}

void __46__UIImage_Bridge__ts_plusCirclePinkOnGrayFill__block_invoke()
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  uint64_t v1 = [MEMORY[0x1E4FB1830] configurationWithWeight:5];
  uint64_t v2 = [v0 configurationByApplyingConfiguration:v1];

  id v3 = (void *)MEMORY[0x1E4FB1830];
  id v4 = [MEMORY[0x1E4FB1618] systemPinkColor];
  v11[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4FB1618] systemGray5Color];
  v11[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v7 = [v3 configurationWithPaletteColors:v6];
  v8 = [v2 configurationByApplyingConfiguration:v7];

  uint64_t v9 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"plus.circle.fill" withConfiguration:v8];
  v10 = (void *)ts_plusCirclePinkOnGrayFill_image;
  ts_plusCirclePinkOnGrayFill_image = v9;
}

void __32__UIImage_Bridge__ts_rightArrow__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.right"];
  uint64_t v1 = (void *)ts_rightArrow_image;
  ts_rightArrow_image = v0;
}

void __28__UIImage_Bridge__ts_safari__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"safari"];
  uint64_t v1 = (void *)ts_safari_image;
  ts_safari_image = v0;
}

void __33__UIImage_Bridge__ts_sidebarLeft__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"sidebar.left"];
  uint64_t v1 = (void *)ts_sidebarLeft_image;
  ts_sidebarLeft_image = v0;
}

void __38__UIImage_Bridge__ts_squareAndArrowUp__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
  uint64_t v1 = (void *)ts_squareAndArrowUp_image;
  ts_squareAndArrowUp_image = v0;
}

void __36__UIImage_Bridge__ts_textFormatSize__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"textformat.size"];
  uint64_t v1 = (void *)ts_textFormatSize_image;
  ts_textFormatSize_image = v0;
}

void __27__UIImage_Bridge__ts_trash__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
  uint64_t v1 = (void *)ts_trash_image;
  ts_trash_image = v0;
}

void __27__UIImage_Bridge__ts_xmark__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
  uint64_t v1 = (void *)ts_xmark_image;
  ts_xmark_image = v0;
}

void __33__UIImage_Bridge__ts_xmarkCircle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle"];
  uint64_t v1 = (void *)ts_xmarkCircle_image;
  ts_xmarkCircle_image = v0;
}

void __33__UIImage_Bridge__ts_xmarkForHUD__block_invoke()
{
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.309803922 green:0.309803922 blue:0.309803922 alpha:1.0];
  uint64_t v1 = [v3 _flatImageWithColor:v0];
  uint64_t v2 = (void *)ts_xmarkForHUD_image;
  ts_xmarkForHUD_image = v1;
}

@end