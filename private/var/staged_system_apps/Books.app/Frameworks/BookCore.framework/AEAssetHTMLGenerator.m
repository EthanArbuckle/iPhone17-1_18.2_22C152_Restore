@interface AEAssetHTMLGenerator
- (AEAssetHTMLGenerator)init;
- (AEAssetHTMLGeneratorDataSource)dataSource;
- (BOOL)areCitationsAllowed;
- (BOOL)isContentProtected;
- (BOOL)isForPrint;
- (BOOL)isSeries;
- (NSString)author;
- (NSString)epubId;
- (NSString)genre;
- (NSString)publisherLocation;
- (NSString)publisherName;
- (NSString)publisherYear;
- (NSString)readingDirection;
- (NSString)sortAuthor;
- (NSString)storeId;
- (NSString)title;
- (id)CSSClassForStyle:(int)a3;
- (id)bookInfoSection;
- (id)bookURL;
- (id)citationIncludingStoreURL:(BOOL)a3;
- (id)disclaimerSection;
- (id)documentString;
- (id)insertionHeaderSection;
- (id)storeLink;
- (id)storeURL;
- (id)styleSection;
- (id)templateBasedDocumentString;
- (id)templateStringForName:(id)a3;
- (id)userPublishing:(id)a3 storeURLForStoreId:(id)a4;
- (id)userPublishing:(id)a3 tellAFriendEmailBaseURLForStoreId:(id)a4;
- (unint64_t)characterCountLimitforAnnotation:(id)a3;
- (unint64_t)wordLimit;
- (void)setAuthor:(id)a3;
- (void)setCitationsAllowed:(BOOL)a3;
- (void)setContentProtected:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setEpubId:(id)a3;
- (void)setForPrint:(BOOL)a3;
- (void)setGenre:(id)a3;
- (void)setPublisherLocation:(id)a3;
- (void)setPublisherName:(id)a3;
- (void)setPublisherYear:(id)a3;
- (void)setReadingDirection:(id)a3;
- (void)setSeries:(BOOL)a3;
- (void)setSortAuthor:(id)a3;
- (void)setStoreId:(id)a3;
- (void)setTitle:(id)a3;
- (void)setWordLimit:(unint64_t)a3;
@end

@implementation AEAssetHTMLGenerator

- (AEAssetHTMLGenerator)init
{
  v5.receiver = self;
  v5.super_class = (Class)AEAssetHTMLGenerator;
  v2 = [(AEAssetHTMLGenerator *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AEAssetHTMLGenerator *)v2 setWordLimit:200];
  }
  return v3;
}

- (id)documentString
{
  if ([(AEAssetHTMLGenerator *)self isSeries]) {
    goto LABEL_3;
  }
  v3 = +[AEUserPublishing sharedInstance];
  v4 = [(AEAssetHTMLGenerator *)self storeId];
  objc_super v5 = [v3 wholeHTMLForStoreId:v4 dataSource:self];

  if (!v5)
  {
LABEL_3:
    objc_super v5 = [(AEAssetHTMLGenerator *)self templateBasedDocumentString];
  }

  return v5;
}

- (id)templateBasedDocumentString
{
  v3 = [(AEAssetHTMLGenerator *)self templateStringForName:@"AEAssetShare"];
  v4 = [(AEAssetHTMLGenerator *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    objc_super v5 = [(AEAssetHTMLGenerator *)self dataSource];
    v6 = [v5 checkoutBookStringForHTMLGenerator:self];
  }
  else
  {
    v6 = &stru_2CE418;
  }

  v7 = [(AEAssetHTMLGenerator *)self bookInfoSection];
  if (v7)
  {
    v8 = 0;
    v9 = 0;
  }
  else
  {
    v9 = [(AEAssetHTMLGenerator *)self citationIncludingStoreURL:0];
    v8 = [(AEAssetHTMLGenerator *)self storeLink];
  }
  [v3 AEReplaceTemplatePlaceholder:@"<!-- %%CHECKOUTBOOK%% -->" withString:v6];
  v10 = [(AEAssetHTMLGenerator *)self insertionHeaderSection];
  [v3 AEReplaceTemplatePlaceholder:@"<!-- %%INSERTIONHEADER%% -->" withString:v10];

  v11 = [(AEAssetHTMLGenerator *)self styleSection];
  [v3 AEReplaceTemplatePlaceholder:@"<!-- %%STYLESECTION%% -->" withString:v11];

  [v3 AEReplaceTemplatePlaceholder:@"<!-- %%BOOKINFO%% -->" withString:v7];
  v12 = [(AEAssetHTMLGenerator *)self disclaimerSection];
  [v3 AEReplaceTemplatePlaceholder:@"<!-- %%DISCLAIMERSECTION%% -->" withString:v12];

  v13 = [(AEAssetHTMLGenerator *)self readingDirection];
  [v3 AEReplaceTemplatePlaceholder:@"<!-- %%READINGDIRECTION%% -->" withString:v13];

  [v3 AEReplaceTemplatePlaceholder:@"<!-- %%CITATION%% -->" withString:v9];
  [v3 AEReplaceTemplatePlaceholder:@"<!-- %%STORELINK%% -->" withString:v8];

  return v3;
}

- (unint64_t)characterCountLimitforAnnotation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(AEAssetHTMLGenerator *)self wordLimit];
  id v15 = 0;
  unint64_t v6 = 0;
  if ([(AEAssetHTMLGenerator *)self areCitationsAllowed])
  {
    v7 = [v4 annotationSelectedText];
    id v8 = [v7 length];

    v9 = [v4 annotationRepresentativeText];
    id v10 = [v9 length];

    unint64_t v6 = (unint64_t)(v8 <= v10 ? v10 : v8);
    if (v6 >= 4 * v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [v4 annotatedAttributedString];
        v12 = [v11 string];
      }
      else
      {
        v12 = [v4 annotationSelectedText];
      }
      id v13 = [v12 tokenCountWithEnumerationOptions:3 maxTokenCount:-1 outLimitLength:0];
      if (v13 >= (id)[(AEAssetHTMLGenerator *)self wordLimit]) {
        [v12 tokenCountWithEnumerationOptions:3 maxTokenCount:[self wordLimit] outLimitLength:&v15];
      }
      else {
        id v15 = [v12 length];
      }

      unint64_t v6 = (unint64_t)v15;
    }
  }

  return v6;
}

- (id)CSSClassForStyle:(int)a3
{
  if ((a3 - 1) > 4) {
    return @"defaultColor";
  }
  else {
    return *(&off_2C8320 + a3 - 1);
  }
}

- (id)userPublishing:(id)a3 storeURLForStoreId:(id)a4
{
  if (objc_msgSend(a4, "longLongValue", a3))
  {
    unint64_t v5 = [(AEAssetHTMLGenerator *)self dataSource];
    unint64_t v6 = [v5 storeURLForHTMLGenerator:self];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)userPublishing:(id)a3 tellAFriendEmailBaseURLForStoreId:(id)a4
{
  unint64_t v5 = [(AEAssetHTMLGenerator *)self dataSource];
  unint64_t v6 = [v5 tellAFriendBaseURLForHTMLGenerator:self];

  return v6;
}

- (id)styleSection
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"AEAssetShare" ofType:@"css"];

  id v10 = 0;
  id v4 = +[NSString stringWithContentsOfFile:v3 encoding:4 error:&v10];
  id v5 = v10;
  if (v4)
  {
    unint64_t v6 = +[NSString stringWithFormat:@"<style type=\"text/css\">%@</style>", v4];
  }
  else
  {
    v7 = BCIMLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "-[AEAssetHTMLGenerator styleSection]";
      __int16 v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Sharing/Annotations/Private/AEAssetHTMLGenerator.m";
      __int16 v15 = 1024;
      int v16 = 212;
      _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    id v8 = BCIMLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v3;
      _os_log_impl(&def_7D91C, v8, OS_LOG_TYPE_INFO, "@\"Failed to load CSS at Path {%@}\"", buf, 0xCu);
    }

    unint64_t v6 = 0;
  }

  return v6;
}

- (id)insertionHeaderSection
{
  return @"<p id=\"insertionheader\"><br/></p>";
}

- (id)bookInfoSection
{
  v3 = +[AEUserPublishing sharedInstance];
  id v4 = [(AEAssetHTMLGenerator *)self storeId];
  id v5 = [v3 bookInfoHTMLForStoreId:v4 dataSource:self];

  return v5;
}

- (id)disclaimerSection
{
  v2 = +[NSMutableString stringWithString:@"<div class=\"disclaimer\"><!-- %%NOTADDEDTOMAILLIST%% --></div>"];
  v3 = IMCommonCoreBundle();
  id v4 = [v3 localizedStringForKey:@"Please note that you have not been added to any email lists." value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  [v2 AEReplaceTemplatePlaceholder:@"<!-- %%NOTADDEDTOMAILLIST%% -->" withString:v4];

  return v2;
}

- (id)storeURL
{
  v3 = [(AEAssetHTMLGenerator *)self dataSource];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AEAssetHTMLGenerator *)self dataSource];
    unint64_t v6 = [v5 storeURLForHTMLGenerator:self];

    v7 = [v6 absoluteString];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)bookURL
{
  v2 = [(AEAssetHTMLGenerator *)self epubId];
  v3 = +[NSString stringWithFormat:@"ibooks://bookid/%@", v2];

  return v3;
}

- (id)citationIncludingStoreURL:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AEAssetHTMLGenerator *)self dataSource];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(AEAssetHTMLGenerator *)self dataSource];
    if (v3)
    {
      id v8 = [(AEAssetHTMLGenerator *)self storeURL];
    }
    else
    {
      id v8 = 0;
    }
    v9 = [v7 HTMLGenerator:self citationForStoreURL:v8];
    if (v3) {
  }
    }
  else
  {
    v9 = 0;
  }
  id v10 = [v9 im_stringByReplacingNewLinesWithHTMLBreaks];

  return v10;
}

- (id)storeLink
{
  v2 = [(AEAssetHTMLGenerator *)self storeURL];
  if (v2)
  {
    BOOL v3 = IMCommonCoreBundle();
    char v4 = [v3 localizedStringForKey:@"Available in Apple Books" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

    id v5 = +[NSString stringWithFormat:@"<a href=\"%@\">%@</a>", v2, v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)templateStringForName:(id)a3
{
  id v3 = a3;
  char v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v3 stringByAppendingFormat:@".%@", @"html"];

  char v6 = [v4 pathForResource:v5 ofType:@"tmpl"];

  id v7 = [v6 length];
  if (v7)
  {
    id v15 = 0;
    id v8 = +[NSString stringWithContentsOfFile:v6 encoding:4 error:&v15];
    v9 = (char *)v15;
    id v10 = v9;
    if (v8)
    {

      id v7 = +[NSMutableString stringWithString:v8];
    }
    else
    {
      v11 = BCIMLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v17 = "-[AEAssetHTMLGenerator templateStringForName:]";
        __int16 v18 = 2080;
        v19 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Sharing/Annotations/Private/AEAss"
              "etHTMLGenerator.m";
        __int16 v20 = 1024;
        int v21 = 291;
        _os_log_impl(&def_7D91C, v11, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v12 = BCIMLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v17 = (const char *)v6;
        __int16 v18 = 2112;
        v19 = v10;
        _os_log_impl(&def_7D91C, v12, OS_LOG_TYPE_INFO, "@\"Failed to load e-mail template {%@} -- %@\"", buf, 0x16u);
      }

      id v8 = 0;
      id v7 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v13 = v7;

  return v13;
}

- (NSString)storeId
{
  return self->_storeId;
}

- (void)setStoreId:(id)a3
{
}

- (NSString)epubId
{
  return self->_epubId;
}

- (void)setEpubId:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)sortAuthor
{
  return self->_sortAuthor;
}

- (void)setSortAuthor:(id)a3
{
}

- (NSString)publisherLocation
{
  return self->_publisherLocation;
}

- (void)setPublisherLocation:(id)a3
{
}

- (NSString)publisherName
{
  return self->_publisherName;
}

- (void)setPublisherName:(id)a3
{
}

- (NSString)publisherYear
{
  return self->_publisherYear;
}

- (void)setPublisherYear:(id)a3
{
}

- (NSString)readingDirection
{
  return self->_readingDirection;
}

- (void)setReadingDirection:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (AEAssetHTMLGeneratorDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (AEAssetHTMLGeneratorDataSource *)a3;
}

- (BOOL)isContentProtected
{
  return self->_contentProtected;
}

- (void)setContentProtected:(BOOL)a3
{
  self->_contentProtected = a3;
}

- (BOOL)isForPrint
{
  return self->_forPrint;
}

- (void)setForPrint:(BOOL)a3
{
  self->_forPrint = a3;
}

- (BOOL)isSeries
{
  return self->_series;
}

- (void)setSeries:(BOOL)a3
{
  self->_series = a3;
}

- (BOOL)areCitationsAllowed
{
  return self->_citationsAllowed;
}

- (void)setCitationsAllowed:(BOOL)a3
{
  self->_citationsAllowed = a3;
}

- (unint64_t)wordLimit
{
  return self->_wordLimit;
}

- (void)setWordLimit:(unint64_t)a3
{
  self->_wordLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_readingDirection, 0);
  objc_storeStrong((id *)&self->_publisherYear, 0);
  objc_storeStrong((id *)&self->_publisherName, 0);
  objc_storeStrong((id *)&self->_publisherLocation, 0);
  objc_storeStrong((id *)&self->_sortAuthor, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_epubId, 0);

  objc_storeStrong((id *)&self->_storeId, 0);
}

@end