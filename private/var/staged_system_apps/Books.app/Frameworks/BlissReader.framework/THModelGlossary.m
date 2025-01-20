@interface THModelGlossary
- (NSOperationQueue)loadingQueue;
- (NSURL)applePubURL;
- (THDocumentRoot)documentRoot;
- (THModelGlossary)initWithContext:(id)a3 documentRoot:(id)a4;
- (id)addEntryForPath:(id)a3 andTerm:(id)a4;
- (id)entryAtIndex:(int64_t)a3;
- (id)entryForPath:(id)a3;
- (id)entryForTerm:(id)a3;
- (id)pathsForEntriesInContentNode:(id)a3;
- (int64_t)entryCount;
- (void)dealloc;
- (void)setApplePubURL:(id)a3;
- (void)setApplePubURLWithState:(id)a3;
- (void)setGlossaryTermPaths:(id)a3 forContentNode:(id)a4;
@end

@implementation THModelGlossary

- (NSURL)applePubURL
{
  return self->mApplePubURL;
}

- (void)setApplePubURL:(id)a3
{
  [(THModelGlossary *)self willModify];
  id v5 = a3;

  self->mApplePubURL = (NSURL *)a3;
}

- (THModelGlossary)initWithContext:(id)a3 documentRoot:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THModelGlossary;
  id v5 = [(THModelGlossary *)&v8 initWithContext:a3];
  v6 = v5;
  if (v5)
  {
    v5->mDocumentRoot = (THDocumentRoot *)a4;
    v5->mEntries = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v6->mEntriesByApplePubPath = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v6->mEntriesByNormalizedTerm = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v6->mLinksByContentNodeId = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v6;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->mLoadingQueue cancelAllOperations];
  [(NSOperationQueue *)self->mLoadingQueue waitUntilAllOperationsAreFinished];

  self->mEntries = 0;
  self->mEntriesByApplePubPath = 0;

  self->mEntriesByNormalizedTerm = 0;
  self->mApplePubURL = 0;

  self->mLoadingQueue = 0;
  self->mLinksByContentNodeId = 0;
  v3.receiver = self;
  v3.super_class = (Class)THModelGlossary;
  [(THModelGlossary *)&v3 dealloc];
}

- (NSOperationQueue)loadingQueue
{
  result = self->mLoadingQueue;
  if (!result)
  {
    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    self->mLoadingQueue = v4;
    [(NSOperationQueue *)v4 setMaxConcurrentOperationCount:1];
    return self->mLoadingQueue;
  }
  return result;
}

- (int64_t)entryCount
{
  return (int64_t)[(NSMutableArray *)self->mEntries count];
}

- (id)entryAtIndex:(int64_t)a3
{
  if (a3 < 0 || (unint64_t)[(NSMutableArray *)self->mEntries count] <= a3) {
    return 0;
  }
  mEntries = self->mEntries;

  return [(NSMutableArray *)mEntries objectAtIndex:a3];
}

- (id)entryForPath:(id)a3
{
  return [(NSMutableDictionary *)self->mEntriesByApplePubPath objectForKey:a3];
}

- (id)addEntryForPath:(id)a3 andTerm:(id)a4
{
  v6 = [[THModelGlossaryEntry alloc] initWithContext:[(THModelGlossary *)self context] parent:self applePubRelativePath:a3 andTerm:a4];
  if (![v6 normalizedPrefixSearchStrings].count)return 0; {
  [(THModelGlossary *)self willModify];
  }
  [(NSMutableArray *)self->mEntries addObject:v6];
  [(NSMutableDictionary *)self->mEntriesByApplePubPath setObject:v6 forKey:a3];
  [(NSMutableDictionary *)self->mEntriesByNormalizedTerm setObject:v6 forKey:[(THModelGlossaryEntry *)v6 normalizedTerm]];
  return v6;
}

- (id)entryForTerm:(id)a3
{
  mEntriesByNormalizedTerm = self->mEntriesByNormalizedTerm;
  id v4 = [a3 normalizedStringForSearch];

  return [(NSMutableDictionary *)mEntriesByNormalizedTerm objectForKey:v4];
}

- (id)pathsForEntriesInContentNode:(id)a3
{
  mLinksByContentNodeId = self->mLinksByContentNodeId;
  id v4 = [a3 nodeGUID];

  return [(NSMutableDictionary *)mLinksByContentNodeId objectForKey:v4];
}

- (THDocumentRoot)documentRoot
{
  return self->mDocumentRoot;
}

- (void)setGlossaryTermPaths:(id)a3 forContentNode:(id)a4
{
  mLinksByContentNodeId = self->mLinksByContentNodeId;
  id v6 = [a4 nodeGUID];

  [(NSMutableDictionary *)mLinksByContentNodeId setObject:a3 forKey:v6];
}

- (void)setApplePubURLWithState:(id)a3
{
  id v4 = (NSURL *)[a3 applePubZipURL];
  mApplePubURL = self->mApplePubURL;
  if (mApplePubURL != v4)
  {
    id v6 = v4;

    self->mApplePubURL = v6;
  }
}

@end