@interface THAnnotationSearchIndexBuildOperation
- (THAnnotationSearchIndexBuildOperation)initWithDelegate:(id)a3 documentRoot:(id)a4;
- (void)main;
@end

@implementation THAnnotationSearchIndexBuildOperation

- (THAnnotationSearchIndexBuildOperation)initWithDelegate:(id)a3 documentRoot:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THAnnotationSearchIndexBuildOperation;
  result = [(THAnnotationSearchIndexBuildOperation *)&v7 init];
  if (result)
  {
    result->mDelegate = (THAnnotationSearchIndexBuildOperationDelegate *)a3;
    result->mDocumentRoot = (THDocumentRoot *)a4;
  }
  return result;
}

- (void)main
{
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  id v4 = +[NSMutableDictionary dictionary];
  v5 = [(THDocumentRoot *)self->mDocumentRoot annotationSearchIndex];
  [(THSearchIndex *)v5 unload];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [(THAnnotationStorageController *)[(THDocumentRoot *)self->mDocumentRoot annotationController] allAnnotations];
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
        [(THAnnotationSearchIndex *)v5 addTermsForAnnotation:v10];
        if (objc_msgSend(objc_msgSend(v10, "annotationNote"), "length")) {
          objc_msgSend(v4, "setObject:forKey:", objc_msgSend(v10, "annotationNote"), objc_msgSend(v10, "annotationUuid"));
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(THAnnotationSearchIndexBuildOperationDelegate *)self->mDelegate setAnnotationSearchRefText:v4];
}

@end