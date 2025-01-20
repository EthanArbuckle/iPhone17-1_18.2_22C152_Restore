@interface BSUIItemDescription
- (BCLazyValue)lazyNotes;
- (BKBookCoverInfo)bookCoverInfo;
- (BOOL)bookCoverIsAudiobook;
- (BOOL)bookCoverIsDownloading;
- (BOOL)bookCoverIsLocal;
- (BOOL)bookCoverIsPreorder;
- (BOOL)bookCoverIsRightToLeft;
- (BOOL)coverEffectRTL;
- (BOOL)isAudiobook;
- (BSUIItemDescription)initWithAsset:(id)a3;
- (BSUIItemDescription)initWithCachedItemDescription:(id)a3 lazyNotes:(id)a4;
- (BSUIItemDescription)initWithDictionary:(id)a3;
- (BSUIItemDescription)initWithDragInfo:(id)a3;
- (BSUIItemDescription)initWithItemDescription:(id)a3;
- (BSUIItemDescription)initWithProfile:(id)a3;
- (NSDictionary)metrics;
- (NSString)actionString;
- (NSString)artworkURLTemplate;
- (NSString)author;
- (NSString)buyParameters;
- (NSString)kind;
- (NSString)notes;
- (NSString)priceString;
- (NSString)storeID;
- (NSString)title;
- (NSURL)productURL;
- (NSURL)sampleDownloadURL;
- (double)artworkAspect;
- (double)averageRating;
- (id)bookCoverArtworkURLTemplate;
- (id)bookCoverAuthor;
- (id)bookCoverIdentifier;
- (id)bookCoverLanguage;
- (id)bookCoverTitle;
- (id)bookCoverWritingMode;
- (id)description;
- (int64_t)fileSize;
- (unint64_t)coverEffectStyle;
- (unint64_t)ratingCount;
- (void)setLazyNotes:(id)a3;
@end

@implementation BSUIItemDescription

- (BSUIItemDescription)initWithAsset:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BSUIItemDescription;
  v5 = [(BSUIItemDescription *)&v39 init];
  if (v5)
  {
    uint64_t v6 = [v4 id];
    storeID = v5->_storeID;
    v5->_storeID = (NSString *)v6;

    uint64_t v8 = [v4 artworkURL];
    artworkURLTemplate = v5->_artworkURLTemplate;
    v5->_artworkURLTemplate = (NSString *)v8;

    v10 = [v4 width];
    [v10 floatValue];
    if (v11 <= 0.0)
    {
      v5->_artworkAspect = 1.5;
    }
    else
    {
      v12 = [v4 height];
      [v12 floatValue];
      float v14 = v13;
      v15 = [v4 width];
      [v15 floatValue];
      v5->_artworkAspect = (float)(v14 / v16);
    }
    uint64_t v17 = [v4 name];
    title = v5->_title;
    v5->_title = (NSString *)v17;

    uint64_t v19 = [v4 artistName];
    author = v5->_author;
    v5->_author = (NSString *)v19;

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_56B64;
    v37[3] = &unk_390098;
    id v21 = v4;
    id v38 = v21;
    uint64_t v22 = +[BCLazyValue objectSyncProducer:v37];
    lazyNotes = v5->_lazyNotes;
    v5->_lazyNotes = (BCLazyValue *)v22;

    [v21 averageRating];
    v5->_averageRating = v24;
    v5->_ratingCount = (unint64_t)[v21 ratingCount];
    uint64_t v25 = [v21 url];
    productURL = v5->_productURL;
    v5->_productURL = (NSURL *)v25;

    if ([v21 isAudiobook]) {
      v27 = @"audiobook";
    }
    else {
      v27 = @"epubBook";
    }
    objc_storeStrong((id *)&v5->_kind, v27);
    v5->_isAudiobook = [v21 isAudiobook];
    uint64_t v28 = [v21 bookSampleDownloadURL];
    sampleDownloadURL = v5->_sampleDownloadURL;
    v5->_sampleDownloadURL = (NSURL *)v28;

    uint64_t v30 = [v21 priceFormatted];
    priceString = v5->_priceString;
    v5->_priceString = (NSString *)v30;

    uint64_t v32 = +[BCMAssetWrapper actionTextForType:1 withAsset:v21];
    actionString = v5->_actionString;
    v5->_actionString = (NSString *)v32;

    uint64_t v34 = [v21 buyParams];
    buyParameters = v5->_buyParameters;
    v5->_buyParameters = (NSString *)v34;

    v5->_fileSize = (int64_t)[v21 fileSize];
  }

  return v5;
}

- (BSUIItemDescription)initWithProfile:(id)a3
{
  id v4 = a3;
  v5 = [v4 adamId];
  v37.receiver = self;
  v37.super_class = (Class)BSUIItemDescription;
  uint64_t v6 = [(BSUIItemDescription *)&v37 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeID, v5);
    uint64_t v36 = 0x3FF8000000000000;
    uint64_t v8 = [v4 artworkURLTemplateAspect:&v36];
    artworkURLTemplate = v7->_artworkURLTemplate;
    v7->_artworkURLTemplate = (NSString *)v8;

    *(void *)&v7->_artworkAspect = v36;
    uint64_t v10 = [v4 title];
    title = v7->_title;
    v7->_title = (NSString *)v10;

    uint64_t v12 = [v4 author];
    author = v7->_author;
    v7->_author = (NSString *)v12;

    v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472;
    v33 = sub_56DEC;
    uint64_t v34 = &unk_390098;
    id v14 = v4;
    id v35 = v14;
    uint64_t v15 = +[BCLazyValue objectSyncProducer:&v31];
    lazyNotes = v7->_lazyNotes;
    v7->_lazyNotes = (BCLazyValue *)v15;

    [v14 averageRating:v31, v32, v33, v34];
    v7->_averageRating = v17;
    v7->_ratingCount = (unint64_t)[v14 ratingCount];
    uint64_t v18 = [v14 productURL];
    productURL = v7->_productURL;
    v7->_productURL = (NSURL *)v18;

    uint64_t v20 = [v14 kind];
    kind = v7->_kind;
    v7->_kind = (NSString *)v20;

    v7->_isAudiobook = [v14 isAudiobook];
    uint64_t v22 = [v14 bookSampleDownloadURL];
    sampleDownloadURL = v7->_sampleDownloadURL;
    v7->_sampleDownloadURL = (NSURL *)v22;

    uint64_t v24 = [v14 priceString];
    priceString = v7->_priceString;
    v7->_priceString = (NSString *)v24;

    uint64_t v26 = [v14 actionTextWithType:1];
    actionString = v7->_actionString;
    v7->_actionString = (NSString *)v26;

    uint64_t v28 = [v14 buyParameters];
    buyParameters = v7->_buyParameters;
    v7->_buyParameters = (NSString *)v28;

    v7->_fileSize = (int64_t)[v14 fileSize];
  }

  return v7;
}

- (BSUIItemDescription)initWithItemDescription:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BSUIItemDescription;
  v5 = [(BSUIItemDescription *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 storeID];
    storeID = v5->_storeID;
    v5->_storeID = (NSString *)v6;

    uint64_t v8 = [v4 artworkURLTemplate];
    artworkURLTemplate = v5->_artworkURLTemplate;
    v5->_artworkURLTemplate = (NSString *)v8;

    [v4 artworkAspect];
    v5->_artworkAspect = v10;
    uint64_t v11 = [v4 title];
    title = v5->_title;
    v5->_title = (NSString *)v11;

    uint64_t v13 = [v4 author];
    author = v5->_author;
    v5->_author = (NSString *)v13;

    uint64_t v15 = [v4 lazyNotes];
    lazyNotes = v5->_lazyNotes;
    v5->_lazyNotes = (BCLazyValue *)v15;

    [v4 averageRating];
    v5->_averageRating = v17;
    v5->_ratingCount = (unint64_t)[v4 ratingCount];
    uint64_t v18 = [v4 productURL];
    productURL = v5->_productURL;
    v5->_productURL = (NSURL *)v18;

    uint64_t v20 = [v4 kind];
    kind = v5->_kind;
    v5->_kind = (NSString *)v20;

    v5->_isAudiobook = [v4 isAudiobook];
    uint64_t v22 = [v4 sampleDownloadURL];
    sampleDownloadURL = v5->_sampleDownloadURL;
    v5->_sampleDownloadURL = (NSURL *)v22;

    uint64_t v24 = [v4 priceString];
    priceString = v5->_priceString;
    v5->_priceString = (NSString *)v24;

    uint64_t v26 = [v4 actionString];
    actionString = v5->_actionString;
    v5->_actionString = (NSString *)v26;

    uint64_t v28 = [v4 buyParameters];
    buyParameters = v5->_buyParameters;
    v5->_buyParameters = (NSString *)v28;

    v5->_fileSize = (int64_t)[v4 fileSize];
  }

  return v5;
}

- (BSUIItemDescription)initWithDictionary:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BSUIItemDescription;
  v5 = [(BSUIItemDescription *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"storeID"];
    storeID = v5->_storeID;
    v5->_storeID = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"artworkAspect"];
    [v8 doubleValue];
    v5->_artworkAspect = v9;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"artworkURLTemplate"];
    artworkURLTemplate = v5->_artworkURLTemplate;
    v5->_artworkURLTemplate = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"author"];
    author = v5->_author;
    v5->_author = (NSString *)v14;

    float v16 = [v4 objectForKeyedSubscript:@"averageRating"];
    [v16 doubleValue];
    v5->_averageRating = v17;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"ratingCount"];
    v5->_ratingCount = (unint64_t)[v18 integerValue];

    uint64_t v19 = [v4 objectForKeyedSubscript:@"productURL"];
    if (v19)
    {
      uint64_t v20 = [v4 objectForKeyedSubscript:@"productURL"];
      uint64_t v21 = +[NSURL URLWithString:v20];
      productURL = v5->_productURL;
      v5->_productURL = (NSURL *)v21;
    }
    else
    {
      uint64_t v20 = v5->_productURL;
      v5->_productURL = 0;
    }

    uint64_t v23 = [v4 objectForKeyedSubscript:@"kind"];
    kind = v5->_kind;
    v5->_kind = (NSString *)v23;

    uint64_t v25 = [v4 objectForKeyedSubscript:@"sampleDownloadURL"];
    if (v25)
    {
      uint64_t v26 = [v4 objectForKeyedSubscript:@"sampleDownloadURL"];
      uint64_t v27 = +[NSURL URLWithString:v26];
      sampleDownloadURL = v5->_sampleDownloadURL;
      v5->_sampleDownloadURL = (NSURL *)v27;
    }
    else
    {
      uint64_t v26 = v5->_sampleDownloadURL;
      v5->_sampleDownloadURL = 0;
    }

    uint64_t v29 = [v4 objectForKeyedSubscript:@"priceString"];
    priceString = v5->_priceString;
    v5->_priceString = (NSString *)v29;

    uint64_t v31 = [v4 objectForKeyedSubscript:@"actionString"];
    actionString = v5->_actionString;
    v5->_actionString = (NSString *)v31;

    uint64_t v33 = [v4 objectForKeyedSubscript:@"buyParameters"];
    buyParameters = v5->_buyParameters;
    v5->_buyParameters = (NSString *)v33;
  }
  return v5;
}

- (BSUIItemDescription)initWithDragInfo:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BSUIItemDescription;
  v5 = [(BSUIItemDescription *)&v20 init];
  if (v5)
  {
    objc_opt_class();
    uint64_t v6 = [v4 objectForKeyedSubscript:@"storeID"];
    uint64_t v7 = BUDynamicCast();
    storeID = v5->_storeID;
    v5->_storeID = (NSString *)v7;

    objc_opt_class();
    double v9 = [v4 objectForKeyedSubscript:@"title"];
    uint64_t v10 = BUDynamicCast();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_opt_class();
    uint64_t v12 = [v4 objectForKeyedSubscript:@"author"];
    uint64_t v13 = BUDynamicCast();
    author = v5->_author;
    v5->_author = (NSString *)v13;

    objc_opt_class();
    uint64_t v15 = [v4 objectForKeyedSubscript:@"storeURL"];
    float v16 = BUDynamicCast();

    if ([v16 length])
    {
      uint64_t v17 = +[NSURL URLWithString:v16];
      productURL = v5->_productURL;
      v5->_productURL = (NSURL *)v17;
    }
  }

  return v5;
}

- (BSUIItemDescription)initWithCachedItemDescription:(id)a3 lazyNotes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)BSUIItemDescription;
  uint64_t v8 = [(BSUIItemDescription *)&v41 init];
  if (v8)
  {
    double v9 = [v6 storeID];
    uint64_t v10 = (NSString *)[v9 copy];
    storeID = v8->_storeID;
    v8->_storeID = v10;

    uint64_t v12 = [v6 artworkAspect];
    [v12 doubleValue];
    v8->_artworkAspect = v13;

    uint64_t v14 = [v6 artworkURLTemplate];
    artworkURLTemplate = v8->_artworkURLTemplate;
    v8->_artworkURLTemplate = (NSString *)v14;

    objc_storeStrong((id *)&v8->_lazyNotes, a4);
    uint64_t v16 = [v6 title];
    title = v8->_title;
    v8->_title = (NSString *)v16;

    uint64_t v18 = [v6 author];
    author = v8->_author;
    v8->_author = (NSString *)v18;

    objc_super v20 = [v6 averageRating];
    [v20 doubleValue];
    v8->_averageRating = v21;

    uint64_t v22 = [v6 ratingCount];
    v8->_ratingCount = (unint64_t)[v22 integerValue];

    uint64_t v23 = [v6 productURL];
    if (v23)
    {
      uint64_t v24 = [v6 productURL];
      uint64_t v25 = +[NSURL URLWithString:v24];
      productURL = v8->_productURL;
      v8->_productURL = (NSURL *)v25;
    }
    else
    {
      uint64_t v24 = v8->_productURL;
      v8->_productURL = 0;
    }

    uint64_t v27 = [v6 kind];
    kind = v8->_kind;
    v8->_kind = (NSString *)v27;

    uint64_t v29 = [v6 sampleDownloadURL];
    if (v29)
    {
      uint64_t v30 = [v6 sampleDownloadURL];
      uint64_t v31 = +[NSURL URLWithString:v30];
      sampleDownloadURL = v8->_sampleDownloadURL;
      v8->_sampleDownloadURL = (NSURL *)v31;
    }
    else
    {
      uint64_t v30 = v8->_sampleDownloadURL;
      v8->_sampleDownloadURL = 0;
    }

    uint64_t v33 = [v6 priceString];
    priceString = v8->_priceString;
    v8->_priceString = (NSString *)v33;

    uint64_t v35 = [v6 actionString];
    actionString = v8->_actionString;
    v8->_actionString = (NSString *)v35;

    uint64_t v37 = [v6 buyParameters];
    buyParameters = v8->_buyParameters;
    v8->_buyParameters = (NSString *)v37;

    objc_super v39 = [v6 fileSize];
    v8->_fileSize = (int64_t)[v39 integerValue];
  }
  return v8;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:@"<%@: %p", v4, self];

  id v6 = [(BSUIItemDescription *)self storeID];
  [v5 appendFormat:@"\n  storeID=%@ ", v6];

  id v7 = [(BSUIItemDescription *)self artworkURLTemplate];
  [v5 appendFormat:@"\n  artworkURLTemplate=%@ ", v7];

  [(BSUIItemDescription *)self artworkAspect];
  *(float *)&double v8 = v8;
  [v5 appendFormat:@"\n  artworkAspect=%f ", *(float *)&v8];
  double v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  [v5 appendFormat:@"\n  _lazyNotes=<%@:%p> ", v10, self->_lazyNotes];

  uint64_t v11 = [(BSUIItemDescription *)self title];
  [v5 appendFormat:@"\n  title=%@ ", v11];

  uint64_t v12 = [(BSUIItemDescription *)self author];
  [v5 appendFormat:@"\n  author=%@ ", v12];

  [(BSUIItemDescription *)self averageRating];
  *(float *)&double v13 = v13;
  [v5 appendFormat:@"\n  averageRating=%f ", *(float *)&v13];
  [v5 appendFormat:@"\n  ratingCount=%d ", [self ratingCount]];
  uint64_t v14 = [(BSUIItemDescription *)self metrics];
  [v5 appendFormat:@"\n  metrics=%@ ", v14];

  uint64_t v15 = [(BSUIItemDescription *)self kind];
  [v5 appendFormat:@"\n  kind=%@", v15];

  uint64_t v16 = [(BSUIItemDescription *)self productURL];
  [v5 appendFormat:@"\n  productURL=%@", v16];

  uint64_t v17 = [(BSUIItemDescription *)self sampleDownloadURL];
  [v5 appendFormat:@"\n  sampleDownloadURL=%@", v17];

  uint64_t v18 = [(BSUIItemDescription *)self priceString];
  [v5 appendFormat:@"\n  priceString=%@", v18];

  uint64_t v19 = [(BSUIItemDescription *)self actionString];
  [v5 appendFormat:@"\n  actionString=%@", v19];

  objc_super v20 = [(BSUIItemDescription *)self buyParameters];
  [v5 appendFormat:@"\n  buyParameters=%@", v20];

  [v5 appendFormat:@">"];

  return v5;
}

- (NSString)notes
{
  return (NSString *)[(BCLazyValue *)self->_lazyNotes value];
}

- (unint64_t)coverEffectStyle
{
  if ([(BSUIItemDescription *)self bookCoverIsAudiobook]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)coverEffectRTL
{
  return [(BSUIItemDescription *)self bookCoverIsRightToLeft];
}

- (id)bookCoverIdentifier
{
  return self->_storeID;
}

- (id)bookCoverTitle
{
  return self->_title;
}

- (id)bookCoverAuthor
{
  return self->_author;
}

- (id)bookCoverArtworkURLTemplate
{
  return self->_artworkURLTemplate;
}

- (BOOL)bookCoverIsLocal
{
  return 0;
}

- (BOOL)bookCoverIsRightToLeft
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v2 = +[JSABridge sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_57AD4;
  v4[3] = &unk_3900C0;
  v4[4] = &v5;
  [v2 enqueueBlockPrefersSync:v4 file:@"BSUIItemDescription.m" line:264];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (id)bookCoverLanguage
{
  return 0;
}

- (id)bookCoverWritingMode
{
  return 0;
}

- (BOOL)bookCoverIsDownloading
{
  return 0;
}

- (BOOL)bookCoverIsAudiobook
{
  return self->_isAudiobook;
}

- (BOOL)bookCoverIsPreorder
{
  return 0;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (double)artworkAspect
{
  return self->_artworkAspect;
}

- (NSString)artworkURLTemplate
{
  return self->_artworkURLTemplate;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)author
{
  return self->_author;
}

- (double)averageRating
{
  return self->_averageRating;
}

- (unint64_t)ratingCount
{
  return self->_ratingCount;
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (NSString)kind
{
  return self->_kind;
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (NSURL)sampleDownloadURL
{
  return self->_sampleDownloadURL;
}

- (NSString)priceString
{
  return self->_priceString;
}

- (NSString)actionString
{
  return self->_actionString;
}

- (NSString)buyParameters
{
  return self->_buyParameters;
}

- (BKBookCoverInfo)bookCoverInfo
{
  return self->_bookCoverInfo;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (BCLazyValue)lazyNotes
{
  return self->_lazyNotes;
}

- (void)setLazyNotes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyNotes, 0);
  objc_storeStrong((id *)&self->_bookCoverInfo, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_actionString, 0);
  objc_storeStrong((id *)&self->_priceString, 0);
  objc_storeStrong((id *)&self->_sampleDownloadURL, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artworkURLTemplate, 0);

  objc_storeStrong((id *)&self->_storeID, 0);
}

@end