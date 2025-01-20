@interface UIImage
@end

@implementation UIImage

void __38__UIImage_MTAdditions__nowPlayingIcon__block_invoke()
{
  id v3 = [MEMORY[0x1E4FB1818] imageNamed:@"Equalizer"];
  v0 = [v3 imageFlippedForRightToLeftLayoutDirection];
  uint64_t v1 = [v0 imageWithRenderingMode:2];
  v2 = (void *)nowPlayingIcon_templateNowPlayingIcon;
  nowPlayingIcon_templateNowPlayingIcon = v1;
}

void __44__UIImage_MTAdditions__nowPlayingIconPaused__block_invoke()
{
  id v3 = [MEMORY[0x1E4FB1818] imageNamed:@"Equalizer_Paused"];
  v0 = [v3 imageFlippedForRightToLeftLayoutDirection];
  uint64_t v1 = [v0 imageWithRenderingMode:2];
  v2 = (void *)nowPlayingIconPaused_templateNowPlayingIcon;
  nowPlayingIconPaused_templateNowPlayingIcon = v1;
}

uint64_t __54__UIImage_MTAdditions__unplayedIconForDarkBackground___block_invoke()
{
  unplayedIconForDarkBackground__strokedUnplayedIcon = [MEMORY[0x1E4FB1818] imageNamed:@"Unread-Dot-Full-Stroke"];

  return MEMORY[0x1F41817F8]();
}

uint64_t __56__UIImage_MTAdditions__halfPlayedIconForDarkBackground___block_invoke()
{
  halfPlayedIconForDarkBackground__strokedHalfPlayedIcon = [MEMORY[0x1E4FB1818] imageNamed:@"Unread-Dot-Half-Stroke"];

  return MEMORY[0x1F41817F8]();
}

uint64_t __52__UIImage_MTAdditions__backCatalogIconForTintColor___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] imageNamed:@"Unread-Dot-Full"];
  uint64_t v1 = (void *)backCatalogIconForTintColor__untintedIcon;
  backCatalogIconForTintColor__untintedIcon = v0;

  backCatalogIconForTintColor__tintedIcons = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

uint64_t __67__UIImage_MTAdditions__backCatalogPartiallyPlayedIconForTintColor___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1818] imageNamed:@"Unread-Dot-Half"];
  uint64_t v1 = (void *)backCatalogPartiallyPlayedIconForTintColor__untintedIcon;
  backCatalogPartiallyPlayedIconForTintColor__untintedIcon = v0;

  backCatalogPartiallyPlayedIconForTintColor__tintedIcons = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

void __38__UIImage_MTAdditions__multiCheckIcon__block_invoke()
{
  id v2 = [MEMORY[0x1E4FB1818] imageNamed:@"SelectControlMultiCheckedImage"];
  uint64_t v0 = [v2 imageWithRenderingMode:2];
  uint64_t v1 = (void *)multiCheckIcon_templateMultiCheckIcon;
  multiCheckIcon_templateMultiCheckIcon = v0;
}

void __40__UIImage_MTAdditions__multiUncheckIcon__block_invoke()
{
  id v2 = [MEMORY[0x1E4FB1818] imageNamed:@"SelectControlMultiNotCheckedImage"];
  uint64_t v0 = [v2 imageWithRenderingMode:2];
  uint64_t v1 = (void *)multiUncheckIcon_templateMultiUncheckIcon;
  multiUncheckIcon_templateMultiUncheckIcon = v0;
}

void __32__UIImage_MTAdditions__infoIcon__block_invoke()
{
  id v2 = [MEMORY[0x1E4FB1818] imageNamed:@"UITableInfo"];
  uint64_t v0 = [v2 imageWithRenderingMode:2];
  uint64_t v1 = (void *)infoIcon_templateInfoIcon;
  infoIcon_templateInfoIcon = v0;
}

@end