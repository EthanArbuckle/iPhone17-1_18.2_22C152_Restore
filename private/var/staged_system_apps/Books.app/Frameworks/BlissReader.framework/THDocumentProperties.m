@interface THDocumentProperties
- (BOOL)introMediaIsVideo;
- (BOOL)isPreview;
- (BOOL)wasThinned;
- (NSDate)modificationDate;
- (NSDictionary)originalAssetSizes;
- (NSDictionary)thinnedAssetSizes;
- (NSLocale)bookLocale;
- (NSString)equationEnvironmentEntry;
- (NSString)searchIndexEntry;
- (NSString)searchRefTextEntry;
- (NSURL)introMediaUrl;
- (THBookVersion)bookVersion;
- (THDocumentProperties)initWithContext:(id)a3;
- (THPresentationType)chapterBrowserPagePresentationType;
- (THPresentationType)defaultPresentationType;
- (THPresentationType)flowPresentationType;
- (THPresentationType)paginatedPresentationType;
- (double)applePubVersion;
- (void)dealloc;
- (void)setApplePubVersion:(double)a3;
- (void)setBookLocale:(id)a3;
- (void)setBookVersion:(id)a3;
- (void)setChapterBrowserPagePresentationType:(id)a3;
- (void)setEquationEnvironmentEntry:(id)a3;
- (void)setFlowPresentationType:(id)a3;
- (void)setIntroMediaIsVideo:(BOOL)a3;
- (void)setIntroMediaUrl:(id)a3;
- (void)setIsPreview:(BOOL)a3;
- (void)setModificationDate:(id)a3;
- (void)setOriginalAssetSizes:(id)a3;
- (void)setPaginatedPresentationType:(id)a3;
- (void)setSearchIndexEntry:(id)a3;
- (void)setSearchRefTextEntry:(id)a3;
- (void)setThinnedAssetSizes:(id)a3;
- (void)setWasThinned:(BOOL)a3;
@end

@implementation THDocumentProperties

- (THPresentationType)chapterBrowserPagePresentationType
{
  return self->mChapterBrowserPagePresentationType;
}

- (void)setChapterBrowserPagePresentationType:(id)a3
{
  [(THDocumentProperties *)self willModify];
  id v5 = a3;

  self->mChapterBrowserPagePresentationType = (THPresentationType *)a3;
}

- (THDocumentProperties)initWithContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THDocumentProperties;
  return [(THDocumentProperties *)&v4 initWithContext:a3];
}

- (void)dealloc
{
  self->mFlowPresentationType = 0;
  self->mPaginatedPresentationType = 0;

  self->mChapterBrowserPagePresentationType = 0;
  self->mBookLocale = 0;

  self->mIntroMediaUrl = 0;
  self->mSearchIndexEntry = 0;

  self->mSearchRefTextEntry = 0;
  self->mEquationEnvironmentEntry = 0;

  self->mBookVersion = 0;
  self->mOriginalAssetSizes = 0;

  self->mThinnedAssetSizes = 0;
  self->mModificationDate = 0;

  self->_paginatedPresentationType = 0;
  self->_flowPresentationType = 0;
  v3.receiver = self;
  v3.super_class = (Class)THDocumentProperties;
  [(THDocumentProperties *)&v3 dealloc];
}

- (NSLocale)bookLocale
{
  return self->mBookLocale;
}

- (void)setBookLocale:(id)a3
{
  [(THDocumentProperties *)self willModify];
  id v5 = a3;

  self->mBookLocale = (NSLocale *)a3;
}

- (double)applePubVersion
{
  return self->mApplePubVersion;
}

- (void)setApplePubVersion:(double)a3
{
  self->mApplePubVersion = a3;
}

- (THBookVersion)bookVersion
{
  return self->mBookVersion;
}

- (void)setBookVersion:(id)a3
{
  [(THDocumentProperties *)self willModify];
  id v5 = a3;

  self->mBookVersion = (THBookVersion *)a3;
}

- (NSURL)introMediaUrl
{
  return self->mIntroMediaUrl;
}

- (void)setIntroMediaUrl:(id)a3
{
  [(THDocumentProperties *)self willModify];
  id v5 = a3;

  self->mIntroMediaUrl = (NSURL *)a3;
}

- (NSString)searchIndexEntry
{
  return self->mSearchIndexEntry;
}

- (void)setSearchIndexEntry:(id)a3
{
  [(THDocumentProperties *)self willModify];
  id v5 = a3;

  self->mSearchIndexEntry = (NSString *)a3;
}

- (NSString)searchRefTextEntry
{
  return self->mSearchRefTextEntry;
}

- (void)setSearchRefTextEntry:(id)a3
{
  [(THDocumentProperties *)self willModify];
  id v5 = a3;

  self->mSearchRefTextEntry = (NSString *)a3;
}

- (NSString)equationEnvironmentEntry
{
  return self->mEquationEnvironmentEntry;
}

- (void)setEquationEnvironmentEntry:(id)a3
{
  [(THDocumentProperties *)self willModify];
  id v5 = a3;

  self->mEquationEnvironmentEntry = (NSString *)a3;
}

- (BOOL)introMediaIsVideo
{
  return self->mIntroMediaIsVideo;
}

- (void)setIntroMediaIsVideo:(BOOL)a3
{
  self->mIntroMediaIsVideo = a3;
}

- (BOOL)wasThinned
{
  return self->mWasThinned;
}

- (void)setWasThinned:(BOOL)a3
{
  self->mWasThinned = a3;
}

- (BOOL)isPreview
{
  return self->mIsPreview;
}

- (void)setIsPreview:(BOOL)a3
{
  self->mIsPreview = a3;
}

- (NSDictionary)originalAssetSizes
{
  return self->mOriginalAssetSizes;
}

- (void)setOriginalAssetSizes:(id)a3
{
  [(THDocumentProperties *)self willModify];
  id v5 = a3;

  self->mOriginalAssetSizes = (NSDictionary *)a3;
}

- (NSDictionary)thinnedAssetSizes
{
  return self->mThinnedAssetSizes;
}

- (void)setThinnedAssetSizes:(id)a3
{
  [(THDocumentProperties *)self willModify];
  id v5 = a3;

  self->mThinnedAssetSizes = (NSDictionary *)a3;
}

- (NSDate)modificationDate
{
  return self->mModificationDate;
}

- (void)setModificationDate:(id)a3
{
  [(THDocumentProperties *)self willModify];
  id v5 = a3;

  self->mModificationDate = (NSDate *)a3;
}

- (THPresentationType)defaultPresentationType
{
  if ([(THDocumentProperties *)self paginatedPresentationType])
  {
    return [(THDocumentProperties *)self paginatedPresentationType];
  }
  else
  {
    return [(THDocumentProperties *)self flowPresentationType];
  }
}

- (THPresentationType)flowPresentationType
{
  return self->_flowPresentationType;
}

- (void)setFlowPresentationType:(id)a3
{
}

- (THPresentationType)paginatedPresentationType
{
  return self->_paginatedPresentationType;
}

- (void)setPaginatedPresentationType:(id)a3
{
}

@end