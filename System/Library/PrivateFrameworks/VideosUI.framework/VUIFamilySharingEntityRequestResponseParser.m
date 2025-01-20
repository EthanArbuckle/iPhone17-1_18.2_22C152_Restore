@interface VUIFamilySharingEntityRequestResponseParser
+ (id)_parseContentRatingBag:(id)a3;
+ (id)_parsePlaybackPositionBag:(id)a3;
+ (id)_parseRelationship:(id)a3;
+ (id)_parseRelationshipBag:(id)a3;
+ (id)mediaEntityFromAMSEntityDictionary:(id)a3;
- (VUIFamilySharingEntityRequestResponseParser)init;
- (id)_processRawMediaEntities:(id)a3;
- (id)parseAMSURLResult:(id)a3;
@end

@implementation VUIFamilySharingEntityRequestResponseParser

- (VUIFamilySharingEntityRequestResponseParser)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIFamilySharingEntityRequestResponseParser;
  v2 = [(VUIFamilySharingEntityRequestResponseParser *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.tv.mediaAPI", "VUIFamilySharingEntityRequestResponseParser");
    v4 = (void *)sLogObject;
    sLogObject = (uint64_t)v3;
  }
  return v2;
}

- (id)parseAMSURLResult:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v4 object];
    v8 = objc_msgSend(v7, "vui_arrayForKey:", @"data");

    v9 = [(VUIFamilySharingEntityRequestResponseParser *)self _processRawMediaEntities:v8];
  }
  else
  {
    v10 = sLogObject;
    if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Parsing AMS Purchases Fetch with no object dictionary", v12, 2u);
    }
    v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

+ (id)mediaEntityFromAMSEntityDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "vui_stringForKey:", @"id");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v6 = objc_msgSend(v4, "vui_stringForKey:", @"type");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = objc_msgSend(v4, "vui_dictionaryForKey:", @"relationships");
      if (v7)
      {
        v8 = [a1 _parseRelationshipBag:v7];
      }
      else
      {
        v8 = 0;
      }
      v12 = objc_msgSend(v4, "vui_dictionaryForKey:", @"attributes");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = objc_msgSend(v12, "vui_arrayForKey:", @"offers");
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v55 = v13;
          uint64_t v14 = objc_msgSend(v12, "vui_arrayForKey:", @"personalizedOffers");
          v53 = (void *)v14;
          if (v14) {
            v56 = (void *)[objc_alloc(MEMORY[0x1E4FB50F0]) initWithMAPIDictionaries:v14];
          }
          else {
            v56 = 0;
          }
          v17 = objc_msgSend(v12, "vui_arrayForKey:", @"genreNames");
          objc_opt_class();
          v54 = v17;
          if (objc_opt_isKindOfClass())
          {
            v52 = [v17 firstObject];
            v51 = objc_msgSend(v12, "vui_numberForKey:", @"episodeSeasonNumber");
            v50 = objc_msgSend(v12, "vui_numberForKey:", @"episodeNumber");
            v49 = objc_msgSend(v12, "vui_stringForKey:", @"iTunesExtrasUrl");
            v13 = v55;
            v48 = (void *)[objc_alloc(MEMORY[0x1E4FB50F0]) initWithMAPIDictionaries:v55];
            v46 = objc_msgSend(v12, "vui_dictionaryForKey:", @"description");
            v47 = objc_msgSend(v46, "vui_stringForKey:", @"standard");
            v18 = objc_msgSend(v12, "vui_dictionaryForKey:", @"widescreenArtwork");
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v40 = v18;
              v45 = objc_msgSend(v18, "vui_stringForKey:", @"url");
              uint64_t v19 = objc_msgSend(v12, "vui_stringForKey:", @"releaseDate");
              id v20 = objc_alloc_init(MEMORY[0x1E4F28C10]);
              [v20 setDateFormat:@"yyyy-MM-dd"];
              v38 = v20;
              v44 = [v20 dateFromString:v19];
              v37 = objc_msgSend(v12, "vui_dictionaryForKey:", @"contentRatingsBySystem");
              v43 = objc_msgSend(a1, "_parseContentRatingBag:");
              v36 = objc_msgSend(v12, "vui_dictionaryForKey:", @"previewArtwork");
              v42 = objc_msgSend(v36, "vui_stringForKey:", @"url");
              v41 = objc_msgSend(v12, "vui_stringForKey:", @"name");
              v21 = +[VUIMediaEntityType movie];
              v39 = (void *)v19;
              if ([v6 isEqualToString:@"movies"])
              {
                v22 = +[VUIMediaEntityType movie];
              }
              else if ([v6 isEqualToString:@"tv-episodes"])
              {
                v22 = +[VUIMediaEntityType episode];
              }
              else
              {
                NSLog(&cfstr_Unexpectedtype.isa, v6);
                v22 = v21;
              }
              v35 = objc_msgSend(v12, "vui_arrayForKey:", @"capabilities");
              v27 = objc_alloc_init(VUIFamilySharingEntity);
              v28 = +[VUIMediaEntityType episode];
              int v29 = [v22 isEqual:v28];

              if (v29)
              {
                v30 = objc_msgSend(v12, "vui_stringForKey:", @"artistName");
                [(VUIFamilySharingEntity *)v27 setShowTitle:v30];
              }
              [(VUIFamilySharingEntity *)v27 setIdentifier:v5];
              [(VUIFamilySharingEntity *)v27 setType:v22];
              [(VUIFamilySharingEntity *)v27 setTitle:v41];
              [(VUIFamilySharingEntity *)v27 setArtworkURL:v45];
              [(VUIFamilySharingEntity *)v27 setPreviewArtworkURL:v42];
              [(VUIFamilySharingEntity *)v27 setOfferListing:v48];
              [(VUIFamilySharingEntity *)v27 setRelationships:v8];
              [(VUIFamilySharingEntity *)v27 setEpisodeNumber:v50];
              [(VUIFamilySharingEntity *)v27 setSeasonNumber:v51];
              [(VUIFamilySharingEntity *)v27 setStandardDescription:v47];
              [(VUIFamilySharingEntity *)v27 setReleaseDate:v44];
              [(VUIFamilySharingEntity *)v27 setContentRating:v43];
              [(VUIFamilySharingEntity *)v27 setGenreTitle:v52];
              [(VUIFamilySharingEntity *)v27 setPersonalizedOfferListing:v56];
              [(VUIFamilySharingEntity *)v27 setITunesExtrasUrl:v49];
              if ([v35 count])
              {
                v31 = [MEMORY[0x1E4F1CAD0] setWithArray:v35];
                [(VUIFamilySharingEntity *)v27 setCapabilities:v31];
              }
              v32 = [VUIFamilySharingMediaItem alloc];
              v33 = VUIMediaEntityFetchRequestAllPropertiesSet();
              v10 = [(VUIFamilySharingMediaItem *)v32 initWithAMSEntity:v27 requestedProperties:v33];

              v13 = v55;
              v25 = v40;
              v24 = v53;
            }
            else
            {
              v25 = v18;
              v26 = sLogObject;
              if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v57 = 0;
                _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "Parsing AMS Entity Fetch no preview artwork dictionary", v57, 2u);
              }
              v10 = 0;
              v24 = v53;
            }
          }
          else
          {
            v23 = sLogObject;
            if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v58 = 0;
              _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_DEFAULT, "Parsing AMS Entity Fetch no genre array", v58, 2u);
            }
            v10 = 0;
            v13 = v55;
            v24 = v53;
          }
        }
        else
        {
          v16 = sLogObject;
          if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v59 = 0;
            _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Parsing AMS Entity Fetch no offers array", v59, 2u);
          }
          v10 = 0;
        }
      }
      else
      {
        v15 = sLogObject;
        if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v60 = 0;
          _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Parsing AMS Entity Fetch no attribute dictionary", v60, 2u);
        }
        v10 = 0;
      }
    }
    else
    {
      v11 = sLogObject;
      if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v61 = 0;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Parsing AMS Entity Fetch no type provided", v61, 2u);
      }
      v10 = 0;
    }
  }
  else
  {
    v9 = sLogObject;
    if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Parsing AMS Entity Fetch no entity provided", buf, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)_processRawMediaEntities:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = +[VUIFamilySharingEntityRequestResponseParser mediaEntityFromAMSEntityDictionary:v10];
          if (v11) {
            [v4 addObject:v11];
          }
        }
        else
        {
          v12 = sLogObject;
          if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Parsing AMS Entity Fetch invalid entity dictionary", v15, 2u);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v13 = (void *)[v4 copy];
  return v13;
}

+ (id)_parseRelationshipBag:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(VUIFamilySharingRelationships);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend(v4, "vui_dictionaryForKey:", @"seasons");
    uint64_t v7 = [a1 _parseRelationship:v6];
    [(VUIFamilySharingRelationships *)v5 setSeason:v7];
    uint64_t v8 = objc_msgSend(v4, "vui_dictionaryForKey:", @"shows");
    v9 = [a1 _parseRelationship:v8];
    [(VUIFamilySharingRelationships *)v5 setShow:v9];
    uint64_t v10 = objc_msgSend(v4, "vui_dictionaryForKey:", @"playback-position");
    v11 = [a1 _parsePlaybackPositionBag:v10];
    [(VUIFamilySharingRelationships *)v5 setPlaybackPosition:v11];
  }
  else
  {
    v12 = sLogObject;
    if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Parsing relationship bag thats not a dictionary", v14, 2u);
    }
  }

  return v5;
}

+ (id)_parsePlaybackPositionBag:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(VUIFamilySharingPlaybackPositionRelationship);
  id v5 = objc_msgSend(v3, "vui_arrayForKey:", @"data");

  if (v5 && [v5 count])
  {
    uint64_t v6 = [v5 firstObject];
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = objc_msgSend(v6, "vui_stringForKey:", @"id");
      [(VUIFamilySharingRelationship *)v4 setIdentifier:v8];
      v9 = objc_msgSend(v7, "vui_dictionaryForKey:", @"attributes");
      uint64_t v10 = v9;
      if (v9)
      {
        v11 = objc_msgSend(v9, "vui_dateForKey:", @"recordedAtTimestamp");
        [(VUIFamilySharingPlaybackPositionRelationship *)v4 setRecordedAtTimestamp:v11];
        v12 = objc_msgSend(v10, "vui_numberForKey:", @"positionInMilliseconds");
        [(VUIFamilySharingPlaybackPositionRelationship *)v4 setPositionInMilliseconds:v12];
      }
    }
  }
  return v4;
}

+ (id)_parseContentRatingBag:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 allKeys];
    id v5 = [v4 firstObject];
    uint64_t v6 = [v3 objectForKey:v5];
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = objc_msgSend(v6, "vui_stringForKey:", @"name");
      v9 = objc_msgSend(v7, "vui_numberForKey:", @"value");
      uint64_t v10 = objc_msgSend(v7, "vui_arrayForKey:", @"advisories");
      v11 = v10;
      if (v10)
      {
        v12 = [v10 firstObject];
      }
      else
      {
        v12 = &stru_1F3E921E0;
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v16 = [v9 unsignedIntegerValue];
        v15 = (void *)[objc_alloc(MEMORY[0x1E4FB3C60]) initWithRatingSystemString:v5 ratingLabel:v8 rank:v16 ratingDescription:v12];
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
    id v14 = v15;
  }
  else
  {
    v13 = sLogObject;
    if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v18 = 0;
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Parsing content rating bag thats not a dictionary", v18, 2u);
    }
    id v14 = 0;
  }

  return v14;
}

+ (id)_parseRelationship:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(VUIFamilySharingRelationship);
  uint64_t v6 = objc_msgSend(v4, "vui_arrayForKey:", @"data");

  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = [v6 firstObject];
  uint64_t v8 = v7;
  if (!v7)
  {
LABEL_13:

LABEL_14:
    v22 = v5;
    goto LABEL_16;
  }
  v9 = objc_msgSend(v7, "vui_stringForKey:", @"id");
  [(VUIFamilySharingRelationship *)v5 setIdentifier:v9];
  uint64_t v10 = objc_msgSend(v8, "vui_dictionaryForKey:", @"attributes");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v29 = objc_msgSend(v10, "vui_dictionaryForKey:", @"contentRatingsBySystem");
    v28 = objc_msgSend(a1, "_parseContentRatingBag:");
    -[VUIFamilySharingRelationship setContentRating:](v5, "setContentRating:");
    v27 = objc_msgSend(v10, "vui_dictionaryForKey:", @"description");
    v26 = objc_msgSend(v27, "vui_stringForKey:", @"standard");
    -[VUIFamilySharingRelationship setStandardDescription:](v5, "setStandardDescription:");
    uint64_t v11 = objc_msgSend(v10, "vui_stringForKey:", @"releaseDate");
    id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v12 setDateFormat:@"yyyy-MM-dd"];
    v25 = (void *)v11;
    v24 = [v12 dateFromString:v11];
    -[VUIFamilySharingRelationship setReleaseDate:](v5, "setReleaseDate:");
    v13 = objc_msgSend(v10, "vui_arrayForKey:", @"genreNames");
    id v14 = v13;
    if (v13)
    {
      v15 = [v13 firstObject];
      [(VUIFamilySharingRelationship *)v5 setGenreTitle:v15];
    }
    uint64_t v16 = objc_msgSend(v10, "vui_dictionaryForKey:", @"widescreenArtwork");
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      long long v18 = objc_msgSend(v16, "vui_stringForKey:", @"url");
      [(VUIFamilySharingRelationship *)v5 setArtworkURL:v18];
    }
    else
    {
      id v20 = sLogObject;
      if (os_log_type_enabled((os_log_t)sLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "Parsing AMS Entity Fetch no preview artwork dictionary", buf, 2u);
      }
      uint64_t v21 = v5;
    }

    if (isKindOfClass) {
      goto LABEL_13;
    }
  }
  else
  {
    long long v19 = v5;
  }
LABEL_16:

  return v5;
}

@end