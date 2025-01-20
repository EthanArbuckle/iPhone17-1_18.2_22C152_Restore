@interface NTPBTodayResultOperationInfo
- (BOOL)allowOnlyWatchEligibleSections;
- (BOOL)allowSectionTitles;
- (BOOL)fetchWidgetConfig;
- (BOOL)hasAllowOnlyWatchEligibleSections;
- (BOOL)hasAllowSectionTitles;
- (BOOL)hasAssetsDirectoryFileURLString;
- (BOOL)hasBannerSlotCost;
- (BOOL)hasDynamicThumbnailSizePresetMinimumHeightInPixels;
- (BOOL)hasDynamicThumbnailSizePresetMinimumWidthInPixels;
- (BOOL)hasEmbedsLimit;
- (BOOL)hasFetchWidgetConfig;
- (BOOL)hasKeyboardInputMode;
- (BOOL)hasLeadingCellThumbnailSizePreset;
- (BOOL)hasMaxHeadlineScale;
- (BOOL)hasMinHeadlineScale;
- (BOOL)hasPreferCompactSectionName;
- (BOOL)hasPreferCompactSourceName;
- (BOOL)hasQualityOfService;
- (BOOL)hasRequest;
- (BOOL)hasRespectsWidgetSlotsLimit;
- (BOOL)hasRespectsWidgetVisibleSectionsPerQueueLimit;
- (BOOL)hasScale;
- (BOOL)hasSectionSlotCostInfo;
- (BOOL)hasSlotsLimit;
- (BOOL)hasSourceNameImageSizePreset;
- (BOOL)hasThumbnailSizePreset;
- (BOOL)hasWidgetSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)preferCompactSectionName;
- (BOOL)preferCompactSourceName;
- (BOOL)readFrom:(id)a3;
- (BOOL)respectsWidgetSlotsLimit;
- (BOOL)respectsWidgetVisibleSectionsPerQueueLimit;
- (NSString)assetsDirectoryFileURLString;
- (NSString)keyboardInputMode;
- (NTPBSectionSlotCostInfo)sectionSlotCostInfo;
- (NTPBTodayModuleContentRequest)request;
- (double)bannerSlotCost;
- (double)maxHeadlineScale;
- (double)minHeadlineScale;
- (double)scale;
- (double)slotsLimit;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)widgetSize;
- (int64_t)embedsLimit;
- (int64_t)leadingCellThumbnailSizePreset;
- (int64_t)qualityOfService;
- (int64_t)sourceNameImageSizePreset;
- (int64_t)thumbnailSizePreset;
- (unint64_t)hash;
- (unsigned)dynamicThumbnailSizePresetMinimumHeightInPixels;
- (unsigned)dynamicThumbnailSizePresetMinimumWidthInPixels;
- (void)mergeFrom:(id)a3;
- (void)setAllowOnlyWatchEligibleSections:(BOOL)a3;
- (void)setAllowSectionTitles:(BOOL)a3;
- (void)setAssetsDirectoryFileURLString:(id)a3;
- (void)setBannerSlotCost:(double)a3;
- (void)setDynamicThumbnailSizePresetMinimumHeightInPixels:(unsigned int)a3;
- (void)setDynamicThumbnailSizePresetMinimumWidthInPixels:(unsigned int)a3;
- (void)setEmbedsLimit:(int64_t)a3;
- (void)setFetchWidgetConfig:(BOOL)a3;
- (void)setHasAllowOnlyWatchEligibleSections:(BOOL)a3;
- (void)setHasAllowSectionTitles:(BOOL)a3;
- (void)setHasBannerSlotCost:(BOOL)a3;
- (void)setHasDynamicThumbnailSizePresetMinimumHeightInPixels:(BOOL)a3;
- (void)setHasDynamicThumbnailSizePresetMinimumWidthInPixels:(BOOL)a3;
- (void)setHasEmbedsLimit:(BOOL)a3;
- (void)setHasFetchWidgetConfig:(BOOL)a3;
- (void)setHasLeadingCellThumbnailSizePreset:(BOOL)a3;
- (void)setHasMaxHeadlineScale:(BOOL)a3;
- (void)setHasMinHeadlineScale:(BOOL)a3;
- (void)setHasPreferCompactSectionName:(BOOL)a3;
- (void)setHasPreferCompactSourceName:(BOOL)a3;
- (void)setHasQualityOfService:(BOOL)a3;
- (void)setHasRespectsWidgetSlotsLimit:(BOOL)a3;
- (void)setHasRespectsWidgetVisibleSectionsPerQueueLimit:(BOOL)a3;
- (void)setHasScale:(BOOL)a3;
- (void)setHasSlotsLimit:(BOOL)a3;
- (void)setHasSourceNameImageSizePreset:(BOOL)a3;
- (void)setHasThumbnailSizePreset:(BOOL)a3;
- (void)setHasWidgetSize:(BOOL)a3;
- (void)setKeyboardInputMode:(id)a3;
- (void)setLeadingCellThumbnailSizePreset:(int64_t)a3;
- (void)setMaxHeadlineScale:(double)a3;
- (void)setMinHeadlineScale:(double)a3;
- (void)setPreferCompactSectionName:(BOOL)a3;
- (void)setPreferCompactSourceName:(BOOL)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRequest:(id)a3;
- (void)setRespectsWidgetSlotsLimit:(BOOL)a3;
- (void)setRespectsWidgetVisibleSectionsPerQueueLimit:(BOOL)a3;
- (void)setScale:(double)a3;
- (void)setSectionSlotCostInfo:(id)a3;
- (void)setSlotsLimit:(double)a3;
- (void)setSourceNameImageSizePreset:(int64_t)a3;
- (void)setThumbnailSizePreset:(int64_t)a3;
- (void)setWidgetSize:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodayResultOperationInfo

- (void)setSlotsLimit:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_slotsLimit = a3;
}

- (void)setHasSlotsLimit:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasSlotsLimit
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setRespectsWidgetSlotsLimit:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_respectsWidgetSlotsLimit = a3;
}

- (void)setHasRespectsWidgetSlotsLimit:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasRespectsWidgetSlotsLimit
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setPreferCompactSectionName:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_preferCompactSectionName = a3;
}

- (void)setHasPreferCompactSectionName:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasPreferCompactSectionName
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setPreferCompactSourceName:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_preferCompactSourceName = a3;
}

- (void)setHasPreferCompactSourceName:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasPreferCompactSourceName
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setThumbnailSizePreset:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_thumbnailSizePreset = a3;
}

- (void)setHasThumbnailSizePreset:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasThumbnailSizePreset
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setSourceNameImageSizePreset:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_sourceNameImageSizePreset = a3;
}

- (void)setHasSourceNameImageSizePreset:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasSourceNameImageSizePreset
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setQualityOfService:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_qualityOfService = a3;
}

- (void)setHasQualityOfService:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasQualityOfService
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasSectionSlotCostInfo
{
  return self->_sectionSlotCostInfo != 0;
}

- (void)setFetchWidgetConfig:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_fetchWidgetConfig = a3;
}

- (void)setHasFetchWidgetConfig:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasFetchWidgetConfig
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setAllowOnlyWatchEligibleSections:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_allowOnlyWatchEligibleSections = a3;
}

- (void)setHasAllowOnlyWatchEligibleSections:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAllowOnlyWatchEligibleSections
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRespectsWidgetVisibleSectionsPerQueueLimit:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_respectsWidgetVisibleSectionsPerQueueLimit = a3;
}

- (void)setHasRespectsWidgetVisibleSectionsPerQueueLimit:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasRespectsWidgetVisibleSectionsPerQueueLimit
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasAssetsDirectoryFileURLString
{
  return self->_assetsDirectoryFileURLString != 0;
}

- (void)setLeadingCellThumbnailSizePreset:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_leadingCellThumbnailSizePreset = a3;
}

- (void)setHasLeadingCellThumbnailSizePreset:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasLeadingCellThumbnailSizePreset
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDynamicThumbnailSizePresetMinimumWidthInPixels:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_dynamicThumbnailSizePresetMinimumWidthInPixels = a3;
}

- (void)setHasDynamicThumbnailSizePresetMinimumWidthInPixels:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasDynamicThumbnailSizePresetMinimumWidthInPixels
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setDynamicThumbnailSizePresetMinimumHeightInPixels:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_dynamicThumbnailSizePresetMinimumHeightInPixels = a3;
}

- (void)setHasDynamicThumbnailSizePresetMinimumHeightInPixels:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasDynamicThumbnailSizePresetMinimumHeightInPixels
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAllowSectionTitles:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_allowSectionTitles = a3;
}

- (void)setHasAllowSectionTitles:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasAllowSectionTitles
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setEmbedsLimit:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_embedsLimit = a3;
}

- (void)setHasEmbedsLimit:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasEmbedsLimit
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setScale:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_scale = a3;
}

- (void)setHasScale:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasScale
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasKeyboardInputMode
{
  return self->_keyboardInputMode != 0;
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (void)setMinHeadlineScale:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_minHeadlineScale = a3;
}

- (void)setHasMinHeadlineScale:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasMinHeadlineScale
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMaxHeadlineScale:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_maxHeadlineScale = a3;
}

- (void)setHasMaxHeadlineScale:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasMaxHeadlineScale
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)widgetSize
{
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    return self->_widgetSize;
  }
  else {
    return 0;
  }
}

- (void)setWidgetSize:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_widgetSize = a3;
}

- (void)setHasWidgetSize:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasWidgetSize
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setBannerSlotCost:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_bannerSlotCost = a3;
}

- (void)setHasBannerSlotCost:(BOOL)a3
{
  self->_has = ($167E2C57B64171B916FF28E31FCA8750)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBannerSlotCost
{
  return *(_DWORD *)&self->_has & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTodayResultOperationInfo;
  v4 = [(NTPBTodayResultOperationInfo *)&v8 description];
  v5 = [(NTPBTodayResultOperationInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x263EFF9A0] dictionary];
  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    v19 = [NSNumber numberWithDouble:self->_slotsLimit];
    [v3 setObject:v19 forKey:@"slots_limit"];

    $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
    if ((*(_DWORD *)&has & 0x40000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_38;
    }
  }
  else if ((*(_DWORD *)&has & 0x40000) == 0)
  {
    goto LABEL_3;
  }
  v20 = [NSNumber numberWithBool:self->_respectsWidgetSlotsLimit];
  [v3 setObject:v20 forKey:@"respects_widget_slots_limit"];

  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_38:
  v21 = [NSNumber numberWithBool:self->_preferCompactSectionName];
  [v3 setObject:v21 forKey:@"prefer_compact_section_name"];

  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_39:
  v22 = [NSNumber numberWithBool:self->_preferCompactSourceName];
  [v3 setObject:v22 forKey:@"prefer_compact_source_name"];

  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_40:
  v23 = [NSNumber numberWithLongLong:self->_thumbnailSizePreset];
  [v3 setObject:v23 forKey:@"thumbnail_size_preset"];

  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_41:
  v24 = [NSNumber numberWithLongLong:self->_sourceNameImageSizePreset];
  [v3 setObject:v24 forKey:@"source_name_image_size_preset"];

  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    v5 = [NSNumber numberWithLongLong:self->_qualityOfService];
    [v3 setObject:v5 forKey:@"quality_of_service"];
  }
LABEL_9:
  sectionSlotCostInfo = self->_sectionSlotCostInfo;
  if (sectionSlotCostInfo)
  {
    v7 = [(NTPBSectionSlotCostInfo *)sectionSlotCostInfo dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"section_slot_cost_info"];
  }
  $167E2C57B64171B916FF28E31FCA8750 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) != 0)
  {
    v25 = [NSNumber numberWithBool:self->_fetchWidgetConfig];
    [v3 setObject:v25 forKey:@"fetch_widget_config"];

    $167E2C57B64171B916FF28E31FCA8750 v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x2000) == 0)
    {
LABEL_13:
      if ((*(_DWORD *)&v8 & 0x80000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
    goto LABEL_13;
  }
  v26 = [NSNumber numberWithBool:self->_allowOnlyWatchEligibleSections];
  [v3 setObject:v26 forKey:@"allow_only_watch_eligible_sections"];

  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_14:
    v9 = [NSNumber numberWithBool:self->_respectsWidgetVisibleSectionsPerQueueLimit];
    [v3 setObject:v9 forKey:@"respects_widget_visible_sections_per_queue_limit"];
  }
LABEL_15:
  assetsDirectoryFileURLString = self->_assetsDirectoryFileURLString;
  if (assetsDirectoryFileURLString) {
    [v3 setObject:assetsDirectoryFileURLString forKey:@"assets_directory_file_URL_string"];
  }
  $167E2C57B64171B916FF28E31FCA8750 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 4) != 0)
  {
    v27 = [NSNumber numberWithLongLong:self->_leadingCellThumbnailSizePreset];
    [v3 setObject:v27 forKey:@"leading_cell_thumbnail_size_preset"];

    $167E2C57B64171B916FF28E31FCA8750 v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x800) == 0)
    {
LABEL_19:
      if ((*(_WORD *)&v11 & 0x400) == 0) {
        goto LABEL_20;
      }
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&v11 & 0x800) == 0)
  {
    goto LABEL_19;
  }
  v28 = [NSNumber numberWithUnsignedInt:self->_dynamicThumbnailSizePresetMinimumWidthInPixels];
  [v3 setObject:v28 forKey:@"dynamic_thumbnail_size_preset_minimum_width_in_pixels"];

  $167E2C57B64171B916FF28E31FCA8750 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x400) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v11 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_49;
  }
LABEL_48:
  v29 = [NSNumber numberWithUnsignedInt:self->_dynamicThumbnailSizePresetMinimumHeightInPixels];
  [v3 setObject:v29 forKey:@"dynamic_thumbnail_size_preset_minimum_height_in_pixels"];

  $167E2C57B64171B916FF28E31FCA8750 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v11 & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_50;
  }
LABEL_49:
  v30 = [NSNumber numberWithBool:self->_allowSectionTitles];
  [v3 setObject:v30 forKey:@"allow_section_titles"];

  $167E2C57B64171B916FF28E31FCA8750 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 2) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v11 & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_50:
  v31 = [NSNumber numberWithLongLong:self->_embedsLimit];
  [v3 setObject:v31 forKey:@"embeds_limit"];

  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_23:
    v12 = [NSNumber numberWithDouble:self->_scale];
    [v3 setObject:v12 forKey:@"scale"];
  }
LABEL_24:
  keyboardInputMode = self->_keyboardInputMode;
  if (keyboardInputMode) {
    [v3 setObject:keyboardInputMode forKey:@"keyboard_input_mode"];
  }
  request = self->_request;
  if (request)
  {
    v15 = [(NTPBTodayModuleContentRequest *)request dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"request"];
  }
  $167E2C57B64171B916FF28E31FCA8750 v16 = self->_has;
  if ((*(unsigned char *)&v16 & 0x10) != 0)
  {
    v32 = [NSNumber numberWithDouble:self->_minHeadlineScale];
    [v3 setObject:v32 forKey:@"min_headline_scale"];

    $167E2C57B64171B916FF28E31FCA8750 v16 = self->_has;
    if ((*(unsigned char *)&v16 & 8) == 0)
    {
LABEL_30:
      if ((*(_WORD *)&v16 & 0x1000) == 0) {
        goto LABEL_31;
      }
      goto LABEL_54;
    }
  }
  else if ((*(unsigned char *)&v16 & 8) == 0)
  {
    goto LABEL_30;
  }
  v33 = [NSNumber numberWithDouble:self->_maxHeadlineScale];
  [v3 setObject:v33 forKey:@"max_headline_scale"];

  $167E2C57B64171B916FF28E31FCA8750 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x1000) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v16 & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_54:
  v34 = [NSNumber numberWithInt:self->_widgetSize];
  [v3 setObject:v34 forKey:@"widget_size"];

  if (*(_DWORD *)&self->_has)
  {
LABEL_32:
    v17 = [NSNumber numberWithDouble:self->_bannerSlotCost];
    [v3 setObject:v17 forKey:@"banner_slot_cost"];
  }
LABEL_33:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayResultOperationInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    PBDataWriterWriteDoubleField();
    $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
    if ((*(_DWORD *)&has & 0x40000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_38;
    }
  }
  else if ((*(_DWORD *)&has & 0x40000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteBOOLField();
  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteBOOLField();
  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt64Field();
  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_41:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x20) != 0) {
LABEL_8:
  }
    PBDataWriterWriteInt64Field();
LABEL_9:
  if (self->_sectionSlotCostInfo) {
    PBDataWriterWriteSubmessage();
  }
  $167E2C57B64171B916FF28E31FCA8750 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x8000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $167E2C57B64171B916FF28E31FCA8750 v5 = self->_has;
    if ((*(_WORD *)&v5 & 0x2000) == 0)
    {
LABEL_13:
      if ((*(_DWORD *)&v5 & 0x80000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x80000) != 0) {
LABEL_14:
  }
    PBDataWriterWriteBOOLField();
LABEL_15:
  if (self->_assetsDirectoryFileURLString) {
    PBDataWriterWriteStringField();
  }
  $167E2C57B64171B916FF28E31FCA8750 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    $167E2C57B64171B916FF28E31FCA8750 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x800) == 0)
    {
LABEL_19:
      if ((*(_WORD *)&v6 & 0x400) == 0) {
        goto LABEL_20;
      }
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&v6 & 0x800) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteUint32Field();
  $167E2C57B64171B916FF28E31FCA8750 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  $167E2C57B64171B916FF28E31FCA8750 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v6 & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteBOOLField();
  $167E2C57B64171B916FF28E31FCA8750 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v6 & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_50:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x40) != 0) {
LABEL_23:
  }
    PBDataWriterWriteDoubleField();
LABEL_24:
  if (self->_keyboardInputMode) {
    PBDataWriterWriteStringField();
  }
  if (self->_request) {
    PBDataWriterWriteSubmessage();
  }
  $167E2C57B64171B916FF28E31FCA8750 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    $167E2C57B64171B916FF28E31FCA8750 v7 = self->_has;
    if ((*(unsigned char *)&v7 & 8) == 0)
    {
LABEL_30:
      if ((*(_WORD *)&v7 & 0x1000) == 0) {
        goto LABEL_31;
      }
      goto LABEL_54;
    }
  }
  else if ((*(unsigned char *)&v7 & 8) == 0)
  {
    goto LABEL_30;
  }
  PBDataWriterWriteDoubleField();
  $167E2C57B64171B916FF28E31FCA8750 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v7 & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  if (*(_DWORD *)&self->_has) {
LABEL_32:
  }
    PBDataWriterWriteDoubleField();
LABEL_33:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    *(double *)(v5 + 64) = self->_slotsLimit;
    *(_DWORD *)(v5 + 140) |= 0x80u;
    $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
    if ((*(_DWORD *)&has & 0x40000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_DWORD *)&has & 0x40000) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 137) = self->_respectsWidgetSlotsLimit;
  *(_DWORD *)(v5 + 140) |= 0x40000u;
  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(unsigned char *)(v5 + 135) = self->_preferCompactSectionName;
  *(_DWORD *)(v5 + 140) |= 0x10000u;
  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(unsigned char *)(v5 + 136) = self->_preferCompactSourceName;
  *(_DWORD *)(v5 + 140) |= 0x20000u;
  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(void *)(v5 + 80) = self->_thumbnailSizePreset;
  *(_DWORD *)(v5 + 140) |= 0x200u;
  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_31:
  *(void *)(v5 + 72) = self->_sourceNameImageSizePreset;
  *(_DWORD *)(v5 + 140) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    *(void *)(v5 + 48) = self->_qualityOfService;
    *(_DWORD *)(v5 + 140) |= 0x20u;
  }
LABEL_9:
  id v8 = [(NTPBSectionSlotCostInfo *)self->_sectionSlotCostInfo copyWithZone:a3];
  v9 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v8;

  $167E2C57B64171B916FF28E31FCA8750 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    *(unsigned char *)(v6 + 134) = self->_fetchWidgetConfig;
    *(_DWORD *)(v6 + 140) |= 0x8000u;
    $167E2C57B64171B916FF28E31FCA8750 v10 = self->_has;
    if ((*(_WORD *)&v10 & 0x2000) == 0)
    {
LABEL_11:
      if ((*(_DWORD *)&v10 & 0x80000) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(_WORD *)&v10 & 0x2000) == 0)
  {
    goto LABEL_11;
  }
  *(unsigned char *)(v6 + 132) = self->_allowOnlyWatchEligibleSections;
  *(_DWORD *)(v6 + 140) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_12:
    *(unsigned char *)(v6 + 138) = self->_respectsWidgetVisibleSectionsPerQueueLimit;
    *(_DWORD *)(v6 + 140) |= 0x80000u;
  }
LABEL_13:
  uint64_t v11 = [(NSString *)self->_assetsDirectoryFileURLString copyWithZone:a3];
  v12 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v11;

  $167E2C57B64171B916FF28E31FCA8750 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 4) != 0)
  {
    *(void *)(v6 + 24) = self->_leadingCellThumbnailSizePreset;
    *(_DWORD *)(v6 + 140) |= 4u;
    $167E2C57B64171B916FF28E31FCA8750 v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x800) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&v13 & 0x400) == 0) {
        goto LABEL_16;
      }
      goto LABEL_38;
    }
  }
  else if ((*(_WORD *)&v13 & 0x800) == 0)
  {
    goto LABEL_15;
  }
  *(_DWORD *)(v6 + 100) = self->_dynamicThumbnailSizePresetMinimumWidthInPixels;
  *(_DWORD *)(v6 + 140) |= 0x800u;
  $167E2C57B64171B916FF28E31FCA8750 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v13 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v6 + 96) = self->_dynamicThumbnailSizePresetMinimumHeightInPixels;
  *(_DWORD *)(v6 + 140) |= 0x400u;
  $167E2C57B64171B916FF28E31FCA8750 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v13 & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(unsigned char *)(v6 + 133) = self->_allowSectionTitles;
  *(_DWORD *)(v6 + 140) |= 0x4000u;
  $167E2C57B64171B916FF28E31FCA8750 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 2) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v13 & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_40:
  *(void *)(v6 + 16) = self->_embedsLimit;
  *(_DWORD *)(v6 + 140) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_19:
    *(double *)(v6 + 56) = self->_scale;
    *(_DWORD *)(v6 + 140) |= 0x40u;
  }
LABEL_20:
  uint64_t v14 = [(NSString *)self->_keyboardInputMode copyWithZone:a3];
  v15 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v14;

  id v16 = [(NTPBTodayModuleContentRequest *)self->_request copyWithZone:a3];
  v17 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v16;

  $167E2C57B64171B916FF28E31FCA8750 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 0x10) != 0)
  {
    *(double *)(v6 + 40) = self->_minHeadlineScale;
    *(_DWORD *)(v6 + 140) |= 0x10u;
    $167E2C57B64171B916FF28E31FCA8750 v18 = self->_has;
    if ((*(unsigned char *)&v18 & 8) == 0)
    {
LABEL_22:
      if ((*(_WORD *)&v18 & 0x1000) == 0) {
        goto LABEL_23;
      }
LABEL_44:
      *(_DWORD *)(v6 + 128) = self->_widgetSize;
      *(_DWORD *)(v6 + 140) |= 0x1000u;
      if ((*(_DWORD *)&self->_has & 1) == 0) {
        return (id)v6;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&v18 & 8) == 0)
  {
    goto LABEL_22;
  }
  *(double *)(v6 + 32) = self->_maxHeadlineScale;
  *(_DWORD *)(v6 + 140) |= 8u;
  $167E2C57B64171B916FF28E31FCA8750 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x1000) != 0) {
    goto LABEL_44;
  }
LABEL_23:
  if (*(unsigned char *)&v18)
  {
LABEL_24:
    *(double *)(v6 + 8) = self->_bannerSlotCost;
    *(_DWORD *)(v6 + 140) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_133;
  }
  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  int v6 = *((_DWORD *)v4 + 35);
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_slotsLimit != *((double *)v4 + 8)) {
      goto LABEL_133;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0) {
      goto LABEL_133;
    }
    if (self->_respectsWidgetSlotsLimit)
    {
      if (!*((unsigned char *)v4 + 137)) {
        goto LABEL_133;
      }
    }
    else if (*((unsigned char *)v4 + 137))
    {
      goto LABEL_133;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0) {
      goto LABEL_133;
    }
    if (self->_preferCompactSectionName)
    {
      if (!*((unsigned char *)v4 + 135)) {
        goto LABEL_133;
      }
    }
    else if (*((unsigned char *)v4 + 135))
    {
      goto LABEL_133;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0) {
      goto LABEL_133;
    }
    if (self->_preferCompactSourceName)
    {
      if (!*((unsigned char *)v4 + 136)) {
        goto LABEL_133;
      }
    }
    else if (*((unsigned char *)v4 + 136))
    {
      goto LABEL_133;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_thumbnailSizePreset != *((void *)v4 + 10)) {
      goto LABEL_133;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_sourceNameImageSizePreset != *((void *)v4 + 9)) {
      goto LABEL_133;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_133;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_qualityOfService != *((void *)v4 + 6)) {
      goto LABEL_133;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_133;
  }
  sectionSlotCostInfo = self->_sectionSlotCostInfo;
  if ((unint64_t)sectionSlotCostInfo | *((void *)v4 + 15))
  {
    if (!-[NTPBSectionSlotCostInfo isEqual:](sectionSlotCostInfo, "isEqual:")) {
      goto LABEL_133;
    }
    $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  }
  int v8 = *((_DWORD *)v4 + 35);
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0) {
      goto LABEL_133;
    }
    if (self->_fetchWidgetConfig)
    {
      if (!*((unsigned char *)v4 + 134)) {
        goto LABEL_133;
      }
    }
    else if (*((unsigned char *)v4 + 134))
    {
      goto LABEL_133;
    }
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v8 & 0x2000) == 0) {
      goto LABEL_133;
    }
    if (self->_allowOnlyWatchEligibleSections)
    {
      if (!*((unsigned char *)v4 + 132)) {
        goto LABEL_133;
      }
    }
    else if (*((unsigned char *)v4 + 132))
    {
      goto LABEL_133;
    }
  }
  else if ((v8 & 0x2000) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0) {
      goto LABEL_133;
    }
    if (self->_respectsWidgetVisibleSectionsPerQueueLimit)
    {
      if (!*((unsigned char *)v4 + 138)) {
        goto LABEL_133;
      }
    }
    else if (*((unsigned char *)v4 + 138))
    {
      goto LABEL_133;
    }
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_133;
  }
  assetsDirectoryFileURLString = self->_assetsDirectoryFileURLString;
  if ((unint64_t)assetsDirectoryFileURLString | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](assetsDirectoryFileURLString, "isEqual:")) {
      goto LABEL_133;
    }
    $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  }
  int v10 = *((_DWORD *)v4 + 35);
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_leadingCellThumbnailSizePreset != *((void *)v4 + 3)) {
      goto LABEL_133;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0 || self->_dynamicThumbnailSizePresetMinimumWidthInPixels != *((_DWORD *)v4 + 25)) {
      goto LABEL_133;
    }
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0 || self->_dynamicThumbnailSizePresetMinimumHeightInPixels != *((_DWORD *)v4 + 24)) {
      goto LABEL_133;
    }
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v10 & 0x4000) != 0)
    {
      if (self->_allowSectionTitles)
      {
        if (!*((unsigned char *)v4 + 133)) {
          goto LABEL_133;
        }
        goto LABEL_99;
      }
      if (!*((unsigned char *)v4 + 133)) {
        goto LABEL_99;
      }
    }
LABEL_133:
    BOOL v15 = 0;
    goto LABEL_134;
  }
  if ((v10 & 0x4000) != 0) {
    goto LABEL_133;
  }
LABEL_99:
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_embedsLimit != *((void *)v4 + 2)) {
      goto LABEL_133;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_133;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_scale != *((double *)v4 + 7)) {
      goto LABEL_133;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_133;
  }
  keyboardInputMode = self->_keyboardInputMode;
  if ((unint64_t)keyboardInputMode | *((void *)v4 + 13)
    && !-[NSString isEqual:](keyboardInputMode, "isEqual:"))
  {
    goto LABEL_133;
  }
  request = self->_request;
  if ((unint64_t)request | *((void *)v4 + 14))
  {
    if (!-[NTPBTodayModuleContentRequest isEqual:](request, "isEqual:")) {
      goto LABEL_133;
    }
  }
  $167E2C57B64171B916FF28E31FCA8750 v13 = self->_has;
  int v14 = *((_DWORD *)v4 + 35);
  if ((*(unsigned char *)&v13 & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_minHeadlineScale != *((double *)v4 + 5)) {
      goto LABEL_133;
    }
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_133;
  }
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_maxHeadlineScale != *((double *)v4 + 4)) {
      goto LABEL_133;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&v13 & 0x1000) != 0)
  {
    if ((v14 & 0x1000) == 0 || self->_widgetSize != *((_DWORD *)v4 + 32)) {
      goto LABEL_133;
    }
  }
  else if ((v14 & 0x1000) != 0)
  {
    goto LABEL_133;
  }
  if (*(unsigned char *)&v13)
  {
    if ((v14 & 1) == 0 || self->_bannerSlotCost != *((double *)v4 + 1)) {
      goto LABEL_133;
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = (*((_DWORD *)v4 + 35) & 1) == 0;
  }
LABEL_134:

  return v15;
}

- (unint64_t)hash
{
  $167E2C57B64171B916FF28E31FCA8750 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    double slotsLimit = self->_slotsLimit;
    double v6 = -slotsLimit;
    if (slotsLimit >= 0.0) {
      double v6 = self->_slotsLimit;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    uint64_t v52 = 2654435761 * self->_respectsWidgetSlotsLimit;
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
LABEL_11:
      uint64_t v51 = 2654435761 * self->_preferCompactSectionName;
      if ((*(_DWORD *)&has & 0x20000) != 0) {
        goto LABEL_12;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v52 = 0;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_11;
    }
  }
  uint64_t v51 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_12:
    uint64_t v50 = 2654435761 * self->_preferCompactSourceName;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_13;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v50 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_13:
    uint64_t v49 = 2654435761 * self->_thumbnailSizePreset;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_14;
    }
LABEL_20:
    uint64_t v48 = 0;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_15;
    }
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v49 = 0;
  if ((*(_WORD *)&has & 0x100) == 0) {
    goto LABEL_20;
  }
LABEL_14:
  uint64_t v48 = 2654435761 * self->_sourceNameImageSizePreset;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_15:
    uint64_t v47 = 2654435761 * self->_qualityOfService;
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v47 = 0;
LABEL_22:
  unint64_t v46 = [(NTPBSectionSlotCostInfo *)self->_sectionSlotCostInfo hash];
  $167E2C57B64171B916FF28E31FCA8750 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
    uint64_t v45 = 0;
    if ((*(_WORD *)&v9 & 0x2000) != 0) {
      goto LABEL_24;
    }
LABEL_27:
    uint64_t v44 = 0;
    if ((*(_DWORD *)&v9 & 0x80000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_28;
  }
  uint64_t v45 = 2654435761 * self->_fetchWidgetConfig;
  if ((*(_WORD *)&v9 & 0x2000) == 0) {
    goto LABEL_27;
  }
LABEL_24:
  uint64_t v44 = 2654435761 * self->_allowOnlyWatchEligibleSections;
  if ((*(_DWORD *)&v9 & 0x80000) != 0)
  {
LABEL_25:
    uint64_t v43 = 2654435761 * self->_respectsWidgetVisibleSectionsPerQueueLimit;
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v43 = 0;
LABEL_29:
  NSUInteger v42 = [(NSString *)self->_assetsDirectoryFileURLString hash];
  $167E2C57B64171B916FF28E31FCA8750 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 4) != 0)
  {
    uint64_t v41 = 2654435761 * self->_leadingCellThumbnailSizePreset;
    if ((*(_WORD *)&v10 & 0x800) != 0)
    {
LABEL_31:
      uint64_t v40 = 2654435761 * self->_dynamicThumbnailSizePresetMinimumWidthInPixels;
      if ((*(_WORD *)&v10 & 0x400) != 0) {
        goto LABEL_32;
      }
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v41 = 0;
    if ((*(_WORD *)&v10 & 0x800) != 0) {
      goto LABEL_31;
    }
  }
  uint64_t v40 = 0;
  if ((*(_WORD *)&v10 & 0x400) != 0)
  {
LABEL_32:
    uint64_t v39 = 2654435761 * self->_dynamicThumbnailSizePresetMinimumHeightInPixels;
    if ((*(_WORD *)&v10 & 0x4000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v39 = 0;
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
LABEL_33:
    uint64_t v38 = 2654435761 * self->_allowSectionTitles;
    if ((*(unsigned char *)&v10 & 2) != 0) {
      goto LABEL_34;
    }
LABEL_43:
    uint64_t v36 = 0;
    if ((*(unsigned char *)&v10 & 0x40) != 0) {
      goto LABEL_35;
    }
LABEL_44:
    unint64_t v15 = 0;
    goto LABEL_47;
  }
LABEL_42:
  uint64_t v38 = 0;
  if ((*(unsigned char *)&v10 & 2) == 0) {
    goto LABEL_43;
  }
LABEL_34:
  uint64_t v36 = 2654435761 * self->_embedsLimit;
  if ((*(unsigned char *)&v10 & 0x40) == 0) {
    goto LABEL_44;
  }
LABEL_35:
  double scale = self->_scale;
  double v12 = -scale;
  if (scale >= 0.0) {
    double v12 = self->_scale;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_47:
  NSUInteger v16 = [(NSString *)self->_keyboardInputMode hash];
  unint64_t v17 = [(NTPBTodayModuleContentRequest *)self->_request hash];
  $167E2C57B64171B916FF28E31FCA8750 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 0x10) != 0)
  {
    double minHeadlineScale = self->_minHeadlineScale;
    double v21 = -minHeadlineScale;
    if (minHeadlineScale >= 0.0) {
      double v21 = self->_minHeadlineScale;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((*(unsigned char *)&v18 & 8) != 0)
  {
    double maxHeadlineScale = self->_maxHeadlineScale;
    double v26 = -maxHeadlineScale;
    if (maxHeadlineScale >= 0.0) {
      double v26 = self->_maxHeadlineScale;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((*(_WORD *)&v18 & 0x1000) != 0)
  {
    uint64_t v29 = 2654435761 * self->_widgetSize;
    if (*(unsigned char *)&v18) {
      goto LABEL_65;
    }
LABEL_70:
    unint64_t v34 = 0;
    return v52 ^ v4 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v45 ^ v44 ^ v43 ^ v46 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v15 ^ v16 ^ v17 ^ v19 ^ v24 ^ v29 ^ v34;
  }
  uint64_t v29 = 0;
  if ((*(unsigned char *)&v18 & 1) == 0) {
    goto LABEL_70;
  }
LABEL_65:
  double bannerSlotCost = self->_bannerSlotCost;
  double v31 = -bannerSlotCost;
  if (bannerSlotCost >= 0.0) {
    double v31 = self->_bannerSlotCost;
  }
  long double v32 = floor(v31 + 0.5);
  double v33 = (v31 - v32) * 1.84467441e19;
  unint64_t v34 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
  if (v33 >= 0.0)
  {
    if (v33 > 0.0) {
      v34 += (unint64_t)v33;
    }
  }
  else
  {
    v34 -= (unint64_t)fabs(v33);
  }
  return v52 ^ v4 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v45 ^ v44 ^ v43 ^ v46 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v15 ^ v16 ^ v17 ^ v19 ^ v24 ^ v29 ^ v34;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  int v6 = *((_DWORD *)v4 + 35);
  if ((v6 & 0x80) != 0)
  {
    self->_double slotsLimit = *((double *)v4 + 8);
    *(_DWORD *)&self->_has |= 0x80u;
    int v6 = *((_DWORD *)v4 + 35);
    if ((v6 & 0x40000) == 0)
    {
LABEL_3:
      if ((v6 & 0x10000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v6 & 0x40000) == 0)
  {
    goto LABEL_3;
  }
  self->_respectsWidgetSlotsLimit = *((unsigned char *)v4 + 137);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v6 = *((_DWORD *)v4 + 35);
  if ((v6 & 0x10000) == 0)
  {
LABEL_4:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_preferCompactSectionName = *((unsigned char *)v4 + 135);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v6 = *((_DWORD *)v4 + 35);
  if ((v6 & 0x20000) == 0)
  {
LABEL_5:
    if ((v6 & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_preferCompactSourceName = *((unsigned char *)v4 + 136);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v6 = *((_DWORD *)v4 + 35);
  if ((v6 & 0x200) == 0)
  {
LABEL_6:
    if ((v6 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_thumbnailSizePreset = *((void *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v6 = *((_DWORD *)v4 + 35);
  if ((v6 & 0x100) == 0)
  {
LABEL_7:
    if ((v6 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_sourceNameImageSizePreset = *((void *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  if ((*((_DWORD *)v4 + 35) & 0x20) != 0)
  {
LABEL_8:
    self->_qualityOfService = *((void *)v4 + 6);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_9:
  sectionSlotCostInfo = self->_sectionSlotCostInfo;
  uint64_t v8 = *((void *)v5 + 15);
  id v14 = v5;
  if (sectionSlotCostInfo)
  {
    if (!v8) {
      goto LABEL_22;
    }
    -[NTPBSectionSlotCostInfo mergeFrom:](sectionSlotCostInfo, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_22;
    }
    -[NTPBTodayResultOperationInfo setSectionSlotCostInfo:](self, "setSectionSlotCostInfo:");
  }
  id v5 = v14;
LABEL_22:
  int v9 = *((_DWORD *)v5 + 35);
  if ((v9 & 0x8000) != 0)
  {
    self->_fetchWidgetConfig = *((unsigned char *)v5 + 134);
    *(_DWORD *)&self->_has |= 0x8000u;
    int v9 = *((_DWORD *)v5 + 35);
    if ((v9 & 0x2000) == 0)
    {
LABEL_24:
      if ((v9 & 0x80000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  else if ((v9 & 0x2000) == 0)
  {
    goto LABEL_24;
  }
  self->_allowOnlyWatchEligibleSections = *((unsigned char *)v5 + 132);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v5 + 35) & 0x80000) != 0)
  {
LABEL_25:
    self->_respectsWidgetVisibleSectionsPerQueueLimit = *((unsigned char *)v5 + 138);
    *(_DWORD *)&self->_has |= 0x80000u;
  }
LABEL_26:
  if (*((void *)v5 + 11))
  {
    -[NTPBTodayResultOperationInfo setAssetsDirectoryFileURLString:](self, "setAssetsDirectoryFileURLString:");
    id v5 = v14;
  }
  int v10 = *((_DWORD *)v5 + 35);
  if ((v10 & 4) != 0)
  {
    self->_leadingCellThumbnailSizePreset = *((void *)v5 + 3);
    *(_DWORD *)&self->_has |= 4u;
    int v10 = *((_DWORD *)v5 + 35);
    if ((v10 & 0x800) == 0)
    {
LABEL_30:
      if ((v10 & 0x400) == 0) {
        goto LABEL_31;
      }
      goto LABEL_45;
    }
  }
  else if ((v10 & 0x800) == 0)
  {
    goto LABEL_30;
  }
  self->_dynamicThumbnailSizePresetMinimumWidthInPixels = *((_DWORD *)v5 + 25);
  *(_DWORD *)&self->_has |= 0x800u;
  int v10 = *((_DWORD *)v5 + 35);
  if ((v10 & 0x400) == 0)
  {
LABEL_31:
    if ((v10 & 0x4000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_dynamicThumbnailSizePresetMinimumHeightInPixels = *((_DWORD *)v5 + 24);
  *(_DWORD *)&self->_has |= 0x400u;
  int v10 = *((_DWORD *)v5 + 35);
  if ((v10 & 0x4000) == 0)
  {
LABEL_32:
    if ((v10 & 2) == 0) {
      goto LABEL_33;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_allowSectionTitles = *((unsigned char *)v5 + 133);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v10 = *((_DWORD *)v5 + 35);
  if ((v10 & 2) == 0)
  {
LABEL_33:
    if ((v10 & 0x40) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_47:
  self->_embedsLimit = *((void *)v5 + 2);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)v5 + 35) & 0x40) != 0)
  {
LABEL_34:
    self->_double scale = *((double *)v5 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_35:
  if (*((void *)v5 + 13))
  {
    -[NTPBTodayResultOperationInfo setKeyboardInputMode:](self, "setKeyboardInputMode:");
    id v5 = v14;
  }
  request = self->_request;
  uint64_t v12 = *((void *)v5 + 14);
  if (request)
  {
    if (!v12) {
      goto LABEL_52;
    }
    -[NTPBTodayModuleContentRequest mergeFrom:](request, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_52;
    }
    -[NTPBTodayResultOperationInfo setRequest:](self, "setRequest:");
  }
  id v5 = v14;
LABEL_52:
  int v13 = *((_DWORD *)v5 + 35);
  if ((v13 & 0x10) != 0)
  {
    self->_double minHeadlineScale = *((double *)v5 + 5);
    *(_DWORD *)&self->_has |= 0x10u;
    int v13 = *((_DWORD *)v5 + 35);
    if ((v13 & 8) == 0)
    {
LABEL_54:
      if ((v13 & 0x1000) == 0) {
        goto LABEL_55;
      }
      goto LABEL_62;
    }
  }
  else if ((v13 & 8) == 0)
  {
    goto LABEL_54;
  }
  self->_double maxHeadlineScale = *((double *)v5 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v13 = *((_DWORD *)v5 + 35);
  if ((v13 & 0x1000) == 0)
  {
LABEL_55:
    if ((v13 & 1) == 0) {
      goto LABEL_57;
    }
    goto LABEL_56;
  }
LABEL_62:
  self->_widgetSize = *((_DWORD *)v5 + 32);
  *(_DWORD *)&self->_has |= 0x1000u;
  if (*((_DWORD *)v5 + 35))
  {
LABEL_56:
    self->_double bannerSlotCost = *((double *)v5 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
LABEL_57:

  MEMORY[0x270F9A758]();
}

- (double)slotsLimit
{
  return self->_slotsLimit;
}

- (BOOL)respectsWidgetSlotsLimit
{
  return self->_respectsWidgetSlotsLimit;
}

- (BOOL)preferCompactSectionName
{
  return self->_preferCompactSectionName;
}

- (BOOL)preferCompactSourceName
{
  return self->_preferCompactSourceName;
}

- (int64_t)thumbnailSizePreset
{
  return self->_thumbnailSizePreset;
}

- (int64_t)sourceNameImageSizePreset
{
  return self->_sourceNameImageSizePreset;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (NTPBSectionSlotCostInfo)sectionSlotCostInfo
{
  return self->_sectionSlotCostInfo;
}

- (void)setSectionSlotCostInfo:(id)a3
{
}

- (BOOL)fetchWidgetConfig
{
  return self->_fetchWidgetConfig;
}

- (BOOL)allowOnlyWatchEligibleSections
{
  return self->_allowOnlyWatchEligibleSections;
}

- (BOOL)respectsWidgetVisibleSectionsPerQueueLimit
{
  return self->_respectsWidgetVisibleSectionsPerQueueLimit;
}

- (NSString)assetsDirectoryFileURLString
{
  return self->_assetsDirectoryFileURLString;
}

- (void)setAssetsDirectoryFileURLString:(id)a3
{
}

- (int64_t)leadingCellThumbnailSizePreset
{
  return self->_leadingCellThumbnailSizePreset;
}

- (unsigned)dynamicThumbnailSizePresetMinimumWidthInPixels
{
  return self->_dynamicThumbnailSizePresetMinimumWidthInPixels;
}

- (unsigned)dynamicThumbnailSizePresetMinimumHeightInPixels
{
  return self->_dynamicThumbnailSizePresetMinimumHeightInPixels;
}

- (BOOL)allowSectionTitles
{
  return self->_allowSectionTitles;
}

- (int64_t)embedsLimit
{
  return self->_embedsLimit;
}

- (double)scale
{
  return self->_scale;
}

- (NSString)keyboardInputMode
{
  return self->_keyboardInputMode;
}

- (void)setKeyboardInputMode:(id)a3
{
}

- (NTPBTodayModuleContentRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (double)minHeadlineScale
{
  return self->_minHeadlineScale;
}

- (double)maxHeadlineScale
{
  return self->_maxHeadlineScale;
}

- (double)bannerSlotCost
{
  return self->_bannerSlotCost;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionSlotCostInfo, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_keyboardInputMode, 0);

  objc_storeStrong((id *)&self->_assetsDirectoryFileURLString, 0);
}

@end