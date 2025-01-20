@interface ICStoreFinanceItemMetadata
- (ICStoreFinanceItemMetadata)initWithMetadataDictionary:(id)a3;
- (NSDate)dateAdded;
- (NSDate)releaseDate;
- (NSDictionary)metadataDictionary;
- (NSNumber)artistID;
- (NSNumber)bitrate;
- (NSNumber)discCount;
- (NSNumber)discNumber;
- (NSNumber)drmVersionNumber;
- (NSNumber)duration;
- (NSNumber)genreID;
- (NSNumber)isCompilation;
- (NSNumber)isExplicit;
- (NSNumber)isGapless;
- (NSNumber)isMasteredForITunes;
- (NSNumber)itemAdamID;
- (NSNumber)itemCloudID;
- (NSNumber)playlistID;
- (NSNumber)rank;
- (NSNumber)sampleRate;
- (NSNumber)storefrontID;
- (NSNumber)trackCount;
- (NSNumber)trackNumber;
- (NSNumber)vendorID;
- (NSNumber)versionRestrictions;
- (NSNumber)year;
- (NSString)albumSortName;
- (NSString)artistName;
- (NSString)artistSortName;
- (NSString)comments;
- (NSString)composerName;
- (NSString)composerSortName;
- (NSString)copyright;
- (NSString)fileExtension;
- (NSString)genre;
- (NSString)itemName;
- (NSString)itemSortName;
- (NSString)kind;
- (NSString)playlistArtistName;
- (NSString)playlistName;
- (NSString)xid;
- (id)albumID;
@end

@implementation ICStoreFinanceItemMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistID, 0);

  objc_storeStrong((id *)&self->_metadataDictionary, 0);
}

- (NSNumber)playlistID
{
  return self->_playlistID;
}

- (NSDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (NSNumber)vendorID
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"vendorId"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)storefrontID
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"s"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSDate)releaseDate
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"releaseDate"];
  if (_NSIsNSString())
  {
    if (releaseDate_sOnceToken != -1) {
      dispatch_once(&releaseDate_sOnceToken, &__block_literal_global_1445);
    }
    v3 = [(id)releaseDate_sReleaseDateFormatter dateFromString:v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

void __41__ICStoreFinanceItemMetadata_releaseDate__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)releaseDate_sReleaseDateFormatter;
  releaseDate_sReleaseDateFormatter = (uint64_t)v0;

  [(id)releaseDate_sReleaseDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
  v2 = (void *)releaseDate_sReleaseDateFormatter;
  v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [(id)releaseDate_sReleaseDateFormatter setLenient:1];
  v4 = (void *)releaseDate_sReleaseDateFormatter;
  id v5 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v5];
}

- (NSNumber)rank
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"rank"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSString)copyright
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"copyright"];
  if (_NSIsNSString()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)isCompilation
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"compilation"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSString)xid
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"xid"];
  if (_NSIsNSString()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)versionRestrictions
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"versionRestrictions"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)sampleRate
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"sampleRate"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSString)kind
{
  return (NSString *)[(NSDictionary *)self->_metadataDictionary objectForKey:@"kind"];
}

- (NSNumber)isMasteredForITunes
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"isMasteredForItunes"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)isGapless
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"gapless"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSString)fileExtension
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"fileExtension"];
  if (_NSIsNSString()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)drmVersionNumber
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"bitrate"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSDate)dateAdded
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"dateAdded"];
  if (_NSIsNSDate()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSString)comments
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"comments"];
  if (_NSIsNSString()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)bitrate
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"bitRate"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)year
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"year"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)isExplicit
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"explicit"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)duration
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"duration"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)trackNumber
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"trackNumber"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)trackCount
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"trackCount"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)discNumber
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"discNumber"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSNumber)discCount
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"discCount"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (id)albumID
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"playlistId"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSNumber)genreID
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"genreId"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSString)genre
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"genre"];
  if (_NSIsNSString()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSString)composerSortName
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"sort-composer"];
  if (_NSIsNSString()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSString)composerName
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"composerName"];
  if (_NSIsNSString()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSString)playlistArtistName
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"playlistArtistName"];
  if (_NSIsNSString()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSString)albumSortName
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"sort-album"];
  if (_NSIsNSString()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSString)playlistName
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"playlistName"];
  if (_NSIsNSString()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSNumber)artistID
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"artistId"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSString)artistSortName
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"sort-artist"];
  if (_NSIsNSString()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSString)artistName
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"artistName"];
  if (_NSIsNSString()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSString)itemSortName
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"sort-name"];
  if (_NSIsNSString()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSString)itemName
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"itemName"];
  if (_NSIsNSString()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSNumber)itemCloudID
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"cloud-id"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSNumber)itemAdamID
{
  v2 = [(NSDictionary *)self->_metadataDictionary objectForKey:@"itemId"];
  if (_NSIsNSNumber()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (ICStoreFinanceItemMetadata)initWithMetadataDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICStoreFinanceItemMetadata;
  v6 = [(ICStoreFinanceItemMetadata *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metadataDictionary, a3);
  }

  return v7;
}

@end