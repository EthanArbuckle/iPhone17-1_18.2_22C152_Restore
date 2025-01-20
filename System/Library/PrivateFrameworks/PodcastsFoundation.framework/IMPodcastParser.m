@interface IMPodcastParser
+ (BOOL)isContentNamespace:(id)a3;
+ (BOOL)isITunesNamespace:(id)a3;
- (BOOL)inAuthorElement;
- (BOOL)inGlobalImageElement;
- (BOOL)preferredFeedCategoryFound;
- (BOOL)preferredItemCategoryFound;
- (BOOL)shouldBufferElementChars;
- (IMPodcastFeed)parsedFeed;
- (IMPodcastParser)init;
- (NSDateFormatter)rssDateFormatter;
- (NSError)parseError;
- (NSMutableString)elementCharBuffer;
- (NSString)feedDescriptionSourceElement;
- (id)dateFromAtomDateString:(id)a3;
- (id)dateFromRSSDateString:(id)a3;
- (id)elementCharBufferTrimmed;
- (id)parseWithData:(id)a3;
- (id)removeLastColonOfString:(id)a3;
- (int64_t)feedType;
- (unint64_t)itemElementNestCount;
- (void)_parseEnclosureElement:(id)a3 forFeedItem:(id)a4;
- (void)atomParser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)atomParser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)endBufferingElementChars;
- (void)parseStreamFromURL:(id)a3 withCompletionBlock:(id)a4;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)postProcessItemElement:(id)a3;
- (void)rssParser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)rssParser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)setElementCharBuffer:(id)a3;
- (void)setFeedDescriptionSourceElement:(id)a3;
- (void)setFeedType:(int64_t)a3;
- (void)setInAuthorElement:(BOOL)a3;
- (void)setInGlobalImageElement:(BOOL)a3;
- (void)setItemElementNestCount:(unint64_t)a3;
- (void)setParseError:(id)a3;
- (void)setParsedFeed:(id)a3;
- (void)setPreferredFeedCategoryFound:(BOOL)a3;
- (void)setPreferredItemCategoryFound:(BOOL)a3;
- (void)setRssDateFormatter:(id)a3;
- (void)setShouldBufferElementChars:(BOOL)a3;
- (void)startBufferingElementChars;
@end

@implementation IMPodcastParser

- (IMPodcastParser)init
{
  v7.receiver = self;
  v7.super_class = (Class)IMPodcastParser;
  v2 = [(IMPodcastParser *)&v7 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en"];
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    rssDateFormatter = v2->_rssDateFormatter;
    v2->_rssDateFormatter = v4;

    [(NSDateFormatter *)v2->_rssDateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss zzz"];
    [(NSDateFormatter *)v2->_rssDateFormatter setLocale:v3];
  }
  return v2;
}

- (id)parseWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(IMPodcastParser *)self setFeedType:-1];
    v5 = objc_alloc_init(IMPodcastFeed);
    [(IMPodcastParser *)self setParsedFeed:v5];

    v6 = (void *)[objc_alloc(MEMORY[0x1E4F29250]) initWithData:v4];
    [v6 setShouldResolveExternalEntities:0];
    [v6 setDelegate:self];
    [v6 setShouldProcessNamespaces:1];
    [v6 parse];
  }
  objc_super v7 = NSPersistentStringForMTDisplayType(0);
  v8 = [(IMPodcastParser *)self parsedFeed];
  [v8 setDisplayType:v7];

  return [(IMPodcastParser *)self parsedFeed];
}

- (void)parseStreamFromURL:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(IMPodcastParser *)self setFeedType:-1];
  v8 = objc_alloc_init(IMPodcastFeed);
  [(IMPodcastParser *)self setParsedFeed:v8];

  v9 = +[IMXMLStreamOperation operationWithURL:v7 parseDelegate:self];

  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __58__IMPodcastParser_parseStreamFromURL_withCompletionBlock___block_invoke;
  v15 = &unk_1E5E61518;
  v16 = self;
  id v17 = v6;
  id v10 = v6;
  [v9 setCompletionBlock:&v12];
  v11 = objc_msgSend(MEMORY[0x1E4F28F08], "mainQueue", v12, v13, v14, v15, v16);
  [v11 addOperation:v9];
}

void __58__IMPodcastParser_parseStreamFromURL_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) parsedFeed];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)dateFromRSSDateString:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = [v4 length];
  v5 = [(IMPodcastParser *)self rssDateFormatter];
  id v9 = 0;
  id v10 = 0;
  [v5 getObjectValue:&v10 forString:v4 range:v11 error:&v9];

  id v6 = v10;
  id v7 = v9;

  return v6;
}

- (id)removeLastColonOfString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@":" options:4];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL && v5 == 1)
  {
    uint64_t v8 = v4;
    id v9 = NSString;
    id v10 = [v3 substringToIndex:v4];
    v11 = [v3 substringFromIndex:v8 + 1];
    id v7 = [v9 stringWithFormat:@"%@%@", v10, v11];
  }
  else
  {
    id v7 = v3;
  }

  return v7;
}

- (id)dateFromAtomDateString:(id)a3
{
  id v3 = [(IMPodcastParser *)self removeLastColonOfString:a3];
  uint64_t v4 = (const char *)[v3 cStringUsingEncoding:4];

  if (v4)
  {
    memset(&v7, 0, sizeof(v7));
    uint64_t v5 = strptime_l(v4, "%Y-%m-%dT%T%z", &v7, 0);
    if (v5)
    {
      uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)mktime(&v7)];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (![(IMPodcastParser *)self feedType])
  {
    [(IMPodcastParser *)self rssParser:v18 didStartElement:v12 namespaceURI:v13 qualifiedName:v14 attributes:v15];
    goto LABEL_11;
  }
  if ([(IMPodcastParser *)self feedType] == 1)
  {
    [(IMPodcastParser *)self atomParser:v18 didStartElement:v12 namespaceURI:v13 qualifiedName:v14 attributes:v15];
    goto LABEL_11;
  }
  if ([(IMPodcastParser *)self feedType] == -1)
  {
    if ([v12 isEqualToString:@"rss"])
    {
      v16 = self;
      uint64_t v17 = 0;
    }
    else
    {
      if (![v12 isEqualToString:@"feed"]) {
        goto LABEL_11;
      }
      v16 = self;
      uint64_t v17 = 1;
    }
    [(IMPodcastParser *)v16 setFeedType:v17];
  }
LABEL_11:
}

- (void)rssParser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v32 = a4;
  id v10 = a5;
  id v11 = a7;
  BOOL v12 = +[IMPodcastParser isITunesNamespace:v10];
  BOOL v13 = +[IMPodcastParser isContentNamespace:v10];
  if (v10) {
    int v14 = [v10 isWhitespace];
  }
  else {
    int v14 = 1;
  }
  if (self->_inGlobalImageElement && [v32 isEqualToString:@"url"]) {
    [(IMPodcastParser *)self startBufferingElementChars];
  }
  if ([(IMPodcastParser *)self itemElementNestCount])
  {
    if ([(IMPodcastParser *)self itemElementNestCount] != 1)
    {
LABEL_34:
      [(IMPodcastParser *)self setItemElementNestCount:[(IMPodcastParser *)self itemElementNestCount] + 1];
      goto LABEL_51;
    }
    id v15 = [(IMPodcastParser *)self parsedFeed];
    v16 = [v15 items];
    uint64_t v17 = [v16 lastObject];

    if (rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_globalElementsToCapture != -1) {
      dispatch_once(&rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_globalElementsToCapture, &__block_literal_global_641);
    }
    id v18 = v32;
    if (rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_itunesElementsToCapture != -1)
    {
      dispatch_once(&rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_itunesElementsToCapture, &__block_literal_global_644);
      id v18 = v32;
    }
    if (rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_contentElementsToCapture == -1)
    {
      if (v14) {
        goto LABEL_15;
      }
    }
    else
    {
      dispatch_once(&rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_contentElementsToCapture, &__block_literal_global_646);
      id v18 = v32;
      if (v14)
      {
LABEL_15:
        char v19 = [(id)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__globalElementsToCapture containsObject:v18];
        id v18 = v32;
        if (v19) {
          goto LABEL_20;
        }
      }
    }
    if (!v12
      || (v20 = [(id)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__itunesElementsToCapture containsObject:v18], id v18 = v32, (v20 & 1) == 0))
    {
      if (!v13
        || (v21 = [(id)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__contentElementsToCapture containsObject:v18], id v18 = v32, !v21))
      {
        if (v12 && (v25 = [v18 isEqualToString:@"category"], id v18 = v32, v25))
        {
          if (![(IMPodcastParser *)self preferredItemCategoryFound])
          {
            v26 = [v11 valueForKey:@"text"];
            v27 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
            v28 = [v26 stringByTrimmingCharactersInSet:v27];
            [v17 setCategory:v28];
          }
        }
        else if ([v18 isEqualToString:@"enclosure"])
        {
          [(IMPodcastParser *)self _parseEnclosureElement:v11 forFeedItem:v17];
        }
        goto LABEL_33;
      }
    }
LABEL_20:
    [(IMPodcastParser *)self startBufferingElementChars];
LABEL_33:

    goto LABEL_34;
  }
  if (rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_subelement_globalElementsToCapture != -1) {
    dispatch_once(&rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_subelement_globalElementsToCapture, &__block_literal_global_649);
  }
  if (rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_subelement_itunesElementsToCapture == -1)
  {
    if (!v14) {
      goto LABEL_36;
    }
  }
  else
  {
    dispatch_once(&rssParser_didStartElement_namespaceURI_qualifiedName_attributes__onceToken_subelement_itunesElementsToCapture, &__block_literal_global_651);
    if (!v14) {
      goto LABEL_36;
    }
  }
  if ([v32 isEqualToString:@"item"])
  {
    [(IMPodcastParser *)self setItemElementNestCount:1];
    [(IMPodcastParser *)self setPreferredItemCategoryFound:0];
    v22 = objc_alloc_init(IMPodcastFeedItem);
    v23 = [(IMPodcastParser *)self parsedFeed];
    v24 = [v23 items];
    [v24 addObject:v22];

LABEL_43:
    goto LABEL_51;
  }
LABEL_36:
  if (v12)
  {
    if ([v32 isEqualToString:@"category"])
    {
      if ([(IMPodcastParser *)self preferredFeedCategoryFound]) {
        goto LABEL_51;
      }
      v22 = [v11 valueForKey:@"text"];
      v29 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      v30 = [(IMPodcastFeedItem *)v22 stringByTrimmingCharactersInSet:v29];
      v31 = [(IMPodcastParser *)self parsedFeed];
      [v31 setCategory:v30];
      goto LABEL_42;
    }
    if ([v32 isEqualToString:@"image"])
    {
      v22 = [v11 valueForKey:@"href"];
      v29 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      v30 = [(IMPodcastFeedItem *)v22 stringByTrimmingCharactersInSet:v29];
      v31 = [(IMPodcastParser *)self parsedFeed];
      [v31 setImageURL:v30];
LABEL_42:

      goto LABEL_43;
    }
  }
  if (v14)
  {
    if ([v32 isEqualToString:@"image"])
    {
      self->_inGlobalImageElement = 1;
      goto LABEL_51;
    }
    if ([(id)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__subelement_globalElementsToCapture containsObject:v32])goto LABEL_50; {
  }
    }
  if (v12
    && [(id)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__subelement_itunesElementsToCapture containsObject:v32])
  {
LABEL_50:
    [(IMPodcastParser *)self startBufferingElementChars];
  }
LABEL_51:
}

void __83__IMPodcastParser_rssParser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke()
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"title";
  v2[1] = @"pubDate";
  v2[2] = @"link";
  v2[3] = @"description";
  v2[4] = @"guid";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];
  uint64_t v1 = (void *)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__globalElementsToCapture;
  rssParser_didStartElement_namespaceURI_qualifiedName_attributes__globalElementsToCapture = v0;
}

void __83__IMPodcastParser_rssParser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke_2()
{
  v2[10] = *MEMORY[0x1E4F143B8];
  v2[0] = @"duration";
  v2[1] = @"author";
  v2[2] = @"order";
  v2[3] = @"explicit";
  v2[4] = @"summary";
  v2[5] = @"title";
  void v2[6] = @"subtitle";
  v2[7] = @"season";
  v2[8] = @"episode";
  v2[9] = @"episodeType";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:10];
  uint64_t v1 = (void *)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__itunesElementsToCapture;
  rssParser_didStartElement_namespaceURI_qualifiedName_attributes__itunesElementsToCapture = v0;
}

void __83__IMPodcastParser_rssParser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke_3()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = @"encoded";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__contentElementsToCapture;
  rssParser_didStartElement_namespaceURI_qualifiedName_attributes__contentElementsToCapture = v0;
}

void __83__IMPodcastParser_rssParser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke_4()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"description";
  v2[1] = @"title";
  void v2[2] = @"link";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  uint64_t v1 = (void *)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__subelement_globalElementsToCapture;
  rssParser_didStartElement_namespaceURI_qualifiedName_attributes__subelement_globalElementsToCapture = v0;
}

void __83__IMPodcastParser_rssParser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke_5()
{
  void v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"summary";
  v2[1] = @"new-feed-url";
  void v2[2] = @"author";
  v2[3] = @"provider";
  void v2[4] = @"explicit";
  v2[5] = @"type";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  uint64_t v1 = (void *)rssParser_didStartElement_namespaceURI_qualifiedName_attributes__subelement_itunesElementsToCapture;
  rssParser_didStartElement_namespaceURI_qualifiedName_attributes__subelement_itunesElementsToCapture = v0;
}

- (void)_parseEnclosureElement:(id)a3 forFeedItem:(id)a4
{
  id v35 = a3;
  id v5 = a4;
  id v6 = [v35 valueForKey:@"type"];
  tm v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  id v9 = [v35 valueForKey:@"url"];
  id v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v11 = [v9 stringByTrimmingCharactersInSet:v10];

  if (v11)
  {
    uint64_t v12 = [v11 rangeOfString:@"?"];
    uint64_t v14 = v13;
    id v15 = v11;
    v16 = v15;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = [v15 substringFromIndex:v12 + v14];
      uint64_t v18 = [v16 substringToIndex:v12];

      v16 = (void *)v18;
    }
    char v19 = [MEMORY[0x1E4F28E58] URLAllowedCharacterSet];
    char v20 = (void *)[v19 mutableCopy];

    [v20 addCharactersInString:@"%"];
    int v21 = [v16 stringByAddingPercentEncodingWithAllowedCharacters:v20];
    v22 = v21;
    if (v21)
    {
      id v23 = v21;

      v16 = v23;
    }
    v24 = [MEMORY[0x1E4F1CB10] URLWithString:v16];
    int v25 = v24;
    if (v24)
    {
      uint64_t v26 = [v24 scheme];
      if (v26)
      {
        v27 = (void *)v26;
        v28 = [v25 host];

        if (v28)
        {
          v34 = [v35 valueForKey:@"length"];
          uint64_t v29 = [v34 longLongValue];
          uint64_t v33 = v29 & ~(v29 >> 63);
          v30 = [v16 pathExtension];
          v31 = +[IMUTITypes UTIByExtension:v30];
          if (v31)
          {
            [v5 setUti:v31];
          }
          else
          {
            id v32 = +[IMUTITypes UTIFromMIMEType:v8];
            [v5 setUti:v32];
          }
          [v5 setEnclosureURL:v16];
          [v5 setEnclosureParameterString:v17];
          [v5 setByteSize:v33];
        }
      }
    }
  }
}

- (void)atomParser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v37 = a4;
  id v10 = a5;
  id v11 = a7;
  BOOL v12 = +[IMPodcastParser isITunesNamespace:v10];
  if (!v10)
  {
    if (![(IMPodcastParser *)self itemElementNestCount]) {
      goto LABEL_18;
    }
    int v13 = 1;
LABEL_8:
    if ([(IMPodcastParser *)self itemElementNestCount] == 1)
    {
      id v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"title", @"published", @"id", @"summary", 0);
      v16 = v15;
      if (v13 && ([v15 containsObject:v37] & 1) != 0
        || v12 && [v37 isEqualToString:@"author"])
      {
        [(IMPodcastParser *)self startBufferingElementChars];
      }
      else if (v13)
      {
        if ([v37 isEqualToString:@"author"])
        {
          [(IMPodcastParser *)self setInAuthorElement:1];
        }
        else if ([v37 isEqualToString:@"link"])
        {
          char v20 = [v11 valueForKey:@"href"];
          int v21 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          v22 = [v20 stringByTrimmingCharactersInSet:v21];

          id v23 = [v11 valueForKey:@"rel"];
          v24 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          int v25 = [v23 stringByTrimmingCharactersInSet:v24];

          uint64_t v26 = [v11 valueForKey:@"length"];
          uint64_t v27 = [v26 longLongValue];
          if ([v25 isEqualToString:@"enclosure"]
            && v22
            && ([v22 isWhitespace] & 1) == 0)
          {
            uint64_t v36 = v27;
            v28 = [(IMPodcastParser *)self parsedFeed];
            uint64_t v29 = [v28 items];
            v30 = [v29 lastObject];

            v31 = v30;
            id v32 = [v30 enclosureURL];

            if (!v32)
            {
              uint64_t v33 = [v30 enclosureURL];

              if (v33)
              {
                [v30 setByteSize:0];
                [v30 setUti:0];
              }
              [v30 setEnclosureURL:v22];
              [v30 setByteSize:v36 & ~(v36 >> 63)];
              v34 = [v22 pathExtension];
              id v35 = +[IMUTITypes UTIByExtension:v34];
              [v31 setUti:v35];
            }
          }
        }
      }
    }
    else if ([(IMPodcastParser *)self itemElementNestCount] == 2 {
           && ([(IMPodcastParser *)self inAuthorElement] & v13) == 1
    }
           && [v37 isEqualToString:@"name"])
    {
      [(IMPodcastParser *)self startBufferingElementChars];
    }
    [(IMPodcastParser *)self setItemElementNestCount:[(IMPodcastParser *)self itemElementNestCount] + 1];
    goto LABEL_41;
  }
  int v13 = [v10 isWhitespace];
  if ([(IMPodcastParser *)self itemElementNestCount]) {
    goto LABEL_8;
  }
  if (!v13)
  {
    int v14 = 0;
    if (!v12) {
      goto LABEL_26;
    }
LABEL_25:
    if ([v37 isEqualToString:@"summary"])
    {
LABEL_28:
      [(IMPodcastParser *)self startBufferingElementChars];
      goto LABEL_41;
    }
    goto LABEL_26;
  }
LABEL_18:
  if ([v37 isEqualToString:@"entry"])
  {
    [(IMPodcastParser *)self setItemElementNestCount:1];
    [(IMPodcastParser *)self setPreferredItemCategoryFound:0];
    uint64_t v17 = objc_alloc_init(IMPodcastFeedItem);
    uint64_t v18 = [(IMPodcastParser *)self parsedFeed];
    char v19 = [v18 items];
    [v19 addObject:v17];

    goto LABEL_41;
  }
  if ([v37 isEqualToString:@"title"]) {
    goto LABEL_28;
  }
  int v14 = 1;
  if (v12) {
    goto LABEL_25;
  }
LABEL_26:
  if (v14 && [v37 isEqualToString:@"logo"]) {
    goto LABEL_28;
  }
LABEL_41:
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(IMPodcastParser *)self feedType])
  {
    if ([(IMPodcastParser *)self feedType] == 1) {
      [(IMPodcastParser *)self atomParser:v13 didEndElement:v10 namespaceURI:v11 qualifiedName:v12];
    }
  }
  else
  {
    [(IMPodcastParser *)self rssParser:v13 didEndElement:v10 namespaceURI:v11 qualifiedName:v12];
  }
}

- (void)rssParser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v65 = a4;
  id v8 = a5;
  BOOL v9 = +[IMPodcastParser isITunesNamespace:v8];
  BOOL v10 = +[IMPodcastParser isContentNamespace:v8];
  if (v8) {
    int v11 = [v8 isWhitespace];
  }
  else {
    int v11 = 1;
  }
  if (self->_inGlobalImageElement && [v65 isEqualToString:@"url"])
  {
    id v12 = [(IMPodcastParser *)self elementCharBufferTrimmed];
    id v13 = [(IMPodcastParser *)self parsedFeed];
    [v13 setGlobalImageURL:v12];

    [(IMPodcastParser *)self endBufferingElementChars];
  }
  if ([(IMPodcastParser *)self itemElementNestCount])
  {
    int v14 = [(IMPodcastParser *)self parsedFeed];
    id v15 = [v14 items];
    v16 = [v15 lastObject];

    if ([(IMPodcastParser *)self itemElementNestCount] != 2)
    {
      if (v11)
      {
        int v20 = [v65 isEqualToString:@"item"];
        if ([(IMPodcastParser *)self itemElementNestCount] == v20)
        {
          [(IMPodcastParser *)self setItemElementNestCount:0];
          [(IMPodcastParser *)self postProcessItemElement:v16];
        }
      }
      goto LABEL_75;
    }
    uint64_t v17 = v65;
    if (v11)
    {
      if ([v65 isEqualToString:@"title"])
      {
        uint64_t v18 = [(IMPodcastParser *)self elementCharBufferTrimmed];
        [v16 setTitle:v18];
        goto LABEL_74;
      }
      int v26 = [v65 isEqualToString:@"guid"];
      uint64_t v17 = v65;
      if (v26)
      {
        uint64_t v18 = [(IMPodcastParser *)self elementCharBufferTrimmed];
        [v16 setGuid:v18];
        goto LABEL_74;
      }
    }
    if (v9)
    {
      if ([v17 isEqualToString:@"duration"])
      {
        uint64_t v27 = [(IMPodcastParser *)self elementCharBuffer];
        uint64_t v18 = [v27 componentsSeparatedByString:@":"];

        if ([v18 count] && (unint64_t)objc_msgSend(v18, "count") <= 3)
        {
          v28 = NSString;
          uint64_t v29 = [(IMPodcastParser *)self elementCharBuffer];
          [v28 durationWithHMSString:v29];
          objc_msgSend(v16, "setDuration:");
        }
        goto LABEL_74;
      }
      int v30 = [v65 isEqualToString:@"author"];
      uint64_t v17 = v65;
      if (v30)
      {
        uint64_t v18 = [(IMPodcastParser *)self elementCharBufferTrimmed];
        [v16 setAuthor:v18];
        goto LABEL_74;
      }
    }
    if (v11)
    {
      if ([v17 isEqualToString:@"pubDate"])
      {
        uint64_t v18 = [(IMPodcastParser *)self elementCharBuffer];
        v31 = [(IMPodcastParser *)self dateFromRSSDateString:v18];
        [v16 setPubDate:v31];

        goto LABEL_74;
      }
      int v41 = [v65 isEqualToString:@"link"];
      uint64_t v17 = v65;
      if (v41)
      {
        uint64_t v18 = [(IMPodcastParser *)self elementCharBufferTrimmed];
        [v16 setWebpageURL:v18];
        goto LABEL_74;
      }
    }
    if (v9)
    {
      if ([v17 isEqualToString:@"category"])
      {
        v42 = [v16 category];

        if (v42) {
          [(IMPodcastParser *)self setPreferredItemCategoryFound:1];
        }
        goto LABEL_75;
      }
      if ([v65 isEqualToString:@"summary"])
      {
        uint64_t v18 = [(IMPodcastParser *)self elementCharBufferTrimmed];
        if (![v18 length]) {
          goto LABEL_74;
        }
        [v16 setItemSummary:v18];
        v45 = @"summary";
LABEL_69:
        [v16 setItemSummarySourceElement:v45];
        goto LABEL_74;
      }
      int v46 = [v65 isEqualToString:@"subtitle"];
      uint64_t v17 = v65;
      if (v46)
      {
        uint64_t v47 = [v16 itemSummary];
        if (!v47
          || (v48 = (void *)v47,
              [v16 itemSummarySourceElement],
              v49 = objc_claimAutoreleasedReturnValue(),
              int v50 = [v49 isEqualToString:@"description"],
              v49,
              v48,
              uint64_t v17 = v65,
              v50))
        {
          uint64_t v18 = [(IMPodcastParser *)self elementCharBufferTrimmed];
          if (![v18 length]) {
            goto LABEL_74;
          }
          [v16 setItemSummary:v18];
          v45 = @"subtitle";
          goto LABEL_69;
        }
      }
    }
    if (v10 && [v17 isEqualToString:@"encoded"])
    {
      uint64_t v18 = [(IMPodcastParser *)self elementCharBufferTrimmed];
      if ([v18 length])
      {
        [v16 setItemDescription:v18];
        [v16 setItemDescriptionSourceElement:@"encoded"];
      }
    }
    else
    {
      if (v11 && [v65 isEqualToString:@"description"])
      {
        v51 = [v16 itemDescription];

        if (!v51)
        {
          v52 = [(IMPodcastParser *)self elementCharBufferTrimmed];
          [v16 setItemDescription:v52];

          [v16 setItemDescriptionSourceElement:@"description"];
        }
        v53 = [v16 itemSummary];

        if (!v53)
        {
          v54 = [(IMPodcastParser *)self elementCharBufferTrimmed];
          [v16 setItemSummary:v54];

          [v16 setItemSummarySourceElement:@"description"];
        }
        goto LABEL_75;
      }
      if (!v9)
      {
LABEL_75:
        if ([(IMPodcastParser *)self itemElementNestCount]) {
          [(IMPodcastParser *)self setItemElementNestCount:[(IMPodcastParser *)self itemElementNestCount] - 1];
        }
        goto LABEL_97;
      }
      if ([v65 isEqualToString:@"order"])
      {
        v55 = [(IMPodcastParser *)self elementCharBuffer];
        uint64_t v56 = [v55 intValue];

        if ((v56 - 1) <= 0x7FFE) {
          [v16 setTrackNum:v56];
        }
        goto LABEL_75;
      }
      if ([v65 isEqualToString:@"explicit"])
      {
        v57 = [(IMPodcastParser *)self elementCharBufferTrimmed];
        uint64_t v18 = [v57 lowercaseString];

        if ([v18 isEqualToString:@"yes"]) {
          [v16 setIsExplicit:1];
        }
      }
      else if ([v65 isEqualToString:@"title"])
      {
        uint64_t v18 = [(IMPodcastParser *)self elementCharBufferTrimmed];
        [v16 setItunesTitle:v18];
      }
      else
      {
        if (![v65 isEqualToString:@"episodeType"])
        {
          if ([v65 isEqualToString:@"season"])
          {
            v61 = [(IMPodcastParser *)self elementCharBuffer];
            uint64_t v62 = [v61 longLongValue];

            if ((unint64_t)(v62 - 1) <= 0x7FFFFFFFFFFFFFFDLL) {
              [v16 setSeasonNumber:v62];
            }
          }
          else if ([v65 isEqualToString:@"episode"])
          {
            v63 = [(IMPodcastParser *)self elementCharBuffer];
            uint64_t v64 = [v63 longLongValue];

            if ((unint64_t)(v64 - 1) <= 0x7FFFFFFFFFFFFFFDLL) {
              [v16 setEpisodeNumber:v64];
            }
          }
          goto LABEL_75;
        }
        uint64_t v18 = [(IMPodcastParser *)self elementCharBufferTrimmed];
        [v16 setEpisodeType:v18];
      }
    }
LABEL_74:

    goto LABEL_75;
  }
  if (v9)
  {
    if ([v65 isEqualToString:@"author"])
    {
      v16 = [(IMPodcastParser *)self elementCharBufferTrimmed];
      char v19 = [(IMPodcastParser *)self parsedFeed];
      [v19 setAuthor:v16];
      goto LABEL_96;
    }
    if ([v65 isEqualToString:@"provider"])
    {
      v16 = [(IMPodcastParser *)self elementCharBufferTrimmed];
      char v19 = [(IMPodcastParser *)self parsedFeed];
      [v19 setProvider:v16];
      goto LABEL_96;
    }
    if ([v65 isEqualToString:@"summary"])
    {
      v34 = [(IMPodcastParser *)self elementCharBuffer];
      char v35 = [v34 isWhitespace];

      if (v35) {
        goto LABEL_98;
      }
      uint64_t v36 = [(IMPodcastParser *)self parsedFeed];
      uint64_t v37 = [v36 feedDescription];
      if (v37)
      {
        v38 = (void *)v37;
        v39 = [(IMPodcastParser *)self feedDescriptionSourceElement];
        int v40 = [v39 isEqualToString:@"description"];

        if (!v40) {
          goto LABEL_98;
        }
      }
      else
      {
      }
      int v25 = @"summary";
LABEL_95:
      [(IMPodcastParser *)self setFeedDescriptionSourceElement:v25];
      v16 = [(IMPodcastParser *)self elementCharBufferTrimmed];
      char v19 = [(IMPodcastParser *)self parsedFeed];
      [v19 setFeedDescription:v16];
      goto LABEL_96;
    }
    if ([v65 isEqualToString:@"category"])
    {
      v43 = [(IMPodcastParser *)self parsedFeed];
      v44 = [v43 category];

      if (v44) {
        [(IMPodcastParser *)self setPreferredFeedCategoryFound:1];
      }
      goto LABEL_98;
    }
    if ([v65 isEqualToString:@"new-feed-url"])
    {
      v16 = [(IMPodcastParser *)self elementCharBufferTrimmed];
      char v19 = [(IMPodcastParser *)self parsedFeed];
      [v19 setUpdatedFeedURL:v16];
      goto LABEL_96;
    }
    if ([v65 isEqualToString:@"title"])
    {
      v58 = [(IMPodcastParser *)self parsedFeed];
      v59 = [v58 title];

      if (v59) {
        goto LABEL_98;
      }
      v16 = [(IMPodcastParser *)self elementCharBufferTrimmed];
LABEL_40:
      char v19 = [(IMPodcastParser *)self parsedFeed];
      [v19 setTitle:v16];
      goto LABEL_96;
    }
    if ([v65 isEqualToString:@"explicit"])
    {
      v60 = [(IMPodcastParser *)self elementCharBufferTrimmed];
      v16 = [v60 lowercaseString];

      if (![v16 isEqualToString:@"yes"]) {
        goto LABEL_97;
      }
      char v19 = [(IMPodcastParser *)self parsedFeed];
      [v19 setIsExplicit:1];
LABEL_96:

LABEL_97:
      goto LABEL_98;
    }
    if ([v65 isEqualToString:@"type"])
    {
      v16 = [(IMPodcastParser *)self elementCharBufferTrimmed];
      char v19 = [(IMPodcastParser *)self parsedFeed];
      [v19 setShowType:v16];
      goto LABEL_96;
    }
  }
  else
  {
    if (!v11) {
      goto LABEL_98;
    }
    if ([v65 isEqualToString:@"description"])
    {
      int v21 = [(IMPodcastParser *)self elementCharBuffer];
      char v22 = [v21 isWhitespace];

      if ((v22 & 1) == 0)
      {
        id v23 = [(IMPodcastParser *)self parsedFeed];
        v24 = [v23 feedDescription];

        if (!v24)
        {
          int v25 = @"description";
          goto LABEL_95;
        }
      }
    }
    else
    {
      if ([v65 isEqualToString:@"title"])
      {
        v16 = [(IMPodcastParser *)self elementCharBufferTrimmed];
        if (![v16 length]) {
          goto LABEL_97;
        }
        id v32 = [(IMPodcastParser *)self parsedFeed];
        uint64_t v33 = [v32 title];

        if (v33) {
          goto LABEL_97;
        }
        goto LABEL_40;
      }
      if ([v65 isEqualToString:@"link"])
      {
        v16 = [(IMPodcastParser *)self elementCharBufferTrimmed];
        char v19 = [(IMPodcastParser *)self parsedFeed];
        [v19 setWebpageURL:v16];
        goto LABEL_96;
      }
      if ([v65 isEqualToString:@"image"]) {
        self->_inGlobalImageElement = 0;
      }
    }
  }
LABEL_98:
  [(IMPodcastParser *)self endBufferingElementChars];
}

- (void)atomParser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v35 = a4;
  id v8 = a5;
  BOOL v9 = +[IMPodcastParser isITunesNamespace:v8];
  if (v8)
  {
    int v10 = [v8 isWhitespace];
    if (![(IMPodcastParser *)self itemElementNestCount])
    {
      if (!v10) {
        goto LABEL_22;
      }
      goto LABEL_16;
    }
LABEL_7:
    int v11 = [(IMPodcastParser *)self parsedFeed];
    id v12 = [v11 items];
    id v13 = [v12 lastObject];

    if ([(IMPodcastParser *)self itemElementNestCount] == 2)
    {
      int v14 = v35;
      if (v10)
      {
        if ([v35 isEqualToString:@"title"])
        {
          id v15 = [(IMPodcastParser *)self elementCharBufferTrimmed];
          [v13 setTitle:v15];
LABEL_40:

          goto LABEL_41;
        }
        int v29 = [v35 isEqualToString:@"id"];
        int v14 = v35;
        if (v29)
        {
          id v15 = [(IMPodcastParser *)self elementCharBufferTrimmed];
          [v13 setGuid:v15];
          goto LABEL_40;
        }
      }
      if (v9 && [v14 isEqualToString:@"author"])
      {
        int v30 = [v13 author];
        char v31 = [v30 isNotWhitespace];

        if (v31) {
          goto LABEL_41;
        }
        goto LABEL_33;
      }
      if (!v10) {
        goto LABEL_41;
      }
      if ([v35 isEqualToString:@"published"])
      {
        id v15 = [(IMPodcastParser *)self elementCharBuffer];
        id v32 = [(IMPodcastParser *)self dateFromAtomDateString:v15];
        [v13 setPubDate:v32];

        goto LABEL_40;
      }
      if (![v35 isEqualToString:@"summary"])
      {
        if ([v35 isEqualToString:@"entry"])
        {
          [(IMPodcastParser *)self setItemElementNestCount:0];
          [(IMPodcastParser *)self postProcessItemElement:v13];
        }
        goto LABEL_41;
      }
      uint64_t v33 = [v13 itemDescription];
      char v34 = [v33 isNotWhitespace];

      if ((v34 & 1) == 0)
      {
        id v15 = [(IMPodcastParser *)self elementCharBufferTrimmed];
        [v13 setItemDescription:v15];
        goto LABEL_40;
      }
    }
    else if ([(IMPodcastParser *)self itemElementNestCount] == 3 {
           && ([(IMPodcastParser *)self inAuthorElement] & v10) == 1)
    }
    {
      if (![v35 isEqualToString:@"name"])
      {
        if ([v35 isEqualToString:@"author"]) {
          [(IMPodcastParser *)self setInAuthorElement:0];
        }
        goto LABEL_41;
      }
LABEL_33:
      id v15 = [(IMPodcastParser *)self elementCharBufferTrimmed];
      [v13 setAuthor:v15];
      goto LABEL_40;
    }
LABEL_41:
    if ([(IMPodcastParser *)self itemElementNestCount]) {
      [(IMPodcastParser *)self setItemElementNestCount:[(IMPodcastParser *)self itemElementNestCount] - 1];
    }
    goto LABEL_49;
  }
  if ([(IMPodcastParser *)self itemElementNestCount])
  {
    int v10 = 1;
    goto LABEL_7;
  }
LABEL_16:
  if ([v35 isEqualToString:@"title"])
  {
    v16 = [(IMPodcastParser *)self elementCharBuffer];
    char v17 = [v16 isWhitespace];

    if ((v17 & 1) == 0)
    {
      uint64_t v18 = [(IMPodcastParser *)self parsedFeed];
      char v19 = [v18 feedDescription];

      if (!v19)
      {
        int v20 = @"title";
LABEL_47:
        [(IMPodcastParser *)self setFeedDescriptionSourceElement:v20];
        id v13 = [(IMPodcastParser *)self elementCharBufferTrimmed];
        int v21 = [(IMPodcastParser *)self parsedFeed];
        [v21 setFeedDescription:v13];
        goto LABEL_48;
      }
    }
    goto LABEL_50;
  }
  if ([v35 isEqualToString:@"logo"])
  {
    id v13 = [(IMPodcastParser *)self elementCharBufferTrimmed];
    int v21 = [(IMPodcastParser *)self parsedFeed];
    [v21 setImageURL:v13];
LABEL_48:

LABEL_49:
    goto LABEL_50;
  }
LABEL_22:
  if (v9)
  {
    if ([v35 isEqualToString:@"summary"])
    {
      char v22 = [(IMPodcastParser *)self elementCharBuffer];
      char v23 = [v22 isWhitespace];

      if ((v23 & 1) == 0)
      {
        v24 = [(IMPodcastParser *)self parsedFeed];
        uint64_t v25 = [v24 feedDescription];
        if (v25)
        {
          int v26 = (void *)v25;
          uint64_t v27 = [(IMPodcastParser *)self feedDescriptionSourceElement];
          int v28 = [v27 isEqualToString:@"title"];

          if (!v28) {
            goto LABEL_50;
          }
        }
        else
        {
        }
        int v20 = @"summary";
        goto LABEL_47;
      }
    }
  }
LABEL_50:
  [(IMPodcastParser *)self endBufferingElementChars];
}

- (void)postProcessItemElement:(id)a3
{
  id v16 = a3;
  uint64_t v4 = [v16 guid];
  if (![v4 length])
  {
    int v11 = [v16 enclosureURL];

    if (!v11) {
      goto LABEL_3;
    }
    id v12 = [v16 enclosureParameterString];

    if (v12)
    {
      id v13 = NSString;
      uint64_t v4 = [v16 enclosureURL];
      int v14 = [v16 enclosureParameterString];
      id v15 = [v13 stringWithFormat:@"%@?%@", v4, v14];
      [v16 setGuid:v15];
    }
    else
    {
      uint64_t v4 = [v16 enclosureURL];
      [v16 setGuid:v4];
    }
  }

LABEL_3:
  uint64_t v5 = [v16 title];
  if (!v5
    || (id v6 = (void *)v5,
        [v16 title],
        tm v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isWhitespace],
        v7,
        v6,
        v8))
  {
    BOOL v9 = [(IMPodcastParser *)self parsedFeed];
    int v10 = [v9 items];
    [v10 removeObject:v16];
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v6 = a4;
  if ([(IMPodcastParser *)self shouldBufferElementChars])
  {
    uint64_t v5 = [(IMPodcastParser *)self elementCharBuffer];
    [v5 appendString:v6];
  }
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
}

+ (BOOL)isITunesNamespace:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"http://www.itunes.com/dtds/podcast-1.0.dtd"] & 1) != 0
    || ([v3 isEqualToString:@"http://www.itunes.com/DTDs/Podcast-1.0.dtd"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"http://www.itunes.com/DTDs/PodCast-1.0.dtd"];
  }

  return v4;
}

+ (BOOL)isContentNamespace:(id)a3
{
  return [a3 isEqualToString:@"http://purl.org/rss/1.0/modules/content/"];
}

- (void)startBufferingElementChars
{
  if ([(IMPodcastParser *)self shouldBufferElementChars]) {
    [(IMPodcastParser *)self endBufferingElementChars];
  }
  [(IMPodcastParser *)self setShouldBufferElementChars:1];
  id v3 = [MEMORY[0x1E4F28E78] string];
  [(IMPodcastParser *)self setElementCharBuffer:v3];
}

- (void)endBufferingElementChars
{
}

- (id)elementCharBufferTrimmed
{
  id v2 = [(IMPodcastParser *)self elementCharBuffer];
  id v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  char v4 = objc_msgSend(v2, "im_stringByMemoryEfficientTrimmingCharactersInSet:", v3);

  return v4;
}

- (NSError)parseError
{
  return self->_parseError;
}

- (void)setParseError:(id)a3
{
}

- (IMPodcastFeed)parsedFeed
{
  return self->_parsedFeed;
}

- (void)setParsedFeed:(id)a3
{
}

- (NSDateFormatter)rssDateFormatter
{
  return self->_rssDateFormatter;
}

- (void)setRssDateFormatter:(id)a3
{
}

- (BOOL)shouldBufferElementChars
{
  return self->_shouldBufferElementChars;
}

- (void)setShouldBufferElementChars:(BOOL)a3
{
  self->_shouldBufferElementChars = a3;
}

- (NSMutableString)elementCharBuffer
{
  return self->_elementCharBuffer;
}

- (void)setElementCharBuffer:(id)a3
{
}

- (unint64_t)itemElementNestCount
{
  return self->_itemElementNestCount;
}

- (void)setItemElementNestCount:(unint64_t)a3
{
  self->_itemElementNestCount = a3;
}

- (BOOL)inAuthorElement
{
  return self->_inAuthorElement;
}

- (void)setInAuthorElement:(BOOL)a3
{
  self->_inAuthorElement = a3;
}

- (NSString)feedDescriptionSourceElement
{
  return self->_feedDescriptionSourceElement;
}

- (void)setFeedDescriptionSourceElement:(id)a3
{
}

- (BOOL)preferredFeedCategoryFound
{
  return self->_preferredFeedCategoryFound;
}

- (void)setPreferredFeedCategoryFound:(BOOL)a3
{
  self->_preferredFeedCategoryFound = a3;
}

- (BOOL)preferredItemCategoryFound
{
  return self->_preferredItemCategoryFound;
}

- (void)setPreferredItemCategoryFound:(BOOL)a3
{
  self->_preferredItemCategoryFound = a3;
}

- (int64_t)feedType
{
  return self->_feedType;
}

- (void)setFeedType:(int64_t)a3
{
  self->_feedType = a3;
}

- (BOOL)inGlobalImageElement
{
  return self->_inGlobalImageElement;
}

- (void)setInGlobalImageElement:(BOOL)a3
{
  self->_inGlobalImageElement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parseError, 0);
  objc_storeStrong((id *)&self->_feedDescriptionSourceElement, 0);
  objc_storeStrong((id *)&self->_elementCharBuffer, 0);
  objc_storeStrong((id *)&self->_rssDateFormatter, 0);
  objc_storeStrong((id *)&self->_parsedFeed, 0);
}

@end