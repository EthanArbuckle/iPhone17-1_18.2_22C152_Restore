@interface AEAssetActivityItemProviderSource
+ (id)activityItemProviderWithPropertySource:(id)a3;
+ (id)citationWithPropertyProvider:(id)a3 storeURL:(id)a4 pageRange:(_NSRange)a5;
- (AEAssetActivityItemProviderSource)initWithPropertySource:(id)a3;
- (AEAssetActivityPropertyProvider)propertyProvider;
- (BOOL)supportsActivityType:(id)a3;
- (NSString)activityType;
- (id)HTMLGenerator:(id)a3 citationForStoreURL:(id)a4;
- (id)assetCoverForHTMLGenerator:(id)a3;
- (id)citation;
- (id)storeURLForHTMLGenerator:(id)a3;
- (id)supportedActivityTypes;
- (id)tellAFriendBaseURLForHTMLGenerator:(id)a3;
- (void)populateHTMLGenerator:(id)a3;
- (void)setPropertyProvider:(id)a3;
@end

@implementation AEAssetActivityItemProviderSource

+ (id)activityItemProviderWithPropertySource:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithPropertySource:v4];

  return v5;
}

- (AEAssetActivityItemProviderSource)initWithPropertySource:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAssetActivityItemProviderSource *)self init];
  if (v5)
  {
    v6 = [[AEAssetActivityPropertyProvider alloc] initWithPropertySource:v4];
    propertyProvider = v5->_propertyProvider;
    v5->_propertyProvider = v6;
  }
  return v5;
}

- (id)supportedActivityTypes
{
  return 0;
}

- (BOOL)supportsActivityType:(id)a3
{
  id v4 = a3;
  id v5 = [(AEAssetActivityItemProviderSource *)self supportedActivityTypes];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)populateHTMLGenerator:(id)a3
{
  id v24 = a3;
  [v24 setDataSource:self];
  id v4 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  if ([v4 isStoreAsset])
  {
    id v5 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
    unsigned __int8 v6 = [v5 storeID];
    [v24 setStoreId:v6];
  }
  else
  {
    [v24 setStoreId:0];
  }

  v7 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  v8 = [v7 epubID];
  [v24 setEpubId:v8];

  v9 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  v10 = [v9 title];
  [v24 setTitle:v10];

  v11 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  v12 = [v11 author];
  [v24 setAuthor:v12];

  v13 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  v14 = [v13 publisherLocation];
  [v24 setPublisherLocation:v14];

  v15 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  v16 = [v15 publisherName];
  [v24 setPublisherName:v16];

  v17 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  v18 = [v17 publisherYear];
  [v24 setPublisherYear:v18];

  v19 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  [v24 setContentProtected:[v19 contentProtected]];

  v20 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  v21 = [v20 genre];
  [v24 setGenre:v21];

  v22 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  v23 = [v22 readingDirection];
  [v24 setReadingDirection:v23];
}

+ (id)citationWithPropertyProvider:(id)a3 storeURL:(id)a4 pageRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v6 = a3;
  id v7 = a4;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_83C3C;
  v60[3] = &unk_2C7150;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v61 = v8;
  v9 = objc_retainBlock(v60);
  v10 = [v6 author];
  v57 = v8;
  if ([v10 length])
  {
    v11 = +[NSCharacterSet punctuationCharacterSet];
    unsigned __int8 v12 = [v11 characterIsMember:[v10 characterAtIndex:[v10 length] - 1]];

    if ((v12 & 1) == 0)
    {
      id v13 = objc_alloc_init((Class)NSMutableArray);
      id v14 = [v10 length];
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_83D18;
      v58[3] = &unk_2C7178;
      id v15 = v13;
      id v59 = v15;
      [v10 enumerateSubstringsInRange:0 options:3 usingBlock:v58];
      if ([v15 count] == (char *)&def_7D91C + 2)
      {
        v16 = IMCommonCoreBundle();
        v17 = [v16 localizedStringForKey:@"%@, %@", &stru_2CE418, @"BCCommonCoreLocalizable" value table];
        v18 = [v15 objectAtIndex:1];
        [v15 objectAtIndex:0];
        v20 = id v19 = v7;
        uint64_t v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v18, v20);

        id v7 = v19;
        id v8 = v57;

        v10 = (void *)v21;
      }
    }
    ((void (*)(void *, void *))v9[2])(v9, v10);
  }
  v22 = [v6 title];
  if ([v22 length])
  {
    v23 = +[NSCharacterSet whitespaceCharacterSet];
    id v24 = [v22 stringByTrimmingCharactersInSet:v23];

    if (([v24 hasSuffix:@"."] & 1) == 0)
    {
      uint64_t v25 = [v24 stringByAppendingString:@"."];

      id v24 = (void *)v25;
    }
    if (v7)
    {
      uint64_t v26 = +[NSString stringWithFormat:@"<a href=\"%@\">%@</a>", v7, v24];

      id v24 = (void *)v26;
    }
    v27 = [v24 stringByEnclosingInQuotes];

    v28 = [v27 stringByAppendingString:@" "];

    [v8 addObject:v28];
  }
  v52 = v22;
  v53 = v10;
  v54 = v7;
  v29 = [v6 version];
  if ([v29 length])
  {
    v30 = IMCommonCoreBundle();
    v31 = [v30 localizedStringForKey:@"v%@. " value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
    uint64_t v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v29);

    [v8 addObject:v32];
    v29 = (void *)v32;
  }
  NSUInteger v33 = location;
  v34 = [v6 publisherLocation];
  v35 = [v6 publisherName];
  if ([v34 length]) {
    id v36 = v34;
  }
  else {
    id v36 = 0;
  }
  if ([v35 length])
  {
    if ([v36 length])
    {
      id v37 = [v36 stringByAppendingFormat:@", %@", v35];
    }
    else
    {
      id v37 = v35;
    }
    id v38 = v37;

    id v36 = v38;
  }
  if ([v36 length])
  {
    v39 = [v6 publisherYear];
    if ([v39 length])
    {
      uint64_t v40 = [v36 stringByAppendingFormat:@", %@", v39];

      id v36 = (id)v40;
    }
    ((void (*)(void *, id))v9[2])(v9, v36);
  }
  v56 = v6;
  if (v33 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v41 = 0;
  }
  else
  {
    v42 = +[NSString stringWithFormat:@"%lull", v33];
    v43 = v42;
    if (length)
    {
      v44 = +[NSString stringWithFormat:@"%lull", v33 + length];
      v45 = [v43 commonPrefixWithString:v44 options:1];
      v46 = [v44 substringFromIndex:[v45 length]];
      id v41 = +[NSString stringWithFormat:@"%@-%@", v43, v46];
    }
    else
    {
      id v41 = v42;
    }
  }
  if ([v41 length]) {
    ((void (*)(void *, id))v9[2])(v9, v41);
  }
  v47 = IMCommonCoreBundle();
  v48 = [v47 localizedStringForKey:@"Apple Books" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  ((void (*)(void *, void *))v9[2])(v9, v48);
  v49 = [v57 componentsJoinedByString:&stru_2CE418];

  return v49;
}

- (id)citation
{
  v3 = objc_opt_class();
  id v4 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  id v5 = [v3 citationWithPropertyProvider:v4 storeURL:0 pageRange:0x7FFFFFFFFFFFFFFFLL];

  return v5;
}

- (id)assetCoverForHTMLGenerator:(id)a3
{
  v3 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  id v4 = [v3 assetCover];

  return v4;
}

- (id)storeURLForHTMLGenerator:(id)a3
{
  v3 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  id v4 = [v3 storeURL];

  return v4;
}

- (id)tellAFriendBaseURLForHTMLGenerator:(id)a3
{
  v3 = +[AEAssetEngine storeMgr];
  id v4 = [v3 clientApplicationController];
  objc_opt_class();
  id v5 = [v4 tellAFriendEmailBodyURLBase];
  id v6 = BUDynamicCast();

  return v6;
}

- (id)HTMLGenerator:(id)a3 citationForStoreURL:(id)a4
{
  id v5 = a4;
  id v6 = objc_opt_class();
  id v7 = [(AEAssetActivityItemProviderSource *)self propertyProvider];
  id v8 = [v6 citationWithPropertyProvider:v7 storeURL:v5 pageRange:0x7FFFFFFFFFFFFFFFLL];

  v9 = IMCommonCoreBundle();
  v10 = [v9 localizedStringForKey:@"This material may be protected by copyright." value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
  v11 = [v8 stringByAppendingFormat:@"\n%@", v10];

  return v11;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (AEAssetActivityPropertyProvider)propertyProvider
{
  return self->_propertyProvider;
}

- (void)setPropertyProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyProvider, 0);

  objc_storeStrong((id *)&self->_activityType, 0);
}

@end