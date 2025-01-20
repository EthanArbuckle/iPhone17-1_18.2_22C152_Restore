@interface WFiTunesSoftwareObject
+ (id)JSONKeyPathsByPropertyKey;
+ (id)allowedSecureCodingClassesByPropertyKey;
+ (id)fileSizeJSONTransformer;
+ (id)iPadScreenshotURLsJSONTransformer;
+ (id)isUniversalJSONTransformer;
+ (id)screenshotURLsJSONTransformer;
+ (id)supportsGameCenterJSONTransformer;
- (BOOL)isUniversal;
- (BOOL)supportsGameCenter;
- (NSArray)iPadScreenshotURLs;
- (NSArray)screenshotURLs;
- (NSArray)supportedDevices;
- (NSArray)supportedLanguages;
- (NSDate)lastUpdated;
- (NSDate)releaseDate;
- (NSNumber)averageRating;
- (NSNumber)averageRatingLatestVersion;
- (NSNumber)fileSize;
- (NSNumber)numberOfRatings;
- (NSNumber)numberOfRatingsLatestVersion;
- (NSNumber)price;
- (NSString)artistID;
- (NSString)artistName;
- (NSString)bundleIdentifier;
- (NSString)category;
- (NSString)contentRating;
- (NSString)currencyCode;
- (NSString)descriptionText;
- (NSString)formattedPrice;
- (NSString)minimumOSVersion;
- (NSString)releaseNotes;
- (NSString)version;
@end

@implementation WFiTunesSoftwareObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfRatingsLatestVersion, 0);
  objc_storeStrong((id *)&self->_averageRatingLatestVersion, 0);
  objc_storeStrong((id *)&self->_numberOfRatings, 0);
  objc_storeStrong((id *)&self->_averageRating, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_minimumOSVersion, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_releaseNotes, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedDevices, 0);
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_iPadScreenshotURLs, 0);
  objc_storeStrong((id *)&self->_screenshotURLs, 0);
  objc_storeStrong((id *)&self->_formattedPrice, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_artistID, 0);
}

- (NSNumber)numberOfRatingsLatestVersion
{
  return self->_numberOfRatingsLatestVersion;
}

- (NSNumber)averageRatingLatestVersion
{
  return self->_averageRatingLatestVersion;
}

- (NSNumber)numberOfRatings
{
  return self->_numberOfRatings;
}

- (NSNumber)averageRating
{
  return self->_averageRating;
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (NSString)minimumOSVersion
{
  return self->_minimumOSVersion;
}

- (NSString)contentRating
{
  return self->_contentRating;
}

- (NSString)releaseNotes
{
  return self->_releaseNotes;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (BOOL)supportsGameCenter
{
  return self->_supportsGameCenter;
}

- (BOOL)isUniversal
{
  return self->_isUniversal;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)category
{
  return self->_category;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSArray)supportedDevices
{
  return self->_supportedDevices;
}

- (NSArray)supportedLanguages
{
  return self->_supportedLanguages;
}

- (NSArray)iPadScreenshotURLs
{
  return self->_iPadScreenshotURLs;
}

- (NSArray)screenshotURLs
{
  return self->_screenshotURLs;
}

- (NSString)formattedPrice
{
  return self->_formattedPrice;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSNumber)price
{
  return self->_price;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)artistID
{
  return self->_artistID;
}

+ (id)fileSizeJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x1E4F29248], "mtl_numberTransformerWithNumberStyle:locale:", 0, 0);
}

+ (id)iPadScreenshotURLsJSONTransformer
{
  v2 = objc_msgSend(MEMORY[0x1E4F29248], "mtl_URLValueTransformer");
  v3 = +[NSValueTransformer mtl_arrayMappingTransformerWithTransformer:v2];

  return v3;
}

+ (id)screenshotURLsJSONTransformer
{
  v2 = objc_msgSend(MEMORY[0x1E4F29248], "mtl_URLValueTransformer");
  v3 = +[NSValueTransformer mtl_arrayMappingTransformerWithTransformer:v2];

  return v3;
}

+ (id)supportsGameCenterJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:&__block_literal_global_705];
}

uint64_t __59__WFiTunesSoftwareObject_supportsGameCenterJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 containsObject:@"gameCenter"];
  return [v2 numberWithBool:v3];
}

+ (id)isUniversalJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:&__block_literal_global_700];
}

uint64_t __52__WFiTunesSoftwareObject_isUniversalJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 containsObject:@"iosUniversal"];
  return [v2 numberWithBool:v3];
}

+ (id)JSONKeyPathsByPropertyKey
{
  v8[30] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFiTunesSoftwareObject;
  v2 = objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  uint64_t v3 = (void *)[v2 mutableCopy];

  v7[0] = @"identifier";
  v7[1] = @"name";
  v8[0] = @"trackId";
  v8[1] = @"trackName";
  v7[2] = @"censoredName";
  v7[3] = @"kind";
  v8[2] = @"trackCensoredName";
  v8[3] = @"kind";
  v7[4] = @"viewURL";
  v7[5] = @"bundleIdentifier";
  v8[4] = @"trackViewUrl";
  v8[5] = @"bundleId";
  v7[6] = @"lastUpdated";
  v7[7] = @"category";
  v8[6] = @"currentVersionReleaseDate";
  v8[7] = @"primaryGenreName";
  v7[8] = @"version";
  v7[9] = @"price";
  v8[8] = @"version";
  v8[9] = @"price";
  v7[10] = @"currencyCode";
  v7[11] = @"artistID";
  v8[10] = @"currency";
  v8[11] = @"artistId";
  v7[12] = @"artistName";
  v7[13] = @"releaseDate";
  v8[12] = @"artistName";
  v8[13] = @"releaseDate";
  v7[14] = @"formattedPrice";
  v7[15] = @"descriptionText";
  v8[14] = @"formattedPrice";
  v8[15] = @"description";
  v7[16] = @"releaseNotes";
  v7[17] = @"contentRating";
  v8[16] = @"releaseNotes";
  v8[17] = @"trackContentRating";
  v7[18] = @"minimumOSVersion";
  v7[19] = @"fileSize";
  v8[18] = @"minimumOsVersion";
  v8[19] = @"fileSizeBytes";
  v7[20] = @"averageRating";
  v7[21] = @"numberOfRatings";
  v8[20] = @"averageUserRating";
  v8[21] = @"userRatingCount";
  v7[22] = @"averageRatingLatestVersion";
  v7[23] = @"numberOfRatingsLatestVersion";
  v8[22] = @"averageUserRatingForCurrentVersion";
  v8[23] = @"userRatingCountForCurrentVersion";
  v7[24] = @"isUniversal";
  v7[25] = @"supportsGameCenter";
  v8[24] = @"features";
  v8[25] = @"features";
  v7[26] = @"supportedLanguages";
  v7[27] = @"supportedDevices";
  v8[26] = @"languageCodesISO2A";
  v8[27] = @"supportedDevices";
  v7[28] = @"screenshotURLs";
  v7[29] = @"iPadScreenshotURLs";
  v8[28] = @"screenshotUrls";
  v8[29] = @"ipadScreenshotUrls";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:30];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

+ (id)allowedSecureCodingClassesByPropertyKey
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___WFiTunesSoftwareObject;
  v2 = objc_msgSendSuper2(&v9, sel_allowedSecureCodingClassesByPropertyKey);
  uint64_t v3 = (void *)[v2 mutableCopy];

  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [v3 setObject:v4 forKey:@"screenshotURLs"];

  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v3 setObject:v5 forKey:@"iPadScreenshotURLs"];

  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  [v3 setObject:v6 forKey:@"supportedLanguages"];

  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  [v3 setObject:v7 forKey:@"supportedDevices"];

  return v3;
}

@end