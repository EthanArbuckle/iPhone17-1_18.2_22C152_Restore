@interface SSGeneralResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (BOOL)supportsResult:(id)a3;
- (id)buildDescriptions;
- (id)buildDetailedRowCardSection;
- (id)buildFootnote;
- (id)buildSecondaryTitle;
- (id)buildSecondaryTitleImage;
- (id)buildTitle;
@end

@implementation SSGeneralResultBuilder

+ (BOOL)supportsResult:(id)a3
{
  v4 = [a3 sectionBundleIdentifier];
  v5 = [a1 bundleId];
  char v6 = [v4 isEqual:v5];

  return v6;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (id)buildTitle
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)SSGeneralResultBuilder;
  v3 = [(SSResultBuilder *)&v18 buildTitle];
  if (isMacOS())
  {
    v4 = [(SSResultBuilder *)self result];
    v5 = [v4 valueForAttribute:*MEMORY[0x1E4F22D38] withType:objc_opt_class()];
    [v5 doubleValue];
    double v7 = v6;

    if (v7 != 0.0)
    {
      v8 = (void *)MEMORY[0x1E4F9A0E0];
      v9 = [v3 text];
      v10 = [v8 textWithString:v9];

      [v10 setIsEmphasized:1];
      v11 = (void *)MEMORY[0x1E4F9A0E0];
      v12 = NSString;
      v13 = +[SSDateFormatManager stringFromTimeInterval:v7];
      v14 = [v12 stringWithFormat:@" — %@", v13];
      v15 = [v11 textWithString:v14];

      v19[0] = v10;
      v19[1] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      [v3 setFormattedTextPieces:v16];
    }
  }
  return v3;
}

- (id)buildSecondaryTitle
{
  if (buildSecondaryTitle_onceToken != -1) {
    dispatch_once(&buildSecondaryTitle_onceToken, &__block_literal_global_14);
  }
  v3 = [(SSResultBuilder *)self result];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [v3 contentTypeTree];
  double v6 = [v4 setWithArray:v5];

  double v7 = [v3 valueForAttribute:*MEMORY[0x1E4F22C38] withType:objc_opt_class()];
  if (v7 && [(id)buildSecondaryTitle_utiTypesWithSecondaryTitle intersectsSet:v6])
  {
    v8 = +[SSDateFormatManager dynamicCompactStringFromDate:v7];
    if (v8)
    {
      v9 = [MEMORY[0x1E4F9A0E0] textWithString:v8];
      goto LABEL_9;
    }
  }
  else
  {
    v8 = 0;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

void __45__SSGeneralResultBuilder_buildSecondaryTitle__block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v1 = [(id)*MEMORY[0x1E4F443A8] identifier];
  v6[0] = v1;
  v2 = [(id)*MEMORY[0x1E4F44440] identifier];
  v6[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  uint64_t v4 = [v0 setWithArray:v3];
  v5 = (void *)buildSecondaryTitle_utiTypesWithSecondaryTitle;
  buildSecondaryTitle_utiTypesWithSecondaryTitle = v4;
}

- (id)buildSecondaryTitleImage
{
  return 0;
}

- (id)buildDescriptions
{
  v3 = [(SSResultBuilder *)self result];
  uint64_t v4 = [v3 valueForAttribute:*MEMORY[0x1E4F22AD8] withType:objc_opt_class()];
  v5 = [v3 valueForAttribute:*MEMORY[0x1E4F22A68] withType:objc_opt_class()];
  v43 = [v3 valueForAttribute:*MEMORY[0x1E4F22C38] withType:objc_opt_class()];
  v41 = [v3 valueForAttribute:*MEMORY[0x1E4F23448] withType:objc_opt_class()];
  v40 = [v3 valueForAttribute:*MEMORY[0x1E4F22C28] withType:objc_opt_class()];
  double v6 = [v3 valueForAttribute:*MEMORY[0x1E4F235A0] withType:objc_opt_class()];
  uint64_t v7 = [v3 valueForAttribute:*MEMORY[0x1E4F23188] withType:objc_opt_class()];
  int v8 = isMacOS();
  v9 = (void *)MEMORY[0x1E4F23128];
  if (!v8) {
    v9 = (void *)MEMORY[0x1E4F22FB8];
  }
  v45 = [v3 valueForAttribute:*v9 withType:objc_opt_class()];
  *((void *)&v46 + 1) = [v3 valueForAttribute:*MEMORY[0x1E4F22C00] withType:objc_opt_class()];
  *(void *)&long long v46 = [v3 valueForAttribute:*MEMORY[0x1E4F22D30] withType:objc_opt_class()];
  v44 = [v3 valueForAttribute:*MEMORY[0x1E4F235A8] withType:objc_opt_class()];
  v42 = [v3 valueForAttribute:*MEMORY[0x1E4F22D58] withType:objc_opt_class()];
  v10 = [v3 valueForAttribute:*MEMORY[0x1E4F23078] withType:objc_opt_class()];
  uint64_t v11 = [v10 BOOLValue];

  v12 = (void *)MEMORY[0x1E4F1CA48];
  v47.receiver = self;
  v47.super_class = (Class)SSGeneralResultBuilder;
  v13 = [(SSResultBuilder *)&v47 buildDescriptions];
  v14 = [v12 arrayWithArray:v13];

  if (!v14) {
    v14 = objc_opt_new();
  }
  v15 = (void *)v4;
  if (v4)
  {
    v16 = [MEMORY[0x1E4F9A378] textWithString:v4];
    [v14 addObject:v16];
  }
  v17 = (void *)v7;
  if (v5)
  {
    objc_super v18 = (void *)MEMORY[0x1E4F9A378];
    +[SSMusicResultBuilder stringWithAlbum:v5 releaseDate:v43];
    v19 = v5;
    v21 = v20 = v15;
    v22 = [v18 textWithString:v21];
    [v14 addObject:v22];

    v15 = v20;
    v5 = v19;
    uint64_t v7 = (uint64_t)v17;
  }
  if (v46 != 0)
  {
    v23 = +[SSReminderResultBuilder stringWithCompletionDate:*((void *)&v46 + 1) dueDate:(void)v46 modificationDate:0];
    [MEMORY[0x1E4F9A378] textWithString:v23];
    v24 = v5;
    v26 = v25 = v15;
    [v14 addObject:v26];

    v15 = v25;
    v5 = v24;
    uint64_t v7 = (uint64_t)v17;
  }
  if (v44)
  {
    v27 = +[SSCalendarResultBuilder stringWithStartDate:v44 endDate:v42 isAllDay:v11];
    v28 = [MEMORY[0x1E4F9A378] textWithString:v27];
    [v14 addObject:v28];
  }
  if (v7)
  {
    v29 = (void *)MEMORY[0x1E4F9A378];
    v30 = +[SSFileResultBuilder stringWithPageCount:v7];
    v31 = [v29 textWithString:v30];
    [v14 addObject:v31];
  }
  if (v45)
  {
    v32 = (void *)MEMORY[0x1E4F9A378];
    v33 = +[SSNumberFormatManager stringFromByteCount:](SSNumberFormatManager, "stringFromByteCount:", [v45 longLongValue]);
    v34 = [v32 textWithString:v33];
    [v14 addObject:v34];
  }
  if (v40)
  {
    v35 = [MEMORY[0x1E4F9A378] textWithString:v40];
    [v14 addObject:v35];
  }
  if (v6)
  {
    v36 = [MEMORY[0x1E4F9A378] textWithString:v41];
    [v6 doubleValue];
    objc_msgSend(v36, "setStarRating:");
    [v14 addObject:v36];
  }
  if ([v14 count]) {
    v37 = v14;
  }
  else {
    v37 = 0;
  }
  id v38 = v37;

  return v38;
}

- (id)buildFootnote
{
  if (isMacOS())
  {
    v3 = 0;
    goto LABEL_18;
  }
  uint64_t v4 = [(SSResultBuilder *)self result];
  v5 = [v4 valueForAttribute:*MEMORY[0x1E4F22C38] withType:objc_opt_class()];
  double v6 = [v4 valueForAttribute:*MEMORY[0x1E4F22D38] withType:objc_opt_class()];
  [v6 doubleValue];
  double v8 = v7;

  v9 = [v4 valueForAttribute:*MEMORY[0x1E4F23160] withType:objc_opt_class()];
  v10 = [v4 contentTypeTree];
  uint64_t v11 = [(id)*MEMORY[0x1E4F44358] identifier];
  char v12 = [v10 containsObject:v11];

  v13 = [v4 valueForAttribute:*MEMORY[0x1E4F22A78] withType:objc_opt_class()];
  v14 = [v13 objectAtIndexedSubscript:0];
  objc_opt_class();
  v15 = 0;
  if (objc_opt_isKindOfClass())
  {
    v15 = [v13 objectAtIndexedSubscript:0];
  }

  if (v8 != 0.0)
  {
    uint64_t v16 = +[SSDateFormatManager stringFromTimeInterval:v8];
    goto LABEL_14;
  }
  if (v9) {
    char v17 = v12;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0)
  {
    uint64_t v16 = +[SSNewsResultBuilder newsFootnoteWithNewsSource:v9 publishedDate:v5];
LABEL_14:
    id v18 = (id)v16;
    if (v16) {
      goto LABEL_15;
    }
LABEL_16:
    v3 = 0;
    goto LABEL_17;
  }
  if (!v15) {
    goto LABEL_16;
  }
  id v18 = v15;
LABEL_15:
  v3 = [MEMORY[0x1E4F9A378] textWithString:v18];

LABEL_17:
LABEL_18:
  return v3;
}

- (id)buildDetailedRowCardSection
{
  v6.receiver = self;
  v6.super_class = (Class)SSGeneralResultBuilder;
  v3 = [(SSResultBuilder *)&v6 buildDetailedRowCardSection];
  uint64_t v4 = [(SSGeneralResultBuilder *)self buildSecondaryTitle];
  [v3 setIsSecondaryTitleDetached:v4 != 0];

  return v3;
}

@end