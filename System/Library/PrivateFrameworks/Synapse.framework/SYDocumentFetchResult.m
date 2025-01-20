@interface SYDocumentFetchResult
- (NSString)documentId;
- (NSURL)fileURL;
- (SYDocumentFetchResult)initWithDocumentId:(id)a3 fileURL:(id)a4;
@end

@implementation SYDocumentFetchResult

- (SYDocumentFetchResult)initWithDocumentId:(id)a3 fileURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SYDocumentFetchResult;
  v8 = [(SYDocumentFetchResult *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    documentId = v8->_documentId;
    v8->_documentId = (NSString *)v9;

    objc_storeStrong((id *)&v8->_fileURL, a4);
  }

  return v8;
}

- (NSString)documentId
{
  return self->_documentId;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_documentId, 0);
}

@end