@interface SSItem
- (BOOL)isCompilation;
- (BOOL)isGameCenterEnabled;
- (BOOL)isHighDefinition;
- (BOOL)isRestricted;
- (NSArray)allItemOffers;
- (NSArray)thumbnailImages;
- (NSDate)expirationDate;
- (NSNumber)ITunesStoreIdentifier;
- (NSString)artistName;
- (NSString)description;
- (NSString)itemKind;
- (NSString)itemTitle;
- (NSURL)viewItemURL;
- (SSItem)initWithItemDictionary:(id)a3;
- (SSItemImageCollection)imageCollection;
- (SSItemOffer)defaultItemOffer;
- (float)averageUserRating;
- (id)_offers;
- (id)_tellAFriendDictionary;
- (id)artistIdentifier;
- (id)bundleIdentifier;
- (id)bundleVersion;
- (id)buyParameters;
- (id)collectionArtistName;
- (id)collectionIdentifier;
- (id)collectionIndexInCollectionGroup;
- (id)collectionName;
- (id)composerName;
- (id)contentRating;
- (id)episodeIdentifier;
- (id)episodeSortIdentifier;
- (id)genreIdentifier;
- (id)genreName;
- (id)indexInCollection;
- (id)itemOfferForIdentifier:(id)a3;
- (id)longDescription;
- (id)mediaKind;
- (id)networkName;
- (id)numberOfCollectionsInCollectionGroup;
- (id)numberOfItemsInCollection;
- (id)playableMedia;
- (id)podcastEpisodeGUID;
- (id)podcastFeedURL;
- (id)preOrderIdentifier;
- (id)priceDisplay;
- (id)rawItemDictionary;
- (id)relatedItemsForRelationType:(id)a3;
- (id)releaseDate;
- (id)releaseDateString;
- (id)seasonNumber;
- (id)sendGiftURL;
- (id)seriesName;
- (id)shortDescription;
- (id)softwareType;
- (id)tellAFriendBody;
- (id)tellAFriendBodyMIMEType;
- (id)tellAFriendBodyURL;
- (id)tellAFriendSubject;
- (id)tweetInitialText;
- (id)tweetURL;
- (id)valueForProperty:(id)a3;
- (id)videoDetails;
- (id)viewReviewsURL;
- (int64_t)numberOfPrintedPages;
- (int64_t)numberOfUserRatings;
- (void)_finishTellAFriendLoadWithError:(id)a3;
- (void)_setExpirationDate:(id)a3;
- (void)dealloc;
- (void)loadTellAFriendMessageWithCompletionHandler:(id)a3;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)requestDidFinish:(id)a3;
- (void)urlConnectionRequest:(id)a3 didReceiveResponse:(id)a4;
@end

@implementation SSItem

- (void)dealloc
{
  [(NSArray *)self->_offers makeObjectsPerformSelector:sel__setOfferItem_ withObject:0];

  [(SSRequest *)self->_tellAFriendRequest setDelegate:0];
  [(SSRequest *)self->_tellAFriendRequest cancel];

  v3.receiver = self;
  v3.super_class = (Class)SSItem;
  [(SSItem *)&v3 dealloc];
}

- (NSArray)allItemOffers
{
  id v2 = [(SSItem *)self _offers];
  return (NSArray *)v2;
}

- (NSString)artistName
{
  id v3 = [(SSItem *)self valueForProperty:@"artist-name"];
  if (!v3) {
    id v3 = (id)objc_msgSend(-[SSItem valueForProperty:](self, "valueForProperty:", @"company"), "objectForKey:", @"title");
  }
  id v4 = v3;
  return (NSString *)v4;
}

- (float)averageUserRating
{
  id v2 = [(SSItem *)self valueForProperty:@"average-user-rating"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0.0;
  }
  [v2 floatValue];
  return result;
}

- (SSItemOffer)defaultItemOffer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = +[SSItemOffer _preferredOfferIdentifiers];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v3);
      }
      float result = [(SSItem *)self itemOfferForIdentifier:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
      if (result) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v9 = [(SSItem *)self _offers];
    float result = (SSItemOffer *)[v9 count];
    if (result) {
      return (SSItemOffer *)(id)[v9 objectAtIndex:0];
    }
  }
  return result;
}

- (SSItemImageCollection)imageCollection
{
  id v2 = [(SSItem *)self valueForProperty:@"artwork-urls"];
  id v3 = (SSItemImageCollection *)[v2 count];
  if (v3) {
    id v3 = [[SSItemImageCollection alloc] initWithImageCollection:v2];
  }
  return v3;
}

- (BOOL)isGameCenterEnabled
{
  id v2 = [(SSItem *)self valueForProperty:@"game-center-enabled"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (BOOL)isRestricted
{
  uint64_t v3 = 1000;
  id v4 = [(SSItem *)self valueForProperty:@"rating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (void *)[v4 objectForKey:@"rank"];
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (int)[v5 intValue];
    }
  }
  uint64_t v6 = [(SSItem *)self itemKind];
  if ([(NSString *)v6 isEqualToString:@"software"]
    || [(NSString *)v6 isEqualToString:@"newsstand"])
  {
    uint64_t v7 = (void *)SBSCopyDisplayIdentifiers();
    int v8 = [v7 containsObject:@"com.apple.AppStore"];
    unint64_t v9 = 0;
    goto LABEL_7;
  }
  if ([(NSString *)v6 isEqualToString:@"movie"])
  {
    uint64_t v7 = (void *)SBSCopyDisplayIdentifiers();
    int v8 = [v7 containsObject:@"com.apple.MobileStore"];
    unint64_t v9 = 1;
    goto LABEL_7;
  }
  if ([(NSString *)v6 isEqualToString:@"tv-episode"]
    || [(NSString *)v6 isEqualToString:@"tv-season"])
  {
    uint64_t v7 = (void *)SBSCopyDisplayIdentifiers();
    int v8 = [v7 containsObject:@"com.apple.MobileStore"];
    unint64_t v9 = 2;
LABEL_7:

    id v10 = SSRestrictionsCopyRankForMediaType(v9);
    if (v10)
    {
      long long v11 = v10;
      if (v8) {
        LOBYTE(v12) = [v10 integerValue] < v3;
      }
      else {
        LOBYTE(v12) = 1;
      }
    }
    else
    {
      LOBYTE(v12) = v8 ^ 1;
    }
    return v12;
  }
  if (![(NSString *)v6 isEqualToString:@"album"]
    && ![(NSString *)v6 isEqualToString:@"mix"]
    && ![(NSString *)v6 isEqualToString:@"podcast"]
    && ![(NSString *)v6 isEqualToString:@"podcast-episode"]
    && ![(NSString *)v6 isEqualToString:@"music-video"]
    && ![(NSString *)v6 isEqualToString:@"song"])
  {
    if ([(NSString *)v6 isEqualToString:@"artist"]
      || [(NSString *)v6 isEqualToString:@"audiobook"]
      || [(NSString *)v6 isEqualToString:@"booklet"])
    {
      return SSApplicationWithIdentifierIsAvailable(@"com.apple.MobileStore") ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
    return v12;
  }
  v14 = (void *)SBSCopyDisplayIdentifiers();
  int v15 = [v14 containsObject:@"com.apple.MobileStore"];

  if (v3 == 200) {
    LOBYTE(v12) = 1;
  }
  else {
    LOBYTE(v12) = v15 ^ 1;
  }
  if (v3 != 200 || !v15) {
    return v12;
  }
  return MGGetBoolAnswer();
}

- (BOOL)isHighDefinition
{
  id v2 = [(SSItem *)self valueForProperty:@"high-definition"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (NSString)itemKind
{
  id v3 = [(SSItem *)self valueForProperty:@"type"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if ([v3 isEqualToString:@"link"])
  {
    id v4 = [(SSItem *)self valueForProperty:@"link-type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return v4;
    }
  }
  return (NSString *)v3;
}

- (id)itemOfferForIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid offer identifier"];
  }
  id v5 = [(SSItem *)self _offers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id result = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      unint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_msgSend((id)objc_msgSend(v10, "offerIdentifier"), "isEqualToString:", a3)) {
          return v10;
        }
        unint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id result = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v7 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (NSString)itemTitle
{
  id result = [(SSItem *)self valueForProperty:@"unmodified-title"];
  if (!result)
  {
    return (NSString *)[(SSItem *)self valueForProperty:@"title"];
  }
  return result;
}

- (NSNumber)ITunesStoreIdentifier
{
  id v2 = NSNumber;
  uint64_t v3 = SSGetItemIdentifierFromValue([(SSItem *)self valueForProperty:@"item-id"]);
  return (NSNumber *)[v2 numberWithUnsignedLongLong:v3];
}

- (void)loadTellAFriendMessageWithCompletionHandler:(id)a3
{
  if ([(SSItem *)self tellAFriendBody])
  {
    if (!a3) {
      return;
    }
    id v5 = self;
    uint64_t v6 = (void (*)(id, uint64_t))*((void *)a3 + 2);
    id v7 = a3;
    uint64_t v8 = 0;
LABEL_17:
    v6(v7, v8);
    return;
  }
  uint64_t v9 = objc_msgSend(-[SSItem _tellAFriendDictionary](self, "_tellAFriendDictionary"), "objectForKey:", @"body-url");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v9]) == 0)
  {
    if (!a3) {
      return;
    }
    int v15 = self;
    uint64_t v8 = SSError(@"SSErrorDomain", 106, 0, 0);
    uint64_t v6 = (void (*)(id, uint64_t))*((void *)a3 + 2);
    id v7 = a3;
    goto LABEL_17;
  }
  id v16 = (id)v10;
  if (!self->_tellAFriendHandlers) {
    self->_tellAFriendHandlers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v11 = [a3 copy];
  if (v11)
  {
    long long v12 = (void *)v11;
    [(NSMutableArray *)self->_tellAFriendHandlers addObject:v11];
  }
  if (!self->_tellAFriendRequest)
  {
    long long v13 = objc_alloc_init(SSMutableURLRequestProperties);
    [(SSMutableURLRequestProperties *)v13 setITunesStoreRequest:1];
    [(SSMutableURLRequestProperties *)v13 setURL:v16];
    long long v14 = [[SSURLConnectionRequest alloc] initWithRequestProperties:v13];
    self->_tellAFriendRequest = v14;
    [(SSRequest *)v14 setDelegate:self];
    [(SSRequest *)self->_tellAFriendRequest setShouldCancelAfterTaskExpiration:1];
    [(SSURLConnectionRequest *)self->_tellAFriendRequest start];
  }
}

- (int64_t)numberOfPrintedPages
{
  id v2 = [(SSItem *)self valueForProperty:@"number-of-pages"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 integerValue];
}

- (int64_t)numberOfUserRatings
{
  id v2 = [(SSItem *)self valueForProperty:@"user-rating-count"];
  if (objc_opt_respondsToSelector()) {
    return (int)[v2 intValue];
  }
  else {
    return 0;
  }
}

- (id)relatedItemsForRelationType:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [(NSDictionary *)self->_properties objectForKey:@"related-items"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = (void *)[v4 objectForKey:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v12 = [[SSItem alloc] initWithItemDictionary:v11];
          if (v12)
          {
            long long v13 = v12;
            [v6 addObject:v12];
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  return v6;
}

- (id)tellAFriendBody
{
  tellAFriendBody = self->_tellAFriendBody;
  if (!tellAFriendBody)
  {
    id v4 = objc_msgSend(-[SSItem _tellAFriendDictionary](self, "_tellAFriendDictionary"), "objectForKey:", @"body");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      tellAFriendBody = v4;
      self->_tellAFriendBody = tellAFriendBody;
    }
    else
    {
      tellAFriendBody = self->_tellAFriendBody;
    }
  }
  id v5 = tellAFriendBody;
  return v5;
}

- (id)tellAFriendBodyMIMEType
{
  tellAFriendBodyMIMEType = self->_tellAFriendBodyMIMEType;
  if (!tellAFriendBodyMIMEType)
  {
    id v4 = objc_msgSend(-[SSItem _tellAFriendDictionary](self, "_tellAFriendDictionary"), "objectForKey:", @"body-mime-type");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      tellAFriendBodyMIMEType = v4;
    }
    else {
      tellAFriendBodyMIMEType = (NSString *)[[NSString alloc] initWithString:@"text/plain"];
    }
    self->_tellAFriendBodyMIMEType = tellAFriendBodyMIMEType;
  }
  id v5 = tellAFriendBodyMIMEType;
  return v5;
}

- (id)tellAFriendBodyURL
{
  uint64_t v2 = objc_msgSend(-[SSItem _tellAFriendDictionary](self, "_tellAFriendDictionary"), "objectForKey:", @"body-url");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
  return (id)[v3 URLWithString:v2];
}

- (id)tellAFriendSubject
{
  tellAFriendSubject = self->_tellAFriendSubject;
  if (!tellAFriendSubject)
  {
    id v4 = objc_msgSend(-[SSItem _tellAFriendDictionary](self, "_tellAFriendDictionary"), "objectForKey:", @"subject");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      tellAFriendSubject = v4;
      self->_tellAFriendSubject = tellAFriendSubject;
    }
    else
    {
      tellAFriendSubject = self->_tellAFriendSubject;
    }
  }
  id v5 = tellAFriendSubject;
  return v5;
}

- (NSArray)thumbnailImages
{
  uint64_t v2 = [(SSItem *)self imageCollection];
  return [(SSItemImageCollection *)v2 itemImages];
}

- (id)tweetInitialText
{
  id v2 = [(SSItem *)self valueForProperty:@"tweet-info"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = (void *)[v2 objectForKey:@"text"];
  }
  else {
    uint64_t v3 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v4 = v3;
  return v4;
}

- (id)tweetURL
{
  id v2 = [(SSItem *)self valueForProperty:@"tweet-info"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 objectForKey:@"url"];
  }
  else {
    uint64_t v3 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  return (id)[v4 URLWithString:v3];
}

- (id)valueForProperty:(id)a3
{
  id v3 = [(NSDictionary *)self->_properties objectForKey:a3];
  return v3;
}

- (NSURL)viewItemURL
{
  id result = [(SSItem *)self valueForProperty:@"url"];
  if (result)
  {
    id v3 = result;
    id v4 = (void *)MEMORY[0x1E4F1CB10];
    return (NSURL *)[v4 URLWithString:v3];
  }
  return result;
}

- (id)buyParameters
{
  id v2 = [(SSItem *)self defaultItemOffer];
  return [(SSItemOffer *)v2 buyParameters];
}

- (id)playableMedia
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [(SSItem *)self _offers];
  if (![v2 count]) {
    return 0;
  }
  id v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) playableMedia];
        if (v8) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)priceDisplay
{
  id v2 = [(SSItem *)self defaultItemOffer];
  return [(SSItemOffer *)v2 priceDisplay];
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)SSItem;
  return (NSString *)[NSString stringWithFormat:@"%@: %@", -[SSItem description](&v3, sel_description), -[NSDictionary description](self->_properties, "description")];
}

- (SSItem)initWithItemDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSItem;
  uint64_t v4 = [(SSItem *)&v6 init];
  if (v4) {
    v4->_properties = (NSDictionary *)[a3 copy];
  }
  return v4;
}

- (id)artistIdentifier
{
  return [(SSItem *)self valueForProperty:@"artist-id"];
}

- (id)bundleIdentifier
{
  return [(SSItem *)self valueForProperty:@"bundle-id"];
}

- (id)bundleVersion
{
  return [(SSItem *)self valueForProperty:@"version"];
}

- (id)collectionArtistName
{
  return [(SSItem *)self valueForProperty:@"collection-artist-name"];
}

- (id)collectionIdentifier
{
  return [(SSItem *)self valueForProperty:@"collection-id"];
}

- (id)collectionIndexInCollectionGroup
{
  return [(SSItem *)self valueForProperty:@"disc-number"];
}

- (id)collectionName
{
  return [(SSItem *)self valueForProperty:@"collection-name"];
}

- (id)composerName
{
  return [(SSItem *)self valueForProperty:@"composer-name"];
}

- (id)contentRating
{
  id v2 = [(SSItem *)self valueForProperty:@"rating"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_super v3 = [[SSItemContentRating alloc] initWithDictionary:v2];
  return v3;
}

- (id)episodeIdentifier
{
  return [(SSItem *)self valueForProperty:@"episode-id"];
}

- (id)episodeSortIdentifier
{
  return [(SSItem *)self valueForProperty:@"episode-sort-id"];
}

- (id)genreIdentifier
{
  return [(SSItem *)self valueForProperty:@"genre-id"];
}

- (id)genreName
{
  return [(SSItem *)self valueForProperty:@"genre-name"];
}

- (id)indexInCollection
{
  return [(SSItem *)self valueForProperty:@"track-number"];
}

- (BOOL)isCompilation
{
  id v2 = [(SSItem *)self valueForProperty:@"is-compilation"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (id)longDescription
{
  return [(SSItem *)self valueForProperty:@"description"];
}

- (id)mediaKind
{
  objc_super v3 = [(SSItem *)self itemKind];
  uint64_t v4 = [(SSItemOffer *)[(SSItem *)self defaultItemOffer] offerIdentifier];
  return SSItemMediaKindForItemKind(v3, v4);
}

- (id)networkName
{
  return [(SSItem *)self valueForProperty:@"network-name"];
}

- (id)numberOfCollectionsInCollectionGroup
{
  return [(SSItem *)self valueForProperty:@"disc-count"];
}

- (id)numberOfItemsInCollection
{
  return [(SSItem *)self valueForProperty:@"track-count"];
}

- (id)podcastEpisodeGUID
{
  return [(SSItem *)self valueForProperty:@"episode-guid"];
}

- (id)podcastFeedURL
{
  id result = [(SSItem *)self valueForProperty:@"podcast-feed-url"];
  if (result)
  {
    id v3 = result;
    uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
    return (id)[v4 URLWithString:v3];
  }
  return result;
}

- (id)rawItemDictionary
{
  id v2 = self->_properties;
  return v2;
}

- (id)releaseDate
{
  id v2 = [(SSItem *)self valueForProperty:@"release-date"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZ"];
    uint64_t v4 = (void *)[v3 dateFromString:v2];

    return v4;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return v2;
    }
    else {
      return 0;
    }
  }
}

- (id)releaseDateString
{
  return [(SSItem *)self valueForProperty:@"release-date-string"];
}

- (id)preOrderIdentifier
{
  return [(SSItem *)self valueForProperty:@"preorder-id"];
}

- (id)seasonNumber
{
  return [(SSItem *)self valueForProperty:@"season-number"];
}

- (id)sendGiftURL
{
  id result = (id)objc_msgSend(-[SSItem valueForProperty:](self, "valueForProperty:", @"gifting-button"), "objectForKey:", @"url");
  if (result)
  {
    id v3 = result;
    uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
    return (id)[v4 URLWithString:v3];
  }
  return result;
}

- (id)seriesName
{
  return [(SSItem *)self valueForProperty:@"series-name"];
}

- (void)_setExpirationDate:(id)a3
{
  expirationDate = self->_expirationDate;
  if (expirationDate != a3)
  {

    self->_expirationDate = (NSDate *)a3;
  }
}

- (id)shortDescription
{
  return [(SSItem *)self valueForProperty:@"description"];
}

- (id)softwareType
{
  return [(SSItem *)self valueForProperty:@"software-type"];
}

- (id)videoDetails
{
  return [(SSItem *)self valueForProperty:@"videoDetails"];
}

- (id)viewReviewsURL
{
  id result = [(SSItem *)self valueForProperty:@"view-user-reviews-url"];
  if (result)
  {
    id v3 = result;
    uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
    return (id)[v4 URLWithString:v3];
  }
  return result;
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  if (self->_tellAFriendRequest == a3)
  {
    if (!a4) {
      a4 = (id)SSError(@"SSErrorDomain", 100, 0, 0);
    }
    [(SSItem *)self _finishTellAFriendLoadWithError:a4];
  }
}

- (void)requestDidFinish:(id)a3
{
  if (self->_tellAFriendRequest == a3) {
    [(SSItem *)self _finishTellAFriendLoadWithError:0];
  }
}

- (void)urlConnectionRequest:(id)a3 didReceiveResponse:(id)a4
{
  if (self->_tellAFriendRequest == a3)
  {

    self->_tellAFriendBodyMIMEType = (NSString *)(id)[a4 MIMEType];
    CFStringRef v6 = (const __CFString *)[a4 textEncodingName];
    if (v6) {
      CFStringEncoding v7 = CFStringConvertIANACharSetNameToEncoding(v6);
    }
    else {
      CFStringEncoding v7 = 134217984;
    }

    self->_tellAFriendBody = (NSString *)objc_msgSend([NSString alloc], "initWithData:encoding:", objc_msgSend(a4, "bodyData"), CFStringConvertEncodingToNSStringEncoding(v7));
  }
}

- (void)_finishTellAFriendLoadWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[(NSMutableArray *)self->_tellAFriendHandlers copy];
  [(SSRequest *)self->_tellAFriendRequest setDelegate:0];

  self->_tellAFriendRequest = 0;
  self->_tellAFriendHandlers = 0;
  uint64_t v5 = self;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_offers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id result = self->_offers;
  if (!result)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = [(SSItem *)self valueForProperty:@"store-offers"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = [v5 objectForKey:v10];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v12 = [[SSItemOffer alloc] initWithOfferIdentifier:v10 dictionary:v11];
            if (v12)
            {
              long long v13 = v12;
              [(SSItemOffer *)v12 _setOfferItem:self];
              [v4 addObject:v13];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
    self->_offers = (NSArray *)[v4 copy];

    return self->_offers;
  }
  return result;
}

- (id)_tellAFriendDictionary
{
  id v2 = [(NSDictionary *)self->_properties objectForKey:@"tell-a-friend"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

@end