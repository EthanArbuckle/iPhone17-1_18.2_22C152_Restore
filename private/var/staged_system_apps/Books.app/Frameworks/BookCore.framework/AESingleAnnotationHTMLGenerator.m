@interface AESingleAnnotationHTMLGenerator
- (AEAnnotationPaginationDataSource)paginationDataSource;
- (BOOL)areCitationsAllowed;
- (BOOL)userPublishing:(id)a3 isLocalGenerationEnabledForStoreId:(id)a4;
- (NSArray)annotations;
- (id)annotation;
- (id)chapterTitle;
- (id)documentString;
- (id)excerpt;
- (unint64_t)wordLimit;
- (void)setAnnotations:(id)a3;
- (void)setCitationsAllowed:(BOOL)a3;
- (void)setPaginationDataSource:(id)a3;
- (void)setWordLimit:(unint64_t)a3;
@end

@implementation AESingleAnnotationHTMLGenerator

- (id)documentString
{
  v3 = [(AEAssetHTMLGenerator *)self styleSection];
  v4 = IMCommonCoreBundle();
  v18 = [v4 localizedStringForKey:@"All Excerpts From" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

  v5 = [(AESingleAnnotationHTMLGenerator *)self excerpt];
  v6 = [(AEAssetHTMLGenerator *)self bookInfoSection];
  v17 = [(AEAssetHTMLGenerator *)self disclaimerSection];
  if (v6)
  {
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v8 = [(AEAssetHTMLGenerator *)self citationIncludingStoreURL:0];
    v7 = [(AEAssetHTMLGenerator *)self storeLink];
  }
  v16 = [(AESingleAnnotationHTMLGenerator *)self chapterTitle];
  id v9 = objc_alloc_init((Class)NSDateFormatter);
  [v9 setDateStyle:3];
  v10 = +[NSDate date];
  v15 = [v9 stringFromDate:v10];

  v11 = [(AEAssetHTMLGenerator *)self templateStringForName:@"AEAnnotationShare"];
  [v11 AEReplaceTemplatePlaceholder:@"<!-- %%STYLESECTION%% -->" withString:v3];
  v12 = [(AEAssetHTMLGenerator *)self insertionHeaderSection];
  [v11 AEReplaceTemplatePlaceholder:@"<!-- %%INSERTIONHEADER%% -->" withString:v12];

  [v11 AEReplaceTemplatePlaceholder:@"<!-- %%EXCERPT%% -->" withString:v5];
  [v11 AEReplaceTemplatePlaceholder:@"<!-- %%EXERPTFROM%% -->" withString:v18];
  [v11 AEReplaceTemplatePlaceholder:@"<!-- %%CITATION%% -->" withString:v8];
  [v11 AEReplaceTemplatePlaceholder:@"<!-- %%STORELINK%% -->" withString:v7];
  [v11 AEReplaceTemplatePlaceholder:@"<!-- %%BOOKINFO%% -->" withString:v6];
  [v11 AEReplaceTemplatePlaceholder:@"<!-- %%DISCLAIMERSECTION%% -->" withString:v17];
  v13 = [(AEAssetHTMLGenerator *)self readingDirection];
  [v11 AEReplaceTemplatePlaceholder:@"<!-- %%READINGDIRECTION%% -->" withString:v13];

  [v11 AEReplaceTemplatePlaceholder:@"<!-- %%ANNOTATIONDATE%% -->" withString:v15];
  [v11 AEReplaceTemplatePlaceholder:@"<!-- %%ANNOTATIONCHAPTER%% -->" withString:v16];

  return v11;
}

- (id)annotation
{
  v2 = [(AESingleAnnotationHTMLGenerator *)self annotations];
  v3 = [v2 lastObject];

  return v3;
}

- (id)chapterTitle
{
  v3 = [(AESingleAnnotationHTMLGenerator *)self annotation];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || ([(AESingleAnnotationHTMLGenerator *)self annotation],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 chapterTitle],
        v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    v7 = [(AESingleAnnotationHTMLGenerator *)self paginationDataSource];
    v8 = [(AESingleAnnotationHTMLGenerator *)self annotation];
    v6 = [v7 chapterTitleForAnnotation:v8];
  }
  id v9 = [(AESingleAnnotationHTMLGenerator *)self annotation];
  if (objc_opt_respondsToSelector())
  {
    v10 = [(AESingleAnnotationHTMLGenerator *)self annotation];
    v11 = [v10 physicalPageNumber];
  }
  else
  {
    v11 = &stru_2CE418;
  }

  if ([(__CFString *)v11 length])
  {
    v12 = IMCommonCoreBundle();
    v13 = [v12 localizedStringForKey:@"p. %@" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
    uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v11);

    uint64_t v15 = [v6 stringByAppendingFormat:@", %@", v14];

    v6 = (void *)v15;
    v11 = (__CFString *)v14;
  }

  return v6;
}

- (id)excerpt
{
  v3 = [(AESingleAnnotationHTMLGenerator *)self annotation];
  unint64_t v4 = [(AEAssetHTMLGenerator *)self characterCountLimitforAnnotation:v3];
  v5 = +[AEAnnotation contextAwareSelectedTextFromAnnotation:v3];
  if (v4 < (unint64_t)[v5 length])
  {
    v6 = IMCommonCoreBundle();
    v7 = [v6 localizedStringForKey:@"[\\U2026]" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
    uint64_t v8 = [v5 stringByTruncatingToLength:v4 options:3 truncationString:v7];

    v5 = (void *)v8;
  }
  id v9 = [v5 im_stringByReplacingNewLinesWithHTMLBreaks];

  return v9;
}

- (BOOL)userPublishing:(id)a3 isLocalGenerationEnabledForStoreId:(id)a4
{
  return 0;
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
}

- (BOOL)areCitationsAllowed
{
  return self->_citationsAllowed;
}

- (void)setCitationsAllowed:(BOOL)a3
{
  self->_citationsAllowed = a3;
}

- (AEAnnotationPaginationDataSource)paginationDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paginationDataSource);

  return (AEAnnotationPaginationDataSource *)WeakRetained;
}

- (void)setPaginationDataSource:(id)a3
{
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
  objc_destroyWeak((id *)&self->_paginationDataSource);

  objc_storeStrong((id *)&self->_annotations, 0);
}

@end