@interface FCTagMetadata
- (BOOL)isArticleMetadata;
- (BOOL)isAthlete;
- (BOOL)isLocalNews;
- (FCTagMetadata)init;
- (FCTagMetadata)initWithIdentifier:(id)a3 tagType:(unint64_t)a4 dictionary:(id)a5 isArticleMetadata:(BOOL)a6;
- (NSDictionary)dictionary;
- (NSString)coverImage;
- (NSString)feedNavImage;
- (NSString)feedNavImageHQ;
- (NSString)groupTitleColor;
- (NSString)identifier;
- (NSString)name;
- (NSString)nameImage;
- (NSString)nameImageForDarkBackground;
- (NSString)nameImageMask;
- (NSString)nameImageMetadata;
- (NSString)publisherPaidAuthorizationURL;
- (NSString)publisherPaidVerificationURL;
- (NSString)sportsFullName;
- (NSString)sportsLogoImageCompact;
- (NSString)sportsPrimaryColor;
- (NSString)sportsPrimaryName;
- (NSString)sportsSecondaryName;
- (NSString)sportsSecondaryShortName;
- (int64_t)nameImageBaselineShift;
- (int64_t)nameImageScaleFactor;
- (unint64_t)sportsLeagueType;
- (unint64_t)tagType;
- (void)setDictionary:(id)a3;
- (void)setGroupTitleColor:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsArticleMetadata:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNameImage:(id)a3;
- (void)setNameImageForDarkBackground:(id)a3;
- (void)setNameImageMask:(id)a3;
- (void)setNameImageMetadata:(id)a3;
@end

@implementation FCTagMetadata

- (FCTagMetadata)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTagMetadata init]";
    __int16 v9 = 2080;
    v10 = "FCTagMetadata.m";
    __int16 v11 = 1024;
    int v12 = 35;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCTagMetadata init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCTagMetadata)initWithIdentifier:(id)a3 tagType:(unint64_t)a4 dictionary:(id)a5 isArticleMetadata:(BOOL)a6
{
  id v11 = a3;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FCTagMetadata;
  __int16 v13 = [(FCTagMetadata *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    v14->_tagType = a4;
    uint64_t v15 = [v12 copy];
    dictionary = v14->_dictionary;
    v14->_dictionary = (NSDictionary *)v15;

    v14->_isArticleMetadata = a6;
  }

  return v14;
}

- (NSString)name
{
  BOOL v3 = [(FCTagMetadata *)self isArticleMetadata];
  uint64_t v4 = [(FCTagMetadata *)self dictionary];
  v5 = v4;
  id v6 = FCArticleSourceChannelNameKey;
  if (!v3) {
    id v6 = FCCKTagNameKey;
  }
  v7 = [v4 objectForKeyedSubscript:*v6];

  return (NSString *)v7;
}

- (NSString)nameImage
{
  BOOL v3 = [(FCTagMetadata *)self isArticleMetadata];
  uint64_t v4 = [(FCTagMetadata *)self dictionary];
  v5 = v4;
  id v6 = FCArticleSourceChannelNameImageKey;
  if (!v3) {
    id v6 = FCCKTagNameImageKey;
  }
  v7 = [v4 objectForKeyedSubscript:*v6];

  return (NSString *)v7;
}

- (NSString)nameImageForDarkBackground
{
  BOOL v3 = [(FCTagMetadata *)self isArticleMetadata];
  uint64_t v4 = [(FCTagMetadata *)self dictionary];
  v5 = v4;
  id v6 = FCArticleSourceChannelNameImageForDarkBackgroundKey;
  if (!v3) {
    id v6 = FCCKTagNameImageForDarkBackgroundKey;
  }
  v7 = [v4 objectForKeyedSubscript:*v6];

  return (NSString *)v7;
}

- (NSString)nameImageMetadata
{
  BOOL v3 = [(FCTagMetadata *)self isArticleMetadata];
  uint64_t v4 = [(FCTagMetadata *)self dictionary];
  v5 = v4;
  id v6 = FCArticleSourceChannelNameImageMetadataKey;
  if (!v3) {
    id v6 = FCCKTagNameImageMetadataKey;
  }
  v7 = [v4 objectForKeyedSubscript:*v6];

  return (NSString *)v7;
}

- (NSString)nameImageMask
{
  BOOL v3 = [(FCTagMetadata *)self isArticleMetadata];
  uint64_t v4 = [(FCTagMetadata *)self dictionary];
  v5 = v4;
  id v6 = FCArticleSourceChannelNameImageMaskKey;
  if (!v3) {
    id v6 = FCCKTagNameImageMaskKey;
  }
  v7 = [v4 objectForKeyedSubscript:*v6];

  return (NSString *)v7;
}

- (int64_t)nameImageBaselineShift
{
  BOOL v3 = [(FCTagMetadata *)self isArticleMetadata];
  uint64_t v4 = [(FCTagMetadata *)self dictionary];
  v5 = v4;
  id v6 = &FCArticleSourceChannelNameImageBaselineShiftKey;
  if (!v3) {
    id v6 = FCCKTagNameImageBaselineShift;
  }
  v7 = [v4 objectForKeyedSubscript:*v6];
  int64_t v8 = [v7 longValue];

  return v8;
}

- (int64_t)nameImageScaleFactor
{
  v2 = [(FCTagMetadata *)self dictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"nameImageScaleFactor"];
  int64_t v4 = [v3 longValue];

  return v4;
}

- (NSString)coverImage
{
  v2 = [(FCTagMetadata *)self dictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"coverImage"];

  return (NSString *)v3;
}

- (NSString)feedNavImage
{
  v2 = [(FCTagMetadata *)self dictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"feedNavImage"];

  return (NSString *)v3;
}

- (NSString)feedNavImageHQ
{
  v2 = [(FCTagMetadata *)self dictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"feedNavImageHQ"];

  return (NSString *)v3;
}

- (NSString)publisherPaidAuthorizationURL
{
  v2 = [(FCTagMetadata *)self dictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"publisherPaidAuthorizationURL"];

  return (NSString *)v3;
}

- (NSString)publisherPaidVerificationURL
{
  v2 = [(FCTagMetadata *)self dictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"publisherPaidVerificationURL"];

  return (NSString *)v3;
}

- (NSString)sportsPrimaryName
{
  v2 = [(FCTagMetadata *)self dictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"sportsPrimaryName"];

  return (NSString *)v3;
}

- (NSString)sportsSecondaryName
{
  v2 = [(FCTagMetadata *)self dictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"sportsSecondaryName"];

  return (NSString *)v3;
}

- (NSString)sportsSecondaryShortName
{
  BOOL v3 = [(FCTagMetadata *)self dictionary];
  int64_t v4 = [v3 objectForKeyedSubscript:@"shortSecondaryName"];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [(FCTagMetadata *)self dictionary];
    id v6 = [v7 objectForKeyedSubscript:@"secondaryShortName"];
  }
  return (NSString *)v6;
}

- (NSString)sportsFullName
{
  v2 = [(FCTagMetadata *)self dictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"sportsFullName"];

  return (NSString *)v3;
}

- (unint64_t)sportsLeagueType
{
  v2 = [(FCTagMetadata *)self dictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"sportsLeagueType"];
  unint64_t v4 = FCSportsLeagueTypeFromString((uint64_t)v3);

  return v4;
}

- (NSString)sportsPrimaryColor
{
  v2 = [(FCTagMetadata *)self dictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"sportsPrimaryColor"];

  return (NSString *)v3;
}

- (NSString)sportsLogoImageCompact
{
  v2 = [(FCTagMetadata *)self dictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"sportsLogoImageCompact"];

  return (NSString *)v3;
}

- (NSString)groupTitleColor
{
  v2 = [(FCTagMetadata *)self dictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"groupTitleColor"];

  return (NSString *)v3;
}

- (BOOL)isAthlete
{
  v2 = [(FCTagMetadata *)self dictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"tagTypes"];

  LOBYTE(v2) = [v3 containsObject:@"ATHLETE"];
  return (char)v2;
}

- (BOOL)isLocalNews
{
  v2 = [(FCTagMetadata *)self dictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"tagTypes"];

  LOBYTE(v2) = [v3 containsObject:@"LOCAL_NEWS"];
  return (char)v2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isArticleMetadata
{
  return self->_isArticleMetadata;
}

- (void)setIsArticleMetadata:(BOOL)a3
{
  self->_isArticleMetadata = a3;
}

- (unint64_t)tagType
{
  return self->_tagType;
}

- (void)setNameImage:(id)a3
{
}

- (void)setNameImageForDarkBackground:(id)a3
{
}

- (void)setNameImageMetadata:(id)a3
{
}

- (void)setNameImageMask:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setGroupTitleColor:(id)a3
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_groupTitleColor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_nameImageMask, 0);
  objc_storeStrong((id *)&self->_nameImageMetadata, 0);
  objc_storeStrong((id *)&self->_nameImageForDarkBackground, 0);
  objc_storeStrong((id *)&self->_nameImage, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end