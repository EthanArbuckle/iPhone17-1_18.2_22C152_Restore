@interface NTKGreenfieldPlaceholderTimelineEntryModel
+ (id)entryModelWithAppIcon:(id)a3 appName:(id)a4 installationProgress:(float)a5;
+ (id)entryModelWithNullState;
+ (id)placeholderImageForFamily:(int64_t)a3;
- (id)_circularSmallTemplateForInstallation;
- (id)_downloadTextWithIsUpperCased:(BOOL)a3;
- (id)_extraLargeTemplateForInstallation;
- (id)_graphicBezelTemplateForInstallation;
- (id)_graphicCircularTemplateForInstallation;
- (id)_graphicCornerTemplateForInstallation;
- (id)_graphicExtraLargeTemplateForInstallation;
- (id)_graphicRectangularTemplateForInstallation;
- (id)_installationTemplateForComplicationFamily:(int64_t)a3;
- (id)_modularLargeTemplateForInstallation;
- (id)_modularSmallTemplateForInstallation;
- (id)_placeholderFullColorImageProvider;
- (id)_placeholderImageProvider;
- (id)_utilitarianLargeTemplateForInstallation;
- (id)_utilitarianSmallFlatTemplateForInstallation;
- (id)templateForComplicationFamily:(int64_t)a3;
@end

@implementation NTKGreenfieldPlaceholderTimelineEntryModel

+ (id)entryModelWithNullState
{
  v2 = objc_alloc_init(NTKGreenfieldPlaceholderTimelineEntryModel);
  v2->_modelState = 0;
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [(NTKTimelineEntryModel *)v2 setEntryDate:v3];

  return v2;
}

+ (id)entryModelWithAppIcon:(id)a3 appName:(id)a4 installationProgress:(float)a5
{
  v7 = (UIImage *)a3;
  id v8 = a4;
  v9 = objc_alloc_init(NTKGreenfieldPlaceholderTimelineEntryModel);
  v9->_modelState = 1;
  appIcon = v9->_appIcon;
  v9->_appIcon = v7;
  v11 = v7;

  uint64_t v12 = [v8 copy];
  appName = v9->_appName;
  v9->_appName = (NSString *)v12;

  double v14 = fmin(a5, 1.0);
  if (v14 < 0.0) {
    double v14 = 0.0;
  }
  v9->_installationProgress = v14;
  v15 = [MEMORY[0x1E4F1C9C8] date];

  [(NTKTimelineEntryModel *)v9 setEntryDate:v15];

  return v9;
}

+ (id)placeholderImageForFamily:(int64_t)a3
{
  if (unint64_t)a3 <= 0xC && ((0x1791u >> a3)) {
    NTKImageNamed(off_1E62C01D8[a3]);
  }
  return 0;
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  if (self->_modelState == 1)
  {
    uint64_t v3 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _installationTemplateForComplicationFamily:a3];
  }
  else
  {
    uint64_t v3 = 0;
  }
  [v3 finalize];

  return v3;
}

- (id)_installationTemplateForComplicationFamily:(int64_t)a3
{
  v4 = 0;
  switch(a3)
  {
    case 0:
      v4 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _modularSmallTemplateForInstallation];
      break;
    case 1:
      v4 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _modularLargeTemplateForInstallation];
      break;
    case 2:
    case 6:
      v4 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _utilitarianSmallFlatTemplateForInstallation];
      break;
    case 3:
      v4 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _utilitarianLargeTemplateForInstallation];
      break;
    case 4:
      v4 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _circularSmallTemplateForInstallation];
      break;
    case 7:
      v4 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _extraLargeTemplateForInstallation];
      break;
    case 8:
      v4 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _graphicCornerTemplateForInstallation];
      break;
    case 9:
      v4 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _graphicBezelTemplateForInstallation];
      break;
    case 10:
      v4 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _graphicCircularTemplateForInstallation];
      break;
    case 11:
      v4 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _graphicRectangularTemplateForInstallation];
      break;
    case 12:
      v4 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _graphicExtraLargeTemplateForInstallation];
      break;
    default:
      break;
  }

  return v4;
}

- (id)_graphicRectangularTemplateForInstallation
{
  uint64_t v3 = [MEMORY[0x1E4F19AB0] textProviderWithText:self->_appName];
  v4 = (void *)MEMORY[0x1E4F19AB0];
  v5 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _downloadTextWithIsUpperCased:0];
  v6 = [v4 textProviderWithText:v5];

  v7 = [MEMORY[0x1E4F19948] templateWithHeaderTextProvider:v3 body1TextProvider:v6];

  return v7;
}

- (id)_utilitarianSmallFlatTemplateForInstallation
{
  v2 = [MEMORY[0x1E4F19AB0] textProviderWithText:self->_appName];
  uint64_t v3 = [MEMORY[0x1E4F199E8] templateWithTextProvider:v2];

  return v3;
}

- (id)_utilitarianLargeTemplateForInstallation
{
  v2 = (void *)MEMORY[0x1E4F19AB0];
  uint64_t v3 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _downloadTextWithIsUpperCased:1];
  v4 = [v2 textProviderWithText:v3];

  v5 = [MEMORY[0x1E4F199E0] templateWithTextProvider:v4];

  return v5;
}

- (id)_graphicCircularTemplateForInstallation
{
  v2 = (void *)MEMORY[0x1E4F197E0];
  uint64_t v3 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _placeholderFullColorImageProvider];
  v4 = [v2 templateWithImageProvider:v3];

  return v4;
}

- (id)_modularSmallTemplateForInstallation
{
  v2 = (void *)MEMORY[0x1E4F199B8];
  uint64_t v3 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _placeholderImageProvider];
  v4 = [v2 templateWithImageProvider:v3];

  return v4;
}

- (id)_modularLargeTemplateForInstallation
{
  uint64_t v3 = [MEMORY[0x1E4F19AB0] textProviderWithText:self->_appName];
  v4 = (void *)MEMORY[0x1E4F19AB0];
  v5 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _downloadTextWithIsUpperCased:0];
  v6 = [v4 textProviderWithText:v5];

  v7 = [MEMORY[0x1E4F19978] templateWithHeaderTextProvider:v3 body1TextProvider:v6];

  return v7;
}

- (id)_circularSmallTemplateForInstallation
{
  v2 = (void *)MEMORY[0x1E4F19720];
  uint64_t v3 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _placeholderImageProvider];
  v4 = [v2 templateWithImageProvider:v3];

  return v4;
}

- (id)_graphicCornerTemplateForInstallation
{
  uint64_t v3 = (void *)MEMORY[0x1E4F19AB0];
  v4 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _downloadTextWithIsUpperCased:1];
  v5 = [v3 textProviderWithText:v4];

  v6 = (void *)MEMORY[0x1E4F19888];
  v7 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _placeholderFullColorImageProvider];
  id v8 = [v6 templateWithTextProvider:v5 imageProvider:v7];

  return v8;
}

- (id)_graphicBezelTemplateForInstallation
{
  uint64_t v3 = (void *)MEMORY[0x1E4F19AB0];
  v4 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _downloadTextWithIsUpperCased:1];
  v5 = [v3 textProviderWithText:v4];

  v6 = (void *)MEMORY[0x1E4F197B8];
  v7 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _graphicCircularTemplateForInstallation];
  id v8 = [v6 templateWithCircularTemplate:v7 textProvider:v5];

  return v8;
}

- (id)_extraLargeTemplateForInstallation
{
  v2 = (void *)MEMORY[0x1E4F19798];
  uint64_t v3 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _placeholderImageProvider];
  v4 = [v2 templateWithImageProvider:v3];

  return v4;
}

- (id)_graphicExtraLargeTemplateForInstallation
{
  v2 = (void *)MEMORY[0x1E4F198B0];
  uint64_t v3 = [(NTKGreenfieldPlaceholderTimelineEntryModel *)self _placeholderFullColorImageProvider];
  v4 = [v2 templateWithImageProvider:v3];

  return v4;
}

- (id)_downloadTextWithIsUpperCased:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = NTKClockFaceLocalizedString(@"COMPLICATION_DOWNLOADING_TEXT", @"Downloading...");
  if (v3)
  {
    v5 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v6 = [v4 uppercaseStringWithLocale:v5];

    v4 = (void *)v6;
  }

  return v4;
}

- (id)_placeholderFullColorImageProvider
{
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  v4 = [NSNumber numberWithDouble:self->_installationProgress];
  [v3 setObject:v4 forKeyedSubscript:@"NTKGreenfieldPlaceholderTimelineEntryModelProgressKey"];

  appIcon = self->_appIcon;
  if (appIcon)
  {
    [v3 setObject:appIcon forKeyedSubscript:@"NTKGreenfieldPlaceholderTimelineEntryModelIconKey"];
  }
  else
  {
    uint64_t v6 = [(id)objc_opt_class() placeholderImageForFamily:10];
    [v3 setObject:v6 forKeyedSubscript:@"NTKGreenfieldPlaceholderTimelineEntryModelIconKey"];
  }
  v7 = [MEMORY[0x1E4F19A58] fullColorImageProviderWithImageViewClass:objc_opt_class()];
  id v8 = (void *)[v3 copy];
  [v7 setMetadata:v8];

  return v7;
}

- (id)_placeholderImageProvider
{
  BOOL v3 = +[NTKGreenfieldPlaceholderImageProvider provider];
  [v3 setAppIcon:self->_appIcon];
  [v3 setProgress:self->_installationProgress];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);

  objc_storeStrong((id *)&self->_appIcon, 0);
}

@end