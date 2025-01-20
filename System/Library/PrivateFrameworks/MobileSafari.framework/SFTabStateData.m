@interface SFTabStateData
+ (id)uncompressedDataWithRawData:(id)a3 uncompressedSize:(unint64_t)a4;
- (BOOL)displayingStandaloneImage;
- (BOOL)isSessionStateDataCompressed;
- (BOOL)privateBrowsing;
- (BOOL)showingReader;
- (BOOL)skipSavingSessionState;
- (BOOL)skipUpdate;
- (BOOL)wasOpenedFromLink;
- (NSData)compressedSessionStateData;
- (NSData)sessionStateData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)UUIDString;
- (NSString)owningBrowserWindowUUIDString;
- (NSString)profileIdentifier;
- (NSString)tabGroupUUID;
- (NSString)title;
- (NSString)url;
- (NSString)userVisibleURL;
- (SFTabStateData)initWithDictionaryRepresentation:(id)a3;
- (SFTabStateData)initWithSQLiteRow:(id)a3;
- (double)lastViewedTime;
- (id)copyWithZone:(_NSZone *)a3;
- (int)readingListBookmarkID;
- (int64_t)orderIndex;
- (int64_t)owningBrowserWindowDatabaseID;
- (int64_t)readerViewTopScrollOffset;
- (unint64_t)uncompressedSessionStateDataSize;
- (void)_uncompressSessionStateDataIfNeeded;
- (void)setDisplayingStandaloneImage:(BOOL)a3;
- (void)setLastViewedTime:(double)a3;
- (void)setOrderIndex:(int64_t)a3;
- (void)setOwningBrowserWindowDatabaseID:(int64_t)a3;
- (void)setOwningBrowserWindowUUIDString:(id)a3;
- (void)setPrivateBrowsing:(BOOL)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setReaderViewTopScrollOffset:(int64_t)a3;
- (void)setReadingListBookmarkID:(int)a3;
- (void)setSessionStateData:(id)a3;
- (void)setShowingReader:(BOOL)a3;
- (void)setSkipSavingSessionState:(BOOL)a3;
- (void)setSkipUpdate:(BOOL)a3;
- (void)setTabGroupUUID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUUIDString:(id)a3;
- (void)setUncompressedSessionStateDataSize:(unint64_t)a3;
- (void)setUrl:(id)a3;
- (void)setUserVisibleURL:(id)a3;
- (void)setWasOpenedFromLink:(BOOL)a3;
@end

@implementation SFTabStateData

- (SFTabStateData)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SFTabStateData;
  v5 = [(SFTabStateData *)&v32 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "safari_stringForKey:", @"SafariStateDocumentUUID");
    UUIDString = v5->_UUIDString;
    v5->_UUIDString = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "safari_stringForKey:", @"SafariStateDocumentTitle");
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "safari_stringForKey:", @"SafariStateDocumentURL");
    url = v5->_url;
    v5->_url = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v4, "safari_stringForKey:", @"SafariStateDocumentUserVisibleURL");
    userVisibleURL = v5->_userVisibleURL;
    v5->_userVisibleURL = (NSString *)v12;

    v14 = objc_msgSend(v4, "safari_numberForKey:", @"SafariStateDocumentOrderIndex");
    v5->_orderIndex = [v14 integerValue];

    v15 = objc_msgSend(v4, "safari_numberForKey:", @"SafariStateDocumentLastViewedTime");
    [v15 doubleValue];
    v5->_lastViewedTime = v16;

    v17 = objc_msgSend(v4, "safari_numberForKey:", @"SafariStateDocumentBookmark");
    v5->_readingListBookmarkID = [v17 intValue];

    v5->_wasOpenedFromLink = objc_msgSend(v4, "safari_BOOLForKey:", @"SafariStateDocumentWasOpenedFromLink");
    v5->_showingReader = objc_msgSend(v4, "safari_BOOLForKey:", @"SafariStateDocumentShouldRestoreReader");
    v18 = objc_msgSend(v4, "safari_numberForKey:", @"SafariStateDocumentReaderViewTopScrollOffset");
    v5->_readerViewTopScrollOffset = [v18 integerValue];

    v5->_privateBrowsing = objc_msgSend(v4, "safari_BOOLForKey:", @"SafariStateDocumentUsesPrivateBrowsingStyle");
    v5->_displayingStandaloneImage = objc_msgSend(v4, "safari_BOOLForKey:", @"SafariStateDocumentDisplayingStandaloneImage");
    uint64_t v19 = objc_msgSend(v4, "safari_dataForKey:", @"SafariStateDocumentSessionState");
    sessionStateData = v5->_sessionStateData;
    v5->_sessionStateData = (NSData *)v19;

    uint64_t v21 = objc_msgSend(v4, "safari_stringForKey:", @"SafariStateDocumentOwningBrowserWindowUUID");
    owningBrowserWindowUUIDString = v5->_owningBrowserWindowUUIDString;
    v5->_owningBrowserWindowUUIDString = (NSString *)v21;

    uint64_t v23 = objc_msgSend(v4, "safari_stringForKey:", @"SafariStateDocumentTabGroupUUID");
    v24 = (void *)v23;
    if (v23) {
      v25 = (__CFString *)v23;
    }
    else {
      v25 = &stru_1EDA07C28;
    }
    objc_storeStrong((id *)&v5->_tabGroupUUID, v25);

    uint64_t v26 = objc_msgSend(v4, "safari_stringForKey:", @"SafariStateDocumentProfileUUID");
    v27 = (void *)v26;
    if (v26) {
      v28 = (__CFString *)v26;
    }
    else {
      v28 = &stru_1EDA07C28;
    }
    objc_storeStrong((id *)&v5->_profileIdentifier, v28);

    v5->_uncompressedSessionStateDataSize = [(NSData *)v5->_sessionStateData length];
    if ([(NSData *)v5->_sessionStateData length] > 0x200000)
    {
      v29 = v5->_sessionStateData;
      v5->_sessionStateData = 0;

      v5->_uncompressedSessionStateDataSize = 0;
    }
    v30 = v5;
  }

  return v5;
}

- (SFTabStateData)initWithSQLiteRow:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SFTabStateData;
  v5 = [(SFTabStateData *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 stringAtIndex:1];
    UUIDString = v5->_UUIDString;
    v5->_UUIDString = (NSString *)v6;

    uint64_t v8 = [v4 stringAtIndex:2];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 stringAtIndex:3];
    url = v5->_url;
    v5->_url = (NSString *)v10;

    uint64_t v12 = [v4 stringAtIndex:4];
    userVisibleURL = v5->_userVisibleURL;
    v5->_userVisibleURL = (NSString *)v12;

    v5->_orderIndex = (int)[v4 intAtIndex:5];
    [v4 doubleAtIndex:6];
    v5->_lastViewedTime = v14;
    v5->_readingListBookmarkID = [v4 intAtIndex:7];
    v5->_wasOpenedFromLink = [v4 intAtIndex:8] != 0;
    v5->_showingReader = [v4 BOOLAtIndex:9];
    v5->_readerViewTopScrollOffset = (int)[v4 intAtIndex:10];
    v5->_privateBrowsing = [v4 BOOLAtIndex:11];
    v5->_displayingStandaloneImage = [v4 BOOLAtIndex:12];
    uint64_t v15 = [v4 stringAtIndex:13];
    owningBrowserWindowUUIDString = v5->_owningBrowserWindowUUIDString;
    v5->_owningBrowserWindowUUIDString = (NSString *)v15;

    uint64_t v17 = [v4 stringAtIndex:15];
    tabGroupUUID = v5->_tabGroupUUID;
    v5->_tabGroupUUID = (NSString *)v17;

    uint64_t v19 = [v4 stringAtIndex:16];
    profileIdentifier = v5->_profileIdentifier;
    v5->_profileIdentifier = (NSString *)v19;

    uint64_t v21 = v5;
  }

  return v5;
}

- (NSData)compressedSessionStateData
{
  NSUInteger v3 = [(NSData *)self->_sessionStateData length];
  sessionStateData = self->_sessionStateData;
  if (v3 >> 20)
  {
    uint64_t v6 = (uint8_t *)malloc_type_malloc([(NSData *)sessionStateData length], 0x33F8DD09uLL);
    size_t v7 = compression_encode_buffer(v6, [(NSData *)self->_sessionStateData length], (const uint8_t *)[(NSData *)self->_sessionStateData bytes], [(NSData *)self->_sessionStateData length], 0, COMPRESSION_LZ4);
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v6 length:v7];
      free(v6);
      goto LABEL_7;
    }
    free(v6);
    v5 = self->_sessionStateData;
  }
  else
  {
    v5 = sessionStateData;
  }
  uint64_t v8 = v5;
LABEL_7:

  return (NSData *)v8;
}

- (void)_uncompressSessionStateDataIfNeeded
{
  if ([(SFTabStateData *)self isSessionStateDataCompressed])
  {
    NSUInteger v3 = [(id)objc_opt_class() uncompressedDataWithRawData:self->_sessionStateData uncompressedSize:self->_uncompressedSessionStateDataSize];
    sessionStateData = self->_sessionStateData;
    self->_sessionStateData = v3;
  }
}

- (BOOL)isSessionStateDataCompressed
{
  unint64_t uncompressedSessionStateDataSize = self->_uncompressedSessionStateDataSize;
  return uncompressedSessionStateDataSize
      && uncompressedSessionStateDataSize != [(NSData *)self->_sessionStateData length];
}

+ (id)uncompressedDataWithRawData:(id)a3 uncompressedSize:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a4 && [v5 length] && objc_msgSend(v6, "length") != a4)
  {
    v9 = (uint8_t *)malloc_type_malloc(a4, 0x1072897uLL);
    id v7 = v6;
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytesNoCopy:length:", v9, compression_decode_buffer(v9, a4, (const uint8_t *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), 0, COMPRESSION_LZ4));
  }
  else
  {
    id v7 = 0;
  }

  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  UUIDString = (__CFString *)self->_UUIDString;
  title = self->_title;
  if (!UUIDString) {
    UUIDString = &stru_1EDA07C28;
  }
  v24[0] = @"SafariStateDocumentUUID";
  v24[1] = @"SafariStateDocumentTitle";
  if (title) {
    id v5 = (__CFString *)title;
  }
  else {
    id v5 = &stru_1EDA07C28;
  }
  v25[0] = UUIDString;
  v25[1] = v5;
  url = (__CFString *)self->_url;
  userVisibleURL = self->_userVisibleURL;
  if (!url) {
    url = &stru_1EDA07C28;
  }
  v24[2] = @"SafariStateDocumentURL";
  v24[3] = @"SafariStateDocumentUserVisibleURL";
  if (userVisibleURL) {
    uint64_t v8 = (__CFString *)userVisibleURL;
  }
  else {
    uint64_t v8 = &stru_1EDA07C28;
  }
  v25[2] = url;
  v25[3] = v8;
  v24[4] = @"SafariStateDocumentOrderIndex";
  uint64_t v26 = [NSNumber numberWithInteger:self->_orderIndex];
  v24[5] = @"SafariStateDocumentLastViewedTime";
  objc_super v23 = (void *)v26;
  uint64_t v27 = [NSNumber numberWithDouble:self->_lastViewedTime];
  v24[6] = @"SafariStateDocumentBookmark";
  v22 = (void *)v27;
  v9 = [NSNumber numberWithInt:self->_readingListBookmarkID];
  v28 = v9;
  v24[7] = @"SafariStateDocumentWasOpenedFromLink";
  uint64_t v10 = [NSNumber numberWithBool:self->_wasOpenedFromLink];
  v29 = v10;
  v24[8] = @"SafariStateDocumentShouldRestoreReader";
  v11 = [NSNumber numberWithBool:self->_showingReader];
  v30 = v11;
  v24[9] = @"SafariStateDocumentReaderViewTopScrollOffset";
  uint64_t v12 = [NSNumber numberWithInteger:self->_readerViewTopScrollOffset];
  v31 = v12;
  v24[10] = @"SafariStateDocumentUsesPrivateBrowsingStyle";
  v13 = [NSNumber numberWithBool:self->_privateBrowsing];
  objc_super v32 = v13;
  v24[11] = @"SafariStateDocumentDisplayingStandaloneImage";
  double v14 = [NSNumber numberWithBool:self->_displayingStandaloneImage];
  v33 = v14;
  v24[12] = @"SafariStateDocumentSessionState";
  sessionStateData = self->_sessionStateData;
  double v16 = sessionStateData;
  if (!sessionStateData)
  {
    double v16 = [MEMORY[0x1E4F1C9B8] data];
  }
  owningBrowserWindowUUIDString = (__CFString *)self->_owningBrowserWindowUUIDString;
  if (!owningBrowserWindowUUIDString) {
    owningBrowserWindowUUIDString = &stru_1EDA07C28;
  }
  v34 = v16;
  v35 = owningBrowserWindowUUIDString;
  v24[13] = @"SafariStateDocumentOwningBrowserWindowUUID";
  v24[14] = @"SafariStateDocumentTabGroupUUID";
  v24[15] = @"SafariStateDocumentProfileUUID";
  tabGroupUUID = (__CFString *)self->_tabGroupUUID;
  profileIdentifier = (__CFString *)self->_profileIdentifier;
  if (!tabGroupUUID) {
    tabGroupUUID = &stru_1EDA07C28;
  }
  if (!profileIdentifier) {
    profileIdentifier = &stru_1EDA07C28;
  }
  v36 = tabGroupUUID;
  v37 = profileIdentifier;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:16];
  if (!sessionStateData) {

  }
  return (NSDictionary *)v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SFTabStateData allocWithZone:a3];
  id v5 = [(SFTabStateData *)self dictionaryRepresentation];
  uint64_t v6 = [(SFTabStateData *)v4 initWithDictionaryRepresentation:v5];

  return v6;
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (void)setUUIDString:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)userVisibleURL
{
  return self->_userVisibleURL;
}

- (void)setUserVisibleURL:(id)a3
{
}

- (int64_t)orderIndex
{
  return self->_orderIndex;
}

- (void)setOrderIndex:(int64_t)a3
{
  self->_orderIndex = a3;
}

- (double)lastViewedTime
{
  return self->_lastViewedTime;
}

- (void)setLastViewedTime:(double)a3
{
  self->_lastViewedTime = a3;
}

- (int64_t)readerViewTopScrollOffset
{
  return self->_readerViewTopScrollOffset;
}

- (void)setReaderViewTopScrollOffset:(int64_t)a3
{
  self->_readerViewTopScrollOffset = a3;
}

- (BOOL)showingReader
{
  return self->_showingReader;
}

- (void)setShowingReader:(BOOL)a3
{
  self->_showingReader = a3;
}

- (BOOL)displayingStandaloneImage
{
  return self->_displayingStandaloneImage;
}

- (void)setDisplayingStandaloneImage:(BOOL)a3
{
  self->_displayingStandaloneImage = a3;
}

- (BOOL)wasOpenedFromLink
{
  return self->_wasOpenedFromLink;
}

- (void)setWasOpenedFromLink:(BOOL)a3
{
  self->_wasOpenedFromLink = a3;
}

- (BOOL)privateBrowsing
{
  return self->_privateBrowsing;
}

- (void)setPrivateBrowsing:(BOOL)a3
{
  self->_privateBrowsing = a3;
}

- (NSData)sessionStateData
{
  return self->_sessionStateData;
}

- (void)setSessionStateData:(id)a3
{
}

- (int64_t)owningBrowserWindowDatabaseID
{
  return self->_owningBrowserWindowDatabaseID;
}

- (void)setOwningBrowserWindowDatabaseID:(int64_t)a3
{
  self->_owningBrowserWindowDatabaseID = a3;
}

- (NSString)owningBrowserWindowUUIDString
{
  return self->_owningBrowserWindowUUIDString;
}

- (void)setOwningBrowserWindowUUIDString:(id)a3
{
}

- (BOOL)skipUpdate
{
  return self->_skipUpdate;
}

- (void)setSkipUpdate:(BOOL)a3
{
  self->_skipUpdate = a3;
}

- (unint64_t)uncompressedSessionStateDataSize
{
  return self->_uncompressedSessionStateDataSize;
}

- (void)setUncompressedSessionStateDataSize:(unint64_t)a3
{
  self->_unint64_t uncompressedSessionStateDataSize = a3;
}

- (BOOL)skipSavingSessionState
{
  return self->_skipSavingSessionState;
}

- (void)setSkipSavingSessionState:(BOOL)a3
{
  self->_skipSavingSessionState = a3;
}

- (NSString)tabGroupUUID
{
  return self->_tabGroupUUID;
}

- (void)setTabGroupUUID:(id)a3
{
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
}

- (int)readingListBookmarkID
{
  return self->_readingListBookmarkID;
}

- (void)setReadingListBookmarkID:(int)a3
{
  self->_readingListBookmarkID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_tabGroupUUID, 0);
  objc_storeStrong((id *)&self->_owningBrowserWindowUUIDString, 0);
  objc_storeStrong((id *)&self->_sessionStateData, 0);
  objc_storeStrong((id *)&self->_userVisibleURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_UUIDString, 0);
}

@end