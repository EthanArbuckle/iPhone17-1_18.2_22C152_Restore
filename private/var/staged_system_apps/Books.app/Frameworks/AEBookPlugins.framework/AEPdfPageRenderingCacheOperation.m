@interface AEPdfPageRenderingCacheOperation
- (AEPdfPageRenderingCacheOperation)init;
- (NSURL)url;
- (id)callbackInvocationWithImage:(id)a3;
- (id)generateImage:(CGSize)a3;
- (int64_t)pageNumber;
- (void)setPageNumber:(int64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation AEPdfPageRenderingCacheOperation

- (AEPdfPageRenderingCacheOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)AEPdfPageRenderingCacheOperation;
  return [(AEPdfPageRenderingCacheOperation *)&v3 initWithOptions:0];
}

- (id)callbackInvocationWithImage:(id)a3
{
  id v4 = a3;
  v5 = [(AEPdfPageRenderingCacheOperation *)self renderingCacheCallbackInvocationWithImage:v4 pageNumber:[(AEPdfPageRenderingCacheOperation *)self pageNumber]];

  return v5;
}

- (id)generateImage:(CGSize)a3
{
  unint64_t v4 = +[BKPDFModernBookViewController pageIndexForPageNumber:[(AEPdfPageRenderingCacheOperation *)self pageNumber]];
  v5 = +[AEPdfCache sharedInstance];
  v6 = [(AEPdfPageRenderingCacheOperation *)self url];
  id v7 = [v5 copyCacheObjectForURL:v6];

  v8 = [v7 document];
  v9 = [(AEPdfPageRenderingCacheOperation *)self imageCache];
  [v9 primaryImageSize];
  v10 = +[AEPDFPlugin generateImageForDocument:pageIndex:size:](AEPDFPlugin, "generateImageForDocument:pageIndex:size:", v8, v4);

  if (v10 && [v8 isLocked]) {
    [(AEPdfPageRenderingCacheOperation *)self setSerializeFormat:0xFFFFFFFFLL];
  }

  return v10;
}

- (int64_t)pageNumber
{
  return self->_pageNumber;
}

- (void)setPageNumber:(int64_t)a3
{
  self->_pageNumber = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end