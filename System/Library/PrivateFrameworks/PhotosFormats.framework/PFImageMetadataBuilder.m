@interface PFImageMetadataBuilder
+ (id)_dateFormatterTemplate;
+ (id)_exifDateTimeFormatter;
+ (id)_exifSubsecTimeFormatter;
+ (id)_exifTimeZoneOffsetFormatter;
+ (id)_gpsDateFormatter;
+ (id)_gpsTimeFormatter;
+ (id)iptcDateFormatter;
+ (id)iptcTimeFormatter;
- (NSDictionary)exifDictionary;
- (NSDictionary)iptcDictionary;
- (NSDictionary)tiffDictionary;
- (NSMutableDictionary)exifMutableDictionary;
- (NSMutableDictionary)iptcMutableDictionary;
- (NSMutableDictionary)tiffMutableDictionary;
- (PFImageMetadataBuilder)init;
- (void)_updateCreationDate;
- (void)setAccessibilityDescription:(id)a3;
- (void)setCaption:(id)a3;
- (void)setCreationDate:(id)a3 timeZone:(id)a4;
- (void)setExifMutableDictionary:(id)a3;
- (void)setIptcMutableDictionary:(id)a3;
- (void)setKeywords:(id)a3;
- (void)setPeopleNames:(id)a3;
- (void)setTiffMutableDictionary:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PFImageMetadataBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiffMutableDictionary, 0);
  objc_storeStrong((id *)&self->_exifMutableDictionary, 0);

  objc_storeStrong((id *)&self->_iptcMutableDictionary, 0);
}

- (void)setTiffMutableDictionary:(id)a3
{
}

- (NSMutableDictionary)tiffMutableDictionary
{
  return self->_tiffMutableDictionary;
}

- (void)setExifMutableDictionary:(id)a3
{
}

- (NSMutableDictionary)exifMutableDictionary
{
  return self->_exifMutableDictionary;
}

- (void)setIptcMutableDictionary:(id)a3
{
}

- (NSMutableDictionary)iptcMutableDictionary
{
  return self->_iptcMutableDictionary;
}

- (NSDictionary)tiffDictionary
{
  v2 = [(PFImageMetadataBuilder *)self tiffMutableDictionary];
  v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (NSDictionary)exifDictionary
{
  v2 = [(PFImageMetadataBuilder *)self exifMutableDictionary];
  v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (NSDictionary)iptcDictionary
{
  v2 = [(PFImageMetadataBuilder *)self iptcMutableDictionary];
  v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (void)setPeopleNames:(id)a3
{
  v4 = (void *)[a3 copy];
  v8.receiver = self;
  v8.super_class = (Class)PFImageMetadataBuilder;
  [(PFMetadataBuilder *)&v8 setPeopleNames:v4];

  v7.receiver = self;
  v7.super_class = (Class)PFImageMetadataBuilder;
  v5 = [(PFMetadataBuilder *)&v7 peopleNames];
  v6 = [(PFImageMetadataBuilder *)self iptcMutableDictionary];
  [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F2FBB0]];
}

- (void)setAccessibilityDescription:(id)a3
{
  v4 = (void *)[a3 copy];
  v8.receiver = self;
  v8.super_class = (Class)PFImageMetadataBuilder;
  [(PFMetadataBuilder *)&v8 setAccessibilityDescription:v4];

  v7.receiver = self;
  v7.super_class = (Class)PFImageMetadataBuilder;
  v5 = [(PFMetadataBuilder *)&v7 accessibilityDescription];
  v6 = [(PFImageMetadataBuilder *)self iptcMutableDictionary];
  [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F2FB98]];
}

- (void)setKeywords:(id)a3
{
  v4 = (void *)[a3 copy];
  v8.receiver = self;
  v8.super_class = (Class)PFImageMetadataBuilder;
  [(PFMetadataBuilder *)&v8 setKeywords:v4];

  v7.receiver = self;
  v7.super_class = (Class)PFImageMetadataBuilder;
  v5 = [(PFMetadataBuilder *)&v7 keywords];
  v6 = [(PFImageMetadataBuilder *)self iptcMutableDictionary];
  [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F2FBC0]];
}

- (void)setCaption:(id)a3
{
  v4 = (void *)[a3 copy];
  v8.receiver = self;
  v8.super_class = (Class)PFImageMetadataBuilder;
  [(PFMetadataBuilder *)&v8 setCaption:v4];

  v7.receiver = self;
  v7.super_class = (Class)PFImageMetadataBuilder;
  v5 = [(PFMetadataBuilder *)&v7 caption];
  v6 = [(PFImageMetadataBuilder *)self iptcMutableDictionary];
  [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F2FB58]];
}

- (void)setTitle:(id)a3
{
  v4 = (void *)[a3 copy];
  v8.receiver = self;
  v8.super_class = (Class)PFImageMetadataBuilder;
  [(PFMetadataBuilder *)&v8 setTitle:v4];

  v7.receiver = self;
  v7.super_class = (Class)PFImageMetadataBuilder;
  v5 = [(PFMetadataBuilder *)&v7 title];
  v6 = [(PFImageMetadataBuilder *)self iptcMutableDictionary];
  [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F2FBC8]];
}

- (void)_updateCreationDate
{
  id v19 = [(id)objc_opt_class() iptcDateFormatter];
  v3 = [(id)objc_opt_class() iptcTimeFormatter];
  v4 = [(PFMetadataBuilder *)self creationTimeZone];
  v5 = [(PFMetadataBuilder *)self creationDate];
  [v19 setTimeZone:v4];
  [v3 setTimeZone:v4];
  v6 = [(PFImageMetadataBuilder *)self iptcMutableDictionary];
  objc_super v7 = [v19 stringFromDate:v5];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F2FB78]];

  v18 = v3;
  objc_super v8 = [v3 stringFromDate:v5];
  v17 = v6;
  [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F2FBD0]];

  v9 = [(id)objc_opt_class() _exifDateTimeFormatter];
  v10 = [(id)objc_opt_class() _exifSubsecTimeFormatter];
  v11 = [(id)objc_opt_class() _exifTimeZoneOffsetFormatter];
  [v9 setTimeZone:v4];
  [v10 setTimeZone:v4];
  [v11 setTimeZone:v4];
  v12 = [(PFImageMetadataBuilder *)self exifMutableDictionary];
  v13 = [v9 stringFromDate:v5];
  v14 = [v10 stringFromDate:v5];
  v15 = [v11 stringFromDate:v5];
  if (![v4 secondsFromGMT])
  {

    v15 = @"+00:00";
  }
  [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F2F7F0]];
  [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F2F950]];
  [v12 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F2F8D0]];
  [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F2F7E8]];
  [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F2F948]];
  [v12 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F2F8C8]];
  [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F2F940]];
  [v12 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F2F8C0]];
  v16 = [(PFImageMetadataBuilder *)self tiffMutableDictionary];
  [v16 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F2FD38]];
}

- (void)setCreationDate:(id)a3 timeZone:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PFImageMetadataBuilder;
  [(PFMetadataBuilder *)&v5 setCreationDate:a3 timeZone:a4];
  [(PFImageMetadataBuilder *)self _updateCreationDate];
}

- (PFImageMetadataBuilder)init
{
  v10.receiver = self;
  v10.super_class = (Class)PFImageMetadataBuilder;
  v2 = [(PFMetadataBuilder *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    iptcMutableDictionary = v2->_iptcMutableDictionary;
    v2->_iptcMutableDictionary = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    exifMutableDictionary = v2->_exifMutableDictionary;
    v2->_exifMutableDictionary = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    tiffMutableDictionary = v2->_tiffMutableDictionary;
    v2->_tiffMutableDictionary = (NSMutableDictionary *)v7;
  }
  return v2;
}

+ (id)_gpsDateFormatter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PFImageMetadataBuilder__gpsDateFormatter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_gpsDateFormatter_onceToken != -1) {
    dispatch_once(&_gpsDateFormatter_onceToken, block);
  }
  v2 = (void *)_gpsDateFormatter_dateFormatter;

  return v2;
}

uint64_t __43__PFImageMetadataBuilder__gpsDateFormatter__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _dateFormatterTemplate];
  v2 = (void *)_gpsDateFormatter_dateFormatter;
  _gpsDateFormatter_dateFormatter = v1;

  uint64_t v3 = (void *)_gpsDateFormatter_dateFormatter;

  return [v3 setDateFormat:@"yyyy:MM:dd"];
}

+ (id)_gpsTimeFormatter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PFImageMetadataBuilder__gpsTimeFormatter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_gpsTimeFormatter_onceToken != -1) {
    dispatch_once(&_gpsTimeFormatter_onceToken, block);
  }
  v2 = (void *)_gpsTimeFormatter_timeFormatter;

  return v2;
}

uint64_t __43__PFImageMetadataBuilder__gpsTimeFormatter__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _dateFormatterTemplate];
  v2 = (void *)_gpsTimeFormatter_timeFormatter;
  _gpsTimeFormatter_timeFormatter = v1;

  uint64_t v3 = (void *)_gpsTimeFormatter_timeFormatter;

  return [v3 setDateFormat:@"HH:mm:ss.SS"];
}

+ (id)_dateFormatterTemplate
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  v4 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:@"en_US"];
  [v2 setCalendar:v4];

  uint64_t v5 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v5];

  return v2;
}

+ (id)_exifTimeZoneOffsetFormatter
{
  if (_exifTimeZoneOffsetFormatter_onceToken[0] != -1) {
    dispatch_once(_exifTimeZoneOffsetFormatter_onceToken, &__block_literal_global_152_5395);
  }
  id v2 = (void *)_exifTimeZoneOffsetFormatter_exifTimeZoneOffsetFormatter;

  return v2;
}

uint64_t __54__PFImageMetadataBuilder__exifTimeZoneOffsetFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  uint64_t v1 = (void *)_exifTimeZoneOffsetFormatter_exifTimeZoneOffsetFormatter;
  _exifTimeZoneOffsetFormatter_exifTimeZoneOffsetFormatter = (uint64_t)v0;

  id v2 = (void *)_exifTimeZoneOffsetFormatter_exifTimeZoneOffsetFormatter;

  return [v2 setFormatOptions:1088];
}

+ (id)_exifSubsecTimeFormatter
{
  if (_exifSubsecTimeFormatter_onceToken != -1) {
    dispatch_once(&_exifSubsecTimeFormatter_onceToken, &__block_literal_global_147_5398);
  }
  id v2 = (void *)_exifSubsecTimeFormatter_subsecTimeFormatter;

  return v2;
}

void __50__PFImageMetadataBuilder__exifSubsecTimeFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v1 = (void *)_exifSubsecTimeFormatter_subsecTimeFormatter;
  _exifSubsecTimeFormatter_subsecTimeFormatter = (uint64_t)v0;

  [(id)_exifSubsecTimeFormatter_subsecTimeFormatter setTimeStyle:0];
  [(id)_exifSubsecTimeFormatter_subsecTimeFormatter setDateStyle:0];
  [(id)_exifSubsecTimeFormatter_subsecTimeFormatter setDateFormat:@"SSS"];
  id v2 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)_exifSubsecTimeFormatter_subsecTimeFormatter setLocale:v2];

  id v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:@"en_US"];
  [(id)_exifSubsecTimeFormatter_subsecTimeFormatter setCalendar:v3];
}

+ (id)_exifDateTimeFormatter
{
  if (_exifDateTimeFormatter_onceToken[0] != -1) {
    dispatch_once(_exifDateTimeFormatter_onceToken, &__block_literal_global_133);
  }
  id v2 = (void *)_exifDateTimeFormatter_dateTimeFormatter;

  return v2;
}

void __48__PFImageMetadataBuilder__exifDateTimeFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v1 = (void *)_exifDateTimeFormatter_dateTimeFormatter;
  _exifDateTimeFormatter_dateTimeFormatter = (uint64_t)v0;

  [(id)_exifDateTimeFormatter_dateTimeFormatter setTimeStyle:0];
  [(id)_exifDateTimeFormatter_dateTimeFormatter setDateStyle:0];
  [(id)_exifDateTimeFormatter_dateTimeFormatter setDateFormat:@"yyyy:MM:dd HH:mm:ss"];
  id v2 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)_exifDateTimeFormatter_dateTimeFormatter setLocale:v2];

  id v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:@"en_US"];
  [(id)_exifDateTimeFormatter_dateTimeFormatter setCalendar:v3];
}

+ (id)iptcTimeFormatter
{
  if (iptcTimeFormatter_onceToken[0] != -1) {
    dispatch_once(iptcTimeFormatter_onceToken, &__block_literal_global_131);
  }
  id v2 = (void *)iptcTimeFormatter_iptcDateFormatter;

  return v2;
}

uint64_t __43__PFImageMetadataBuilder_iptcTimeFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  uint64_t v1 = (void *)iptcTimeFormatter_iptcDateFormatter;
  iptcTimeFormatter_iptcDateFormatter = (uint64_t)v0;

  id v2 = (void *)iptcTimeFormatter_iptcDateFormatter;

  return [v2 setFormatOptions:96];
}

+ (id)iptcDateFormatter
{
  if (iptcDateFormatter_onceToken[0] != -1) {
    dispatch_once(iptcDateFormatter_onceToken, &__block_literal_global_128);
  }
  id v2 = (void *)iptcDateFormatter_iptcDateFormatter;

  return v2;
}

uint64_t __43__PFImageMetadataBuilder_iptcDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  uint64_t v1 = (void *)iptcDateFormatter_iptcDateFormatter;
  iptcDateFormatter_iptcDateFormatter = (uint64_t)v0;

  id v2 = (void *)iptcDateFormatter_iptcDateFormatter;

  return [v2 setFormatOptions:275];
}

@end