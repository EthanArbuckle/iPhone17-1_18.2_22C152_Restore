@interface SUMediaPlayerItem
- (NSArray)downloadPingURLs;
- (NSArray)playbackPingURLs;
- (NSString)bookmarkIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)URL;
- (NSURL)backgroundImageURL;
- (SUMediaPlayerItem)initWithItem:(id)a3;
- (double)bookmarkedStartTime;
- (double)playableDuration;
- (id)_newPingURLsWithArray:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)initialOrientation;
- (int64_t)itemType;
- (unint64_t)itemIdentifier;
- (void)dealloc;
- (void)resetBookmarkedStartTime;
- (void)setBackgroundImageURL:(id)a3;
- (void)setBookmarkIdentifier:(id)a3;
- (void)setBookmarkedStartTime:(double)a3;
- (void)setDownloadPingURLs:(id)a3;
- (void)setInitialOrientation:(int64_t)a3;
- (void)setItemIdentifier:(unint64_t)a3;
- (void)setItemType:(int64_t)a3;
- (void)setPlayableDuration:(double)a3;
- (void)setPlaybackPingURLs:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation SUMediaPlayerItem

- (SUMediaPlayerItem)initWithItem:(id)a3
{
  if (!a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Must have item"];
  }
  v16.receiver = self;
  v16.super_class = (Class)SUMediaPlayerItem;
  v5 = [(SUMediaPlayerItem *)&v16 init];
  if (v5)
  {
    v5->_bookmarkIdentifier = (NSString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%llu", objc_msgSend(a3, "itemIdentifier"));
    v5->_itemIdentifier = [a3 itemIdentifier];
    v5->_itemType = [a3 itemType];
    v5->_subtitle = (NSString *)(id)[a3 artistName];
    v5->_title = (NSString *)(id)[a3 unmodifiedTitle];
    if (SUItemTypeIsVideoType(v5->_itemType))
    {
      uint64_t v6 = 3;
    }
    else
    {
      v7 = (void *)[a3 itemMediaKind];
      int v8 = [v7 isEqualToString:*MEMORY[0x263F7B968]];
      uint64_t v6 = 3;
      if (!v8) {
        uint64_t v6 = 1;
      }
    }
    v5->_initialOrientation = v6;
    v9 = (void *)[a3 valueForProperty:@"pings"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = -[SUMediaPlayerItem _newPingURLsWithArray:](v5, "_newPingURLsWithArray:", [v9 objectForKey:@"download"]);
      v5->_downloadPingURLs = (NSArray *)[v10 copy];

      id v11 = -[SUMediaPlayerItem _newPingURLsWithArray:](v5, "_newPingURLsWithArray:", [v9 objectForKey:@"play"]);
      v5->_playbackPingURLs = (NSArray *)[v11 copy];
    }
    v12 = objc_msgSend((id)objc_msgSend(a3, "defaultStoreOffer"), "offerMedia");
    uint64_t v13 = [a3 itemType];
    v14 = (void *)[v12 URL];
    if (v13 != 1007) {
      v5->_playableDuration = (double)[v12 durationInMilliseconds] / 1000.0;
    }
    v5->_url = (NSURL *)v14;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUMediaPlayerItem;
  [(SUMediaPlayerItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = [(NSURL *)self->_backgroundImageURL copyWithZone:a3];
  *(void *)(v5 + 16) = [(NSString *)self->_bookmarkIdentifier copyWithZone:a3];
  *(void *)(v5 + 24) = [(NSArray *)self->_downloadPingURLs copyWithZone:a3];
  *(void *)(v5 + 32) = self->_initialOrientation;
  *(_OWORD *)(v5 + 40) = *(_OWORD *)&self->_itemIdentifier;
  *(double *)(v5 + 64) = self->_playableDuration;
  *(void *)(v5 + 56) = [(NSArray *)self->_playbackPingURLs copyWithZone:a3];
  *(void *)(v5 + 72) = [(NSString *)self->_subtitle copyWithZone:a3];
  *(void *)(v5 + 80) = [(NSString *)self->_title copyWithZone:a3];
  *(void *)(v5 + 88) = [(NSURL *)self->_url copyWithZone:a3];
  return (id)v5;
}

- (double)bookmarkedStartTime
{
  if (!self->_bookmarkIdentifier) {
    return 0.0;
  }
  objc_super v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"MSStreamStartTimes");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0.0;
  }
  v4 = (void *)[v3 objectForKey:self->_bookmarkIdentifier];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0.0;
  }

  [v4 doubleValue];
  return result;
}

- (void)resetBookmarkedStartTime
{
}

- (void)setBookmarkedStartTime:(double)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (self->_bookmarkIdentifier)
  {
    uint64_t v5 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
    id v6 = (id)objc_msgSend((id)objc_msgSend(v5, "objectForKey:", @"MSStreamStartTimes"), "mutableCopy");
    if (!v6) {
      id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v9 &= 2u;
    }
    if (a3 >= 2.22044605e-16)
    {
      if (v9)
      {
        uint64_t v15 = objc_opt_class();
        bookmarkIdentifier = self->_bookmarkIdentifier;
        int v22 = 138412802;
        uint64_t v23 = v15;
        __int16 v24 = 2048;
        double v25 = a3;
        __int16 v26 = 2112;
        v27 = bookmarkIdentifier;
        LODWORD(v21) = 32;
        v20 = &v22;
        uint64_t v17 = _os_log_send_and_compose_impl();
        if (v17)
        {
          v18 = (void *)v17;
          uint64_t v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v22, v21);
          free(v18);
          v20 = (int *)v19;
          SSFileLog();
        }
      }
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", a3, v20), self->_bookmarkIdentifier);
    }
    else
    {
      if (v9)
      {
        uint64_t v10 = objc_opt_class();
        id v11 = self->_bookmarkIdentifier;
        int v22 = 138412546;
        uint64_t v23 = v10;
        __int16 v24 = 2112;
        double v25 = *(double *)&v11;
        LODWORD(v21) = 22;
        v20 = &v22;
        uint64_t v12 = _os_log_send_and_compose_impl();
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v22, v21);
          free(v13);
          v20 = (int *)v14;
          SSFileLog();
        }
      }
      objc_msgSend(v6, "removeObjectForKey:", self->_bookmarkIdentifier, v20);
    }
    [v5 setObject:v6 forKey:@"MSStreamStartTimes"];
    [v5 synchronize];
  }
}

- (id)_newPingURLsWithArray:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(a3);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v10 = [objc_alloc(NSURL) initWithString:v9];
            if (v10)
            {
              id v11 = (void *)v10;
              [v4 addObject:v10];
            }
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  return v4;
}

- (NSURL)backgroundImageURL
{
  return self->_backgroundImageURL;
}

- (void)setBackgroundImageURL:(id)a3
{
}

- (NSString)bookmarkIdentifier
{
  return self->_bookmarkIdentifier;
}

- (void)setBookmarkIdentifier:(id)a3
{
}

- (NSArray)downloadPingURLs
{
  return self->_downloadPingURLs;
}

- (void)setDownloadPingURLs:(id)a3
{
}

- (int64_t)initialOrientation
{
  return self->_initialOrientation;
}

- (void)setInitialOrientation:(int64_t)a3
{
  self->_initialOrientation = a3;
}

- (unint64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(unint64_t)a3
{
  self->_itemIdentifier = a3;
}

- (int64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(int64_t)a3
{
  self->_itemType = a3;
}

- (double)playableDuration
{
  return self->_playableDuration;
}

- (void)setPlayableDuration:(double)a3
{
  self->_playableDuration = a3;
}

- (NSArray)playbackPingURLs
{
  return self->_playbackPingURLs;
}

- (void)setPlaybackPingURLs:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
}

@end