@interface THCoreDataAnnotationSource
- (NSArray)annotations;
- (NSString)storageID;
- (THAnnotation)temporaryAnnotation;
- (THAnnotationStorageController)annotationController;
- (THCoreDataAnnotationSource)initWithAnnotationController:(id)a3 contentNode:(id)a4 storageId:(id)a5 storageLength:(unint64_t)a6;
- (id)annotationsForRange:(_NSRange)a3;
- (void)addInterest:(id)a3;
- (void)annotationControllerTeardown;
- (void)dealloc;
- (void)p_rangeChanged:(_NSRange)a3;
- (void)p_updateCachedAnnotations:(id)a3;
- (void)removeInterest:(id)a3;
- (void)setAnnotationController:(id)a3;
- (void)setTemporaryAnnotation:(id)a3;
- (void)updateAnnotations;
@end

@implementation THCoreDataAnnotationSource

- (THCoreDataAnnotationSource)initWithAnnotationController:(id)a3 contentNode:(id)a4 storageId:(id)a5 storageLength:(unint64_t)a6
{
  v12.receiver = self;
  v12.super_class = (Class)THCoreDataAnnotationSource;
  v9 = [(THCoreDataAnnotationSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->mContentNode = (THModelContentNode *)a4;
    v9->mAnnotationController = (THAnnotationStorageController *)a3;
    v9->mStorageID = (NSString *)a5;
    v10->mInterestedParties = (TSUMutablePointerSet *)objc_alloc_init((Class)TSUMutablePointerSet);
    v10->mCachedAnnotations = (THAnnotationCache *)[(THAnnotationStorageController *)v10->mAnnotationController cachedAnnotationsForContentNode:v10->mContentNode];
    [(THAnnotationStorageController *)v10->mAnnotationController registerAnnotationObserver:v10 forContentNode:v10->mContentNode];
    [(THCoreDataAnnotationSource *)v10 updateAnnotations];
  }
  return v10;
}

- (void)dealloc
{
  self->mStorageID = 0;
  self->mInterestedParties = 0;

  self->mCachedAnnotations = 0;
  self->mAnnotationController = 0;
  v3.receiver = self;
  v3.super_class = (Class)THCoreDataAnnotationSource;
  [(THCoreDataAnnotationSource *)&v3 dealloc];
}

- (void)p_rangeChanged:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  objc_sync_enter(self);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(TSUMutablePointerSet *)self->mInterestedParties objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v16.NSUInteger location = (NSUInteger)[v10 rangeOfInterest];
        v17.NSUInteger location = location;
        v17.NSUInteger length = length;
        if (NSIntersectionRange(v16, v17).length) {
          [v10 annotationsChangedInRange:location, length];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  objc_sync_exit(self);
}

- (void)updateAnnotations
{
  id v3 = [[self->mAnnotationController cachedAnnotationsForContentNode:[self mContentNode]] newAnnotationCacheWithTemporaryAnnotation:[self temporaryAnnotation]];
  objc_sync_enter(self);
  [(THCoreDataAnnotationSource *)self p_updateCachedAnnotations:v3];
  objc_sync_exit(self);
}

- (void)p_updateCachedAnnotations:(id)a3
{
  id mCachedAnnotations = self->mCachedAnnotations;
  if (mCachedAnnotations == a3) {
    return;
  }
  if (mCachedAnnotations) {
    goto LABEL_5;
  }
  if (a3)
  {
    id mCachedAnnotations = a3;
LABEL_5:
    uint64_t v6 = (uint64_t)[mCachedAnnotations differenceRangeWithCache:storageUID:];
    uint64_t v8 = v7;
    goto LABEL_6;
  }
  uint64_t v8 = 0;
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

  self->id mCachedAnnotations = 0;
  self->id mCachedAnnotations = (THAnnotationCache *)a3;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0)
  {
    -[THCoreDataAnnotationSource p_rangeChanged:](self, "p_rangeChanged:", v6, v8);
  }
}

- (NSArray)annotations
{
  objc_sync_enter(self);
  id v3 = [(THAnnotationCache *)self->mCachedAnnotations annotationsForStorageUID:self->mStorageID];
  objc_sync_exit(self);
  id v4 = v3;

  return (NSArray *)v4;
}

- (id)annotationsForRange:(_NSRange)a3
{
  if (!a3.length) {
    return 0;
  }
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id result = [(THCoreDataAnnotationSource *)self annotations];
  if (result)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_12AB80;
    v6[3] = &unk_459C70;
    v6[4] = location;
    v6[5] = length;
    return [result tsu_arrayOfObjectsPassingTest:v6];
  }
  return result;
}

- (void)setTemporaryAnnotation:(id)a3
{
  objc_sync_enter(self);
  id v5 = [(THAnnotationCache *)self->mCachedAnnotations newAnnotationCacheWithTemporaryAnnotation:a3];
  [(THCoreDataAnnotationSource *)self p_updateCachedAnnotations:v5];

  objc_sync_exit(self);
}

- (THAnnotation)temporaryAnnotation
{
  objc_sync_enter(self);
  id v3 = [(THAnnotationCache *)self->mCachedAnnotations temporaryAnnotation];
  objc_sync_exit(self);
  return v3;
}

- (void)addInterest:(id)a3
{
  objc_sync_enter(self);
  if (a3) {
    [(TSUMutablePointerSet *)self->mInterestedParties addObject:a3];
  }
  ++self->mInterestCount;

  objc_sync_exit(self);
}

- (void)removeInterest:(id)a3
{
  objc_sync_enter(self);
  if (a3) {
    [(TSUMutablePointerSet *)self->mInterestedParties removeObject:a3];
  }
  --self->mInterestCount;

  objc_sync_exit(self);
}

- (void)annotationControllerTeardown
{
  self->mAnnotationController = 0;
}

- (THAnnotationStorageController)annotationController
{
  return self->mAnnotationController;
}

- (void)setAnnotationController:(id)a3
{
  self->mAnnotationController = (THAnnotationStorageController *)a3;
}

- (NSString)storageID
{
  return self->mStorageID;
}

@end