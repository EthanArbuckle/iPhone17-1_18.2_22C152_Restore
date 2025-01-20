@interface WBSCloudTab
+ (id)_dictionaryWithParameters:(id)a3;
- (BOOL)hasSameUUIDAndURLAsTab:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPinned;
- (BOOL)isShowingReader;
- (BOOL)matchedLastSearch;
- (NSArray)URLStringComponents;
- (NSArray)titleWords;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)dictionaryRepresentationForUserActivityUserInfo;
- (NSDictionary)readerScrollPositionDictionary;
- (NSString)URLString;
- (NSString)URLStringForLastSearch;
- (NSString)description;
- (NSString)lastSearchTerm;
- (NSString)sceneID;
- (NSString)title;
- (NSString)titleForLastSearch;
- (NSString)uuidString;
- (NSURL)url;
- (NSUUID)uuid;
- (WBSCloudTab)initWithDictionary:(id)a3;
- (WBSCloudTab)initWithDictionaryFromUserActivityUserInfo:(id)a3;
- (WBSCloudTab)initWithParameters:(id)a3;
- (WBSCloudTab)initWithURL:(id)a3 uuid:(id)a4 title:(id)a5 isShowingReader:(BOOL)a6 readerScrollPosition:(id)a7 isPinned:(BOOL)a8;
- (WBSCloudTab)initWithURL:(id)a3 uuid:(id)a4 title:(id)a5 isShowingReader:(BOOL)a6 readerScrollPosition:(id)a7 sceneID:(id)a8;
- (double)lastViewedTime;
- (unint64_t)hash;
- (void)setIsShowingReader:(BOOL)a3;
- (void)setLastSearchTerm:(id)a3;
- (void)setMatchedLastSearch:(BOOL)a3;
- (void)setPinned:(BOOL)a3;
- (void)setReaderScrollPositionDictionary:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleForLastSearch:(id)a3;
- (void)setTitleWords:(id)a3;
- (void)setURLStringComponents:(id)a3;
- (void)setURLStringForLastSearch:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation WBSCloudTab

- (WBSCloudTab)initWithParameters:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _dictionaryWithParameters:v4];

  v6 = [(WBSCloudTab *)self initWithDictionary:v5];
  return v6;
}

- (WBSCloudTab)initWithDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26.receiver = self;
    v26.super_class = (Class)WBSCloudTab;
    self = [(WBSCloudTab *)&v26 init];
    if (self)
    {
      v5 = (void *)MEMORY[0x1E4F1CB10];
      v6 = objc_msgSend(v4, "safari_stringForKey:", @"URL");
      v7 = objc_msgSend(v5, "safari_URLWithUserTypedString:", v6);
      v8 = objc_msgSend(v7, "safari_originalDataAsString");

      if ((unint64_t)([v8 length] - 8193) < 0xFFFFFFFFFFFFE000
        || (objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithDataAsString:", v8),
            v9 = (NSURL *)objc_claimAutoreleasedReturnValue(),
            url = self->_url,
            self->_url = v9,
            url,
            !self->_url))
      {
        v14 = 0;
LABEL_15:

        goto LABEL_16;
      }
      v11 = objc_msgSend(v4, "safari_stringForKey:", @"Title");
      unint64_t v12 = [v11 length];
      if (v12 < 0x81)
      {
        if (v12)
        {
LABEL_12:
          objc_storeStrong((id *)&self->_title, v11);
          v15 = objc_msgSend(v4, "safari_stringForKey:", @"UUID");
          if (v15)
          {
            v16 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v15];
            uuid = self->_uuid;
            self->_uuid = v16;
          }
          v18 = objc_msgSend(v4, "safari_stringForKey:", @"OwningSceneID");
          v19 = (NSString *)[v18 copy];
          sceneID = self->_sceneID;
          self->_sceneID = v19;

          self->_showingReader = objc_msgSend(v4, "safari_BOOLForKey:", @"IsShowingReader");
          objc_msgSend(v4, "safari_dictionaryForKey:", @"ReaderScrollPosition");
          v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          readerScrollPositionDictionary = self->_readerScrollPositionDictionary;
          self->_readerScrollPositionDictionary = v21;

          self->_pinned = objc_msgSend(v4, "safari_BOOLForKey:", @"IsPinned");
          v23 = objc_msgSend(v4, "safari_numberForKey:", @"DateLastViewed");
          [v23 doubleValue];
          self->_lastViewedTime = v24;

          v14 = self;
          goto LABEL_15;
        }
        v13 = &stru_1EFBE3CF8;
      }
      else
      {
        v13 = [v11 substringToIndex:128];
      }

      v11 = v13;
      goto LABEL_12;
    }
  }
  v14 = 0;
LABEL_16:

  return v14;
}

+ (id)_dictionaryWithParameters:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 url];
  v5 = [v3 uuid];
  v6 = [v3 title];
  int v7 = [v3 isShowingReader];
  v8 = [v3 readerScrollPosition];
  int v9 = [v3 isPinned];
  v10 = [v3 sceneID];
  [v3 lastViewedTime];
  double v12 = v11;

  if (objc_msgSend(v4, "safari_isURLTooLongToDisplay"))
  {
    v13 = 0;
  }
  else
  {
    uint64_t v14 = objc_msgSend(v4, "safari_userVisibleString");
    v15 = (void *)v14;
    if (v14)
    {
      if (!v6) {
        v6 = &stru_1EFBE3CF8;
      }
      v20[0] = @"URL";
      v20[1] = @"Title";
      v21[0] = v14;
      v21[1] = v6;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
      v13 = (void *)[v16 mutableCopy];

      if (v5)
      {
        v17 = [v5 UUIDString];
        [v13 setObject:v17 forKeyedSubscript:@"UUID"];
      }
      if (v9) {
        [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsPinned"];
      }
      if (v10) {
        [v13 setObject:v10 forKeyedSubscript:@"OwningSceneID"];
      }
      if (v12 != 0.0)
      {
        v18 = [NSNumber numberWithDouble:v12];
        [v13 setObject:v18 forKeyedSubscript:@"DateLastViewed"];
      }
      if (v7)
      {
        [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsShowingReader"];
        if ([v8 count]) {
          [v13 setObject:v8 forKeyedSubscript:@"ReaderScrollPosition"];
        }
      }
    }
    else
    {
      v13 = 0;
    }
  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_readerScrollPositionDictionary, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_lastSearchTerm, 0);
  objc_storeStrong((id *)&self->_URLStringComponents, 0);
  objc_storeStrong((id *)&self->_URLStringForLastSearch, 0);
  objc_storeStrong((id *)&self->_titleWords, 0);
  objc_storeStrong((id *)&self->_titleForLastSearch, 0);
}

- (WBSCloudTab)initWithDictionaryFromUserActivityUserInfo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = objc_msgSend(v4, "safari_dictionaryForKey:", @"com.apple.Safari.CloudTab");
    self = [(WBSCloudTab *)self initWithDictionary:v5];

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (WBSCloudTab)initWithURL:(id)a3 uuid:(id)a4 title:(id)a5 isShowingReader:(BOOL)a6 readerScrollPosition:(id)a7 sceneID:(id)a8
{
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = a7;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [[WBSCloudTabParameters alloc] initWithURL:v18];

  [(WBSCloudTabParameters *)v19 setUuid:v17];
  [(WBSCloudTabParameters *)v19 setTitle:v16];

  [(WBSCloudTabParameters *)v19 setShowingReader:v9];
  [(WBSCloudTabParameters *)v19 setReaderScrollPosition:v15];

  [(WBSCloudTabParameters *)v19 setSceneID:v14];
  v20 = [(WBSCloudTab *)self initWithParameters:v19];

  return v20;
}

- (WBSCloudTab)initWithURL:(id)a3 uuid:(id)a4 title:(id)a5 isShowingReader:(BOOL)a6 readerScrollPosition:(id)a7 isPinned:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a6;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [[WBSCloudTabParameters alloc] initWithURL:v17];

  [(WBSCloudTabParameters *)v18 setUuid:v16];
  [(WBSCloudTabParameters *)v18 setTitle:v15];

  [(WBSCloudTabParameters *)v18 setShowingReader:v9];
  [(WBSCloudTabParameters *)v18 setReaderScrollPosition:v14];

  [(WBSCloudTabParameters *)v18 setPinned:v8];
  v19 = [(WBSCloudTab *)self initWithParameters:v18];

  return v19;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uuid hash];
}

- (NSString)uuidString
{
  return [(NSUUID *)self->_uuid UUIDString];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSCloudTab *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WBSCloudTab *)self dictionaryRepresentation];
      v6 = [(WBSCloudTab *)v4 dictionaryRepresentation];
      char v7 = [v5 isEqualToDictionary:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (BOOL)hasSameUUIDAndURLAsTab:(id)a3
{
  id v4 = a3;
  v5 = [v4 uuidString];
  v6 = [(WBSCloudTab *)self uuidString];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    BOOL v8 = [v4 url];
    char v9 = [v8 isEqual:self->_url];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)URLString
{
  return [(NSURL *)self->_url absoluteString];
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = [[WBSCloudTabParameters alloc] initWithURL:self->_url];
  [(WBSCloudTabParameters *)v3 setUuid:self->_uuid];
  [(WBSCloudTabParameters *)v3 setTitle:self->_title];
  [(WBSCloudTabParameters *)v3 setShowingReader:self->_showingReader];
  [(WBSCloudTabParameters *)v3 setReaderScrollPosition:self->_readerScrollPositionDictionary];
  [(WBSCloudTabParameters *)v3 setPinned:self->_pinned];
  [(WBSCloudTabParameters *)v3 setSceneID:self->_sceneID];
  [(WBSCloudTabParameters *)v3 setLastViewedTime:self->_lastViewedTime];
  id v4 = [(id)objc_opt_class() _dictionaryWithParameters:v3];

  return (NSDictionary *)v4;
}

- (NSDictionary)dictionaryRepresentationForUserActivityUserInfo
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(WBSCloudTab *)self dictionaryRepresentation];
  id v3 = (void *)[v2 mutableCopy];

  if (v3)
  {
    [v3 removeObjectForKey:@"Title"];
    [v3 removeObjectForKey:@"UUID"];
    [v3 removeObjectForKey:@"IsPinned"];
    [v3 removeObjectForKey:@"DateLastViewed"];
    v6 = @"com.apple.Safari.CloudTab";
    v7[0] = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  title = self->_title;
  url = self->_url;
  BOOL v8 = [(NSUUID *)self->_uuid UUIDString];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; title = \"%@\"; url = \"%@\"; uuid = \"%@\"; showingReader = %d; readerScrollPositionDictionary = %@; isPinned = %d; sceneID = \"%@\">",
    v5,
    self,
    title,
    url,
    v8,
    self->_showingReader,
    self->_readerScrollPositionDictionary,
    self->_pinned,
  char v9 = self->_sceneID);

  return (NSString *)v9;
}

- (BOOL)isShowingReader
{
  return self->_isShowingReader;
}

- (NSString)titleForLastSearch
{
  return self->_titleForLastSearch;
}

- (void)setTitleForLastSearch:(id)a3
{
}

- (NSArray)titleWords
{
  return self->_titleWords;
}

- (void)setTitleWords:(id)a3
{
}

- (NSString)URLStringForLastSearch
{
  return self->_URLStringForLastSearch;
}

- (void)setURLStringForLastSearch:(id)a3
{
}

- (NSArray)URLStringComponents
{
  return self->_URLStringComponents;
}

- (void)setURLStringComponents:(id)a3
{
}

- (NSString)lastSearchTerm
{
  return self->_lastSearchTerm;
}

- (void)setLastSearchTerm:(id)a3
{
}

- (BOOL)matchedLastSearch
{
  return self->_matchedLastSearch;
}

- (void)setMatchedLastSearch:(BOOL)a3
{
  self->_matchedLastSearch = a3;
}

- (double)lastViewedTime
{
  return self->_lastViewedTime;
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void)setIsShowingReader:(BOOL)a3
{
  self->_isShowingReader = a3;
}

- (NSDictionary)readerScrollPositionDictionary
{
  return self->_readerScrollPositionDictionary;
}

- (void)setReaderScrollPositionDictionary:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (void)setPinned:(BOOL)a3
{
  self->_pinned = a3;
}

@end