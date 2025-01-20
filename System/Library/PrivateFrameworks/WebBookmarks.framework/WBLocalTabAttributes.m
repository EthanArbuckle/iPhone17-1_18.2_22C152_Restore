@interface WBLocalTabAttributes
+ (BOOL)supportsSecureCoding;
- (BOOL)isDisplayingStandaloneImage;
- (BOOL)isDisposable;
- (BOOL)isMuted;
- (BOOL)isPinned;
- (BOOL)isSafeToLoadWebPage;
- (BOOL)isShowingReader;
- (BOOL)wasOpenedFromLink;
- (NSArray)ancestorTabUUIDs;
- (NSData)sessionStateData;
- (NSDate)dateClosed;
- (NSDate)lastVisitTime;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)queuedNavigation;
- (NSString)pinnedPageTitle;
- (NSString)webClipIDString;
- (NSString)windowUUID;
- (NSURL)pinnedPageURL;
- (WBLocalTabAttributes)initWithCoder:(id)a3;
- (WBLocalTabAttributes)initWithDictionaryRepresentation:(id)a3;
- (WBLocalTabAttributes)initWithLastVisitTime:(id)a3 sessionStateData:(id)a4 ancestorTabUUIDs:(id)a5 displayingStandaloneImage:(BOOL)a6 readerViewTopScrollOffset:(double)a7 readingListBookmarkID:(int)a8 openedFromLink:(BOOL)a9 showingReader:(BOOL)a10 queuedNavigation:(id)a11 webClipIDString:(id)a12;
- (WBLocalTabAttributes)initWithVersion:(int64_t)a3 safeToLoadWebPage:(BOOL)a4 lastVisitTime:(id)a5 sessionStateData:(id)a6 ancestorTabUUIDs:(id)a7 dateClosed:(id)a8 tabIndex:(unint64_t)a9 windowUUID:(id)a10 disposable:(BOOL)a11 pinned:(BOOL)a12 pinnedPageURL:(id)a13 pinnedPageTitle:(id)a14 muted:(BOOL)a15 queuedNavigation:(id)a16 displayingStandaloneImage:(BOOL)a17 readerViewTopScrollOffset:(double)a18 readingListBookmarkID:(int)a19 openedFromLink:(BOOL)a20 showingReader:(BOOL)a21 webClipIDString:(id)a22;
- (double)readerViewTopScrollOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localAttributesWithLastVisitTime:(id)a3;
- (id)localAttributesWithLastVisitTime:(id)a3 queuedNavigation:(id)a4;
- (int)readingListBookmarkID;
- (unint64_t)tabIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setSessionStateData:(id)a3;
@end

@implementation WBLocalTabAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBLocalTabAttributes)initWithCoder:(id)a3
{
  v40[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v37 = [v3 decodeIntegerForKey:@"version"];
  unsigned int v36 = [v3 decodeBoolForKey:*MEMORY[0x263F66890]];
  v35 = [v3 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F66858]];
  v32 = [v3 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F66898]];
  v4 = (void *)MEMORY[0x263EFFA08];
  v40[0] = objc_opt_class();
  v40[1] = objc_opt_class();
  v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
  v33 = [v4 setWithArray:v34];
  v31 = [v3 decodeObjectOfClasses:v33 forKey:*MEMORY[0x263F66820]];
  v29 = [v3 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F66828]];
  v30 = [v3 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F66838]];
  uint64_t v28 = [v30 unsignedIntegerValue];
  v26 = [v3 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F668B0]];
  char v27 = [v3 decodeBoolForKey:*MEMORY[0x263F66840]];
  char v25 = [v3 decodeBoolForKey:*MEMORY[0x263F66850]];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F66870]];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F66868]];
  char v23 = [v3 decodeBoolForKey:*MEMORY[0x263F66848]];
  v7 = (void *)MEMORY[0x263EFFA08];
  v39[0] = objc_opt_class();
  v39[1] = objc_opt_class();
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
  v22 = [v7 setWithArray:v24];
  v8 = [v3 decodeObjectOfClasses:v22 forKey:*MEMORY[0x263F66878]];
  char v9 = [v3 decodeBoolForKey:*MEMORY[0x263F66830]];
  [v3 decodeDoubleForKey:*MEMORY[0x263F66880]];
  double v11 = v10;
  int v12 = [v3 decodeIntForKey:*MEMORY[0x263F66888]];
  char v13 = [v3 decodeBoolForKey:*MEMORY[0x263F66860]];
  char v14 = [v3 decodeBoolForKey:*MEMORY[0x263F668A0]];
  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F668A8]];

  BYTE1(v21) = v14;
  LOBYTE(v21) = v13;
  HIDWORD(v20) = v12;
  LOBYTE(v20) = v9;
  LOBYTE(v19) = v23;
  BYTE1(v18) = v25;
  LOBYTE(v18) = v27;
  v16 = -[WBLocalTabAttributes initWithVersion:safeToLoadWebPage:lastVisitTime:sessionStateData:ancestorTabUUIDs:dateClosed:tabIndex:windowUUID:disposable:pinned:pinnedPageURL:pinnedPageTitle:muted:queuedNavigation:displayingStandaloneImage:readerViewTopScrollOffset:readingListBookmarkID:openedFromLink:showingReader:webClipIDString:](self, "initWithVersion:safeToLoadWebPage:lastVisitTime:sessionStateData:ancestorTabUUIDs:dateClosed:tabIndex:windowUUID:disposable:pinned:pinnedPageURL:pinnedPageTitle:muted:queuedNavigation:displayingStandaloneImage:readerViewTopScrollOffset:readingListBookmarkID:openedFromLink:showingReader:webClipIDString:", v37, v36, v35, v32, v31, v29, v11, v28, v26, v18, v5, v6, v19, v8, v20,
          v21,
          v15);

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:1 forKey:@"version"];
  [v5 encodeBool:self->_isSafeToLoadWebPage forKey:*MEMORY[0x263F66890]];
  [v5 encodeObject:self->_lastVisitTime forKey:*MEMORY[0x263F66858]];
  [v5 encodeObject:self->_sessionStateData forKey:*MEMORY[0x263F66898]];
  [v5 encodeObject:self->_ancestorTabUUIDs forKey:*MEMORY[0x263F66820]];
  [v5 encodeObject:self->_dateClosed forKey:*MEMORY[0x263F66828]];
  v4 = [NSNumber numberWithUnsignedInteger:self->_tabIndex];
  [v5 encodeObject:v4 forKey:*MEMORY[0x263F66838]];

  [v5 encodeObject:self->_windowUUID forKey:*MEMORY[0x263F668B0]];
  [v5 encodeBool:self->_isDisposable forKey:*MEMORY[0x263F66840]];
  [v5 encodeBool:self->_isPinned forKey:*MEMORY[0x263F66850]];
  [v5 encodeObject:self->_pinnedPageURL forKey:*MEMORY[0x263F66870]];
  [v5 encodeObject:self->_pinnedPageTitle forKey:*MEMORY[0x263F66868]];
  [v5 encodeBool:self->_isMuted forKey:*MEMORY[0x263F66848]];
  [v5 encodeObject:self->_queuedNavigation forKey:*MEMORY[0x263F66878]];
  [v5 encodeBool:self->_displayingStandaloneImage forKey:*MEMORY[0x263F66830]];
  [v5 encodeDouble:*MEMORY[0x263F66880] forKey:self->_readerViewTopScrollOffset];
  [v5 encodeInt:self->_readingListBookmarkID forKey:*MEMORY[0x263F66888]];
  [v5 encodeBool:self->_openedFromLink forKey:*MEMORY[0x263F66860]];
  [v5 encodeBool:self->_showingReader forKey:*MEMORY[0x263F668A0]];
  [v5 encodeBool:self->_webClipIDString != 0 forKey:*MEMORY[0x263F668A8]];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(unsigned char *)(v4 + 11) = self->_isSafeToLoadWebPage;
  objc_storeStrong((id *)(v4 + 32), self->_lastVisitTime);
  objc_storeStrong((id *)(v4 + 40), self->_sessionStateData);
  objc_storeStrong((id *)(v4 + 48), self->_ancestorTabUUIDs);
  objc_storeStrong((id *)(v4 + 56), self->_dateClosed);
  *(void *)(v4 + 96) = self->_tabIndex;
  objc_storeStrong((id *)(v4 + 104), self->_windowUUID);
  *(unsigned char *)(v4 + 12) = self->_isDisposable;
  *(unsigned char *)(v4 + 13) = self->_isPinned;
  objc_storeStrong((id *)(v4 + 64), self->_pinnedPageURL);
  objc_storeStrong((id *)(v4 + 72), self->_pinnedPageTitle);
  *(unsigned char *)(v4 + 14) = self->_isMuted;
  objc_storeStrong((id *)(v4 + 80), self->_queuedNavigation);
  *(unsigned char *)(v4 + 8) = self->_displayingStandaloneImage;
  *(double *)(v4 + 24) = self->_readerViewTopScrollOffset;
  *(_DWORD *)(v4 + 16) = self->_readingListBookmarkID;
  *(unsigned char *)(v4 + 9) = self->_openedFromLink;
  *(unsigned char *)(v4 + 10) = self->_showingReader;
  objc_storeStrong((id *)(v4 + 88), self->_webClipIDString);
  return (id)v4;
}

- (WBLocalTabAttributes)initWithLastVisitTime:(id)a3 sessionStateData:(id)a4 ancestorTabUUIDs:(id)a5 displayingStandaloneImage:(BOOL)a6 readerViewTopScrollOffset:(double)a7 readingListBookmarkID:(int)a8 openedFromLink:(BOOL)a9 showingReader:(BOOL)a10 queuedNavigation:(id)a11 webClipIDString:(id)a12
{
  BYTE1(v16) = a10;
  LOBYTE(v16) = a9;
  HIDWORD(v15) = a8;
  LOBYTE(v15) = a6;
  LOBYTE(v14) = 0;
  LOWORD(v13) = 0;
  return -[WBLocalTabAttributes initWithVersion:safeToLoadWebPage:lastVisitTime:sessionStateData:ancestorTabUUIDs:dateClosed:tabIndex:windowUUID:disposable:pinned:pinnedPageURL:pinnedPageTitle:muted:queuedNavigation:displayingStandaloneImage:readerViewTopScrollOffset:readingListBookmarkID:openedFromLink:showingReader:webClipIDString:](self, "initWithVersion:safeToLoadWebPage:lastVisitTime:sessionStateData:ancestorTabUUIDs:dateClosed:tabIndex:windowUUID:disposable:pinned:pinnedPageURL:pinnedPageTitle:muted:queuedNavigation:displayingStandaloneImage:readerViewTopScrollOffset:readingListBookmarkID:openedFromLink:showingReader:webClipIDString:", 1, 0, a3, a4, a5, 0, a7, 0, 0, v13, 0, 0, v14, a11, v15,
           v16,
           a12);
}

- (WBLocalTabAttributes)initWithVersion:(int64_t)a3 safeToLoadWebPage:(BOOL)a4 lastVisitTime:(id)a5 sessionStateData:(id)a6 ancestorTabUUIDs:(id)a7 dateClosed:(id)a8 tabIndex:(unint64_t)a9 windowUUID:(id)a10 disposable:(BOOL)a11 pinned:(BOOL)a12 pinnedPageURL:(id)a13 pinnedPageTitle:(id)a14 muted:(BOOL)a15 queuedNavigation:(id)a16 displayingStandaloneImage:(BOOL)a17 readerViewTopScrollOffset:(double)a18 readingListBookmarkID:(int)a19 openedFromLink:(BOOL)a20 showingReader:(BOOL)a21 webClipIDString:(id)a22
{
  id v52 = a5;
  id v27 = a6;
  id v28 = a7;
  id v51 = a8;
  id v29 = a10;
  id v50 = a13;
  id v30 = a14;
  id v31 = a16;
  id v32 = a22;
  v53.receiver = self;
  v53.super_class = (Class)WBLocalTabAttributes;
  v33 = [(WBLocalTabAttributes *)&v53 init];
  v34 = v33;
  if (v33)
  {
    v33->_isSafeToLoadWebPage = a4;
    objc_storeStrong((id *)&v33->_lastVisitTime, a5);
    uint64_t v35 = [v27 copy];
    sessionStateData = v34->_sessionStateData;
    v34->_sessionStateData = (NSData *)v35;

    uint64_t v37 = [v28 copy];
    ancestorTabUUIDs = v34->_ancestorTabUUIDs;
    v34->_ancestorTabUUIDs = (NSArray *)v37;

    objc_storeStrong((id *)&v34->_dateClosed, a8);
    v34->_tabIndex = a9;
    uint64_t v39 = [v29 copy];
    windowUUID = v34->_windowUUID;
    v34->_windowUUID = (NSString *)v39;

    v34->_isDisposable = a11;
    v34->_isPinned = a12;
    objc_storeStrong((id *)&v34->_pinnedPageURL, a13);
    uint64_t v41 = [v30 copy];
    pinnedPageTitle = v34->_pinnedPageTitle;
    v34->_pinnedPageTitle = (NSString *)v41;

    v34->_isMuted = a15;
    uint64_t v43 = [v31 copy];
    queuedNavigation = v34->_queuedNavigation;
    v34->_queuedNavigation = (NSDictionary *)v43;

    v34->_displayingStandaloneImage = a17;
    v34->_readerViewTopScrollOffset = a18;
    v34->_readingListBookmarkID = a19;
    v34->_openedFromLink = a20;
    v34->_showingReader = a21;
    if (!a3) {
      v34->_isSafeToLoadWebPage = 1;
    }
    objc_storeStrong((id *)&v34->_webClipIDString, a22);
    v45 = v34;
  }

  return v34;
}

- (WBLocalTabAttributes)initWithDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  v33 = objc_msgSend(v3, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), *MEMORY[0x263F66820]);
  id v32 = objc_msgSend(v3, "safari_stringForKey:", *MEMORY[0x263F668B0]);
  uint64_t v4 = NSURL;
  id v5 = objc_msgSend(v3, "safari_stringForKey:", *MEMORY[0x263F66870]);
  v26 = [v4 URLWithString:v5];

  v34 = objc_msgSend(v3, "safari_numberForKey:", @"version");
  uint64_t v31 = [v34 integerValue];
  unsigned int v23 = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x263F66890]);
  id v30 = objc_msgSend(v3, "safari_dateForKey:", *MEMORY[0x263F66858]);
  id v28 = objc_msgSend(v3, "safari_dataForKey:", *MEMORY[0x263F66898]);
  id v27 = objc_msgSend(v3, "safari_dateForKey:", *MEMORY[0x263F66828]);
  id v29 = objc_msgSend(v3, "safari_numberForKey:", *MEMORY[0x263F66838]);
  uint64_t v25 = [v29 unsignedIntegerValue];
  char v24 = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x263F66840]);
  char v22 = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x263F66850]);
  v6 = objc_msgSend(v3, "safari_stringForKey:", *MEMORY[0x263F66868]);
  char v20 = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x263F66848]);
  v7 = objc_msgSend(v3, "safari_dictionaryForKey:", *MEMORY[0x263F66878]);
  LOBYTE(v5) = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x263F66830]);
  uint64_t v21 = objc_msgSend(v3, "safari_numberForKey:", *MEMORY[0x263F66880]);
  [v21 doubleValue];
  double v9 = v8;
  double v10 = objc_msgSend(v3, "safari_numberForKey:", *MEMORY[0x263F66888]);
  int v11 = [v10 intValue];
  char v12 = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x263F66860]);
  char v13 = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x263F668A0]);
  uint64_t v14 = objc_msgSend(v3, "safari_stringForKey:", *MEMORY[0x263F668A8]);

  BYTE1(v19) = v13;
  LOBYTE(v19) = v12;
  HIDWORD(v18) = v11;
  LOBYTE(v18) = (_BYTE)v5;
  LOBYTE(v17) = v20;
  BYTE1(v16) = v22;
  LOBYTE(v16) = v24;
  unsigned int v36 = -[WBLocalTabAttributes initWithVersion:safeToLoadWebPage:lastVisitTime:sessionStateData:ancestorTabUUIDs:dateClosed:tabIndex:windowUUID:disposable:pinned:pinnedPageURL:pinnedPageTitle:muted:queuedNavigation:displayingStandaloneImage:readerViewTopScrollOffset:readingListBookmarkID:openedFromLink:showingReader:webClipIDString:](self, "initWithVersion:safeToLoadWebPage:lastVisitTime:sessionStateData:ancestorTabUUIDs:dateClosed:tabIndex:windowUUID:disposable:pinned:pinnedPageURL:pinnedPageTitle:muted:queuedNavigation:displayingStandaloneImage:readerViewTopScrollOffset:readingListBookmarkID:openedFromLink:showingReader:webClipIDString:", v31, v23, v30, v28, v33, v27, v9, v25, v32, v16, v26, v6, v17, v7, v18,
          v19,
          v14);

  return v36;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 setObject:&unk_26CC400F8 forKeyedSubscript:@"version"];
  uint64_t v4 = [NSNumber numberWithBool:self->_isSafeToLoadWebPage];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x263F66890]];

  lastVisitTime = self->_lastVisitTime;
  if (lastVisitTime) {
    [v3 setObject:lastVisitTime forKeyedSubscript:*MEMORY[0x263F66858]];
  }
  if ([(NSData *)self->_sessionStateData length]) {
    [v3 setObject:self->_sessionStateData forKeyedSubscript:*MEMORY[0x263F66898]];
  }
  [v3 setObject:self->_ancestorTabUUIDs forKeyedSubscript:*MEMORY[0x263F66820]];
  [v3 setObject:self->_dateClosed forKeyedSubscript:*MEMORY[0x263F66828]];
  v6 = [NSNumber numberWithUnsignedInteger:self->_tabIndex];
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x263F66838]];

  windowUUID = self->_windowUUID;
  if (windowUUID) {
    [v3 setObject:windowUUID forKeyedSubscript:*MEMORY[0x263F668B0]];
  }
  double v8 = [NSNumber numberWithBool:self->_isDisposable];
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x263F66840]];

  if (self->_isPinned)
  {
    double v9 = [NSNumber numberWithBool:1];
    [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x263F66850]];
  }
  pinnedPageURL = self->_pinnedPageURL;
  if (pinnedPageURL)
  {
    int v11 = [(NSURL *)pinnedPageURL safari_originalDataAsString];
    [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x263F66870]];
  }
  pinnedPageTitle = self->_pinnedPageTitle;
  if (pinnedPageTitle) {
    [v3 setObject:pinnedPageTitle forKeyedSubscript:*MEMORY[0x263F66868]];
  }
  char v13 = [NSNumber numberWithBool:self->_isMuted];
  [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x263F66848]];

  queuedNavigation = self->_queuedNavigation;
  if (queuedNavigation) {
    [v3 setObject:queuedNavigation forKeyedSubscript:*MEMORY[0x263F66878]];
  }
  uint64_t v15 = [NSNumber numberWithBool:self->_displayingStandaloneImage];
  [v3 setObject:v15 forKeyedSubscript:*MEMORY[0x263F66830]];

  uint64_t v16 = [NSNumber numberWithDouble:self->_readerViewTopScrollOffset];
  [v3 setObject:v16 forKeyedSubscript:*MEMORY[0x263F66880]];

  uint64_t v17 = [NSNumber numberWithInt:self->_readingListBookmarkID];
  [v3 setObject:v17 forKeyedSubscript:*MEMORY[0x263F66888]];

  uint64_t v18 = [NSNumber numberWithBool:self->_openedFromLink];
  [v3 setObject:v18 forKeyedSubscript:*MEMORY[0x263F66860]];

  uint64_t v19 = [NSNumber numberWithBool:self->_showingReader];
  [v3 setObject:v19 forKeyedSubscript:*MEMORY[0x263F668A0]];

  webClipIDString = self->_webClipIDString;
  if (webClipIDString) {
    [v3 setObject:webClipIDString forKeyedSubscript:*MEMORY[0x263F668A8]];
  }
  return (NSDictionary *)v3;
}

- (id)localAttributesWithLastVisitTime:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(WBLocalTabAttributes *)self copy];
  v6 = (void *)v5[4];
  v5[4] = v4;

  return v5;
}

- (id)localAttributesWithLastVisitTime:(id)a3 queuedNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)[(WBLocalTabAttributes *)self copy];
  double v9 = (void *)v8[4];
  v8[4] = v6;
  id v10 = v6;

  uint64_t v11 = [v7 copy];
  char v12 = (void *)v8[10];
  v8[10] = v11;

  return v8;
}

- (BOOL)isDisplayingStandaloneImage
{
  return self->_displayingStandaloneImage;
}

- (double)readerViewTopScrollOffset
{
  return self->_readerViewTopScrollOffset;
}

- (int)readingListBookmarkID
{
  return self->_readingListBookmarkID;
}

- (BOOL)wasOpenedFromLink
{
  return self->_openedFromLink;
}

- (BOOL)isShowingReader
{
  return self->_showingReader;
}

- (BOOL)isSafeToLoadWebPage
{
  return self->_isSafeToLoadWebPage;
}

- (NSDate)lastVisitTime
{
  return self->_lastVisitTime;
}

- (NSData)sessionStateData
{
  return self->_sessionStateData;
}

- (void)setSessionStateData:(id)a3
{
}

- (NSArray)ancestorTabUUIDs
{
  return self->_ancestorTabUUIDs;
}

- (NSDate)dateClosed
{
  return self->_dateClosed;
}

- (BOOL)isDisposable
{
  return self->_isDisposable;
}

- (BOOL)isPinned
{
  return self->_isPinned;
}

- (NSURL)pinnedPageURL
{
  return self->_pinnedPageURL;
}

- (NSString)pinnedPageTitle
{
  return self->_pinnedPageTitle;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (NSDictionary)queuedNavigation
{
  return self->_queuedNavigation;
}

- (NSString)webClipIDString
{
  return self->_webClipIDString;
}

- (unint64_t)tabIndex
{
  return self->_tabIndex;
}

- (NSString)windowUUID
{
  return self->_windowUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowUUID, 0);
  objc_storeStrong((id *)&self->_webClipIDString, 0);
  objc_storeStrong((id *)&self->_queuedNavigation, 0);
  objc_storeStrong((id *)&self->_pinnedPageTitle, 0);
  objc_storeStrong((id *)&self->_pinnedPageURL, 0);
  objc_storeStrong((id *)&self->_dateClosed, 0);
  objc_storeStrong((id *)&self->_ancestorTabUUIDs, 0);
  objc_storeStrong((id *)&self->_sessionStateData, 0);
  objc_storeStrong((id *)&self->_lastVisitTime, 0);
}

@end