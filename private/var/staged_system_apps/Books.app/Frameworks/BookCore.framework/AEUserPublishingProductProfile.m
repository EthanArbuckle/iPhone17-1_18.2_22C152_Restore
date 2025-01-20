@interface AEUserPublishingProductProfile
+ (BOOL)_isContentRatingExplicitForInfo:(id)a3;
- (AEUserPublishingProductProfile)initWithProfileDictionary:(id)a3;
- (BOOL)hasSupplementalContent;
- (BOOL)isAudiobook;
- (BOOL)isExplicit;
- (BOOL)isPreorder;
- (BOOL)isSeries;
- (BOOL)isStoreAudiobook;
- (BOOL)stringNeedsHTMLParsing:(id)a3;
- (NSArray)children;
- (NSArray)childrenIDs;
- (NSArray)series_genres;
- (NSDate)expectedDate;
- (NSDate)releaseDate;
- (NSDictionary)ebookInfo;
- (NSDictionary)offer;
- (NSDictionary)profileDictionary;
- (NSDictionary)seriesInfo;
- (NSNumber)series_isAudiobook;
- (NSNumber)series_isExplicit;
- (NSNumber)series_isSG;
- (NSNumber)series_position;
- (NSString)adamId;
- (NSString)author;
- (NSString)buyParameters;
- (NSString)description;
- (NSString)genre;
- (NSString)kind;
- (NSString)priceString;
- (NSString)seriesID;
- (NSString)series_displayLabel;
- (NSString)series_formattedPrice;
- (NSString)series_genre;
- (NSString)series_seriesId;
- (NSString)series_seriesTitle;
- (NSString)series_sortAuthor;
- (NSString)series_title;
- (NSString)standardDescription;
- (NSString)standardNotes;
- (NSString)title;
- (NSString)trimmedStandardDescription;
- (NSString)trimmedStandardNotes;
- (NSURL)audiobookSampleURL;
- (NSURL)bookSampleDownloadURL;
- (NSURL)productShortURL;
- (NSURL)productURL;
- (double)averageRating;
- (id)actionTextWithType:(int64_t)a3;
- (id)artworkURLTemplateAspect:(double *)a3;
- (id)objectForKey:(id)a3;
- (id)urlForCoverImageOfSize:(CGSize)a3;
- (id)urlForCoverImageOfSize:(CGSize)a3 aspect:(double *)a4;
- (int64_t)fileSize;
- (int64_t)offerType;
- (unint64_t)ratingCount;
- (void)calculateTrimmedStandardDescription;
- (void)calculateTrimmedStandardNotes;
- (void)setTrimmedStandardDescription:(id)a3;
- (void)setTrimmedStandardNotes:(id)a3;
@end

@implementation AEUserPublishingProductProfile

- (NSArray)series_genres
{
  v2 = self;
  v3 = [(AEUserPublishingProductProfile *)self children];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = [(AEUserPublishingProductProfile *)v2 children];
    v6 = [v5 firstObject];
    v7 = [v6 series_genres];

    v8 = +[NSMutableOrderedSet orderedSet];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v7;
    id v27 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v33;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          v11 = v2;
          v12 = [(AEUserPublishingProductProfile *)v2 children];
          id v13 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v29;
LABEL_9:
            uint64_t v16 = 0;
            while (1)
            {
              if (*(void *)v29 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = [*(id *)(*((void *)&v28 + 1) + 8 * v16) series_genres];
              unsigned int v18 = [v17 containsObject:v10];

              if (!v18) {
                break;
              }
              if (v14 == (id)++v16)
              {
                id v14 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
                if (v14) {
                  goto LABEL_9;
                }
                break;
              }
            }
          }

          [v8 addObject:v10];
          v2 = v11;
        }
        id v27 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v27);
    }

    if ([v8 count])
    {
      v19 = [v8 array];
    }
    else
    {
      v22 = IMCommonCoreBundle();
      v23 = [v22 localizedStringForKey:@"Multiple" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
      v36 = v23;
      v19 = +[NSArray arrayWithObjects:&v36 count:1];
    }
  }
  else
  {
    objc_opt_class();
    v20 = [(AEUserPublishingProductProfile *)v2 objectForKey:@"genres"];
    v21 = BUDynamicCast();

    v19 = sub_161BC(v21);
  }

  return (NSArray *)v19;
}

- (NSString)series_genre
{
  v2 = [(AEUserPublishingProductProfile *)self series_genres];
  v3 = [v2 firstObject];

  return (NSString *)v3;
}

- (NSString)series_sortAuthor
{
  return 0;
}

- (NSString)series_title
{
  objc_opt_class();
  v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"nameRaw"];
  id v4 = BUDynamicCast();

  return (NSString *)v4;
}

- (NSNumber)series_isExplicit
{
  BOOL v2 = [(AEUserPublishingProductProfile *)self isExplicit];

  return +[NSNumber numberWithBool:v2];
}

- (NSNumber)series_isAudiobook
{
  v3 = +[NSNumber numberWithBool:[(AEUserPublishingProductProfile *)self isAudiobook]];
  [(AEUserPublishingProductProfile *)self series_genres];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "isEqualToString:", @"Audiobooks", (void)v10))
        {

          v3 = &__kCFBooleanTrue;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (NSNumber *)v3;
}

- (NSNumber)series_isSG
{
  return 0;
}

- (NSString)series_seriesId
{
  if ([(AEUserPublishingProductProfile *)self series_isContainer]) {
    [(AEUserPublishingProductProfile *)self series_adamId];
  }
  else {
  v3 = [(AEUserPublishingProductProfile *)self seriesID];
  }

  return (NSString *)v3;
}

- (NSString)series_seriesTitle
{
  if ([(AEUserPublishingProductProfile *)self series_isContainer])
  {
    v3 = [(AEUserPublishingProductProfile *)self series_title];
  }
  else
  {
    objc_opt_class();
    id v4 = [(AEUserPublishingProductProfile *)self series_seriesInfo];
    id v5 = [v4 objectForKeyedSubscript:@"seriesName"];
    v3 = BUDynamicCast();
  }

  return (NSString *)v3;
}

- (NSNumber)series_position
{
  BOOL v2 = [(AEUserPublishingProductProfile *)self series_seriesInfo];
  v3 = v2;
  if (!v2)
  {
    id v6 = 0;
    goto LABEL_10;
  }
  id v4 = [v2 objectForKeyedSubscript:@"sequenceNumber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = 0;
      goto LABEL_9;
    }
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 integerValue]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = v5;
LABEL_9:

LABEL_10:

  return (NSNumber *)v6;
}

- (NSString)series_displayLabel
{
  v3 = [(AEUserPublishingProductProfile *)self series_seriesInfo];
  if (v3)
  {
    objc_opt_class();
    id v4 = [v3 objectForKeyedSubscript:@"sequenceDisplayLabel"];
    id v5 = BUDynamicCast();

    if (v5)
    {
      id v6 = v5;
    }
    else
    {
      uint64_t v7 = [(AEUserPublishingProductProfile *)self series_position];

      if (v7)
      {
        v8 = [(AEUserPublishingProductProfile *)self series_position];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v8 longValue]);
        id v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)series_formattedPrice
{
  return 0;
}

- (AEUserPublishingProductProfile)initWithProfileDictionary:(id)a3
{
  id v5 = a3;
  id v6 = [(AEUserPublishingProductProfile *)self init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_profileDictionary, a3);
  }

  return v7;
}

- (id)artworkURLTemplateAspect:(double *)a3
{
  objc_opt_class();
  id v5 = [(AEUserPublishingProductProfile *)self profileDictionary];
  id v6 = [v5 objectForKeyedSubscript:@"artwork"];
  uint64_t v7 = BUDynamicCast();

  if (v7)
  {
    objc_opt_class();
    v8 = [v7 objectForKeyedSubscript:@"url"];
    v9 = BUDynamicCast();

    if (a3)
    {
      long long v10 = [v7 objectForKeyedSubscript:@"width"];
      [v10 floatValue];
      float v12 = v11;

      long long v13 = [v7 objectForKeyedSubscript:@"height"];
      [v13 floatValue];
      float v15 = v14;

      double v16 = 1.0;
      if (v12 > 0.0) {
        double v16 = v15 / v12;
      }
      *a3 = v16;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)urlForCoverImageOfSize:(CGSize)a3
{
  return -[AEUserPublishingProductProfile urlForCoverImageOfSize:aspect:](self, "urlForCoverImageOfSize:aspect:", 0, a3.width, a3.height);
}

- (id)urlForCoverImageOfSize:(CGSize)a3 aspect:(double *)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v7 = [(AEUserPublishingProductProfile *)self profileDictionary];
  v8 = [v7 objectForKeyedSubscript:@"artwork"];

  v67.origin.x = CGPointZero.x;
  v67.origin.y = CGPointZero.y;
  v67.size.double width = width;
  v67.size.double height = height;
  BOOL IsEmpty = CGRectIsEmpty(v67);
  objc_opt_class();
  long long v10 = BUDynamicCast();
  float v11 = v10;
  if (v10)
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v61 = v10;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v62 objects:v66 count:16];
    if (v13)
    {
      id v14 = v13;
      float v15 = 0;
      uint64_t v16 = *(void *)v63;
      double v17 = 0.0;
      double v18 = 0.0;
LABEL_4:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v63 != v16) {
          objc_enumerationMutation(v12);
        }
        v20 = *(void **)(*((void *)&v62 + 1) + 8 * v19);
        v21 = [v20 objectForKeyedSubscript:@"width"];
        [v21 floatValue];
        double v23 = v22;

        v24 = [v20 objectForKeyedSubscript:@"height"];
        [v24 floatValue];
        double v26 = v25;

        if (v17 <= v23 || v18 <= v26)
        {
          id v28 = v20;

          float v15 = v28;
          double v17 = v23;
          double v18 = v26;
        }
        if (!IsEmpty && (width <= v23 || height <= v26)) {
          break;
        }
        if (v14 == (id)++v19)
        {
          id v14 = [v12 countByEnumeratingWithState:&v62 objects:v66 count:16];
          if (v14) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    else
    {
      float v15 = 0;
    }

    objc_opt_class();
    v41 = [v15 objectForKeyedSubscript:@"url"];
    BUDynamicCast();
    id v40 = (id)objc_claimAutoreleasedReturnValue();

    float v11 = v61;
  }
  else
  {
    objc_opt_class();
    long long v30 = BUDynamicCast();
    float v15 = v30;
    if (!v30) {
      goto LABEL_26;
    }
    id v31 = v30;
    long long v32 = [v31 objectForKeyedSubscript:@"width"];
    [v32 floatValue];
    float v34 = v33;
    double v35 = v33;

    v36 = [v31 objectForKeyedSubscript:@"height"];
    [v36 floatValue];
    double v38 = v37;

    if (width < v35 && height < v38)
    {
      objc_opt_class();
      v42 = [v31 objectForKeyedSubscript:@"url"];
      v43 = BUDynamicCast();
      id v44 = [v43 mutableCopy];

      id v40 = 0;
      if ([v44 length] && v34 > 0.0)
      {
        CGSizeScaledToFillInSize();
        double v46 = v45;
        *(float *)&double v47 = v47;
        v48 = +[NSString stringWithFormat:@"%d", llroundf(*(float *)&v47)];
        [v44 replaceOccurrencesOfString:@"{w}" withString:v48 options:2 range:[v44 length]];

        float v49 = v46;
        v50 = +[NSString stringWithFormat:@"%d", llroundf(v49)];
        objc_msgSend(v44, "replaceOccurrencesOfString:withString:options:range:", @"{h}", v50, 2, 0, objc_msgSend(v44, "length"));

        [v44 replaceOccurrencesOfString:@"{f}" withString:@"jpeg" options:2 range:0, [v44 length]];
        id v40 = [v44 copy];
      }
    }
    else
    {
LABEL_26:
      id v40 = 0;
    }
  }
  if ([v40 length])
  {
    id v51 = [objc_alloc((Class)NSURL) initWithString:v40];
    if (!a4) {
      goto LABEL_41;
    }
  }
  else
  {
    id v51 = 0;
    if (!a4) {
      goto LABEL_41;
    }
  }
  v52 = [v15 objectForKeyedSubscript:@"width"];
  [v52 floatValue];
  float v54 = v53;

  v55 = [v15 objectForKeyedSubscript:@"height"];
  [v55 floatValue];
  float v57 = v56;

  double v58 = 1.0;
  if (v54 > 0.0) {
    double v58 = v57 / v54;
  }
  *a4 = v58;
LABEL_41:
  id v59 = v51;

  return v59;
}

+ (BOOL)_isContentRatingExplicitForInfo:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 objectForKeyedSubscript:@"contentRatingsBySystem"];

  id v5 = BUDynamicCast();

  objc_opt_class();
  id v6 = [v5 objectForKeyedSubscript:@"ebooksApple"];
  if (v6)
  {
    uint64_t v7 = BUDynamicCast();
  }
  else
  {
    v8 = [v5 objectForKeyedSubscript:@"riaa"];
    uint64_t v7 = BUDynamicCast();
  }
  objc_opt_class();
  v9 = [v7 objectForKeyedSubscript:@"name"];
  long long v10 = BUDynamicCast();

  LOBYTE(v9) = [v10 isEqualToString:@"Explicit"];
  return (char)v9;
}

- (BOOL)isExplicit
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(AEUserPublishingProductProfile *)self profileDictionary];
  LOBYTE(v3) = [(id)v3 _isContentRatingExplicitForInfo:v4];

  if (v3) {
    return 1;
  }
  if (![(AEUserPublishingProductProfile *)self isSeries]) {
    return 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  objc_opt_class();
  id v6 = [(AEUserPublishingProductProfile *)self profileDictionary];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"children"];
  v8 = BUDynamicCast();
  v9 = [v8 objectEnumerator];

  long long v10 = (char *)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    float v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_opt_class();
        objc_opt_class();
        float v15 = BUDynamicCast();
        LODWORD(v14) = [v14 _isContentRatingExplicitForInfo:v15];

        if (!v14)
        {
          BOOL v5 = 0;
          goto LABEL_15;
        }
      }
      float v11 = (char *)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v5 = 1;
LABEL_15:

  return v5;
}

- (NSDictionary)offer
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"offers"];
  id v4 = BUDynamicCast();

  if ([v4 count])
  {
    objc_opt_class();
    BOOL v5 = [v4 lastObject];
    id v6 = BUDynamicCast();
  }
  else
  {
    id v6 = 0;
  }

  return (NSDictionary *)v6;
}

- (NSString)buyParameters
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self offer];
  id v4 = [v3 objectForKeyedSubscript:@"buyParams"];
  BOOL v5 = BUDynamicCast();

  return (NSString *)v5;
}

- (NSString)priceString
{
  BOOL v2 = [(AEUserPublishingProductProfile *)self offer];
  if (v2)
  {
    objc_opt_class();
    uint64_t v3 = [v2 objectForKeyedSubscript:@"price"];
    id v4 = BUDynamicCast();

    if ([v4 isEqualToNumber:&off_2E13F8])
    {
      BOOL v5 = 0;
    }
    else
    {
      objc_opt_class();
      id v6 = [v2 objectForKeyedSubscript:@"priceFormatted"];
      BOOL v5 = BUDynamicCast();
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return (NSString *)v5;
}

- (int64_t)fileSize
{
  BOOL v2 = [(AEUserPublishingProductProfile *)self offer];
  if (v2)
  {
    objc_opt_class();
    uint64_t v3 = [v2 objectForKeyedSubscript:@"assets"];
    id v4 = BUDynamicCast();

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = v4;
    id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      id v6 = v5;
      int64_t v7 = 0;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(obj);
          }
          long long v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) objectForKeyedSubscript:@"size"];
          objc_opt_class();
          float v11 = BUDynamicCast();
          uint64_t v12 = v11;
          if (v11)
          {
            id v13 = v11;
          }
          else
          {
            objc_opt_class();
            id v14 = BUDynamicCast();
            +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v14 integerValue]);
            id v13 = (id)objc_claimAutoreleasedReturnValue();
          }
          v7 += (int64_t)[v13 integerValue];
        }
        id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }
    else
    {
      int64_t v7 = 0;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)actionTextWithType:(int64_t)a3
{
  if (![(AEUserPublishingProductProfile *)self isPreorder])
  {
    uint64_t v8 = [(AEUserPublishingProductProfile *)self priceString];
    id v9 = [v8 length];

    if (v9)
    {
      switch(a3)
      {
        case 2:
          id v5 = IMCommonCoreBundle();
          id v6 = v5;
          CFStringRef v7 = @"BUY BOOK";
          goto LABEL_23;
        case 1:
          id v5 = IMCommonCoreBundle();
          id v6 = v5;
          CFStringRef v7 = @"Buy";
          goto LABEL_23;
        case 0:
          id v5 = IMCommonCoreBundle();
          id v6 = v5;
          CFStringRef v7 = @"BUY";
          goto LABEL_23;
      }
    }
    else
    {
      long long v10 = [(AEUserPublishingProductProfile *)self offer];

      if (!v10) {
        goto LABEL_24;
      }
      switch(a3)
      {
        case 2:
          id v5 = IMCommonCoreBundle();
          id v6 = v5;
          CFStringRef v7 = @"GET BOOK";
          goto LABEL_23;
        case 1:
          id v5 = IMCommonCoreBundle();
          id v6 = v5;
          CFStringRef v7 = @"Get";
          goto LABEL_23;
        case 0:
          id v5 = IMCommonCoreBundle();
          id v6 = v5;
          CFStringRef v7 = @"GET";
          goto LABEL_23;
      }
    }
LABEL_16:
    long long v10 = 0;
    goto LABEL_24;
  }
  if (a3 == 2)
  {
    id v5 = IMCommonCoreBundle();
    id v6 = v5;
    CFStringRef v7 = @"PRE-ORDER BOOK";
    goto LABEL_23;
  }
  if (a3 == 1)
  {
    id v5 = IMCommonCoreBundle();
    id v6 = v5;
    CFStringRef v7 = @"Pre-Order";
    goto LABEL_23;
  }
  if (a3) {
    goto LABEL_16;
  }
  id v5 = IMCommonCoreBundle();
  id v6 = v5;
  CFStringRef v7 = @"PRE-ORDER";
LABEL_23:
  long long v10 = [v5 localizedStringForKey:v7 value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

LABEL_24:

  return v10;
}

- (int64_t)offerType
{
  uint64_t v3 = [(AEUserPublishingProductProfile *)self offer];

  if (!v3) {
    return 0;
  }
  id v4 = [(AEUserPublishingProductProfile *)self offer];
  id v5 = [v4 objectForKeyedSubscript:@"type"];
  unsigned __int8 v6 = [v5 isEqualToString:@"get"];

  if (v6) {
    return 2;
  }
  uint64_t v8 = [(AEUserPublishingProductProfile *)self offer];
  id v9 = [v8 objectForKeyedSubscript:@"type"];
  unsigned __int8 v10 = [v9 isEqualToString:@"buy"];

  if (v10) {
    return 1;
  }
  float v11 = [(AEUserPublishingProductProfile *)self offer];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"type"];
  unsigned int v13 = [v12 isEqualToString:@"preorder"];

  if (v13) {
    return 3;
  }
  else {
    return 0;
  }
}

- (BOOL)isPreorder
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self offer];
  id v4 = [v3 objectForKeyedSubscript:@"type"];
  id v5 = BUDynamicCast();

  LOBYTE(v3) = [v5 isEqualToString:@"preorder"];
  return (char)v3;
}

- (NSDate)expectedDate
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self offer];
  id v4 = [v3 objectForKeyedSubscript:@"expectedReleaseDate"];
  id v5 = BUDynamicCast();

  if ([v5 length])
  {
    unsigned __int8 v6 = objc_opt_new();
    [v6 setFormatOptions:275];
    CFStringRef v7 = [v6 dateFromString:v5];
  }
  else
  {
    CFStringRef v7 = 0;
  }

  return (NSDate *)v7;
}

- (NSDate)releaseDate
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"releaseDate"];
  id v4 = BUDynamicCast();

  if ([v4 length])
  {
    id v5 = objc_opt_new();
    [v5 setFormatOptions:275];
    unsigned __int8 v6 = [v5 dateFromString:v4];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return (NSDate *)v6;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(AEUserPublishingProductProfile *)self profileDictionary];
  unsigned __int8 v6 = [v5 objectForKey:v4];

  return v6;
}

- (NSString)adamId
{
  BOOL v2 = [(AEUserPublishingProductProfile *)self objectForKey:@"id"];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v2 stringValue];

    BOOL v2 = (void *)v3;
  }
  objc_opt_class();
  id v4 = BUDynamicCast();

  return (NSString *)v4;
}

- (NSString)author
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"artistName"];
  id v4 = BUDynamicCast();

  return (NSString *)v4;
}

- (NSString)title
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"name"];
  id v4 = BUDynamicCast();

  return (NSString *)v4;
}

- (NSString)genre
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"genreNames"];
  id v4 = BUDynamicCast();

  id v5 = [v4 firstObject];

  return (NSString *)v5;
}

- (NSString)standardDescription
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"description"];
  id v4 = BUDynamicCast();

  objc_opt_class();
  id v5 = [v4 objectForKey:@"standard"];
  unsigned __int8 v6 = BUDynamicCast();

  return (NSString *)v6;
}

- (void)calculateTrimmedStandardDescription
{
  id v2 = [(AEUserPublishingProductProfile *)self trimmedStandardDescription];
}

- (NSString)trimmedStandardDescription
{
  trimmedStandardDescription = self->_trimmedStandardDescription;
  if (!trimmedStandardDescription)
  {
    id v4 = [(AEUserPublishingProductProfile *)self standardDescription];
    if (v4 && [(AEUserPublishingProductProfile *)self stringNeedsHTMLParsing:v4])
    {
      [v4 im_stringByStrippingHTML];
      id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = v4;
    }
    unsigned __int8 v6 = self->_trimmedStandardDescription;
    self->_trimmedStandardDescription = v5;

    trimmedStandardDescription = self->_trimmedStandardDescription;
  }

  return trimmedStandardDescription;
}

- (void)calculateTrimmedStandardNotes
{
  id v2 = [(AEUserPublishingProductProfile *)self trimmedStandardNotes];
}

- (NSString)trimmedStandardNotes
{
  trimmedStandardNotes = self->_trimmedStandardNotes;
  if (!trimmedStandardNotes)
  {
    id v4 = [(AEUserPublishingProductProfile *)self standardNotes];
    if (v4 && [(AEUserPublishingProductProfile *)self stringNeedsHTMLParsing:v4])
    {
      [v4 im_stringByStrippingHTML];
      id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = v4;
    }
    unsigned __int8 v6 = self->_trimmedStandardNotes;
    self->_trimmedStandardNotes = v5;

    trimmedStandardNotes = self->_trimmedStandardNotes;
  }

  return trimmedStandardNotes;
}

- (NSString)standardNotes
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"itunesNotes"];
  id v4 = BUDynamicCast();

  objc_opt_class();
  id v5 = [v4 objectForKey:@"standard"];
  unsigned __int8 v6 = BUDynamicCast();

  return (NSString *)v6;
}

- (NSDictionary)ebookInfo
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"ebookInfo"];
  id v4 = BUDynamicCast();

  return (NSDictionary *)v4;
}

- (double)averageRating
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"userRating"];
  id v4 = BUDynamicCast();

  objc_opt_class();
  id v5 = [v4 objectForKey:@"value"];
  unsigned __int8 v6 = BUDynamicCast();
  [v6 floatValue];
  double v8 = v7 / 5.0;

  return v8;
}

- (unint64_t)ratingCount
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"userRating"];
  id v4 = BUDynamicCast();

  objc_opt_class();
  id v5 = [v4 objectForKey:@"ratingCount"];
  unsigned __int8 v6 = BUDynamicCast();
  id v7 = [v6 unsignedIntegerValue];

  return (unint64_t)v7;
}

- (NSURL)productURL
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"url"];
  id v4 = BUDynamicCast();

  if (v4)
  {
    id v5 = +[NSURL URLWithString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (NSURL *)v5;
}

- (NSURL)productShortURL
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"shortUrl"];
  id v4 = BUDynamicCast();

  if (v4)
  {
    id v5 = +[NSURL URLWithString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (NSURL *)v5;
}

- (NSURL)bookSampleDownloadURL
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"bookSampleDownloadUrl"];
  id v4 = BUDynamicCast();

  if (v4)
  {
    id v5 = +[NSURL URLWithString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (NSURL *)v5;
}

- (NSURL)audiobookSampleURL
{
  objc_opt_class();
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self offer];
  id v4 = [v3 objectForKeyedSubscript:@"assets"];
  id v5 = BUDynamicCast();
  unsigned __int8 v6 = [v5 lastObject];
  id v7 = BUDynamicCast();

  objc_opt_class();
  double v8 = [v7 objectForKeyedSubscript:@"preview"];
  id v9 = BUDynamicCast();

  objc_opt_class();
  unsigned __int8 v10 = [v9 objectForKeyedSubscript:@"url"];
  float v11 = BUDynamicCast();

  if ([v11 length])
  {
    uint64_t v12 = +[NSURL URLWithString:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return (NSURL *)v12;
}

- (NSString)kind
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"kind"];
  id v4 = BUDynamicCast();

  return (NSString *)v4;
}

- (BOOL)isSeries
{
  id v2 = [(AEUserPublishingProductProfile *)self kind];
  unsigned __int8 v3 = [v2 isEqualToString:@"epubEbookSeries"];

  return v3;
}

- (BOOL)isAudiobook
{
  objc_opt_class();
  unsigned __int8 v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"isAudiobook"];
  id v4 = BUDynamicCast();
  if ([v4 BOOLValue])
  {
    char v5 = 1;
  }
  else
  {
    unsigned __int8 v6 = [(AEUserPublishingProductProfile *)self objectForKey:@"audioLocale"];
    if (v6)
    {
      char v5 = 1;
    }
    else
    {
      id v7 = [(AEUserPublishingProductProfile *)self objectForKey:@"audiobookTrackIds"];
      char v5 = v7 != 0;
    }
  }

  return v5;
}

- (BOOL)isStoreAudiobook
{
  if ([(AEUserPublishingProductProfile *)self isAudiobook]) {
    return 0;
  }
  id v4 = [(AEUserPublishingProductProfile *)self ebookInfo];
  BOOL v3 = v4 == 0;

  return v3;
}

- (BOOL)hasSupplementalContent
{
  objc_opt_class();
  BOOL v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"hasSupplementalContent"];
  id v4 = BUDynamicCast();
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)stringNeedsHTMLParsing:(id)a3
{
  uint64_t v3 = qword_345618;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_345618, &stru_2C5508);
  }
  id v5 = [v4 rangeOfCharacterFromSet:qword_345610];

  return v5 != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"%p %@ \ndictionary: %@", self, objc_opt_class(), self->_profileDictionary];
}

- (NSDictionary)profileDictionary
{
  return self->_profileDictionary;
}

- (void)setTrimmedStandardDescription:(id)a3
{
}

- (void)setTrimmedStandardNotes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trimmedStandardNotes, 0);
  objc_storeStrong((id *)&self->_trimmedStandardDescription, 0);

  objc_storeStrong((id *)&self->_profileDictionary, 0);
}

- (NSArray)children
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"children"];
  id v4 = BUDynamicCast();

  id v5 = [v4 allValues];

  return (NSArray *)v5;
}

- (NSArray)childrenIDs
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self objectForKey:@"childrenIds"];
  id v4 = BUDynamicCast();

  id v5 = [v4 valueForKey:@"stringValue"];

  return (NSArray *)v5;
}

- (NSDictionary)seriesInfo
{
  objc_opt_class();
  uint64_t v3 = [(AEUserPublishingProductProfile *)self ebookInfo];
  id v4 = [v3 objectForKeyedSubscript:@"seriesInfo"];
  id v5 = BUDynamicCast();

  return (NSDictionary *)v5;
}

- (NSString)seriesID
{
  id v2 = [(AEUserPublishingProductProfile *)self seriesInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"seriesId"];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 stringValue];

    uint64_t v3 = (void *)v4;
  }
  objc_opt_class();
  id v5 = BUDynamicCast();

  return (NSString *)v5;
}

@end