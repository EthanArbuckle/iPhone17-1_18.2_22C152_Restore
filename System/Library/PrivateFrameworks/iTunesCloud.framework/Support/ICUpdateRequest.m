@interface ICUpdateRequest
+ (id)requestWithDatabaseRevision:(unsigned int)a3;
- (ICUpdateRequest)initWithDatabaseRevision:(unsigned int)a3;
- (id)_bodyDataForDatabaseRevision:(unsigned int)a3;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICUpdateRequest

+ (id)requestWithDatabaseRevision:(unsigned int)a3
{
  id v3 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseRevision:*(void *)&a3];

  return v3;
}

- (id)_bodyDataForDatabaseRevision:(unsigned int)a3
{
  id v3 = ICDAAPUtilitiesCreateData();

  return v3;
}

- (ICUpdateRequest)initWithDatabaseRevision:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(ICDRequest *)self initWithAction:@"update"];
  v5 = v4;
  if (v4)
  {
    [(ICDRequest *)v4 setMethod:1];
    v6 = [(ICUpdateRequest *)v5 _bodyDataForDatabaseRevision:v3];
    [(ICDRequest *)v5 setBodyData:v6];

    [(ICDRequest *)v5 setRequestPersonalizationStyle:2];
  }
  return v5;
}

- (id)canonicalResponseForResponse:(id)a3
{
  id v3 = a3;
  v4 = +[ICDResponse responseWithResponse:v3];
  v5 = [v4 responseData];
  if ([v5 length])
  {
    v6 = +[NSInputStream inputStreamWithData:v5];
    id v7 = [objc_alloc((Class)DKDAAPParser) initWithStream:v6];
    v8 = objc_alloc_init(UpdateResponseParserDelegate);
    [v7 setDelegate:v8];
    [v7 parse];
    objc_msgSend(v4, "setDatabaseRevision:", -[UpdateResponseParserDelegate serverRevision](v8, "serverRevision"));
    objc_msgSend(v4, "setHasAddToPlaylistBehavior:", -[UpdateResponseParserDelegate hasAddToPlaylistBehavior](v8, "hasAddToPlaylistBehavior"));
    objc_msgSend(v4, "setAddToPlaylistBehavior:", -[UpdateResponseParserDelegate addToPlaylistBehavior](v8, "addToPlaylistBehavior"));
    objc_msgSend(v4, "setHasNeedsResetSync:", -[UpdateResponseParserDelegate hasNeedsResetSync](v8, "hasNeedsResetSync"));
    objc_msgSend(v4, "setNeedsResetSync:", -[UpdateResponseParserDelegate needsResetSync](v8, "needsResetSync"));
    objc_msgSend(v4, "setHasAddToLibraryWhenFavoritingBehavior:", -[UpdateResponseParserDelegate hasAddToLibraryWhenFavoritingBehavior](v8, "hasAddToLibraryWhenFavoritingBehavior"));
    objc_msgSend(v4, "setAddToLibraryWhenFavoritingBehavior:", -[UpdateResponseParserDelegate addToLibraryWhenFavoritingBehavior](v8, "addToLibraryWhenFavoritingBehavior"));
    v9 = [v3 responseHeaderFields];
    v10 = [v9 objectForKey:ICStoreHTTPHeaderKeyXDAAPClientFeaturesVersion];
    if (_NSIsNSString())
    {
      [v4 setHasClientFeaturesVersion:1];
      [v4 setClientFeaturesVersion:v10];
    }
  }

  return v4;
}

@end